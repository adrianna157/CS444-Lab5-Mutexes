
_ltst6:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
#ifdef BENNY_MOOTEX
    benny_thread_t bt;
    int ncpus = benny_cpu_count();
   9:	e8 02 0d 00 00       	call   d10 <benny_cpu_count>
    int rez = -1;
    int bid = -1;

    if (ncpus < 2) {
   e:	83 f8 01             	cmp    $0x1,%eax
  11:	0f 8e ba 00 00 00    	jle    d1 <main+0xd1>
        printf(1, "this is more interesting with more than 1 cpu\n");
    }
    global = 0;
    rez = benny_mootex_islocked(&mootex);
  17:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
    global = 0;
  1e:	c7 05 60 13 00 00 00 	movl   $0x0,0x1360
  25:	00 00 00 
    rez = benny_mootex_islocked(&mootex);
  28:	e8 b3 0c 00 00       	call   ce0 <benny_mootex_islocked>
    assert(rez == FALSE);
  2d:	85 c0                	test   %eax,%eax
  2f:	0f 85 88 00 00 00    	jne    bd <main+0xbd>
    printf(1, "<< %d  lock state: %s\n", __LINE__, rez > 0 ? "locked" : "unlocked");
  35:	c7 44 24 0c 2c 0d 00 	movl   $0xd2c,0xc(%esp)
  3c:	00 
  3d:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
  44:	00 
  45:	c7 44 24 04 b9 0d 00 	movl   $0xdb9,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 c7 06 00 00       	call   720 <printf>

    rez = benny_mootex_spinlock(&mootex);
  59:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
  60:	e8 cb 0b 00 00       	call   c30 <benny_mootex_spinlock>
    assert(rez == 0);
  65:	85 c0                	test   %eax,%eax
  67:	74 29                	je     92 <main+0x92>
  69:	c7 44 24 0c 49 00 00 	movl   $0x49,0xc(%esp)
  70:	00 
  71:	c7 44 24 08 67 0d 00 	movl   $0xd67,0x8(%esp)
  78:	00 
  79:	c7 44 24 04 fc 0d 00 	movl   $0xdfc,0x4(%esp)
  80:	00 
  81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  88:	e8 93 06 00 00       	call   720 <printf>
  8d:	e8 e0 04 00 00       	call   572 <exit>
    bid = benny_mootex_wholock(&mootex);
  92:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
  99:	e8 32 0c 00 00       	call   cd0 <benny_mootex_wholock>
    assert(bid == 0);
  9e:	85 c0                	test   %eax,%eax
  a0:	75 25                	jne    c7 <main+0xc7>

    rez = benny_mootex_islocked(&mootex);
  a2:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
  a9:	e8 32 0c 00 00       	call   ce0 <benny_mootex_islocked>
    assert(rez == TRUE);
  ae:	83 e8 01             	sub    $0x1,%eax
  b1:	74 37                	je     ea <main+0xea>
  b3:	c7 44 24 0c 4e 00 00 	movl   $0x4e,0xc(%esp)
  ba:	00 
  bb:	eb b4                	jmp    71 <main+0x71>
    assert(rez == FALSE);
  bd:	c7 44 24 0c 45 00 00 	movl   $0x45,0xc(%esp)
  c4:	00 
  c5:	eb aa                	jmp    71 <main+0x71>
    assert(bid == 0);
  c7:	c7 44 24 0c 4b 00 00 	movl   $0x4b,0xc(%esp)
  ce:	00 
  cf:	eb a0                	jmp    71 <main+0x71>
        printf(1, "this is more interesting with more than 1 cpu\n");
  d1:	c7 44 24 04 44 0e 00 	movl   $0xe44,0x4(%esp)
  d8:	00 
  d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e0:	e8 3b 06 00 00       	call   720 <printf>
  e5:	e9 2d ff ff ff       	jmp    17 <main+0x17>
    printf(1, "<< %d  lock state: %s\n", __LINE__, rez > 0 ? "locked" : "unlocked");
  ea:	c7 44 24 0c 2e 0d 00 	movl   $0xd2e,0xc(%esp)
  f1:	00 
  f2:	c7 44 24 08 4f 00 00 	movl   $0x4f,0x8(%esp)
  f9:	00 
  fa:	c7 44 24 04 b9 0d 00 	movl   $0xdb9,0x4(%esp)
 101:	00 
 102:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 109:	e8 12 06 00 00       	call   720 <printf>
    printf(1, "<< main acquires lock\n");
 10e:	c7 44 24 04 d0 0d 00 	movl   $0xdd0,0x4(%esp)
 115:	00 
 116:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 11d:	e8 fe 05 00 00       	call   720 <printf>
    benny_thread_create(&bt, func1, (void *) NULL);
 122:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 126:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 12d:	00 
 12e:	c7 44 24 04 90 01 00 	movl   $0x190,0x4(%esp)
 135:	00 
 136:	89 04 24             	mov    %eax,(%esp)
 139:	e8 82 09 00 00       	call   ac0 <benny_thread_create>

        for (i = 0; i < ITERATIONS; i++) {
            global++;
        }
    }
    benny_thread_join(bt);
 13e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 142:	81 05 60 13 00 00 80 	addl   $0x989680,0x1360
 149:	96 98 00 
 14c:	89 04 24             	mov    %eax,(%esp)
 14f:	e8 1c 0a 00 00       	call   b70 <benny_thread_join>

    printf(1, "<< \tpithy comment\n");
 154:	c7 44 24 04 e7 0d 00 	movl   $0xde7,0x4(%esp)
 15b:	00 
 15c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 163:	e8 b8 05 00 00       	call   720 <printf>

    printf(1, "<< \tglobal value after all is done: %d\n", global);
 168:	a1 60 13 00 00       	mov    0x1360,%eax
 16d:	c7 44 24 04 74 0e 00 	movl   $0xe74,0x4(%esp)
 174:	00 
 175:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 17c:	89 44 24 08          	mov    %eax,0x8(%esp)
 180:	e8 9b 05 00 00       	call   720 <printf>

#endif // BENNY_MOOTEX
    exit();
 185:	e8 e8 03 00 00       	call   572 <exit>
 18a:	66 90                	xchg   %ax,%ax
 18c:	66 90                	xchg   %ax,%ax
 18e:	66 90                	xchg   %ax,%ax

