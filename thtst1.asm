
_thtst1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}
#endif // KTHREADS

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 20             	sub    $0x20,%esp
#ifdef KTHREADS
    benny_thread_t bt = NULL;
    int rez = -1;
    int i = IVAL;

    if (argc > 1) {
   a:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    benny_thread_t bt = NULL;
   e:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  15:	00 
    int i = IVAL;
  16:	c7 44 24 1c 0f 0f 0f 	movl   $0xf0f0f0f,0x1c(%esp)
  1d:	0f 
    if (argc > 1) {
  1e:	7e 16                	jle    36 <main+0x36>
        kdebug(atoi(argv[1]));
  20:	8b 45 0c             	mov    0xc(%ebp),%eax
  23:	8b 40 04             	mov    0x4(%eax),%eax
  26:	89 04 24             	mov    %eax,(%esp)
  29:	e8 82 03 00 00       	call   3b0 <atoi>
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 94 04 00 00       	call   4ca <kdebug>
    }
    printf(1, "global before: %d\n", global);
  36:	a1 1c 11 00 00       	mov    0x111c,%eax
  3b:	c7 44 24 04 d5 0b 00 	movl   $0xbd5,0x4(%esp)
  42:	00 
  43:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4a:	89 44 24 08          	mov    %eax,0x8(%esp)
  4e:	e8 6d 05 00 00       	call   5c0 <printf>
    printf(1, "i before     : %x\n", i);
  53:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  57:	c7 44 24 04 e8 0b 00 	movl   $0xbe8,0x4(%esp)
  5e:	00 
  5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  66:	89 44 24 08          	mov    %eax,0x8(%esp)
  6a:	e8 51 05 00 00       	call   5c0 <printf>
    rez = benny_thread_create(&bt, func1, &i);
  6f:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  73:	89 44 24 08          	mov    %eax,0x8(%esp)
  77:	8d 44 24 18          	lea    0x18(%esp),%eax
  7b:	c7 44 24 04 80 01 00 	movl   $0x180,0x4(%esp)
  82:	00 
  83:	89 04 24             	mov    %eax,(%esp)
  86:	e8 d5 08 00 00       	call   960 <benny_thread_create>

    sleep(2);
  8b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    rez = benny_thread_create(&bt, func1, &i);
  92:	89 c3                	mov    %eax,%ebx
    sleep(2);
  94:	e8 09 04 00 00       	call   4a2 <sleep>

    printf(1, "rez          : %x\n", rez);
  99:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  9d:	c7 44 24 04 fb 0b 00 	movl   $0xbfb,0x4(%esp)
  a4:	00 
  a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ac:	e8 0f 05 00 00       	call   5c0 <printf>

    rez = benny_thread_join(bt);
  b1:	8b 44 24 18          	mov    0x18(%esp),%eax
  b5:	89 04 24             	mov    %eax,(%esp)
  b8:	e8 53 09 00 00       	call   a10 <benny_thread_join>
    printf(1, "global after : %d\n", global);
  bd:	c7 44 24 04 0e 0c 00 	movl   $0xc0e,0x4(%esp)
  c4:	00 
  c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    rez = benny_thread_join(bt);
  cc:	89 c3                	mov    %eax,%ebx
    printf(1, "global after : %d\n", global);
  ce:	a1 1c 11 00 00       	mov    0x111c,%eax
  d3:	89 44 24 08          	mov    %eax,0x8(%esp)
  d7:	e8 e4 04 00 00       	call   5c0 <printf>
    printf(1, "i after      : %x\n", i);
  dc:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e0:	c7 44 24 04 21 0c 00 	movl   $0xc21,0x4(%esp)
  e7:	00 
  e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	e8 c8 04 00 00       	call   5c0 <printf>
    printf(1, "rez          : %d\n", rez);
  f8:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  fc:	c7 44 24 04 34 0c 00 	movl   $0xc34,0x4(%esp)
 103:	00 
 104:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10b:	e8 b0 04 00 00       	call   5c0 <printf>
    assert(global == 100);
 110:	83 3d 1c 11 00 00 64 	cmpl   $0x64,0x111c
 117:	74 29                	je     142 <main+0x142>
 119:	c7 44 24 0c 3a 00 00 	movl   $0x3a,0xc(%esp)
 120:	00 
    assert(rez == 3);
 121:	c7 44 24 08 cc 0b 00 	movl   $0xbcc,0x8(%esp)
 128:	00 
 129:	c7 44 24 04 48 0c 00 	movl   $0xc48,0x4(%esp)
 130:	00 
 131:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 138:	e8 83 04 00 00       	call   5c0 <printf>
 13d:	e8 d0 02 00 00       	call   412 <exit>
 142:	83 fb 03             	cmp    $0x3,%ebx
 145:	74 0a                	je     151 <main+0x151>
 147:	c7 44 24 0c 3b 00 00 	movl   $0x3b,0xc(%esp)
 14e:	00 
 14f:	eb d0                	jmp    121 <main+0x121>
    assert(i == FVAL);
 151:	81 7c 24 1c ae ae ae 	cmpl   $0xaeaeaeae,0x1c(%esp)
 158:	ae 
 159:	74 0a                	je     165 <main+0x165>
 15b:	c7 44 24 0c 3c 00 00 	movl   $0x3c,0xc(%esp)
 162:	00 
 163:	eb bc                	jmp    121 <main+0x121>

    sleep(2);
 165:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 16c:	e8 31 03 00 00       	call   4a2 <sleep>
#endif // KTHREADS
    exit();
 171:	e8 9c 02 00 00       	call   412 <exit>
 176:	66 90                	xchg   %ax,%ax
 178:	66 90                	xchg   %ax,%ax
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <func1>:
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	83 ec 18             	sub    $0x18,%esp
    assert(global == 10);
 186:	83 3d 1c 11 00 00 0a 	cmpl   $0xa,0x111c
{
 18d:	8b 45 08             	mov    0x8(%ebp),%eax
    assert(global == 10);
 190:	75 25                	jne    1b7 <func1+0x37>
    assert(*i == IVAL);
 192:	81 38 0f 0f 0f 0f    	cmpl   $0xf0f0f0f,(%eax)
 198:	75 46                	jne    1e0 <func1+0x60>
    *i = FVAL;
 19a:	c7 00 ae ae ae ae    	movl   $0xaeaeaeae,(%eax)
    global = 100;
 1a0:	c7 05 1c 11 00 00 64 	movl   $0x64,0x111c
 1a7:	00 00 00 
    benny_thread_exit(3);
 1aa:	c7 45 08 03 00 00 00 	movl   $0x3,0x8(%ebp)
}
 1b1:	c9                   	leave  
    benny_thread_exit(3);
 1b2:	e9 a9 08 00 00       	jmp    a60 <benny_thread_exit>
    assert(global == 10);
 1b7:	c7 44 24 0c 16 00 00 	movl   $0x16,0xc(%esp)
 1be:	00 
    assert(*i == IVAL);
 1bf:	c7 44 24 08 cc 0b 00 	movl   $0xbcc,0x8(%esp)
 1c6:	00 
 1c7:	c7 44 24 04 48 0c 00 	movl   $0xc48,0x4(%esp)
 1ce:	00 
 1cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d6:	e8 e5 03 00 00       	call   5c0 <printf>
 1db:	e8 32 02 00 00       	call   412 <exit>
 1e0:	c7 44 24 0c 17 00 00 	movl   $0x17,0xc(%esp)
 1e7:	00 
 1e8:	eb d5                	jmp    1bf <func1+0x3f>
 1ea:	66 90                	xchg   %ax,%ax
 1ec:	66 90                	xchg   %ax,%ax
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1fa:	89 c2                	mov    %eax,%edx
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 200:	83 c1 01             	add    $0x1,%ecx
 203:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 207:	83 c2 01             	add    $0x1,%edx
 20a:	84 db                	test   %bl,%bl
 20c:	88 5a ff             	mov    %bl,-0x1(%edx)
 20f:	75 ef                	jne    200 <strcpy+0x10>
    ;
  return os;
}
 211:	5b                   	pop    %ebx
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    
 214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 21a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000220 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 55 08             	mov    0x8(%ebp),%edx
 226:	53                   	push   %ebx
 227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 22a:	0f b6 02             	movzbl (%edx),%eax
 22d:	84 c0                	test   %al,%al
 22f:	74 2d                	je     25e <strcmp+0x3e>
 231:	0f b6 19             	movzbl (%ecx),%ebx
 234:	38 d8                	cmp    %bl,%al
 236:	74 0e                	je     246 <strcmp+0x26>
 238:	eb 2b                	jmp    265 <strcmp+0x45>
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 240:	38 c8                	cmp    %cl,%al
 242:	75 15                	jne    259 <strcmp+0x39>
    p++, q++;
 244:	89 d9                	mov    %ebx,%ecx
 246:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 249:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 24c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 24f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 253:	84 c0                	test   %al,%al
 255:	75 e9                	jne    240 <strcmp+0x20>
 257:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 259:	29 c8                	sub    %ecx,%eax
}
 25b:	5b                   	pop    %ebx
 25c:	5d                   	pop    %ebp
 25d:	c3                   	ret    
 25e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 261:	31 c0                	xor    %eax,%eax
 263:	eb f4                	jmp    259 <strcmp+0x39>
 265:	0f b6 cb             	movzbl %bl,%ecx
 268:	eb ef                	jmp    259 <strcmp+0x39>
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <strlen>:

