
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(argc != 3){
   d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
  11:	74 19                	je     2c <main+0x2c>
    printf(2, "Usage: ln old new\n");
  13:	c7 44 24 04 49 0a 00 	movl   $0xa49,0x4(%esp)
  1a:	00 
  1b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  22:	e8 19 04 00 00       	call   440 <printf>
    exit();
  27:	e8 66 02 00 00       	call   292 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2c:	8b 43 08             	mov    0x8(%ebx),%eax
  2f:	89 44 24 04          	mov    %eax,0x4(%esp)
  33:	8b 43 04             	mov    0x4(%ebx),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 b4 02 00 00       	call   2f2 <link>
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 4b 02 00 00       	call   292 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	8b 43 08             	mov    0x8(%ebx),%eax
  4a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	c7 44 24 04 5c 0a 00 	movl   $0xa5c,0x4(%esp)
  58:	00 
  59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  60:	89 44 24 08          	mov    %eax,0x8(%esp)
  64:	e8 d7 03 00 00       	call   440 <printf>
  69:	eb d7                	jmp    42 <main+0x42>
  6b:	66 90                	xchg   %ax,%ax
  6d:	66 90                	xchg   %ax,%ax
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	8b 45 08             	mov    0x8(%ebp),%eax
  76:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  79:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 55 08             	mov    0x8(%ebp),%edx
  a6:	53                   	push   %ebx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	74 2d                	je     de <strcmp+0x3e>
  b1:	0f b6 19             	movzbl (%ecx),%ebx
  b4:	38 d8                	cmp    %bl,%al
  b6:	74 0e                	je     c6 <strcmp+0x26>
  b8:	eb 2b                	jmp    e5 <strcmp+0x45>
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  c0:	38 c8                	cmp    %cl,%al
  c2:	75 15                	jne    d9 <strcmp+0x39>
    p++, q++;
  c4:	89 d9                	mov    %ebx,%ecx
  c6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  c9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  cc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  cf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  d3:	84 c0                	test   %al,%al
  d5:	75 e9                	jne    c0 <strcmp+0x20>
  d7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d9:	29 c8                	sub    %ecx,%eax
}
  db:	5b                   	pop    %ebx
  dc:	5d                   	pop    %ebp
  dd:	c3                   	ret    
  de:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
  e1:	31 c0                	xor    %eax,%eax
  e3:	eb f4                	jmp    d9 <strcmp+0x39>
  e5:	0f b6 cb             	movzbl %bl,%ecx
  e8:	eb ef                	jmp    d9 <strcmp+0x39>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 12                	je     10d <strlen+0x1d>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 10d:	31 c0                	xor    %eax,%eax
}
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	eb 0d                	jmp    120 <memset>
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
 126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	53                   	push   %ebx
 147:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 14a:	0f b6 18             	movzbl (%eax),%ebx
 14d:	84 db                	test   %bl,%bl
 14f:	74 1d                	je     16e <strchr+0x2e>
    if(*s == c)
 151:	38 d3                	cmp    %dl,%bl
 153:	89 d1                	mov    %edx,%ecx
 155:	75 0d                	jne    164 <strchr+0x24>
 157:	eb 17                	jmp    170 <strchr+0x30>
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 160:	38 ca                	cmp    %cl,%dl
 162:	74 0c                	je     170 <strchr+0x30>
  for(; *s; s++)
 164:	83 c0 01             	add    $0x1,%eax
 167:	0f b6 10             	movzbl (%eax),%edx
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
 16e:	31 c0                	xor    %eax,%eax
}
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 185:	31 f6                	xor    %esi,%esi
{
 187:	53                   	push   %ebx
 188:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 18b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 18e:	eb 31                	jmp    1c1 <gets+0x41>
    cc = read(0, &c, 1);
 190:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 197:	00 
 198:	89 7c 24 04          	mov    %edi,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 02 01 00 00       	call   2aa <read>
    if(cc < 1)
 1a8:	85 c0                	test   %eax,%eax
 1aa:	7e 1d                	jle    1c9 <gets+0x49>
      break;
    buf[i++] = c;
 1ac:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 1b0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 1b2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1b5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 1b7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bb:	74 0c                	je     1c9 <gets+0x49>
 1bd:	3c 0a                	cmp    $0xa,%al
 1bf:	74 08                	je     1c9 <gets+0x49>
  for(i=0; i+1 < max; ){
 1c1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c7:	7c c7                	jl     190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1c9:	8b 45 08             	mov    0x8(%ebp),%eax
 1cc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d0:	83 c4 2c             	add    $0x2c,%esp
 1d3:	5b                   	pop    %ebx
 1d4:	5e                   	pop    %esi
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    
 1d8:	90                   	nop
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
 1e5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1f2:	00 
 1f3:	89 04 24             	mov    %eax,(%esp)
 1f6:	e8 d7 00 00 00       	call   2d2 <open>
  if(fd < 0)
 1fb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 1fd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1ff:	78 27                	js     228 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 201:	8b 45 0c             	mov    0xc(%ebp),%eax
 204:	89 1c 24             	mov    %ebx,(%esp)
 207:	89 44 24 04          	mov    %eax,0x4(%esp)
 20b:	e8 da 00 00 00       	call   2ea <fstat>
  close(fd);
 210:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 213:	89 c6                	mov    %eax,%esi
  close(fd);
 215:	e8 a0 00 00 00       	call   2ba <close>
  return r;
 21a:	89 f0                	mov    %esi,%eax
}
 21c:	83 c4 10             	add    $0x10,%esp
 21f:	5b                   	pop    %ebx
 220:	5e                   	pop    %esi
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	90                   	nop
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 228:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22d:	eb ed                	jmp    21c <stat+0x3c>
 22f:	90                   	nop

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
 236:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 11             	movsbl (%ecx),%edx
 23a:	8d 42 d0             	lea    -0x30(%edx),%eax
 23d:	3c 09                	cmp    $0x9,%al
  n = 0;
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 244:	77 17                	ja     25d <atoi+0x2d>
 246:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 248:	83 c1 01             	add    $0x1,%ecx
 24b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 24e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 252:	0f be 11             	movsbl (%ecx),%edx
 255:	8d 5a d0             	lea    -0x30(%edx),%ebx
 258:	80 fb 09             	cmp    $0x9,%bl
 25b:	76 eb                	jbe    248 <atoi+0x18>
  return n;
}
 25d:	5b                   	pop    %ebx
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 261:	31 d2                	xor    %edx,%edx
{
 263:	89 e5                	mov    %esp,%ebp
 265:	56                   	push   %esi
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	53                   	push   %ebx
 26a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 270:	85 db                	test   %ebx,%ebx
 272:	7e 12                	jle    286 <memmove+0x26>
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 27c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 27f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 282:	39 da                	cmp    %ebx,%edx
 284:	75 f2                	jne    278 <memmove+0x18>
  return vdst;
}
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    