00000190 <func1>:
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	83 ec 24             	sub    $0x24,%esp
    printf(1, ">> thread starting\n");
 197:	c7 44 24 04 35 0d 00 	movl   $0xd35,0x4(%esp)
 19e:	00 
 19f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a6:	e8 75 05 00 00       	call   720 <printf>
    rez = benny_mootex_islocked(&mootex);
 1ab:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
 1b2:	e8 29 0b 00 00       	call   ce0 <benny_mootex_islocked>
    printf(1, ">> thread %d  lock state: %s\n", __LINE__, rez > 0 ? "locked" : "unlocked");
 1b7:	ba 2e 0d 00 00       	mov    $0xd2e,%edx
 1bc:	c7 44 24 08 19 00 00 	movl   $0x19,0x8(%esp)
 1c3:	00 
 1c4:	c7 44 24 04 49 0d 00 	movl   $0xd49,0x4(%esp)
 1cb:	00 
 1cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d3:	85 c0                	test   %eax,%eax
 1d5:	b8 2c 0d 00 00       	mov    $0xd2c,%eax
 1da:	0f 4e d0             	cmovle %eax,%edx
 1dd:	89 54 24 0c          	mov    %edx,0xc(%esp)
 1e1:	e8 3a 05 00 00       	call   720 <printf>
    bid = benny_mootex_wholock(&mootex);
 1e6:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
 1ed:	e8 de 0a 00 00       	call   cd0 <benny_mootex_wholock>
    assert(bid == 0);
 1f2:	85 c0                	test   %eax,%eax
 1f4:	0f 85 f9 00 00 00    	jne    2f3 <func1+0x163>
    rez = benny_mootex_trylock(&mootex);
 1fa:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
 201:	e8 9a 0a 00 00       	call   ca0 <benny_mootex_trylock>
    if (rez < 0) {
 206:	85 c0                	test   %eax,%eax
    rez = benny_mootex_trylock(&mootex);
 208:	89 c3                	mov    %eax,%ebx
    if (rez < 0) {
 20a:	78 64                	js     270 <func1+0xe0>
        bid = benny_mootex_wholock(&mootex);
 20c:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
 213:	e8 b8 0a 00 00       	call   cd0 <benny_mootex_wholock>
        assert(bid == 0);
 218:	85 c0                	test   %eax,%eax
 21a:	0f 85 fc 00 00 00    	jne    31c <func1+0x18c>
        printf(1, ">> %s %d: try lock succeeded %d\n", __FUNCTION__, __LINE__, rez);
 220:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 224:	c7 44 24 0c 2e 00 00 	movl   $0x2e,0xc(%esp)
 22b:	00 
 22c:	c7 44 24 08 9c 0e 00 	movl   $0xe9c,0x8(%esp)
 233:	00 
 234:	c7 44 24 04 20 0e 00 	movl   $0xe20,0x4(%esp)
 23b:	00 
 23c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 243:	e8 d8 04 00 00       	call   720 <printf>
    printf(1, ">> thread done\n");
 248:	c7 44 24 04 a9 0d 00 	movl   $0xda9,0x4(%esp)
 24f:	00 
 250:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 257:	e8 c4 04 00 00       	call   720 <printf>
    benny_thread_exit(0);
 25c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
 263:	83 c4 24             	add    $0x24,%esp
 266:	5b                   	pop    %ebx
 267:	5d                   	pop    %ebp
    benny_thread_exit(0);
 268:	e9 53 09 00 00       	jmp    bc0 <benny_thread_exit>
 26d:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1, ">> %s %d: try lock failed %d\n", __FUNCTION__, __LINE__, rez);
 270:	89 44 24 10          	mov    %eax,0x10(%esp)
 274:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
 27b:	00 
 27c:	c7 44 24 08 9c 0e 00 	movl   $0xe9c,0x8(%esp)
 283:	00 
 284:	c7 44 24 04 6f 0d 00 	movl   $0xd6f,0x4(%esp)
 28b:	00 
 28c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 293:	e8 88 04 00 00       	call   720 <printf>
        assert(rez == -1);
 298:	83 fb ff             	cmp    $0xffffffff,%ebx
 29b:	0f 85 85 00 00 00    	jne    326 <func1+0x196>
        rez = benny_mootex_unlock(&mootex);
 2a1:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
 2a8:	e8 b3 09 00 00       	call   c60 <benny_mootex_unlock>
        assert(rez == -1);
 2ad:	83 f8 ff             	cmp    $0xffffffff,%eax
 2b0:	75 7e                	jne    330 <func1+0x1a0>
        bid = benny_mootex_wholock(&mootex);
 2b2:	c7 04 24 58 13 00 00 	movl   $0x1358,(%esp)
 2b9:	e8 12 0a 00 00       	call   cd0 <benny_mootex_wholock>
        assert(bid == 0);
 2be:	85 c0                	test   %eax,%eax
 2c0:	75 78                	jne    33a <func1+0x1aa>
            printf(1, ">> %s %d: unlock failed %d\n", __FUNCTION__, __LINE__, rez);
 2c2:	c7 44 24 10 ff ff ff 	movl   $0xffffffff,0x10(%esp)
 2c9:	ff 
 2ca:	c7 44 24 0c 25 00 00 	movl   $0x25,0xc(%esp)
 2d1:	00 
 2d2:	c7 44 24 08 9c 0e 00 	movl   $0xe9c,0x8(%esp)
 2d9:	00 
 2da:	c7 44 24 04 8d 0d 00 	movl   $0xd8d,0x4(%esp)
 2e1:	00 
 2e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e9:	e8 32 04 00 00       	call   720 <printf>
 2ee:	e9 55 ff ff ff       	jmp    248 <func1+0xb8>
    assert(bid == 0);
 2f3:	c7 44 24 0c 1b 00 00 	movl   $0x1b,0xc(%esp)
 2fa:	00 
        assert(rez == -1);
 2fb:	c7 44 24 08 67 0d 00 	movl   $0xd67,0x8(%esp)
 302:	00 
 303:	c7 44 24 04 fc 0d 00 	movl   $0xdfc,0x4(%esp)
 30a:	00 
 30b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 312:	e8 09 04 00 00       	call   720 <printf>
 317:	e8 56 02 00 00       	call   572 <exit>
        assert(bid == 0);
 31c:	c7 44 24 0c 2d 00 00 	movl   $0x2d,0xc(%esp)
 323:	00 
 324:	eb d5                	jmp    2fb <func1+0x16b>
        assert(rez == -1);
 326:	c7 44 24 0c 1f 00 00 	movl   $0x1f,0xc(%esp)
 32d:	00 
 32e:	eb cb                	jmp    2fb <func1+0x16b>
        assert(rez == -1);
 330:	c7 44 24 0c 21 00 00 	movl   $0x21,0xc(%esp)
 337:	00 
 338:	eb c1                	jmp    2fb <func1+0x16b>
        assert(bid == 0);
 33a:	c7 44 24 0c 23 00 00 	movl   $0x23,0xc(%esp)
 341:	00 
 342:	eb b7                	jmp    2fb <func1+0x16b>
 344:	66 90                	xchg   %ax,%ax
 346:	66 90                	xchg   %ax,%ax
 348:	66 90                	xchg   %ax,%ax
 34a:	66 90                	xchg   %ax,%ax
 34c:	66 90                	xchg   %ax,%ax
 34e:	66 90                	xchg   %ax,%ax

00000350 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 359:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 35a:	89 c2                	mov    %eax,%edx
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 360:	83 c1 01             	add    $0x1,%ecx
 363:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 367:	83 c2 01             	add    $0x1,%edx
 36a:	84 db                	test   %bl,%bl
 36c:	88 5a ff             	mov    %bl,-0x1(%edx)
 36f:	75 ef                	jne    360 <strcpy+0x10>
    ;
  return os;
}
 371:	5b                   	pop    %ebx
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    
 374:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 37a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	8b 55 08             	mov    0x8(%ebp),%edx
 386:	53                   	push   %ebx
 387:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 38a:	0f b6 02             	movzbl (%edx),%eax
 38d:	84 c0                	test   %al,%al
 38f:	74 2d                	je     3be <strcmp+0x3e>
 391:	0f b6 19             	movzbl (%ecx),%ebx
 394:	38 d8                	cmp    %bl,%al
 396:	74 0e                	je     3a6 <strcmp+0x26>
 398:	eb 2b                	jmp    3c5 <strcmp+0x45>
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3a0:	38 c8                	cmp    %cl,%al
 3a2:	75 15                	jne    3b9 <strcmp+0x39>
    p++, q++;
 3a4:	89 d9                	mov    %ebx,%ecx
 3a6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3a9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3ac:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 3af:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 3b3:	84 c0                	test   %al,%al
 3b5:	75 e9                	jne    3a0 <strcmp+0x20>
 3b7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b9:	29 c8                	sub    %ecx,%eax
}
 3bb:	5b                   	pop    %ebx
 3bc:	5d                   	pop    %ebp
 3bd:	c3                   	ret    
 3be:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 3c1:	31 c0                	xor    %eax,%eax
 3c3:	eb f4                	jmp    3b9 <strcmp+0x39>
 3c5:	0f b6 cb             	movzbl %bl,%ecx
 3c8:	eb ef                	jmp    3b9 <strcmp+0x39>
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003d0 <strlen>:

uint
strlen(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3d6:	80 39 00             	cmpb   $0x0,(%ecx)
 3d9:	74 12                	je     3ed <strlen+0x1d>
 3db:	31 d2                	xor    %edx,%edx
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3e7:	89 d0                	mov    %edx,%eax
 3e9:	75 f5                	jne    3e0 <strlen+0x10>
    ;
  return n;
}
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
  for(n = 0; s[n]; n++)
 3ed:	31 c0                	xor    %eax,%eax
}
 3ef:	5d                   	pop    %ebp
 3f0:	c3                   	ret    
 3f1:	eb 0d                	jmp    400 <memset>
 3f3:	90                   	nop
 3f4:	90                   	nop
 3f5:	90                   	nop
 3f6:	90                   	nop
 3f7:	90                   	nop
 3f8:	90                   	nop
 3f9:	90                   	nop
 3fa:	90                   	nop
 3fb:	90                   	nop
 3fc:	90                   	nop
 3fd:	90                   	nop
 3fe:	90                   	nop
 3ff:	90                   	nop

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 55 08             	mov    0x8(%ebp),%edx
 406:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld    
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	89 d0                	mov    %edx,%eax
 414:	5f                   	pop    %edi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	53                   	push   %ebx
 427:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 42a:	0f b6 18             	movzbl (%eax),%ebx
 42d:	84 db                	test   %bl,%bl
 42f:	74 1d                	je     44e <strchr+0x2e>
    if(*s == c)
 431:	38 d3                	cmp    %dl,%bl
 433:	89 d1                	mov    %edx,%ecx
 435:	75 0d                	jne    444 <strchr+0x24>
 437:	eb 17                	jmp    450 <strchr+0x30>
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 440:	38 ca                	cmp    %cl,%dl
 442:	74 0c                	je     450 <strchr+0x30>
  for(; *s; s++)
 444:	83 c0 01             	add    $0x1,%eax
 447:	0f b6 10             	movzbl (%eax),%edx
 44a:	84 d2                	test   %dl,%dl
 44c:	75 f2                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
 44e:	31 c0                	xor    %eax,%eax
}
 450:	5b                   	pop    %ebx
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    
 453:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 465:	31 f6                	xor    %esi,%esi
{
 467:	53                   	push   %ebx
 468:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 46b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 46e:	eb 31                	jmp    4a1 <gets+0x41>
    cc = read(0, &c, 1);
 470:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 477:	00 
 478:	89 7c 24 04          	mov    %edi,0x4(%esp)
 47c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 483:	e8 02 01 00 00       	call   58a <read>
    if(cc < 1)
 488:	85 c0                	test   %eax,%eax
 48a:	7e 1d                	jle    4a9 <gets+0x49>
      break;
    buf[i++] = c;
 48c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 490:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 492:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 495:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 497:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 49b:	74 0c                	je     4a9 <gets+0x49>
 49d:	3c 0a                	cmp    $0xa,%al
 49f:	74 08                	je     4a9 <gets+0x49>
  for(i=0; i+1 < max; ){
 4a1:	8d 5e 01             	lea    0x1(%esi),%ebx
 4a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a7:	7c c7                	jl     470 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ac:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 4b0:	83 c4 2c             	add    $0x2c,%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
 4b8:	90                   	nop
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
 4c5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4d2:	00 
 4d3:	89 04 24             	mov    %eax,(%esp)
 4d6:	e8 d7 00 00 00       	call   5b2 <open>
  if(fd < 0)
 4db:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 4dd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 4df:	78 27                	js     508 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e4:	89 1c 24             	mov    %ebx,(%esp)
 4e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4eb:	e8 da 00 00 00       	call   5ca <fstat>
  close(fd);
 4f0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4f3:	89 c6                	mov    %eax,%esi
  close(fd);
 4f5:	e8 a0 00 00 00       	call   59a <close>
  return r;
 4fa:	89 f0                	mov    %esi,%eax
}
 4fc:	83 c4 10             	add    $0x10,%esp
 4ff:	5b                   	pop    %ebx
 500:	5e                   	pop    %esi
 501:	5d                   	pop    %ebp
 502:	c3                   	ret    
 503:	90                   	nop
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 508:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50d:	eb ed                	jmp    4fc <stat+0x3c>
 50f:	90                   	nop

00000510 <atoi>:

int
atoi(const char *s)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	8b 4d 08             	mov    0x8(%ebp),%ecx
 516:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 517:	0f be 11             	movsbl (%ecx),%edx
 51a:	8d 42 d0             	lea    -0x30(%edx),%eax
 51d:	3c 09                	cmp    $0x9,%al
  n = 0;
 51f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 524:	77 17                	ja     53d <atoi+0x2d>
 526:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 528:	83 c1 01             	add    $0x1,%ecx
 52b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 52e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 532:	0f be 11             	movsbl (%ecx),%edx
 535:	8d 5a d0             	lea    -0x30(%edx),%ebx
 538:	80 fb 09             	cmp    $0x9,%bl
 53b:	76 eb                	jbe    528 <atoi+0x18>
  return n;
}
 53d:	5b                   	pop    %ebx
 53e:	5d                   	pop    %ebp
 53f:	c3                   	ret    

