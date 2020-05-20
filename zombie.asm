
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 3c 02 00 00       	call   24a <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 c4 02 00 00       	call   2e2 <sleep>
  exit();
  1e:	e8 2f 02 00 00       	call   252 <exit>
  23:	66 90                	xchg   %ax,%ax
  25:	66 90                	xchg   %ax,%ax
  27:	66 90                	xchg   %ax,%ax
  29:	66 90                	xchg   %ax,%ax
  2b:	66 90                	xchg   %ax,%ax
  2d:	66 90                	xchg   %ax,%ax
  2f:	90                   	nop

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	8b 45 08             	mov    0x8(%ebp),%eax
  36:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  39:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  3a:	89 c2                	mov    %eax,%edx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  40:	83 c1 01             	add    $0x1,%ecx
  43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 db                	test   %bl,%bl
  4c:	88 5a ff             	mov    %bl,-0x1(%edx)
  4f:	75 ef                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  51:	5b                   	pop    %ebx
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
  54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	8b 55 08             	mov    0x8(%ebp),%edx
  66:	53                   	push   %ebx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	74 2d                	je     9e <strcmp+0x3e>
  71:	0f b6 19             	movzbl (%ecx),%ebx
  74:	38 d8                	cmp    %bl,%al
  76:	74 0e                	je     86 <strcmp+0x26>
  78:	eb 2b                	jmp    a5 <strcmp+0x45>
  7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  80:	38 c8                	cmp    %cl,%al
  82:	75 15                	jne    99 <strcmp+0x39>
    p++, q++;
  84:	89 d9                	mov    %ebx,%ecx
  86:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  89:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  8c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  8f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  93:	84 c0                	test   %al,%al
  95:	75 e9                	jne    80 <strcmp+0x20>
  97:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  99:	29 c8                	sub    %ecx,%eax
}
  9b:	5b                   	pop    %ebx
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    
  9e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
  a1:	31 c0                	xor    %eax,%eax
  a3:	eb f4                	jmp    99 <strcmp+0x39>
  a5:	0f b6 cb             	movzbl %bl,%ecx
  a8:	eb ef                	jmp    99 <strcmp+0x39>
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  b6:	80 39 00             	cmpb   $0x0,(%ecx)
  b9:	74 12                	je     cd <strlen+0x1d>
  bb:	31 d2                	xor    %edx,%edx
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	83 c2 01             	add    $0x1,%edx
  c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  c7:	89 d0                	mov    %edx,%eax
  c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
  for(n = 0; s[n]; n++)
  cd:	31 c0                	xor    %eax,%eax
}
  cf:	5d                   	pop    %ebp
  d0:	c3                   	ret    
  d1:	eb 0d                	jmp    e0 <memset>
  d3:	90                   	nop
  d4:	90                   	nop
  d5:	90                   	nop
  d6:	90                   	nop
  d7:	90                   	nop
  d8:	90                   	nop
  d9:	90                   	nop
  da:	90                   	nop
  db:	90                   	nop
  dc:	90                   	nop
  dd:	90                   	nop
  de:	90                   	nop
  df:	90                   	nop

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f2:	89 d0                	mov    %edx,%eax
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	53                   	push   %ebx
 107:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 10a:	0f b6 18             	movzbl (%eax),%ebx
 10d:	84 db                	test   %bl,%bl
 10f:	74 1d                	je     12e <strchr+0x2e>
    if(*s == c)
 111:	38 d3                	cmp    %dl,%bl
 113:	89 d1                	mov    %edx,%ecx
 115:	75 0d                	jne    124 <strchr+0x24>
 117:	eb 17                	jmp    130 <strchr+0x30>
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 120:	38 ca                	cmp    %cl,%dl
 122:	74 0c                	je     130 <strchr+0x30>
  for(; *s; s++)
 124:	83 c0 01             	add    $0x1,%eax
 127:	0f b6 10             	movzbl (%eax),%edx
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strchr+0x20>
      return (char*)s;
  return 0;
 12e:	31 c0                	xor    %eax,%eax
}
 130:	5b                   	pop    %ebx
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    
 133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 145:	31 f6                	xor    %esi,%esi
{
 147:	53                   	push   %ebx
 148:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 14b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 14e:	eb 31                	jmp    181 <gets+0x41>
    cc = read(0, &c, 1);
 150:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 157:	00 
 158:	89 7c 24 04          	mov    %edi,0x4(%esp)
 15c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 163:	e8 02 01 00 00       	call   26a <read>
    if(cc < 1)
 168:	85 c0                	test   %eax,%eax
 16a:	7e 1d                	jle    189 <gets+0x49>
      break;
    buf[i++] = c;
 16c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 170:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 172:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 175:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 177:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 17b:	74 0c                	je     189 <gets+0x49>
 17d:	3c 0a                	cmp    $0xa,%al
 17f:	74 08                	je     189 <gets+0x49>
  for(i=0; i+1 < max; ){
 181:	8d 5e 01             	lea    0x1(%esi),%ebx
 184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 187:	7c c7                	jl     150 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 189:	8b 45 08             	mov    0x8(%ebp),%eax
 18c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 190:	83 c4 2c             	add    $0x2c,%esp
 193:	5b                   	pop    %ebx
 194:	5e                   	pop    %esi
 195:	5f                   	pop    %edi
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    
 198:	90                   	nop
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a8:	8b 45 08             	mov    0x8(%ebp),%eax
 1ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b2:	00 
 1b3:	89 04 24             	mov    %eax,(%esp)
 1b6:	e8 d7 00 00 00       	call   292 <open>
  if(fd < 0)
 1bb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 1bd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1bf:	78 27                	js     1e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 1c 24             	mov    %ebx,(%esp)
 1c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1cb:	e8 da 00 00 00       	call   2aa <fstat>
  close(fd);
 1d0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1d3:	89 c6                	mov    %eax,%esi
  close(fd);
 1d5:	e8 a0 00 00 00       	call   27a <close>
  return r;
 1da:	89 f0                	mov    %esi,%eax
}
 1dc:	83 c4 10             	add    $0x10,%esp
 1df:	5b                   	pop    %ebx
 1e0:	5e                   	pop    %esi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	90                   	nop
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 1e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1ed:	eb ed                	jmp    1dc <stat+0x3c>
 1ef:	90                   	nop

000001f0 <atoi>:

int
atoi(const char *s)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1f7:	0f be 11             	movsbl (%ecx),%edx
 1fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 1fd:	3c 09                	cmp    $0x9,%al
  n = 0;
 1ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 204:	77 17                	ja     21d <atoi+0x2d>
 206:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 208:	83 c1 01             	add    $0x1,%ecx
 20b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 20e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 212:	0f be 11             	movsbl (%ecx),%edx
 215:	8d 5a d0             	lea    -0x30(%edx),%ebx
 218:	80 fb 09             	cmp    $0x9,%bl
 21b:	76 eb                	jbe    208 <atoi+0x18>
  return n;
}
 21d:	5b                   	pop    %ebx
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    