0000028a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28a:	b8 01 00 00 00       	mov    $0x1,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <exit>:
SYSCALL(exit)
 292:	b8 02 00 00 00       	mov    $0x2,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <wait>:
SYSCALL(wait)
 29a:	b8 03 00 00 00       	mov    $0x3,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <pipe>:
SYSCALL(pipe)
 2a2:	b8 04 00 00 00       	mov    $0x4,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <read>:
SYSCALL(read)
 2aa:	b8 05 00 00 00       	mov    $0x5,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <write>:
SYSCALL(write)
 2b2:	b8 10 00 00 00       	mov    $0x10,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <close>:
SYSCALL(close)
 2ba:	b8 15 00 00 00       	mov    $0x15,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <kill>:
SYSCALL(kill)
 2c2:	b8 06 00 00 00       	mov    $0x6,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <exec>:
SYSCALL(exec)
 2ca:	b8 07 00 00 00       	mov    $0x7,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <open>:
SYSCALL(open)
 2d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mknod>:
SYSCALL(mknod)
 2da:	b8 11 00 00 00       	mov    $0x11,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <unlink>:
SYSCALL(unlink)
 2e2:	b8 12 00 00 00       	mov    $0x12,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <fstat>:
SYSCALL(fstat)
 2ea:	b8 08 00 00 00       	mov    $0x8,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <link>:
SYSCALL(link)
 2f2:	b8 13 00 00 00       	mov    $0x13,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mkdir>:
SYSCALL(mkdir)
 2fa:	b8 14 00 00 00       	mov    $0x14,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <chdir>:
SYSCALL(chdir)
 302:	b8 09 00 00 00       	mov    $0x9,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <dup>:
SYSCALL(dup)
 30a:	b8 0a 00 00 00       	mov    $0xa,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <getpid>:
