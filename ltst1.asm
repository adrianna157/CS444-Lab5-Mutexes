
_ltst1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}
#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	56                   	push   %esi
       4:	53                   	push   %ebx
       5:	83 e4 f0             	and    $0xfffffff0,%esp
       8:	83 ec 20             	sub    $0x20,%esp
    int rez = -1;
    benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;
    benny_thread_t bt = NULL;
    int bid = -1;

    if (argc > 1) {
       b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    benny_mootex_t mootex = BENNY_MOOTEX_INITIALIZER;
       f:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
      16:	00 
      17:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
      1e:	ff 
    benny_thread_t bt = NULL;
      1f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
      26:	00 
    if (argc > 1) {
      27:	7e 16                	jle    3f <main+0x3f>
        kdebug(atoi(argv[1]));
      29:	8b 45 0c             	mov    0xc(%ebp),%eax
      2c:	8b 40 04             	mov    0x4(%eax),%eax
      2f:	89 04 24             	mov    %eax,(%esp)
      32:	e8 c9 0b 00 00       	call   c00 <atoi>
      37:	89 04 24             	mov    %eax,(%esp)
      3a:	e8 db 0c 00 00       	call   d1a <kdebug>
    }

    printf(1, "pid: %d\n", getpid());
      3f:	e8 9e 0c 00 00       	call   ce2 <getpid>
    //benny_mootex_init(&mootex);
    //printf(1, "intitialized lock\n");

    rez = benny_mootex_islocked(&mootex);
      44:	8d 5c 24 18          	lea    0x18(%esp),%ebx
    printf(1, "pid: %d\n", getpid());
      48:	c7 44 24 04 c2 14 00 	movl   $0x14c2,0x4(%esp)
      4f:	00 
      50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      57:	89 44 24 08          	mov    %eax,0x8(%esp)
      5b:	e8 b0 0d 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
      60:	89 1c 24             	mov    %ebx,(%esp)
      63:	e8 68 13 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "main\n");
      68:	c7 44 24 04 cb 14 00 	movl   $0x14cb,0x4(%esp)
      6f:	00 
      70:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    rez = benny_mootex_islocked(&mootex);
      77:	89 c6                	mov    %eax,%esi
    printf(1, "main\n");
      79:	e8 92 0d 00 00       	call   e10 <printf>
    printf(1, "\tyield lock tests\n");
      7e:	c7 44 24 04 2d 14 00 	movl   $0x142d,0x4(%esp)
      85:	00 
      86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      8d:	e8 7e 0d 00 00       	call   e10 <printf>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
      92:	83 fe 01             	cmp    $0x1,%esi
      95:	0f 84 8f 00 00 00    	je     12a <main+0x12a>
      9b:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
      a2:	00 
      a3:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
      aa:	00 
      ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      b2:	e8 59 0d 00 00       	call   e10 <printf>
    assert(rez == FALSE);
      b7:	85 f6                	test   %esi,%esi
      b9:	0f 85 87 00 00 00    	jne    146 <main+0x146>
    bid = benny_mootex_wholock(&mootex);
      bf:	89 1c 24             	mov    %ebx,(%esp)
      c2:	e8 f9 12 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid = -1);

    rez = benny_mootex_yieldlock(&mootex);
      c7:	89 1c 24             	mov    %ebx,(%esp)
      ca:	e8 11 12 00 00       	call   12e0 <benny_mootex_yieldlock>
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
      cf:	85 c0                	test   %eax,%eax
      d1:	0f 85 98 00 00 00    	jne    16f <main+0x16f>
      d7:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
      de:	00 
      df:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
      e6:	00 
      e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      ee:	e8 1d 0d 00 00       	call   e10 <printf>
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
      f3:	89 1c 24             	mov    %ebx,(%esp)
      f6:	e8 d5 12 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
      fb:	83 e8 01             	sub    $0x1,%eax
      fe:	0f 84 91 00 00 00    	je     195 <main+0x195>
     104:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     10b:	00 
     10c:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     113:	00 
     114:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     11b:	e8 f0 0c 00 00       	call   e10 <printf>
    assert(rez == TRUE);
     120:	c7 44 24 0c 66 00 00 	movl   $0x66,0xc(%esp)
     127:	00 
     128:	eb 24                	jmp    14e <main+0x14e>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     12a:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     131:	00 
     132:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     139:	00 
     13a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     141:	e8 ca 0c 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     146:	c7 44 24 0c 5d 00 00 	movl   $0x5d,0xc(%esp)
     14d:	00 
    bid = benny_mootex_wholock(&mootex);
    printf(1, "\t\tbid: %d\n", bid);
    assert(bid == 0);
     14e:	c7 44 24 08 54 14 00 	movl   $0x1454,0x8(%esp)
     155:	00 
     156:	c7 44 24 04 dc 14 00 	movl   $0x14dc,0x4(%esp)
     15d:	00 
     15e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     165:	e8 a6 0c 00 00       	call   e10 <printf>
     16a:	e8 f3 0a 00 00       	call   c62 <exit>
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
     16f:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     176:	00 
     177:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
     17e:	00 
     17f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     186:	e8 85 0c 00 00       	call   e10 <printf>
    assert(rez == 0);
     18b:	c7 44 24 0c 63 00 00 	movl   $0x63,0xc(%esp)
     192:	00 
     193:	eb b9                	jmp    14e <main+0x14e>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     195:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     19c:	00 
     19d:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     1a4:	00 
     1a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1ac:	e8 5f 0c 00 00       	call   e10 <printf>
    bid = benny_mootex_wholock(&mootex);
     1b1:	89 1c 24             	mov    %ebx,(%esp)
     1b4:	e8 07 12 00 00       	call   13c0 <benny_mootex_wholock>
    printf(1, "\t\tbid: %d\n", bid);
     1b9:	c7 44 24 04 d1 14 00 	movl   $0x14d1,0x4(%esp)
     1c0:	00 
     1c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    bid = benny_mootex_wholock(&mootex);
     1c8:	89 c6                	mov    %eax,%esi
    printf(1, "\t\tbid: %d\n", bid);
     1ca:	89 44 24 08          	mov    %eax,0x8(%esp)
     1ce:	e8 3d 0c 00 00       	call   e10 <printf>
    assert(bid == 0);
     1d3:	85 f6                	test   %esi,%esi
     1d5:	75 71                	jne    248 <main+0x248>

    rez = benny_mootex_unlock(&mootex);
     1d7:	89 1c 24             	mov    %ebx,(%esp)
     1da:	e8 71 11 00 00       	call   1350 <benny_mootex_unlock>
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     1df:	85 c0                	test   %eax,%eax
     1e1:	75 72                	jne    255 <main+0x255>
     1e3:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     1ea:	00 
     1eb:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     1f2:	00 
     1f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1fa:	e8 11 0c 00 00       	call   e10 <printf>
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
     1ff:	89 1c 24             	mov    %ebx,(%esp)
     202:	e8 c9 11 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     207:	83 f8 01             	cmp    $0x1,%eax
    rez = benny_mootex_islocked(&mootex);
     20a:	89 c6                	mov    %eax,%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     20c:	74 70                	je     27e <main+0x27e>
     20e:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     215:	00 
     216:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     21d:	00 
     21e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     225:	e8 e6 0b 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     22a:	85 f6                	test   %esi,%esi
     22c:	75 6c                	jne    29a <main+0x29a>
    bid = benny_mootex_wholock(&mootex);
     22e:	89 1c 24             	mov    %ebx,(%esp)
     231:	e8 8a 11 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == -1);
     236:	83 c0 01             	add    $0x1,%eax
     239:	74 6c                	je     2a7 <main+0x2a7>
     23b:	c7 44 24 0c 72 00 00 	movl   $0x72,0xc(%esp)
     242:	00 
     243:	e9 06 ff ff ff       	jmp    14e <main+0x14e>
    assert(bid == 0);
     248:	c7 44 24 0c 69 00 00 	movl   $0x69,0xc(%esp)
     24f:	00 
     250:	e9 f9 fe ff ff       	jmp    14e <main+0x14e>
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     255:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     25c:	00 
     25d:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     264:	00 
     265:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     26c:	e8 9f 0b 00 00       	call   e10 <printf>
    assert(rez == 0);
     271:	c7 44 24 0c 6d 00 00 	movl   $0x6d,0xc(%esp)
     278:	00 
     279:	e9 d0 fe ff ff       	jmp    14e <main+0x14e>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     27e:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     285:	00 
     286:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     28d:	00 
     28e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     295:	e8 76 0b 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     29a:	c7 44 24 0c 70 00 00 	movl   $0x70,0xc(%esp)
     2a1:	00 
     2a2:	e9 a7 fe ff ff       	jmp    14e <main+0x14e>

    printf(1, "\tspin lock tests\n");
     2a7:	c7 44 24 04 5c 14 00 	movl   $0x145c,0x4(%esp)
     2ae:	00 
     2af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2b6:	e8 55 0b 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
     2bb:	89 1c 24             	mov    %ebx,(%esp)
     2be:	e8 0d 11 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     2c3:	83 f8 01             	cmp    $0x1,%eax
    rez = benny_mootex_islocked(&mootex);
     2c6:	89 c6                	mov    %eax,%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     2c8:	74 3a                	je     304 <main+0x304>
     2ca:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     2d1:	00 
     2d2:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     2d9:	00 
     2da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2e1:	e8 2a 0b 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     2e6:	85 f6                	test   %esi,%esi
     2e8:	75 36                	jne    320 <main+0x320>
    bid = benny_mootex_wholock(&mootex);
     2ea:	89 1c 24             	mov    %ebx,(%esp)
     2ed:	e8 ce 10 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == -1);
     2f2:	83 c0 01             	add    $0x1,%eax
     2f5:	74 36                	je     32d <main+0x32d>
     2f7:	c7 44 24 0c 79 00 00 	movl   $0x79,0xc(%esp)
     2fe:	00 
     2ff:	e9 4a fe ff ff       	jmp    14e <main+0x14e>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     304:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     30b:	00 
     30c:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     313:	00 
     314:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     31b:	e8 f0 0a 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     320:	c7 44 24 0c 77 00 00 	movl   $0x77,0xc(%esp)
     327:	00 
     328:	e9 21 fe ff ff       	jmp    14e <main+0x14e>

    rez = benny_mootex_spinlock(&mootex);
     32d:	89 1c 24             	mov    %ebx,(%esp)
     330:	e8 eb 0f 00 00       	call   1320 <benny_mootex_spinlock>
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
     335:	85 c0                	test   %eax,%eax
     337:	75 52                	jne    38b <main+0x38b>
     339:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     340:	00 
     341:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
     348:	00 
     349:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     350:	e8 bb 0a 00 00       	call   e10 <printf>
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
     355:	89 1c 24             	mov    %ebx,(%esp)
     358:	e8 73 10 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     35d:	83 e8 01             	sub    $0x1,%eax
     360:	74 52                	je     3b4 <main+0x3b4>
     362:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     369:	00 
     36a:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     371:	00 
     372:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     379:	e8 92 0a 00 00       	call   e10 <printf>
    assert(rez == TRUE);
     37e:	c7 44 24 0c 80 00 00 	movl   $0x80,0xc(%esp)
     385:	00 
     386:	e9 c3 fd ff ff       	jmp    14e <main+0x14e>
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
     38b:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     392:	00 
     393:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
     39a:	00 
     39b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3a2:	e8 69 0a 00 00       	call   e10 <printf>
    assert(rez == 0);
     3a7:	c7 44 24 0c 7d 00 00 	movl   $0x7d,0xc(%esp)
     3ae:	00 
     3af:	e9 9a fd ff ff       	jmp    14e <main+0x14e>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     3b4:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     3bb:	00 
     3bc:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     3c3:	00 
     3c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3cb:	e8 40 0a 00 00       	call   e10 <printf>
    bid = benny_mootex_wholock(&mootex);
     3d0:	89 1c 24             	mov    %ebx,(%esp)
     3d3:	e8 e8 0f 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == 0);
     3d8:	85 c0                	test   %eax,%eax
     3da:	74 0d                	je     3e9 <main+0x3e9>
     3dc:	c7 44 24 0c 82 00 00 	movl   $0x82,0xc(%esp)
     3e3:	00 
     3e4:	e9 65 fd ff ff       	jmp    14e <main+0x14e>

    rez = benny_mootex_unlock(&mootex);
     3e9:	89 1c 24             	mov    %ebx,(%esp)
     3ec:	e8 5f 0f 00 00       	call   1350 <benny_mootex_unlock>
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     3f1:	85 c0                	test   %eax,%eax
     3f3:	75 58                	jne    44d <main+0x44d>
     3f5:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     3fc:	00 
     3fd:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     404:	00 
     405:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     40c:	e8 ff 09 00 00       	call   e10 <printf>
    assert(rez == 0);
    rez = benny_mootex_islocked(&mootex);
     411:	89 1c 24             	mov    %ebx,(%esp)
     414:	e8 b7 0f 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     419:	83 f8 01             	cmp    $0x1,%eax
    rez = benny_mootex_islocked(&mootex);
     41c:	89 c6                	mov    %eax,%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     41e:	74 70                	je     490 <main+0x490>
     420:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     427:	00 
     428:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     42f:	00 
     430:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     437:	e8 d4 09 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     43c:	85 f6                	test   %esi,%esi
     43e:	74 36                	je     476 <main+0x476>
     440:	c7 44 24 0c 89 00 00 	movl   $0x89,0xc(%esp)
     447:	00 
     448:	e9 01 fd ff ff       	jmp    14e <main+0x14e>
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     44d:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     454:	00 
     455:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     45c:	00 
     45d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     464:	e8 a7 09 00 00       	call   e10 <printf>
    assert(rez == 0);
     469:	c7 44 24 0c 86 00 00 	movl   $0x86,0xc(%esp)
     470:	00 
     471:	e9 d8 fc ff ff       	jmp    14e <main+0x14e>
    bid = benny_mootex_wholock(&mootex);
     476:	89 1c 24             	mov    %ebx,(%esp)
     479:	e8 42 0f 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == -1);
     47e:	83 c0 01             	add    $0x1,%eax
     481:	74 2b                	je     4ae <main+0x4ae>
     483:	c7 44 24 0c 8b 00 00 	movl   $0x8b,0xc(%esp)
     48a:	00 
     48b:	e9 be fc ff ff       	jmp    14e <main+0x14e>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     490:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     497:	00 
     498:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     49f:	00 
     4a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4a7:	e8 64 09 00 00       	call   e10 <printf>
     4ac:	eb 92                	jmp    440 <main+0x440>

    benny_thread_create(&bt, func1, (void *) NULL);
     4ae:	8d 44 24 14          	lea    0x14(%esp),%eax
     4b2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     4b9:	00 
     4ba:	c7 44 24 04 00 05 00 	movl   $0x500,0x4(%esp)
     4c1:	00 
     4c2:	89 04 24             	mov    %eax,(%esp)
     4c5:	e8 e6 0c 00 00       	call   11b0 <benny_thread_create>
    benny_thread_join(bt);
     4ca:	8b 44 24 14          	mov    0x14(%esp),%eax
     4ce:	89 04 24             	mov    %eax,(%esp)
     4d1:	e8 8a 0d 00 00       	call   1260 <benny_thread_join>

    if (argc > 1) {
     4d6:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
     4da:	0f 8e 8a fc ff ff    	jle    16a <main+0x16a>
        kdebug(0);
     4e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4e7:	e8 2e 08 00 00       	call   d1a <kdebug>
     4ec:	e9 79 fc ff ff       	jmp    16a <main+0x16a>
     4f1:	66 90                	xchg   %ax,%ax
     4f3:	66 90                	xchg   %ax,%ax
     4f5:	66 90                	xchg   %ax,%ax
     4f7:	66 90                	xchg   %ax,%ax
     4f9:	66 90                	xchg   %ax,%ax
     4fb:	66 90                	xchg   %ax,%ax
     4fd:	66 90                	xchg   %ax,%ax
     4ff:	90                   	nop

00000500 <func1>:
{
     500:	55                   	push   %ebp
     501:	89 e5                	mov    %esp,%ebp
     503:	53                   	push   %ebx
     504:	83 ec 14             	sub    $0x14,%esp
    printf(1, "thread starting\n");
     507:	c7 44 24 04 1c 14 00 	movl   $0x141c,0x4(%esp)
     50e:	00 
     50f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     516:	e8 f5 08 00 00       	call   e10 <printf>
    printf(1, "\tyield lock tests\n");
     51b:	c7 44 24 04 2d 14 00 	movl   $0x142d,0x4(%esp)
     522:	00 
     523:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     52a:	e8 e1 08 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
     52f:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     536:	e8 95 0e 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     53b:	83 f8 01             	cmp    $0x1,%eax
    rez = benny_mootex_islocked(&mootex);
     53e:	89 c3                	mov    %eax,%ebx
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     540:	0f 84 f2 00 00 00    	je     638 <func1+0x138>
     546:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     54d:	00 
     54e:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     555:	00 
     556:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     55d:	e8 ae 08 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     562:	85 db                	test   %ebx,%ebx
     564:	0f 85 ea 00 00 00    	jne    654 <func1+0x154>
    bid = benny_mootex_wholock(&mootex);
     56a:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     571:	e8 4a 0e 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == -1);
     576:	83 f8 ff             	cmp    $0xffffffff,%eax
     579:	0f 85 b3 04 00 00    	jne    a32 <func1+0x532>
    rez = benny_mootex_yieldlock(&mootex);
     57f:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     586:	e8 55 0d 00 00       	call   12e0 <benny_mootex_yieldlock>
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
     58b:	85 c0                	test   %eax,%eax
     58d:	75 59                	jne    5e8 <func1+0xe8>
     58f:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     596:	00 
     597:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
     59e:	00 
     59f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5a6:	e8 65 08 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
     5ab:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     5b2:	e8 19 0e 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     5b7:	83 f8 01             	cmp    $0x1,%eax
     5ba:	0f 84 a0 00 00 00    	je     660 <func1+0x160>
     5c0:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     5c7:	00 
     5c8:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     5cf:	00 
     5d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5d7:	e8 34 08 00 00       	call   e10 <printf>
    assert(rez == TRUE);
     5dc:	c7 44 24 0c 1c 00 00 	movl   $0x1c,0xc(%esp)
     5e3:	00 
     5e4:	eb 2a                	jmp    610 <func1+0x110>
     5e6:	66 90                	xchg   %ax,%ax
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
     5e8:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     5ef:	00 
     5f0:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
     5f7:	00 
     5f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5ff:	e8 0c 08 00 00       	call   e10 <printf>
    assert(rez == 0);
     604:	c7 44 24 0c 19 00 00 	movl   $0x19,0xc(%esp)
     60b:	00 
     60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    assert(bid == -1);
     610:	c7 44 24 08 54 14 00 	movl   $0x1454,0x8(%esp)
     617:	00 
     618:	c7 44 24 04 dc 14 00 	movl   $0x14dc,0x4(%esp)
     61f:	00 
     620:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     627:	e8 e4 07 00 00       	call   e10 <printf>
     62c:	e8 31 06 00 00       	call   c62 <exit>
     631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     638:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     63f:	00 
     640:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     647:	00 
     648:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     64f:	e8 bc 07 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     654:	c7 44 24 0c 13 00 00 	movl   $0x13,0xc(%esp)
     65b:	00 
     65c:	eb b2                	jmp    610 <func1+0x110>
     65e:	66 90                	xchg   %ax,%ax
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     660:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     667:	00 
     668:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     66f:	00 
     670:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     677:	e8 94 07 00 00       	call   e10 <printf>
    bid = benny_mootex_wholock(&mootex);
     67c:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     683:	e8 38 0d 00 00       	call   13c0 <benny_mootex_wholock>
    printf(1,"\t\t the bid is: %d\n",bid);
     688:	c7 44 24 04 96 14 00 	movl   $0x1496,0x4(%esp)
     68f:	00 
     690:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    bid = benny_mootex_wholock(&mootex);
     697:	89 c3                	mov    %eax,%ebx
    printf(1,"\t\t the bid is: %d\n",bid);
     699:	89 44 24 08          	mov    %eax,0x8(%esp)
     69d:	e8 6e 07 00 00       	call   e10 <printf>
    assert(bid == 1);
     6a2:	83 fb 01             	cmp    $0x1,%ebx
     6a5:	0f 85 7a 03 00 00    	jne    a25 <func1+0x525>
    rez = benny_mootex_unlock(&mootex);
     6ab:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     6b2:	e8 99 0c 00 00       	call   1350 <benny_mootex_unlock>
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     6b7:	85 c0                	test   %eax,%eax
     6b9:	0f 85 41 01 00 00    	jne    800 <func1+0x300>
     6bf:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     6c6:	00 
     6c7:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     6ce:	00 
     6cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6d6:	e8 35 07 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
     6db:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     6e2:	e8 e9 0c 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     6e7:	83 f8 01             	cmp    $0x1,%eax
    rez = benny_mootex_islocked(&mootex);
     6ea:	89 c3                	mov    %eax,%ebx
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     6ec:	0f 84 6e 01 00 00    	je     860 <func1+0x360>
     6f2:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     6f9:	00 
     6fa:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     701:	00 
     702:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     709:	e8 02 07 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     70e:	85 db                	test   %ebx,%ebx
     710:	0f 85 66 01 00 00    	jne    87c <func1+0x37c>
    bid = benny_mootex_wholock(&mootex);
     716:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     71d:	e8 9e 0c 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == -1);
     722:	83 f8 ff             	cmp    $0xffffffff,%eax
     725:	0f 85 e0 02 00 00    	jne    a0b <func1+0x50b>
    printf(1, "\tspin lock tests\n");
     72b:	c7 44 24 04 5c 14 00 	movl   $0x145c,0x4(%esp)
     732:	00 
     733:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     73a:	e8 d1 06 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
     73f:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     746:	e8 85 0c 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     74b:	83 f8 01             	cmp    $0x1,%eax
    rez = benny_mootex_islocked(&mootex);
     74e:	89 c3                	mov    %eax,%ebx
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     750:	0f 84 3a 01 00 00    	je     890 <func1+0x390>
     756:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     75d:	00 
     75e:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     765:	00 
     766:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     76d:	e8 9e 06 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     772:	85 db                	test   %ebx,%ebx
     774:	0f 85 32 01 00 00    	jne    8ac <func1+0x3ac>
    bid = benny_mootex_wholock(&mootex);
     77a:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     781:	e8 3a 0c 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == -1);
     786:	83 f8 ff             	cmp    $0xffffffff,%eax
     789:	0f 85 89 02 00 00    	jne    a18 <func1+0x518>
    rez = benny_mootex_spinlock(&mootex);
     78f:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     796:	e8 85 0b 00 00       	call   1320 <benny_mootex_spinlock>
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
     79b:	85 c0                	test   %eax,%eax
     79d:	0f 85 8d 00 00 00    	jne    830 <func1+0x330>
     7a3:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     7aa:	00 
     7ab:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
     7b2:	00 
     7b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7ba:	e8 51 06 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
     7bf:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     7c6:	e8 05 0c 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     7cb:	83 f8 01             	cmp    $0x1,%eax
     7ce:	0f 84 ec 00 00 00    	je     8c0 <func1+0x3c0>
     7d4:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     7db:	00 
     7dc:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     7e3:	00 
     7e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7eb:	e8 20 06 00 00       	call   e10 <printf>
    assert(rez == TRUE);
     7f0:	c7 44 24 0c 36 00 00 	movl   $0x36,0xc(%esp)
     7f7:	00 
     7f8:	e9 13 fe ff ff       	jmp    610 <func1+0x110>
     7fd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     800:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     807:	00 
     808:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     80f:	00 
     810:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     817:	e8 f4 05 00 00       	call   e10 <printf>
    assert(rez == 0);
     81c:	c7 44 24 0c 23 00 00 	movl   $0x23,0xc(%esp)
     823:	00 
     824:	e9 e7 fd ff ff       	jmp    610 <func1+0x110>
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "\t\tis lock success: %s\n", rez == 0 ? "yes" : "no");
     830:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     837:	00 
     838:	c7 44 24 04 7f 14 00 	movl   $0x147f,0x4(%esp)
     83f:	00 
     840:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     847:	e8 c4 05 00 00       	call   e10 <printf>
    assert(rez == 0);
     84c:	c7 44 24 0c 33 00 00 	movl   $0x33,0xc(%esp)
     853:	00 
     854:	e9 b7 fd ff ff       	jmp    610 <func1+0x110>
     859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     860:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     867:	00 
     868:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     86f:	00 
     870:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     877:	e8 94 05 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     87c:	c7 44 24 0c 26 00 00 	movl   $0x26,0xc(%esp)
     883:	00 
     884:	e9 87 fd ff ff       	jmp    610 <func1+0x110>
     889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     890:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     897:	00 
     898:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     89f:	00 
     8a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8a7:	e8 64 05 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     8ac:	c7 44 24 0c 2d 00 00 	movl   $0x2d,0xc(%esp)
     8b3:	00 
     8b4:	e9 57 fd ff ff       	jmp    610 <func1+0x110>
     8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     8c0:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     8c7:	00 
     8c8:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     8cf:	00 
     8d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8d7:	e8 34 05 00 00       	call   e10 <printf>
    bid = benny_mootex_wholock(&mootex);
     8dc:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     8e3:	e8 d8 0a 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == 1);
     8e8:	83 f8 01             	cmp    $0x1,%eax
     8eb:	0f 85 00 01 00 00    	jne    9f1 <func1+0x4f1>
    rez = benny_mootex_unlock(&mootex);
     8f1:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     8f8:	e8 53 0a 00 00       	call   1350 <benny_mootex_unlock>
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     8fd:	85 c0                	test   %eax,%eax
     8ff:	0f 85 93 00 00 00    	jne    998 <func1+0x498>
     905:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     90c:	00 
     90d:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     914:	00 
     915:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     91c:	e8 ef 04 00 00       	call   e10 <printf>
    rez = benny_mootex_islocked(&mootex);
     921:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     928:	e8 a3 0a 00 00       	call   13d0 <benny_mootex_islocked>
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     92d:	83 f8 01             	cmp    $0x1,%eax
    rez = benny_mootex_islocked(&mootex);
     930:	89 c3                	mov    %eax,%ebx
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     932:	0f 84 90 00 00 00    	je     9c8 <func1+0x4c8>
     938:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     93f:	00 
     940:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     947:	00 
     948:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     94f:	e8 bc 04 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     954:	85 db                	test   %ebx,%ebx
     956:	0f 85 88 00 00 00    	jne    9e4 <func1+0x4e4>
    bid = benny_mootex_wholock(&mootex);
     95c:	c7 04 24 b8 19 00 00 	movl   $0x19b8,(%esp)
     963:	e8 58 0a 00 00       	call   13c0 <benny_mootex_wholock>
    assert(bid == -1);
     968:	83 f8 ff             	cmp    $0xffffffff,%eax
     96b:	0f 85 8d 00 00 00    	jne    9fe <func1+0x4fe>
    printf(1, "thread done\n");
     971:	c7 44 24 04 6e 14 00 	movl   $0x146e,0x4(%esp)
     978:	00 
     979:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     980:	e8 8b 04 00 00       	call   e10 <printf>
    benny_thread_exit(0);
     985:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
     98c:	83 c4 14             	add    $0x14,%esp
     98f:	5b                   	pop    %ebx
     990:	5d                   	pop    %ebp
    benny_thread_exit(0);
     991:	e9 1a 09 00 00       	jmp    12b0 <benny_thread_exit>
     996:	66 90                	xchg   %ax,%ax
    printf(1, "\t\tis unlock success: %s\n", rez == 0 ? "yes" : "no");
     998:	c7 44 24 08 40 14 00 	movl   $0x1440,0x8(%esp)
     99f:	00 
     9a0:	c7 44 24 04 a9 14 00 	movl   $0x14a9,0x4(%esp)
     9a7:	00 
     9a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9af:	e8 5c 04 00 00       	call   e10 <printf>
    assert(rez == 0);
     9b4:	c7 44 24 0c 3c 00 00 	movl   $0x3c,0xc(%esp)
     9bb:	00 
     9bc:	e9 4f fc ff ff       	jmp    610 <func1+0x110>
     9c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "\t\tis locked: %s\n", rez == TRUE ? "yes" : "no");
     9c8:	c7 44 24 08 7b 14 00 	movl   $0x147b,0x8(%esp)
     9cf:	00 
     9d0:	c7 44 24 04 43 14 00 	movl   $0x1443,0x4(%esp)
     9d7:	00 
     9d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9df:	e8 2c 04 00 00       	call   e10 <printf>
    assert(rez == FALSE);
     9e4:	c7 44 24 0c 3f 00 00 	movl   $0x3f,0xc(%esp)
     9eb:	00 
     9ec:	e9 1f fc ff ff       	jmp    610 <func1+0x110>
    assert(bid == 1);
     9f1:	c7 44 24 0c 38 00 00 	movl   $0x38,0xc(%esp)
     9f8:	00 
     9f9:	e9 12 fc ff ff       	jmp    610 <func1+0x110>
    assert(bid == -1);
     9fe:	c7 44 24 0c 41 00 00 	movl   $0x41,0xc(%esp)
     a05:	00 
     a06:	e9 05 fc ff ff       	jmp    610 <func1+0x110>
    assert(bid == -1);
     a0b:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
     a12:	00 
     a13:	e9 f8 fb ff ff       	jmp    610 <func1+0x110>
    assert(bid == -1);
     a18:	c7 44 24 0c 2f 00 00 	movl   $0x2f,0xc(%esp)
     a1f:	00 
     a20:	e9 eb fb ff ff       	jmp    610 <func1+0x110>
    assert(bid == 1);
     a25:	c7 44 24 0c 1f 00 00 	movl   $0x1f,0xc(%esp)
     a2c:	00 
     a2d:	e9 de fb ff ff       	jmp    610 <func1+0x110>
    assert(bid == -1);
     a32:	c7 44 24 0c 15 00 00 	movl   $0x15,0xc(%esp)
     a39:	00 
     a3a:	e9 d1 fb ff ff       	jmp    610 <func1+0x110>
     a3f:	90                   	nop