00000220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 220:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 221:	31 d2                	xor    %edx,%edx
{
 223:	89 e5                	mov    %esp,%ebp
 225:	56                   	push   %esi
 226:	8b 45 08             	mov    0x8(%ebp),%eax
 229:	53                   	push   %ebx
 22a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 22d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 230:	85 db                	test   %ebx,%ebx
 232:	7e 12                	jle    246 <memmove+0x26>
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 23c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 23f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 242:	39 da                	cmp    %ebx,%edx
 244:	75 f2                	jne    238 <memmove+0x18>
  return vdst;
}
 246:	5b                   	pop    %ebx
 247:	5e                   	pop    %esi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24a:	b8 01 00 00 00       	mov    $0x1,%eax
 24f:	cd 40                	int    $0x40
 251:	c3                   	ret    

00000252 <exit>:
SYSCALL(exit)
 252:	b8 02 00 00 00       	mov    $0x2,%eax
 257:	cd 40                	int    $0x40
 259:	c3                   	ret    

0000025a <wait>:
SYSCALL(wait)
 25a:	b8 03 00 00 00       	mov    $0x3,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret    

00000262 <pipe>:
SYSCALL(pipe)
 262:	b8 04 00 00 00       	mov    $0x4,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <read>:
SYSCALL(read)
 26a:	b8 05 00 00 00       	mov    $0x5,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <write>:
SYSCALL(write)
 272:	b8 10 00 00 00       	mov    $0x10,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <close>:
SYSCALL(close)
 27a:	b8 15 00 00 00       	mov    $0x15,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <kill>:
SYSCALL(kill)
 282:	b8 06 00 00 00       	mov    $0x6,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <exec>:
SYSCALL(exec)
 28a:	b8 07 00 00 00       	mov    $0x7,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <open>:
SYSCALL(open)
 292:	b8 0f 00 00 00       	mov    $0xf,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <mknod>:
SYSCALL(mknod)
 29a:	b8 11 00 00 00       	mov    $0x11,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <unlink>:
SYSCALL(unlink)
 2a2:	b8 12 00 00 00       	mov    $0x12,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <fstat>:
SYSCALL(fstat)
 2aa:	b8 08 00 00 00       	mov    $0x8,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <link>:
SYSCALL(link)
 2b2:	b8 13 00 00 00       	mov    $0x13,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <mkdir>:
SYSCALL(mkdir)
 2ba:	b8 14 00 00 00       	mov    $0x14,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <chdir>:
SYSCALL(chdir)
 2c2:	b8 09 00 00 00       	mov    $0x9,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <dup>:
SYSCALL(dup)
 2ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <getpid>:
SYSCALL(getpid)
 2d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <sbrk>:
SYSCALL(sbrk)
 2da:	b8 0c 00 00 00       	mov    $0xc,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <sleep>:
SYSCALL(sleep)
 2e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <uptime>:
SYSCALL(uptime)
 2ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 2f2:	b8 16 00 00 00       	mov    $0x16,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 2fa:	b8 17 00 00 00       	mov    $0x17,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 302:	b8 18 00 00 00       	mov    $0x18,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 30a:	b8 19 00 00 00       	mov    $0x19,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 312:	b8 1a 00 00 00       	mov    $0x1a,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 31a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <kthread_join>:
SYSCALL(kthread_join)
 322:	b8 1c 00 00 00       	mov    $0x1c,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <kthread_exit>:
SYSCALL(kthread_exit)
 32a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 332:	b8 1e 00 00 00       	mov    $0x1e,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <kthread_yield>:
SYSCALL(kthread_yield)
 33a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 342:	b8 20 00 00 00       	mov    $0x20,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 34a:	b8 21 00 00 00       	mov    $0x21,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    
 352:	66 90                	xchg   %ax,%ax
 354:	66 90                	xchg   %ax,%ax
 356:	66 90                	xchg   %ax,%ax
 358:	66 90                	xchg   %ax,%ax
 35a:	66 90                	xchg   %ax,%ax
 35c:	66 90                	xchg   %ax,%ax
 35e:	66 90                	xchg   %ax,%ax

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	89 c6                	mov    %eax,%esi
 367:	53                   	push   %ebx
 368:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 36e:	85 db                	test   %ebx,%ebx
 370:	74 09                	je     37b <printint+0x1b>
 372:	89 d0                	mov    %edx,%eax
 374:	c1 e8 1f             	shr    $0x1f,%eax
 377:	84 c0                	test   %al,%al
 379:	75 75                	jne    3f0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 37b:	89 d0                	mov    %edx,%eax
  neg = 0;
 37d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 384:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 387:	31 ff                	xor    %edi,%edi
 389:	89 ce                	mov    %ecx,%esi
 38b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 38e:	eb 02                	jmp    392 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 390:	89 cf                	mov    %ecx,%edi
 392:	31 d2                	xor    %edx,%edx
 394:	f7 f6                	div    %esi
 396:	8d 4f 01             	lea    0x1(%edi),%ecx
 399:	0f b6 92 10 0a 00 00 	movzbl 0xa10(%edx),%edx
  }while((x /= base) != 0);
 3a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3a2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3a5:	75 e9                	jne    390 <printint+0x30>
  if(neg)
 3a7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 3aa:	89 c8                	mov    %ecx,%eax
 3ac:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 3af:	85 d2                	test   %edx,%edx
 3b1:	74 08                	je     3bb <printint+0x5b>
    buf[i++] = '-';
 3b3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3b6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 3bb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3be:	66 90                	xchg   %ax,%ax
 3c0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3c5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 3c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3cf:	00 
 3d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3d4:	89 34 24             	mov    %esi,(%esp)
 3d7:	88 45 d7             	mov    %al,-0x29(%ebp)
 3da:	e8 93 fe ff ff       	call   272 <write>
  while(--i >= 0)
 3df:	83 ff ff             	cmp    $0xffffffff,%edi
 3e2:	75 dc                	jne    3c0 <printint+0x60>
    putc(fd, buf[i]);
}
 3e4:	83 c4 4c             	add    $0x4c,%esp
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5f                   	pop    %edi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 3f0:	89 d0                	mov    %edx,%eax
 3f2:	f7 d8                	neg    %eax
    neg = 1;
 3f4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3fb:	eb 87                	jmp    384 <printint+0x24>
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 404:	31 ff                	xor    %edi,%edi
{
 406:	56                   	push   %esi
 407:	53                   	push   %ebx
 408:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 40b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 40e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 411:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 414:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 417:	0f b6 13             	movzbl (%ebx),%edx
 41a:	83 c3 01             	add    $0x1,%ebx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 39                	jne    45a <printf+0x5a>
 421:	e9 ca 00 00 00       	jmp    4f0 <printf+0xf0>
 426:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 428:	83 fa 25             	cmp    $0x25,%edx
 42b:	0f 84 c7 00 00 00    	je     4f8 <printf+0xf8>
  write(fd, &c, 1);
 431:	8d 45 e0             	lea    -0x20(%ebp),%eax
 434:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 43b:	00 
 43c:	89 44 24 04          	mov    %eax,0x4(%esp)
 440:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 443:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 446:	e8 27 fe ff ff       	call   272 <write>
 44b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 44e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 452:	84 d2                	test   %dl,%dl
 454:	0f 84 96 00 00 00    	je     4f0 <printf+0xf0>
    if(state == 0){
 45a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 45c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 45f:	74 c7                	je     428 <printf+0x28>
      }
    } else if(state == '%'){
 461:	83 ff 25             	cmp    $0x25,%edi
 464:	75 e5                	jne    44b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 466:	83 fa 75             	cmp    $0x75,%edx
 469:	0f 84 99 00 00 00    	je     508 <printf+0x108>
 46f:	83 fa 64             	cmp    $0x64,%edx
 472:	0f 84 90 00 00 00    	je     508 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 478:	25 f7 00 00 00       	and    $0xf7,%eax
 47d:	83 f8 70             	cmp    $0x70,%eax
 480:	0f 84 aa 00 00 00    	je     530 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 486:	83 fa 73             	cmp    $0x73,%edx
 489:	0f 84 e9 00 00 00    	je     578 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 48f:	83 fa 63             	cmp    $0x63,%edx
 492:	0f 84 2b 01 00 00    	je     5c3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 498:	83 fa 25             	cmp    $0x25,%edx
 49b:	0f 84 4f 01 00 00    	je     5f0 <printf+0x1f0>
  write(fd, &c, 1);
 4a1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4a4:	83 c3 01             	add    $0x1,%ebx
 4a7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ae:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4af:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b5:	89 34 24             	mov    %esi,(%esp)
 4b8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4bb:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4bf:	e8 ae fd ff ff       	call   272 <write>
        putc(fd, c);
 4c4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 4c7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4ca:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4d1:	00 
 4d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 4d9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 4dc:	e8 91 fd ff ff       	call   272 <write>
  for(i = 0; fmt[i]; i++){
 4e1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4e5:	84 d2                	test   %dl,%dl
 4e7:	0f 85 6d ff ff ff    	jne    45a <printf+0x5a>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 4f0:	83 c4 3c             	add    $0x3c,%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5f                   	pop    %edi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
        state = '%';
 4f8:	bf 25 00 00 00       	mov    $0x25,%edi
 4fd:	e9 49 ff ff ff       	jmp    44b <printf+0x4b>
 502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 508:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 50f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 514:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 517:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 519:	8b 10                	mov    (%eax),%edx
 51b:	89 f0                	mov    %esi,%eax
 51d:	e8 3e fe ff ff       	call   360 <printint>
        ap++;
 522:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 526:	e9 20 ff ff ff       	jmp    44b <printf+0x4b>
 52b:	90                   	nop
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 530:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 533:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 53a:	00 
 53b:	89 44 24 04          	mov    %eax,0x4(%esp)
 53f:	89 34 24             	mov    %esi,(%esp)
 542:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 546:	e8 27 fd ff ff       	call   272 <write>
 54b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 54e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 555:	00 
 556:	89 44 24 04          	mov    %eax,0x4(%esp)
 55a:	89 34 24             	mov    %esi,(%esp)
 55d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 561:	e8 0c fd ff ff       	call   272 <write>
        printint(fd, *ap, 16, 0);
 566:	b9 10 00 00 00       	mov    $0x10,%ecx
 56b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 572:	eb a0                	jmp    514 <printf+0x114>
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 578:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 57b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 57f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 581:	b8 09 0a 00 00       	mov    $0xa09,%eax
 586:	85 ff                	test   %edi,%edi
 588:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 58b:	0f b6 07             	movzbl (%edi),%eax
 58e:	84 c0                	test   %al,%al
 590:	74 2a                	je     5bc <printf+0x1bc>
 592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 598:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 59b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 59e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 5a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a8:	00 
 5a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ad:	89 34 24             	mov    %esi,(%esp)
 5b0:	e8 bd fc ff ff       	call   272 <write>
        while(*s != 0){
 5b5:	0f b6 07             	movzbl (%edi),%eax
 5b8:	84 c0                	test   %al,%al
 5ba:	75 dc                	jne    598 <printf+0x198>
      state = 0;
 5bc:	31 ff                	xor    %edi,%edi
 5be:	e9 88 fe ff ff       	jmp    44b <printf+0x4b>
        putc(fd, *ap);
 5c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 5c6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 5c8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5ca:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d1:	00 
 5d2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 5d5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5d8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5db:	89 44 24 04          	mov    %eax,0x4(%esp)
 5df:	e8 8e fc ff ff       	call   272 <write>
        ap++;
 5e4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5e8:	e9 5e fe ff ff       	jmp    44b <printf+0x4b>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5f0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 5f3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5f5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5fc:	00 
 5fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 601:	89 34 24             	mov    %esi,(%esp)
 604:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 608:	e8 65 fc ff ff       	call   272 <write>
 60d:	e9 39 fe ff ff       	jmp    44b <printf+0x4b>
 612:	66 90                	xchg   %ax,%ax
 614:	66 90                	xchg   %ax,%ax
 616:	66 90                	xchg   %ax,%ax
 618:	66 90                	xchg   %ax,%ax
 61a:	66 90                	xchg   %ax,%ax
 61c:	66 90                	xchg   %ax,%ax
 61e:	66 90                	xchg   %ax,%ax

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 98 0e 00 00       	mov    0xe98,%eax
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 630:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 633:	39 d0                	cmp    %edx,%eax
 635:	72 11                	jb     648 <free+0x28>
 637:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 638:	39 c8                	cmp    %ecx,%eax
 63a:	72 04                	jb     640 <free+0x20>
 63c:	39 ca                	cmp    %ecx,%edx
 63e:	72 10                	jb     650 <free+0x30>
 640:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 642:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 646:	73 f0                	jae    638 <free+0x18>
 648:	39 ca                	cmp    %ecx,%edx
 64a:	72 04                	jb     650 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64c:	39 c8                	cmp    %ecx,%eax
 64e:	72 f0                	jb     640 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 650:	8b 73 fc             	mov    -0x4(%ebx),%esi
 653:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 656:	39 cf                	cmp    %ecx,%edi
 658:	74 1e                	je     678 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 65a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65d:	8b 48 04             	mov    0x4(%eax),%ecx
 660:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 663:	39 f2                	cmp    %esi,%edx
 665:	74 28                	je     68f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 667:	89 10                	mov    %edx,(%eax)
  freep = p;
 669:	a3 98 0e 00 00       	mov    %eax,0xe98
}
 66e:	5b                   	pop    %ebx
 66f:	5e                   	pop    %esi
 670:	5f                   	pop    %edi
 671:	5d                   	pop    %ebp
 672:	c3                   	ret    
 673:	90                   	nop
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 678:	03 71 04             	add    0x4(%ecx),%esi
 67b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 67e:	8b 08                	mov    (%eax),%ecx
 680:	8b 09                	mov    (%ecx),%ecx
 682:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 685:	8b 48 04             	mov    0x4(%eax),%ecx
 688:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 68b:	39 f2                	cmp    %esi,%edx
 68d:	75 d8                	jne    667 <free+0x47>
    p->s.size += bp->s.size;
 68f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 692:	a3 98 0e 00 00       	mov    %eax,0xe98
    p->s.size += bp->s.size;
 697:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 69a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 69d:	89 10                	mov    %edx,(%eax)
}
 69f:	5b                   	pop    %ebx
 6a0:	5e                   	pop    %esi
 6a1:	5f                   	pop    %edi
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    
 6a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6bc:	8b 1d 98 0e 00 00    	mov    0xe98,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c2:	8d 48 07             	lea    0x7(%eax),%ecx
 6c5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 6c8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ca:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 6cd:	0f 84 9b 00 00 00    	je     76e <malloc+0xbe>
 6d3:	8b 13                	mov    (%ebx),%edx
 6d5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6d8:	39 fe                	cmp    %edi,%esi
 6da:	76 64                	jbe    740 <malloc+0x90>
 6dc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 6e3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6eb:	eb 0e                	jmp    6fb <malloc+0x4b>
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6f2:	8b 78 04             	mov    0x4(%eax),%edi
 6f5:	39 fe                	cmp    %edi,%esi
 6f7:	76 4f                	jbe    748 <malloc+0x98>
 6f9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6fb:	3b 15 98 0e 00 00    	cmp    0xe98,%edx
 701:	75 ed                	jne    6f0 <malloc+0x40>
  if(nu < 4096)
 703:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 706:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 70c:	bf 00 10 00 00       	mov    $0x1000,%edi
 711:	0f 43 fe             	cmovae %esi,%edi
 714:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 717:	89 04 24             	mov    %eax,(%esp)
 71a:	e8 bb fb ff ff       	call   2da <sbrk>
  if(p == (char*)-1)
 71f:	83 f8 ff             	cmp    $0xffffffff,%eax
 722:	74 18                	je     73c <malloc+0x8c>
  hp->s.size = nu;
 724:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 727:	83 c0 08             	add    $0x8,%eax
 72a:	89 04 24             	mov    %eax,(%esp)
 72d:	e8 ee fe ff ff       	call   620 <free>
  return freep;
 732:	8b 15 98 0e 00 00    	mov    0xe98,%edx
      if((p = morecore(nunits)) == 0)
 738:	85 d2                	test   %edx,%edx
 73a:	75 b4                	jne    6f0 <malloc+0x40>
        return 0;
 73c:	31 c0                	xor    %eax,%eax
 73e:	eb 20                	jmp    760 <malloc+0xb0>
    if(p->s.size >= nunits){
 740:	89 d0                	mov    %edx,%eax
 742:	89 da                	mov    %ebx,%edx
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 748:	39 fe                	cmp    %edi,%esi
 74a:	74 1c                	je     768 <malloc+0xb8>
        p->s.size -= nunits;
 74c:	29 f7                	sub    %esi,%edi
 74e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 751:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 754:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 757:	89 15 98 0e 00 00    	mov    %edx,0xe98
      return (void*)(p + 1);
 75d:	83 c0 08             	add    $0x8,%eax
  }
}
 760:	83 c4 1c             	add    $0x1c,%esp
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 768:	8b 08                	mov    (%eax),%ecx
 76a:	89 0a                	mov    %ecx,(%edx)
 76c:	eb e9                	jmp    757 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 76e:	c7 05 98 0e 00 00 9c 	movl   $0xe9c,0xe98
 775:	0e 00 00 
    base.s.size = 0;
 778:	ba 9c 0e 00 00       	mov    $0xe9c,%edx
    base.s.ptr = freep = prevp = &base;
 77d:	c7 05 9c 0e 00 00 9c 	movl   $0xe9c,0xe9c
 784:	0e 00 00 
    base.s.size = 0;
 787:	c7 05 a0 0e 00 00 00 	movl   $0x0,0xea0
 78e:	00 00 00 
 791:	e9 46 ff ff ff       	jmp    6dc <malloc+0x2c>
 796:	66 90                	xchg   %ax,%ax
 798:	66 90                	xchg   %ax,%ax
 79a:	66 90                	xchg   %ax,%ax
 79c:	66 90                	xchg   %ax,%ax
 79e:	66 90                	xchg   %ax,%ax

