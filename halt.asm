
_halt:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
#ifdef HALT
    halt();
   6:	e8 d7 02 00 00       	call   2e2 <halt>
#endif // HALT
    exit();
   b:	e8 22 02 00 00       	call   232 <exit>

00000010 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	8b 45 08             	mov    0x8(%ebp),%eax
  16:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  19:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  1a:	89 c2                	mov    %eax,%edx
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  20:	83 c1 01             	add    $0x1,%ecx
  23:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  27:	83 c2 01             	add    $0x1,%edx
  2a:	84 db                	test   %bl,%bl
  2c:	88 5a ff             	mov    %bl,-0x1(%edx)
  2f:	75 ef                	jne    20 <strcpy+0x10>
    ;
  return os;
}
  31:	5b                   	pop    %ebx
  32:	5d                   	pop    %ebp
  33:	c3                   	ret    
  34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000040 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	8b 55 08             	mov    0x8(%ebp),%edx
  46:	53                   	push   %ebx
  47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  4a:	0f b6 02             	movzbl (%edx),%eax
  4d:	84 c0                	test   %al,%al
  4f:	74 2d                	je     7e <strcmp+0x3e>
  51:	0f b6 19             	movzbl (%ecx),%ebx
  54:	38 d8                	cmp    %bl,%al
  56:	74 0e                	je     66 <strcmp+0x26>
  58:	eb 2b                	jmp    85 <strcmp+0x45>
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  60:	38 c8                	cmp    %cl,%al
  62:	75 15                	jne    79 <strcmp+0x39>
    p++, q++;
  64:	89 d9                	mov    %ebx,%ecx
  66:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  69:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  6c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  6f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  73:	84 c0                	test   %al,%al
  75:	75 e9                	jne    60 <strcmp+0x20>
  77:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  79:	29 c8                	sub    %ecx,%eax
}
  7b:	5b                   	pop    %ebx
  7c:	5d                   	pop    %ebp
  7d:	c3                   	ret    
  7e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
  81:	31 c0                	xor    %eax,%eax
  83:	eb f4                	jmp    79 <strcmp+0x39>
  85:	0f b6 cb             	movzbl %bl,%ecx
  88:	eb ef                	jmp    79 <strcmp+0x39>
  8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000090 <strlen>:

uint
strlen(const char *s)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  96:	80 39 00             	cmpb   $0x0,(%ecx)
  99:	74 12                	je     ad <strlen+0x1d>
  9b:	31 d2                	xor    %edx,%edx
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  a0:	83 c2 01             	add    $0x1,%edx
  a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  a7:	89 d0                	mov    %edx,%eax
  a9:	75 f5                	jne    a0 <strlen+0x10>
    ;
  return n;
}
  ab:	5d                   	pop    %ebp
  ac:	c3                   	ret    
  for(n = 0; s[n]; n++)
  ad:	31 c0                	xor    %eax,%eax
}
  af:	5d                   	pop    %ebp
  b0:	c3                   	ret    
  b1:	eb 0d                	jmp    c0 <memset>
  b3:	90                   	nop
  b4:	90                   	nop
  b5:	90                   	nop
  b6:	90                   	nop
  b7:	90                   	nop
  b8:	90                   	nop
  b9:	90                   	nop
  ba:	90                   	nop
  bb:	90                   	nop
  bc:	90                   	nop
  bd:	90                   	nop
  be:	90                   	nop
  bf:	90                   	nop

000000c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  cd:	89 d7                	mov    %edx,%edi
  cf:	fc                   	cld    
  d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  d2:	89 d0                	mov    %edx,%eax
  d4:	5f                   	pop    %edi
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	89 f6                	mov    %esi,%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000e0 <strchr>:

char*
strchr(const char *s, char c)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	53                   	push   %ebx
  e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
  ea:	0f b6 18             	movzbl (%eax),%ebx
  ed:	84 db                	test   %bl,%bl
  ef:	74 1d                	je     10e <strchr+0x2e>
    if(*s == c)
  f1:	38 d3                	cmp    %dl,%bl
  f3:	89 d1                	mov    %edx,%ecx
  f5:	75 0d                	jne    104 <strchr+0x24>
  f7:	eb 17                	jmp    110 <strchr+0x30>
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 100:	38 ca                	cmp    %cl,%dl
 102:	74 0c                	je     110 <strchr+0x30>
  for(; *s; s++)
 104:	83 c0 01             	add    $0x1,%eax
 107:	0f b6 10             	movzbl (%eax),%edx
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strchr+0x20>
      return (char*)s;
  return 0;
 10e:	31 c0                	xor    %eax,%eax
}
 110:	5b                   	pop    %ebx
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    
 113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <gets>:

char*
gets(char *buf, int max)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 125:	31 f6                	xor    %esi,%esi
{
 127:	53                   	push   %ebx
 128:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 12b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 12e:	eb 31                	jmp    161 <gets+0x41>
    cc = read(0, &c, 1);
 130:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 137:	00 
 138:	89 7c 24 04          	mov    %edi,0x4(%esp)
 13c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 143:	e8 02 01 00 00       	call   24a <read>
    if(cc < 1)
 148:	85 c0                	test   %eax,%eax
 14a:	7e 1d                	jle    169 <gets+0x49>
      break;
    buf[i++] = c;
 14c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 150:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 152:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 155:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 157:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 15b:	74 0c                	je     169 <gets+0x49>
 15d:	3c 0a                	cmp    $0xa,%al
 15f:	74 08                	je     169 <gets+0x49>
  for(i=0; i+1 < max; ){
 161:	8d 5e 01             	lea    0x1(%esi),%ebx
 164:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 167:	7c c7                	jl     130 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 170:	83 c4 2c             	add    $0x2c,%esp
 173:	5b                   	pop    %ebx
 174:	5e                   	pop    %esi
 175:	5f                   	pop    %edi
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    
 178:	90                   	nop
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <stat>:

int
stat(const char *n, struct stat *st)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 192:	00 
 193:	89 04 24             	mov    %eax,(%esp)
 196:	e8 d7 00 00 00       	call   272 <open>
  if(fd < 0)
 19b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 19d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 19f:	78 27                	js     1c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a4:	89 1c 24             	mov    %ebx,(%esp)
 1a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ab:	e8 da 00 00 00       	call   28a <fstat>
  close(fd);
 1b0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1b3:	89 c6                	mov    %eax,%esi
  close(fd);
 1b5:	e8 a0 00 00 00       	call   25a <close>
  return r;
 1ba:	89 f0                	mov    %esi,%eax
}
 1bc:	83 c4 10             	add    $0x10,%esp
 1bf:	5b                   	pop    %ebx
 1c0:	5e                   	pop    %esi
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	90                   	nop
 1c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 1c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1cd:	eb ed                	jmp    1bc <stat+0x3c>
 1cf:	90                   	nop

000001d0 <atoi>:

int
atoi(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1d7:	0f be 11             	movsbl (%ecx),%edx
 1da:	8d 42 d0             	lea    -0x30(%edx),%eax
 1dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 1df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 1e4:	77 17                	ja     1fd <atoi+0x2d>
 1e6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 1e8:	83 c1 01             	add    $0x1,%ecx
 1eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 1ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 1f2:	0f be 11             	movsbl (%ecx),%edx
 1f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1f8:	80 fb 09             	cmp    $0x9,%bl
 1fb:	76 eb                	jbe    1e8 <atoi+0x18>
  return n;
}
 1fd:	5b                   	pop    %ebx
 1fe:	5d                   	pop    %ebp
 1ff:	c3                   	ret    

00000200 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 200:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 201:	31 d2                	xor    %edx,%edx
{
 203:	89 e5                	mov    %esp,%ebp
 205:	56                   	push   %esi
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	53                   	push   %ebx
 20a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 20d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 210:	85 db                	test   %ebx,%ebx
 212:	7e 12                	jle    226 <memmove+0x26>
 214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 218:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 21c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 21f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 222:	39 da                	cmp    %ebx,%edx
 224:	75 f2                	jne    218 <memmove+0x18>
  return vdst;
}
 226:	5b                   	pop    %ebx
 227:	5e                   	pop    %esi
 228:	5d                   	pop    %ebp
 229:	c3                   	ret    

0000022a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 22a:	b8 01 00 00 00       	mov    $0x1,%eax
 22f:	cd 40                	int    $0x40
 231:	c3                   	ret    

00000232 <exit>:
SYSCALL(exit)
 232:	b8 02 00 00 00       	mov    $0x2,%eax
 237:	cd 40                	int    $0x40
 239:	c3                   	ret    

0000023a <wait>:
SYSCALL(wait)
 23a:	b8 03 00 00 00       	mov    $0x3,%eax
 23f:	cd 40                	int    $0x40
 241:	c3                   	ret    

00000242 <pipe>:
SYSCALL(pipe)
 242:	b8 04 00 00 00       	mov    $0x4,%eax
 247:	cd 40                	int    $0x40
 249:	c3                   	ret    

0000024a <read>:
SYSCALL(read)
 24a:	b8 05 00 00 00       	mov    $0x5,%eax
 24f:	cd 40                	int    $0x40
 251:	c3                   	ret    

00000252 <write>:
SYSCALL(write)
 252:	b8 10 00 00 00       	mov    $0x10,%eax
 257:	cd 40                	int    $0x40
 259:	c3                   	ret    

0000025a <close>:
SYSCALL(close)
 25a:	b8 15 00 00 00       	mov    $0x15,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret    

00000262 <kill>:
SYSCALL(kill)
 262:	b8 06 00 00 00       	mov    $0x6,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <exec>:
SYSCALL(exec)
 26a:	b8 07 00 00 00       	mov    $0x7,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <open>:
SYSCALL(open)
 272:	b8 0f 00 00 00       	mov    $0xf,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <mknod>:
SYSCALL(mknod)
 27a:	b8 11 00 00 00       	mov    $0x11,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <unlink>:
SYSCALL(unlink)
 282:	b8 12 00 00 00       	mov    $0x12,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <fstat>:
SYSCALL(fstat)
 28a:	b8 08 00 00 00       	mov    $0x8,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <link>:
SYSCALL(link)
 292:	b8 13 00 00 00       	mov    $0x13,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <mkdir>:
SYSCALL(mkdir)
 29a:	b8 14 00 00 00       	mov    $0x14,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <chdir>:
SYSCALL(chdir)
 2a2:	b8 09 00 00 00       	mov    $0x9,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <dup>:
SYSCALL(dup)
 2aa:	b8 0a 00 00 00       	mov    $0xa,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <getpid>:
SYSCALL(getpid)
 2b2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <sbrk>:
SYSCALL(sbrk)
 2ba:	b8 0c 00 00 00       	mov    $0xc,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <sleep>:
SYSCALL(sleep)
 2c2:	b8 0d 00 00 00       	mov    $0xd,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <uptime>:
SYSCALL(uptime)
 2ca:	b8 0e 00 00 00       	mov    $0xe,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 2d2:	b8 16 00 00 00       	mov    $0x16,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 2da:	b8 17 00 00 00       	mov    $0x17,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 2e2:	b8 18 00 00 00       	mov    $0x18,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 2ea:	b8 19 00 00 00       	mov    $0x19,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 2f2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 2fa:	b8 1b 00 00 00       	mov    $0x1b,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <kthread_join>:
SYSCALL(kthread_join)
 302:	b8 1c 00 00 00       	mov    $0x1c,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <kthread_exit>:
SYSCALL(kthread_exit)
 30a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 312:	b8 1e 00 00 00       	mov    $0x1e,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <kthread_yield>:
SYSCALL(kthread_yield)
 31a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 322:	b8 20 00 00 00       	mov    $0x20,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 32a:	b8 21 00 00 00       	mov    $0x21,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    
 332:	66 90                	xchg   %ax,%ax
 334:	66 90                	xchg   %ax,%ax
 336:	66 90                	xchg   %ax,%ax
 338:	66 90                	xchg   %ax,%ax
 33a:	66 90                	xchg   %ax,%ax
 33c:	66 90                	xchg   %ax,%ax
 33e:	66 90                	xchg   %ax,%ax

00000340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	89 c6                	mov    %eax,%esi
 347:	53                   	push   %ebx
 348:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 34b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 34e:	85 db                	test   %ebx,%ebx
 350:	74 09                	je     35b <printint+0x1b>
 352:	89 d0                	mov    %edx,%eax
 354:	c1 e8 1f             	shr    $0x1f,%eax
 357:	84 c0                	test   %al,%al
 359:	75 75                	jne    3d0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 35b:	89 d0                	mov    %edx,%eax
  neg = 0;
 35d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 364:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 367:	31 ff                	xor    %edi,%edi
 369:	89 ce                	mov    %ecx,%esi
 36b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 36e:	eb 02                	jmp    372 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 370:	89 cf                	mov    %ecx,%edi
 372:	31 d2                	xor    %edx,%edx
 374:	f7 f6                	div    %esi
 376:	8d 4f 01             	lea    0x1(%edi),%ecx
 379:	0f b6 92 f0 09 00 00 	movzbl 0x9f0(%edx),%edx
  }while((x /= base) != 0);
 380:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 382:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 385:	75 e9                	jne    370 <printint+0x30>
  if(neg)
 387:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 38a:	89 c8                	mov    %ecx,%eax
 38c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 38f:	85 d2                	test   %edx,%edx
 391:	74 08                	je     39b <printint+0x5b>
    buf[i++] = '-';
 393:	8d 4f 02             	lea    0x2(%edi),%ecx
 396:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 39b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 39e:	66 90                	xchg   %ax,%ax
 3a0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3a5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 3a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3af:	00 
 3b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3b4:	89 34 24             	mov    %esi,(%esp)
 3b7:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ba:	e8 93 fe ff ff       	call   252 <write>
  while(--i >= 0)
 3bf:	83 ff ff             	cmp    $0xffffffff,%edi
 3c2:	75 dc                	jne    3a0 <printint+0x60>
    putc(fd, buf[i]);
}
 3c4:	83 c4 4c             	add    $0x4c,%esp
 3c7:	5b                   	pop    %ebx
 3c8:	5e                   	pop    %esi
 3c9:	5f                   	pop    %edi
 3ca:	5d                   	pop    %ebp
 3cb:	c3                   	ret    
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 3d0:	89 d0                	mov    %edx,%eax
 3d2:	f7 d8                	neg    %eax
    neg = 1;
 3d4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3db:	eb 87                	jmp    364 <printint+0x24>
 3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3e4:	31 ff                	xor    %edi,%edi
{
 3e6:	56                   	push   %esi
 3e7:	53                   	push   %ebx
 3e8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 3ee:	8d 45 10             	lea    0x10(%ebp),%eax
{
 3f1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 3f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 3f7:	0f b6 13             	movzbl (%ebx),%edx
 3fa:	83 c3 01             	add    $0x1,%ebx
 3fd:	84 d2                	test   %dl,%dl
 3ff:	75 39                	jne    43a <printf+0x5a>
 401:	e9 ca 00 00 00       	jmp    4d0 <printf+0xf0>
 406:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 408:	83 fa 25             	cmp    $0x25,%edx
 40b:	0f 84 c7 00 00 00    	je     4d8 <printf+0xf8>
  write(fd, &c, 1);
 411:	8d 45 e0             	lea    -0x20(%ebp),%eax
 414:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 41b:	00 
 41c:	89 44 24 04          	mov    %eax,0x4(%esp)
 420:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 423:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 426:	e8 27 fe ff ff       	call   252 <write>
 42b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 42e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 432:	84 d2                	test   %dl,%dl
 434:	0f 84 96 00 00 00    	je     4d0 <printf+0xf0>
    if(state == 0){
 43a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 43c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 43f:	74 c7                	je     408 <printf+0x28>
      }
    } else if(state == '%'){
 441:	83 ff 25             	cmp    $0x25,%edi
 444:	75 e5                	jne    42b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 446:	83 fa 75             	cmp    $0x75,%edx
 449:	0f 84 99 00 00 00    	je     4e8 <printf+0x108>
 44f:	83 fa 64             	cmp    $0x64,%edx
 452:	0f 84 90 00 00 00    	je     4e8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 458:	25 f7 00 00 00       	and    $0xf7,%eax
 45d:	83 f8 70             	cmp    $0x70,%eax
 460:	0f 84 aa 00 00 00    	je     510 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 466:	83 fa 73             	cmp    $0x73,%edx
 469:	0f 84 e9 00 00 00    	je     558 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 46f:	83 fa 63             	cmp    $0x63,%edx
 472:	0f 84 2b 01 00 00    	je     5a3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 478:	83 fa 25             	cmp    $0x25,%edx
 47b:	0f 84 4f 01 00 00    	je     5d0 <printf+0x1f0>
  write(fd, &c, 1);
 481:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 484:	83 c3 01             	add    $0x1,%ebx
 487:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 48f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 491:	89 44 24 04          	mov    %eax,0x4(%esp)
 495:	89 34 24             	mov    %esi,(%esp)
 498:	89 55 d0             	mov    %edx,-0x30(%ebp)
 49b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 49f:	e8 ae fd ff ff       	call   252 <write>
        putc(fd, c);
 4a4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 4a7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b1:	00 
 4b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 4b9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 4bc:	e8 91 fd ff ff       	call   252 <write>
  for(i = 0; fmt[i]; i++){
 4c1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4c5:	84 d2                	test   %dl,%dl
 4c7:	0f 85 6d ff ff ff    	jne    43a <printf+0x5a>
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 4d0:	83 c4 3c             	add    $0x3c,%esp
 4d3:	5b                   	pop    %ebx
 4d4:	5e                   	pop    %esi
 4d5:	5f                   	pop    %edi
 4d6:	5d                   	pop    %ebp
 4d7:	c3                   	ret    
        state = '%';
 4d8:	bf 25 00 00 00       	mov    $0x25,%edi
 4dd:	e9 49 ff ff ff       	jmp    42b <printf+0x4b>
 4e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 4e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4ef:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 4f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 4f7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 4f9:	8b 10                	mov    (%eax),%edx
 4fb:	89 f0                	mov    %esi,%eax
 4fd:	e8 3e fe ff ff       	call   340 <printint>
        ap++;
 502:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 506:	e9 20 ff ff ff       	jmp    42b <printf+0x4b>
 50b:	90                   	nop
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 510:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 513:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51a:	00 
 51b:	89 44 24 04          	mov    %eax,0x4(%esp)
 51f:	89 34 24             	mov    %esi,(%esp)
 522:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 526:	e8 27 fd ff ff       	call   252 <write>
 52b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 52e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 535:	00 
 536:	89 44 24 04          	mov    %eax,0x4(%esp)
 53a:	89 34 24             	mov    %esi,(%esp)
 53d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 541:	e8 0c fd ff ff       	call   252 <write>
        printint(fd, *ap, 16, 0);
 546:	b9 10 00 00 00       	mov    $0x10,%ecx
 54b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 552:	eb a0                	jmp    4f4 <printf+0x114>
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 558:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 55b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 55f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 561:	b8 e9 09 00 00       	mov    $0x9e9,%eax
 566:	85 ff                	test   %edi,%edi
 568:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 56b:	0f b6 07             	movzbl (%edi),%eax
 56e:	84 c0                	test   %al,%al
 570:	74 2a                	je     59c <printf+0x1bc>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 578:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 57b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 57e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 581:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 588:	00 
 589:	89 44 24 04          	mov    %eax,0x4(%esp)
 58d:	89 34 24             	mov    %esi,(%esp)
 590:	e8 bd fc ff ff       	call   252 <write>
        while(*s != 0){
 595:	0f b6 07             	movzbl (%edi),%eax
 598:	84 c0                	test   %al,%al
 59a:	75 dc                	jne    578 <printf+0x198>
      state = 0;
 59c:	31 ff                	xor    %edi,%edi
 59e:	e9 88 fe ff ff       	jmp    42b <printf+0x4b>
        putc(fd, *ap);
 5a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 5a6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 5a8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b1:	00 
 5b2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 5b5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5b8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bf:	e8 8e fc ff ff       	call   252 <write>
        ap++;
 5c4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5c8:	e9 5e fe ff ff       	jmp    42b <printf+0x4b>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5d0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 5d3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5d5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5dc:	00 
 5dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e1:	89 34 24             	mov    %esi,(%esp)
 5e4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 5e8:	e8 65 fc ff ff       	call   252 <write>
 5ed:	e9 39 fe ff ff       	jmp    42b <printf+0x4b>
 5f2:	66 90                	xchg   %ax,%ax
 5f4:	66 90                	xchg   %ax,%ax
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	66 90                	xchg   %ax,%ax
 5fa:	66 90                	xchg   %ax,%ax
 5fc:	66 90                	xchg   %ax,%ax
 5fe:	66 90                	xchg   %ax,%ax

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 78 0e 00 00       	mov    0xe78,%eax
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 610:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 613:	39 d0                	cmp    %edx,%eax
 615:	72 11                	jb     628 <free+0x28>
 617:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 618:	39 c8                	cmp    %ecx,%eax
 61a:	72 04                	jb     620 <free+0x20>
 61c:	39 ca                	cmp    %ecx,%edx
 61e:	72 10                	jb     630 <free+0x30>
 620:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 622:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 624:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 626:	73 f0                	jae    618 <free+0x18>
 628:	39 ca                	cmp    %ecx,%edx
 62a:	72 04                	jb     630 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62c:	39 c8                	cmp    %ecx,%eax
 62e:	72 f0                	jb     620 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 630:	8b 73 fc             	mov    -0x4(%ebx),%esi
 633:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 636:	39 cf                	cmp    %ecx,%edi
 638:	74 1e                	je     658 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 63a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 63d:	8b 48 04             	mov    0x4(%eax),%ecx
 640:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 643:	39 f2                	cmp    %esi,%edx
 645:	74 28                	je     66f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 647:	89 10                	mov    %edx,(%eax)
  freep = p;
 649:	a3 78 0e 00 00       	mov    %eax,0xe78
}
 64e:	5b                   	pop    %ebx
 64f:	5e                   	pop    %esi
 650:	5f                   	pop    %edi
 651:	5d                   	pop    %ebp
 652:	c3                   	ret    
 653:	90                   	nop
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 658:	03 71 04             	add    0x4(%ecx),%esi
 65b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 65e:	8b 08                	mov    (%eax),%ecx
 660:	8b 09                	mov    (%ecx),%ecx
 662:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 665:	8b 48 04             	mov    0x4(%eax),%ecx
 668:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 66b:	39 f2                	cmp    %esi,%edx
 66d:	75 d8                	jne    647 <free+0x47>
    p->s.size += bp->s.size;
 66f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 672:	a3 78 0e 00 00       	mov    %eax,0xe78
    p->s.size += bp->s.size;
 677:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 67a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 67d:	89 10                	mov    %edx,(%eax)
}
 67f:	5b                   	pop    %ebx
 680:	5e                   	pop    %esi
 681:	5f                   	pop    %edi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
 684:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 68a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 699:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 69c:	8b 1d 78 0e 00 00    	mov    0xe78,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a2:	8d 48 07             	lea    0x7(%eax),%ecx
 6a5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 6a8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6aa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 6ad:	0f 84 9b 00 00 00    	je     74e <malloc+0xbe>
 6b3:	8b 13                	mov    (%ebx),%edx
 6b5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6b8:	39 fe                	cmp    %edi,%esi
 6ba:	76 64                	jbe    720 <malloc+0x90>
 6bc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 6c3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6cb:	eb 0e                	jmp    6db <malloc+0x4b>
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6d2:	8b 78 04             	mov    0x4(%eax),%edi
 6d5:	39 fe                	cmp    %edi,%esi
 6d7:	76 4f                	jbe    728 <malloc+0x98>
 6d9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6db:	3b 15 78 0e 00 00    	cmp    0xe78,%edx
 6e1:	75 ed                	jne    6d0 <malloc+0x40>
  if(nu < 4096)
 6e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6ec:	bf 00 10 00 00       	mov    $0x1000,%edi
 6f1:	0f 43 fe             	cmovae %esi,%edi
 6f4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 6f7:	89 04 24             	mov    %eax,(%esp)
 6fa:	e8 bb fb ff ff       	call   2ba <sbrk>
  if(p == (char*)-1)
 6ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 702:	74 18                	je     71c <malloc+0x8c>
  hp->s.size = nu;
 704:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 707:	83 c0 08             	add    $0x8,%eax
 70a:	89 04 24             	mov    %eax,(%esp)
 70d:	e8 ee fe ff ff       	call   600 <free>
  return freep;
 712:	8b 15 78 0e 00 00    	mov    0xe78,%edx
      if((p = morecore(nunits)) == 0)
 718:	85 d2                	test   %edx,%edx
 71a:	75 b4                	jne    6d0 <malloc+0x40>
        return 0;
 71c:	31 c0                	xor    %eax,%eax
 71e:	eb 20                	jmp    740 <malloc+0xb0>
    if(p->s.size >= nunits){
 720:	89 d0                	mov    %edx,%eax
 722:	89 da                	mov    %ebx,%edx
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 728:	39 fe                	cmp    %edi,%esi
 72a:	74 1c                	je     748 <malloc+0xb8>
        p->s.size -= nunits;
 72c:	29 f7                	sub    %esi,%edi
 72e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 731:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 734:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 737:	89 15 78 0e 00 00    	mov    %edx,0xe78
      return (void*)(p + 1);
 73d:	83 c0 08             	add    $0x8,%eax
  }
}
 740:	83 c4 1c             	add    $0x1c,%esp
 743:	5b                   	pop    %ebx
 744:	5e                   	pop    %esi
 745:	5f                   	pop    %edi
 746:	5d                   	pop    %ebp
 747:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 748:	8b 08                	mov    (%eax),%ecx
 74a:	89 0a                	mov    %ecx,(%edx)
 74c:	eb e9                	jmp    737 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 74e:	c7 05 78 0e 00 00 7c 	movl   $0xe7c,0xe78
 755:	0e 00 00 
    base.s.size = 0;
 758:	ba 7c 0e 00 00       	mov    $0xe7c,%edx
    base.s.ptr = freep = prevp = &base;
 75d:	c7 05 7c 0e 00 00 7c 	movl   $0xe7c,0xe7c
 764:	0e 00 00 
    base.s.size = 0;
 767:	c7 05 80 0e 00 00 00 	movl   $0x0,0xe80
 76e:	00 00 00 
 771:	e9 46 ff ff ff       	jmp    6bc <malloc+0x2c>
 776:	66 90                	xchg   %ax,%ax
 778:	66 90                	xchg   %ax,%ax
 77a:	66 90                	xchg   %ax,%ax
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	56                   	push   %esi
 784:	53                   	push   %ebx
 785:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 788:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 78f:	e8 fc fe ff ff       	call   690 <malloc>

    if (bt == NULL) {
 794:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 796:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 798:	74 66                	je     800 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 79a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 7a1:	e8 ea fe ff ff       	call   690 <malloc>
    if (bt->bt_stack == NULL) {
 7a6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 7a8:	89 c3                	mov    %eax,%ebx
 7aa:	89 46 08             	mov    %eax,0x8(%esi)
 7ad:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 7b0:	74 5d                	je     80f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 7b2:	25 ff 0f 00 00       	and    $0xfff,%eax
 7b7:	75 37                	jne    7f0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 7b9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 7bf:	8b 45 10             	mov    0x10(%ebp),%eax
 7c2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 7c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 7cd:	89 04 24             	mov    %eax,(%esp)
 7d0:	e8 25 fb ff ff       	call   2fa <kthread_create>
    if (bt->bid != 0) {
 7d5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 7d7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 7d9:	74 2d                	je     808 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 7db:	8b 45 08             	mov    0x8(%ebp),%eax
 7de:	89 30                	mov    %esi,(%eax)
        result = 0;
 7e0:	31 c0                	xor    %eax,%eax
}
 7e2:	83 c4 10             	add    $0x10,%esp
 7e5:	5b                   	pop    %ebx
 7e6:	5e                   	pop    %esi
 7e7:	5d                   	pop    %ebp
 7e8:	c3                   	ret    
 7e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 7f0:	29 c3                	sub    %eax,%ebx
 7f2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 7f8:	89 5e 04             	mov    %ebx,0x4(%esi)
 7fb:	eb bc                	jmp    7b9 <benny_thread_create+0x39>
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
 800:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 806:	eb b7                	jmp    7bf <benny_thread_create+0x3f>
    int result = -1;
 808:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80d:	eb d3                	jmp    7e2 <benny_thread_create+0x62>
        free(bt);
 80f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 812:	31 f6                	xor    %esi,%esi
        free(bt);
 814:	e8 e7 fd ff ff       	call   600 <free>
 819:	8b 5b 04             	mov    0x4(%ebx),%ebx
 81c:	eb a1                	jmp    7bf <benny_thread_create+0x3f>
 81e:	66 90                	xchg   %ax,%ax

00000820 <benny_thread_bid>:
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 823:	8b 45 08             	mov    0x8(%ebp),%eax
}
 826:	5d                   	pop    %ebp
    return bt->bid;
 827:	8b 00                	mov    (%eax),%eax
}
 829:	c3                   	ret    
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000830 <benny_thread_join>:
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	53                   	push   %ebx
 834:	83 ec 14             	sub    $0x14,%esp
 837:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 83a:	8b 03                	mov    (%ebx),%eax
 83c:	89 04 24             	mov    %eax,(%esp)
 83f:	e8 be fa ff ff       	call   302 <kthread_join>
    if (retVal == 0) {
 844:	85 c0                	test   %eax,%eax
 846:	75 27                	jne    86f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 848:	8b 53 08             	mov    0x8(%ebx),%edx
 84b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 84e:	89 14 24             	mov    %edx,(%esp)
 851:	e8 aa fd ff ff       	call   600 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 856:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 85d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 864:	89 1c 24             	mov    %ebx,(%esp)
 867:	e8 94 fd ff ff       	call   600 <free>
 86c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 86f:	83 c4 14             	add    $0x14,%esp
 872:	5b                   	pop    %ebx
 873:	5d                   	pop    %ebp
 874:	c3                   	ret    
 875:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000880 <benny_thread_exit>:
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
}
 883:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 884:	e9 81 fa ff ff       	jmp    30a <kthread_exit>
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000890 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 896:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 89c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 8a3:	31 c0                	xor    %eax,%eax
 8a5:	5d                   	pop    %ebp
 8a6:	c3                   	ret    
 8a7:	89 f6                	mov    %esi,%esi
 8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008b0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 8b0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8b1:	b8 01 00 00 00       	mov    $0x1,%eax
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	56                   	push   %esi
 8b9:	53                   	push   %ebx
 8ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8bd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 8c0:	85 c0                	test   %eax,%eax
 8c2:	be 01 00 00 00       	mov    $0x1,%esi
 8c7:	74 15                	je     8de <benny_mootex_yieldlock+0x2e>
 8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 8d0:	e8 45 fa ff ff       	call   31a <kthread_yield>
 8d5:	89 f0                	mov    %esi,%eax
 8d7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 8da:	85 c0                	test   %eax,%eax
 8dc:	75 f2                	jne    8d0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 8de:	e8 2f fa ff ff       	call   312 <kthread_self>
    benny_mootex->bid = benny_self();
 8e3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 8e6:	31 c0                	xor    %eax,%eax
 8e8:	5b                   	pop    %ebx
 8e9:	5e                   	pop    %esi
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret    
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008f0 <benny_mootex_spinlock>:
{
 8f0:	55                   	push   %ebp
 8f1:	ba 01 00 00 00       	mov    $0x1,%edx
 8f6:	89 e5                	mov    %esp,%ebp
 8f8:	53                   	push   %ebx
 8f9:	83 ec 04             	sub    $0x4,%esp
 8fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8ff:	90                   	nop
 900:	89 d0                	mov    %edx,%eax
 902:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 905:	85 c0                	test   %eax,%eax
 907:	75 f7                	jne    900 <benny_mootex_spinlock+0x10>
    return kthread_self();
 909:	e8 04 fa ff ff       	call   312 <kthread_self>
    benny_mootex->bid = benny_self();
 90e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 911:	83 c4 04             	add    $0x4,%esp
 914:	31 c0                	xor    %eax,%eax
 916:	5b                   	pop    %ebx
 917:	5d                   	pop    %ebp
 918:	c3                   	ret    
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000920 <benny_mootex_unlock>:
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	53                   	push   %ebx
 924:	83 ec 04             	sub    $0x4,%esp
 927:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 92a:	e8 e3 f9 ff ff       	call   312 <kthread_self>
    if(tid == benny_mootex->bid){
 92f:	39 43 04             	cmp    %eax,0x4(%ebx)
 932:	75 1c                	jne    950 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 934:	0f ae f0             	mfence 
    return 0;
 937:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 939:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 940:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 946:	83 c4 04             	add    $0x4,%esp
 949:	5b                   	pop    %ebx
 94a:	5d                   	pop    %ebp
 94b:	c3                   	ret    
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 950:	83 c4 04             	add    $0x4,%esp
      return -1;
 953:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 958:	5b                   	pop    %ebx
 959:	5d                   	pop    %ebp
 95a:	c3                   	ret    
 95b:	90                   	nop
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000960 <benny_mootex_trylock>:
{
 960:	55                   	push   %ebp
 961:	b8 01 00 00 00       	mov    $0x1,%eax
 966:	89 e5                	mov    %esp,%ebp
 968:	53                   	push   %ebx
 969:	83 ec 04             	sub    $0x4,%esp
 96c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 96f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 972:	85 c0                	test   %eax,%eax
 974:	75 08                	jne    97e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 976:	e8 97 f9 ff ff       	call   312 <kthread_self>
        benny_mootex->bid = tid;
 97b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 97e:	83 c4 04             	add    $0x4,%esp
 981:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 986:	5b                   	pop    %ebx
 987:	5d                   	pop    %ebp
 988:	c3                   	ret    
 989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000990 <benny_mootex_wholock>:
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 993:	8b 45 08             	mov    0x8(%ebp),%eax
}
 996:	5d                   	pop    %ebp
    return benny_mootex->bid;
 997:	8b 40 04             	mov    0x4(%eax),%eax
}
 99a:	c3                   	ret    
 99b:	90                   	nop
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009a0 <benny_mootex_islocked>:
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 9a3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9a6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 9a7:	8b 00                	mov    (%eax),%eax
}
 9a9:	c3                   	ret    
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009b0 <benny_self>:
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
}
 9b3:	5d                   	pop    %ebp
    return kthread_self();
 9b4:	e9 59 f9 ff ff       	jmp    312 <kthread_self>
 9b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009c0 <benny_yield>:
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
    
}
 9c3:	5d                   	pop    %ebp
    return kthread_yield();
 9c4:	e9 51 f9 ff ff       	jmp    31a <kthread_yield>
 9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009d0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 9d3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 9d4:	e9 49 f9 ff ff       	jmp    322 <kthread_cpu_count>
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009e0 <benny_thread_count>:

int
benny_thread_count(void)
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 9e3:	5d                   	pop    %ebp
    return kthread_thread_count();
 9e4:	e9 41 f9 ff ff       	jmp    32a <kthread_thread_count>