uint
strlen(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 276:	80 39 00             	cmpb   $0x0,(%ecx)
 279:	74 12                	je     28d <strlen+0x1d>
 27b:	31 d2                	xor    %edx,%edx
 27d:	8d 76 00             	lea    0x0(%esi),%esi
 280:	83 c2 01             	add    $0x1,%edx
 283:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 287:	89 d0                	mov    %edx,%eax
 289:	75 f5                	jne    280 <strlen+0x10>
    ;
  return n;
}
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 28d:	31 c0                	xor    %eax,%eax
}
 28f:	5d                   	pop    %ebp
 290:	c3                   	ret    
 291:	eb 0d                	jmp    2a0 <memset>
 293:	90                   	nop
 294:	90                   	nop
 295:	90                   	nop
 296:	90                   	nop
 297:	90                   	nop
 298:	90                   	nop
 299:	90                   	nop
 29a:	90                   	nop
 29b:	90                   	nop
 29c:	90                   	nop
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 55 08             	mov    0x8(%ebp),%edx
 2a6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 d7                	mov    %edx,%edi
 2af:	fc                   	cld    
 2b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b2:	89 d0                	mov    %edx,%eax
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <strchr>:

char*
strchr(const char *s, char c)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	53                   	push   %ebx
 2c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 2ca:	0f b6 18             	movzbl (%eax),%ebx
 2cd:	84 db                	test   %bl,%bl
 2cf:	74 1d                	je     2ee <strchr+0x2e>
    if(*s == c)
 2d1:	38 d3                	cmp    %dl,%bl
 2d3:	89 d1                	mov    %edx,%ecx
 2d5:	75 0d                	jne    2e4 <strchr+0x24>
 2d7:	eb 17                	jmp    2f0 <strchr+0x30>
 2d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2e0:	38 ca                	cmp    %cl,%dl
 2e2:	74 0c                	je     2f0 <strchr+0x30>
  for(; *s; s++)
 2e4:	83 c0 01             	add    $0x1,%eax
 2e7:	0f b6 10             	movzbl (%eax),%edx
 2ea:	84 d2                	test   %dl,%dl
 2ec:	75 f2                	jne    2e0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ee:	31 c0                	xor    %eax,%eax
}
 2f0:	5b                   	pop    %ebx
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    
 2f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <gets>:

char*
gets(char *buf, int max)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 305:	31 f6                	xor    %esi,%esi
{
 307:	53                   	push   %ebx
 308:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 30b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 30e:	eb 31                	jmp    341 <gets+0x41>
    cc = read(0, &c, 1);
 310:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 317:	00 
 318:	89 7c 24 04          	mov    %edi,0x4(%esp)
 31c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 323:	e8 02 01 00 00       	call   42a <read>
    if(cc < 1)
 328:	85 c0                	test   %eax,%eax
 32a:	7e 1d                	jle    349 <gets+0x49>
      break;
    buf[i++] = c;
 32c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 330:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 332:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 335:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 337:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 33b:	74 0c                	je     349 <gets+0x49>
 33d:	3c 0a                	cmp    $0xa,%al
 33f:	74 08                	je     349 <gets+0x49>
  for(i=0; i+1 < max; ){
 341:	8d 5e 01             	lea    0x1(%esi),%ebx
 344:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 347:	7c c7                	jl     310 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 350:	83 c4 2c             	add    $0x2c,%esp
 353:	5b                   	pop    %ebx
 354:	5e                   	pop    %esi
 355:	5f                   	pop    %edi
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <stat>:

int
stat(const char *n, struct stat *st)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 368:	8b 45 08             	mov    0x8(%ebp),%eax
 36b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 372:	00 
 373:	89 04 24             	mov    %eax,(%esp)
 376:	e8 d7 00 00 00       	call   452 <open>
  if(fd < 0)
 37b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 37d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 37f:	78 27                	js     3a8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	89 1c 24             	mov    %ebx,(%esp)
 387:	89 44 24 04          	mov    %eax,0x4(%esp)
 38b:	e8 da 00 00 00       	call   46a <fstat>
  close(fd);
 390:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 393:	89 c6                	mov    %eax,%esi
  close(fd);
 395:	e8 a0 00 00 00       	call   43a <close>
  return r;
 39a:	89 f0                	mov    %esi,%eax
}
 39c:	83 c4 10             	add    $0x10,%esp
 39f:	5b                   	pop    %ebx
 3a0:	5e                   	pop    %esi
 3a1:	5d                   	pop    %ebp
 3a2:	c3                   	ret    
 3a3:	90                   	nop
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ad:	eb ed                	jmp    39c <stat+0x3c>
 3af:	90                   	nop

000003b0 <atoi>:

int
atoi(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3b6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b7:	0f be 11             	movsbl (%ecx),%edx
 3ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 3bd:	3c 09                	cmp    $0x9,%al
  n = 0;
 3bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3c4:	77 17                	ja     3dd <atoi+0x2d>
 3c6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3c8:	83 c1 01             	add    $0x1,%ecx
 3cb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3ce:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 3d2:	0f be 11             	movsbl (%ecx),%edx
 3d5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3d8:	80 fb 09             	cmp    $0x9,%bl
 3db:	76 eb                	jbe    3c8 <atoi+0x18>
  return n;
}
 3dd:	5b                   	pop    %ebx
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3e1:	31 d2                	xor    %edx,%edx
{
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	56                   	push   %esi
 3e6:	8b 45 08             	mov    0x8(%ebp),%eax
 3e9:	53                   	push   %ebx
 3ea:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ed:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 3f0:	85 db                	test   %ebx,%ebx
 3f2:	7e 12                	jle    406 <memmove+0x26>
 3f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3ff:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 402:	39 da                	cmp    %ebx,%edx
 404:	75 f2                	jne    3f8 <memmove+0x18>
  return vdst;
}
 406:	5b                   	pop    %ebx
 407:	5e                   	pop    %esi
 408:	5d                   	pop    %ebp
 409:	c3                   	ret    

0000040a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40a:	b8 01 00 00 00       	mov    $0x1,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <exit>:
SYSCALL(exit)
 412:	b8 02 00 00 00       	mov    $0x2,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <wait>:
SYSCALL(wait)
 41a:	b8 03 00 00 00       	mov    $0x3,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <pipe>:
SYSCALL(pipe)
 422:	b8 04 00 00 00       	mov    $0x4,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <read>:
SYSCALL(read)
 42a:	b8 05 00 00 00       	mov    $0x5,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <write>:
SYSCALL(write)
 432:	b8 10 00 00 00       	mov    $0x10,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <close>:
SYSCALL(close)
 43a:	b8 15 00 00 00       	mov    $0x15,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <kill>:
SYSCALL(kill)
 442:	b8 06 00 00 00       	mov    $0x6,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <exec>:
SYSCALL(exec)
 44a:	b8 07 00 00 00       	mov    $0x7,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <open>:
SYSCALL(open)
 452:	b8 0f 00 00 00       	mov    $0xf,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <mknod>:
SYSCALL(mknod)
 45a:	b8 11 00 00 00       	mov    $0x11,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <unlink>:
SYSCALL(unlink)
 462:	b8 12 00 00 00       	mov    $0x12,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <fstat>:
SYSCALL(fstat)
 46a:	b8 08 00 00 00       	mov    $0x8,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <link>:
SYSCALL(link)
 472:	b8 13 00 00 00       	mov    $0x13,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <mkdir>:
SYSCALL(mkdir)
 47a:	b8 14 00 00 00       	mov    $0x14,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <chdir>:
SYSCALL(chdir)
 482:	b8 09 00 00 00       	mov    $0x9,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <dup>:
SYSCALL(dup)
 48a:	b8 0a 00 00 00       	mov    $0xa,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <getpid>:
SYSCALL(getpid)
 492:	b8 0b 00 00 00       	mov    $0xb,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <sbrk>:
SYSCALL(sbrk)
 49a:	b8 0c 00 00 00       	mov    $0xc,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <sleep>:
SYSCALL(sleep)
 4a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <uptime>:
SYSCALL(uptime)
 4aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 4b2:	b8 16 00 00 00       	mov    $0x16,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 4ba:	b8 17 00 00 00       	mov    $0x17,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 4c2:	b8 18 00 00 00       	mov    $0x18,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 4ca:	b8 19 00 00 00       	mov    $0x19,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 4d2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 4da:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <kthread_join>:
SYSCALL(kthread_join)
 4e2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <kthread_exit>:
SYSCALL(kthread_exit)
 4ea:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 4f2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <kthread_yield>:
SYSCALL(kthread_yield)
 4fa:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 502:	b8 20 00 00 00       	mov    $0x20,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 50a:	b8 21 00 00 00       	mov    $0x21,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    
 512:	66 90                	xchg   %ax,%ax
 514:	66 90                	xchg   %ax,%ax
 516:	66 90                	xchg   %ax,%ax
 518:	66 90                	xchg   %ax,%ax
 51a:	66 90                	xchg   %ax,%ax
 51c:	66 90                	xchg   %ax,%ax
 51e:	66 90                	xchg   %ax,%ax

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	89 c6                	mov    %eax,%esi
 527:	53                   	push   %ebx
 528:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 52b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 52e:	85 db                	test   %ebx,%ebx
 530:	74 09                	je     53b <printint+0x1b>
 532:	89 d0                	mov    %edx,%eax
 534:	c1 e8 1f             	shr    $0x1f,%eax
 537:	84 c0                	test   %al,%al
 539:	75 75                	jne    5b0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 53b:	89 d0                	mov    %edx,%eax
  neg = 0;
 53d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 544:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 547:	31 ff                	xor    %edi,%edi
 549:	89 ce                	mov    %ecx,%esi
 54b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 54e:	eb 02                	jmp    552 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 550:	89 cf                	mov    %ecx,%edi
 552:	31 d2                	xor    %edx,%edx
 554:	f7 f6                	div    %esi
 556:	8d 4f 01             	lea    0x1(%edi),%ecx
 559:	0f b6 92 73 0c 00 00 	movzbl 0xc73(%edx),%edx
  }while((x /= base) != 0);
 560:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 562:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 565:	75 e9                	jne    550 <printint+0x30>
  if(neg)
 567:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 56a:	89 c8                	mov    %ecx,%eax
 56c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 56f:	85 d2                	test   %edx,%edx
 571:	74 08                	je     57b <printint+0x5b>
    buf[i++] = '-';
 573:	8d 4f 02             	lea    0x2(%edi),%ecx
 576:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 57b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 57e:	66 90                	xchg   %ax,%ax
 580:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 585:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 588:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 58f:	00 
 590:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 594:	89 34 24             	mov    %esi,(%esp)
 597:	88 45 d7             	mov    %al,-0x29(%ebp)
 59a:	e8 93 fe ff ff       	call   432 <write>
  while(--i >= 0)
 59f:	83 ff ff             	cmp    $0xffffffff,%edi
 5a2:	75 dc                	jne    580 <printint+0x60>
    putc(fd, buf[i]);
}
 5a4:	83 c4 4c             	add    $0x4c,%esp
 5a7:	5b                   	pop    %ebx
 5a8:	5e                   	pop    %esi
 5a9:	5f                   	pop    %edi
 5aa:	5d                   	pop    %ebp
 5ab:	c3                   	ret    
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 5b0:	89 d0                	mov    %edx,%eax
 5b2:	f7 d8                	neg    %eax
    neg = 1;
 5b4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 5bb:	eb 87                	jmp    544 <printint+0x24>
 5bd:	8d 76 00             	lea    0x0(%esi),%esi

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5c4:	31 ff                	xor    %edi,%edi
{
 5c6:	56                   	push   %esi
 5c7:	53                   	push   %ebx
 5c8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 5ce:	8d 45 10             	lea    0x10(%ebp),%eax
{
 5d1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 5d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 5d7:	0f b6 13             	movzbl (%ebx),%edx
 5da:	83 c3 01             	add    $0x1,%ebx
 5dd:	84 d2                	test   %dl,%dl
 5df:	75 39                	jne    61a <printf+0x5a>
 5e1:	e9 ca 00 00 00       	jmp    6b0 <printf+0xf0>
 5e6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5e8:	83 fa 25             	cmp    $0x25,%edx
 5eb:	0f 84 c7 00 00 00    	je     6b8 <printf+0xf8>
  write(fd, &c, 1);
 5f1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 5f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5fb:	00 
 5fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 600:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 603:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 606:	e8 27 fe ff ff       	call   432 <write>
 60b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 60e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 612:	84 d2                	test   %dl,%dl
 614:	0f 84 96 00 00 00    	je     6b0 <printf+0xf0>
    if(state == 0){
 61a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 61c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 61f:	74 c7                	je     5e8 <printf+0x28>
      }
    } else if(state == '%'){
 621:	83 ff 25             	cmp    $0x25,%edi
 624:	75 e5                	jne    60b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 626:	83 fa 75             	cmp    $0x75,%edx
 629:	0f 84 99 00 00 00    	je     6c8 <printf+0x108>
 62f:	83 fa 64             	cmp    $0x64,%edx
 632:	0f 84 90 00 00 00    	je     6c8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 638:	25 f7 00 00 00       	and    $0xf7,%eax
 63d:	83 f8 70             	cmp    $0x70,%eax
 640:	0f 84 aa 00 00 00    	je     6f0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 646:	83 fa 73             	cmp    $0x73,%edx
 649:	0f 84 e9 00 00 00    	je     738 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 64f:	83 fa 63             	cmp    $0x63,%edx
 652:	0f 84 2b 01 00 00    	je     783 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 658:	83 fa 25             	cmp    $0x25,%edx
 65b:	0f 84 4f 01 00 00    	je     7b0 <printf+0x1f0>
  write(fd, &c, 1);
 661:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 664:	83 c3 01             	add    $0x1,%ebx
 667:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 66e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 66f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 671:	89 44 24 04          	mov    %eax,0x4(%esp)
 675:	89 34 24             	mov    %esi,(%esp)
 678:	89 55 d0             	mov    %edx,-0x30(%ebp)
 67b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 67f:	e8 ae fd ff ff       	call   432 <write>
        putc(fd, c);
 684:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 687:	8d 45 e7             	lea    -0x19(%ebp),%eax
 68a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 691:	00 
 692:	89 44 24 04          	mov    %eax,0x4(%esp)
 696:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 699:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 69c:	e8 91 fd ff ff       	call   432 <write>
  for(i = 0; fmt[i]; i++){
 6a1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 6a5:	84 d2                	test   %dl,%dl
 6a7:	0f 85 6d ff ff ff    	jne    61a <printf+0x5a>
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 6b0:	83 c4 3c             	add    $0x3c,%esp
 6b3:	5b                   	pop    %ebx
 6b4:	5e                   	pop    %esi
 6b5:	5f                   	pop    %edi
 6b6:	5d                   	pop    %ebp
 6b7:	c3                   	ret    
        state = '%';
 6b8:	bf 25 00 00 00       	mov    $0x25,%edi
 6bd:	e9 49 ff ff ff       	jmp    60b <printf+0x4b>
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6cf:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 6d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6d7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 6d9:	8b 10                	mov    (%eax),%edx
 6db:	89 f0                	mov    %esi,%eax
 6dd:	e8 3e fe ff ff       	call   520 <printint>
        ap++;
 6e2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6e6:	e9 20 ff ff ff       	jmp    60b <printf+0x4b>
 6eb:	90                   	nop
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6f0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 6f3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6fa:	00 
 6fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ff:	89 34 24             	mov    %esi,(%esp)
 702:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 706:	e8 27 fd ff ff       	call   432 <write>
 70b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 70e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 715:	00 
 716:	89 44 24 04          	mov    %eax,0x4(%esp)
 71a:	89 34 24             	mov    %esi,(%esp)
 71d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 721:	e8 0c fd ff ff       	call   432 <write>
        printint(fd, *ap, 16, 0);
 726:	b9 10 00 00 00       	mov    $0x10,%ecx
 72b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 732:	eb a0                	jmp    6d4 <printf+0x114>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 738:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 73b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 73f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 741:	b8 6c 0c 00 00       	mov    $0xc6c,%eax
 746:	85 ff                	test   %edi,%edi
 748:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 74b:	0f b6 07             	movzbl (%edi),%eax
 74e:	84 c0                	test   %al,%al
 750:	74 2a                	je     77c <printf+0x1bc>
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 758:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 75b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 75e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 761:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 768:	00 
 769:	89 44 24 04          	mov    %eax,0x4(%esp)
 76d:	89 34 24             	mov    %esi,(%esp)
 770:	e8 bd fc ff ff       	call   432 <write>
        while(*s != 0){
 775:	0f b6 07             	movzbl (%edi),%eax
 778:	84 c0                	test   %al,%al
 77a:	75 dc                	jne    758 <printf+0x198>
      state = 0;
 77c:	31 ff                	xor    %edi,%edi
 77e:	e9 88 fe ff ff       	jmp    60b <printf+0x4b>
        putc(fd, *ap);
 783:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 786:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 788:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 78a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 791:	00 
 792:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 795:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 798:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 79b:	89 44 24 04          	mov    %eax,0x4(%esp)
 79f:	e8 8e fc ff ff       	call   432 <write>
        ap++;
 7a4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7a8:	e9 5e fe ff ff       	jmp    60b <printf+0x4b>
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7b0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 7b3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7b5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7bc:	00 
 7bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c1:	89 34 24             	mov    %esi,(%esp)
 7c4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 7c8:	e8 65 fc ff ff       	call   432 <write>
 7cd:	e9 39 fe ff ff       	jmp    60b <printf+0x4b>
 7d2:	66 90                	xchg   %ax,%ax
 7d4:	66 90                	xchg   %ax,%ax
 7d6:	66 90                	xchg   %ax,%ax
 7d8:	66 90                	xchg   %ax,%ax
 7da:	66 90                	xchg   %ax,%ax
 7dc:	66 90                	xchg   %ax,%ax
 7de:	66 90                	xchg   %ax,%ax

000007e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	a1 20 11 00 00       	mov    0x1120,%eax
{
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	57                   	push   %edi
 7e9:	56                   	push   %esi
 7ea:	53                   	push   %ebx
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ee:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 7f0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f3:	39 d0                	cmp    %edx,%eax
 7f5:	72 11                	jb     808 <free+0x28>
 7f7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f8:	39 c8                	cmp    %ecx,%eax
 7fa:	72 04                	jb     800 <free+0x20>
 7fc:	39 ca                	cmp    %ecx,%edx
 7fe:	72 10                	jb     810 <free+0x30>
 800:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 802:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 804:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 806:	73 f0                	jae    7f8 <free+0x18>
 808:	39 ca                	cmp    %ecx,%edx
 80a:	72 04                	jb     810 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80c:	39 c8                	cmp    %ecx,%eax
 80e:	72 f0                	jb     800 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 810:	8b 73 fc             	mov    -0x4(%ebx),%esi
 813:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 816:	39 cf                	cmp    %ecx,%edi
 818:	74 1e                	je     838 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 81a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 81d:	8b 48 04             	mov    0x4(%eax),%ecx
 820:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 823:	39 f2                	cmp    %esi,%edx
 825:	74 28                	je     84f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 827:	89 10                	mov    %edx,(%eax)
  freep = p;
 829:	a3 20 11 00 00       	mov    %eax,0x1120
}
 82e:	5b                   	pop    %ebx
 82f:	5e                   	pop    %esi
 830:	5f                   	pop    %edi
 831:	5d                   	pop    %ebp
 832:	c3                   	ret    
 833:	90                   	nop
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 838:	03 71 04             	add    0x4(%ecx),%esi
 83b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 83e:	8b 08                	mov    (%eax),%ecx
 840:	8b 09                	mov    (%ecx),%ecx
 842:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 845:	8b 48 04             	mov    0x4(%eax),%ecx
 848:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 84b:	39 f2                	cmp    %esi,%edx
 84d:	75 d8                	jne    827 <free+0x47>
    p->s.size += bp->s.size;
 84f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 852:	a3 20 11 00 00       	mov    %eax,0x1120
    p->s.size += bp->s.size;
 857:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 85d:	89 10                	mov    %edx,(%eax)
}
 85f:	5b                   	pop    %ebx
 860:	5e                   	pop    %esi
 861:	5f                   	pop    %edi
 862:	5d                   	pop    %ebp
 863:	c3                   	ret    
 864:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 86a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000870 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	57                   	push   %edi
 874:	56                   	push   %esi
 875:	53                   	push   %ebx
 876:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 879:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 87c:	8b 1d 20 11 00 00    	mov    0x1120,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 882:	8d 48 07             	lea    0x7(%eax),%ecx
 885:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 888:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 88d:	0f 84 9b 00 00 00    	je     92e <malloc+0xbe>
 893:	8b 13                	mov    (%ebx),%edx
 895:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 898:	39 fe                	cmp    %edi,%esi
 89a:	76 64                	jbe    900 <malloc+0x90>
 89c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 8a3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 8a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8ab:	eb 0e                	jmp    8bb <malloc+0x4b>
 8ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8b2:	8b 78 04             	mov    0x4(%eax),%edi
 8b5:	39 fe                	cmp    %edi,%esi
 8b7:	76 4f                	jbe    908 <malloc+0x98>
 8b9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8bb:	3b 15 20 11 00 00    	cmp    0x1120,%edx
 8c1:	75 ed                	jne    8b0 <malloc+0x40>
  if(nu < 4096)
 8c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8cc:	bf 00 10 00 00       	mov    $0x1000,%edi
 8d1:	0f 43 fe             	cmovae %esi,%edi
 8d4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 8d7:	89 04 24             	mov    %eax,(%esp)
 8da:	e8 bb fb ff ff       	call   49a <sbrk>
  if(p == (char*)-1)
 8df:	83 f8 ff             	cmp    $0xffffffff,%eax
 8e2:	74 18                	je     8fc <malloc+0x8c>
  hp->s.size = nu;
 8e4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 8e7:	83 c0 08             	add    $0x8,%eax
 8ea:	89 04 24             	mov    %eax,(%esp)
 8ed:	e8 ee fe ff ff       	call   7e0 <free>
  return freep;
 8f2:	8b 15 20 11 00 00    	mov    0x1120,%edx
      if((p = morecore(nunits)) == 0)
 8f8:	85 d2                	test   %edx,%edx
 8fa:	75 b4                	jne    8b0 <malloc+0x40>
        return 0;
 8fc:	31 c0                	xor    %eax,%eax
 8fe:	eb 20                	jmp    920 <malloc+0xb0>
    if(p->s.size >= nunits){
 900:	89 d0                	mov    %edx,%eax
 902:	89 da                	mov    %ebx,%edx
 904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 908:	39 fe                	cmp    %edi,%esi
 90a:	74 1c                	je     928 <malloc+0xb8>
        p->s.size -= nunits;
 90c:	29 f7                	sub    %esi,%edi
 90e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 911:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 914:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 917:	89 15 20 11 00 00    	mov    %edx,0x1120
      return (void*)(p + 1);
 91d:	83 c0 08             	add    $0x8,%eax
  }
}
 920:	83 c4 1c             	add    $0x1c,%esp
 923:	5b                   	pop    %ebx
 924:	5e                   	pop    %esi
 925:	5f                   	pop    %edi
 926:	5d                   	pop    %ebp
 927:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 928:	8b 08                	mov    (%eax),%ecx
 92a:	89 0a                	mov    %ecx,(%edx)
 92c:	eb e9                	jmp    917 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 92e:	c7 05 20 11 00 00 24 	movl   $0x1124,0x1120
 935:	11 00 00 
    base.s.size = 0;
 938:	ba 24 11 00 00       	mov    $0x1124,%edx
    base.s.ptr = freep = prevp = &base;
 93d:	c7 05 24 11 00 00 24 	movl   $0x1124,0x1124
 944:	11 00 00 
    base.s.size = 0;
 947:	c7 05 28 11 00 00 00 	movl   $0x0,0x1128
 94e:	00 00 00 
 951:	e9 46 ff ff ff       	jmp    89c <malloc+0x2c>
 956:	66 90                	xchg   %ax,%ax
 958:	66 90                	xchg   %ax,%ax
 95a:	66 90                	xchg   %ax,%ax
 95c:	66 90                	xchg   %ax,%ax
 95e:	66 90                	xchg   %ax,%ax

00000960 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	56                   	push   %esi
 964:	53                   	push   %ebx
 965:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 968:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 96f:	e8 fc fe ff ff       	call   870 <malloc>

    if (bt == NULL) {
 974:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 976:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 978:	74 66                	je     9e0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 97a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 981:	e8 ea fe ff ff       	call   870 <malloc>
    if (bt->bt_stack == NULL) {
 986:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 988:	89 c3                	mov    %eax,%ebx
 98a:	89 46 08             	mov    %eax,0x8(%esi)
 98d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 990:	74 5d                	je     9ef <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 992:	25 ff 0f 00 00       	and    $0xfff,%eax
 997:	75 37                	jne    9d0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 999:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 99f:	8b 45 10             	mov    0x10(%ebp),%eax
 9a2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 9a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 9aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 9ad:	89 04 24             	mov    %eax,(%esp)
 9b0:	e8 25 fb ff ff       	call   4da <kthread_create>
    if (bt->bid != 0) {
 9b5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 9b7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 9b9:	74 2d                	je     9e8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 9bb:	8b 45 08             	mov    0x8(%ebp),%eax
 9be:	89 30                	mov    %esi,(%eax)
        result = 0;
 9c0:	31 c0                	xor    %eax,%eax
}
 9c2:	83 c4 10             	add    $0x10,%esp
 9c5:	5b                   	pop    %ebx
 9c6:	5e                   	pop    %esi
 9c7:	5d                   	pop    %ebp
 9c8:	c3                   	ret    
 9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 9d0:	29 c3                	sub    %eax,%ebx
 9d2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 9d8:	89 5e 04             	mov    %ebx,0x4(%esi)
 9db:	eb bc                	jmp    999 <benny_thread_create+0x39>
 9dd:	8d 76 00             	lea    0x0(%esi),%esi
 9e0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 9e6:	eb b7                	jmp    99f <benny_thread_create+0x3f>
    int result = -1;
 9e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9ed:	eb d3                	jmp    9c2 <benny_thread_create+0x62>
        free(bt);
 9ef:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 9f2:	31 f6                	xor    %esi,%esi
        free(bt);
 9f4:	e8 e7 fd ff ff       	call   7e0 <free>
 9f9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 9fc:	eb a1                	jmp    99f <benny_thread_create+0x3f>
 9fe:	66 90                	xchg   %ax,%ax

00000a00 <benny_thread_bid>:
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 a03:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a06:	5d                   	pop    %ebp
    return bt->bid;
 a07:	8b 00                	mov    (%eax),%eax
}
 a09:	c3                   	ret    
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a10 <benny_thread_join>:
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	53                   	push   %ebx
 a14:	83 ec 14             	sub    $0x14,%esp
 a17:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 a1a:	8b 03                	mov    (%ebx),%eax
 a1c:	89 04 24             	mov    %eax,(%esp)
 a1f:	e8 be fa ff ff       	call   4e2 <kthread_join>
    if (retVal == 0) {
 a24:	85 c0                	test   %eax,%eax
 a26:	75 27                	jne    a4f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 a28:	8b 53 08             	mov    0x8(%ebx),%edx
 a2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a2e:	89 14 24             	mov    %edx,(%esp)
 a31:	e8 aa fd ff ff       	call   7e0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 a36:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 a3d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 a44:	89 1c 24             	mov    %ebx,(%esp)
 a47:	e8 94 fd ff ff       	call   7e0 <free>
 a4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 a4f:	83 c4 14             	add    $0x14,%esp
 a52:	5b                   	pop    %ebx
 a53:	5d                   	pop    %ebp
 a54:	c3                   	ret    
 a55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a60 <benny_thread_exit>:
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
}
 a63:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 a64:	e9 81 fa ff ff       	jmp    4ea <kthread_exit>
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a70 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
 a73:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 a76:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 a7c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 a83:	31 c0                	xor    %eax,%eax
 a85:	5d                   	pop    %ebp
 a86:	c3                   	ret    
 a87:	89 f6                	mov    %esi,%esi
 a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a90 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 a90:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a91:	b8 01 00 00 00       	mov    $0x1,%eax
 a96:	89 e5                	mov    %esp,%ebp
 a98:	56                   	push   %esi
 a99:	53                   	push   %ebx
 a9a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a9d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 aa0:	85 c0                	test   %eax,%eax
 aa2:	be 01 00 00 00       	mov    $0x1,%esi
 aa7:	74 15                	je     abe <benny_mootex_yieldlock+0x2e>
 aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 ab0:	e8 45 fa ff ff       	call   4fa <kthread_yield>
 ab5:	89 f0                	mov    %esi,%eax
 ab7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 aba:	85 c0                	test   %eax,%eax
 abc:	75 f2                	jne    ab0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 abe:	e8 2f fa ff ff       	call   4f2 <kthread_self>
    benny_mootex->bid = benny_self();
 ac3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 ac6:	31 c0                	xor    %eax,%eax
 ac8:	5b                   	pop    %ebx
 ac9:	5e                   	pop    %esi
 aca:	5d                   	pop    %ebp
 acb:	c3                   	ret    
 acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <benny_mootex_spinlock>:
{
 ad0:	55                   	push   %ebp
 ad1:	ba 01 00 00 00       	mov    $0x1,%edx
 ad6:	89 e5                	mov    %esp,%ebp
 ad8:	53                   	push   %ebx
 ad9:	83 ec 04             	sub    $0x4,%esp
 adc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 adf:	90                   	nop
 ae0:	89 d0                	mov    %edx,%eax
 ae2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 ae5:	85 c0                	test   %eax,%eax
 ae7:	75 f7                	jne    ae0 <benny_mootex_spinlock+0x10>
    return kthread_self();
 ae9:	e8 04 fa ff ff       	call   4f2 <kthread_self>
    benny_mootex->bid = benny_self();
 aee:	89 43 04             	mov    %eax,0x4(%ebx)
}
 af1:	83 c4 04             	add    $0x4,%esp
 af4:	31 c0                	xor    %eax,%eax
 af6:	5b                   	pop    %ebx
 af7:	5d                   	pop    %ebp
 af8:	c3                   	ret    
 af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b00 <benny_mootex_unlock>:
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	53                   	push   %ebx
 b04:	83 ec 04             	sub    $0x4,%esp
 b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 b0a:	e8 e3 f9 ff ff       	call   4f2 <kthread_self>
    if(tid == benny_mootex->bid){
 b0f:	39 43 04             	cmp    %eax,0x4(%ebx)
 b12:	75 1c                	jne    b30 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 b14:	0f ae f0             	mfence 
    return 0;
 b17:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 b19:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 b20:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 b26:	83 c4 04             	add    $0x4,%esp
 b29:	5b                   	pop    %ebx
 b2a:	5d                   	pop    %ebp
 b2b:	c3                   	ret    
 b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b30:	83 c4 04             	add    $0x4,%esp
      return -1;
 b33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b38:	5b                   	pop    %ebx
 b39:	5d                   	pop    %ebp
 b3a:	c3                   	ret    
 b3b:	90                   	nop
 b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b40 <benny_mootex_trylock>:
{
 b40:	55                   	push   %ebp
 b41:	b8 01 00 00 00       	mov    $0x1,%eax
 b46:	89 e5                	mov    %esp,%ebp
 b48:	53                   	push   %ebx
 b49:	83 ec 04             	sub    $0x4,%esp
 b4c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b4f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 b52:	85 c0                	test   %eax,%eax
 b54:	75 08                	jne    b5e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 b56:	e8 97 f9 ff ff       	call   4f2 <kthread_self>
        benny_mootex->bid = tid;
 b5b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b5e:	83 c4 04             	add    $0x4,%esp
 b61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b66:	5b                   	pop    %ebx
 b67:	5d                   	pop    %ebp
 b68:	c3                   	ret    
 b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b70 <benny_mootex_wholock>:
{
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 b73:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b76:	5d                   	pop    %ebp
    return benny_mootex->bid;
 b77:	8b 40 04             	mov    0x4(%eax),%eax
}
 b7a:	c3                   	ret    
 b7b:	90                   	nop
 b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b80 <benny_mootex_islocked>:
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 b83:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b86:	5d                   	pop    %ebp
    return benny_mootex->locked;
 b87:	8b 00                	mov    (%eax),%eax
}
 b89:	c3                   	ret    
 b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b90 <benny_self>:
{
 b90:	55                   	push   %ebp
 b91:	89 e5                	mov    %esp,%ebp
}
 b93:	5d                   	pop    %ebp
    return kthread_self();
 b94:	e9 59 f9 ff ff       	jmp    4f2 <kthread_self>
 b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <benny_yield>:
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
    
}
 ba3:	5d                   	pop    %ebp
    return kthread_yield();
 ba4:	e9 51 f9 ff ff       	jmp    4fa <kthread_yield>
 ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bb0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 bb3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 bb4:	e9 49 f9 ff ff       	jmp    502 <kthread_cpu_count>
 bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bc0 <benny_thread_count>:

int
benny_thread_count(void)
{
 bc0:	55                   	push   %ebp
 bc1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 bc3:	5d                   	pop    %ebp
    return kthread_thread_count();
 bc4:	e9 41 f9 ff ff       	jmp    50a <kthread_thread_count>