000007a0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	56                   	push   %esi
 7a4:	53                   	push   %ebx
 7a5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 7a8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 7af:	e8 fc fe ff ff       	call   6b0 <malloc>

    if (bt == NULL) {
 7b4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 7b6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 7b8:	74 66                	je     820 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 7ba:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 7c1:	e8 ea fe ff ff       	call   6b0 <malloc>
    if (bt->bt_stack == NULL) {
 7c6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 7c8:	89 c3                	mov    %eax,%ebx
 7ca:	89 46 08             	mov    %eax,0x8(%esi)
 7cd:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 7d0:	74 5d                	je     82f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 7d2:	25 ff 0f 00 00       	and    $0xfff,%eax
 7d7:	75 37                	jne    810 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 7d9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 7df:	8b 45 10             	mov    0x10(%ebp),%eax
 7e2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 7e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ed:	89 04 24             	mov    %eax,(%esp)
 7f0:	e8 25 fb ff ff       	call   31a <kthread_create>
    if (bt->bid != 0) {
 7f5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 7f7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 7f9:	74 2d                	je     828 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 7fb:	8b 45 08             	mov    0x8(%ebp),%eax
 7fe:	89 30                	mov    %esi,(%eax)
        result = 0;
 800:	31 c0                	xor    %eax,%eax
}
 802:	83 c4 10             	add    $0x10,%esp
 805:	5b                   	pop    %ebx
 806:	5e                   	pop    %esi
 807:	5d                   	pop    %ebp
 808:	c3                   	ret    
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 810:	29 c3                	sub    %eax,%ebx
 812:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 818:	89 5e 04             	mov    %ebx,0x4(%esi)
 81b:	eb bc                	jmp    7d9 <benny_thread_create+0x39>
 81d:	8d 76 00             	lea    0x0(%esi),%esi
 820:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 826:	eb b7                	jmp    7df <benny_thread_create+0x3f>
    int result = -1;
 828:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 82d:	eb d3                	jmp    802 <benny_thread_create+0x62>
        free(bt);
 82f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 832:	31 f6                	xor    %esi,%esi
        free(bt);
 834:	e8 e7 fd ff ff       	call   620 <free>
 839:	8b 5b 04             	mov    0x4(%ebx),%ebx
 83c:	eb a1                	jmp    7df <benny_thread_create+0x3f>
 83e:	66 90                	xchg   %ax,%ax

00000840 <benny_thread_bid>:
{
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 843:	8b 45 08             	mov    0x8(%ebp),%eax
}
 846:	5d                   	pop    %ebp
    return bt->bid;
 847:	8b 00                	mov    (%eax),%eax
}
 849:	c3                   	ret    
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000850 <benny_thread_join>:
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	53                   	push   %ebx
 854:	83 ec 14             	sub    $0x14,%esp
 857:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 85a:	8b 03                	mov    (%ebx),%eax
 85c:	89 04 24             	mov    %eax,(%esp)
 85f:	e8 be fa ff ff       	call   322 <kthread_join>
    if (retVal == 0) {
 864:	85 c0                	test   %eax,%eax
 866:	75 27                	jne    88f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 868:	8b 53 08             	mov    0x8(%ebx),%edx
 86b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 86e:	89 14 24             	mov    %edx,(%esp)
 871:	e8 aa fd ff ff       	call   620 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 876:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 87d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 884:	89 1c 24             	mov    %ebx,(%esp)
 887:	e8 94 fd ff ff       	call   620 <free>
 88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 88f:	83 c4 14             	add    $0x14,%esp
 892:	5b                   	pop    %ebx
 893:	5d                   	pop    %ebp
 894:	c3                   	ret    
 895:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008a0 <benny_thread_exit>:
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
}
 8a3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 8a4:	e9 81 fa ff ff       	jmp    32a <kthread_exit>
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008b0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 8b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 8bc:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 8c3:	31 c0                	xor    %eax,%eax
 8c5:	5d                   	pop    %ebp
 8c6:	c3                   	ret    
 8c7:	89 f6                	mov    %esi,%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008d0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 8d0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8d1:	b8 01 00 00 00       	mov    $0x1,%eax
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	56                   	push   %esi
 8d9:	53                   	push   %ebx
 8da:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8dd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 8e0:	85 c0                	test   %eax,%eax
 8e2:	be 01 00 00 00       	mov    $0x1,%esi
 8e7:	74 15                	je     8fe <benny_mootex_yieldlock+0x2e>
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 8f0:	e8 45 fa ff ff       	call   33a <kthread_yield>
 8f5:	89 f0                	mov    %esi,%eax
 8f7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 8fa:	85 c0                	test   %eax,%eax
 8fc:	75 f2                	jne    8f0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 8fe:	e8 2f fa ff ff       	call   332 <kthread_self>
    benny_mootex->bid = benny_self();
 903:	89 43 04             	mov    %eax,0x4(%ebx)
}
 906:	31 c0                	xor    %eax,%eax
 908:	5b                   	pop    %ebx
 909:	5e                   	pop    %esi
 90a:	5d                   	pop    %ebp
 90b:	c3                   	ret    
 90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000910 <benny_mootex_spinlock>:
{
 910:	55                   	push   %ebp
 911:	ba 01 00 00 00       	mov    $0x1,%edx
 916:	89 e5                	mov    %esp,%ebp
 918:	53                   	push   %ebx
 919:	83 ec 04             	sub    $0x4,%esp
 91c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 91f:	90                   	nop
 920:	89 d0                	mov    %edx,%eax
 922:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 925:	85 c0                	test   %eax,%eax
 927:	75 f7                	jne    920 <benny_mootex_spinlock+0x10>
    return kthread_self();
 929:	e8 04 fa ff ff       	call   332 <kthread_self>
    benny_mootex->bid = benny_self();
 92e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 931:	83 c4 04             	add    $0x4,%esp
 934:	31 c0                	xor    %eax,%eax
 936:	5b                   	pop    %ebx
 937:	5d                   	pop    %ebp
 938:	c3                   	ret    
 939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000940 <benny_mootex_unlock>:
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	53                   	push   %ebx
 944:	83 ec 04             	sub    $0x4,%esp
 947:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 94a:	e8 e3 f9 ff ff       	call   332 <kthread_self>
    if(tid == benny_mootex->bid){
 94f:	39 43 04             	cmp    %eax,0x4(%ebx)
 952:	75 1c                	jne    970 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 954:	0f ae f0             	mfence 
    return 0;
 957:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 959:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 960:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 966:	83 c4 04             	add    $0x4,%esp
 969:	5b                   	pop    %ebx
 96a:	5d                   	pop    %ebp
 96b:	c3                   	ret    
 96c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 970:	83 c4 04             	add    $0x4,%esp
      return -1;
 973:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 978:	5b                   	pop    %ebx
 979:	5d                   	pop    %ebp
 97a:	c3                   	ret    
 97b:	90                   	nop
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000980 <benny_mootex_trylock>:
{
 980:	55                   	push   %ebp
 981:	b8 01 00 00 00       	mov    $0x1,%eax
 986:	89 e5                	mov    %esp,%ebp
 988:	53                   	push   %ebx
 989:	83 ec 04             	sub    $0x4,%esp
 98c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 98f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 992:	85 c0                	test   %eax,%eax
 994:	75 08                	jne    99e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 996:	e8 97 f9 ff ff       	call   332 <kthread_self>
        benny_mootex->bid = tid;
 99b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 99e:	83 c4 04             	add    $0x4,%esp
 9a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9a6:	5b                   	pop    %ebx
 9a7:	5d                   	pop    %ebp
 9a8:	c3                   	ret    
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009b0 <benny_mootex_wholock>:
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 9b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9b6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 9b7:	8b 40 04             	mov    0x4(%eax),%eax
}
 9ba:	c3                   	ret    
 9bb:	90                   	nop
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <benny_mootex_islocked>:
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 9c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9c6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 9c7:	8b 00                	mov    (%eax),%eax
}
 9c9:	c3                   	ret    
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009d0 <benny_self>:
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
}
 9d3:	5d                   	pop    %ebp
    return kthread_self();
 9d4:	e9 59 f9 ff ff       	jmp    332 <kthread_self>
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009e0 <benny_yield>:
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
    
}
 9e3:	5d                   	pop    %ebp
    return kthread_yield();
 9e4:	e9 51 f9 ff ff       	jmp    33a <kthread_yield>
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009f0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 9f3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 9f4:	e9 49 f9 ff ff       	jmp    342 <kthread_cpu_count>
 9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a00 <benny_thread_count>:

int
benny_thread_count(void)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 a03:	5d                   	pop    %ebp
    return kthread_thread_count();
 a04:	e9 41 f9 ff ff       	jmp    34a <kthread_thread_count>
