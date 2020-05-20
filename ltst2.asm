
_ltst2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#endif // BENNY_MOOTEX

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 20             	sub    $0x20,%esp
#ifdef BENNY_MOOTEX
    int i = 0;
    benny_thread_t bt = NULL;
   a:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  11:	00 
    int ncpus = benny_cpu_count();
  12:	e8 a9 0b 00 00       	call   bc0 <benny_cpu_count>

    if (ncpus < 2) {
  17:	83 f8 01             	cmp    $0x1,%eax
  1a:	0f 8e 34 01 00 00    	jle    154 <main+0x154>
        printf(1, "this is more interesting with more than 1 cpu\n");
    }
    global = 0;
    dolocks = FALSE;
    benny_thread_create(&bt, func1, (void *) NULL);
  20:	8d 5c 24 1c          	lea    0x1c(%esp),%ebx
  24:	89 1c 24             	mov    %ebx,(%esp)
  27:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  2e:	00 
  2f:	c7 44 24 04 70 01 00 	movl   $0x170,0x4(%esp)
  36:	00 
    global = 0;
  37:	c7 05 5c 11 00 00 00 	movl   $0x0,0x115c
  3e:	00 00 00 
    dolocks = FALSE;
  41:	c7 05 58 11 00 00 00 	movl   $0x0,0x1158
  48:	00 00 00 
    benny_thread_create(&bt, func1, (void *) NULL);
  4b:	e8 20 09 00 00       	call   970 <benny_thread_create>
    sleep(1);
  50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  57:	e8 56 04 00 00       	call   4b2 <sleep>
    for (i = 0; i < ITERATIONS; i++) {
        global++;
    }
    benny_thread_join(bt);
  5c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  60:	83 05 5c 11 00 00 0f 	addl   $0xf,0x115c
  67:	89 04 24             	mov    %eax,(%esp)
  6a:	e8 b1 09 00 00       	call   a20 <benny_thread_join>
    printf(1, "\tglobal value without locks: %d\n", global);
  6f:	a1 5c 11 00 00       	mov    0x115c,%eax
  74:	c7 44 24 04 34 0c 00 	movl   $0xc34,0x4(%esp)
  7b:	00 
  7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  83:	89 44 24 08          	mov    %eax,0x8(%esp)
  87:	e8 44 05 00 00       	call   5d0 <printf>

    global = 0;
    dolocks = TRUE;
    benny_thread_create(&bt, func1, (void *) NULL);
  8c:	89 1c 24             	mov    %ebx,(%esp)
    sleep(1);
  8f:	bb 0f 00 00 00       	mov    $0xf,%ebx
    benny_thread_create(&bt, func1, (void *) NULL);
  94:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  9b:	00 
  9c:	c7 44 24 04 70 01 00 	movl   $0x170,0x4(%esp)
  a3:	00 
    global = 0;
  a4:	c7 05 5c 11 00 00 00 	movl   $0x0,0x115c
  ab:	00 00 00 
    dolocks = TRUE;
  ae:	c7 05 58 11 00 00 01 	movl   $0x1,0x1158
  b5:	00 00 00 
    benny_thread_create(&bt, func1, (void *) NULL);
  b8:	e8 b3 08 00 00       	call   970 <benny_thread_create>
    sleep(1);
  bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c4:	e8 e9 03 00 00       	call   4b2 <sleep>
  c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i < ITERATIONS; i++) {
        benny_mootex_yieldlock(&mootex);
  d0:	c7 04 24 50 11 00 00 	movl   $0x1150,(%esp)
  d7:	e8 c4 09 00 00       	call   aa0 <benny_mootex_yieldlock>
        global++;
        benny_mootex_unlock(&mootex);
  dc:	c7 04 24 50 11 00 00 	movl   $0x1150,(%esp)
        global++;
  e3:	83 05 5c 11 00 00 01 	addl   $0x1,0x115c
        benny_mootex_unlock(&mootex);
  ea:	e8 21 0a 00 00       	call   b10 <benny_mootex_unlock>
    for (i = 0; i < ITERATIONS; i++) {
  ef:	83 eb 01             	sub    $0x1,%ebx
  f2:	75 dc                	jne    d0 <main+0xd0>
    }
    benny_thread_join(bt);
  f4:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  f8:	89 04 24             	mov    %eax,(%esp)
  fb:	e8 20 09 00 00       	call   a20 <benny_thread_join>

    printf(1, "\tglobal value with locks   : %d\n", global);
 100:	a1 5c 11 00 00       	mov    0x115c,%eax
 105:	c7 44 24 04 58 0c 00 	movl   $0xc58,0x4(%esp)
 10c:	00 
 10d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	e8 b3 04 00 00       	call   5d0 <printf>
    assert(global == (ITERATIONS * 2));
 11d:	83 3d 5c 11 00 00 1e 	cmpl   $0x1e,0x115c
 124:	74 29                	je     14f <main+0x14f>
 126:	c7 44 24 0c 49 00 00 	movl   $0x49,0xc(%esp)
 12d:	00 
 12e:	c7 44 24 08 fa 0b 00 	movl   $0xbfa,0x8(%esp)
 135:	00 
 136:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 13d:	00 
 13e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 145:	e8 86 04 00 00       	call   5d0 <printf>
 14a:	e8 d3 02 00 00       	call   422 <exit>
#endif // BENNY_MOOTEX
    exit();
 14f:	e8 ce 02 00 00       	call   422 <exit>
        printf(1, "this is more interesting with more than 1 cpu\n");
 154:	c7 44 24 04 04 0c 00 	movl   $0xc04,0x4(%esp)
 15b:	00 
 15c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 163:	e8 68 04 00 00       	call   5d0 <printf>
 168:	e9 b3 fe ff ff       	jmp    20 <main+0x20>
 16d:	66 90                	xchg   %ax,%ax
 16f:	90                   	nop

00000170 <func1>:
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
    printf(1, "thread starting\n");
 174:	bb 0f 00 00 00       	mov    $0xf,%ebx
{
 179:	83 ec 14             	sub    $0x14,%esp
    printf(1, "thread starting\n");
 17c:	c7 44 24 04 dc 0b 00 	movl   $0xbdc,0x4(%esp)
 183:	00 
 184:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18b:	e8 40 04 00 00       	call   5d0 <printf>
 190:	eb 12                	jmp    1a4 <func1+0x34>
 192:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        global++;
 198:	83 05 5c 11 00 00 01 	addl   $0x1,0x115c
    for (i = 0; i < ITERATIONS; i++) {
 19f:	83 eb 01             	sub    $0x1,%ebx
 1a2:	74 37                	je     1db <func1+0x6b>
        if (dolocks) {
 1a4:	8b 15 58 11 00 00    	mov    0x1158,%edx
 1aa:	85 d2                	test   %edx,%edx
 1ac:	74 ea                	je     198 <func1+0x28>
            benny_mootex_yieldlock(&mootex);
 1ae:	c7 04 24 50 11 00 00 	movl   $0x1150,(%esp)
 1b5:	e8 e6 08 00 00       	call   aa0 <benny_mootex_yieldlock>
        if (dolocks) {
 1ba:	a1 58 11 00 00       	mov    0x1158,%eax
        global++;
 1bf:	83 05 5c 11 00 00 01 	addl   $0x1,0x115c
        if (dolocks) {
 1c6:	85 c0                	test   %eax,%eax
 1c8:	74 d5                	je     19f <func1+0x2f>
            benny_mootex_unlock(&mootex);
 1ca:	c7 04 24 50 11 00 00 	movl   $0x1150,(%esp)
 1d1:	e8 3a 09 00 00       	call   b10 <benny_mootex_unlock>
    for (i = 0; i < ITERATIONS; i++) {
 1d6:	83 eb 01             	sub    $0x1,%ebx
 1d9:	75 c9                	jne    1a4 <func1+0x34>
    printf(1, "thread done\n");
 1db:	c7 44 24 04 ed 0b 00 	movl   $0xbed,0x4(%esp)
 1e2:	00 
 1e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ea:	e8 e1 03 00 00       	call   5d0 <printf>
    benny_thread_exit(0);
 1ef:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
}
 1f6:	83 c4 14             	add    $0x14,%esp
 1f9:	5b                   	pop    %ebx
 1fa:	5d                   	pop    %ebp
    benny_thread_exit(0);
 1fb:	e9 70 08 00 00       	jmp    a70 <benny_thread_exit>

00000200 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 209:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 20a:	89 c2                	mov    %eax,%edx
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 210:	83 c1 01             	add    $0x1,%ecx
 213:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 217:	83 c2 01             	add    $0x1,%edx
 21a:	84 db                	test   %bl,%bl
 21c:	88 5a ff             	mov    %bl,-0x1(%edx)
 21f:	75 ef                	jne    210 <strcpy+0x10>
    ;
  return os;
}
 221:	5b                   	pop    %ebx
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 22a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000230 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 55 08             	mov    0x8(%ebp),%edx
 236:	53                   	push   %ebx
 237:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 23a:	0f b6 02             	movzbl (%edx),%eax
 23d:	84 c0                	test   %al,%al
 23f:	74 2d                	je     26e <strcmp+0x3e>
 241:	0f b6 19             	movzbl (%ecx),%ebx
 244:	38 d8                	cmp    %bl,%al
 246:	74 0e                	je     256 <strcmp+0x26>
 248:	eb 2b                	jmp    275 <strcmp+0x45>
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 250:	38 c8                	cmp    %cl,%al
 252:	75 15                	jne    269 <strcmp+0x39>
    p++, q++;
 254:	89 d9                	mov    %ebx,%ecx
 256:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 259:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 25c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 25f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 263:	84 c0                	test   %al,%al
 265:	75 e9                	jne    250 <strcmp+0x20>
 267:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 269:	29 c8                	sub    %ecx,%eax
}
 26b:	5b                   	pop    %ebx
 26c:	5d                   	pop    %ebp
 26d:	c3                   	ret    
 26e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 271:	31 c0                	xor    %eax,%eax
 273:	eb f4                	jmp    269 <strcmp+0x39>
 275:	0f b6 cb             	movzbl %bl,%ecx
 278:	eb ef                	jmp    269 <strcmp+0x39>
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <strlen>:

uint
strlen(const char *s)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 286:	80 39 00             	cmpb   $0x0,(%ecx)
 289:	74 12                	je     29d <strlen+0x1d>
 28b:	31 d2                	xor    %edx,%edx
 28d:	8d 76 00             	lea    0x0(%esi),%esi
 290:	83 c2 01             	add    $0x1,%edx
 293:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 297:	89 d0                	mov    %edx,%eax
 299:	75 f5                	jne    290 <strlen+0x10>
    ;
  return n;
}
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 29d:	31 c0                	xor    %eax,%eax
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	eb 0d                	jmp    2b0 <memset>
 2a3:	90                   	nop
 2a4:	90                   	nop
 2a5:	90                   	nop
 2a6:	90                   	nop
 2a7:	90                   	nop
 2a8:	90                   	nop
 2a9:	90                   	nop
 2aa:	90                   	nop
 2ab:	90                   	nop
 2ac:	90                   	nop
 2ad:	90                   	nop
 2ae:	90                   	nop
 2af:	90                   	nop

000002b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 55 08             	mov    0x8(%ebp),%edx
 2b6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 d7                	mov    %edx,%edi
 2bf:	fc                   	cld    
 2c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c2:	89 d0                	mov    %edx,%eax
 2c4:	5f                   	pop    %edi
 2c5:	5d                   	pop    %ebp
 2c6:	c3                   	ret    
 2c7:	89 f6                	mov    %esi,%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	53                   	push   %ebx
 2d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 2da:	0f b6 18             	movzbl (%eax),%ebx
 2dd:	84 db                	test   %bl,%bl
 2df:	74 1d                	je     2fe <strchr+0x2e>
    if(*s == c)
 2e1:	38 d3                	cmp    %dl,%bl
 2e3:	89 d1                	mov    %edx,%ecx
 2e5:	75 0d                	jne    2f4 <strchr+0x24>
 2e7:	eb 17                	jmp    300 <strchr+0x30>
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2f0:	38 ca                	cmp    %cl,%dl
 2f2:	74 0c                	je     300 <strchr+0x30>
  for(; *s; s++)
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	0f b6 10             	movzbl (%eax),%edx
 2fa:	84 d2                	test   %dl,%dl
 2fc:	75 f2                	jne    2f0 <strchr+0x20>
      return (char*)s;
  return 0;
 2fe:	31 c0                	xor    %eax,%eax
}
 300:	5b                   	pop    %ebx
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    
 303:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <gets>:

char*
gets(char *buf, int max)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 315:	31 f6                	xor    %esi,%esi
{
 317:	53                   	push   %ebx
 318:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 31b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 31e:	eb 31                	jmp    351 <gets+0x41>
    cc = read(0, &c, 1);
 320:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 327:	00 
 328:	89 7c 24 04          	mov    %edi,0x4(%esp)
 32c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 333:	e8 02 01 00 00       	call   43a <read>
    if(cc < 1)
 338:	85 c0                	test   %eax,%eax
 33a:	7e 1d                	jle    359 <gets+0x49>
      break;
    buf[i++] = c;
 33c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 340:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 342:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 345:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 347:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 34b:	74 0c                	je     359 <gets+0x49>
 34d:	3c 0a                	cmp    $0xa,%al
 34f:	74 08                	je     359 <gets+0x49>
  for(i=0; i+1 < max; ){
 351:	8d 5e 01             	lea    0x1(%esi),%ebx
 354:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 357:	7c c7                	jl     320 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 359:	8b 45 08             	mov    0x8(%ebp),%eax
 35c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 360:	83 c4 2c             	add    $0x2c,%esp
 363:	5b                   	pop    %ebx
 364:	5e                   	pop    %esi
 365:	5f                   	pop    %edi
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    
 368:	90                   	nop
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <stat>:

int
stat(const char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 382:	00 
 383:	89 04 24             	mov    %eax,(%esp)
 386:	e8 d7 00 00 00       	call   462 <open>
  if(fd < 0)
 38b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 38d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 38f:	78 27                	js     3b8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 391:	8b 45 0c             	mov    0xc(%ebp),%eax
 394:	89 1c 24             	mov    %ebx,(%esp)
 397:	89 44 24 04          	mov    %eax,0x4(%esp)
 39b:	e8 da 00 00 00       	call   47a <fstat>
  close(fd);
 3a0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3a3:	89 c6                	mov    %eax,%esi
  close(fd);
 3a5:	e8 a0 00 00 00       	call   44a <close>
  return r;
 3aa:	89 f0                	mov    %esi,%eax
}
 3ac:	83 c4 10             	add    $0x10,%esp
 3af:	5b                   	pop    %ebx
 3b0:	5e                   	pop    %esi
 3b1:	5d                   	pop    %ebp
 3b2:	c3                   	ret    
 3b3:	90                   	nop
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3bd:	eb ed                	jmp    3ac <stat+0x3c>
 3bf:	90                   	nop

000003c0 <atoi>:

int
atoi(const char *s)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c7:	0f be 11             	movsbl (%ecx),%edx
 3ca:	8d 42 d0             	lea    -0x30(%edx),%eax
 3cd:	3c 09                	cmp    $0x9,%al
  n = 0;
 3cf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3d4:	77 17                	ja     3ed <atoi+0x2d>
 3d6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3d8:	83 c1 01             	add    $0x1,%ecx
 3db:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3de:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3e2:	0f be 11             	movsbl (%ecx),%edx
 3e5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3e8:	80 fb 09             	cmp    $0x9,%bl
 3eb:	76 eb                	jbe    3d8 <atoi+0x18>
  return n;
}
 3ed:	5b                   	pop    %ebx
 3ee:	5d                   	pop    %ebp
 3ef:	c3                   	ret    

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3f1:	31 d2                	xor    %edx,%edx
{
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	56                   	push   %esi
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	53                   	push   %ebx
 3fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 400:	85 db                	test   %ebx,%ebx
 402:	7e 12                	jle    416 <memmove+0x26>
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 408:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 40c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 40f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 412:	39 da                	cmp    %ebx,%edx
 414:	75 f2                	jne    408 <memmove+0x18>
  return vdst;
}
 416:	5b                   	pop    %ebx
 417:	5e                   	pop    %esi
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    

0000041a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41a:	b8 01 00 00 00       	mov    $0x1,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <exit>:
SYSCALL(exit)
 422:	b8 02 00 00 00       	mov    $0x2,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <wait>:
SYSCALL(wait)
 42a:	b8 03 00 00 00       	mov    $0x3,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <pipe>:
SYSCALL(pipe)
 432:	b8 04 00 00 00       	mov    $0x4,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <read>:
SYSCALL(read)
 43a:	b8 05 00 00 00       	mov    $0x5,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <write>:
SYSCALL(write)
 442:	b8 10 00 00 00       	mov    $0x10,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <close>:
SYSCALL(close)
 44a:	b8 15 00 00 00       	mov    $0x15,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <kill>:
SYSCALL(kill)
 452:	b8 06 00 00 00       	mov    $0x6,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <exec>:
SYSCALL(exec)
 45a:	b8 07 00 00 00       	mov    $0x7,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <open>:
SYSCALL(open)
 462:	b8 0f 00 00 00       	mov    $0xf,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <mknod>:
SYSCALL(mknod)
 46a:	b8 11 00 00 00       	mov    $0x11,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <unlink>:
SYSCALL(unlink)
 472:	b8 12 00 00 00       	mov    $0x12,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <fstat>:
SYSCALL(fstat)
 47a:	b8 08 00 00 00       	mov    $0x8,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <link>:
SYSCALL(link)
 482:	b8 13 00 00 00       	mov    $0x13,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <mkdir>:
SYSCALL(mkdir)
 48a:	b8 14 00 00 00       	mov    $0x14,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <chdir>:
SYSCALL(chdir)
 492:	b8 09 00 00 00       	mov    $0x9,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <dup>:
SYSCALL(dup)
 49a:	b8 0a 00 00 00       	mov    $0xa,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <getpid>:
SYSCALL(getpid)
 4a2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <sbrk>:
SYSCALL(sbrk)
 4aa:	b8 0c 00 00 00       	mov    $0xc,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <sleep>:
SYSCALL(sleep)
 4b2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <uptime>:
SYSCALL(uptime)
 4ba:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 4c2:	b8 16 00 00 00       	mov    $0x16,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 4ca:	b8 17 00 00 00       	mov    $0x17,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 4d2:	b8 18 00 00 00       	mov    $0x18,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 4da:	b8 19 00 00 00       	mov    $0x19,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 4e2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 4ea:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <kthread_join>:
SYSCALL(kthread_join)
 4f2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <kthread_exit>:
SYSCALL(kthread_exit)
 4fa:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 502:	b8 1e 00 00 00       	mov    $0x1e,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <kthread_yield>:
SYSCALL(kthread_yield)
 50a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 512:	b8 20 00 00 00       	mov    $0x20,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 51a:	b8 21 00 00 00       	mov    $0x21,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    
 522:	66 90                	xchg   %ax,%ax
 524:	66 90                	xchg   %ax,%ax
 526:	66 90                	xchg   %ax,%ax
 528:	66 90                	xchg   %ax,%ax
 52a:	66 90                	xchg   %ax,%ax
 52c:	66 90                	xchg   %ax,%ax
 52e:	66 90                	xchg   %ax,%ax

00000530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	89 c6                	mov    %eax,%esi
 537:	53                   	push   %ebx
 538:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 53b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 53e:	85 db                	test   %ebx,%ebx
 540:	74 09                	je     54b <printint+0x1b>
 542:	89 d0                	mov    %edx,%eax
 544:	c1 e8 1f             	shr    $0x1f,%eax
 547:	84 c0                	test   %al,%al
 549:	75 75                	jne    5c0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 54b:	89 d0                	mov    %edx,%eax
  neg = 0;
 54d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 554:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 557:	31 ff                	xor    %edi,%edi
 559:	89 ce                	mov    %ecx,%esi
 55b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 55e:	eb 02                	jmp    562 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 560:	89 cf                	mov    %ecx,%edi
 562:	31 d2                	xor    %edx,%edx
 564:	f7 f6                	div    %esi
 566:	8d 4f 01             	lea    0x1(%edi),%ecx
 569:	0f b6 92 a7 0c 00 00 	movzbl 0xca7(%edx),%edx
  }while((x /= base) != 0);
 570:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 572:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 575:	75 e9                	jne    560 <printint+0x30>
  if(neg)
 577:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 57a:	89 c8                	mov    %ecx,%eax
 57c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 57f:	85 d2                	test   %edx,%edx
 581:	74 08                	je     58b <printint+0x5b>
    buf[i++] = '-';
 583:	8d 4f 02             	lea    0x2(%edi),%ecx
 586:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 58b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 58e:	66 90                	xchg   %ax,%ax
 590:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 595:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 598:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 59f:	00 
 5a0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 5a4:	89 34 24             	mov    %esi,(%esp)
 5a7:	88 45 d7             	mov    %al,-0x29(%ebp)
 5aa:	e8 93 fe ff ff       	call   442 <write>
  while(--i >= 0)
 5af:	83 ff ff             	cmp    $0xffffffff,%edi
 5b2:	75 dc                	jne    590 <printint+0x60>
    putc(fd, buf[i]);
}
 5b4:	83 c4 4c             	add    $0x4c,%esp
 5b7:	5b                   	pop    %ebx
 5b8:	5e                   	pop    %esi
 5b9:	5f                   	pop    %edi
 5ba:	5d                   	pop    %ebp
 5bb:	c3                   	ret    
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 5c0:	89 d0                	mov    %edx,%eax
 5c2:	f7 d8                	neg    %eax
    neg = 1;
 5c4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 5cb:	eb 87                	jmp    554 <printint+0x24>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5d4:	31 ff                	xor    %edi,%edi
{
 5d6:	56                   	push   %esi
 5d7:	53                   	push   %ebx
 5d8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 5de:	8d 45 10             	lea    0x10(%ebp),%eax
{
 5e1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 5e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 5e7:	0f b6 13             	movzbl (%ebx),%edx
 5ea:	83 c3 01             	add    $0x1,%ebx
 5ed:	84 d2                	test   %dl,%dl
 5ef:	75 39                	jne    62a <printf+0x5a>
 5f1:	e9 ca 00 00 00       	jmp    6c0 <printf+0xf0>
 5f6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5f8:	83 fa 25             	cmp    $0x25,%edx
 5fb:	0f 84 c7 00 00 00    	je     6c8 <printf+0xf8>
  write(fd, &c, 1);
 601:	8d 45 e0             	lea    -0x20(%ebp),%eax
 604:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 60b:	00 
 60c:	89 44 24 04          	mov    %eax,0x4(%esp)
 610:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 613:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 616:	e8 27 fe ff ff       	call   442 <write>
 61b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 61e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 622:	84 d2                	test   %dl,%dl
 624:	0f 84 96 00 00 00    	je     6c0 <printf+0xf0>
    if(state == 0){
 62a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 62c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 62f:	74 c7                	je     5f8 <printf+0x28>
      }
    } else if(state == '%'){
 631:	83 ff 25             	cmp    $0x25,%edi
 634:	75 e5                	jne    61b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 636:	83 fa 75             	cmp    $0x75,%edx
 639:	0f 84 99 00 00 00    	je     6d8 <printf+0x108>
 63f:	83 fa 64             	cmp    $0x64,%edx
 642:	0f 84 90 00 00 00    	je     6d8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 648:	25 f7 00 00 00       	and    $0xf7,%eax
 64d:	83 f8 70             	cmp    $0x70,%eax
 650:	0f 84 aa 00 00 00    	je     700 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 656:	83 fa 73             	cmp    $0x73,%edx
 659:	0f 84 e9 00 00 00    	je     748 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 65f:	83 fa 63             	cmp    $0x63,%edx
 662:	0f 84 2b 01 00 00    	je     793 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 668:	83 fa 25             	cmp    $0x25,%edx
 66b:	0f 84 4f 01 00 00    	je     7c0 <printf+0x1f0>
  write(fd, &c, 1);
 671:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 674:	83 c3 01             	add    $0x1,%ebx
 677:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 67e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 67f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 681:	89 44 24 04          	mov    %eax,0x4(%esp)
 685:	89 34 24             	mov    %esi,(%esp)
 688:	89 55 d0             	mov    %edx,-0x30(%ebp)
 68b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 68f:	e8 ae fd ff ff       	call   442 <write>
        putc(fd, c);
 694:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 697:	8d 45 e7             	lea    -0x19(%ebp),%eax
 69a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6a1:	00 
 6a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 6a9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6ac:	e8 91 fd ff ff       	call   442 <write>
  for(i = 0; fmt[i]; i++){
 6b1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 6b5:	84 d2                	test   %dl,%dl
 6b7:	0f 85 6d ff ff ff    	jne    62a <printf+0x5a>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 6c0:	83 c4 3c             	add    $0x3c,%esp
 6c3:	5b                   	pop    %ebx
 6c4:	5e                   	pop    %esi
 6c5:	5f                   	pop    %edi
 6c6:	5d                   	pop    %ebp
 6c7:	c3                   	ret    
        state = '%';
 6c8:	bf 25 00 00 00       	mov    $0x25,%edi
 6cd:	e9 49 ff ff ff       	jmp    61b <printf+0x4b>
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6df:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 6e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6e7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 6e9:	8b 10                	mov    (%eax),%edx
 6eb:	89 f0                	mov    %esi,%eax
 6ed:	e8 3e fe ff ff       	call   530 <printint>
        ap++;
 6f2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6f6:	e9 20 ff ff ff       	jmp    61b <printf+0x4b>
 6fb:	90                   	nop
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 700:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 703:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 70a:	00 
 70b:	89 44 24 04          	mov    %eax,0x4(%esp)
 70f:	89 34 24             	mov    %esi,(%esp)
 712:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 716:	e8 27 fd ff ff       	call   442 <write>
 71b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 71e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 725:	00 
 726:	89 44 24 04          	mov    %eax,0x4(%esp)
 72a:	89 34 24             	mov    %esi,(%esp)
 72d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 731:	e8 0c fd ff ff       	call   442 <write>
        printint(fd, *ap, 16, 0);
 736:	b9 10 00 00 00       	mov    $0x10,%ecx
 73b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 742:	eb a0                	jmp    6e4 <printf+0x114>
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 748:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 74b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 74f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 751:	b8 a0 0c 00 00       	mov    $0xca0,%eax
 756:	85 ff                	test   %edi,%edi
 758:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 75b:	0f b6 07             	movzbl (%edi),%eax
 75e:	84 c0                	test   %al,%al
 760:	74 2a                	je     78c <printf+0x1bc>
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 768:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 76b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 76e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 771:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 778:	00 
 779:	89 44 24 04          	mov    %eax,0x4(%esp)
 77d:	89 34 24             	mov    %esi,(%esp)
 780:	e8 bd fc ff ff       	call   442 <write>
        while(*s != 0){
 785:	0f b6 07             	movzbl (%edi),%eax
 788:	84 c0                	test   %al,%al
 78a:	75 dc                	jne    768 <printf+0x198>
      state = 0;
 78c:	31 ff                	xor    %edi,%edi
 78e:	e9 88 fe ff ff       	jmp    61b <printf+0x4b>
        putc(fd, *ap);
 793:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 796:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 798:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 79a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7a1:	00 
 7a2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 7a5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 7a8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 7af:	e8 8e fc ff ff       	call   442 <write>
        ap++;
 7b4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7b8:	e9 5e fe ff ff       	jmp    61b <printf+0x4b>
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7c0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 7c3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7c5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7cc:	00 
 7cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d1:	89 34 24             	mov    %esi,(%esp)
 7d4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 7d8:	e8 65 fc ff ff       	call   442 <write>
 7dd:	e9 39 fe ff ff       	jmp    61b <printf+0x4b>
 7e2:	66 90                	xchg   %ax,%ax
 7e4:	66 90                	xchg   %ax,%ax
 7e6:	66 90                	xchg   %ax,%ax
 7e8:	66 90                	xchg   %ax,%ax
 7ea:	66 90                	xchg   %ax,%ax
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	a1 60 11 00 00       	mov    0x1160,%eax
{
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	53                   	push   %ebx
 7fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7fe:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 800:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 803:	39 d0                	cmp    %edx,%eax
 805:	72 11                	jb     818 <free+0x28>
 807:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 808:	39 c8                	cmp    %ecx,%eax
 80a:	72 04                	jb     810 <free+0x20>
 80c:	39 ca                	cmp    %ecx,%edx
 80e:	72 10                	jb     820 <free+0x30>
 810:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 812:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 814:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 816:	73 f0                	jae    808 <free+0x18>
 818:	39 ca                	cmp    %ecx,%edx
 81a:	72 04                	jb     820 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81c:	39 c8                	cmp    %ecx,%eax
 81e:	72 f0                	jb     810 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 820:	8b 73 fc             	mov    -0x4(%ebx),%esi
 823:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 826:	39 cf                	cmp    %ecx,%edi
 828:	74 1e                	je     848 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 82a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 82d:	8b 48 04             	mov    0x4(%eax),%ecx
 830:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 833:	39 f2                	cmp    %esi,%edx
 835:	74 28                	je     85f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 837:	89 10                	mov    %edx,(%eax)
  freep = p;
 839:	a3 60 11 00 00       	mov    %eax,0x1160
}
 83e:	5b                   	pop    %ebx
 83f:	5e                   	pop    %esi
 840:	5f                   	pop    %edi
 841:	5d                   	pop    %ebp
 842:	c3                   	ret    
 843:	90                   	nop
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 848:	03 71 04             	add    0x4(%ecx),%esi
 84b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 84e:	8b 08                	mov    (%eax),%ecx
 850:	8b 09                	mov    (%ecx),%ecx
 852:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 855:	8b 48 04             	mov    0x4(%eax),%ecx
 858:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 85b:	39 f2                	cmp    %esi,%edx
 85d:	75 d8                	jne    837 <free+0x47>
    p->s.size += bp->s.size;
 85f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 862:	a3 60 11 00 00       	mov    %eax,0x1160
    p->s.size += bp->s.size;
 867:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 86d:	89 10                	mov    %edx,(%eax)
}
 86f:	5b                   	pop    %ebx
 870:	5e                   	pop    %esi
 871:	5f                   	pop    %edi
 872:	5d                   	pop    %ebp
 873:	c3                   	ret    
 874:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 87a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000880 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 88c:	8b 1d 60 11 00 00    	mov    0x1160,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 892:	8d 48 07             	lea    0x7(%eax),%ecx
 895:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 898:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 89d:	0f 84 9b 00 00 00    	je     93e <malloc+0xbe>
 8a3:	8b 13                	mov    (%ebx),%edx
 8a5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8a8:	39 fe                	cmp    %edi,%esi
 8aa:	76 64                	jbe    910 <malloc+0x90>
 8ac:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 8b3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 8b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8bb:	eb 0e                	jmp    8cb <malloc+0x4b>
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8c2:	8b 78 04             	mov    0x4(%eax),%edi
 8c5:	39 fe                	cmp    %edi,%esi
 8c7:	76 4f                	jbe    918 <malloc+0x98>
 8c9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8cb:	3b 15 60 11 00 00    	cmp    0x1160,%edx
 8d1:	75 ed                	jne    8c0 <malloc+0x40>
  if(nu < 4096)
 8d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8d6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8dc:	bf 00 10 00 00       	mov    $0x1000,%edi
 8e1:	0f 43 fe             	cmovae %esi,%edi
 8e4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 8e7:	89 04 24             	mov    %eax,(%esp)
 8ea:	e8 bb fb ff ff       	call   4aa <sbrk>
  if(p == (char*)-1)
 8ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 8f2:	74 18                	je     90c <malloc+0x8c>
  hp->s.size = nu;
 8f4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 8f7:	83 c0 08             	add    $0x8,%eax
 8fa:	89 04 24             	mov    %eax,(%esp)
 8fd:	e8 ee fe ff ff       	call   7f0 <free>
  return freep;
 902:	8b 15 60 11 00 00    	mov    0x1160,%edx
      if((p = morecore(nunits)) == 0)
 908:	85 d2                	test   %edx,%edx
 90a:	75 b4                	jne    8c0 <malloc+0x40>
        return 0;
 90c:	31 c0                	xor    %eax,%eax
 90e:	eb 20                	jmp    930 <malloc+0xb0>
    if(p->s.size >= nunits){
 910:	89 d0                	mov    %edx,%eax
 912:	89 da                	mov    %ebx,%edx
 914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 918:	39 fe                	cmp    %edi,%esi
 91a:	74 1c                	je     938 <malloc+0xb8>
        p->s.size -= nunits;
 91c:	29 f7                	sub    %esi,%edi
 91e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 921:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 924:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 927:	89 15 60 11 00 00    	mov    %edx,0x1160
      return (void*)(p + 1);
 92d:	83 c0 08             	add    $0x8,%eax
  }
}
 930:	83 c4 1c             	add    $0x1c,%esp
 933:	5b                   	pop    %ebx
 934:	5e                   	pop    %esi
 935:	5f                   	pop    %edi
 936:	5d                   	pop    %ebp
 937:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 938:	8b 08                	mov    (%eax),%ecx
 93a:	89 0a                	mov    %ecx,(%edx)
 93c:	eb e9                	jmp    927 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 93e:	c7 05 60 11 00 00 64 	movl   $0x1164,0x1160
 945:	11 00 00 
    base.s.size = 0;
 948:	ba 64 11 00 00       	mov    $0x1164,%edx
    base.s.ptr = freep = prevp = &base;
 94d:	c7 05 64 11 00 00 64 	movl   $0x1164,0x1164
 954:	11 00 00 
    base.s.size = 0;
 957:	c7 05 68 11 00 00 00 	movl   $0x0,0x1168
 95e:	00 00 00 
 961:	e9 46 ff ff ff       	jmp    8ac <malloc+0x2c>
 966:	66 90                	xchg   %ax,%ax
 968:	66 90                	xchg   %ax,%ax
 96a:	66 90                	xchg   %ax,%ax
 96c:	66 90                	xchg   %ax,%ax
 96e:	66 90                	xchg   %ax,%ax

00000970 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	56                   	push   %esi
 974:	53                   	push   %ebx
 975:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 978:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 97f:	e8 fc fe ff ff       	call   880 <malloc>

    if (bt == NULL) {
 984:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 986:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 988:	74 66                	je     9f0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 98a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 991:	e8 ea fe ff ff       	call   880 <malloc>
    if (bt->bt_stack == NULL) {
 996:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 998:	89 c3                	mov    %eax,%ebx
 99a:	89 46 08             	mov    %eax,0x8(%esi)
 99d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 9a0:	74 5d                	je     9ff <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 9a2:	25 ff 0f 00 00       	and    $0xfff,%eax
 9a7:	75 37                	jne    9e0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 9a9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 9af:	8b 45 10             	mov    0x10(%ebp),%eax
 9b2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 9b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 9ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 9bd:	89 04 24             	mov    %eax,(%esp)
 9c0:	e8 25 fb ff ff       	call   4ea <kthread_create>
    if (bt->bid != 0) {
 9c5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 9c7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 9c9:	74 2d                	je     9f8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 9cb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ce:	89 30                	mov    %esi,(%eax)
        result = 0;
 9d0:	31 c0                	xor    %eax,%eax
}
 9d2:	83 c4 10             	add    $0x10,%esp
 9d5:	5b                   	pop    %ebx
 9d6:	5e                   	pop    %esi
 9d7:	5d                   	pop    %ebp
 9d8:	c3                   	ret    
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 9e0:	29 c3                	sub    %eax,%ebx
 9e2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 9e8:	89 5e 04             	mov    %ebx,0x4(%esi)
 9eb:	eb bc                	jmp    9a9 <benny_thread_create+0x39>
 9ed:	8d 76 00             	lea    0x0(%esi),%esi
 9f0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 9f6:	eb b7                	jmp    9af <benny_thread_create+0x3f>
    int result = -1;
 9f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9fd:	eb d3                	jmp    9d2 <benny_thread_create+0x62>
        free(bt);
 9ff:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 a02:	31 f6                	xor    %esi,%esi
        free(bt);
 a04:	e8 e7 fd ff ff       	call   7f0 <free>
 a09:	8b 5b 04             	mov    0x4(%ebx),%ebx
 a0c:	eb a1                	jmp    9af <benny_thread_create+0x3f>
 a0e:	66 90                	xchg   %ax,%ax

00000a10 <benny_thread_bid>:
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 a13:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a16:	5d                   	pop    %ebp
    return bt->bid;
 a17:	8b 00                	mov    (%eax),%eax
}
 a19:	c3                   	ret    
 a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a20 <benny_thread_join>:
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
 a23:	53                   	push   %ebx
 a24:	83 ec 14             	sub    $0x14,%esp
 a27:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 a2a:	8b 03                	mov    (%ebx),%eax
 a2c:	89 04 24             	mov    %eax,(%esp)
 a2f:	e8 be fa ff ff       	call   4f2 <kthread_join>
    if (retVal == 0) {
 a34:	85 c0                	test   %eax,%eax
 a36:	75 27                	jne    a5f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 a38:	8b 53 08             	mov    0x8(%ebx),%edx
 a3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a3e:	89 14 24             	mov    %edx,(%esp)
 a41:	e8 aa fd ff ff       	call   7f0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 a46:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 a4d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 a54:	89 1c 24             	mov    %ebx,(%esp)
 a57:	e8 94 fd ff ff       	call   7f0 <free>
 a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 a5f:	83 c4 14             	add    $0x14,%esp
 a62:	5b                   	pop    %ebx
 a63:	5d                   	pop    %ebp
 a64:	c3                   	ret    
 a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a70 <benny_thread_exit>:
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
}
 a73:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 a74:	e9 81 fa ff ff       	jmp    4fa <kthread_exit>
 a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a80 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 a86:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 a8c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 a93:	31 c0                	xor    %eax,%eax
 a95:	5d                   	pop    %ebp
 a96:	c3                   	ret    
 a97:	89 f6                	mov    %esi,%esi
 a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000aa0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 aa0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 aa1:	b8 01 00 00 00       	mov    $0x1,%eax
 aa6:	89 e5                	mov    %esp,%ebp
 aa8:	56                   	push   %esi
 aa9:	53                   	push   %ebx
 aaa:	8b 5d 08             	mov    0x8(%ebp),%ebx
 aad:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 ab0:	85 c0                	test   %eax,%eax
 ab2:	be 01 00 00 00       	mov    $0x1,%esi
 ab7:	74 15                	je     ace <benny_mootex_yieldlock+0x2e>
 ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 ac0:	e8 45 fa ff ff       	call   50a <kthread_yield>
 ac5:	89 f0                	mov    %esi,%eax
 ac7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 aca:	85 c0                	test   %eax,%eax
 acc:	75 f2                	jne    ac0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 ace:	e8 2f fa ff ff       	call   502 <kthread_self>
    benny_mootex->bid = benny_self();
 ad3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 ad6:	31 c0                	xor    %eax,%eax
 ad8:	5b                   	pop    %ebx
 ad9:	5e                   	pop    %esi
 ada:	5d                   	pop    %ebp
 adb:	c3                   	ret    
 adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ae0 <benny_mootex_spinlock>:
{
 ae0:	55                   	push   %ebp
 ae1:	ba 01 00 00 00       	mov    $0x1,%edx
 ae6:	89 e5                	mov    %esp,%ebp
 ae8:	53                   	push   %ebx
 ae9:	83 ec 04             	sub    $0x4,%esp
 aec:	8b 5d 08             	mov    0x8(%ebp),%ebx
 aef:	90                   	nop
 af0:	89 d0                	mov    %edx,%eax
 af2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 af5:	85 c0                	test   %eax,%eax
 af7:	75 f7                	jne    af0 <benny_mootex_spinlock+0x10>
    return kthread_self();
 af9:	e8 04 fa ff ff       	call   502 <kthread_self>
    benny_mootex->bid = benny_self();
 afe:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b01:	83 c4 04             	add    $0x4,%esp
 b04:	31 c0                	xor    %eax,%eax
 b06:	5b                   	pop    %ebx
 b07:	5d                   	pop    %ebp
 b08:	c3                   	ret    
 b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b10 <benny_mootex_unlock>:
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
 b13:	53                   	push   %ebx
 b14:	83 ec 04             	sub    $0x4,%esp
 b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 b1a:	e8 e3 f9 ff ff       	call   502 <kthread_self>
    if(tid == benny_mootex->bid){
 b1f:	39 43 04             	cmp    %eax,0x4(%ebx)
 b22:	75 1c                	jne    b40 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 b24:	0f ae f0             	mfence 
    return 0;
 b27:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 b29:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 b30:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 b36:	83 c4 04             	add    $0x4,%esp
 b39:	5b                   	pop    %ebx
 b3a:	5d                   	pop    %ebp
 b3b:	c3                   	ret    
 b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b40:	83 c4 04             	add    $0x4,%esp
      return -1;
 b43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b48:	5b                   	pop    %ebx
 b49:	5d                   	pop    %ebp
 b4a:	c3                   	ret    
 b4b:	90                   	nop
 b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b50 <benny_mootex_trylock>:
{
 b50:	55                   	push   %ebp
 b51:	b8 01 00 00 00       	mov    $0x1,%eax
 b56:	89 e5                	mov    %esp,%ebp
 b58:	53                   	push   %ebx
 b59:	83 ec 04             	sub    $0x4,%esp
 b5c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b5f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 b62:	85 c0                	test   %eax,%eax
 b64:	75 08                	jne    b6e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 b66:	e8 97 f9 ff ff       	call   502 <kthread_self>
        benny_mootex->bid = tid;
 b6b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b6e:	83 c4 04             	add    $0x4,%esp
 b71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b76:	5b                   	pop    %ebx
 b77:	5d                   	pop    %ebp
 b78:	c3                   	ret    
 b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b80 <benny_mootex_wholock>:
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 b83:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b86:	5d                   	pop    %ebp
    return benny_mootex->bid;
 b87:	8b 40 04             	mov    0x4(%eax),%eax
}
 b8a:	c3                   	ret    
 b8b:	90                   	nop
 b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b90 <benny_mootex_islocked>:
{
 b90:	55                   	push   %ebp
 b91:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 b93:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b96:	5d                   	pop    %ebp
    return benny_mootex->locked;
 b97:	8b 00                	mov    (%eax),%eax
}
 b99:	c3                   	ret    
 b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ba0 <benny_self>:
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
}
 ba3:	5d                   	pop    %ebp
    return kthread_self();
 ba4:	e9 59 f9 ff ff       	jmp    502 <kthread_self>
 ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bb0 <benny_yield>:
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
    
}
 bb3:	5d                   	pop    %ebp
    return kthread_yield();
 bb4:	e9 51 f9 ff ff       	jmp    50a <kthread_yield>
 bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bc0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 bc0:	55                   	push   %ebp
 bc1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 bc3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 bc4:	e9 49 f9 ff ff       	jmp    512 <kthread_cpu_count>
 bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <benny_thread_count>:

int
benny_thread_count(void)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 bd3:	5d                   	pop    %ebp
    return kthread_thread_count();
 bd4:	e9 41 f9 ff ff       	jmp    51a <kthread_thread_count>
