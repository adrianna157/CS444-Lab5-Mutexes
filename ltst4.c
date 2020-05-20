#include "types.h"
#include "stat.h"
#include "user.h"

#ifdef BENNY_MOOTEX
#include "benny_thread.h"
#include "thtst.h"

static void func1(void *arg);

static uint global = 0;
static benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;
static int (*lock_func)(benny_mootex_t *) = benny_mootex_yieldlock;

# define ITERATIONS 10000
# define NUM_THREADS 10

static void 
func1(void *arg)
{
    long bid = ((long) arg);
    int i = 0;
    int j = 0;

    lock_func(&mootex);
    printf(1, "thread starting %d %d\n", getpid(), bid);
    benny_mootex_unlock(&mootex);

    for (i = 0; i < (ITERATIONS); i++) {
        lock_func(&mootex);
        for (j = 0; j < ITERATIONS; j++) {
            global++;
        }
        benny_mootex_unlock(&mootex);
    }

    lock_func(&mootex);
    printf(1, "thread done %d %d\n", getpid(), bid);
    benny_mootex_unlock(&mootex);
    benny_thread_exit(0);
}

#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
#ifdef BENNY_MOOTEX
    int i = 0;
    int num_threads = NUM_THREADS;
    int begin_date = 0;
    int end_date = 0;
    benny_thread_t bt[NUM_THREADS] = {0};

    //benny_mootex_init(&mootex);
    lock_func = benny_mootex_spinlock;
    printf(1, "spin locking enabled\n");
    begin_date = uptime();
    for (i = 0; i < num_threads; i++) {
        benny_thread_create(&(bt[i]), func1, (void *) i);
    }

    for (i = 0; i < num_threads; i++) {
        benny_thread_join(bt[i]);
    }
    end_date = uptime();
    printf(1, "\tglobal value:\t%d\n", global);
    printf(1, "\telapse ticks:\t%d\n", end_date - begin_date);
    assert(global == (ITERATIONS * ITERATIONS * num_threads));

    global = 0;
    lock_func = benny_mootex_yieldlock;
    printf(1, "yield locking enabled\n");
    begin_date = uptime();
    for (i = 0; i < num_threads; i++) {
        benny_thread_create(&(bt[i]), func1, (void *) i);
    }

    for (i = 0; i < num_threads; i++) {
        benny_thread_join(bt[i]);
    }
    end_date = uptime();
    printf(1, "\tglobal value:\t%d\n", global);
    printf(1, "\telapse ticks:\t%d\n", end_date - begin_date);
    assert(global == (ITERATIONS * ITERATIONS * num_threads));

#endif // BENNY_MOOTEX
    exit();
}
