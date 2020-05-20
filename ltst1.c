#include "types.h"
#include "stat.h"
#include "user.h"
#include "benny_thread.h"

#ifdef BENNY_MOOTEX
benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;

static void 
func1(void *arg)
{
    int rez = 0;
    int bid = -1;

    printf(1, "thread starting\n");
    printf(1, "\tyield lock tests\n");
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == -1);

    rez = benny_mootex_yieldlock(&mootex);
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == TRUE);
    bid = benny_mootex_wholock(&mootex);
    printf(1,"\t\t the bid is: %d\n",bid);
    assert(bid == 1);

    rez = benny_mootex_unlock(&mootex);
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == -1);

    printf(1, "\tspin lock tests\n");
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == -1);

    rez = benny_mootex_spinlock(&mootex);
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == TRUE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == 1);

    rez = benny_mootex_unlock(&mootex);
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == -1);

    printf(1, "thread done\n");
    benny_thread_exit(0);
}
#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
#ifdef BENNY_MOOTEX
    int rez = -1;
    benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;
    benny_thread_t bt = NULL;
    int bid = -1;

    if (argc > 1) {
        kdebug(atoi(argv[1]));
    }

    printf(1, "pid: %d\n", getpid());
    //benny_mootex_init(&mootex);
    //printf(1, "intitialized lock\n");

    rez = benny_mootex_islocked(&mootex);
    printf(1, "main\n");
    printf(1, "\tyield lock tests\n");
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid = -1);

    rez = benny_mootex_yieldlock(&mootex);
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == TRUE);
    bid = benny_mootex_wholock(&mootex);
    printf(1, "\t\tbid: %d\n", bid);
    assert(bid == 0);

    rez = benny_mootex_unlock(&mootex);
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == -1);

    printf(1, "\tspin lock tests\n");
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == -1);

    rez = benny_mootex_spinlock(&mootex);
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == TRUE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == 0);

    rez = benny_mootex_unlock(&mootex);
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
    assert(rez == FALSE);
    bid = benny_mootex_wholock(&mootex);
    assert(bid == -1);

    benny_thread_create(&bt, func1, (void *) NULL);
    benny_thread_join(bt);

    if (argc > 1) {
        kdebug(0);
    }
#endif // BENNY_MOOTEX
    exit();
}