00000a40 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	8b 45 08             	mov    0x8(%ebp),%eax
     a46:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     a49:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     a4a:	89 c2                	mov    %eax,%edx
     a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a50:	83 c1 01             	add    $0x1,%ecx
     a53:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     a57:	83 c2 01             	add    $0x1,%edx
     a5a:	84 db                	test   %bl,%bl
     a5c:	88 5a ff             	mov    %bl,-0x1(%edx)
     a5f:	75 ef                	jne    a50 <strcpy+0x10>
    ;
  return os;
}
     a61:	5b                   	pop    %ebx
     a62:	5d                   	pop    %ebp
     a63:	c3                   	ret    
     a64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a70 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	8b 55 08             	mov    0x8(%ebp),%edx
     a76:	53                   	push   %ebx
     a77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     a7a:	0f b6 02             	movzbl (%edx),%eax
     a7d:	84 c0                	test   %al,%al
     a7f:	74 2d                	je     aae <strcmp+0x3e>
     a81:	0f b6 19             	movzbl (%ecx),%ebx
     a84:	38 d8                	cmp    %bl,%al
     a86:	74 0e                	je     a96 <strcmp+0x26>
     a88:	eb 2b                	jmp    ab5 <strcmp+0x45>
     a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a90:	38 c8                	cmp    %cl,%al
     a92:	75 15                	jne    aa9 <strcmp+0x39>
    p++, q++;
     a94:	89 d9                	mov    %ebx,%ecx
     a96:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     a99:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     a9c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     a9f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
     aa3:	84 c0                	test   %al,%al
     aa5:	75 e9                	jne    a90 <strcmp+0x20>
     aa7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     aa9:	29 c8                	sub    %ecx,%eax
}
     aab:	5b                   	pop    %ebx
     aac:	5d                   	pop    %ebp
     aad:	c3                   	ret    
     aae:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
     ab1:	31 c0                	xor    %eax,%eax
     ab3:	eb f4                	jmp    aa9 <strcmp+0x39>
     ab5:	0f b6 cb             	movzbl %bl,%ecx
     ab8:	eb ef                	jmp    aa9 <strcmp+0x39>
     aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ac0 <strlen>:

uint
strlen(const char *s)
{
     ac0:	55                   	push   %ebp
     ac1:	89 e5                	mov    %esp,%ebp
     ac3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     ac6:	80 39 00             	cmpb   $0x0,(%ecx)
     ac9:	74 12                	je     add <strlen+0x1d>
     acb:	31 d2                	xor    %edx,%edx
     acd:	8d 76 00             	lea    0x0(%esi),%esi
     ad0:	83 c2 01             	add    $0x1,%edx
     ad3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ad7:	89 d0                	mov    %edx,%eax
     ad9:	75 f5                	jne    ad0 <strlen+0x10>
    ;
  return n;
}
     adb:	5d                   	pop    %ebp
     adc:	c3                   	ret    
  for(n = 0; s[n]; n++)
     add:	31 c0                	xor    %eax,%eax
}
     adf:	5d                   	pop    %ebp
     ae0:	c3                   	ret    
     ae1:	eb 0d                	jmp    af0 <memset>
     ae3:	90                   	nop
     ae4:	90                   	nop
     ae5:	90                   	nop
     ae6:	90                   	nop
     ae7:	90                   	nop
     ae8:	90                   	nop
     ae9:	90                   	nop
     aea:	90                   	nop
     aeb:	90                   	nop
     aec:	90                   	nop
     aed:	90                   	nop
     aee:	90                   	nop
     aef:	90                   	nop

