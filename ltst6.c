#include "types.h"
#include "stat.h"
#include "user.h"

#ifdef BENNY_MOOTEX
#include "benny_thread.h"
#include "thtst.h"

static void func1(void *arg);

static uint global = 0;
static benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;

# define ITERATIONS 10000000

static void 
func1(void *arg)
{
    int rez = 0;
    int bid = -1;

    printf(1, ">> thread starting\n");

    rez = benny_mootex_islocked(&mootex);
    printf(1, ">> thread %d  lock state: %s\n", __LINE__, rez > 0 ? "locked" : "unlocked");
    bid = benny_mootex_wholock(&mootex);
    assert(bid == 0);
    rez = benny_mootex_trylock(&mootex);
    if (rez < 0) {
        printf(1, ">> %s %d: try lock failed %d\n", __FUNCTION__, __LINE__, rez);
        assert(rez == -1);
        rez = benny_mootex_unlock(&mootex);
        assert(rez == -1);
        bid = benny_mootex_wholock(&mootex);
        assert(bid == 0);
        if (rez < 0) {
            printf(1, ">> %s %d: unlock failed %d\n", __FUNCTION__, __LINE__, rez);
        }
        else {
            printf(1, ">> %s %d: unlock succeeded %d\n", __FUNCTION__, __LINE__, rez);
        }
    }
    else {
        bid = benny_mootex_wholock(&mootex);
        assert(bid == 0);
        printf(1, ">> %s %d: try lock succeeded %d\n", __FUNCTION__, __LINE__, rez);
    }

    printf(1, ">> thread done\n");
    benny_thread_exit(0);
}

#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
#ifdef BENNY_MOOTEX
    benny_thread_t bt;
    int ncpus = benny_cpu_count();
    int rez = -1;
    int bid = -1;

    if (ncpus < 2) {
        printf(1, "this is more interesting with more than 1 cpu\n");
    }
    global = 0;
    rez = benny_mootex_islocked(&mootex);
    assert(rez == FALSE);
    printf(1, "<< %d  lock state: %s\n", __LINE__, rez > 0 ? "locked" : "unlocked");

    rez = benny_mootex_spinlock(&mootex);
    assert(rez == 0);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == 0);

    rez = benny_mootex_islocked(&mootex);
    assert(rez == TRUE);
    printf(1, "<< %d  lock state: %s\n", __LINE__, rez > 0 ? "locked" : "unlocked");
    printf(1, "<< main acquires lock\n");
    benny_thread_create(&bt, func1, (void *) NULL);
    {
        int i = -1;

        for (i = 0; i < ITERATIONS; i++) {
            global++;
        }
    }
    benny_thread_join(bt);

    printf(1, "<< \tpithy comment\n");

    printf(1, "<< \tglobal value after all is done: %d\n", global);

#endif // BENNY_MOOTEX
    exit();
}
