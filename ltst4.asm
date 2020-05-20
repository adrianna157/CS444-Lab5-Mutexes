
_ltst4:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
#ifdef BENNY_MOOTEX
    int i = 0;
    int num_threads = NUM_THREADS;
    int begin_date = 0;
    int end_date = 0;
    benny_thread_t bt[NUM_THREADS] = {0};
   1:	31 c0                	xor    %eax,%eax
{
   3:	89 e5                	mov    %esp,%ebp
    benny_thread_t bt[NUM_THREADS] = {0};
   5:	b9 0a 00 00 00       	mov    $0xa,%ecx
{
   a:	57                   	push   %edi
   b:	56                   	push   %esi
   c:	53                   	push   %ebx

    //benny_mootex_init(&mootex);
    lock_func = benny_mootex_spinlock;
    printf(1, "spin locking enabled\n");
    begin_date = uptime();
    for (i = 0; i < num_threads; i++) {
   d:	31 db                	xor    %ebx,%ebx
{
   f:	83 e4 f0             	and    $0xfffffff0,%esp
  12:	83 ec 50             	sub    $0x50,%esp
    benny_thread_t bt[NUM_THREADS] = {0};
  15:	8d 7c 24 28          	lea    0x28(%esp),%edi
  19:	f3 ab                	rep stos %eax,%es:(%edi)
    begin_date = uptime();
  1b:	8d 7c 24 28          	lea    0x28(%esp),%edi
    printf(1, "spin locking enabled\n");
  1f:	c7 44 24 04 a6 0c 00 	movl   $0xca6,0x4(%esp)
  26:	00 
  27:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    lock_func = benny_mootex_spinlock;
  2e:	c7 05 e0 11 00 00 80 	movl   $0xb80,0x11e0
  35:	0b 00 00 
    printf(1, "spin locking enabled\n");
  38:	e8 33 06 00 00       	call   670 <printf>
    begin_date = uptime();
  3d:	e8 18 05 00 00       	call   55a <uptime>
  42:	89 c6                	mov    %eax,%esi
  44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        benny_thread_create(&(bt[i]), func1, (void *) i);
  48:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    for (i = 0; i < num_threads; i++) {
  4c:	83 c3 01             	add    $0x1,%ebx
        benny_thread_create(&(bt[i]), func1, (void *) i);
  4f:	89 3c 24             	mov    %edi,(%esp)
  52:	83 c7 04             	add    $0x4,%edi
  55:	c7 44 24 04 d0 01 00 	movl   $0x1d0,0x4(%esp)
  5c:	00 
  5d:	e8 ae 09 00 00       	call   a10 <benny_thread_create>
    for (i = 0; i < num_threads; i++) {
  62:	83 fb 0a             	cmp    $0xa,%ebx
  65:	75 e1                	jne    48 <main+0x48>
  67:	8d 44 24 28          	lea    0x28(%esp),%eax
  6b:	8d 7c 24 50          	lea    0x50(%esp),%edi
  6f:	89 c3                	mov    %eax,%ebx
  71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }

    for (i = 0; i < num_threads; i++) {
        benny_thread_join(bt[i]);
  78:	8b 03                	mov    (%ebx),%eax
  7a:	83 c3 04             	add    $0x4,%ebx
  7d:	89 04 24             	mov    %eax,(%esp)
  80:	e8 3b 0a 00 00       	call   ac0 <benny_thread_join>
    for (i = 0; i < num_threads; i++) {
  85:	39 fb                	cmp    %edi,%ebx
  87:	75 ef                	jne    78 <main+0x78>
    }
    end_date = uptime();
  89:	e8 cc 04 00 00       	call   55a <uptime>
    printf(1, "\tglobal value:\t%d\n", global);
  8e:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
  95:	00 
  96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    end_date = uptime();
  9d:	89 c3                	mov    %eax,%ebx
    printf(1, "\tglobal value:\t%d\n", global);
  9f:	a1 ec 11 00 00       	mov    0x11ec,%eax
    printf(1, "\telapse ticks:\t%d\n", end_date - begin_date);
  a4:	29 f3                	sub    %esi,%ebx
    printf(1, "\tglobal value:\t%d\n", global);
  a6:	89 44 24 08          	mov    %eax,0x8(%esp)
  aa:	e8 c1 05 00 00       	call   670 <printf>
    printf(1, "\telapse ticks:\t%d\n", end_date - begin_date);
  af:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  b3:	c7 44 24 04 cf 0c 00 	movl   $0xccf,0x4(%esp)
  ba:	00 
  bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c2:	e8 a9 05 00 00       	call   670 <printf>
    assert(global == (ITERATIONS * ITERATIONS * num_threads));
  c7:	81 3d ec 11 00 00 00 	cmpl   $0x3b9aca00,0x11ec
  ce:	ca 9a 3b 
  d1:	74 29                	je     fc <main+0xfc>
  d3:	c7 44 24 0c 45 00 00 	movl   $0x45,0xc(%esp)
  da:	00 
        benny_thread_join(bt[i]);
    }
    end_date = uptime();
    printf(1, "\tglobal value:\t%d\n", global);
    printf(1, "\telapse ticks:\t%d\n", end_date - begin_date);
    assert(global == (ITERATIONS * ITERATIONS * num_threads));
  db:	c7 44 24 08 e2 0c 00 	movl   $0xce2,0x8(%esp)
  e2:	00 
  e3:	c7 44 24 04 04 0d 00 	movl   $0xd04,0x4(%esp)
  ea:	00 
  eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f2:	e8 79 05 00 00       	call   670 <printf>
  f7:	e8 c6 03 00 00       	call   4c2 <exit>
    printf(1, "yield locking enabled\n");
  fc:	c7 44 24 04 ea 0c 00 	movl   $0xcea,0x4(%esp)
 103:	00 
    begin_date = uptime();
 104:	8d 74 24 28          	lea    0x28(%esp),%esi
    for (i = 0; i < num_threads; i++) {
 108:	31 db                	xor    %ebx,%ebx
    printf(1, "yield locking enabled\n");
 10a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    global = 0;
 111:	c7 05 ec 11 00 00 00 	movl   $0x0,0x11ec
 118:	00 00 00 
    lock_func = benny_mootex_yieldlock;
 11b:	c7 05 e0 11 00 00 40 	movl   $0xb40,0x11e0
 122:	0b 00 00 
    printf(1, "yield locking enabled\n");
 125:	e8 46 05 00 00       	call   670 <printf>
    begin_date = uptime();
 12a:	e8 2b 04 00 00       	call   55a <uptime>
 12f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 133:	90                   	nop
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        benny_thread_create(&(bt[i]), func1, (void *) i);
 138:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    for (i = 0; i < num_threads; i++) {
 13c:	83 c3 01             	add    $0x1,%ebx
        benny_thread_create(&(bt[i]), func1, (void *) i);
 13f:	89 34 24             	mov    %esi,(%esp)
 142:	83 c6 04             	add    $0x4,%esi
 145:	c7 44 24 04 d0 01 00 	movl   $0x1d0,0x4(%esp)
 14c:	00 
 14d:	e8 be 08 00 00       	call   a10 <benny_thread_create>
    for (i = 0; i < num_threads; i++) {
 152:	83 fb 0a             	cmp    $0xa,%ebx
 155:	75 e1                	jne    138 <main+0x138>
 157:	8d 5c 24 28          	lea    0x28(%esp),%ebx
 15b:	90                   	nop
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        benny_thread_join(bt[i]);
 160:	8b 03                	mov    (%ebx),%eax
 162:	83 c3 04             	add    $0x4,%ebx
 165:	89 04 24             	mov    %eax,(%esp)
 168:	e8 53 09 00 00       	call   ac0 <benny_thread_join>
    for (i = 0; i < num_threads; i++) {
 16d:	39 df                	cmp    %ebx,%edi
 16f:	75 ef                	jne    160 <main+0x160>
    end_date = uptime();
 171:	e8 e4 03 00 00       	call   55a <uptime>
    printf(1, "\tglobal value:\t%d\n", global);
 176:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
 17d:	00 
 17e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    end_date = uptime();
 185:	89 c3                	mov    %eax,%ebx
    printf(1, "\tglobal value:\t%d\n", global);
 187:	a1 ec 11 00 00       	mov    0x11ec,%eax
 18c:	89 44 24 08          	mov    %eax,0x8(%esp)
 190:	e8 db 04 00 00       	call   670 <printf>
    printf(1, "\telapse ticks:\t%d\n", end_date - begin_date);
 195:	2b 5c 24 1c          	sub    0x1c(%esp),%ebx
 199:	c7 44 24 04 cf 0c 00 	movl   $0xccf,0x4(%esp)
 1a0:	00 
 1a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a8:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 1ac:	e8 bf 04 00 00       	call   670 <printf>
    assert(global == (ITERATIONS * ITERATIONS * num_threads));
 1b1:	81 3d ec 11 00 00 00 	cmpl   $0x3b9aca00,0x11ec
 1b8:	ca 9a 3b 
 1bb:	0f 84 36 ff ff ff    	je     f7 <main+0xf7>
 1c1:	c7 44 24 0c 55 00 00 	movl   $0x55,0xc(%esp)
 1c8:	00 
 1c9:	e9 0d ff ff ff       	jmp    db <main+0xdb>
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <func1>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
    benny_mootex_unlock(&mootex);
 1d5:	bb 10 27 00 00       	mov    $0x2710,%ebx
{
 1da:	83 ec 10             	sub    $0x10,%esp
 1dd:	8b 75 08             	mov    0x8(%ebp),%esi
    lock_func(&mootex);
 1e0:	c7 04 24 e4 11 00 00 	movl   $0x11e4,(%esp)
 1e7:	ff 15 e0 11 00 00    	call   *0x11e0
    printf(1, "thread starting %d %d\n", getpid(), bid);
 1ed:	e8 50 03 00 00       	call   542 <getpid>
 1f2:	89 74 24 0c          	mov    %esi,0xc(%esp)
 1f6:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 1fd:	00 
 1fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 205:	89 44 24 08          	mov    %eax,0x8(%esp)
 209:	e8 62 04 00 00       	call   670 <printf>
    benny_mootex_unlock(&mootex);
 20e:	c7 04 24 e4 11 00 00 	movl   $0x11e4,(%esp)
 215:	e8 96 09 00 00       	call   bb0 <benny_mootex_unlock>
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        lock_func(&mootex);
 220:	c7 04 24 e4 11 00 00 	movl   $0x11e4,(%esp)
 227:	ff 15 e0 11 00 00    	call   *0x11e0
        benny_mootex_unlock(&mootex);
 22d:	c7 04 24 e4 11 00 00 	movl   $0x11e4,(%esp)
 234:	81 05 ec 11 00 00 10 	addl   $0x2710,0x11ec
 23b:	27 00 00 
 23e:	e8 6d 09 00 00       	call   bb0 <benny_mootex_unlock>
    for (i = 0; i < (ITERATIONS); i++) {
 243:	83 eb 01             	sub    $0x1,%ebx
 246:	75 d8                	jne    220 <func1+0x50>
    lock_func(&mootex);
 248:	c7 04 24 e4 11 00 00 	movl   $0x11e4,(%esp)
 24f:	ff 15 e0 11 00 00    	call   *0x11e0
    printf(1, "thread done %d %d\n", getpid(), bid);
 255:	e8 e8 02 00 00       	call   542 <getpid>
 25a:	89 74 24 0c          	mov    %esi,0xc(%esp)
 25e:	c7 44 24 04 93 0c 00 	movl   $0xc93,0x4(%esp)
 265:	00 
 266:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26d:	89 44 24 08          	mov    %eax,0x8(%esp)
 271:	e8 fa 03 00 00       	call   670 <printf>
    benny_mootex_unlock(&mootex);
 276:	c7 04 24 e4 11 00 00 	movl   $0x11e4,(%esp)
 27d:	e8 2e 09 00 00       	call   bb0 <benny_mootex_unlock>
    benny_thread_exit(0);
 282:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
 289:	83 c4 10             	add    $0x10,%esp
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5d                   	pop    %ebp
    benny_thread_exit(0);
 28f:	e9 7c 08 00 00       	jmp    b10 <benny_thread_exit>
 294:	66 90                	xchg   %ax,%ax
 296:	66 90                	xchg   %ax,%ax
 298:	66 90                	xchg   %ax,%ax
 29a:	66 90                	xchg   %ax,%ax
 29c:	66 90                	xchg   %ax,%ax
 29e:	66 90                	xchg   %ax,%ax

000002a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2a9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2aa:	89 c2                	mov    %eax,%edx
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b0:	83 c1 01             	add    $0x1,%ecx
 2b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2b7:	83 c2 01             	add    $0x1,%edx
 2ba:	84 db                	test   %bl,%bl
 2bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 2bf:	75 ef                	jne    2b0 <strcpy+0x10>
    ;
  return os;
}
 2c1:	5b                   	pop    %ebx
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    
 2c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 55 08             	mov    0x8(%ebp),%edx
 2d6:	53                   	push   %ebx
 2d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2da:	0f b6 02             	movzbl (%edx),%eax
 2dd:	84 c0                	test   %al,%al
 2df:	74 2d                	je     30e <strcmp+0x3e>
 2e1:	0f b6 19             	movzbl (%ecx),%ebx
 2e4:	38 d8                	cmp    %bl,%al
 2e6:	74 0e                	je     2f6 <strcmp+0x26>
 2e8:	eb 2b                	jmp    315 <strcmp+0x45>
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f0:	38 c8                	cmp    %cl,%al
 2f2:	75 15                	jne    309 <strcmp+0x39>
    p++, q++;
 2f4:	89 d9                	mov    %ebx,%ecx
 2f6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2f9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 2fc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 2ff:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 303:	84 c0                	test   %al,%al
 305:	75 e9                	jne    2f0 <strcmp+0x20>
 307:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 309:	29 c8                	sub    %ecx,%eax
}
 30b:	5b                   	pop    %ebx
 30c:	5d                   	pop    %ebp
 30d:	c3                   	ret    
 30e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 311:	31 c0                	xor    %eax,%eax
 313:	eb f4                	jmp    309 <strcmp+0x39>
 315:	0f b6 cb             	movzbl %bl,%ecx
 318:	eb ef                	jmp    309 <strcmp+0x39>
 31a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000320 <strlen>:

uint
strlen(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 326:	80 39 00             	cmpb   $0x0,(%ecx)
 329:	74 12                	je     33d <strlen+0x1d>
 32b:	31 d2                	xor    %edx,%edx
 32d:	8d 76 00             	lea    0x0(%esi),%esi
 330:	83 c2 01             	add    $0x1,%edx
 333:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 337:	89 d0                	mov    %edx,%eax
 339:	75 f5                	jne    330 <strlen+0x10>
    ;
  return n;
}
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 33d:	31 c0                	xor    %eax,%eax
}
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	eb 0d                	jmp    350 <memset>
 343:	90                   	nop
 344:	90                   	nop
 345:	90                   	nop
 346:	90                   	nop
 347:	90                   	nop
 348:	90                   	nop
 349:	90                   	nop
 34a:	90                   	nop
 34b:	90                   	nop
 34c:	90                   	nop
 34d:	90                   	nop
 34e:	90                   	nop
 34f:	90                   	nop

00000350 <memset>:

void*
memset(void *dst, int c, uint n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 55 08             	mov    0x8(%ebp),%edx
 356:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 357:	8b 4d 10             	mov    0x10(%ebp),%ecx
 35a:	8b 45 0c             	mov    0xc(%ebp),%eax
 35d:	89 d7                	mov    %edx,%edi
 35f:	fc                   	cld    
 360:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 362:	89 d0                	mov    %edx,%eax
 364:	5f                   	pop    %edi
 365:	5d                   	pop    %ebp
 366:	c3                   	ret    
 367:	89 f6                	mov    %esi,%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <strchr>:

char*
strchr(const char *s, char c)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	53                   	push   %ebx
 377:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 37a:	0f b6 18             	movzbl (%eax),%ebx
 37d:	84 db                	test   %bl,%bl
 37f:	74 1d                	je     39e <strchr+0x2e>
    if(*s == c)
 381:	38 d3                	cmp    %dl,%bl
 383:	89 d1                	mov    %edx,%ecx
 385:	75 0d                	jne    394 <strchr+0x24>
 387:	eb 17                	jmp    3a0 <strchr+0x30>
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 390:	38 ca                	cmp    %cl,%dl
 392:	74 0c                	je     3a0 <strchr+0x30>
  for(; *s; s++)
 394:	83 c0 01             	add    $0x1,%eax
 397:	0f b6 10             	movzbl (%eax),%edx
 39a:	84 d2                	test   %dl,%dl
 39c:	75 f2                	jne    390 <strchr+0x20>
      return (char*)s;
  return 0;
 39e:	31 c0                	xor    %eax,%eax
}
 3a0:	5b                   	pop    %ebx
 3a1:	5d                   	pop    %ebp
 3a2:	c3                   	ret    
 3a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003b0 <gets>:

char*
gets(char *buf, int max)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3b5:	31 f6                	xor    %esi,%esi
{
 3b7:	53                   	push   %ebx
 3b8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 3bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 3be:	eb 31                	jmp    3f1 <gets+0x41>
    cc = read(0, &c, 1);
 3c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3c7:	00 
 3c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 3cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3d3:	e8 02 01 00 00       	call   4da <read>
    if(cc < 1)
 3d8:	85 c0                	test   %eax,%eax
 3da:	7e 1d                	jle    3f9 <gets+0x49>
      break;
    buf[i++] = c;
 3dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 3e0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 3e2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 3e5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 3e7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 3eb:	74 0c                	je     3f9 <gets+0x49>
 3ed:	3c 0a                	cmp    $0xa,%al
 3ef:	74 08                	je     3f9 <gets+0x49>
  for(i=0; i+1 < max; ){
 3f1:	8d 5e 01             	lea    0x1(%esi),%ebx
 3f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3f7:	7c c7                	jl     3c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3f9:	8b 45 08             	mov    0x8(%ebp),%eax
 3fc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 400:	83 c4 2c             	add    $0x2c,%esp
 403:	5b                   	pop    %ebx
 404:	5e                   	pop    %esi
 405:	5f                   	pop    %edi
 406:	5d                   	pop    %ebp
 407:	c3                   	ret    
 408:	90                   	nop
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000410 <stat>:

int
stat(const char *n, struct stat *st)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	56                   	push   %esi
 414:	53                   	push   %ebx
 415:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 418:	8b 45 08             	mov    0x8(%ebp),%eax
 41b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 422:	00 
 423:	89 04 24             	mov    %eax,(%esp)
 426:	e8 d7 00 00 00       	call   502 <open>
  if(fd < 0)
 42b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 42d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 42f:	78 27                	js     458 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 431:	8b 45 0c             	mov    0xc(%ebp),%eax
 434:	89 1c 24             	mov    %ebx,(%esp)
 437:	89 44 24 04          	mov    %eax,0x4(%esp)
 43b:	e8 da 00 00 00       	call   51a <fstat>
  close(fd);
 440:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 443:	89 c6                	mov    %eax,%esi
  close(fd);
 445:	e8 a0 00 00 00       	call   4ea <close>
  return r;
 44a:	89 f0                	mov    %esi,%eax
}
 44c:	83 c4 10             	add    $0x10,%esp
 44f:	5b                   	pop    %ebx
 450:	5e                   	pop    %esi
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    
 453:	90                   	nop
 454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 458:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 45d:	eb ed                	jmp    44c <stat+0x3c>
 45f:	90                   	nop

00000460 <atoi>:

int
atoi(const char *s)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 4d 08             	mov    0x8(%ebp),%ecx
 466:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 467:	0f be 11             	movsbl (%ecx),%edx
 46a:	8d 42 d0             	lea    -0x30(%edx),%eax
 46d:	3c 09                	cmp    $0x9,%al
  n = 0;
 46f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 474:	77 17                	ja     48d <atoi+0x2d>
 476:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 478:	83 c1 01             	add    $0x1,%ecx
 47b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 47e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 482:	0f be 11             	movsbl (%ecx),%edx
 485:	8d 5a d0             	lea    -0x30(%edx),%ebx
 488:	80 fb 09             	cmp    $0x9,%bl
 48b:	76 eb                	jbe    478 <atoi+0x18>
  return n;
}
 48d:	5b                   	pop    %ebx
 48e:	5d                   	pop    %ebp
 48f:	c3                   	ret    

00000490 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 490:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 491:	31 d2                	xor    %edx,%edx
{
 493:	89 e5                	mov    %esp,%ebp
 495:	56                   	push   %esi
 496:	8b 45 08             	mov    0x8(%ebp),%eax
 499:	53                   	push   %ebx
 49a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 49d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 4a0:	85 db                	test   %ebx,%ebx
 4a2:	7e 12                	jle    4b6 <memmove+0x26>
 4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 4a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 4b2:	39 da                	cmp    %ebx,%edx
 4b4:	75 f2                	jne    4a8 <memmove+0x18>
  return vdst;
}
 4b6:	5b                   	pop    %ebx
 4b7:	5e                   	pop    %esi
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    

000004ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ba:	b8 01 00 00 00       	mov    $0x1,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <exit>:
SYSCALL(exit)
 4c2:	b8 02 00 00 00       	mov    $0x2,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <wait>:
SYSCALL(wait)
 4ca:	b8 03 00 00 00       	mov    $0x3,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <pipe>:
SYSCALL(pipe)
 4d2:	b8 04 00 00 00       	mov    $0x4,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <read>:
SYSCALL(read)
 4da:	b8 05 00 00 00       	mov    $0x5,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <write>:
SYSCALL(write)
 4e2:	b8 10 00 00 00       	mov    $0x10,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <close>:
SYSCALL(close)
 4ea:	b8 15 00 00 00       	mov    $0x15,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <kill>:
SYSCALL(kill)
 4f2:	b8 06 00 00 00       	mov    $0x6,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <exec>:
SYSCALL(exec)
 4fa:	b8 07 00 00 00       	mov    $0x7,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <open>:
SYSCALL(open)
 502:	b8 0f 00 00 00       	mov    $0xf,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <mknod>:
SYSCALL(mknod)
 50a:	b8 11 00 00 00       	mov    $0x11,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <unlink>:
SYSCALL(unlink)
 512:	b8 12 00 00 00       	mov    $0x12,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <fstat>:
SYSCALL(fstat)
 51a:	b8 08 00 00 00       	mov    $0x8,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <link>:
SYSCALL(link)
 522:	b8 13 00 00 00       	mov    $0x13,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <mkdir>:
SYSCALL(mkdir)
 52a:	b8 14 00 00 00       	mov    $0x14,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <chdir>:
SYSCALL(chdir)
 532:	b8 09 00 00 00       	mov    $0x9,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <dup>:
SYSCALL(dup)
 53a:	b8 0a 00 00 00       	mov    $0xa,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <getpid>:
SYSCALL(getpid)
 542:	b8 0b 00 00 00       	mov    $0xb,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <sbrk>:
SYSCALL(sbrk)
 54a:	b8 0c 00 00 00       	mov    $0xc,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <sleep>:
SYSCALL(sleep)
 552:	b8 0d 00 00 00       	mov    $0xd,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <uptime>:
SYSCALL(uptime)
 55a:	b8 0e 00 00 00       	mov    $0xe,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 562:	b8 16 00 00 00       	mov    $0x16,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 56a:	b8 17 00 00 00       	mov    $0x17,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 572:	b8 18 00 00 00       	mov    $0x18,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 57a:	b8 19 00 00 00       	mov    $0x19,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 582:	b8 1a 00 00 00       	mov    $0x1a,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 58a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <kthread_join>:
SYSCALL(kthread_join)
 592:	b8 1c 00 00 00       	mov    $0x1c,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <kthread_exit>:
SYSCALL(kthread_exit)
 59a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 5a2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <kthread_yield>:
SYSCALL(kthread_yield)
 5aa:	b8 1f 00 00 00       	mov    $0x1f,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 5b2:	b8 20 00 00 00       	mov    $0x20,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 5ba:	b8 21 00 00 00       	mov    $0x21,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    
 5c2:	66 90                	xchg   %ax,%ax
 5c4:	66 90                	xchg   %ax,%ax
 5c6:	66 90                	xchg   %ax,%ax
 5c8:	66 90                	xchg   %ax,%ax
 5ca:	66 90                	xchg   %ax,%ax
 5cc:	66 90                	xchg   %ax,%ax
 5ce:	66 90                	xchg   %ax,%ax

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
 5d4:	56                   	push   %esi
 5d5:	89 c6                	mov    %eax,%esi
 5d7:	53                   	push   %ebx
 5d8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5de:	85 db                	test   %ebx,%ebx
 5e0:	74 09                	je     5eb <printint+0x1b>
 5e2:	89 d0                	mov    %edx,%eax
 5e4:	c1 e8 1f             	shr    $0x1f,%eax
 5e7:	84 c0                	test   %al,%al
 5e9:	75 75                	jne    660 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5eb:	89 d0                	mov    %edx,%eax
  neg = 0;
 5ed:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5f4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 5f7:	31 ff                	xor    %edi,%edi
 5f9:	89 ce                	mov    %ecx,%esi
 5fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5fe:	eb 02                	jmp    602 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 600:	89 cf                	mov    %ecx,%edi
 602:	31 d2                	xor    %edx,%edx
 604:	f7 f6                	div    %esi
 606:	8d 4f 01             	lea    0x1(%edi),%ecx
 609:	0f b6 92 2f 0d 00 00 	movzbl 0xd2f(%edx),%edx
  }while((x /= base) != 0);
 610:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 612:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 615:	75 e9                	jne    600 <printint+0x30>
  if(neg)
 617:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 61a:	89 c8                	mov    %ecx,%eax
 61c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 61f:	85 d2                	test   %edx,%edx
 621:	74 08                	je     62b <printint+0x5b>
    buf[i++] = '-';
 623:	8d 4f 02             	lea    0x2(%edi),%ecx
 626:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 62b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 62e:	66 90                	xchg   %ax,%ax
 630:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 635:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 638:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 63f:	00 
 640:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 644:	89 34 24             	mov    %esi,(%esp)
 647:	88 45 d7             	mov    %al,-0x29(%ebp)
 64a:	e8 93 fe ff ff       	call   4e2 <write>
  while(--i >= 0)
 64f:	83 ff ff             	cmp    $0xffffffff,%edi
 652:	75 dc                	jne    630 <printint+0x60>
    putc(fd, buf[i]);
}
 654:	83 c4 4c             	add    $0x4c,%esp
 657:	5b                   	pop    %ebx
 658:	5e                   	pop    %esi
 659:	5f                   	pop    %edi
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret    
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 660:	89 d0                	mov    %edx,%eax
 662:	f7 d8                	neg    %eax
    neg = 1;
 664:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 66b:	eb 87                	jmp    5f4 <printint+0x24>
 66d:	8d 76 00             	lea    0x0(%esi),%esi

00000670 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 674:	31 ff                	xor    %edi,%edi
{
 676:	56                   	push   %esi
 677:	53                   	push   %ebx
 678:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 67b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 67e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 681:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 684:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 687:	0f b6 13             	movzbl (%ebx),%edx
 68a:	83 c3 01             	add    $0x1,%ebx
 68d:	84 d2                	test   %dl,%dl
 68f:	75 39                	jne    6ca <printf+0x5a>
 691:	e9 ca 00 00 00       	jmp    760 <printf+0xf0>
 696:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 698:	83 fa 25             	cmp    $0x25,%edx
 69b:	0f 84 c7 00 00 00    	je     768 <printf+0xf8>
  write(fd, &c, 1);
 6a1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 6a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6ab:	00 
 6ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 6b3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 6b6:	e8 27 fe ff ff       	call   4e2 <write>
 6bb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 6be:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 6c2:	84 d2                	test   %dl,%dl
 6c4:	0f 84 96 00 00 00    	je     760 <printf+0xf0>
    if(state == 0){
 6ca:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 6cc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 6cf:	74 c7                	je     698 <printf+0x28>
      }
    } else if(state == '%'){
 6d1:	83 ff 25             	cmp    $0x25,%edi
 6d4:	75 e5                	jne    6bb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 6d6:	83 fa 75             	cmp    $0x75,%edx
 6d9:	0f 84 99 00 00 00    	je     778 <printf+0x108>
 6df:	83 fa 64             	cmp    $0x64,%edx
 6e2:	0f 84 90 00 00 00    	je     778 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6e8:	25 f7 00 00 00       	and    $0xf7,%eax
 6ed:	83 f8 70             	cmp    $0x70,%eax
 6f0:	0f 84 aa 00 00 00    	je     7a0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6f6:	83 fa 73             	cmp    $0x73,%edx
 6f9:	0f 84 e9 00 00 00    	je     7e8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ff:	83 fa 63             	cmp    $0x63,%edx
 702:	0f 84 2b 01 00 00    	je     833 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 708:	83 fa 25             	cmp    $0x25,%edx
 70b:	0f 84 4f 01 00 00    	je     860 <printf+0x1f0>
  write(fd, &c, 1);
 711:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 714:	83 c3 01             	add    $0x1,%ebx
 717:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 71e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 71f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 721:	89 44 24 04          	mov    %eax,0x4(%esp)
 725:	89 34 24             	mov    %esi,(%esp)
 728:	89 55 d0             	mov    %edx,-0x30(%ebp)
 72b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 72f:	e8 ae fd ff ff       	call   4e2 <write>
        putc(fd, c);
 734:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 737:	8d 45 e7             	lea    -0x19(%ebp),%eax
 73a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 741:	00 
 742:	89 44 24 04          	mov    %eax,0x4(%esp)
 746:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 749:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 74c:	e8 91 fd ff ff       	call   4e2 <write>
  for(i = 0; fmt[i]; i++){
 751:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 755:	84 d2                	test   %dl,%dl
 757:	0f 85 6d ff ff ff    	jne    6ca <printf+0x5a>
 75d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 760:	83 c4 3c             	add    $0x3c,%esp
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
        state = '%';
 768:	bf 25 00 00 00       	mov    $0x25,%edi
 76d:	e9 49 ff ff ff       	jmp    6bb <printf+0x4b>
 772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 778:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 77f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 784:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 787:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 789:	8b 10                	mov    (%eax),%edx
 78b:	89 f0                	mov    %esi,%eax
 78d:	e8 3e fe ff ff       	call   5d0 <printint>
        ap++;
 792:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 796:	e9 20 ff ff ff       	jmp    6bb <printf+0x4b>
 79b:	90                   	nop
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 7a0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 7a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7aa:	00 
 7ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 7af:	89 34 24             	mov    %esi,(%esp)
 7b2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 7b6:	e8 27 fd ff ff       	call   4e2 <write>
 7bb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 7be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7c5:	00 
 7c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ca:	89 34 24             	mov    %esi,(%esp)
 7cd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 7d1:	e8 0c fd ff ff       	call   4e2 <write>
        printint(fd, *ap, 16, 0);
 7d6:	b9 10 00 00 00       	mov    $0x10,%ecx
 7db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 7e2:	eb a0                	jmp    784 <printf+0x114>
 7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 7eb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 7ef:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 7f1:	b8 28 0d 00 00       	mov    $0xd28,%eax
 7f6:	85 ff                	test   %edi,%edi
 7f8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 7fb:	0f b6 07             	movzbl (%edi),%eax
 7fe:	84 c0                	test   %al,%al
 800:	74 2a                	je     82c <printf+0x1bc>
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 808:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 80b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 80e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 811:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 818:	00 
 819:	89 44 24 04          	mov    %eax,0x4(%esp)
 81d:	89 34 24             	mov    %esi,(%esp)
 820:	e8 bd fc ff ff       	call   4e2 <write>
        while(*s != 0){
 825:	0f b6 07             	movzbl (%edi),%eax
 828:	84 c0                	test   %al,%al
 82a:	75 dc                	jne    808 <printf+0x198>
      state = 0;
 82c:	31 ff                	xor    %edi,%edi
 82e:	e9 88 fe ff ff       	jmp    6bb <printf+0x4b>
        putc(fd, *ap);
 833:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 836:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 838:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 83a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 841:	00 
 842:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 845:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 848:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 84b:	89 44 24 04          	mov    %eax,0x4(%esp)
 84f:	e8 8e fc ff ff       	call   4e2 <write>
        ap++;
 854:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 858:	e9 5e fe ff ff       	jmp    6bb <printf+0x4b>
 85d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 860:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 863:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 865:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 86c:	00 
 86d:	89 44 24 04          	mov    %eax,0x4(%esp)
 871:	89 34 24             	mov    %esi,(%esp)
 874:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 878:	e8 65 fc ff ff       	call   4e2 <write>
 87d:	e9 39 fe ff ff       	jmp    6bb <printf+0x4b>
 882:	66 90                	xchg   %ax,%ax
 884:	66 90                	xchg   %ax,%ax
 886:	66 90                	xchg   %ax,%ax
 888:	66 90                	xchg   %ax,%ax
 88a:	66 90                	xchg   %ax,%ax
 88c:	66 90                	xchg   %ax,%ax
 88e:	66 90                	xchg   %ax,%ax

00000890 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 890:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	a1 f0 11 00 00       	mov    0x11f0,%eax
{
 896:	89 e5                	mov    %esp,%ebp
 898:	57                   	push   %edi
 899:	56                   	push   %esi
 89a:	53                   	push   %ebx
 89b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 89e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 8a0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a3:	39 d0                	cmp    %edx,%eax
 8a5:	72 11                	jb     8b8 <free+0x28>
 8a7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a8:	39 c8                	cmp    %ecx,%eax
 8aa:	72 04                	jb     8b0 <free+0x20>
 8ac:	39 ca                	cmp    %ecx,%edx
 8ae:	72 10                	jb     8c0 <free+0x30>
 8b0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b6:	73 f0                	jae    8a8 <free+0x18>
 8b8:	39 ca                	cmp    %ecx,%edx
 8ba:	72 04                	jb     8c0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8bc:	39 c8                	cmp    %ecx,%eax
 8be:	72 f0                	jb     8b0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8c3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 8c6:	39 cf                	cmp    %ecx,%edi
 8c8:	74 1e                	je     8e8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8ca:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8cd:	8b 48 04             	mov    0x4(%eax),%ecx
 8d0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 8d3:	39 f2                	cmp    %esi,%edx
 8d5:	74 28                	je     8ff <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8d7:	89 10                	mov    %edx,(%eax)
  freep = p;
 8d9:	a3 f0 11 00 00       	mov    %eax,0x11f0
}
 8de:	5b                   	pop    %ebx
 8df:	5e                   	pop    %esi
 8e0:	5f                   	pop    %edi
 8e1:	5d                   	pop    %ebp
 8e2:	c3                   	ret    
 8e3:	90                   	nop
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8e8:	03 71 04             	add    0x4(%ecx),%esi
 8eb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8ee:	8b 08                	mov    (%eax),%ecx
 8f0:	8b 09                	mov    (%ecx),%ecx
 8f2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8f5:	8b 48 04             	mov    0x4(%eax),%ecx
 8f8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 8fb:	39 f2                	cmp    %esi,%edx
 8fd:	75 d8                	jne    8d7 <free+0x47>
    p->s.size += bp->s.size;
 8ff:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 902:	a3 f0 11 00 00       	mov    %eax,0x11f0
    p->s.size += bp->s.size;
 907:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 90a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 90d:	89 10                	mov    %edx,(%eax)
}
 90f:	5b                   	pop    %ebx
 910:	5e                   	pop    %esi
 911:	5f                   	pop    %edi
 912:	5d                   	pop    %ebp
 913:	c3                   	ret    
 914:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 91a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000920 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 929:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 92c:	8b 1d f0 11 00 00    	mov    0x11f0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 932:	8d 48 07             	lea    0x7(%eax),%ecx
 935:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 938:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 93a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 93d:	0f 84 9b 00 00 00    	je     9de <malloc+0xbe>
 943:	8b 13                	mov    (%ebx),%edx
 945:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 948:	39 fe                	cmp    %edi,%esi
 94a:	76 64                	jbe    9b0 <malloc+0x90>
 94c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 953:	bb 00 80 00 00       	mov    $0x8000,%ebx
 958:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 95b:	eb 0e                	jmp    96b <malloc+0x4b>
 95d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 960:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 962:	8b 78 04             	mov    0x4(%eax),%edi
 965:	39 fe                	cmp    %edi,%esi
 967:	76 4f                	jbe    9b8 <malloc+0x98>
 969:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 96b:	3b 15 f0 11 00 00    	cmp    0x11f0,%edx
 971:	75 ed                	jne    960 <malloc+0x40>
  if(nu < 4096)
 973:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 976:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 97c:	bf 00 10 00 00       	mov    $0x1000,%edi
 981:	0f 43 fe             	cmovae %esi,%edi
 984:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 987:	89 04 24             	mov    %eax,(%esp)
 98a:	e8 bb fb ff ff       	call   54a <sbrk>
  if(p == (char*)-1)
 98f:	83 f8 ff             	cmp    $0xffffffff,%eax
 992:	74 18                	je     9ac <malloc+0x8c>
  hp->s.size = nu;
 994:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 997:	83 c0 08             	add    $0x8,%eax
 99a:	89 04 24             	mov    %eax,(%esp)
 99d:	e8 ee fe ff ff       	call   890 <free>
  return freep;
 9a2:	8b 15 f0 11 00 00    	mov    0x11f0,%edx
      if((p = morecore(nunits)) == 0)
 9a8:	85 d2                	test   %edx,%edx
 9aa:	75 b4                	jne    960 <malloc+0x40>
        return 0;
 9ac:	31 c0                	xor    %eax,%eax
 9ae:	eb 20                	jmp    9d0 <malloc+0xb0>
    if(p->s.size >= nunits){
 9b0:	89 d0                	mov    %edx,%eax
 9b2:	89 da                	mov    %ebx,%edx
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 9b8:	39 fe                	cmp    %edi,%esi
 9ba:	74 1c                	je     9d8 <malloc+0xb8>
        p->s.size -= nunits;
 9bc:	29 f7                	sub    %esi,%edi
 9be:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 9c1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 9c4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9c7:	89 15 f0 11 00 00    	mov    %edx,0x11f0
      return (void*)(p + 1);
 9cd:	83 c0 08             	add    $0x8,%eax
  }
}
 9d0:	83 c4 1c             	add    $0x1c,%esp
 9d3:	5b                   	pop    %ebx
 9d4:	5e                   	pop    %esi
 9d5:	5f                   	pop    %edi
 9d6:	5d                   	pop    %ebp
 9d7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9d8:	8b 08                	mov    (%eax),%ecx
 9da:	89 0a                	mov    %ecx,(%edx)
 9dc:	eb e9                	jmp    9c7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 9de:	c7 05 f0 11 00 00 f4 	movl   $0x11f4,0x11f0
 9e5:	11 00 00 
    base.s.size = 0;
 9e8:	ba f4 11 00 00       	mov    $0x11f4,%edx
    base.s.ptr = freep = prevp = &base;
 9ed:	c7 05 f4 11 00 00 f4 	movl   $0x11f4,0x11f4
 9f4:	11 00 00 
    base.s.size = 0;
 9f7:	c7 05 f8 11 00 00 00 	movl   $0x0,0x11f8
 9fe:	00 00 00 
 a01:	e9 46 ff ff ff       	jmp    94c <malloc+0x2c>
 a06:	66 90                	xchg   %ax,%ax
 a08:	66 90                	xchg   %ax,%ax
 a0a:	66 90                	xchg   %ax,%ax
 a0c:	66 90                	xchg   %ax,%ax
 a0e:	66 90                	xchg   %ax,%ax

00000a10 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	56                   	push   %esi
 a14:	53                   	push   %ebx
 a15:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 a18:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 a1f:	e8 fc fe ff ff       	call   920 <malloc>

    if (bt == NULL) {
 a24:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 a26:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 a28:	74 66                	je     a90 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 a2a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 a31:	e8 ea fe ff ff       	call   920 <malloc>
    if (bt->bt_stack == NULL) {
 a36:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 a38:	89 c3                	mov    %eax,%ebx
 a3a:	89 46 08             	mov    %eax,0x8(%esi)
 a3d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 a40:	74 5d                	je     a9f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 a42:	25 ff 0f 00 00       	and    $0xfff,%eax
 a47:	75 37                	jne    a80 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 a49:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 a4f:	8b 45 10             	mov    0x10(%ebp),%eax
 a52:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 a56:	89 44 24 04          	mov    %eax,0x4(%esp)
 a5a:	8b 45 0c             	mov    0xc(%ebp),%eax
 a5d:	89 04 24             	mov    %eax,(%esp)
 a60:	e8 25 fb ff ff       	call   58a <kthread_create>
    if (bt->bid != 0) {
 a65:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 a67:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 a69:	74 2d                	je     a98 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 a6b:	8b 45 08             	mov    0x8(%ebp),%eax
 a6e:	89 30                	mov    %esi,(%eax)
        result = 0;
 a70:	31 c0                	xor    %eax,%eax
}
 a72:	83 c4 10             	add    $0x10,%esp
 a75:	5b                   	pop    %ebx
 a76:	5e                   	pop    %esi
 a77:	5d                   	pop    %ebp
 a78:	c3                   	ret    
 a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 a80:	29 c3                	sub    %eax,%ebx
 a82:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 a88:	89 5e 04             	mov    %ebx,0x4(%esi)
 a8b:	eb bc                	jmp    a49 <benny_thread_create+0x39>
 a8d:	8d 76 00             	lea    0x0(%esi),%esi
 a90:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 a96:	eb b7                	jmp    a4f <benny_thread_create+0x3f>
    int result = -1;
 a98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a9d:	eb d3                	jmp    a72 <benny_thread_create+0x62>
        free(bt);
 a9f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 aa2:	31 f6                	xor    %esi,%esi
        free(bt);
 aa4:	e8 e7 fd ff ff       	call   890 <free>
 aa9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 aac:	eb a1                	jmp    a4f <benny_thread_create+0x3f>
 aae:	66 90                	xchg   %ax,%ax

00000ab0 <benny_thread_bid>:
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 ab3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ab6:	5d                   	pop    %ebp
    return bt->bid;
 ab7:	8b 00                	mov    (%eax),%eax
}
 ab9:	c3                   	ret    
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ac0 <benny_thread_join>:
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	53                   	push   %ebx
 ac4:	83 ec 14             	sub    $0x14,%esp
 ac7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 aca:	8b 03                	mov    (%ebx),%eax
 acc:	89 04 24             	mov    %eax,(%esp)
 acf:	e8 be fa ff ff       	call   592 <kthread_join>
    if (retVal == 0) {
 ad4:	85 c0                	test   %eax,%eax
 ad6:	75 27                	jne    aff <benny_thread_join+0x3f>
        free(bt->mem_stack);
 ad8:	8b 53 08             	mov    0x8(%ebx),%edx
 adb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ade:	89 14 24             	mov    %edx,(%esp)
 ae1:	e8 aa fd ff ff       	call   890 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 ae6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 aed:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 af4:	89 1c 24             	mov    %ebx,(%esp)
 af7:	e8 94 fd ff ff       	call   890 <free>
 afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 aff:	83 c4 14             	add    $0x14,%esp
 b02:	5b                   	pop    %ebx
 b03:	5d                   	pop    %ebp
 b04:	c3                   	ret    
 b05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b10 <benny_thread_exit>:
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
}
 b13:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 b14:	e9 81 fa ff ff       	jmp    59a <kthread_exit>
 b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b20 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
 b23:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 b26:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 b2c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 b33:	31 c0                	xor    %eax,%eax
 b35:	5d                   	pop    %ebp
 b36:	c3                   	ret    
 b37:	89 f6                	mov    %esi,%esi
 b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b40 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 b40:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b41:	b8 01 00 00 00       	mov    $0x1,%eax
 b46:	89 e5                	mov    %esp,%ebp
 b48:	56                   	push   %esi
 b49:	53                   	push   %ebx
 b4a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b4d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 b50:	85 c0                	test   %eax,%eax
 b52:	be 01 00 00 00       	mov    $0x1,%esi
 b57:	74 15                	je     b6e <benny_mootex_yieldlock+0x2e>
 b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 b60:	e8 45 fa ff ff       	call   5aa <kthread_yield>
 b65:	89 f0                	mov    %esi,%eax
 b67:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 b6a:	85 c0                	test   %eax,%eax
 b6c:	75 f2                	jne    b60 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 b6e:	e8 2f fa ff ff       	call   5a2 <kthread_self>
    benny_mootex->bid = benny_self();
 b73:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b76:	31 c0                	xor    %eax,%eax
 b78:	5b                   	pop    %ebx
 b79:	5e                   	pop    %esi
 b7a:	5d                   	pop    %ebp
 b7b:	c3                   	ret    
 b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b80 <benny_mootex_spinlock>:
{
 b80:	55                   	push   %ebp
 b81:	ba 01 00 00 00       	mov    $0x1,%edx
 b86:	89 e5                	mov    %esp,%ebp
 b88:	53                   	push   %ebx
 b89:	83 ec 04             	sub    $0x4,%esp
 b8c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b8f:	90                   	nop
 b90:	89 d0                	mov    %edx,%eax
 b92:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 b95:	85 c0                	test   %eax,%eax
 b97:	75 f7                	jne    b90 <benny_mootex_spinlock+0x10>
    return kthread_self();
 b99:	e8 04 fa ff ff       	call   5a2 <kthread_self>
    benny_mootex->bid = benny_self();
 b9e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 ba1:	83 c4 04             	add    $0x4,%esp
 ba4:	31 c0                	xor    %eax,%eax
 ba6:	5b                   	pop    %ebx
 ba7:	5d                   	pop    %ebp
 ba8:	c3                   	ret    
 ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bb0 <benny_mootex_unlock>:
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
 bb3:	53                   	push   %ebx
 bb4:	83 ec 04             	sub    $0x4,%esp
 bb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 bba:	e8 e3 f9 ff ff       	call   5a2 <kthread_self>
    if(tid == benny_mootex->bid){
 bbf:	39 43 04             	cmp    %eax,0x4(%ebx)
 bc2:	75 1c                	jne    be0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 bc4:	0f ae f0             	mfence 
    return 0;
 bc7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 bc9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 bd0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 bd6:	83 c4 04             	add    $0x4,%esp
 bd9:	5b                   	pop    %ebx
 bda:	5d                   	pop    %ebp
 bdb:	c3                   	ret    
 bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 be0:	83 c4 04             	add    $0x4,%esp
      return -1;
 be3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 be8:	5b                   	pop    %ebx
 be9:	5d                   	pop    %ebp
 bea:	c3                   	ret    
 beb:	90                   	nop
 bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bf0 <benny_mootex_trylock>:
{
 bf0:	55                   	push   %ebp
 bf1:	b8 01 00 00 00       	mov    $0x1,%eax
 bf6:	89 e5                	mov    %esp,%ebp
 bf8:	53                   	push   %ebx
 bf9:	83 ec 04             	sub    $0x4,%esp
 bfc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bff:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 c02:	85 c0                	test   %eax,%eax
 c04:	75 08                	jne    c0e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 c06:	e8 97 f9 ff ff       	call   5a2 <kthread_self>
        benny_mootex->bid = tid;
 c0b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 c0e:	83 c4 04             	add    $0x4,%esp
 c11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c16:	5b                   	pop    %ebx
 c17:	5d                   	pop    %ebp
 c18:	c3                   	ret    
 c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c20 <benny_mootex_wholock>:
{
 c20:	55                   	push   %ebp
 c21:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 c23:	8b 45 08             	mov    0x8(%ebp),%eax
}
 c26:	5d                   	pop    %ebp
    return benny_mootex->bid;
 c27:	8b 40 04             	mov    0x4(%eax),%eax
}
 c2a:	c3                   	ret    
 c2b:	90                   	nop
 c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c30 <benny_mootex_islocked>:
{
 c30:	55                   	push   %ebp
 c31:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 c33:	8b 45 08             	mov    0x8(%ebp),%eax
}
 c36:	5d                   	pop    %ebp
    return benny_mootex->locked;
 c37:	8b 00                	mov    (%eax),%eax
}
 c39:	c3                   	ret    
 c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c40 <benny_self>:
{
 c40:	55                   	push   %ebp
 c41:	89 e5                	mov    %esp,%ebp
}
 c43:	5d                   	pop    %ebp
    return kthread_self();
 c44:	e9 59 f9 ff ff       	jmp    5a2 <kthread_self>
 c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c50 <benny_yield>:
{
 c50:	55                   	push   %ebp
 c51:	89 e5                	mov    %esp,%ebp
    
}
 c53:	5d                   	pop    %ebp
    return kthread_yield();
 c54:	e9 51 f9 ff ff       	jmp    5aa <kthread_yield>
 c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 c60:	55                   	push   %ebp
 c61:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 c63:	5d                   	pop    %ebp
    return kthread_cpu_count();
 c64:	e9 49 f9 ff ff       	jmp    5b2 <kthread_cpu_count>
 c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c70 <benny_thread_count>:

int
benny_thread_count(void)
{
 c70:	55                   	push   %ebp
 c71:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 c73:	5d                   	pop    %ebp
    return kthread_thread_count();
 c74:	e9 41 f9 ff ff       	jmp    5ba <kthread_thread_count>