SYSCALL(getpid)
 312:	b8 0b 00 00 00       	mov    $0xb,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <sbrk>:
SYSCALL(sbrk)
 31a:	b8 0c 00 00 00       	mov    $0xc,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sleep>:
SYSCALL(sleep)
 322:	b8 0d 00 00 00       	mov    $0xd,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <uptime>:
SYSCALL(uptime)
 32a:	b8 0e 00 00 00       	mov    $0xe,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 332:	b8 16 00 00 00       	mov    $0x16,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 33a:	b8 17 00 00 00       	mov    $0x17,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 342:	b8 18 00 00 00       	mov    $0x18,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 34a:	b8 19 00 00 00       	mov    $0x19,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 352:	b8 1a 00 00 00       	mov    $0x1a,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 35a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <kthread_join>:
SYSCALL(kthread_join)
 362:	b8 1c 00 00 00       	mov    $0x1c,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <kthread_exit>:
SYSCALL(kthread_exit)
 36a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 372:	b8 1e 00 00 00       	mov    $0x1e,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <kthread_yield>:
SYSCALL(kthread_yield)
 37a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 382:	b8 20 00 00 00       	mov    $0x20,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 38a:	b8 21 00 00 00       	mov    $0x21,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    
 392:	66 90                	xchg   %ax,%ax
 394:	66 90                	xchg   %ax,%ax
 396:	66 90                	xchg   %ax,%ax
 398:	66 90                	xchg   %ax,%ax
 39a:	66 90                	xchg   %ax,%ax
 39c:	66 90                	xchg   %ax,%ax
 39e:	66 90                	xchg   %ax,%ax

