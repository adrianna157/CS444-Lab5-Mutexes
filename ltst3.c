#include "types.h"
#include "stat.h"
#include "user.h"

#ifdef BENNY_MOOTEX
#include "benny_thread.h"
#include "thtst.h"

static void func1(void *arg);

# define ITERATIONS 100000
# define MAX_THREADS 20

static uint global = 0;
static int (*lock_func)(benny_mootex_t *) = benny_mootex_yieldlock;
static int iterations = ITERATIONS;

static void 
func1(void *arg)
{
    static benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;
    static benny_mootex_t printex = BENNY_MOOTEX_INITIALIZER;

    int bid = benny_self();
    int i = 0;

    benny_mootex_yieldlock(&printex);
    printf(1, "\tthread starting\t%d\t%d\n", getpid(), bid);
    benny_mootex_unlock(&printex);

    for (i = 0; i < iterations; i++) {
        lock_func(&mootex);
        global++;
        benny_mootex_unlock(&mootex);
    }

    benny_mootex_yieldlock(&printex);
    printf(1, "\tthread done\t%d\t%d\n", getpid(), bid);
    benny_mootex_unlock(&printex);
    benny_thread_exit(0);
}

#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
#ifdef BENNY_MOOTEX
    int i = 0;
    int begin_date = 0;
    int end_date = 0;
    int ncpus = benny_cpu_count();
    int num_threads = ncpus * 2;
    benny_thread_t bt[MAX_THREADS] = {0};

    if (argc > 1) {
        num_threads = (num_threads > MAX_THREADS) ? MAX_THREADS : num_threads;
    }
    else {
        num_threads = MAX(ncpus - 1, 1);
    }
    
    printf(1, "using %d threads on %d CPUs with %d iterations\n"
           , num_threads, ncpus, iterations);
    global = 0;
    printf(1, "\nyield locking enabled\n");
    lock_func = benny_mootex_yieldlock;
    begin_date = uptime();
    for (i = 0; i < num_threads; i++) {
        benny_thread_create(&(bt[i]), func1, (void *) i);
    }

    for (i = 0; i < num_threads; i++) {
        benny_thread_join(bt[i]);
    }
    end_date = uptime();
    printf(1, "\t** global value:\t%d\n", global);
    printf(1, "\t** elapse ticks:\t%d\n", end_date - begin_date);
    assert(global == (ITERATIONS * num_threads));


    global = 0;
    printf(1, "\nspin locking enabled\n");
    lock_func = benny_mootex_spinlock;
    begin_date = uptime();
    for (i = 0; i < num_threads; i++) {
        benny_thread_create(&(bt[i]), func1, (void *) i);
    }

    for (i = 0; i < num_threads; i++) {
        benny_thread_join(bt[i]);
    }
    end_date = uptime();
    printf(1, "\t** global value:\t%d\n", global);
    printf(1, "\t** elapse ticks:\t%d\n", end_date - begin_date);
    assert(global == (ITERATIONS * num_threads));

    printf(1, "spin locking enabled\n");
    lock_func = benny_mootex_spinlock;

#endif // BENNY_MOOTEX
    exit();
}
