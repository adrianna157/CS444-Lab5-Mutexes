
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
  int i;

  if(argc < 2){
   6:	bb 01 00 00 00       	mov    $0x1,%ebx
{
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 75 08             	mov    0x8(%ebp),%esi
  14:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(argc < 2){
  17:	83 fe 01             	cmp    $0x1,%esi
  1a:	7e 23                	jle    3f <main+0x3f>
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  20:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
  for(i=1; i<argc; i++)
  23:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  26:	89 04 24             	mov    %eax,(%esp)
  29:	e8 f2 01 00 00       	call   220 <atoi>
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 7c 02 00 00       	call   2b2 <kill>
  for(i=1; i<argc; i++)
  36:	39 f3                	cmp    %esi,%ebx
  38:	75 e6                	jne    20 <main+0x20>
  exit();
  3a:	e8 43 02 00 00       	call   282 <exit>
    printf(2, "usage: kill pid...\n");
  3f:	c7 44 24 04 39 0a 00 	movl   $0xa39,0x4(%esp)
  46:	00 
  47:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  4e:	e8 dd 03 00 00       	call   430 <printf>
    exit();
  53:	e8 2a 02 00 00       	call   282 <exit>
  58:	66 90                	xchg   %ax,%ax
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	8b 45 08             	mov    0x8(%ebp),%eax
  66:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  69:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	89 c2                	mov    %eax,%edx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  70:	83 c1 01             	add    $0x1,%ecx
  73:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  77:	83 c2 01             	add    $0x1,%edx
  7a:	84 db                	test   %bl,%bl
  7c:	88 5a ff             	mov    %bl,-0x1(%edx)
  7f:	75 ef                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  81:	5b                   	pop    %ebx
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    
  84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 55 08             	mov    0x8(%ebp),%edx
  96:	53                   	push   %ebx
  97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9a:	0f b6 02             	movzbl (%edx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	74 2d                	je     ce <strcmp+0x3e>
  a1:	0f b6 19             	movzbl (%ecx),%ebx
  a4:	38 d8                	cmp    %bl,%al
  a6:	74 0e                	je     b6 <strcmp+0x26>
  a8:	eb 2b                	jmp    d5 <strcmp+0x45>
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b0:	38 c8                	cmp    %cl,%al
  b2:	75 15                	jne    c9 <strcmp+0x39>
    p++, q++;
  b4:	89 d9                	mov    %ebx,%ecx
  b6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  b9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  bc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  bf:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  c3:	84 c0                	test   %al,%al
  c5:	75 e9                	jne    b0 <strcmp+0x20>
  c7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  c9:	29 c8                	sub    %ecx,%eax
}
  cb:	5b                   	pop    %ebx
  cc:	5d                   	pop    %ebp
  cd:	c3                   	ret    
  ce:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
  d1:	31 c0                	xor    %eax,%eax
  d3:	eb f4                	jmp    c9 <strcmp+0x39>
  d5:	0f b6 cb             	movzbl %bl,%ecx
  d8:	eb ef                	jmp    c9 <strcmp+0x39>
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 39 00             	cmpb   $0x0,(%ecx)
  e9:	74 12                	je     fd <strlen+0x1d>
  eb:	31 d2                	xor    %edx,%edx
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  f7:	89 d0                	mov    %edx,%eax
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  for(n = 0; s[n]; n++)
  fd:	31 c0                	xor    %eax,%eax
}
  ff:	5d                   	pop    %ebp
 100:	c3                   	ret    
 101:	eb 0d                	jmp    110 <memset>
 103:	90                   	nop
 104:	90                   	nop
 105:	90                   	nop
 106:	90                   	nop
 107:	90                   	nop
 108:	90                   	nop
 109:	90                   	nop
 10a:	90                   	nop
 10b:	90                   	nop
 10c:	90                   	nop
 10d:	90                   	nop
 10e:	90                   	nop
 10f:	90                   	nop

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
 116:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	53                   	push   %ebx
 137:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 13a:	0f b6 18             	movzbl (%eax),%ebx
 13d:	84 db                	test   %bl,%bl
 13f:	74 1d                	je     15e <strchr+0x2e>
    if(*s == c)
 141:	38 d3                	cmp    %dl,%bl
 143:	89 d1                	mov    %edx,%ecx
 145:	75 0d                	jne    154 <strchr+0x24>
 147:	eb 17                	jmp    160 <strchr+0x30>
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 150:	38 ca                	cmp    %cl,%dl
 152:	74 0c                	je     160 <strchr+0x30>
  for(; *s; s++)
 154:	83 c0 01             	add    $0x1,%eax
 157:	0f b6 10             	movzbl (%eax),%edx
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strchr+0x20>
      return (char*)s;
  return 0;
 15e:	31 c0                	xor    %eax,%eax
}
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 175:	31 f6                	xor    %esi,%esi
{
 177:	53                   	push   %ebx
 178:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 17b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 17e:	eb 31                	jmp    1b1 <gets+0x41>
    cc = read(0, &c, 1);
 180:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 187:	00 
 188:	89 7c 24 04          	mov    %edi,0x4(%esp)
 18c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 193:	e8 02 01 00 00       	call   29a <read>
    if(cc < 1)
 198:	85 c0                	test   %eax,%eax
 19a:	7e 1d                	jle    1b9 <gets+0x49>
      break;
    buf[i++] = c;
 19c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 1a0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 1a2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1a5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 1a7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1ab:	74 0c                	je     1b9 <gets+0x49>
 1ad:	3c 0a                	cmp    $0xa,%al
 1af:	74 08                	je     1b9 <gets+0x49>
  for(i=0; i+1 < max; ){
 1b1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b7:	7c c7                	jl     180 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c0:	83 c4 2c             	add    $0x2c,%esp
 1c3:	5b                   	pop    %ebx
 1c4:	5e                   	pop    %esi
 1c5:	5f                   	pop    %edi
 1c6:	5d                   	pop    %ebp
 1c7:	c3                   	ret    
 1c8:	90                   	nop
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d8:	8b 45 08             	mov    0x8(%ebp),%eax
 1db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1e2:	00 
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 d7 00 00 00       	call   2c2 <open>
  if(fd < 0)
 1eb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 1ed:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1ef:	78 27                	js     218 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f4:	89 1c 24             	mov    %ebx,(%esp)
 1f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1fb:	e8 da 00 00 00       	call   2da <fstat>
  close(fd);
 200:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 203:	89 c6                	mov    %eax,%esi
  close(fd);
 205:	e8 a0 00 00 00       	call   2aa <close>
  return r;
 20a:	89 f0                	mov    %esi,%eax
}
 20c:	83 c4 10             	add    $0x10,%esp
 20f:	5b                   	pop    %ebx
 210:	5e                   	pop    %esi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	90                   	nop
 214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 218:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21d:	eb ed                	jmp    20c <stat+0x3c>
 21f:	90                   	nop

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 4d 08             	mov    0x8(%ebp),%ecx
 226:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 227:	0f be 11             	movsbl (%ecx),%edx
 22a:	8d 42 d0             	lea    -0x30(%edx),%eax
 22d:	3c 09                	cmp    $0x9,%al
  n = 0;
 22f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 234:	77 17                	ja     24d <atoi+0x2d>
 236:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 238:	83 c1 01             	add    $0x1,%ecx
 23b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 23e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 242:	0f be 11             	movsbl (%ecx),%edx
 245:	8d 5a d0             	lea    -0x30(%edx),%ebx
 248:	80 fb 09             	cmp    $0x9,%bl
 24b:	76 eb                	jbe    238 <atoi+0x18>
  return n;
}
 24d:	5b                   	pop    %ebx
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 251:	31 d2                	xor    %edx,%edx
{
 253:	89 e5                	mov    %esp,%ebp
 255:	56                   	push   %esi
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	53                   	push   %ebx
 25a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 25d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 260:	85 db                	test   %ebx,%ebx
 262:	7e 12                	jle    276 <memmove+0x26>
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 268:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 26c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 26f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 272:	39 da                	cmp    %ebx,%edx
 274:	75 f2                	jne    268 <memmove+0x18>
  return vdst;
}
 276:	5b                   	pop    %ebx
 277:	5e                   	pop    %esi
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    

0000027a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27a:	b8 01 00 00 00       	mov    $0x1,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <exit>:
SYSCALL(exit)
 282:	b8 02 00 00 00       	mov    $0x2,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <wait>:
SYSCALL(wait)
 28a:	b8 03 00 00 00       	mov    $0x3,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <pipe>:
SYSCALL(pipe)
 292:	b8 04 00 00 00       	mov    $0x4,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <read>:
SYSCALL(read)
 29a:	b8 05 00 00 00       	mov    $0x5,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <write>:
SYSCALL(write)
 2a2:	b8 10 00 00 00       	mov    $0x10,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <close>:
SYSCALL(close)
 2aa:	b8 15 00 00 00       	mov    $0x15,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <kill>:
SYSCALL(kill)
 2b2:	b8 06 00 00 00       	mov    $0x6,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <exec>:
SYSCALL(exec)
 2ba:	b8 07 00 00 00       	mov    $0x7,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <open>:
SYSCALL(open)
 2c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <mknod>:
SYSCALL(mknod)
 2ca:	b8 11 00 00 00       	mov    $0x11,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <unlink>:
SYSCALL(unlink)
 2d2:	b8 12 00 00 00       	mov    $0x12,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <fstat>:
SYSCALL(fstat)
 2da:	b8 08 00 00 00       	mov    $0x8,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <link>:
SYSCALL(link)
 2e2:	b8 13 00 00 00       	mov    $0x13,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <mkdir>:
SYSCALL(mkdir)
 2ea:	b8 14 00 00 00       	mov    $0x14,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <chdir>:
SYSCALL(chdir)
 2f2:	b8 09 00 00 00       	mov    $0x9,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <dup>:
SYSCALL(dup)
 2fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <getpid>:
SYSCALL(getpid)
 302:	b8 0b 00 00 00       	mov    $0xb,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <sbrk>:
SYSCALL(sbrk)
 30a:	b8 0c 00 00 00       	mov    $0xc,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <sleep>:
SYSCALL(sleep)
 312:	b8 0d 00 00 00       	mov    $0xd,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <uptime>:
SYSCALL(uptime)
 31a:	b8 0e 00 00 00       	mov    $0xe,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 322:	b8 16 00 00 00       	mov    $0x16,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 32a:	b8 17 00 00 00       	mov    $0x17,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 332:	b8 18 00 00 00       	mov    $0x18,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 33a:	b8 19 00 00 00       	mov    $0x19,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 342:	b8 1a 00 00 00       	mov    $0x1a,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 34a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <kthread_join>:
SYSCALL(kthread_join)
 352:	b8 1c 00 00 00       	mov    $0x1c,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <kthread_exit>:
SYSCALL(kthread_exit)
 35a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 362:	b8 1e 00 00 00       	mov    $0x1e,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <kthread_yield>:
SYSCALL(kthread_yield)
 36a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 372:	b8 20 00 00 00       	mov    $0x20,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 37a:	b8 21 00 00 00       	mov    $0x21,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    
 382:	66 90                	xchg   %ax,%ax
 384:	66 90                	xchg   %ax,%ax
 386:	66 90                	xchg   %ax,%ax
 388:	66 90                	xchg   %ax,%ax
 38a:	66 90                	xchg   %ax,%ax
 38c:	66 90                	xchg   %ax,%ax
 38e:	66 90                	xchg   %ax,%ax

00000390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	89 c6                	mov    %eax,%esi
 397:	53                   	push   %ebx
 398:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 39b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 39e:	85 db                	test   %ebx,%ebx
 3a0:	74 09                	je     3ab <printint+0x1b>
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	c1 e8 1f             	shr    $0x1f,%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 75                	jne    420 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3ab:	89 d0                	mov    %edx,%eax
  neg = 0;
 3ad:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3b4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 3b7:	31 ff                	xor    %edi,%edi
 3b9:	89 ce                	mov    %ecx,%esi
 3bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3be:	eb 02                	jmp    3c2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 3c0:	89 cf                	mov    %ecx,%edi
 3c2:	31 d2                	xor    %edx,%edx
 3c4:	f7 f6                	div    %esi
 3c6:	8d 4f 01             	lea    0x1(%edi),%ecx
 3c9:	0f b6 92 54 0a 00 00 	movzbl 0xa54(%edx),%edx
  }while((x /= base) != 0);
 3d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3d2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3d5:	75 e9                	jne    3c0 <printint+0x30>
  if(neg)
 3d7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 3da:	89 c8                	mov    %ecx,%eax
 3dc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 3df:	85 d2                	test   %edx,%edx
 3e1:	74 08                	je     3eb <printint+0x5b>
    buf[i++] = '-';
 3e3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3e6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 3eb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3ee:	66 90                	xchg   %ax,%ax
 3f0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3f5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 3f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3ff:	00 
 400:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 404:	89 34 24             	mov    %esi,(%esp)
 407:	88 45 d7             	mov    %al,-0x29(%ebp)
 40a:	e8 93 fe ff ff       	call   2a2 <write>
  while(--i >= 0)
 40f:	83 ff ff             	cmp    $0xffffffff,%edi
 412:	75 dc                	jne    3f0 <printint+0x60>
    putc(fd, buf[i]);
}
 414:	83 c4 4c             	add    $0x4c,%esp
 417:	5b                   	pop    %ebx
 418:	5e                   	pop    %esi
 419:	5f                   	pop    %edi
 41a:	5d                   	pop    %ebp
 41b:	c3                   	ret    
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 420:	89 d0                	mov    %edx,%eax
 422:	f7 d8                	neg    %eax
    neg = 1;
 424:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 42b:	eb 87                	jmp    3b4 <printint+0x24>
 42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 434:	31 ff                	xor    %edi,%edi
{
 436:	56                   	push   %esi
 437:	53                   	push   %ebx
 438:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 43b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 43e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 441:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 444:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 447:	0f b6 13             	movzbl (%ebx),%edx
 44a:	83 c3 01             	add    $0x1,%ebx
 44d:	84 d2                	test   %dl,%dl
 44f:	75 39                	jne    48a <printf+0x5a>
 451:	e9 ca 00 00 00       	jmp    520 <printf+0xf0>
 456:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 458:	83 fa 25             	cmp    $0x25,%edx
 45b:	0f 84 c7 00 00 00    	je     528 <printf+0xf8>
  write(fd, &c, 1);
 461:	8d 45 e0             	lea    -0x20(%ebp),%eax
 464:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 46b:	00 
 46c:	89 44 24 04          	mov    %eax,0x4(%esp)
 470:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 473:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 476:	e8 27 fe ff ff       	call   2a2 <write>
 47b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 47e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 482:	84 d2                	test   %dl,%dl
 484:	0f 84 96 00 00 00    	je     520 <printf+0xf0>
    if(state == 0){
 48a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 48c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 48f:	74 c7                	je     458 <printf+0x28>
      }
    } else if(state == '%'){
 491:	83 ff 25             	cmp    $0x25,%edi
 494:	75 e5                	jne    47b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 496:	83 fa 75             	cmp    $0x75,%edx
 499:	0f 84 99 00 00 00    	je     538 <printf+0x108>
 49f:	83 fa 64             	cmp    $0x64,%edx
 4a2:	0f 84 90 00 00 00    	je     538 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4a8:	25 f7 00 00 00       	and    $0xf7,%eax
 4ad:	83 f8 70             	cmp    $0x70,%eax
 4b0:	0f 84 aa 00 00 00    	je     560 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4b6:	83 fa 73             	cmp    $0x73,%edx
 4b9:	0f 84 e9 00 00 00    	je     5a8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4bf:	83 fa 63             	cmp    $0x63,%edx
 4c2:	0f 84 2b 01 00 00    	je     5f3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4c8:	83 fa 25             	cmp    $0x25,%edx
 4cb:	0f 84 4f 01 00 00    	je     620 <printf+0x1f0>
  write(fd, &c, 1);
 4d1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4d4:	83 c3 01             	add    $0x1,%ebx
 4d7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4de:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4df:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 4e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e5:	89 34 24             	mov    %esi,(%esp)
 4e8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4eb:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4ef:	e8 ae fd ff ff       	call   2a2 <write>
        putc(fd, c);
 4f4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 4f7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 501:	00 
 502:	89 44 24 04          	mov    %eax,0x4(%esp)
 506:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 509:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 50c:	e8 91 fd ff ff       	call   2a2 <write>
  for(i = 0; fmt[i]; i++){
 511:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 515:	84 d2                	test   %dl,%dl
 517:	0f 85 6d ff ff ff    	jne    48a <printf+0x5a>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 520:	83 c4 3c             	add    $0x3c,%esp
 523:	5b                   	pop    %ebx
 524:	5e                   	pop    %esi
 525:	5f                   	pop    %edi
 526:	5d                   	pop    %ebp
 527:	c3                   	ret    
        state = '%';
 528:	bf 25 00 00 00       	mov    $0x25,%edi
 52d:	e9 49 ff ff ff       	jmp    47b <printf+0x4b>
 532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 538:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 53f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 544:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 547:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 549:	8b 10                	mov    (%eax),%edx
 54b:	89 f0                	mov    %esi,%eax
 54d:	e8 3e fe ff ff       	call   390 <printint>
        ap++;
 552:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 556:	e9 20 ff ff ff       	jmp    47b <printf+0x4b>
 55b:	90                   	nop
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 560:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 563:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 56a:	00 
 56b:	89 44 24 04          	mov    %eax,0x4(%esp)
 56f:	89 34 24             	mov    %esi,(%esp)
 572:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 576:	e8 27 fd ff ff       	call   2a2 <write>
 57b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 57e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 585:	00 
 586:	89 44 24 04          	mov    %eax,0x4(%esp)
 58a:	89 34 24             	mov    %esi,(%esp)
 58d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 591:	e8 0c fd ff ff       	call   2a2 <write>
        printint(fd, *ap, 16, 0);
 596:	b9 10 00 00 00       	mov    $0x10,%ecx
 59b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5a2:	eb a0                	jmp    544 <printf+0x114>
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5ab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 5af:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 5b1:	b8 4d 0a 00 00       	mov    $0xa4d,%eax
 5b6:	85 ff                	test   %edi,%edi
 5b8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 5bb:	0f b6 07             	movzbl (%edi),%eax
 5be:	84 c0                	test   %al,%al
 5c0:	74 2a                	je     5ec <printf+0x1bc>
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5c8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5cb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 5ce:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 5d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d8:	00 
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	89 34 24             	mov    %esi,(%esp)
 5e0:	e8 bd fc ff ff       	call   2a2 <write>
        while(*s != 0){
 5e5:	0f b6 07             	movzbl (%edi),%eax
 5e8:	84 c0                	test   %al,%al
 5ea:	75 dc                	jne    5c8 <printf+0x198>
      state = 0;
 5ec:	31 ff                	xor    %edi,%edi
 5ee:	e9 88 fe ff ff       	jmp    47b <printf+0x4b>
        putc(fd, *ap);
 5f3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 5f6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 5f8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 601:	00 
 602:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 605:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 608:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 60b:	89 44 24 04          	mov    %eax,0x4(%esp)
 60f:	e8 8e fc ff ff       	call   2a2 <write>
        ap++;
 614:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 618:	e9 5e fe ff ff       	jmp    47b <printf+0x4b>
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 620:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 623:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 625:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 62c:	00 
 62d:	89 44 24 04          	mov    %eax,0x4(%esp)
 631:	89 34 24             	mov    %esi,(%esp)
 634:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 638:	e8 65 fc ff ff       	call   2a2 <write>
 63d:	e9 39 fe ff ff       	jmp    47b <printf+0x4b>
 642:	66 90                	xchg   %ax,%ax
 644:	66 90                	xchg   %ax,%ax
 646:	66 90                	xchg   %ax,%ax
 648:	66 90                	xchg   %ax,%ax
 64a:	66 90                	xchg   %ax,%ax
 64c:	66 90                	xchg   %ax,%ax
 64e:	66 90                	xchg   %ax,%ax

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	a1 e0 0e 00 00       	mov    0xee0,%eax
{
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 65e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 660:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 663:	39 d0                	cmp    %edx,%eax
 665:	72 11                	jb     678 <free+0x28>
 667:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 668:	39 c8                	cmp    %ecx,%eax
 66a:	72 04                	jb     670 <free+0x20>
 66c:	39 ca                	cmp    %ecx,%edx
 66e:	72 10                	jb     680 <free+0x30>
 670:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 672:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 674:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 676:	73 f0                	jae    668 <free+0x18>
 678:	39 ca                	cmp    %ecx,%edx
 67a:	72 04                	jb     680 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67c:	39 c8                	cmp    %ecx,%eax
 67e:	72 f0                	jb     670 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 680:	8b 73 fc             	mov    -0x4(%ebx),%esi
 683:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 686:	39 cf                	cmp    %ecx,%edi
 688:	74 1e                	je     6a8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 68a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 68d:	8b 48 04             	mov    0x4(%eax),%ecx
 690:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 693:	39 f2                	cmp    %esi,%edx
 695:	74 28                	je     6bf <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 697:	89 10                	mov    %edx,(%eax)
  freep = p;
 699:	a3 e0 0e 00 00       	mov    %eax,0xee0
}
 69e:	5b                   	pop    %ebx
 69f:	5e                   	pop    %esi
 6a0:	5f                   	pop    %edi
 6a1:	5d                   	pop    %ebp
 6a2:	c3                   	ret    
 6a3:	90                   	nop
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6a8:	03 71 04             	add    0x4(%ecx),%esi
 6ab:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ae:	8b 08                	mov    (%eax),%ecx
 6b0:	8b 09                	mov    (%ecx),%ecx
 6b2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b5:	8b 48 04             	mov    0x4(%eax),%ecx
 6b8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6bb:	39 f2                	cmp    %esi,%edx
 6bd:	75 d8                	jne    697 <free+0x47>
    p->s.size += bp->s.size;
 6bf:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 6c2:	a3 e0 0e 00 00       	mov    %eax,0xee0
    p->s.size += bp->s.size;
 6c7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ca:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6cd:	89 10                	mov    %edx,(%eax)
}
 6cf:	5b                   	pop    %ebx
 6d0:	5e                   	pop    %esi
 6d1:	5f                   	pop    %edi
 6d2:	5d                   	pop    %ebp
 6d3:	c3                   	ret    
 6d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ec:	8b 1d e0 0e 00 00    	mov    0xee0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	8d 48 07             	lea    0x7(%eax),%ecx
 6f5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 6f8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 6fd:	0f 84 9b 00 00 00    	je     79e <malloc+0xbe>
 703:	8b 13                	mov    (%ebx),%edx
 705:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 708:	39 fe                	cmp    %edi,%esi
 70a:	76 64                	jbe    770 <malloc+0x90>
 70c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 713:	bb 00 80 00 00       	mov    $0x8000,%ebx
 718:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 71b:	eb 0e                	jmp    72b <malloc+0x4b>
 71d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 720:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 722:	8b 78 04             	mov    0x4(%eax),%edi
 725:	39 fe                	cmp    %edi,%esi
 727:	76 4f                	jbe    778 <malloc+0x98>
 729:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 72b:	3b 15 e0 0e 00 00    	cmp    0xee0,%edx
 731:	75 ed                	jne    720 <malloc+0x40>
  if(nu < 4096)
 733:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 736:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 73c:	bf 00 10 00 00       	mov    $0x1000,%edi
 741:	0f 43 fe             	cmovae %esi,%edi
 744:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 747:	89 04 24             	mov    %eax,(%esp)
 74a:	e8 bb fb ff ff       	call   30a <sbrk>
  if(p == (char*)-1)
 74f:	83 f8 ff             	cmp    $0xffffffff,%eax
 752:	74 18                	je     76c <malloc+0x8c>
  hp->s.size = nu;
 754:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 757:	83 c0 08             	add    $0x8,%eax
 75a:	89 04 24             	mov    %eax,(%esp)
 75d:	e8 ee fe ff ff       	call   650 <free>
  return freep;
 762:	8b 15 e0 0e 00 00    	mov    0xee0,%edx
      if((p = morecore(nunits)) == 0)
 768:	85 d2                	test   %edx,%edx
 76a:	75 b4                	jne    720 <malloc+0x40>
        return 0;
 76c:	31 c0                	xor    %eax,%eax
 76e:	eb 20                	jmp    790 <malloc+0xb0>
    if(p->s.size >= nunits){
 770:	89 d0                	mov    %edx,%eax
 772:	89 da                	mov    %ebx,%edx
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 778:	39 fe                	cmp    %edi,%esi
 77a:	74 1c                	je     798 <malloc+0xb8>
        p->s.size -= nunits;
 77c:	29 f7                	sub    %esi,%edi
 77e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 781:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 784:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 787:	89 15 e0 0e 00 00    	mov    %edx,0xee0
      return (void*)(p + 1);
 78d:	83 c0 08             	add    $0x8,%eax
  }
}
 790:	83 c4 1c             	add    $0x1c,%esp
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 798:	8b 08                	mov    (%eax),%ecx
 79a:	89 0a                	mov    %ecx,(%edx)
 79c:	eb e9                	jmp    787 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 79e:	c7 05 e0 0e 00 00 e4 	movl   $0xee4,0xee0
 7a5:	0e 00 00 
    base.s.size = 0;
 7a8:	ba e4 0e 00 00       	mov    $0xee4,%edx
    base.s.ptr = freep = prevp = &base;
 7ad:	c7 05 e4 0e 00 00 e4 	movl   $0xee4,0xee4
 7b4:	0e 00 00 
    base.s.size = 0;
 7b7:	c7 05 e8 0e 00 00 00 	movl   $0x0,0xee8
 7be:	00 00 00 
 7c1:	e9 46 ff ff ff       	jmp    70c <malloc+0x2c>
 7c6:	66 90                	xchg   %ax,%ax
 7c8:	66 90                	xchg   %ax,%ax
 7ca:	66 90                	xchg   %ax,%ax
 7cc:	66 90                	xchg   %ax,%ax
 7ce:	66 90                	xchg   %ax,%ax

000007d0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	56                   	push   %esi
 7d4:	53                   	push   %ebx
 7d5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 7d8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 7df:	e8 fc fe ff ff       	call   6e0 <malloc>

    if (bt == NULL) {
 7e4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 7e6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 7e8:	74 66                	je     850 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 7ea:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 7f1:	e8 ea fe ff ff       	call   6e0 <malloc>
    if (bt->bt_stack == NULL) {
 7f6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 7f8:	89 c3                	mov    %eax,%ebx
 7fa:	89 46 08             	mov    %eax,0x8(%esi)
 7fd:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 800:	74 5d                	je     85f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 802:	25 ff 0f 00 00       	and    $0xfff,%eax
 807:	75 37                	jne    840 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 809:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 80f:	8b 45 10             	mov    0x10(%ebp),%eax
 812:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 816:	89 44 24 04          	mov    %eax,0x4(%esp)
 81a:	8b 45 0c             	mov    0xc(%ebp),%eax
 81d:	89 04 24             	mov    %eax,(%esp)
 820:	e8 25 fb ff ff       	call   34a <kthread_create>
    if (bt->bid != 0) {
 825:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 827:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 829:	74 2d                	je     858 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 82b:	8b 45 08             	mov    0x8(%ebp),%eax
 82e:	89 30                	mov    %esi,(%eax)
        result = 0;
 830:	31 c0                	xor    %eax,%eax
}
 832:	83 c4 10             	add    $0x10,%esp
 835:	5b                   	pop    %ebx
 836:	5e                   	pop    %esi
 837:	5d                   	pop    %ebp
 838:	c3                   	ret    
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 840:	29 c3                	sub    %eax,%ebx
 842:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 848:	89 5e 04             	mov    %ebx,0x4(%esi)
 84b:	eb bc                	jmp    809 <benny_thread_create+0x39>
 84d:	8d 76 00             	lea    0x0(%esi),%esi
 850:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 856:	eb b7                	jmp    80f <benny_thread_create+0x3f>
    int result = -1;
 858:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 85d:	eb d3                	jmp    832 <benny_thread_create+0x62>
        free(bt);
 85f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 862:	31 f6                	xor    %esi,%esi
        free(bt);
 864:	e8 e7 fd ff ff       	call   650 <free>
 869:	8b 5b 04             	mov    0x4(%ebx),%ebx
 86c:	eb a1                	jmp    80f <benny_thread_create+0x3f>
 86e:	66 90                	xchg   %ax,%ax

00000870 <benny_thread_bid>:
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 873:	8b 45 08             	mov    0x8(%ebp),%eax
}
 876:	5d                   	pop    %ebp
    return bt->bid;
 877:	8b 00                	mov    (%eax),%eax
}
 879:	c3                   	ret    
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000880 <benny_thread_join>:
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	53                   	push   %ebx
 884:	83 ec 14             	sub    $0x14,%esp
 887:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 88a:	8b 03                	mov    (%ebx),%eax
 88c:	89 04 24             	mov    %eax,(%esp)
 88f:	e8 be fa ff ff       	call   352 <kthread_join>
    if (retVal == 0) {
 894:	85 c0                	test   %eax,%eax
 896:	75 27                	jne    8bf <benny_thread_join+0x3f>
        free(bt->mem_stack);
 898:	8b 53 08             	mov    0x8(%ebx),%edx
 89b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 89e:	89 14 24             	mov    %edx,(%esp)
 8a1:	e8 aa fd ff ff       	call   650 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 8a6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8ad:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 8b4:	89 1c 24             	mov    %ebx,(%esp)
 8b7:	e8 94 fd ff ff       	call   650 <free>
 8bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8bf:	83 c4 14             	add    $0x14,%esp
 8c2:	5b                   	pop    %ebx
 8c3:	5d                   	pop    %ebp
 8c4:	c3                   	ret    
 8c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008d0 <benny_thread_exit>:
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
}
 8d3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 8d4:	e9 81 fa ff ff       	jmp    35a <kthread_exit>
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 8e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 8ec:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 8f3:	31 c0                	xor    %eax,%eax
 8f5:	5d                   	pop    %ebp
 8f6:	c3                   	ret    
 8f7:	89 f6                	mov    %esi,%esi
 8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000900 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 900:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 901:	b8 01 00 00 00       	mov    $0x1,%eax
 906:	89 e5                	mov    %esp,%ebp
 908:	56                   	push   %esi
 909:	53                   	push   %ebx
 90a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 90d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 910:	85 c0                	test   %eax,%eax
 912:	be 01 00 00 00       	mov    $0x1,%esi
 917:	74 15                	je     92e <benny_mootex_yieldlock+0x2e>
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 920:	e8 45 fa ff ff       	call   36a <kthread_yield>
 925:	89 f0                	mov    %esi,%eax
 927:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 92a:	85 c0                	test   %eax,%eax
 92c:	75 f2                	jne    920 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 92e:	e8 2f fa ff ff       	call   362 <kthread_self>
    benny_mootex->bid = benny_self();
 933:	89 43 04             	mov    %eax,0x4(%ebx)
}
 936:	31 c0                	xor    %eax,%eax
 938:	5b                   	pop    %ebx
 939:	5e                   	pop    %esi
 93a:	5d                   	pop    %ebp
 93b:	c3                   	ret    
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <benny_mootex_spinlock>:
{
 940:	55                   	push   %ebp
 941:	ba 01 00 00 00       	mov    $0x1,%edx
 946:	89 e5                	mov    %esp,%ebp
 948:	53                   	push   %ebx
 949:	83 ec 04             	sub    $0x4,%esp
 94c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 94f:	90                   	nop
 950:	89 d0                	mov    %edx,%eax
 952:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 955:	85 c0                	test   %eax,%eax
 957:	75 f7                	jne    950 <benny_mootex_spinlock+0x10>
    return kthread_self();
 959:	e8 04 fa ff ff       	call   362 <kthread_self>
    benny_mootex->bid = benny_self();
 95e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 961:	83 c4 04             	add    $0x4,%esp
 964:	31 c0                	xor    %eax,%eax
 966:	5b                   	pop    %ebx
 967:	5d                   	pop    %ebp
 968:	c3                   	ret    
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000970 <benny_mootex_unlock>:
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	53                   	push   %ebx
 974:	83 ec 04             	sub    $0x4,%esp
 977:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 97a:	e8 e3 f9 ff ff       	call   362 <kthread_self>
    if(tid == benny_mootex->bid){
 97f:	39 43 04             	cmp    %eax,0x4(%ebx)
 982:	75 1c                	jne    9a0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 984:	0f ae f0             	mfence 
    return 0;
 987:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 989:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 990:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 996:	83 c4 04             	add    $0x4,%esp
 999:	5b                   	pop    %ebx
 99a:	5d                   	pop    %ebp
 99b:	c3                   	ret    
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9a0:	83 c4 04             	add    $0x4,%esp
      return -1;
 9a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 9a8:	5b                   	pop    %ebx
 9a9:	5d                   	pop    %ebp
 9aa:	c3                   	ret    
 9ab:	90                   	nop
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009b0 <benny_mootex_trylock>:
{
 9b0:	55                   	push   %ebp
 9b1:	b8 01 00 00 00       	mov    $0x1,%eax
 9b6:	89 e5                	mov    %esp,%ebp
 9b8:	53                   	push   %ebx
 9b9:	83 ec 04             	sub    $0x4,%esp
 9bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9bf:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 9c2:	85 c0                	test   %eax,%eax
 9c4:	75 08                	jne    9ce <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 9c6:	e8 97 f9 ff ff       	call   362 <kthread_self>
        benny_mootex->bid = tid;
 9cb:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9ce:	83 c4 04             	add    $0x4,%esp
 9d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9d6:	5b                   	pop    %ebx
 9d7:	5d                   	pop    %ebp
 9d8:	c3                   	ret    
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009e0 <benny_mootex_wholock>:
{
 9e0:	55                   	push   %ebp
 9e1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 9e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9e6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 9e7:	8b 40 04             	mov    0x4(%eax),%eax
}
 9ea:	c3                   	ret    
 9eb:	90                   	nop
 9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009f0 <benny_mootex_islocked>:
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 9f3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9f6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 9f7:	8b 00                	mov    (%eax),%eax
}
 9f9:	c3                   	ret    
 9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a00 <benny_self>:
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
}
 a03:	5d                   	pop    %ebp
    return kthread_self();
 a04:	e9 59 f9 ff ff       	jmp    362 <kthread_self>
 a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a10 <benny_yield>:
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
    
}
 a13:	5d                   	pop    %ebp
    return kthread_yield();
 a14:	e9 51 f9 ff ff       	jmp    36a <kthread_yield>
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a20 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 a23:	5d                   	pop    %ebp
    return kthread_cpu_count();
 a24:	e9 49 f9 ff ff       	jmp    372 <kthread_cpu_count>
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_thread_count>:

int
benny_thread_count(void)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 a33:	5d                   	pop    %ebp
    return kthread_thread_count();
 a34:	e9 41 f9 ff ff       	jmp    37a <kthread_thread_count>