00000af0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	8b 55 08             	mov    0x8(%ebp),%edx
     af6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     af7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     afa:	8b 45 0c             	mov    0xc(%ebp),%eax
     afd:	89 d7                	mov    %edx,%edi
     aff:	fc                   	cld    
     b00:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b02:	89 d0                	mov    %edx,%eax
     b04:	5f                   	pop    %edi
     b05:	5d                   	pop    %ebp
     b06:	c3                   	ret    
     b07:	89 f6                	mov    %esi,%esi
     b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b10 <strchr>:

char*
strchr(const char *s, char c)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	8b 45 08             	mov    0x8(%ebp),%eax
     b16:	53                   	push   %ebx
     b17:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
     b1a:	0f b6 18             	movzbl (%eax),%ebx
     b1d:	84 db                	test   %bl,%bl
     b1f:	74 1d                	je     b3e <strchr+0x2e>
    if(*s == c)
     b21:	38 d3                	cmp    %dl,%bl
     b23:	89 d1                	mov    %edx,%ecx
     b25:	75 0d                	jne    b34 <strchr+0x24>
     b27:	eb 17                	jmp    b40 <strchr+0x30>
     b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b30:	38 ca                	cmp    %cl,%dl
     b32:	74 0c                	je     b40 <strchr+0x30>
  for(; *s; s++)
     b34:	83 c0 01             	add    $0x1,%eax
     b37:	0f b6 10             	movzbl (%eax),%edx
     b3a:	84 d2                	test   %dl,%dl
     b3c:	75 f2                	jne    b30 <strchr+0x20>
      return (char*)s;
  return 0;
     b3e:	31 c0                	xor    %eax,%eax
}
     b40:	5b                   	pop    %ebx
     b41:	5d                   	pop    %ebp
     b42:	c3                   	ret    
     b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <gets>:

char*
gets(char *buf, int max)
{
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	57                   	push   %edi
     b54:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b55:	31 f6                	xor    %esi,%esi
{
     b57:	53                   	push   %ebx
     b58:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
     b5b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     b5e:	eb 31                	jmp    b91 <gets+0x41>
    cc = read(0, &c, 1);
     b60:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     b67:	00 
     b68:	89 7c 24 04          	mov    %edi,0x4(%esp)
     b6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b73:	e8 02 01 00 00       	call   c7a <read>
    if(cc < 1)
     b78:	85 c0                	test   %eax,%eax
     b7a:	7e 1d                	jle    b99 <gets+0x49>
      break;
    buf[i++] = c;
     b7c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
     b80:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
     b82:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
     b85:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
     b87:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     b8b:	74 0c                	je     b99 <gets+0x49>
     b8d:	3c 0a                	cmp    $0xa,%al
     b8f:	74 08                	je     b99 <gets+0x49>
  for(i=0; i+1 < max; ){
     b91:	8d 5e 01             	lea    0x1(%esi),%ebx
     b94:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b97:	7c c7                	jl     b60 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     b99:	8b 45 08             	mov    0x8(%ebp),%eax
     b9c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     ba0:	83 c4 2c             	add    $0x2c,%esp
     ba3:	5b                   	pop    %ebx
     ba4:	5e                   	pop    %esi
     ba5:	5f                   	pop    %edi
     ba6:	5d                   	pop    %ebp
     ba7:	c3                   	ret    
     ba8:	90                   	nop
     ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bb0 <stat>:

int
stat(const char *n, struct stat *st)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	56                   	push   %esi
     bb4:	53                   	push   %ebx
     bb5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     bb8:	8b 45 08             	mov    0x8(%ebp),%eax
     bbb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     bc2:	00 
     bc3:	89 04 24             	mov    %eax,(%esp)
     bc6:	e8 d7 00 00 00       	call   ca2 <open>
  if(fd < 0)
     bcb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
     bcd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     bcf:	78 27                	js     bf8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     bd1:	8b 45 0c             	mov    0xc(%ebp),%eax
     bd4:	89 1c 24             	mov    %ebx,(%esp)
     bd7:	89 44 24 04          	mov    %eax,0x4(%esp)
     bdb:	e8 da 00 00 00       	call   cba <fstat>
  close(fd);
     be0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     be3:	89 c6                	mov    %eax,%esi
  close(fd);
     be5:	e8 a0 00 00 00       	call   c8a <close>
  return r;
     bea:	89 f0                	mov    %esi,%eax
}
     bec:	83 c4 10             	add    $0x10,%esp
     bef:	5b                   	pop    %ebx
     bf0:	5e                   	pop    %esi
     bf1:	5d                   	pop    %ebp
     bf2:	c3                   	ret    
     bf3:	90                   	nop
     bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     bf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     bfd:	eb ed                	jmp    bec <stat+0x3c>
     bff:	90                   	nop

00000c00 <atoi>:

int
atoi(const char *s)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c06:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     c07:	0f be 11             	movsbl (%ecx),%edx
     c0a:	8d 42 d0             	lea    -0x30(%edx),%eax
     c0d:	3c 09                	cmp    $0x9,%al
  n = 0;
     c0f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     c14:	77 17                	ja     c2d <atoi+0x2d>
     c16:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     c18:	83 c1 01             	add    $0x1,%ecx
     c1b:	8d 04 80             	lea    (%eax,%eax,4),%eax
     c1e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     c22:	0f be 11             	movsbl (%ecx),%edx
     c25:	8d 5a d0             	lea    -0x30(%edx),%ebx
     c28:	80 fb 09             	cmp    $0x9,%bl
     c2b:	76 eb                	jbe    c18 <atoi+0x18>
  return n;
}
     c2d:	5b                   	pop    %ebx
     c2e:	5d                   	pop    %ebp
     c2f:	c3                   	ret    

00000c30 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     c30:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c31:	31 d2                	xor    %edx,%edx
{
     c33:	89 e5                	mov    %esp,%ebp
     c35:	56                   	push   %esi
     c36:	8b 45 08             	mov    0x8(%ebp),%eax
     c39:	53                   	push   %ebx
     c3a:	8b 5d 10             	mov    0x10(%ebp),%ebx
     c3d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
     c40:	85 db                	test   %ebx,%ebx
     c42:	7e 12                	jle    c56 <memmove+0x26>
     c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     c48:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     c4c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c4f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     c52:	39 da                	cmp    %ebx,%edx
     c54:	75 f2                	jne    c48 <memmove+0x18>
  return vdst;
}
     c56:	5b                   	pop    %ebx
     c57:	5e                   	pop    %esi
     c58:	5d                   	pop    %ebp
     c59:	c3                   	ret    

00000c5a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     c5a:	b8 01 00 00 00       	mov    $0x1,%eax
     c5f:	cd 40                	int    $0x40
     c61:	c3                   	ret    

00000c62 <exit>:
SYSCALL(exit)
     c62:	b8 02 00 00 00       	mov    $0x2,%eax
     c67:	cd 40                	int    $0x40
     c69:	c3                   	ret    

00000c6a <wait>:
SYSCALL(wait)
     c6a:	b8 03 00 00 00       	mov    $0x3,%eax
     c6f:	cd 40                	int    $0x40
     c71:	c3                   	ret    

00000c72 <pipe>:
SYSCALL(pipe)
     c72:	b8 04 00 00 00       	mov    $0x4,%eax
     c77:	cd 40                	int    $0x40
     c79:	c3                   	ret    

00000c7a <read>:
SYSCALL(read)
     c7a:	b8 05 00 00 00       	mov    $0x5,%eax
     c7f:	cd 40                	int    $0x40
     c81:	c3                   	ret    

00000c82 <write>:
SYSCALL(write)
     c82:	b8 10 00 00 00       	mov    $0x10,%eax
     c87:	cd 40                	int    $0x40
     c89:	c3                   	ret    

00000c8a <close>:
SYSCALL(close)
     c8a:	b8 15 00 00 00       	mov    $0x15,%eax
     c8f:	cd 40                	int    $0x40
     c91:	c3                   	ret    

00000c92 <kill>:
SYSCALL(kill)
     c92:	b8 06 00 00 00       	mov    $0x6,%eax
     c97:	cd 40                	int    $0x40
     c99:	c3                   	ret    

00000c9a <exec>:
SYSCALL(exec)
     c9a:	b8 07 00 00 00       	mov    $0x7,%eax
     c9f:	cd 40                	int    $0x40
     ca1:	c3                   	ret    

00000ca2 <open>:
SYSCALL(open)
     ca2:	b8 0f 00 00 00       	mov    $0xf,%eax
     ca7:	cd 40                	int    $0x40
     ca9:	c3                   	ret    

00000caa <mknod>:
SYSCALL(mknod)
     caa:	b8 11 00 00 00       	mov    $0x11,%eax
     caf:	cd 40                	int    $0x40
     cb1:	c3                   	ret    

00000cb2 <unlink>:
SYSCALL(unlink)
     cb2:	b8 12 00 00 00       	mov    $0x12,%eax
     cb7:	cd 40                	int    $0x40
     cb9:	c3                   	ret    

00000cba <fstat>:
SYSCALL(fstat)
     cba:	b8 08 00 00 00       	mov    $0x8,%eax
     cbf:	cd 40                	int    $0x40
     cc1:	c3                   	ret    

00000cc2 <link>:
SYSCALL(link)
     cc2:	b8 13 00 00 00       	mov    $0x13,%eax
     cc7:	cd 40                	int    $0x40
     cc9:	c3                   	ret    

00000cca <mkdir>:
SYSCALL(mkdir)
     cca:	b8 14 00 00 00       	mov    $0x14,%eax
     ccf:	cd 40                	int    $0x40
     cd1:	c3                   	ret    

00000cd2 <chdir>:
SYSCALL(chdir)
     cd2:	b8 09 00 00 00       	mov    $0x9,%eax
     cd7:	cd 40                	int    $0x40
     cd9:	c3                   	ret    

00000cda <dup>:
SYSCALL(dup)
     cda:	b8 0a 00 00 00       	mov    $0xa,%eax
     cdf:	cd 40                	int    $0x40
     ce1:	c3                   	ret    

00000ce2 <getpid>:
SYSCALL(getpid)
     ce2:	b8 0b 00 00 00       	mov    $0xb,%eax
     ce7:	cd 40                	int    $0x40
     ce9:	c3                   	ret    

00000cea <sbrk>:
SYSCALL(sbrk)
     cea:	b8 0c 00 00 00       	mov    $0xc,%eax
     cef:	cd 40                	int    $0x40
     cf1:	c3                   	ret    

00000cf2 <sleep>:
SYSCALL(sleep)
     cf2:	b8 0d 00 00 00       	mov    $0xd,%eax
     cf7:	cd 40                	int    $0x40
     cf9:	c3                   	ret    

00000cfa <uptime>:
SYSCALL(uptime)
     cfa:	b8 0e 00 00 00       	mov    $0xe,%eax
     cff:	cd 40                	int    $0x40
     d01:	c3                   	ret    

00000d02 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
     d02:	b8 16 00 00 00       	mov    $0x16,%eax
     d07:	cd 40                	int    $0x40
     d09:	c3                   	ret    

00000d0a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
     d0a:	b8 17 00 00 00       	mov    $0x17,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
     d12:	b8 18 00 00 00       	mov    $0x18,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
     d1a:	b8 19 00 00 00       	mov    $0x19,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
     d22:	b8 1a 00 00 00       	mov    $0x1a,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
     d2a:	b8 1b 00 00 00       	mov    $0x1b,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <kthread_join>:
SYSCALL(kthread_join)
     d32:	b8 1c 00 00 00       	mov    $0x1c,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <kthread_exit>:
SYSCALL(kthread_exit)
     d3a:	b8 1d 00 00 00       	mov    $0x1d,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
     d42:	b8 1e 00 00 00       	mov    $0x1e,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <kthread_yield>:
SYSCALL(kthread_yield)
     d4a:	b8 1f 00 00 00       	mov    $0x1f,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
     d52:	b8 20 00 00 00       	mov    $0x20,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
     d5a:	b8 21 00 00 00       	mov    $0x21,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    
     d62:	66 90                	xchg   %ax,%ax
     d64:	66 90                	xchg   %ax,%ax
     d66:	66 90                	xchg   %ax,%ax
     d68:	66 90                	xchg   %ax,%ax
     d6a:	66 90                	xchg   %ax,%ax
     d6c:	66 90                	xchg   %ax,%ax
     d6e:	66 90                	xchg   %ax,%ax

00000d70 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	89 c6                	mov    %eax,%esi
     d77:	53                   	push   %ebx
     d78:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     d7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d7e:	85 db                	test   %ebx,%ebx
     d80:	74 09                	je     d8b <printint+0x1b>
     d82:	89 d0                	mov    %edx,%eax
     d84:	c1 e8 1f             	shr    $0x1f,%eax
     d87:	84 c0                	test   %al,%al
     d89:	75 75                	jne    e00 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     d8b:	89 d0                	mov    %edx,%eax
  neg = 0;
     d8d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     d94:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
     d97:	31 ff                	xor    %edi,%edi
     d99:	89 ce                	mov    %ecx,%esi
     d9b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     d9e:	eb 02                	jmp    da2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
     da0:	89 cf                	mov    %ecx,%edi
     da2:	31 d2                	xor    %edx,%edx
     da4:	f7 f6                	div    %esi
     da6:	8d 4f 01             	lea    0x1(%edi),%ecx
     da9:	0f b6 92 07 15 00 00 	movzbl 0x1507(%edx),%edx
  }while((x /= base) != 0);
     db0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     db2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     db5:	75 e9                	jne    da0 <printint+0x30>
  if(neg)
     db7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
     dba:	89 c8                	mov    %ecx,%eax
     dbc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
     dbf:	85 d2                	test   %edx,%edx
     dc1:	74 08                	je     dcb <printint+0x5b>
    buf[i++] = '-';
     dc3:	8d 4f 02             	lea    0x2(%edi),%ecx
     dc6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
     dcb:	8d 79 ff             	lea    -0x1(%ecx),%edi
     dce:	66 90                	xchg   %ax,%ax
     dd0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
     dd5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
     dd8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ddf:	00 
     de0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     de4:	89 34 24             	mov    %esi,(%esp)
     de7:	88 45 d7             	mov    %al,-0x29(%ebp)
     dea:	e8 93 fe ff ff       	call   c82 <write>
  while(--i >= 0)
     def:	83 ff ff             	cmp    $0xffffffff,%edi
     df2:	75 dc                	jne    dd0 <printint+0x60>
    putc(fd, buf[i]);
}
     df4:	83 c4 4c             	add    $0x4c,%esp
     df7:	5b                   	pop    %ebx
     df8:	5e                   	pop    %esi
     df9:	5f                   	pop    %edi
     dfa:	5d                   	pop    %ebp
     dfb:	c3                   	ret    
     dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
     e00:	89 d0                	mov    %edx,%eax
     e02:	f7 d8                	neg    %eax
    neg = 1;
     e04:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     e0b:	eb 87                	jmp    d94 <printint+0x24>
     e0d:	8d 76 00             	lea    0x0(%esi),%esi