00000540 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 540:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 541:	31 d2                	xor    %edx,%edx
{
 543:	89 e5                	mov    %esp,%ebp
 545:	56                   	push   %esi
 546:	8b 45 08             	mov    0x8(%ebp),%eax
 549:	53                   	push   %ebx
 54a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 54d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 550:	85 db                	test   %ebx,%ebx
 552:	7e 12                	jle    566 <memmove+0x26>
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 558:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 55c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 55f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 562:	39 da                	cmp    %ebx,%edx
 564:	75 f2                	jne    558 <memmove+0x18>
  return vdst;
}
 566:	5b                   	pop    %ebx
 567:	5e                   	pop    %esi
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    

0000056a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 56a:	b8 01 00 00 00       	mov    $0x1,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <exit>:
SYSCALL(exit)
 572:	b8 02 00 00 00       	mov    $0x2,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <wait>:
SYSCALL(wait)
 57a:	b8 03 00 00 00       	mov    $0x3,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <pipe>:
SYSCALL(pipe)
 582:	b8 04 00 00 00       	mov    $0x4,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <read>:
SYSCALL(read)
 58a:	b8 05 00 00 00       	mov    $0x5,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <write>:
SYSCALL(write)
 592:	b8 10 00 00 00       	mov    $0x10,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <close>:
SYSCALL(close)
 59a:	b8 15 00 00 00       	mov    $0x15,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <kill>:
SYSCALL(kill)
 5a2:	b8 06 00 00 00       	mov    $0x6,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <exec>:
SYSCALL(exec)
 5aa:	b8 07 00 00 00       	mov    $0x7,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <open>:
SYSCALL(open)
 5b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <mknod>:
SYSCALL(mknod)
 5ba:	b8 11 00 00 00       	mov    $0x11,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <unlink>:
SYSCALL(unlink)
 5c2:	b8 12 00 00 00       	mov    $0x12,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <fstat>:
SYSCALL(fstat)
 5ca:	b8 08 00 00 00       	mov    $0x8,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <link>:
SYSCALL(link)
 5d2:	b8 13 00 00 00       	mov    $0x13,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <mkdir>:
SYSCALL(mkdir)
 5da:	b8 14 00 00 00       	mov    $0x14,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <chdir>:
SYSCALL(chdir)
 5e2:	b8 09 00 00 00       	mov    $0x9,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <dup>:
SYSCALL(dup)
 5ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <getpid>:
SYSCALL(getpid)
 5f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <sbrk>:
SYSCALL(sbrk)
 5fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <sleep>:
SYSCALL(sleep)
 602:	b8 0d 00 00 00       	mov    $0xd,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <uptime>:
SYSCALL(uptime)
 60a:	b8 0e 00 00 00       	mov    $0xe,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 612:	b8 16 00 00 00       	mov    $0x16,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 61a:	b8 17 00 00 00       	mov    $0x17,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 622:	b8 18 00 00 00       	mov    $0x18,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 62a:	b8 19 00 00 00       	mov    $0x19,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 632:	b8 1a 00 00 00       	mov    $0x1a,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 63a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <kthread_join>:
SYSCALL(kthread_join)
 642:	b8 1c 00 00 00       	mov    $0x1c,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <kthread_exit>:
SYSCALL(kthread_exit)
 64a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 652:	b8 1e 00 00 00       	mov    $0x1e,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <kthread_yield>:
SYSCALL(kthread_yield)
 65a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 662:	b8 20 00 00 00       	mov    $0x20,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 66a:	b8 21 00 00 00       	mov    $0x21,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    
 672:	66 90                	xchg   %ax,%ax
 674:	66 90                	xchg   %ax,%ax
 676:	66 90                	xchg   %ax,%ax
 678:	66 90                	xchg   %ax,%ax
 67a:	66 90                	xchg   %ax,%ax
 67c:	66 90                	xchg   %ax,%ax
 67e:	66 90                	xchg   %ax,%ax

