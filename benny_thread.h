#ifndef __BENNY_THREAD_H
# define __BENNY_THREAD_H

typedef int benny_thread_t;

# ifdef BENNY_MOOTEX
typedef struct benny_mootex_s {
    volatile uint locked;
    int bid;
} benny_mootex_t;
#  define BENNY_MOOTEX_INITIALIZER {0, -1}
# endif // BENNY_MOOTEX

int benny_thread_create(benny_thread_t *, void (*func)(void*), void *);
int benny_thread_join(benny_thread_t);
int benny_thread_exit(int);
int benny_thread_bid(benny_thread_t);

# ifdef BENNY_MOOTEX

// These are are all system calls to like named kthread_* calls
// that return informatin from the kernel.
int benny_self(void);
int benny_yield(void);
int benny_cpu_count(void);
int benny_thread_count(void);

// Initializes a benny_mootex_t. See BENNY_MOOTEX_INITIALIZER.
int benny_mootex_init(benny_mootex_t *);

// See the lab document for information.
int benny_mootex_yieldlock(benny_mootex_t *);
int benny_mootex_spinlock(benny_mootex_t *);
int benny_mootex_trylock(benny_mootex_t *);

int benny_mootex_unlock(benny_mootex_t *);
int benny_mootex_islocked(benny_mootex_t *);
int benny_mootex_wholock(benny_mootex_t *);

# endif // BENNY_MOOTEX

#endif // __BENNY_THREAD_H
