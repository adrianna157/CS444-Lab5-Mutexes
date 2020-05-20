#include "types.h"
#include "stat.h"
#include "user.h"

#ifdef BENNY_MOOTEX
#include "benny_thread.h"
#include "thtst.h"

static void func1(void *arg);

static uint global = 0;
static benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;

# define ITERATIONS 100000

static void 
func1(void *arg)
{
    int i = 0;

    printf(1, "thread starting\n");

    for (i = 0; i < ITERATIONS; i++) {
        benny_mootex_spinlock(&mootex);
        global++;
        benny_mootex_unlock(&mootex);
    }

    printf(1, "thread done\n");
    benny_thread_exit(0);
}

#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
#ifdef BENNY_MOOTEX
    int i = 0;
    benny_thread_t bt;
    int ncpus = benny_cpu_count();

    if (ncpus < 2) {
        printf(1, "this is more interesting with more than 1 cpu\n");
    }
    global = 0;
    benny_thread_create(&bt, func1, (void *) NULL);
    sleep(1);
    for (i = 0; i < ITERATIONS; i++) {
        benny_mootex_spinlock(&mootex);
        global++;
        benny_mootex_unlock(&mootex);
    }
    benny_thread_join(bt);
    printf(1, "\tglobal value with spin locks: %d\n", global);
    assert(global == (ITERATIONS * 2));

    global = 0;
    benny_thread_create(&bt, func1, (void *) NULL);
    sleep(1);
    for (i = 0; i < ITERATIONS; i++) {
        benny_mootex_yieldlock(&mootex);
        global++;
        benny_mootex_unlock(&mootex);
    }
    benny_thread_join(bt);
    assert(global == (ITERATIONS * 2));

    printf(1, "\tglobal value with mixed locks   : %d\n", global);

#endif // BENNY_MOOTEX
    exit();
}