00000680 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	89 c6                	mov    %eax,%esi
 687:	53                   	push   %ebx
 688:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 68b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 68e:	85 db                	test   %ebx,%ebx
 690:	74 09                	je     69b <printint+0x1b>
 692:	89 d0                	mov    %edx,%eax
 694:	c1 e8 1f             	shr    $0x1f,%eax
 697:	84 c0                	test   %al,%al
 699:	75 75                	jne    710 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 69b:	89 d0                	mov    %edx,%eax
  neg = 0;
 69d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6a4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 6a7:	31 ff                	xor    %edi,%edi
 6a9:	89 ce                	mov    %ecx,%esi
 6ab:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6ae:	eb 02                	jmp    6b2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 6b0:	89 cf                	mov    %ecx,%edi
 6b2:	31 d2                	xor    %edx,%edx
 6b4:	f7 f6                	div    %esi
 6b6:	8d 4f 01             	lea    0x1(%edi),%ecx
 6b9:	0f b6 92 a9 0e 00 00 	movzbl 0xea9(%edx),%edx
  }while((x /= base) != 0);
 6c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 6c2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 6c5:	75 e9                	jne    6b0 <printint+0x30>
  if(neg)
 6c7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 6ca:	89 c8                	mov    %ecx,%eax
 6cc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 6cf:	85 d2                	test   %edx,%edx
 6d1:	74 08                	je     6db <printint+0x5b>
    buf[i++] = '-';
 6d3:	8d 4f 02             	lea    0x2(%edi),%ecx
 6d6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 6db:	8d 79 ff             	lea    -0x1(%ecx),%edi
 6de:	66 90                	xchg   %ax,%ax
 6e0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 6e5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 6e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6ef:	00 
 6f0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 6f4:	89 34 24             	mov    %esi,(%esp)
 6f7:	88 45 d7             	mov    %al,-0x29(%ebp)
 6fa:	e8 93 fe ff ff       	call   592 <write>
  while(--i >= 0)
 6ff:	83 ff ff             	cmp    $0xffffffff,%edi
 702:	75 dc                	jne    6e0 <printint+0x60>
    putc(fd, buf[i]);
}
 704:	83 c4 4c             	add    $0x4c,%esp
 707:	5b                   	pop    %ebx
 708:	5e                   	pop    %esi
 709:	5f                   	pop    %edi
 70a:	5d                   	pop    %ebp
 70b:	c3                   	ret    
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 710:	89 d0                	mov    %edx,%eax
 712:	f7 d8                	neg    %eax
    neg = 1;
 714:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 71b:	eb 87                	jmp    6a4 <printint+0x24>
 71d:	8d 76 00             	lea    0x0(%esi),%esi

