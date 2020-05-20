#include "types.h"
#include "stat.h"
#include "user.h"
#include "param.h"

# ifdef BENNY_MOOTEX
#  ifndef GGC_SYNC_OPS
// If you don't use the gcc __sync* calls, you can use the stuff from x86.h.
#   include "x86.h"
#  endif // GGC_SYNC_OPS
# endif // BENNY_MOOTEX

#ifdef KTHREADS

#include "benny_thread.h"

#ifndef PGSIZE
// copied from mmu.h
# define PGSIZE 4096
#endif // PGSIZE

#ifndef NULL
# define NULL 0x0
#endif // NULL

struct benny_thread_s {
    int bid;
    void *bt_stack;
    void *mem_stack;
};

extern int kthread_create(void (*func)(void *), void *, void *);
extern int kthread_join(int);
extern int kthread_exit(int);

# ifdef BENNY_MOOTEX
int kthread_self(void);
int kthread_yield(void);
int kthread_cpu_count(void);
int kthread_thread_count(void);
# endif // BENNY_MOOTEX

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
    struct benny_thread_s *bt = bt_new();
    int result = -1;

    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
    //assert(bt->bid == kthread_current());
    //printf(1, "\n%s %d: new thread %d\n", __FILE__, __LINE__, bt->bid);

    if (bt->bid != 0) {
        *abt = (benny_thread_t) bt;
        result = 0;
    }
    return result;
}

int
benny_thread_bid(benny_thread_t abt)
{
    struct benny_thread_s *bt = (struct benny_thread_s *) abt;

    return bt->bid;
}

int
benny_thread_join(benny_thread_t abt)
{
    struct benny_thread_s *bt = (struct benny_thread_s *) abt;
    int retVal = -1;
    
    retVal = kthread_join(bt->bid);
    if (retVal == 0) {
        free(bt->mem_stack);
        bt->bt_stack = bt->mem_stack = NULL;
        free(bt);
    }
    
    return retVal;
}

int
benny_thread_exit(int exitValue)
{
    // This function never returns. As part of the exit, the thread
    // disables itself from running again and calls the
    // scheduler().
    return kthread_exit(exitValue);
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));

    if (bt == NULL) {
        return NULL;
    }

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
    if (bt->bt_stack == NULL) {
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;

    return bt;
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{

    benny_mootex->locked = 0;
    benny_mootex->bid = -1; 
    return 0;
}

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
        benny_yield();
    }
    
    benny_mootex->bid = benny_self();
    return 0;
}

int 
benny_mootex_spinlock(benny_mootex_t *benny_mootex)
{
    while(xchg(&benny_mootex->locked, 1) != 0){
        ;
    }
    
    benny_mootex->bid = benny_self();

    return 0;
}

int 
benny_mootex_unlock(benny_mootex_t *benny_mootex)
{
// #error unock the given mootex. the the requesting thread is
// #error not the thread that locked the mootex, reject it.
    int tid = benny_self();

    if(tid == benny_mootex->bid){
      __sync_synchronize();
      benny_mootex->bid = -1;
      __sync_lock_release(&benny_mootex->locked);
    } else {
      return -1;
    }

     
    return 0;
}

int 
benny_mootex_trylock(benny_mootex_t *benny_mootex)
{
// #error if the mootex is locked, return an error (-1) and do not lock 
// #error the mootex (and do not loop waiting for it). if the mootex
// #error is not locked, acquire the lock.
    if(xchg(&benny_mootex->locked, 1) != 0){
        return -1;
    }else{
        int tid = kthread_self();
        benny_mootex->bid = tid;
    }

    return -1;
}

int
benny_mootex_wholock(benny_mootex_t *benny_mootex)
{

    return benny_mootex->bid;
}

int 
benny_mootex_islocked(benny_mootex_t *benny_mootex)
{


    return benny_mootex->locked;
}

int
benny_self(void)
{
// # error You just call kthread_self(). kthread_self() if
// # error p->is_thread == TRUE return the tid. Otherwise,
// # error return 0 .

    return kthread_self();
}

int 
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
    
}

int
benny_cpu_count(void)
{
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}

int
benny_thread_count(void)
{
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
# endif // BENNY_MOOTEX

#endif // KTHREADS
