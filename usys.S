#include "syscall.h"
#include "traps.h"

#define SYSCALL(name) \
  .globl name; \
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
SYSCALL(exit)
SYSCALL(wait)
SYSCALL(pipe)
SYSCALL(read)
SYSCALL(write)
SYSCALL(close)
SYSCALL(kill)
SYSCALL(exec)
SYSCALL(open)
SYSCALL(mknod)
SYSCALL(unlink)
SYSCALL(fstat)
SYSCALL(link)
SYSCALL(mkdir)
SYSCALL(chdir)
SYSCALL(dup)
SYSCALL(getpid)
SYSCALL(sbrk)
SYSCALL(sleep)
SYSCALL(uptime)
#ifdef GETPPID
SYSCALL(getppid)
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
#endif // CPS
#ifdef HALT
SYSCALL(halt)
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
SYSCALL(kthread_join)
SYSCALL(kthread_exit)
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
SYSCALL(kthread_yield)
SYSCALL(kthread_cpu_count)
SYSCALL(kthread_thread_count)
#endif //BENNY_MOOTEX