00000720 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 724:	31 ff                	xor    %edi,%edi
{
 726:	56                   	push   %esi
 727:	53                   	push   %ebx
 728:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 72b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 72e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 731:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 734:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 737:	0f b6 13             	movzbl (%ebx),%edx
 73a:	83 c3 01             	add    $0x1,%ebx
 73d:	84 d2                	test   %dl,%dl
 73f:	75 39                	jne    77a <printf+0x5a>
 741:	e9 ca 00 00 00       	jmp    810 <printf+0xf0>
 746:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 748:	83 fa 25             	cmp    $0x25,%edx
 74b:	0f 84 c7 00 00 00    	je     818 <printf+0xf8>
  write(fd, &c, 1);
 751:	8d 45 e0             	lea    -0x20(%ebp),%eax
 754:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 75b:	00 
 75c:	89 44 24 04          	mov    %eax,0x4(%esp)
 760:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 763:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 766:	e8 27 fe ff ff       	call   592 <write>
 76b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 76e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 772:	84 d2                	test   %dl,%dl
 774:	0f 84 96 00 00 00    	je     810 <printf+0xf0>
    if(state == 0){
 77a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 77c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 77f:	74 c7                	je     748 <printf+0x28>
      }
    } else if(state == '%'){
 781:	83 ff 25             	cmp    $0x25,%edi
 784:	75 e5                	jne    76b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 786:	83 fa 75             	cmp    $0x75,%edx
 789:	0f 84 99 00 00 00    	je     828 <printf+0x108>
 78f:	83 fa 64             	cmp    $0x64,%edx
 792:	0f 84 90 00 00 00    	je     828 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 798:	25 f7 00 00 00       	and    $0xf7,%eax
 79d:	83 f8 70             	cmp    $0x70,%eax
 7a0:	0f 84 aa 00 00 00    	je     850 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7a6:	83 fa 73             	cmp    $0x73,%edx
 7a9:	0f 84 e9 00 00 00    	je     898 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7af:	83 fa 63             	cmp    $0x63,%edx
 7b2:	0f 84 2b 01 00 00    	je     8e3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7b8:	83 fa 25             	cmp    $0x25,%edx
 7bb:	0f 84 4f 01 00 00    	je     910 <printf+0x1f0>
  write(fd, &c, 1);
 7c1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7c4:	83 c3 01             	add    $0x1,%ebx
 7c7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7ce:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7cf:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d5:	89 34 24             	mov    %esi,(%esp)
 7d8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 7db:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 7df:	e8 ae fd ff ff       	call   592 <write>
        putc(fd, c);
 7e4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 7e7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7ea:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7f1:	00 
 7f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 7f9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7fc:	e8 91 fd ff ff       	call   592 <write>
  for(i = 0; fmt[i]; i++){
 801:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 805:	84 d2                	test   %dl,%dl
 807:	0f 85 6d ff ff ff    	jne    77a <printf+0x5a>
 80d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 810:	83 c4 3c             	add    $0x3c,%esp
 813:	5b                   	pop    %ebx
 814:	5e                   	pop    %esi
 815:	5f                   	pop    %edi
 816:	5d                   	pop    %ebp
 817:	c3                   	ret    
        state = '%';
 818:	bf 25 00 00 00       	mov    $0x25,%edi
 81d:	e9 49 ff ff ff       	jmp    76b <printf+0x4b>
 822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 828:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 82f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 834:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 837:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 839:	8b 10                	mov    (%eax),%edx
 83b:	89 f0                	mov    %esi,%eax
 83d:	e8 3e fe ff ff       	call   680 <printint>
        ap++;
 842:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 846:	e9 20 ff ff ff       	jmp    76b <printf+0x4b>
 84b:	90                   	nop
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 850:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 853:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 85a:	00 
 85b:	89 44 24 04          	mov    %eax,0x4(%esp)
 85f:	89 34 24             	mov    %esi,(%esp)
 862:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 866:	e8 27 fd ff ff       	call   592 <write>
 86b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 86e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 875:	00 
 876:	89 44 24 04          	mov    %eax,0x4(%esp)
 87a:	89 34 24             	mov    %esi,(%esp)
 87d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 881:	e8 0c fd ff ff       	call   592 <write>
        printint(fd, *ap, 16, 0);
 886:	b9 10 00 00 00       	mov    $0x10,%ecx
 88b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 892:	eb a0                	jmp    834 <printf+0x114>
 894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 898:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 89b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 89f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 8a1:	b8 a2 0e 00 00       	mov    $0xea2,%eax
 8a6:	85 ff                	test   %edi,%edi
 8a8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 8ab:	0f b6 07             	movzbl (%edi),%eax
 8ae:	84 c0                	test   %al,%al
 8b0:	74 2a                	je     8dc <printf+0x1bc>
 8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8b8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 8bb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 8be:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 8c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8c8:	00 
 8c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8cd:	89 34 24             	mov    %esi,(%esp)
 8d0:	e8 bd fc ff ff       	call   592 <write>
        while(*s != 0){
 8d5:	0f b6 07             	movzbl (%edi),%eax
 8d8:	84 c0                	test   %al,%al
 8da:	75 dc                	jne    8b8 <printf+0x198>
      state = 0;
 8dc:	31 ff                	xor    %edi,%edi
 8de:	e9 88 fe ff ff       	jmp    76b <printf+0x4b>
        putc(fd, *ap);
 8e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 8e6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 8e8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 8ea:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8f1:	00 
 8f2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 8f5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8f8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ff:	e8 8e fc ff ff       	call   592 <write>
        ap++;
 904:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 908:	e9 5e fe ff ff       	jmp    76b <printf+0x4b>
 90d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 910:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 913:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 915:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 91c:	00 
 91d:	89 44 24 04          	mov    %eax,0x4(%esp)
 921:	89 34 24             	mov    %esi,(%esp)
 924:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 928:	e8 65 fc ff ff       	call   592 <write>
 92d:	e9 39 fe ff ff       	jmp    76b <printf+0x4b>
 932:	66 90                	xchg   %ax,%ax
 934:	66 90                	xchg   %ax,%ax
 936:	66 90                	xchg   %ax,%ax
 938:	66 90                	xchg   %ax,%ax
 93a:	66 90                	xchg   %ax,%ax
 93c:	66 90                	xchg   %ax,%ax
 93e:	66 90                	xchg   %ax,%ax

00000940 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 940:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 941:	a1 64 13 00 00       	mov    0x1364,%eax
{
 946:	89 e5                	mov    %esp,%ebp
 948:	57                   	push   %edi
 949:	56                   	push   %esi
 94a:	53                   	push   %ebx
 94b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 950:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 953:	39 d0                	cmp    %edx,%eax
 955:	72 11                	jb     968 <free+0x28>
 957:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 958:	39 c8                	cmp    %ecx,%eax
 95a:	72 04                	jb     960 <free+0x20>
 95c:	39 ca                	cmp    %ecx,%edx
 95e:	72 10                	jb     970 <free+0x30>
 960:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 962:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 966:	73 f0                	jae    958 <free+0x18>
 968:	39 ca                	cmp    %ecx,%edx
 96a:	72 04                	jb     970 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 96c:	39 c8                	cmp    %ecx,%eax
 96e:	72 f0                	jb     960 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 970:	8b 73 fc             	mov    -0x4(%ebx),%esi
 973:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 976:	39 cf                	cmp    %ecx,%edi
 978:	74 1e                	je     998 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 97a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 97d:	8b 48 04             	mov    0x4(%eax),%ecx
 980:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 983:	39 f2                	cmp    %esi,%edx
 985:	74 28                	je     9af <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 987:	89 10                	mov    %edx,(%eax)
  freep = p;
 989:	a3 64 13 00 00       	mov    %eax,0x1364
}
 98e:	5b                   	pop    %ebx
 98f:	5e                   	pop    %esi
 990:	5f                   	pop    %edi
 991:	5d                   	pop    %ebp
 992:	c3                   	ret    
 993:	90                   	nop
 994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 998:	03 71 04             	add    0x4(%ecx),%esi
 99b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 99e:	8b 08                	mov    (%eax),%ecx
 9a0:	8b 09                	mov    (%ecx),%ecx
 9a2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9a5:	8b 48 04             	mov    0x4(%eax),%ecx
 9a8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 9ab:	39 f2                	cmp    %esi,%edx
 9ad:	75 d8                	jne    987 <free+0x47>
    p->s.size += bp->s.size;
 9af:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 9b2:	a3 64 13 00 00       	mov    %eax,0x1364
    p->s.size += bp->s.size;
 9b7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ba:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9bd:	89 10                	mov    %edx,(%eax)
}
 9bf:	5b                   	pop    %ebx
 9c0:	5e                   	pop    %esi
 9c1:	5f                   	pop    %edi
 9c2:	5d                   	pop    %ebp
 9c3:	c3                   	ret    
 9c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 9ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000009d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
 9d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9dc:	8b 1d 64 13 00 00    	mov    0x1364,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e2:	8d 48 07             	lea    0x7(%eax),%ecx
 9e5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 9e8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ea:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 9ed:	0f 84 9b 00 00 00    	je     a8e <malloc+0xbe>
 9f3:	8b 13                	mov    (%ebx),%edx
 9f5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9f8:	39 fe                	cmp    %edi,%esi
 9fa:	76 64                	jbe    a60 <malloc+0x90>
 9fc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 a03:	bb 00 80 00 00       	mov    $0x8000,%ebx
 a08:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a0b:	eb 0e                	jmp    a1b <malloc+0x4b>
 a0d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a10:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a12:	8b 78 04             	mov    0x4(%eax),%edi
 a15:	39 fe                	cmp    %edi,%esi
 a17:	76 4f                	jbe    a68 <malloc+0x98>
 a19:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a1b:	3b 15 64 13 00 00    	cmp    0x1364,%edx
 a21:	75 ed                	jne    a10 <malloc+0x40>
  if(nu < 4096)
 a23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a26:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a2c:	bf 00 10 00 00       	mov    $0x1000,%edi
 a31:	0f 43 fe             	cmovae %esi,%edi
 a34:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 a37:	89 04 24             	mov    %eax,(%esp)
 a3a:	e8 bb fb ff ff       	call   5fa <sbrk>
  if(p == (char*)-1)
 a3f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a42:	74 18                	je     a5c <malloc+0x8c>
  hp->s.size = nu;
 a44:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 a47:	83 c0 08             	add    $0x8,%eax
 a4a:	89 04 24             	mov    %eax,(%esp)
 a4d:	e8 ee fe ff ff       	call   940 <free>
  return freep;
 a52:	8b 15 64 13 00 00    	mov    0x1364,%edx
      if((p = morecore(nunits)) == 0)
 a58:	85 d2                	test   %edx,%edx
 a5a:	75 b4                	jne    a10 <malloc+0x40>
        return 0;
 a5c:	31 c0                	xor    %eax,%eax
 a5e:	eb 20                	jmp    a80 <malloc+0xb0>
    if(p->s.size >= nunits){
 a60:	89 d0                	mov    %edx,%eax
 a62:	89 da                	mov    %ebx,%edx
 a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 a68:	39 fe                	cmp    %edi,%esi
 a6a:	74 1c                	je     a88 <malloc+0xb8>
        p->s.size -= nunits;
 a6c:	29 f7                	sub    %esi,%edi
 a6e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 a71:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 a74:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a77:	89 15 64 13 00 00    	mov    %edx,0x1364
      return (void*)(p + 1);
 a7d:	83 c0 08             	add    $0x8,%eax
  }
}
 a80:	83 c4 1c             	add    $0x1c,%esp
 a83:	5b                   	pop    %ebx
 a84:	5e                   	pop    %esi
 a85:	5f                   	pop    %edi
 a86:	5d                   	pop    %ebp
 a87:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a88:	8b 08                	mov    (%eax),%ecx
 a8a:	89 0a                	mov    %ecx,(%edx)
 a8c:	eb e9                	jmp    a77 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 a8e:	c7 05 64 13 00 00 68 	movl   $0x1368,0x1364
 a95:	13 00 00 
    base.s.size = 0;
 a98:	ba 68 13 00 00       	mov    $0x1368,%edx
    base.s.ptr = freep = prevp = &base;
 a9d:	c7 05 68 13 00 00 68 	movl   $0x1368,0x1368
 aa4:	13 00 00 
    base.s.size = 0;
 aa7:	c7 05 6c 13 00 00 00 	movl   $0x0,0x136c
 aae:	00 00 00 
 ab1:	e9 46 ff ff ff       	jmp    9fc <malloc+0x2c>
 ab6:	66 90                	xchg   %ax,%ax
 ab8:	66 90                	xchg   %ax,%ax
 aba:	66 90                	xchg   %ax,%ax
 abc:	66 90                	xchg   %ax,%ax
 abe:	66 90                	xchg   %ax,%ax

00000ac0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	56                   	push   %esi
 ac4:	53                   	push   %ebx
 ac5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 ac8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 acf:	e8 fc fe ff ff       	call   9d0 <malloc>

    if (bt == NULL) {
 ad4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 ad6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 ad8:	74 66                	je     b40 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 ada:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 ae1:	e8 ea fe ff ff       	call   9d0 <malloc>
    if (bt->bt_stack == NULL) {
 ae6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 ae8:	89 c3                	mov    %eax,%ebx
 aea:	89 46 08             	mov    %eax,0x8(%esi)
 aed:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 af0:	74 5d                	je     b4f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 af2:	25 ff 0f 00 00       	and    $0xfff,%eax
 af7:	75 37                	jne    b30 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 af9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 aff:	8b 45 10             	mov    0x10(%ebp),%eax
 b02:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 b06:	89 44 24 04          	mov    %eax,0x4(%esp)
 b0a:	8b 45 0c             	mov    0xc(%ebp),%eax
 b0d:	89 04 24             	mov    %eax,(%esp)
 b10:	e8 25 fb ff ff       	call   63a <kthread_create>
    if (bt->bid != 0) {
 b15:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 b17:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 b19:	74 2d                	je     b48 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 b1b:	8b 45 08             	mov    0x8(%ebp),%eax
 b1e:	89 30                	mov    %esi,(%eax)
        result = 0;
 b20:	31 c0                	xor    %eax,%eax
}
 b22:	83 c4 10             	add    $0x10,%esp
 b25:	5b                   	pop    %ebx
 b26:	5e                   	pop    %esi
 b27:	5d                   	pop    %ebp
 b28:	c3                   	ret    
 b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 b30:	29 c3                	sub    %eax,%ebx
 b32:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 b38:	89 5e 04             	mov    %ebx,0x4(%esi)
 b3b:	eb bc                	jmp    af9 <benny_thread_create+0x39>
 b3d:	8d 76 00             	lea    0x0(%esi),%esi
 b40:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 b46:	eb b7                	jmp    aff <benny_thread_create+0x3f>
    int result = -1;
 b48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b4d:	eb d3                	jmp    b22 <benny_thread_create+0x62>
        free(bt);
 b4f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 b52:	31 f6                	xor    %esi,%esi
        free(bt);
 b54:	e8 e7 fd ff ff       	call   940 <free>
 b59:	8b 5b 04             	mov    0x4(%ebx),%ebx
 b5c:	eb a1                	jmp    aff <benny_thread_create+0x3f>
 b5e:	66 90                	xchg   %ax,%ax

00000b60 <benny_thread_bid>:
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 b63:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b66:	5d                   	pop    %ebp
    return bt->bid;
 b67:	8b 00                	mov    (%eax),%eax
}
 b69:	c3                   	ret    
 b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b70 <benny_thread_join>:
{
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
 b73:	53                   	push   %ebx
 b74:	83 ec 14             	sub    $0x14,%esp
 b77:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 b7a:	8b 03                	mov    (%ebx),%eax
 b7c:	89 04 24             	mov    %eax,(%esp)
 b7f:	e8 be fa ff ff       	call   642 <kthread_join>
    if (retVal == 0) {
 b84:	85 c0                	test   %eax,%eax
 b86:	75 27                	jne    baf <benny_thread_join+0x3f>
        free(bt->mem_stack);
 b88:	8b 53 08             	mov    0x8(%ebx),%edx
 b8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b8e:	89 14 24             	mov    %edx,(%esp)
 b91:	e8 aa fd ff ff       	call   940 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 b96:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 b9d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 ba4:	89 1c 24             	mov    %ebx,(%esp)
 ba7:	e8 94 fd ff ff       	call   940 <free>
 bac:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 baf:	83 c4 14             	add    $0x14,%esp
 bb2:	5b                   	pop    %ebx
 bb3:	5d                   	pop    %ebp
 bb4:	c3                   	ret    
 bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bc0 <benny_thread_exit>:
{
 bc0:	55                   	push   %ebp
 bc1:	89 e5                	mov    %esp,%ebp
}
 bc3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 bc4:	e9 81 fa ff ff       	jmp    64a <kthread_exit>
 bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 bd6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 bdc:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 be3:	31 c0                	xor    %eax,%eax
 be5:	5d                   	pop    %ebp
 be6:	c3                   	ret    
 be7:	89 f6                	mov    %esi,%esi
 be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bf0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 bf0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 bf1:	b8 01 00 00 00       	mov    $0x1,%eax
 bf6:	89 e5                	mov    %esp,%ebp
 bf8:	56                   	push   %esi
 bf9:	53                   	push   %ebx
 bfa:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bfd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 c00:	85 c0                	test   %eax,%eax
 c02:	be 01 00 00 00       	mov    $0x1,%esi
 c07:	74 15                	je     c1e <benny_mootex_yieldlock+0x2e>
 c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 c10:	e8 45 fa ff ff       	call   65a <kthread_yield>
 c15:	89 f0                	mov    %esi,%eax
 c17:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 c1a:	85 c0                	test   %eax,%eax
 c1c:	75 f2                	jne    c10 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 c1e:	e8 2f fa ff ff       	call   652 <kthread_self>
    benny_mootex->bid = benny_self();
 c23:	89 43 04             	mov    %eax,0x4(%ebx)
}
 c26:	31 c0                	xor    %eax,%eax
 c28:	5b                   	pop    %ebx
 c29:	5e                   	pop    %esi
 c2a:	5d                   	pop    %ebp
 c2b:	c3                   	ret    
 c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c30 <benny_mootex_spinlock>:
{
 c30:	55                   	push   %ebp
 c31:	ba 01 00 00 00       	mov    $0x1,%edx
 c36:	89 e5                	mov    %esp,%ebp
 c38:	53                   	push   %ebx
 c39:	83 ec 04             	sub    $0x4,%esp
 c3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c3f:	90                   	nop
 c40:	89 d0                	mov    %edx,%eax
 c42:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 c45:	85 c0                	test   %eax,%eax
 c47:	75 f7                	jne    c40 <benny_mootex_spinlock+0x10>
    return kthread_self();
 c49:	e8 04 fa ff ff       	call   652 <kthread_self>
    benny_mootex->bid = benny_self();
 c4e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 c51:	83 c4 04             	add    $0x4,%esp
 c54:	31 c0                	xor    %eax,%eax
 c56:	5b                   	pop    %ebx
 c57:	5d                   	pop    %ebp
 c58:	c3                   	ret    
 c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <benny_mootex_unlock>:
{
 c60:	55                   	push   %ebp
 c61:	89 e5                	mov    %esp,%ebp
 c63:	53                   	push   %ebx
 c64:	83 ec 04             	sub    $0x4,%esp
 c67:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 c6a:	e8 e3 f9 ff ff       	call   652 <kthread_self>
    if(tid == benny_mootex->bid){
 c6f:	39 43 04             	cmp    %eax,0x4(%ebx)
 c72:	75 1c                	jne    c90 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 c74:	0f ae f0             	mfence 
    return 0;
 c77:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 c79:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 c80:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 c86:	83 c4 04             	add    $0x4,%esp
 c89:	5b                   	pop    %ebx
 c8a:	5d                   	pop    %ebp
 c8b:	c3                   	ret    
 c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c90:	83 c4 04             	add    $0x4,%esp
      return -1;
 c93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 c98:	5b                   	pop    %ebx
 c99:	5d                   	pop    %ebp
 c9a:	c3                   	ret    
 c9b:	90                   	nop
 c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ca0 <benny_mootex_trylock>:
{
 ca0:	55                   	push   %ebp
 ca1:	b8 01 00 00 00       	mov    $0x1,%eax
 ca6:	89 e5                	mov    %esp,%ebp
 ca8:	53                   	push   %ebx
 ca9:	83 ec 04             	sub    $0x4,%esp
 cac:	8b 5d 08             	mov    0x8(%ebp),%ebx
 caf:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 cb2:	85 c0                	test   %eax,%eax
 cb4:	75 08                	jne    cbe <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 cb6:	e8 97 f9 ff ff       	call   652 <kthread_self>
        benny_mootex->bid = tid;
 cbb:	89 43 04             	mov    %eax,0x4(%ebx)
}
 cbe:	83 c4 04             	add    $0x4,%esp
 cc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 cc6:	5b                   	pop    %ebx
 cc7:	5d                   	pop    %ebp
 cc8:	c3                   	ret    
 cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cd0 <benny_mootex_wholock>:
{
 cd0:	55                   	push   %ebp
 cd1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 cd3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 cd6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 cd7:	8b 40 04             	mov    0x4(%eax),%eax
}
 cda:	c3                   	ret    
 cdb:	90                   	nop
 cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ce0 <benny_mootex_islocked>:
{
 ce0:	55                   	push   %ebp
 ce1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 ce3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ce6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 ce7:	8b 00                	mov    (%eax),%eax
}
 ce9:	c3                   	ret    
 cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000cf0 <benny_self>:
{
 cf0:	55                   	push   %ebp
 cf1:	89 e5                	mov    %esp,%ebp
}
 cf3:	5d                   	pop    %ebp
    return kthread_self();
 cf4:	e9 59 f9 ff ff       	jmp    652 <kthread_self>
 cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d00 <benny_yield>:
{
 d00:	55                   	push   %ebp
 d01:	89 e5                	mov    %esp,%ebp
    
}
 d03:	5d                   	pop    %ebp
    return kthread_yield();
 d04:	e9 51 f9 ff ff       	jmp    65a <kthread_yield>
 d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d10 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 d10:	55                   	push   %ebp
 d11:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 d13:	5d                   	pop    %ebp
    return kthread_cpu_count();
 d14:	e9 49 f9 ff ff       	jmp    662 <kthread_cpu_count>
 d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d20 <benny_thread_count>:

int
benny_thread_count(void)
{
 d20:	55                   	push   %ebp
 d21:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 d23:	5d                   	pop    %ebp
    return kthread_thread_count();
 d24:	e9 41 f9 ff ff       	jmp    66a <kthread_thread_count>