000003a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	89 c6                	mov    %eax,%esi
 3a7:	53                   	push   %ebx
 3a8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3ae:	85 db                	test   %ebx,%ebx
 3b0:	74 09                	je     3bb <printint+0x1b>
 3b2:	89 d0                	mov    %edx,%eax
 3b4:	c1 e8 1f             	shr    $0x1f,%eax
 3b7:	84 c0                	test   %al,%al
 3b9:	75 75                	jne    430 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3bb:	89 d0                	mov    %edx,%eax
  neg = 0;
 3bd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3c4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 3c7:	31 ff                	xor    %edi,%edi
 3c9:	89 ce                	mov    %ecx,%esi
 3cb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3ce:	eb 02                	jmp    3d2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 3d0:	89 cf                	mov    %ecx,%edi
 3d2:	31 d2                	xor    %edx,%edx
 3d4:	f7 f6                	div    %esi
 3d6:	8d 4f 01             	lea    0x1(%edi),%ecx
 3d9:	0f b6 92 77 0a 00 00 	movzbl 0xa77(%edx),%edx
  }while((x /= base) != 0);
 3e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3e2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3e5:	75 e9                	jne    3d0 <printint+0x30>
  if(neg)
 3e7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 3ea:	89 c8                	mov    %ecx,%eax
 3ec:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 3ef:	85 d2                	test   %edx,%edx
 3f1:	74 08                	je     3fb <printint+0x5b>
    buf[i++] = '-';
 3f3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3f6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 3fb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3fe:	66 90                	xchg   %ax,%ax
 400:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 405:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 408:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 40f:	00 
 410:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 414:	89 34 24             	mov    %esi,(%esp)
 417:	88 45 d7             	mov    %al,-0x29(%ebp)
 41a:	e8 93 fe ff ff       	call   2b2 <write>
  while(--i >= 0)
 41f:	83 ff ff             	cmp    $0xffffffff,%edi
 422:	75 dc                	jne    400 <printint+0x60>
    putc(fd, buf[i]);
}
 424:	83 c4 4c             	add    $0x4c,%esp
 427:	5b                   	pop    %ebx
 428:	5e                   	pop    %esi
 429:	5f                   	pop    %edi
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 430:	89 d0                	mov    %edx,%eax
 432:	f7 d8                	neg    %eax
    neg = 1;
 434:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 43b:	eb 87                	jmp    3c4 <printint+0x24>
 43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 444:	31 ff                	xor    %edi,%edi
{
 446:	56                   	push   %esi
 447:	53                   	push   %ebx
 448:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 44b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 44e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 451:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 454:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 457:	0f b6 13             	movzbl (%ebx),%edx
 45a:	83 c3 01             	add    $0x1,%ebx
 45d:	84 d2                	test   %dl,%dl
 45f:	75 39                	jne    49a <printf+0x5a>
 461:	e9 ca 00 00 00       	jmp    530 <printf+0xf0>
 466:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 468:	83 fa 25             	cmp    $0x25,%edx
 46b:	0f 84 c7 00 00 00    	je     538 <printf+0xf8>
  write(fd, &c, 1);
 471:	8d 45 e0             	lea    -0x20(%ebp),%eax
 474:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47b:	00 
 47c:	89 44 24 04          	mov    %eax,0x4(%esp)
 480:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 483:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 486:	e8 27 fe ff ff       	call   2b2 <write>
 48b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 48e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 492:	84 d2                	test   %dl,%dl
 494:	0f 84 96 00 00 00    	je     530 <printf+0xf0>
    if(state == 0){
 49a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 49c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 49f:	74 c7                	je     468 <printf+0x28>
      }
    } else if(state == '%'){
 4a1:	83 ff 25             	cmp    $0x25,%edi
 4a4:	75 e5                	jne    48b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 4a6:	83 fa 75             	cmp    $0x75,%edx
 4a9:	0f 84 99 00 00 00    	je     548 <printf+0x108>
 4af:	83 fa 64             	cmp    $0x64,%edx
 4b2:	0f 84 90 00 00 00    	je     548 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4b8:	25 f7 00 00 00       	and    $0xf7,%eax
 4bd:	83 f8 70             	cmp    $0x70,%eax
 4c0:	0f 84 aa 00 00 00    	je     570 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4c6:	83 fa 73             	cmp    $0x73,%edx
 4c9:	0f 84 e9 00 00 00    	je     5b8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4cf:	83 fa 63             	cmp    $0x63,%edx
 4d2:	0f 84 2b 01 00 00    	je     603 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4d8:	83 fa 25             	cmp    $0x25,%edx
 4db:	0f 84 4f 01 00 00    	je     630 <printf+0x1f0>
  write(fd, &c, 1);
 4e1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4e4:	83 c3 01             	add    $0x1,%ebx
 4e7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ee:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ef:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4f1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f5:	89 34 24             	mov    %esi,(%esp)
 4f8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4fb:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4ff:	e8 ae fd ff ff       	call   2b2 <write>
        putc(fd, c);
 504:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 507:	8d 45 e7             	lea    -0x19(%ebp),%eax
 50a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 511:	00 
 512:	89 44 24 04          	mov    %eax,0x4(%esp)
 516:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 519:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 51c:	e8 91 fd ff ff       	call   2b2 <write>
  for(i = 0; fmt[i]; i++){
 521:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 525:	84 d2                	test   %dl,%dl
 527:	0f 85 6d ff ff ff    	jne    49a <printf+0x5a>
 52d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 530:	83 c4 3c             	add    $0x3c,%esp
 533:	5b                   	pop    %ebx
 534:	5e                   	pop    %esi
 535:	5f                   	pop    %edi
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
        state = '%';
 538:	bf 25 00 00 00       	mov    $0x25,%edi
 53d:	e9 49 ff ff ff       	jmp    48b <printf+0x4b>
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 548:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 54f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 554:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 557:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 559:	8b 10                	mov    (%eax),%edx
 55b:	89 f0                	mov    %esi,%eax
 55d:	e8 3e fe ff ff       	call   3a0 <printint>
        ap++;
 562:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 566:	e9 20 ff ff ff       	jmp    48b <printf+0x4b>
 56b:	90                   	nop
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 570:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 573:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 57a:	00 
 57b:	89 44 24 04          	mov    %eax,0x4(%esp)
 57f:	89 34 24             	mov    %esi,(%esp)
 582:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 586:	e8 27 fd ff ff       	call   2b2 <write>
 58b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 58e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 595:	00 
 596:	89 44 24 04          	mov    %eax,0x4(%esp)
 59a:	89 34 24             	mov    %esi,(%esp)
 59d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 5a1:	e8 0c fd ff ff       	call   2b2 <write>
        printint(fd, *ap, 16, 0);
 5a6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5b2:	eb a0                	jmp    554 <printf+0x114>
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5bb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 5bf:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 5c1:	b8 70 0a 00 00       	mov    $0xa70,%eax
 5c6:	85 ff                	test   %edi,%edi
 5c8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 5cb:	0f b6 07             	movzbl (%edi),%eax
 5ce:	84 c0                	test   %al,%al
 5d0:	74 2a                	je     5fc <printf+0x1bc>
 5d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5d8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5db:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 5de:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 5e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5e8:	00 
 5e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ed:	89 34 24             	mov    %esi,(%esp)
 5f0:	e8 bd fc ff ff       	call   2b2 <write>
        while(*s != 0){
 5f5:	0f b6 07             	movzbl (%edi),%eax
 5f8:	84 c0                	test   %al,%al
 5fa:	75 dc                	jne    5d8 <printf+0x198>
      state = 0;
 5fc:	31 ff                	xor    %edi,%edi
 5fe:	e9 88 fe ff ff       	jmp    48b <printf+0x4b>
        putc(fd, *ap);
 603:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 606:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 608:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 60a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 611:	00 
 612:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 615:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 618:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 61b:	89 44 24 04          	mov    %eax,0x4(%esp)
 61f:	e8 8e fc ff ff       	call   2b2 <write>
        ap++;
 624:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 628:	e9 5e fe ff ff       	jmp    48b <printf+0x4b>
 62d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 630:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 633:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 635:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 63c:	00 
 63d:	89 44 24 04          	mov    %eax,0x4(%esp)
 641:	89 34 24             	mov    %esi,(%esp)
 644:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 648:	e8 65 fc ff ff       	call   2b2 <write>
 64d:	e9 39 fe ff ff       	jmp    48b <printf+0x4b>
 652:	66 90                	xchg   %ax,%ax
 654:	66 90                	xchg   %ax,%ax
 656:	66 90                	xchg   %ax,%ax
 658:	66 90                	xchg   %ax,%ax
 65a:	66 90                	xchg   %ax,%ax
 65c:	66 90                	xchg   %ax,%ax
 65e:	66 90                	xchg   %ax,%ax

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 fc 0e 00 00       	mov    0xefc,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 670:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 673:	39 d0                	cmp    %edx,%eax
 675:	72 11                	jb     688 <free+0x28>
 677:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 678:	39 c8                	cmp    %ecx,%eax
 67a:	72 04                	jb     680 <free+0x20>
 67c:	39 ca                	cmp    %ecx,%edx
 67e:	72 10                	jb     690 <free+0x30>
 680:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 682:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 684:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 686:	73 f0                	jae    678 <free+0x18>
 688:	39 ca                	cmp    %ecx,%edx
 68a:	72 04                	jb     690 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 68c:	39 c8                	cmp    %ecx,%eax
 68e:	72 f0                	jb     680 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 690:	8b 73 fc             	mov    -0x4(%ebx),%esi
 693:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 696:	39 cf                	cmp    %ecx,%edi
 698:	74 1e                	je     6b8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 69a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 69d:	8b 48 04             	mov    0x4(%eax),%ecx
 6a0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6a3:	39 f2                	cmp    %esi,%edx
 6a5:	74 28                	je     6cf <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6a7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6a9:	a3 fc 0e 00 00       	mov    %eax,0xefc
}
 6ae:	5b                   	pop    %ebx
 6af:	5e                   	pop    %esi
 6b0:	5f                   	pop    %edi
 6b1:	5d                   	pop    %ebp
 6b2:	c3                   	ret    
 6b3:	90                   	nop
 6b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6b8:	03 71 04             	add    0x4(%ecx),%esi
 6bb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6be:	8b 08                	mov    (%eax),%ecx
 6c0:	8b 09                	mov    (%ecx),%ecx
 6c2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6c5:	8b 48 04             	mov    0x4(%eax),%ecx
 6c8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6cb:	39 f2                	cmp    %esi,%edx
 6cd:	75 d8                	jne    6a7 <free+0x47>
    p->s.size += bp->s.size;
 6cf:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 6d2:	a3 fc 0e 00 00       	mov    %eax,0xefc
    p->s.size += bp->s.size;
 6d7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6da:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6dd:	89 10                	mov    %edx,(%eax)
}
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5f                   	pop    %edi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    
 6e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6fc:	8b 1d fc 0e 00 00    	mov    0xefc,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 702:	8d 48 07             	lea    0x7(%eax),%ecx
 705:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 708:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 70d:	0f 84 9b 00 00 00    	je     7ae <malloc+0xbe>
 713:	8b 13                	mov    (%ebx),%edx
 715:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 718:	39 fe                	cmp    %edi,%esi
 71a:	76 64                	jbe    780 <malloc+0x90>
 71c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 723:	bb 00 80 00 00       	mov    $0x8000,%ebx
 728:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 72b:	eb 0e                	jmp    73b <malloc+0x4b>
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 730:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 732:	8b 78 04             	mov    0x4(%eax),%edi
 735:	39 fe                	cmp    %edi,%esi
 737:	76 4f                	jbe    788 <malloc+0x98>
 739:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 73b:	3b 15 fc 0e 00 00    	cmp    0xefc,%edx
 741:	75 ed                	jne    730 <malloc+0x40>
  if(nu < 4096)
 743:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 746:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 74c:	bf 00 10 00 00       	mov    $0x1000,%edi
 751:	0f 43 fe             	cmovae %esi,%edi
 754:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 757:	89 04 24             	mov    %eax,(%esp)
 75a:	e8 bb fb ff ff       	call   31a <sbrk>
  if(p == (char*)-1)
 75f:	83 f8 ff             	cmp    $0xffffffff,%eax
 762:	74 18                	je     77c <malloc+0x8c>
  hp->s.size = nu;
 764:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 767:	83 c0 08             	add    $0x8,%eax
 76a:	89 04 24             	mov    %eax,(%esp)
 76d:	e8 ee fe ff ff       	call   660 <free>
  return freep;
 772:	8b 15 fc 0e 00 00    	mov    0xefc,%edx
      if((p = morecore(nunits)) == 0)
 778:	85 d2                	test   %edx,%edx
 77a:	75 b4                	jne    730 <malloc+0x40>
        return 0;
 77c:	31 c0                	xor    %eax,%eax
 77e:	eb 20                	jmp    7a0 <malloc+0xb0>
    if(p->s.size >= nunits){
 780:	89 d0                	mov    %edx,%eax
 782:	89 da                	mov    %ebx,%edx
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 788:	39 fe                	cmp    %edi,%esi
 78a:	74 1c                	je     7a8 <malloc+0xb8>
        p->s.size -= nunits;
 78c:	29 f7                	sub    %esi,%edi
 78e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 791:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 794:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 797:	89 15 fc 0e 00 00    	mov    %edx,0xefc
      return (void*)(p + 1);
 79d:	83 c0 08             	add    $0x8,%eax
  }
}
 7a0:	83 c4 1c             	add    $0x1c,%esp
 7a3:	5b                   	pop    %ebx
 7a4:	5e                   	pop    %esi
 7a5:	5f                   	pop    %edi
 7a6:	5d                   	pop    %ebp
 7a7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7a8:	8b 08                	mov    (%eax),%ecx
 7aa:	89 0a                	mov    %ecx,(%edx)
 7ac:	eb e9                	jmp    797 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 7ae:	c7 05 fc 0e 00 00 00 	movl   $0xf00,0xefc
 7b5:	0f 00 00 
    base.s.size = 0;
 7b8:	ba 00 0f 00 00       	mov    $0xf00,%edx
    base.s.ptr = freep = prevp = &base;
 7bd:	c7 05 00 0f 00 00 00 	movl   $0xf00,0xf00
 7c4:	0f 00 00 
    base.s.size = 0;
 7c7:	c7 05 04 0f 00 00 00 	movl   $0x0,0xf04
 7ce:	00 00 00 
 7d1:	e9 46 ff ff ff       	jmp    71c <malloc+0x2c>
 7d6:	66 90                	xchg   %ax,%ax
 7d8:	66 90                	xchg   %ax,%ax
 7da:	66 90                	xchg   %ax,%ax
 7dc:	66 90                	xchg   %ax,%ax
 7de:	66 90                	xchg   %ax,%ax

