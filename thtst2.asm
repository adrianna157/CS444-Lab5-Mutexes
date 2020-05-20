
_thtst2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}
#endif // KTHREADS

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 70             	sub    $0x70,%esp
    long i = -1;
    long num_threads = DEFAULT_NUM_THREADS;
    int pid = -1;

    //printf(1, "%s %d: %p %p\n", __FILE__, __LINE__, main, &argc);
    if (argc > 1) {
   c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  10:	0f 8e 02 01 00 00    	jle    118 <main+0x118>
        num_threads = atoi(argv[1]);
  16:	8b 45 0c             	mov    0xc(%ebp),%eax
  19:	8b 40 04             	mov    0x4(%eax),%eax
  1c:	89 04 24             	mov    %eax,(%esp)
  1f:	e8 6c 03 00 00       	call   390 <atoi>
  24:	89 c6                	mov    %eax,%esi
        if (num_threads < 1 || num_threads > MAX_THREADS) {
  26:	8d 40 ff             	lea    -0x1(%eax),%eax
  29:	83 f8 13             	cmp    $0x13,%eax
  2c:	0f 87 e6 00 00 00    	ja     118 <main+0x118>
            num_threads = DEFAULT_NUM_THREADS;
        }
    }
    printf(1, "Starting %d threads\n", num_threads);
  32:	89 74 24 08          	mov    %esi,0x8(%esp)
  36:	c7 44 24 04 bf 0b 00 	movl   $0xbbf,0x4(%esp)
  3d:	00 
  3e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  45:	e8 56 05 00 00       	call   5a0 <printf>

    pid = fork();
  4a:	e8 9b 03 00 00       	call   3ea <fork>
    if (pid == 0) {
  4f:	85 c0                	test   %eax,%eax
  51:	0f 85 bc 00 00 00    	jne    113 <main+0x113>
  57:	8d 7c 24 20          	lea    0x20(%esp),%edi
  5b:	31 db                	xor    %ebx,%ebx
  5d:	8d 76 00             	lea    0x0(%esi),%esi
        for (i = 0; i < num_threads; i++) {
            benny_thread_create(&(bt[i]), func1, (void *) i);
  60:	89 5c 24 08          	mov    %ebx,0x8(%esp)
        for (i = 0; i < num_threads; i++) {
  64:	83 c3 01             	add    $0x1,%ebx
            benny_thread_create(&(bt[i]), func1, (void *) i);
  67:	89 3c 24             	mov    %edi,(%esp)
  6a:	83 c7 04             	add    $0x4,%edi
  6d:	c7 44 24 04 30 01 00 	movl   $0x130,0x4(%esp)
  74:	00 
  75:	e8 c6 08 00 00       	call   940 <benny_thread_create>
            printf(1, "%s %d: started thread %d\n"
  7a:	8b 47 fc             	mov    -0x4(%edi),%eax
  7d:	89 04 24             	mov    %eax,(%esp)
  80:	e8 5b 09 00 00       	call   9e0 <benny_thread_bid>
  85:	c7 44 24 0c 40 00 00 	movl   $0x40,0xc(%esp)
  8c:	00 
  8d:	c7 44 24 08 d4 0b 00 	movl   $0xbd4,0x8(%esp)
  94:	00 
  95:	c7 44 24 04 dd 0b 00 	movl   $0xbdd,0x4(%esp)
  9c:	00 
  9d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a4:	89 44 24 10          	mov    %eax,0x10(%esp)
  a8:	e8 f3 04 00 00       	call   5a0 <printf>
        for (i = 0; i < num_threads; i++) {
  ad:	39 de                	cmp    %ebx,%esi
  af:	7f af                	jg     60 <main+0x60>
  b1:	31 db                	xor    %ebx,%ebx
  b3:	90                   	nop
  b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                   , __FILE__, __LINE__, benny_thread_bid(bt[i]));
        }

        for (i = 0; i < num_threads; i++) {
            printf(1, "%s %d: joining with %d\n"
  b8:	8b 44 9c 20          	mov    0x20(%esp,%ebx,4),%eax
  bc:	89 04 24             	mov    %eax,(%esp)
  bf:	e8 1c 09 00 00       	call   9e0 <benny_thread_bid>
  c4:	c7 44 24 0c 45 00 00 	movl   $0x45,0xc(%esp)
  cb:	00 
  cc:	c7 44 24 08 d4 0b 00 	movl   $0xbd4,0x8(%esp)
  d3:	00 
  d4:	c7 44 24 04 f7 0b 00 	movl   $0xbf7,0x4(%esp)
  db:	00 
  dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e3:	89 44 24 10          	mov    %eax,0x10(%esp)
  e7:	e8 b4 04 00 00       	call   5a0 <printf>
                   , __FILE__, __LINE__, benny_thread_bid(bt[i]));
            benny_thread_join(bt[i]);
  ec:	8b 44 9c 20          	mov    0x20(%esp,%ebx,4),%eax
        for (i = 0; i < num_threads; i++) {
  f0:	83 c3 01             	add    $0x1,%ebx
            benny_thread_join(bt[i]);
  f3:	89 04 24             	mov    %eax,(%esp)
  f6:	e8 f5 08 00 00       	call   9f0 <benny_thread_join>
        for (i = 0; i < num_threads; i++) {
  fb:	39 de                	cmp    %ebx,%esi
  fd:	7f b9                	jg     b8 <main+0xb8>
        }

        printf(1, "All threads joined\n");
  ff:	c7 44 24 04 0f 0c 00 	movl   $0xc0f,0x4(%esp)
 106:	00 
 107:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10e:	e8 8d 04 00 00       	call   5a0 <printf>
    }
#endif // KTHREADS
    exit();
 113:	e8 da 02 00 00       	call   3f2 <exit>
    long num_threads = DEFAULT_NUM_THREADS;
 118:	be 04 00 00 00       	mov    $0x4,%esi
 11d:	e9 10 ff ff ff       	jmp    32 <main+0x32>
 122:	66 90                	xchg   %ax,%ax
 124:	66 90                	xchg   %ax,%ax
 126:	66 90                	xchg   %ax,%ax
 128:	66 90                	xchg   %ax,%ax
 12a:	66 90                	xchg   %ax,%ax
 12c:	66 90                	xchg   %ax,%ax
 12e:	66 90                	xchg   %ax,%ax

00000130 <func1>:
{
 130:	55                   	push   %ebp
        if ((sum % (MAXSHORT * MAXSHORT)) == 0) {
 131:	b9 03 00 ff 3f       	mov    $0x3fff0003,%ecx
{
 136:	89 e5                	mov    %esp,%ebp
 138:	57                   	push   %edi
            sum = 0;
 139:	31 ff                	xor    %edi,%edi
{
 13b:	56                   	push   %esi
    long arg = ((long) arg_ptr);
 13c:	be fe ff ff 7f       	mov    $0x7ffffffe,%esi
{
 141:	53                   	push   %ebx
        sum ++;
 142:	bb 02 00 00 00       	mov    $0x2,%ebx
{
 147:	83 ec 2c             	sub    $0x2c,%esp
 14a:	8b 45 08             	mov    0x8(%ebp),%eax
 14d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            sum = 0;
 150:	81 fb 00 00 00 40    	cmp    $0x40000000,%ebx
 156:	0f 43 df             	cmovae %edi,%ebx
    for(i = 1; i < max; i++) {
 159:	83 ee 01             	sub    $0x1,%esi
 15c:	74 53                	je     1b1 <func1+0x81>
        sum ++;
 15e:	83 c3 01             	add    $0x1,%ebx
        if ((sum % (MAXSHORT * MAXSHORT)) == 0) {
 161:	89 d8                	mov    %ebx,%eax
 163:	f7 e1                	mul    %ecx
 165:	c1 ea 1c             	shr    $0x1c,%edx
 168:	69 d2 01 00 01 40    	imul   $0x40010001,%edx,%edx
 16e:	39 d3                	cmp    %edx,%ebx
 170:	75 de                	jne    150 <func1+0x20>
            sum += arg;
 172:	03 5d e4             	add    -0x1c(%ebp),%ebx
 175:	89 4d e0             	mov    %ecx,-0x20(%ebp)
            printf(1, "\t%d  thtst2: %d  %d\n\n", arg, getpid(), sum);
 178:	e8 f5 02 00 00       	call   472 <getpid>
 17d:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 181:	c7 44 24 04 a9 0b 00 	movl   $0xba9,0x4(%esp)
 188:	00 
 189:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 190:	89 44 24 0c          	mov    %eax,0xc(%esp)
 194:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 197:	89 44 24 08          	mov    %eax,0x8(%esp)
 19b:	e8 00 04 00 00       	call   5a0 <printf>
            sum = 0;
 1a0:	81 fb 00 00 00 40    	cmp    $0x40000000,%ebx
            printf(1, "\t%d  thtst2: %d  %d\n\n", arg, getpid(), sum);
 1a6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
            sum = 0;
 1a9:	0f 43 df             	cmovae %edi,%ebx
    for(i = 1; i < max; i++) {
 1ac:	83 ee 01             	sub    $0x1,%esi
 1af:	75 ad                	jne    15e <func1+0x2e>
    benny_thread_exit(7);
 1b1:	c7 45 08 07 00 00 00 	movl   $0x7,0x8(%ebp)
}
 1b8:	83 c4 2c             	add    $0x2c,%esp
 1bb:	5b                   	pop    %ebx
 1bc:	5e                   	pop    %esi
 1bd:	5f                   	pop    %edi
 1be:	5d                   	pop    %ebp
    benny_thread_exit(7);
 1bf:	e9 7c 08 00 00       	jmp    a40 <benny_thread_exit>
 1c4:	66 90                	xchg   %ax,%ax
 1c6:	66 90                	xchg   %ax,%ax
 1c8:	66 90                	xchg   %ax,%ax
 1ca:	66 90                	xchg   %ax,%ax
 1cc:	66 90                	xchg   %ax,%ax
 1ce:	66 90                	xchg   %ax,%ax

000001d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1d9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1da:	89 c2                	mov    %eax,%edx
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	83 c1 01             	add    $0x1,%ecx
 1e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1e7:	83 c2 01             	add    $0x1,%edx
 1ea:	84 db                	test   %bl,%bl
 1ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 1ef:	75 ef                	jne    1e0 <strcpy+0x10>
    ;
  return os;
}
 1f1:	5b                   	pop    %ebx
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 55 08             	mov    0x8(%ebp),%edx
 206:	53                   	push   %ebx
 207:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 20a:	0f b6 02             	movzbl (%edx),%eax
 20d:	84 c0                	test   %al,%al
 20f:	74 2d                	je     23e <strcmp+0x3e>
 211:	0f b6 19             	movzbl (%ecx),%ebx
 214:	38 d8                	cmp    %bl,%al
 216:	74 0e                	je     226 <strcmp+0x26>
 218:	eb 2b                	jmp    245 <strcmp+0x45>
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 220:	38 c8                	cmp    %cl,%al
 222:	75 15                	jne    239 <strcmp+0x39>
    p++, q++;
 224:	89 d9                	mov    %ebx,%ecx
 226:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 229:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 22c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 22f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 233:	84 c0                	test   %al,%al
 235:	75 e9                	jne    220 <strcmp+0x20>
 237:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 239:	29 c8                	sub    %ecx,%eax
}
 23b:	5b                   	pop    %ebx
 23c:	5d                   	pop    %ebp
 23d:	c3                   	ret    
 23e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 241:	31 c0                	xor    %eax,%eax
 243:	eb f4                	jmp    239 <strcmp+0x39>
 245:	0f b6 cb             	movzbl %bl,%ecx
 248:	eb ef                	jmp    239 <strcmp+0x39>
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 39 00             	cmpb   $0x0,(%ecx)
 259:	74 12                	je     26d <strlen+0x1d>
 25b:	31 d2                	xor    %edx,%edx
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c2 01             	add    $0x1,%edx
 263:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 267:	89 d0                	mov    %edx,%eax
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 26d:	31 c0                	xor    %eax,%eax
}
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	eb 0d                	jmp    280 <memset>
 273:	90                   	nop
 274:	90                   	nop
 275:	90                   	nop
 276:	90                   	nop
 277:	90                   	nop
 278:	90                   	nop
 279:	90                   	nop
 27a:	90                   	nop
 27b:	90                   	nop
 27c:	90                   	nop
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 55 08             	mov    0x8(%ebp),%edx
 286:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	89 d0                	mov    %edx,%eax
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	89 f6                	mov    %esi,%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	53                   	push   %ebx
 2a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 2aa:	0f b6 18             	movzbl (%eax),%ebx
 2ad:	84 db                	test   %bl,%bl
 2af:	74 1d                	je     2ce <strchr+0x2e>
    if(*s == c)
 2b1:	38 d3                	cmp    %dl,%bl
 2b3:	89 d1                	mov    %edx,%ecx
 2b5:	75 0d                	jne    2c4 <strchr+0x24>
 2b7:	eb 17                	jmp    2d0 <strchr+0x30>
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c0:	38 ca                	cmp    %cl,%dl
 2c2:	74 0c                	je     2d0 <strchr+0x30>
  for(; *s; s++)
 2c4:	83 c0 01             	add    $0x1,%eax
 2c7:	0f b6 10             	movzbl (%eax),%edx
 2ca:	84 d2                	test   %dl,%dl
 2cc:	75 f2                	jne    2c0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ce:	31 c0                	xor    %eax,%eax
}
 2d0:	5b                   	pop    %ebx
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e5:	31 f6                	xor    %esi,%esi
{
 2e7:	53                   	push   %ebx
 2e8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 2eb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 2ee:	eb 31                	jmp    321 <gets+0x41>
    cc = read(0, &c, 1);
 2f0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2f7:	00 
 2f8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2fc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 303:	e8 02 01 00 00       	call   40a <read>
    if(cc < 1)
 308:	85 c0                	test   %eax,%eax
 30a:	7e 1d                	jle    329 <gets+0x49>
      break;
    buf[i++] = c;
 30c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 310:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 312:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 315:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 317:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 31b:	74 0c                	je     329 <gets+0x49>
 31d:	3c 0a                	cmp    $0xa,%al
 31f:	74 08                	je     329 <gets+0x49>
  for(i=0; i+1 < max; ){
 321:	8d 5e 01             	lea    0x1(%esi),%ebx
 324:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 327:	7c c7                	jl     2f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 329:	8b 45 08             	mov    0x8(%ebp),%eax
 32c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 330:	83 c4 2c             	add    $0x2c,%esp
 333:	5b                   	pop    %ebx
 334:	5e                   	pop    %esi
 335:	5f                   	pop    %edi
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
 345:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 352:	00 
 353:	89 04 24             	mov    %eax,(%esp)
 356:	e8 d7 00 00 00       	call   432 <open>
  if(fd < 0)
 35b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 35d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 35f:	78 27                	js     388 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 361:	8b 45 0c             	mov    0xc(%ebp),%eax
 364:	89 1c 24             	mov    %ebx,(%esp)
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	e8 da 00 00 00       	call   44a <fstat>
  close(fd);
 370:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 373:	89 c6                	mov    %eax,%esi
  close(fd);
 375:	e8 a0 00 00 00       	call   41a <close>
  return r;
 37a:	89 f0                	mov    %esi,%eax
}
 37c:	83 c4 10             	add    $0x10,%esp
 37f:	5b                   	pop    %ebx
 380:	5e                   	pop    %esi
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    
 383:	90                   	nop
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 388:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 38d:	eb ed                	jmp    37c <stat+0x3c>
 38f:	90                   	nop

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 4d 08             	mov    0x8(%ebp),%ecx
 396:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 397:	0f be 11             	movsbl (%ecx),%edx
 39a:	8d 42 d0             	lea    -0x30(%edx),%eax
 39d:	3c 09                	cmp    $0x9,%al
  n = 0;
 39f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3a4:	77 17                	ja     3bd <atoi+0x2d>
 3a6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3a8:	83 c1 01             	add    $0x1,%ecx
 3ab:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3ae:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3b2:	0f be 11             	movsbl (%ecx),%edx
 3b5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3b8:	80 fb 09             	cmp    $0x9,%bl
 3bb:	76 eb                	jbe    3a8 <atoi+0x18>
  return n;
}
 3bd:	5b                   	pop    %ebx
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c1:	31 d2                	xor    %edx,%edx
{
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	56                   	push   %esi
 3c6:	8b 45 08             	mov    0x8(%ebp),%eax
 3c9:	53                   	push   %ebx
 3ca:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3cd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 3d0:	85 db                	test   %ebx,%ebx
 3d2:	7e 12                	jle    3e6 <memmove+0x26>
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3d8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3df:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3e2:	39 da                	cmp    %ebx,%edx
 3e4:	75 f2                	jne    3d8 <memmove+0x18>
  return vdst;
}
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5d                   	pop    %ebp
 3e9:	c3                   	ret    

000003ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ea:	b8 01 00 00 00       	mov    $0x1,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <exit>:
SYSCALL(exit)
 3f2:	b8 02 00 00 00       	mov    $0x2,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <wait>:
SYSCALL(wait)
 3fa:	b8 03 00 00 00       	mov    $0x3,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <pipe>:
SYSCALL(pipe)
 402:	b8 04 00 00 00       	mov    $0x4,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <read>:
SYSCALL(read)
 40a:	b8 05 00 00 00       	mov    $0x5,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <write>:
SYSCALL(write)
 412:	b8 10 00 00 00       	mov    $0x10,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <close>:
SYSCALL(close)
 41a:	b8 15 00 00 00       	mov    $0x15,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kill>:
SYSCALL(kill)
 422:	b8 06 00 00 00       	mov    $0x6,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <exec>:
SYSCALL(exec)
 42a:	b8 07 00 00 00       	mov    $0x7,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <open>:
SYSCALL(open)
 432:	b8 0f 00 00 00       	mov    $0xf,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <mknod>:
SYSCALL(mknod)
 43a:	b8 11 00 00 00       	mov    $0x11,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <unlink>:
SYSCALL(unlink)
 442:	b8 12 00 00 00       	mov    $0x12,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <fstat>:
SYSCALL(fstat)
 44a:	b8 08 00 00 00       	mov    $0x8,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <link>:
SYSCALL(link)
 452:	b8 13 00 00 00       	mov    $0x13,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <mkdir>:
SYSCALL(mkdir)
 45a:	b8 14 00 00 00       	mov    $0x14,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <chdir>:
SYSCALL(chdir)
 462:	b8 09 00 00 00       	mov    $0x9,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <dup>:
SYSCALL(dup)
 46a:	b8 0a 00 00 00       	mov    $0xa,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <getpid>:
SYSCALL(getpid)
 472:	b8 0b 00 00 00       	mov    $0xb,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <sbrk>:
SYSCALL(sbrk)
 47a:	b8 0c 00 00 00       	mov    $0xc,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <sleep>:
SYSCALL(sleep)
 482:	b8 0d 00 00 00       	mov    $0xd,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <uptime>:
SYSCALL(uptime)
 48a:	b8 0e 00 00 00       	mov    $0xe,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 492:	b8 16 00 00 00       	mov    $0x16,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 49a:	b8 17 00 00 00       	mov    $0x17,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 4a2:	b8 18 00 00 00       	mov    $0x18,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 4aa:	b8 19 00 00 00       	mov    $0x19,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 4b2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 4ba:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <kthread_join>:
SYSCALL(kthread_join)
 4c2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <kthread_exit>:
SYSCALL(kthread_exit)
 4ca:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 4d2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <kthread_yield>:
SYSCALL(kthread_yield)
 4da:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 4e2:	b8 20 00 00 00       	mov    $0x20,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 4ea:	b8 21 00 00 00       	mov    $0x21,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    
 4f2:	66 90                	xchg   %ax,%ax
 4f4:	66 90                	xchg   %ax,%ax
 4f6:	66 90                	xchg   %ax,%ax
 4f8:	66 90                	xchg   %ax,%ax
 4fa:	66 90                	xchg   %ax,%ax
 4fc:	66 90                	xchg   %ax,%ax
 4fe:	66 90                	xchg   %ax,%ax

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	89 c6                	mov    %eax,%esi
 507:	53                   	push   %ebx
 508:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 50b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 50e:	85 db                	test   %ebx,%ebx
 510:	74 09                	je     51b <printint+0x1b>
 512:	89 d0                	mov    %edx,%eax
 514:	c1 e8 1f             	shr    $0x1f,%eax
 517:	84 c0                	test   %al,%al
 519:	75 75                	jne    590 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 51b:	89 d0                	mov    %edx,%eax
  neg = 0;
 51d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 524:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 527:	31 ff                	xor    %edi,%edi
 529:	89 ce                	mov    %ecx,%esi
 52b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 52e:	eb 02                	jmp    532 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 530:	89 cf                	mov    %ecx,%edi
 532:	31 d2                	xor    %edx,%edx
 534:	f7 f6                	div    %esi
 536:	8d 4f 01             	lea    0x1(%edi),%ecx
 539:	0f b6 92 2a 0c 00 00 	movzbl 0xc2a(%edx),%edx
  }while((x /= base) != 0);
 540:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 542:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 545:	75 e9                	jne    530 <printint+0x30>
  if(neg)
 547:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 54a:	89 c8                	mov    %ecx,%eax
 54c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 54f:	85 d2                	test   %edx,%edx
 551:	74 08                	je     55b <printint+0x5b>
    buf[i++] = '-';
 553:	8d 4f 02             	lea    0x2(%edi),%ecx
 556:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 55b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 55e:	66 90                	xchg   %ax,%ax
 560:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 565:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 568:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 56f:	00 
 570:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 574:	89 34 24             	mov    %esi,(%esp)
 577:	88 45 d7             	mov    %al,-0x29(%ebp)
 57a:	e8 93 fe ff ff       	call   412 <write>
  while(--i >= 0)
 57f:	83 ff ff             	cmp    $0xffffffff,%edi
 582:	75 dc                	jne    560 <printint+0x60>
    putc(fd, buf[i]);
}
 584:	83 c4 4c             	add    $0x4c,%esp
 587:	5b                   	pop    %ebx
 588:	5e                   	pop    %esi
 589:	5f                   	pop    %edi
 58a:	5d                   	pop    %ebp
 58b:	c3                   	ret    
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 590:	89 d0                	mov    %edx,%eax
 592:	f7 d8                	neg    %eax
    neg = 1;
 594:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 59b:	eb 87                	jmp    524 <printint+0x24>
 59d:	8d 76 00             	lea    0x0(%esi),%esi

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5a4:	31 ff                	xor    %edi,%edi
{
 5a6:	56                   	push   %esi
 5a7:	53                   	push   %ebx
 5a8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 5ae:	8d 45 10             	lea    0x10(%ebp),%eax
{
 5b1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 5b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 5b7:	0f b6 13             	movzbl (%ebx),%edx
 5ba:	83 c3 01             	add    $0x1,%ebx
 5bd:	84 d2                	test   %dl,%dl
 5bf:	75 39                	jne    5fa <printf+0x5a>
 5c1:	e9 ca 00 00 00       	jmp    690 <printf+0xf0>
 5c6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5c8:	83 fa 25             	cmp    $0x25,%edx
 5cb:	0f 84 c7 00 00 00    	je     698 <printf+0xf8>
  write(fd, &c, 1);
 5d1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 5d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5db:	00 
 5dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 5e3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 5e6:	e8 27 fe ff ff       	call   412 <write>
 5eb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 5ee:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5f2:	84 d2                	test   %dl,%dl
 5f4:	0f 84 96 00 00 00    	je     690 <printf+0xf0>
    if(state == 0){
 5fa:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5fc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 5ff:	74 c7                	je     5c8 <printf+0x28>
      }
    } else if(state == '%'){
 601:	83 ff 25             	cmp    $0x25,%edi
 604:	75 e5                	jne    5eb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 606:	83 fa 75             	cmp    $0x75,%edx
 609:	0f 84 99 00 00 00    	je     6a8 <printf+0x108>
 60f:	83 fa 64             	cmp    $0x64,%edx
 612:	0f 84 90 00 00 00    	je     6a8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 618:	25 f7 00 00 00       	and    $0xf7,%eax
 61d:	83 f8 70             	cmp    $0x70,%eax
 620:	0f 84 aa 00 00 00    	je     6d0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 626:	83 fa 73             	cmp    $0x73,%edx
 629:	0f 84 e9 00 00 00    	je     718 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 62f:	83 fa 63             	cmp    $0x63,%edx
 632:	0f 84 2b 01 00 00    	je     763 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 638:	83 fa 25             	cmp    $0x25,%edx
 63b:	0f 84 4f 01 00 00    	je     790 <printf+0x1f0>
  write(fd, &c, 1);
 641:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 644:	83 c3 01             	add    $0x1,%ebx
 647:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 64e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 64f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 651:	89 44 24 04          	mov    %eax,0x4(%esp)
 655:	89 34 24             	mov    %esi,(%esp)
 658:	89 55 d0             	mov    %edx,-0x30(%ebp)
 65b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 65f:	e8 ae fd ff ff       	call   412 <write>
        putc(fd, c);
 664:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 667:	8d 45 e7             	lea    -0x19(%ebp),%eax
 66a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 671:	00 
 672:	89 44 24 04          	mov    %eax,0x4(%esp)
 676:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 679:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 67c:	e8 91 fd ff ff       	call   412 <write>
  for(i = 0; fmt[i]; i++){
 681:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 685:	84 d2                	test   %dl,%dl
 687:	0f 85 6d ff ff ff    	jne    5fa <printf+0x5a>
 68d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 690:	83 c4 3c             	add    $0x3c,%esp
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5f                   	pop    %edi
 696:	5d                   	pop    %ebp
 697:	c3                   	ret    
        state = '%';
 698:	bf 25 00 00 00       	mov    $0x25,%edi
 69d:	e9 49 ff ff ff       	jmp    5eb <printf+0x4b>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6af:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 6b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6b7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 6b9:	8b 10                	mov    (%eax),%edx
 6bb:	89 f0                	mov    %esi,%eax
 6bd:	e8 3e fe ff ff       	call   500 <printint>
        ap++;
 6c2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6c6:	e9 20 ff ff ff       	jmp    5eb <printf+0x4b>
 6cb:	90                   	nop
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6d0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 6d3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6da:	00 
 6db:	89 44 24 04          	mov    %eax,0x4(%esp)
 6df:	89 34 24             	mov    %esi,(%esp)
 6e2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 6e6:	e8 27 fd ff ff       	call   412 <write>
 6eb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6f5:	00 
 6f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fa:	89 34 24             	mov    %esi,(%esp)
 6fd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 701:	e8 0c fd ff ff       	call   412 <write>
        printint(fd, *ap, 16, 0);
 706:	b9 10 00 00 00       	mov    $0x10,%ecx
 70b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 712:	eb a0                	jmp    6b4 <printf+0x114>
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 718:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 71b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 71f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 721:	b8 23 0c 00 00       	mov    $0xc23,%eax
 726:	85 ff                	test   %edi,%edi
 728:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 72b:	0f b6 07             	movzbl (%edi),%eax
 72e:	84 c0                	test   %al,%al
 730:	74 2a                	je     75c <printf+0x1bc>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 738:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 73b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 73e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 741:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 748:	00 
 749:	89 44 24 04          	mov    %eax,0x4(%esp)
 74d:	89 34 24             	mov    %esi,(%esp)
 750:	e8 bd fc ff ff       	call   412 <write>
        while(*s != 0){
 755:	0f b6 07             	movzbl (%edi),%eax
 758:	84 c0                	test   %al,%al
 75a:	75 dc                	jne    738 <printf+0x198>
      state = 0;
 75c:	31 ff                	xor    %edi,%edi
 75e:	e9 88 fe ff ff       	jmp    5eb <printf+0x4b>
        putc(fd, *ap);
 763:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 766:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 768:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 76a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 771:	00 
 772:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 775:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 778:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 77b:	89 44 24 04          	mov    %eax,0x4(%esp)
 77f:	e8 8e fc ff ff       	call   412 <write>
        ap++;
 784:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 788:	e9 5e fe ff ff       	jmp    5eb <printf+0x4b>
 78d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 790:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 793:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 795:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 79c:	00 
 79d:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a1:	89 34 24             	mov    %esi,(%esp)
 7a4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 7a8:	e8 65 fc ff ff       	call   412 <write>
 7ad:	e9 39 fe ff ff       	jmp    5eb <printf+0x4b>
 7b2:	66 90                	xchg   %ax,%ax
 7b4:	66 90                	xchg   %ax,%ax
 7b6:	66 90                	xchg   %ax,%ax
 7b8:	66 90                	xchg   %ax,%ax
 7ba:	66 90                	xchg   %ax,%ax
 7bc:	66 90                	xchg   %ax,%ax
 7be:	66 90                	xchg   %ax,%ax

000007c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c1:	a1 e4 10 00 00       	mov    0x10e4,%eax
{
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ce:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 7d0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d3:	39 d0                	cmp    %edx,%eax
 7d5:	72 11                	jb     7e8 <free+0x28>
 7d7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d8:	39 c8                	cmp    %ecx,%eax
 7da:	72 04                	jb     7e0 <free+0x20>
 7dc:	39 ca                	cmp    %ecx,%edx
 7de:	72 10                	jb     7f0 <free+0x30>
 7e0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e6:	73 f0                	jae    7d8 <free+0x18>
 7e8:	39 ca                	cmp    %ecx,%edx
 7ea:	72 04                	jb     7f0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ec:	39 c8                	cmp    %ecx,%eax
 7ee:	72 f0                	jb     7e0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 7f6:	39 cf                	cmp    %ecx,%edi
 7f8:	74 1e                	je     818 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7fa:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fd:	8b 48 04             	mov    0x4(%eax),%ecx
 800:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 803:	39 f2                	cmp    %esi,%edx
 805:	74 28                	je     82f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 807:	89 10                	mov    %edx,(%eax)
  freep = p;
 809:	a3 e4 10 00 00       	mov    %eax,0x10e4
}
 80e:	5b                   	pop    %ebx
 80f:	5e                   	pop    %esi
 810:	5f                   	pop    %edi
 811:	5d                   	pop    %ebp
 812:	c3                   	ret    
 813:	90                   	nop
 814:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 818:	03 71 04             	add    0x4(%ecx),%esi
 81b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 81e:	8b 08                	mov    (%eax),%ecx
 820:	8b 09                	mov    (%ecx),%ecx
 822:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 825:	8b 48 04             	mov    0x4(%eax),%ecx
 828:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 82b:	39 f2                	cmp    %esi,%edx
 82d:	75 d8                	jne    807 <free+0x47>
    p->s.size += bp->s.size;
 82f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 832:	a3 e4 10 00 00       	mov    %eax,0x10e4
    p->s.size += bp->s.size;
 837:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 83a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 83d:	89 10                	mov    %edx,(%eax)
}
 83f:	5b                   	pop    %ebx
 840:	5e                   	pop    %esi
 841:	5f                   	pop    %edi
 842:	5d                   	pop    %ebp
 843:	c3                   	ret    
 844:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 84a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000850 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 85c:	8b 1d e4 10 00 00    	mov    0x10e4,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 862:	8d 48 07             	lea    0x7(%eax),%ecx
 865:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 868:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 86d:	0f 84 9b 00 00 00    	je     90e <malloc+0xbe>
 873:	8b 13                	mov    (%ebx),%edx
 875:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 878:	39 fe                	cmp    %edi,%esi
 87a:	76 64                	jbe    8e0 <malloc+0x90>
 87c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 883:	bb 00 80 00 00       	mov    $0x8000,%ebx
 888:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 88b:	eb 0e                	jmp    89b <malloc+0x4b>
 88d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 890:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 892:	8b 78 04             	mov    0x4(%eax),%edi
 895:	39 fe                	cmp    %edi,%esi
 897:	76 4f                	jbe    8e8 <malloc+0x98>
 899:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 89b:	3b 15 e4 10 00 00    	cmp    0x10e4,%edx
 8a1:	75 ed                	jne    890 <malloc+0x40>
  if(nu < 4096)
 8a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8ac:	bf 00 10 00 00       	mov    $0x1000,%edi
 8b1:	0f 43 fe             	cmovae %esi,%edi
 8b4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 8b7:	89 04 24             	mov    %eax,(%esp)
 8ba:	e8 bb fb ff ff       	call   47a <sbrk>
  if(p == (char*)-1)
 8bf:	83 f8 ff             	cmp    $0xffffffff,%eax
 8c2:	74 18                	je     8dc <malloc+0x8c>
  hp->s.size = nu;
 8c4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 8c7:	83 c0 08             	add    $0x8,%eax
 8ca:	89 04 24             	mov    %eax,(%esp)
 8cd:	e8 ee fe ff ff       	call   7c0 <free>
  return freep;
 8d2:	8b 15 e4 10 00 00    	mov    0x10e4,%edx
      if((p = morecore(nunits)) == 0)
 8d8:	85 d2                	test   %edx,%edx
 8da:	75 b4                	jne    890 <malloc+0x40>
        return 0;
 8dc:	31 c0                	xor    %eax,%eax
 8de:	eb 20                	jmp    900 <malloc+0xb0>
    if(p->s.size >= nunits){
 8e0:	89 d0                	mov    %edx,%eax
 8e2:	89 da                	mov    %ebx,%edx
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8e8:	39 fe                	cmp    %edi,%esi
 8ea:	74 1c                	je     908 <malloc+0xb8>
        p->s.size -= nunits;
 8ec:	29 f7                	sub    %esi,%edi
 8ee:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 8f1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 8f4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8f7:	89 15 e4 10 00 00    	mov    %edx,0x10e4
      return (void*)(p + 1);
 8fd:	83 c0 08             	add    $0x8,%eax
  }
}
 900:	83 c4 1c             	add    $0x1c,%esp
 903:	5b                   	pop    %ebx
 904:	5e                   	pop    %esi
 905:	5f                   	pop    %edi
 906:	5d                   	pop    %ebp
 907:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 908:	8b 08                	mov    (%eax),%ecx
 90a:	89 0a                	mov    %ecx,(%edx)
 90c:	eb e9                	jmp    8f7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 90e:	c7 05 e4 10 00 00 e8 	movl   $0x10e8,0x10e4
 915:	10 00 00 
    base.s.size = 0;
 918:	ba e8 10 00 00       	mov    $0x10e8,%edx
    base.s.ptr = freep = prevp = &base;
 91d:	c7 05 e8 10 00 00 e8 	movl   $0x10e8,0x10e8
 924:	10 00 00 
    base.s.size = 0;
 927:	c7 05 ec 10 00 00 00 	movl   $0x0,0x10ec
 92e:	00 00 00 
 931:	e9 46 ff ff ff       	jmp    87c <malloc+0x2c>
 936:	66 90                	xchg   %ax,%ax
 938:	66 90                	xchg   %ax,%ax
 93a:	66 90                	xchg   %ax,%ax
 93c:	66 90                	xchg   %ax,%ax
 93e:	66 90                	xchg   %ax,%ax

00000940 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	56                   	push   %esi
 944:	53                   	push   %ebx
 945:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 948:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 94f:	e8 fc fe ff ff       	call   850 <malloc>

    if (bt == NULL) {
 954:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 956:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 958:	74 66                	je     9c0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 95a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 961:	e8 ea fe ff ff       	call   850 <malloc>
    if (bt->bt_stack == NULL) {
 966:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 968:	89 c3                	mov    %eax,%ebx
 96a:	89 46 08             	mov    %eax,0x8(%esi)
 96d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 970:	74 5d                	je     9cf <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 972:	25 ff 0f 00 00       	and    $0xfff,%eax
 977:	75 37                	jne    9b0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 979:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 97f:	8b 45 10             	mov    0x10(%ebp),%eax
 982:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 986:	89 44 24 04          	mov    %eax,0x4(%esp)
 98a:	8b 45 0c             	mov    0xc(%ebp),%eax
 98d:	89 04 24             	mov    %eax,(%esp)
 990:	e8 25 fb ff ff       	call   4ba <kthread_create>
    if (bt->bid != 0) {
 995:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 997:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 999:	74 2d                	je     9c8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 99b:	8b 45 08             	mov    0x8(%ebp),%eax
 99e:	89 30                	mov    %esi,(%eax)
        result = 0;
 9a0:	31 c0                	xor    %eax,%eax
}
 9a2:	83 c4 10             	add    $0x10,%esp
 9a5:	5b                   	pop    %ebx
 9a6:	5e                   	pop    %esi
 9a7:	5d                   	pop    %ebp
 9a8:	c3                   	ret    
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 9b0:	29 c3                	sub    %eax,%ebx
 9b2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 9b8:	89 5e 04             	mov    %ebx,0x4(%esi)
 9bb:	eb bc                	jmp    979 <benny_thread_create+0x39>
 9bd:	8d 76 00             	lea    0x0(%esi),%esi
 9c0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 9c6:	eb b7                	jmp    97f <benny_thread_create+0x3f>
    int result = -1;
 9c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9cd:	eb d3                	jmp    9a2 <benny_thread_create+0x62>
        free(bt);
 9cf:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 9d2:	31 f6                	xor    %esi,%esi
        free(bt);
 9d4:	e8 e7 fd ff ff       	call   7c0 <free>
 9d9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 9dc:	eb a1                	jmp    97f <benny_thread_create+0x3f>
 9de:	66 90                	xchg   %ax,%ax

000009e0 <benny_thread_bid>:
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 9e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9e6:	5d                   	pop    %ebp
    return bt->bid;
 9e7:	8b 00                	mov    (%eax),%eax
}
 9e9:	c3                   	ret    
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009f0 <benny_thread_join>:
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	53                   	push   %ebx
 9f4:	83 ec 14             	sub    $0x14,%esp
 9f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 9fa:	8b 03                	mov    (%ebx),%eax
 9fc:	89 04 24             	mov    %eax,(%esp)
 9ff:	e8 be fa ff ff       	call   4c2 <kthread_join>
    if (retVal == 0) {
 a04:	85 c0                	test   %eax,%eax
 a06:	75 27                	jne    a2f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 a08:	8b 53 08             	mov    0x8(%ebx),%edx
 a0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a0e:	89 14 24             	mov    %edx,(%esp)
 a11:	e8 aa fd ff ff       	call   7c0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 a16:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 a1d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 a24:	89 1c 24             	mov    %ebx,(%esp)
 a27:	e8 94 fd ff ff       	call   7c0 <free>
 a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 a2f:	83 c4 14             	add    $0x14,%esp
 a32:	5b                   	pop    %ebx
 a33:	5d                   	pop    %ebp
 a34:	c3                   	ret    
 a35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a40 <benny_thread_exit>:
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
}
 a43:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 a44:	e9 81 fa ff ff       	jmp    4ca <kthread_exit>
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a50 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 a56:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 a5c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 a63:	31 c0                	xor    %eax,%eax
 a65:	5d                   	pop    %ebp
 a66:	c3                   	ret    
 a67:	89 f6                	mov    %esi,%esi
 a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a70 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 a70:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a71:	b8 01 00 00 00       	mov    $0x1,%eax
 a76:	89 e5                	mov    %esp,%ebp
 a78:	56                   	push   %esi
 a79:	53                   	push   %ebx
 a7a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a7d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 a80:	85 c0                	test   %eax,%eax
 a82:	be 01 00 00 00       	mov    $0x1,%esi
 a87:	74 15                	je     a9e <benny_mootex_yieldlock+0x2e>
 a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 a90:	e8 45 fa ff ff       	call   4da <kthread_yield>
 a95:	89 f0                	mov    %esi,%eax
 a97:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a9a:	85 c0                	test   %eax,%eax
 a9c:	75 f2                	jne    a90 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 a9e:	e8 2f fa ff ff       	call   4d2 <kthread_self>
    benny_mootex->bid = benny_self();
 aa3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 aa6:	31 c0                	xor    %eax,%eax
 aa8:	5b                   	pop    %ebx
 aa9:	5e                   	pop    %esi
 aaa:	5d                   	pop    %ebp
 aab:	c3                   	ret    
 aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <benny_mootex_spinlock>:
{
 ab0:	55                   	push   %ebp
 ab1:	ba 01 00 00 00       	mov    $0x1,%edx
 ab6:	89 e5                	mov    %esp,%ebp
 ab8:	53                   	push   %ebx
 ab9:	83 ec 04             	sub    $0x4,%esp
 abc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 abf:	90                   	nop
 ac0:	89 d0                	mov    %edx,%eax
 ac2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 ac5:	85 c0                	test   %eax,%eax
 ac7:	75 f7                	jne    ac0 <benny_mootex_spinlock+0x10>
    return kthread_self();
 ac9:	e8 04 fa ff ff       	call   4d2 <kthread_self>
    benny_mootex->bid = benny_self();
 ace:	89 43 04             	mov    %eax,0x4(%ebx)
}
 ad1:	83 c4 04             	add    $0x4,%esp
 ad4:	31 c0                	xor    %eax,%eax
 ad6:	5b                   	pop    %ebx
 ad7:	5d                   	pop    %ebp
 ad8:	c3                   	ret    
 ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ae0 <benny_mootex_unlock>:
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	53                   	push   %ebx
 ae4:	83 ec 04             	sub    $0x4,%esp
 ae7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 aea:	e8 e3 f9 ff ff       	call   4d2 <kthread_self>
    if(tid == benny_mootex->bid){
 aef:	39 43 04             	cmp    %eax,0x4(%ebx)
 af2:	75 1c                	jne    b10 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 af4:	0f ae f0             	mfence 
    return 0;
 af7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 af9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 b00:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 b06:	83 c4 04             	add    $0x4,%esp
 b09:	5b                   	pop    %ebx
 b0a:	5d                   	pop    %ebp
 b0b:	c3                   	ret    
 b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b10:	83 c4 04             	add    $0x4,%esp
      return -1;
 b13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b18:	5b                   	pop    %ebx
 b19:	5d                   	pop    %ebp
 b1a:	c3                   	ret    
 b1b:	90                   	nop
 b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b20 <benny_mootex_trylock>:
{
 b20:	55                   	push   %ebp
 b21:	b8 01 00 00 00       	mov    $0x1,%eax
 b26:	89 e5                	mov    %esp,%ebp
 b28:	53                   	push   %ebx
 b29:	83 ec 04             	sub    $0x4,%esp
 b2c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b2f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 b32:	85 c0                	test   %eax,%eax
 b34:	75 08                	jne    b3e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 b36:	e8 97 f9 ff ff       	call   4d2 <kthread_self>
        benny_mootex->bid = tid;
 b3b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b3e:	83 c4 04             	add    $0x4,%esp
 b41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b46:	5b                   	pop    %ebx
 b47:	5d                   	pop    %ebp
 b48:	c3                   	ret    
 b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b50 <benny_mootex_wholock>:
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 b53:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b56:	5d                   	pop    %ebp
    return benny_mootex->bid;
 b57:	8b 40 04             	mov    0x4(%eax),%eax
}
 b5a:	c3                   	ret    
 b5b:	90                   	nop
 b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b60 <benny_mootex_islocked>:
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 b63:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b66:	5d                   	pop    %ebp
    return benny_mootex->locked;
 b67:	8b 00                	mov    (%eax),%eax
}
 b69:	c3                   	ret    
 b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b70 <benny_self>:
{
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
}
 b73:	5d                   	pop    %ebp
    return kthread_self();
 b74:	e9 59 f9 ff ff       	jmp    4d2 <kthread_self>
 b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b80 <benny_yield>:
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
    
}
 b83:	5d                   	pop    %ebp
    return kthread_yield();
 b84:	e9 51 f9 ff ff       	jmp    4da <kthread_yield>
 b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b90 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 b90:	55                   	push   %ebp
 b91:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 b93:	5d                   	pop    %ebp
    return kthread_cpu_count();
 b94:	e9 49 f9 ff ff       	jmp    4e2 <kthread_cpu_count>
 b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <benny_thread_count>:

int
benny_thread_count(void)
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 ba3:	5d                   	pop    %ebp
    return kthread_thread_count();
 ba4:	e9 41 f9 ff ff       	jmp    4ea <kthread_thread_count>
