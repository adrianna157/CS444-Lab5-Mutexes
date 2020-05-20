#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

struct
{
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

#ifdef KDEBUG
ushort proc_kdebug_level = 0;
#endif // KDEBUG

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

static char *states[] = {
    [UNUSED] "unused",
    [EMBRYO] "embryo",
    [SLEEPING] "sleep ",
    [RUNNABLE] "runble",
    [RUNNING] "run   ",
    [ZOMBIE] "zombie"};

void pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int cpuid()
{
  return mycpu() - cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu *
mycpu(void)
{
  int apicid, i;

  if (readeflags() & FL_IF)
    panic("mycpu called with interrupts enabled\n");

  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i)
  {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc *
myproc(void)
{
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc *
allocproc(void)
{
  struct proc *p;
  char *sp;
  // int oncpu;
  // ushort is_thread;
  // ushort is_parent;
  // ushort tid;
  // ushort next_tid;
  // int thread_exit_value;
  // ushort thread_count;

  acquire(&ptable.lock);

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;

  release(&ptable.lock);

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0)
  {
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe *)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

#ifdef PROC_TIMES
  cmostime(&(p->begin_date));
  p->ticks_total = 0;
  p->sched_times = 0;
#endif // PROC_TIMES

#ifdef KTHREADS
  // #error The new data memebers for the kthreads are initialized
  // #error in here. Be sure to give the oncpu member a value of -1
  // #error and next_tid a value of 1.
  p->oncpu = -1;
  p->is_thread = 0;
  p->is_parent = 0;
  p->tid = 0;
  p->next_tid = 1;
  p->thread_exit_value = 0;
  p->thread_count = 0;
#endif // KTHREADS

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();

  initproc = p;
  if ((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0; // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if (n > 0)
  {
    if ((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  else if (n < 0)
  {
    if ((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if ((np = allocproc()) == 0)
  {
    return -1;
  }

  // Copy process state from proc.
  if ((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0)
  {
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for (i = 0; i < NOFILE; i++)
    if (curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

#ifdef KDEBUG
  if (proc_kdebug_level > 0)
  {
    cprintf("kdebug: %s %d: process %s forked\n", __FILE__, __LINE__, curproc->name);
  }
#endif // KDEBUG

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

#ifdef KTHREADS
// #error The implementations for the kthread_* functions go in here.

// #error Since the func parameter is a bit frightful, I am giving you
// #error that one. You can start by copying the implementation for
// #error fork() in here and make __extensive__ changes to it.
int kthread_create(void (*func)(void *), void *arg_ptr, void *tstack)
{
  int i;
  int tid = -1;
  struct proc *np;
  struct proc *curproc = myproc();

  if (proc_kdebug_level)
  {
    cprintf("%s %s %d: fork() called from process:  %s   pid: %d\n", __FILE__, __FUNCTION__, __LINE__, curproc->name, curproc->pid);
  }

  //check to see if tstack pointer is page aligned
  if (((uint)tstack) % PGSIZE != 0)
  {
    cprintf("*** thread stack not page aligned ***\n");
    return -1; // return -1 if tstack is not page aligned
  }

  if ((np = allocproc()) == 0)
    return -1;

  np->pgdir = curproc->pgdir; // all threads in a process share a single page table
  np->sz = curproc->sz;       // same process as curproc, so size should be the same
  np->is_thread = 1;

  if (curproc->is_thread)
  { // if curproc is a thread, set np's parent to its parent process
    np->parent = curproc->parent;
    np->parent->thread_count++;
  }
  else if (!curproc->is_thread)
  { // if curproc is a process, make it np's parent
    np->parent = curproc;
    curproc->is_parent = 1;
    curproc->thread_count++;
  }
  //new thread has a copy of the curproc trap fram
  *np->tf = *curproc->tf;
  //eip register== instruction pointer for new thread
  np->tf->eip = (uint)func;               // assign func to IP for new thread
  np->tf->esp = ((int)tstack) + PGSIZE;   // assign stack pointer to tstack
  np->tf->esp -= sizeof(int);             // make space for an int to be pushed onto the stack
  *((int *)(np->tf->esp)) = (int)arg_ptr; // push arg_ptr onto the stack

  tid = np->parent->next_tid;    // assign tid
  np->tid = tid;                 // assign np's unique thread ID
  np->parent->next_tid++;        // increment parent's next_tid
  np->tf->esp -= sizeof(int);    // make space for an int to be pushed onto the stack
  *((int *)(np->tf->esp)) = tid; // push tid onto the stack

  for (i = 0; i < NOFILE; i++)
    if (curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
  acquire(&ptable.lock);
  np->state = RUNNABLE;
  release(&ptable.lock);

  return tid;
}

//#error This will be a lot like the wait() function, but very different...
int kthread_join(int tid)
{

  int return_value = -1;
  struct proc *p;
  struct proc *curproc = myproc();

  if ((curproc->is_parent && curproc->thread_count == 0) || tid == 0)
  {
    return -1;
  }

  if (curproc->is_thread)
  {
    curproc = curproc->parent;
  }

  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    // Look for the current entry in ptable
    if (p->parent != curproc || p->tid != tid)
      continue;
    while (p->state != ZOMBIE)
    {
      release(&ptable.lock);
      yield();
      acquire(&ptable.lock);
    }

    curproc->thread_count--;
    if (p->state == ZOMBIE)
    {
      // Found one.
      kfree(p->kstack);
      p->kstack = 0;
      p->pid = -1;
      p->parent = NULL;
      p->name[0] = NULL;
      p->state = UNUSED;
      p->sz = 0;
      p->killed = FALSE;
    }
    return_value = p->thread_exit_value;
    break;
  }

  release(&ptable.lock);
  return return_value;
}

// #error This is a lot like the exit() function, but very different...
int kthread_exit(int exitValue)
{
  int fd;
  struct proc *curproc = myproc();
  if (curproc->is_thread != TRUE)

    // Close all open files.
    for (fd = 0; fd < NOFILE; fd++)
    {
      if (curproc->ofile[fd])
      {
        fileclose(curproc->ofile[fd]);
        curproc->ofile[fd] = 0;
      }
    }
  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;
  curproc->killed = FALSE;
  curproc->thread_exit_value = exitValue;
  curproc->oncpu = -1;
  curproc->state = ZOMBIE;

  acquire(&ptable.lock);
  sched();
  panic("kthread_exit");
}

#endif // KTHREADS

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

#ifdef KTHREADS
  if (curproc->is_thread == TRUE)
  {
    panic("called exit on thread");
  }
  if (curproc->thread_count > 0)
  {
    panic("called exit on thread0 with children");
  }
#endif // KTHREADS

  if (curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for (fd = 0; fd < NOFILE; fd++)
  {
    if (curproc->ofile[fd])
    {
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->parent == curproc)
    {
      p->parent = initproc;
      if (p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();

#ifdef KTHREADS

  if (curproc->is_thread == TRUE)
  {
    panic("called wait on thread");
  }
  if (curproc->thread_count > 0)
  {
    panic("called wait on thread0 with children");
  }
#endif // KTHREADS

  acquire(&ptable.lock);
  for (;;)
  {
    // Scan through table looking for exited children.
    havekids = 0;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    {
      if (p->parent != curproc)
        continue;
      havekids = 1;
      if (p->state == ZOMBIE)
      {
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if (!havekids || curproc->killed)
    {
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock); //DOC: wait-sleep
  }
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void scheduler(void)
{
  struct proc *p;
  struct cpu *c = mycpu();
#ifdef KTHREADS
  int current_cpu = cpuid();
#endif // KTHREADS
  c->proc = 0;

  for (;;)
  {
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    {
      if (p->state != RUNNABLE)
        continue;

#ifdef KDEBUG
      if (proc_kdebug_level > 3)
        cprintf("\t%s %d: process selected %d\n", __FILE__, __LINE__, p->pid);
#endif // KDEBUG

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;

#ifdef PROC_TIMES
      p->sched_times++;
#ifdef DTICKS
      p->ticks_begin = ticks;
#else  // DTICKS
      p->ticks_begin = suptime();
#endif // DTICKS
#endif // PROC_TIMES

#ifdef KTHREADS
      p->oncpu = current_cpu;
#endif // KTHREADS

      swtch(&(c->scheduler), p->context);
      switchkvm();

#ifdef PROC_TIMES
#ifdef DTICKS
      // #error Alright, this is another mystery for me. For __SOME__ reason
      // #error if the suptime() fucntion is called when there are multiple
      // #error CPUs, the lock in the function will hang and cause a kernel
      // #error panic. Sooooo, we use the global variable (which may be dirty).
      // #error In the end, you will REALLY want to define this macro.
      // #error If you can show me why, extra credit is available.
      p->ticks_total += ticks - p->ticks_begin;
#else  // DTICKS
      {
        uint xticks = suptime();

        p->ticks_total += xticks - p->ticks_begin;
      }
#endif // DTICKS
#endif // PROC_TIMES
#ifdef KTHREADS
      p->oncpu = -1;
#endif // KTHREADS

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void sched(void)
{
  int intena;
  struct proc *p = myproc();

  if (!holding(&ptable.lock))
    panic("sched ptable.lock");
  if (mycpu()->ncli != 1)
    panic("sched locks");
  if (p->state == RUNNING)
    panic("sched running");
  if (readeflags() & FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void yield(void)
{
  acquire(&ptable.lock); //DOC: yieldlock
  myproc()->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first)
  {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();

  if (p == 0)
    panic("sleep");

  if (lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if (lk != &ptable.lock)
  {                        //DOC: sleeplock0
    acquire(&ptable.lock); //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if (lk != &ptable.lock)
  { //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if (p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
  struct proc *p;

#ifdef KTHREADS
  {
    struct proc *curproc = myproc();

    if (curproc->is_thread == TRUE)
    {
      panic("called kill on thread");
    }
    if (curproc->thread_count > 0)
    {
      panic("called kill on thread0 with children");
    }
  }
#endif // KTHREADS

  acquire(&ptable.lock);
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->pid == pid)
    {
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

#ifdef CPS
int sys_cps(void)
{
  int i;
  const char *state = 0x0;
  // #ifdef KTHREADS
  // #error In a future assigment, we will add some more code in
  // #error here so we do not see the threads in the process list
  // #error in the default condition.
  // #endif // KTHREADS
  acquire(&ptable.lock);

  cprintf(
      "pid\tppid\tname\tstate\tsize");
#ifdef PROC_TIMES
  cprintf("\tstart time\t\tticks\tsched");
#endif // PROC_TIMES
#ifdef KTHREADS
  cprintf(
      "\tcpu\tthd cnt\tis thrd\tthrd #");
#endif // KTHREADS

  cprintf("\n");
  for (i = 0; i < NPROC; i++)
  {
    if (ptable.proc[i].state != UNUSED)
    {
      if (ptable.proc[i].state >= 0 && ptable.proc[i].state < NELEM(states) && states[ptable.proc[i].state])
      {
        state = states[ptable.proc[i].state];
      }
      else
      {
        state = "uknown";
      }

      cprintf("%d\t%d\t%s\t%s\t%u", ptable.proc[i].pid, ptable.proc[i].parent ? ptable.proc[i].parent->pid : 1, ptable.proc[i].name, state, ptable.proc[i].sz);

#ifdef PROC_TIMES
#define ZFILL(_field) \
  ptable.proc[i].begin_date._field < 10 ? "0" : "", ptable.proc[i].begin_date._field

      cprintf("\t%d-%s%d-%s%d %s%d:%s%d:%s%d", ptable.proc[i].begin_date.year, ZFILL(month), ZFILL(day), ZFILL(hour), ZFILL(minute), ZFILL(second));
      cprintf("\t%d\t%d", ptable.proc[i].ticks_total,
              ptable.proc[i].sched_times);

#undef ZFILL
#endif // PROC_TIMES
#ifdef KTHREADS
      cprintf(
          "\t\t%c\t%c\t%c\t%c", 
          ptable.proc[i].oncpu > -1 ? ('0' + ptable.proc[i].oncpu) : ' '
          , ptable.proc[i].is_parent ? 'y' : ' '
          , ptable.proc[i].is_thread ? 'y' : ' '
          , ptable.proc[i].thread_count ? ('0' + ptable.proc[i].tid) : ' ');
#endif // KTHREADS
      cprintf("\n");
    }
    else
    {
      // UNUSED process table entry is ignored
    }
  }

  release(&ptable.lock);
  return 0;
}
#endif // CPS

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if (p->state == SLEEPING)
    {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}

#ifdef KDEBUG
int proc_kdebug(int value)
{
  int ret = 0;

  cprintf("%d %s\n", __LINE__, __FILE__);
  if (value < 0)
  {
    ret = 1;
  }
  else
  {
    proc_kdebug_level = value;
    cprintf("kernel diag messages: %s  %d\n", proc_kdebug_level ? "enabled" : "disabled", proc_kdebug_level);
  }

  return ret;
}
#endif // KDEBUG

// #ifdef BENNY_MOOTEX
// int kthread_self(void)
// {
// }
// int kthread_cpu_count(void) {}
// int kthread_cpu_count(void) {}
// int kthread_thread_count(void) {}

// #endif //BENNY_MOOTEX