000007e0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	56                   	push   %esi
 7e4:	53                   	push   %ebx
 7e5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 7e8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 7ef:	e8 fc fe ff ff       	call   6f0 <malloc>

    if (bt == NULL) {
 7f4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 7f6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 7f8:	74 66                	je     860 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 7fa:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 801:	e8 ea fe ff ff       	call   6f0 <malloc>
    if (bt->bt_stack == NULL) {
 806:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 808:	89 c3                	mov    %eax,%ebx
 80a:	89 46 08             	mov    %eax,0x8(%esi)
 80d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 810:	74 5d                	je     86f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 812:	25 ff 0f 00 00       	and    $0xfff,%eax
 817:	75 37                	jne    850 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 819:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 81f:	8b 45 10             	mov    0x10(%ebp),%eax
 822:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 826:	89 44 24 04          	mov    %eax,0x4(%esp)
 82a:	8b 45 0c             	mov    0xc(%ebp),%eax
 82d:	89 04 24             	mov    %eax,(%esp)
 830:	e8 25 fb ff ff       	call   35a <kthread_create>
    if (bt->bid != 0) {
 835:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 837:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 839:	74 2d                	je     868 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 83b:	8b 45 08             	mov    0x8(%ebp),%eax
 83e:	89 30                	mov    %esi,(%eax)
        result = 0;
 840:	31 c0                	xor    %eax,%eax
}
 842:	83 c4 10             	add    $0x10,%esp
 845:	5b                   	pop    %ebx
 846:	5e                   	pop    %esi
 847:	5d                   	pop    %ebp
 848:	c3                   	ret    
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 850:	29 c3                	sub    %eax,%ebx
 852:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 858:	89 5e 04             	mov    %ebx,0x4(%esi)
 85b:	eb bc                	jmp    819 <benny_thread_create+0x39>
 85d:	8d 76 00             	lea    0x0(%esi),%esi
 860:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 866:	eb b7                	jmp    81f <benny_thread_create+0x3f>
    int result = -1;
 868:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 86d:	eb d3                	jmp    842 <benny_thread_create+0x62>
        free(bt);
 86f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 872:	31 f6                	xor    %esi,%esi
        free(bt);
 874:	e8 e7 fd ff ff       	call   660 <free>
 879:	8b 5b 04             	mov    0x4(%ebx),%ebx
 87c:	eb a1                	jmp    81f <benny_thread_create+0x3f>
 87e:	66 90                	xchg   %ax,%ax

00000880 <benny_thread_bid>:
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 883:	8b 45 08             	mov    0x8(%ebp),%eax
}
 886:	5d                   	pop    %ebp
    return bt->bid;
 887:	8b 00                	mov    (%eax),%eax
}
 889:	c3                   	ret    
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000890 <benny_thread_join>:
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	53                   	push   %ebx
 894:	83 ec 14             	sub    $0x14,%esp
 897:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 89a:	8b 03                	mov    (%ebx),%eax
 89c:	89 04 24             	mov    %eax,(%esp)
 89f:	e8 be fa ff ff       	call   362 <kthread_join>
    if (retVal == 0) {
 8a4:	85 c0                	test   %eax,%eax
 8a6:	75 27                	jne    8cf <benny_thread_join+0x3f>
        free(bt->mem_stack);
 8a8:	8b 53 08             	mov    0x8(%ebx),%edx
 8ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ae:	89 14 24             	mov    %edx,(%esp)
 8b1:	e8 aa fd ff ff       	call   660 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 8b6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8bd:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 8c4:	89 1c 24             	mov    %ebx,(%esp)
 8c7:	e8 94 fd ff ff       	call   660 <free>
 8cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8cf:	83 c4 14             	add    $0x14,%esp
 8d2:	5b                   	pop    %ebx
 8d3:	5d                   	pop    %ebp
 8d4:	c3                   	ret    
 8d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008e0 <benny_thread_exit>:
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
}
 8e3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 8e4:	e9 81 fa ff ff       	jmp    36a <kthread_exit>
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008f0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 8f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 8fc:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 903:	31 c0                	xor    %eax,%eax
 905:	5d                   	pop    %ebp
 906:	c3                   	ret    
 907:	89 f6                	mov    %esi,%esi
 909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000910 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 910:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 911:	b8 01 00 00 00       	mov    $0x1,%eax
 916:	89 e5                	mov    %esp,%ebp
 918:	56                   	push   %esi
 919:	53                   	push   %ebx
 91a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 91d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 920:	85 c0                	test   %eax,%eax
 922:	be 01 00 00 00       	mov    $0x1,%esi
 927:	74 15                	je     93e <benny_mootex_yieldlock+0x2e>
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 930:	e8 45 fa ff ff       	call   37a <kthread_yield>
 935:	89 f0                	mov    %esi,%eax
 937:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 93a:	85 c0                	test   %eax,%eax
 93c:	75 f2                	jne    930 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 93e:	e8 2f fa ff ff       	call   372 <kthread_self>
    benny_mootex->bid = benny_self();
 943:	89 43 04             	mov    %eax,0x4(%ebx)
}
 946:	31 c0                	xor    %eax,%eax
 948:	5b                   	pop    %ebx
 949:	5e                   	pop    %esi
 94a:	5d                   	pop    %ebp
 94b:	c3                   	ret    
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000950 <benny_mootex_spinlock>:
{
 950:	55                   	push   %ebp
 951:	ba 01 00 00 00       	mov    $0x1,%edx
 956:	89 e5                	mov    %esp,%ebp
 958:	53                   	push   %ebx
 959:	83 ec 04             	sub    $0x4,%esp
 95c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 95f:	90                   	nop
 960:	89 d0                	mov    %edx,%eax
 962:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 965:	85 c0                	test   %eax,%eax
 967:	75 f7                	jne    960 <benny_mootex_spinlock+0x10>
    return kthread_self();
 969:	e8 04 fa ff ff       	call   372 <kthread_self>
    benny_mootex->bid = benny_self();
 96e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 971:	83 c4 04             	add    $0x4,%esp
 974:	31 c0                	xor    %eax,%eax
 976:	5b                   	pop    %ebx
 977:	5d                   	pop    %ebp
 978:	c3                   	ret    
 979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000980 <benny_mootex_unlock>:
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	53                   	push   %ebx
 984:	83 ec 04             	sub    $0x4,%esp
 987:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 98a:	e8 e3 f9 ff ff       	call   372 <kthread_self>
    if(tid == benny_mootex->bid){
 98f:	39 43 04             	cmp    %eax,0x4(%ebx)
 992:	75 1c                	jne    9b0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 994:	0f ae f0             	mfence 
    return 0;
 997:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 999:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 9a0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 9a6:	83 c4 04             	add    $0x4,%esp
 9a9:	5b                   	pop    %ebx
 9aa:	5d                   	pop    %ebp
 9ab:	c3                   	ret    
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9b0:	83 c4 04             	add    $0x4,%esp
      return -1;
 9b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 9b8:	5b                   	pop    %ebx
 9b9:	5d                   	pop    %ebp
 9ba:	c3                   	ret    
 9bb:	90                   	nop
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <benny_mootex_trylock>:
{
 9c0:	55                   	push   %ebp
 9c1:	b8 01 00 00 00       	mov    $0x1,%eax
 9c6:	89 e5                	mov    %esp,%ebp
 9c8:	53                   	push   %ebx
 9c9:	83 ec 04             	sub    $0x4,%esp
 9cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9cf:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 9d2:	85 c0                	test   %eax,%eax
 9d4:	75 08                	jne    9de <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 9d6:	e8 97 f9 ff ff       	call   372 <kthread_self>
        benny_mootex->bid = tid;
 9db:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9de:	83 c4 04             	add    $0x4,%esp
 9e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9e6:	5b                   	pop    %ebx
 9e7:	5d                   	pop    %ebp
 9e8:	c3                   	ret    
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009f0 <benny_mootex_wholock>:
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 9f3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9f6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 9f7:	8b 40 04             	mov    0x4(%eax),%eax
}
 9fa:	c3                   	ret    
 9fb:	90                   	nop
 9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a00 <benny_mootex_islocked>:
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 a03:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a06:	5d                   	pop    %ebp
    return benny_mootex->locked;
 a07:	8b 00                	mov    (%eax),%eax
}
 a09:	c3                   	ret    
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a10 <benny_self>:
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
}
 a13:	5d                   	pop    %ebp
    return kthread_self();
 a14:	e9 59 f9 ff ff       	jmp    372 <kthread_self>
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a20 <benny_yield>:
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
    
}
 a23:	5d                   	pop    %ebp
    return kthread_yield();
 a24:	e9 51 f9 ff ff       	jmp    37a <kthread_yield>
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 a33:	5d                   	pop    %ebp
    return kthread_cpu_count();
 a34:	e9 49 f9 ff ff       	jmp    382 <kthread_cpu_count>
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a40 <benny_thread_count>:

int
benny_thread_count(void)
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 a43:	5d                   	pop    %ebp
    return kthread_thread_count();
 a44:	e9 41 f9 ff ff       	jmp    38a <kthread_thread_count>