00000e10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     e14:	31 ff                	xor    %edi,%edi
{
     e16:	56                   	push   %esi
     e17:	53                   	push   %ebx
     e18:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e1b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
     e1e:	8d 45 10             	lea    0x10(%ebp),%eax
{
     e21:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
     e24:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
     e27:	0f b6 13             	movzbl (%ebx),%edx
     e2a:	83 c3 01             	add    $0x1,%ebx
     e2d:	84 d2                	test   %dl,%dl
     e2f:	75 39                	jne    e6a <printf+0x5a>
     e31:	e9 ca 00 00 00       	jmp    f00 <printf+0xf0>
     e36:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     e38:	83 fa 25             	cmp    $0x25,%edx
     e3b:	0f 84 c7 00 00 00    	je     f08 <printf+0xf8>
  write(fd, &c, 1);
     e41:	8d 45 e0             	lea    -0x20(%ebp),%eax
     e44:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e4b:	00 
     e4c:	89 44 24 04          	mov    %eax,0x4(%esp)
     e50:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
     e53:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
     e56:	e8 27 fe ff ff       	call   c82 <write>
     e5b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
     e5e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
     e62:	84 d2                	test   %dl,%dl
     e64:	0f 84 96 00 00 00    	je     f00 <printf+0xf0>
    if(state == 0){
     e6a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
     e6c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
     e6f:	74 c7                	je     e38 <printf+0x28>
      }
    } else if(state == '%'){
     e71:	83 ff 25             	cmp    $0x25,%edi
     e74:	75 e5                	jne    e5b <printf+0x4b>
      if(c == 'd' || c == 'u'){
     e76:	83 fa 75             	cmp    $0x75,%edx
     e79:	0f 84 99 00 00 00    	je     f18 <printf+0x108>
     e7f:	83 fa 64             	cmp    $0x64,%edx
     e82:	0f 84 90 00 00 00    	je     f18 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     e88:	25 f7 00 00 00       	and    $0xf7,%eax
     e8d:	83 f8 70             	cmp    $0x70,%eax
     e90:	0f 84 aa 00 00 00    	je     f40 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     e96:	83 fa 73             	cmp    $0x73,%edx
     e99:	0f 84 e9 00 00 00    	je     f88 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     e9f:	83 fa 63             	cmp    $0x63,%edx
     ea2:	0f 84 2b 01 00 00    	je     fd3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     ea8:	83 fa 25             	cmp    $0x25,%edx
     eab:	0f 84 4f 01 00 00    	je     1000 <printf+0x1f0>
  write(fd, &c, 1);
     eb1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     eb4:	83 c3 01             	add    $0x1,%ebx
     eb7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ebe:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     ebf:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
     ec1:	89 44 24 04          	mov    %eax,0x4(%esp)
     ec5:	89 34 24             	mov    %esi,(%esp)
     ec8:	89 55 d0             	mov    %edx,-0x30(%ebp)
     ecb:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
     ecf:	e8 ae fd ff ff       	call   c82 <write>
        putc(fd, c);
     ed4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
     ed7:	8d 45 e7             	lea    -0x19(%ebp),%eax
     eda:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ee1:	00 
     ee2:	89 44 24 04          	mov    %eax,0x4(%esp)
     ee6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
     ee9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
     eec:	e8 91 fd ff ff       	call   c82 <write>
  for(i = 0; fmt[i]; i++){
     ef1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
     ef5:	84 d2                	test   %dl,%dl
     ef7:	0f 85 6d ff ff ff    	jne    e6a <printf+0x5a>
     efd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
     f00:	83 c4 3c             	add    $0x3c,%esp
     f03:	5b                   	pop    %ebx
     f04:	5e                   	pop    %esi
     f05:	5f                   	pop    %edi
     f06:	5d                   	pop    %ebp
     f07:	c3                   	ret    
        state = '%';
     f08:	bf 25 00 00 00       	mov    $0x25,%edi
     f0d:	e9 49 ff ff ff       	jmp    e5b <printf+0x4b>
     f12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
     f18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f1f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
     f24:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
     f27:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
     f29:	8b 10                	mov    (%eax),%edx
     f2b:	89 f0                	mov    %esi,%eax
     f2d:	e8 3e fe ff ff       	call   d70 <printint>
        ap++;
     f32:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
     f36:	e9 20 ff ff ff       	jmp    e5b <printf+0x4b>
     f3b:	90                   	nop
     f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
     f40:	8d 45 e1             	lea    -0x1f(%ebp),%eax
     f43:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f4a:	00 
     f4b:	89 44 24 04          	mov    %eax,0x4(%esp)
     f4f:	89 34 24             	mov    %esi,(%esp)
     f52:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
     f56:	e8 27 fd ff ff       	call   c82 <write>
     f5b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     f5e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f65:	00 
     f66:	89 44 24 04          	mov    %eax,0x4(%esp)
     f6a:	89 34 24             	mov    %esi,(%esp)
     f6d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
     f71:	e8 0c fd ff ff       	call   c82 <write>
        printint(fd, *ap, 16, 0);
     f76:	b9 10 00 00 00       	mov    $0x10,%ecx
     f7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f82:	eb a0                	jmp    f24 <printf+0x114>
     f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     f88:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
     f8b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
     f8f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
     f91:	b8 00 15 00 00       	mov    $0x1500,%eax
     f96:	85 ff                	test   %edi,%edi
     f98:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
     f9b:	0f b6 07             	movzbl (%edi),%eax
     f9e:	84 c0                	test   %al,%al
     fa0:	74 2a                	je     fcc <printf+0x1bc>
     fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fa8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
     fab:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
     fae:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
     fb1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     fb8:	00 
     fb9:	89 44 24 04          	mov    %eax,0x4(%esp)
     fbd:	89 34 24             	mov    %esi,(%esp)
     fc0:	e8 bd fc ff ff       	call   c82 <write>
        while(*s != 0){
     fc5:	0f b6 07             	movzbl (%edi),%eax
     fc8:	84 c0                	test   %al,%al
     fca:	75 dc                	jne    fa8 <printf+0x198>
      state = 0;
     fcc:	31 ff                	xor    %edi,%edi
     fce:	e9 88 fe ff ff       	jmp    e5b <printf+0x4b>
        putc(fd, *ap);
     fd3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
     fd6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
     fd8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
     fda:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     fe1:	00 
     fe2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
     fe5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
     fe8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     feb:	89 44 24 04          	mov    %eax,0x4(%esp)
     fef:	e8 8e fc ff ff       	call   c82 <write>
        ap++;
     ff4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
     ff8:	e9 5e fe ff ff       	jmp    e5b <printf+0x4b>
     ffd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1000:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    1003:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1005:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    100c:	00 
    100d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1011:	89 34 24             	mov    %esi,(%esp)
    1014:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1018:	e8 65 fc ff ff       	call   c82 <write>
    101d:	e9 39 fe ff ff       	jmp    e5b <printf+0x4b>
    1022:	66 90                	xchg   %ax,%ax
    1024:	66 90                	xchg   %ax,%ax
    1026:	66 90                	xchg   %ax,%ax
    1028:	66 90                	xchg   %ax,%ax
    102a:	66 90                	xchg   %ax,%ax
    102c:	66 90                	xchg   %ax,%ax
    102e:	66 90                	xchg   %ax,%ax

00001030 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1030:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1031:	a1 c0 19 00 00       	mov    0x19c0,%eax
{
    1036:	89 e5                	mov    %esp,%ebp
    1038:	57                   	push   %edi
    1039:	56                   	push   %esi
    103a:	53                   	push   %ebx
    103b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    103e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1040:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1043:	39 d0                	cmp    %edx,%eax
    1045:	72 11                	jb     1058 <free+0x28>
    1047:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1048:	39 c8                	cmp    %ecx,%eax
    104a:	72 04                	jb     1050 <free+0x20>
    104c:	39 ca                	cmp    %ecx,%edx
    104e:	72 10                	jb     1060 <free+0x30>
    1050:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1052:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1054:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1056:	73 f0                	jae    1048 <free+0x18>
    1058:	39 ca                	cmp    %ecx,%edx
    105a:	72 04                	jb     1060 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    105c:	39 c8                	cmp    %ecx,%eax
    105e:	72 f0                	jb     1050 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1060:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1063:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1066:	39 cf                	cmp    %ecx,%edi
    1068:	74 1e                	je     1088 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    106a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    106d:	8b 48 04             	mov    0x4(%eax),%ecx
    1070:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1073:	39 f2                	cmp    %esi,%edx
    1075:	74 28                	je     109f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1077:	89 10                	mov    %edx,(%eax)
  freep = p;
    1079:	a3 c0 19 00 00       	mov    %eax,0x19c0
}
    107e:	5b                   	pop    %ebx
    107f:	5e                   	pop    %esi
    1080:	5f                   	pop    %edi
    1081:	5d                   	pop    %ebp
    1082:	c3                   	ret    
    1083:	90                   	nop
    1084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1088:	03 71 04             	add    0x4(%ecx),%esi
    108b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    108e:	8b 08                	mov    (%eax),%ecx
    1090:	8b 09                	mov    (%ecx),%ecx
    1092:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1095:	8b 48 04             	mov    0x4(%eax),%ecx
    1098:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    109b:	39 f2                	cmp    %esi,%edx
    109d:	75 d8                	jne    1077 <free+0x47>
    p->s.size += bp->s.size;
    109f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    10a2:	a3 c0 19 00 00       	mov    %eax,0x19c0
    p->s.size += bp->s.size;
    10a7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    10aa:	8b 53 f8             	mov    -0x8(%ebx),%edx
    10ad:	89 10                	mov    %edx,(%eax)
}
    10af:	5b                   	pop    %ebx
    10b0:	5e                   	pop    %esi
    10b1:	5f                   	pop    %edi
    10b2:	5d                   	pop    %ebp
    10b3:	c3                   	ret    
    10b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	53                   	push   %ebx
    10c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    10cc:	8b 1d c0 19 00 00    	mov    0x19c0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10d2:	8d 48 07             	lea    0x7(%eax),%ecx
    10d5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    10d8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10da:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    10dd:	0f 84 9b 00 00 00    	je     117e <malloc+0xbe>
    10e3:	8b 13                	mov    (%ebx),%edx
    10e5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    10e8:	39 fe                	cmp    %edi,%esi
    10ea:	76 64                	jbe    1150 <malloc+0x90>
    10ec:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    10f3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    10f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    10fb:	eb 0e                	jmp    110b <malloc+0x4b>
    10fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1100:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1102:	8b 78 04             	mov    0x4(%eax),%edi
    1105:	39 fe                	cmp    %edi,%esi
    1107:	76 4f                	jbe    1158 <malloc+0x98>
    1109:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    110b:	3b 15 c0 19 00 00    	cmp    0x19c0,%edx
    1111:	75 ed                	jne    1100 <malloc+0x40>
  if(nu < 4096)
    1113:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1116:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    111c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1121:	0f 43 fe             	cmovae %esi,%edi
    1124:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    1127:	89 04 24             	mov    %eax,(%esp)
    112a:	e8 bb fb ff ff       	call   cea <sbrk>
  if(p == (char*)-1)
    112f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1132:	74 18                	je     114c <malloc+0x8c>
  hp->s.size = nu;
    1134:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1137:	83 c0 08             	add    $0x8,%eax
    113a:	89 04 24             	mov    %eax,(%esp)
    113d:	e8 ee fe ff ff       	call   1030 <free>
  return freep;
    1142:	8b 15 c0 19 00 00    	mov    0x19c0,%edx
      if((p = morecore(nunits)) == 0)
    1148:	85 d2                	test   %edx,%edx
    114a:	75 b4                	jne    1100 <malloc+0x40>
        return 0;
    114c:	31 c0                	xor    %eax,%eax
    114e:	eb 20                	jmp    1170 <malloc+0xb0>
    if(p->s.size >= nunits){
    1150:	89 d0                	mov    %edx,%eax
    1152:	89 da                	mov    %ebx,%edx
    1154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1158:	39 fe                	cmp    %edi,%esi
    115a:	74 1c                	je     1178 <malloc+0xb8>
        p->s.size -= nunits;
    115c:	29 f7                	sub    %esi,%edi
    115e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1161:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1164:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1167:	89 15 c0 19 00 00    	mov    %edx,0x19c0
      return (void*)(p + 1);
    116d:	83 c0 08             	add    $0x8,%eax
  }
}
    1170:	83 c4 1c             	add    $0x1c,%esp
    1173:	5b                   	pop    %ebx
    1174:	5e                   	pop    %esi
    1175:	5f                   	pop    %edi
    1176:	5d                   	pop    %ebp
    1177:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1178:	8b 08                	mov    (%eax),%ecx
    117a:	89 0a                	mov    %ecx,(%edx)
    117c:	eb e9                	jmp    1167 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    117e:	c7 05 c0 19 00 00 c4 	movl   $0x19c4,0x19c0
    1185:	19 00 00 
    base.s.size = 0;
    1188:	ba c4 19 00 00       	mov    $0x19c4,%edx
    base.s.ptr = freep = prevp = &base;
    118d:	c7 05 c4 19 00 00 c4 	movl   $0x19c4,0x19c4
    1194:	19 00 00 
    base.s.size = 0;
    1197:	c7 05 c8 19 00 00 00 	movl   $0x0,0x19c8
    119e:	00 00 00 
    11a1:	e9 46 ff ff ff       	jmp    10ec <malloc+0x2c>
    11a6:	66 90                	xchg   %ax,%ax
    11a8:	66 90                	xchg   %ax,%ax
    11aa:	66 90                	xchg   %ax,%ax
    11ac:	66 90                	xchg   %ax,%ax
    11ae:	66 90                	xchg   %ax,%ax

000011b0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	56                   	push   %esi
    11b4:	53                   	push   %ebx
    11b5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
    11b8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    11bf:	e8 fc fe ff ff       	call   10c0 <malloc>

    if (bt == NULL) {
    11c4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
    11c6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
    11c8:	74 66                	je     1230 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
    11ca:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    11d1:	e8 ea fe ff ff       	call   10c0 <malloc>
    if (bt->bt_stack == NULL) {
    11d6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
    11d8:	89 c3                	mov    %eax,%ebx
    11da:	89 46 08             	mov    %eax,0x8(%esi)
    11dd:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
    11e0:	74 5d                	je     123f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
    11e2:	25 ff 0f 00 00       	and    $0xfff,%eax
    11e7:	75 37                	jne    1220 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
    11e9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
    11ef:	8b 45 10             	mov    0x10(%ebp),%eax
    11f2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    11f6:	89 44 24 04          	mov    %eax,0x4(%esp)
    11fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    11fd:	89 04 24             	mov    %eax,(%esp)
    1200:	e8 25 fb ff ff       	call   d2a <kthread_create>
    if (bt->bid != 0) {
    1205:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
    1207:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
    1209:	74 2d                	je     1238 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
    120b:	8b 45 08             	mov    0x8(%ebp),%eax
    120e:	89 30                	mov    %esi,(%eax)
        result = 0;
    1210:	31 c0                	xor    %eax,%eax
}
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	5b                   	pop    %ebx
    1216:	5e                   	pop    %esi
    1217:	5d                   	pop    %ebp
    1218:	c3                   	ret    
    1219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    1220:	29 c3                	sub    %eax,%ebx
    1222:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    1228:	89 5e 04             	mov    %ebx,0x4(%esi)
    122b:	eb bc                	jmp    11e9 <benny_thread_create+0x39>
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    1230:	8b 1d 04 00 00 00    	mov    0x4,%ebx
    1236:	eb b7                	jmp    11ef <benny_thread_create+0x3f>
    int result = -1;
    1238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    123d:	eb d3                	jmp    1212 <benny_thread_create+0x62>
        free(bt);
    123f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
    1242:	31 f6                	xor    %esi,%esi
        free(bt);
    1244:	e8 e7 fd ff ff       	call   1030 <free>
    1249:	8b 5b 04             	mov    0x4(%ebx),%ebx
    124c:	eb a1                	jmp    11ef <benny_thread_create+0x3f>
    124e:	66 90                	xchg   %ax,%ax

00001250 <benny_thread_bid>:
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    return bt->bid;
    1253:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1256:	5d                   	pop    %ebp
    return bt->bid;
    1257:	8b 00                	mov    (%eax),%eax
}
    1259:	c3                   	ret    
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001260 <benny_thread_join>:
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	83 ec 14             	sub    $0x14,%esp
    1267:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
    126a:	8b 03                	mov    (%ebx),%eax
    126c:	89 04 24             	mov    %eax,(%esp)
    126f:	e8 be fa ff ff       	call   d32 <kthread_join>
    if (retVal == 0) {
    1274:	85 c0                	test   %eax,%eax
    1276:	75 27                	jne    129f <benny_thread_join+0x3f>
        free(bt->mem_stack);
    1278:	8b 53 08             	mov    0x8(%ebx),%edx
    127b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    127e:	89 14 24             	mov    %edx,(%esp)
    1281:	e8 aa fd ff ff       	call   1030 <free>
        bt->bt_stack = bt->mem_stack = NULL;
    1286:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    128d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
    1294:	89 1c 24             	mov    %ebx,(%esp)
    1297:	e8 94 fd ff ff       	call   1030 <free>
    129c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    129f:	83 c4 14             	add    $0x14,%esp
    12a2:	5b                   	pop    %ebx
    12a3:	5d                   	pop    %ebp
    12a4:	c3                   	ret    
    12a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012b0 <benny_thread_exit>:
{
    12b0:	55                   	push   %ebp
    12b1:	89 e5                	mov    %esp,%ebp
}
    12b3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
    12b4:	e9 81 fa ff ff       	jmp    d3a <kthread_exit>
    12b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012c0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
    12c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
    12cc:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
    12d3:	31 c0                	xor    %eax,%eax
    12d5:	5d                   	pop    %ebp
    12d6:	c3                   	ret    
    12d7:	89 f6                	mov    %esi,%esi
    12d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012e0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
    12e0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    12e1:	b8 01 00 00 00       	mov    $0x1,%eax
    12e6:	89 e5                	mov    %esp,%ebp
    12e8:	56                   	push   %esi
    12e9:	53                   	push   %ebx
    12ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
    12ed:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
    12f0:	85 c0                	test   %eax,%eax
    12f2:	be 01 00 00 00       	mov    $0x1,%esi
    12f7:	74 15                	je     130e <benny_mootex_yieldlock+0x2e>
    12f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
    1300:	e8 45 fa ff ff       	call   d4a <kthread_yield>
    1305:	89 f0                	mov    %esi,%eax
    1307:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
    130a:	85 c0                	test   %eax,%eax
    130c:	75 f2                	jne    1300 <benny_mootex_yieldlock+0x20>
    return kthread_self();
    130e:	e8 2f fa ff ff       	call   d42 <kthread_self>
    benny_mootex->bid = benny_self();
    1313:	89 43 04             	mov    %eax,0x4(%ebx)
}
    1316:	31 c0                	xor    %eax,%eax
    1318:	5b                   	pop    %ebx
    1319:	5e                   	pop    %esi
    131a:	5d                   	pop    %ebp
    131b:	c3                   	ret    
    131c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001320 <benny_mootex_spinlock>:
{
    1320:	55                   	push   %ebp
    1321:	ba 01 00 00 00       	mov    $0x1,%edx
    1326:	89 e5                	mov    %esp,%ebp
    1328:	53                   	push   %ebx
    1329:	83 ec 04             	sub    $0x4,%esp
    132c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    132f:	90                   	nop
    1330:	89 d0                	mov    %edx,%eax
    1332:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
    1335:	85 c0                	test   %eax,%eax
    1337:	75 f7                	jne    1330 <benny_mootex_spinlock+0x10>
    return kthread_self();
    1339:	e8 04 fa ff ff       	call   d42 <kthread_self>
    benny_mootex->bid = benny_self();
    133e:	89 43 04             	mov    %eax,0x4(%ebx)
}
    1341:	83 c4 04             	add    $0x4,%esp
    1344:	31 c0                	xor    %eax,%eax
    1346:	5b                   	pop    %ebx
    1347:	5d                   	pop    %ebp
    1348:	c3                   	ret    
    1349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001350 <benny_mootex_unlock>:
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	53                   	push   %ebx
    1354:	83 ec 04             	sub    $0x4,%esp
    1357:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
    135a:	e8 e3 f9 ff ff       	call   d42 <kthread_self>
    if(tid == benny_mootex->bid){
    135f:	39 43 04             	cmp    %eax,0x4(%ebx)
    1362:	75 1c                	jne    1380 <benny_mootex_unlock+0x30>
      __sync_synchronize();
    1364:	0f ae f0             	mfence 
    return 0;
    1367:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
    1369:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
    1370:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
    1376:	83 c4 04             	add    $0x4,%esp
    1379:	5b                   	pop    %ebx
    137a:	5d                   	pop    %ebp
    137b:	c3                   	ret    
    137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1380:	83 c4 04             	add    $0x4,%esp
      return -1;
    1383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1388:	5b                   	pop    %ebx
    1389:	5d                   	pop    %ebp
    138a:	c3                   	ret    
    138b:	90                   	nop
    138c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001390 <benny_mootex_trylock>:
{
    1390:	55                   	push   %ebp
    1391:	b8 01 00 00 00       	mov    $0x1,%eax
    1396:	89 e5                	mov    %esp,%ebp
    1398:	53                   	push   %ebx
    1399:	83 ec 04             	sub    $0x4,%esp
    139c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    139f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
    13a2:	85 c0                	test   %eax,%eax
    13a4:	75 08                	jne    13ae <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
    13a6:	e8 97 f9 ff ff       	call   d42 <kthread_self>
        benny_mootex->bid = tid;
    13ab:	89 43 04             	mov    %eax,0x4(%ebx)
}
    13ae:	83 c4 04             	add    $0x4,%esp
    13b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    13b6:	5b                   	pop    %ebx
    13b7:	5d                   	pop    %ebp
    13b8:	c3                   	ret    
    13b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013c0 <benny_mootex_wholock>:
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
    13c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    13c6:	5d                   	pop    %ebp
    return benny_mootex->bid;
    13c7:	8b 40 04             	mov    0x4(%eax),%eax
}
    13ca:	c3                   	ret    
    13cb:	90                   	nop
    13cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013d0 <benny_mootex_islocked>:
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
    13d3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    13d6:	5d                   	pop    %ebp
    return benny_mootex->locked;
    13d7:	8b 00                	mov    (%eax),%eax
}
    13d9:	c3                   	ret    
    13da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013e0 <benny_self>:
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
}
    13e3:	5d                   	pop    %ebp
    return kthread_self();
    13e4:	e9 59 f9 ff ff       	jmp    d42 <kthread_self>
    13e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013f0 <benny_yield>:
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    
}
    13f3:	5d                   	pop    %ebp
    return kthread_yield();
    13f4:	e9 51 f9 ff ff       	jmp    d4a <kthread_yield>
    13f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001400 <benny_cpu_count>:

int
benny_cpu_count(void)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
    1403:	5d                   	pop    %ebp
    return kthread_cpu_count();
    1404:	e9 49 f9 ff ff       	jmp    d52 <kthread_cpu_count>
    1409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001410 <benny_thread_count>:

int
benny_thread_count(void)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
    1413:	5d                   	pop    %ebp
    return kthread_thread_count();
    1414:	e9 41 f9 ff ff       	jmp    d5a <kthread_thread_count>
