
_thtst6:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}
#endif // KTHREADS

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
#ifdef KTHREADS
    char *ptr = malloc(20);
   9:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  10:	e8 eb 06 00 00       	call   700 <malloc>
    int rez = -17;

    ptr = malloc(20);
  15:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  1c:	e8 df 06 00 00       	call   700 <malloc>

    rez = kthread_create(func1, NULL, ptr);
  21:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  28:	00 
  29:	c7 04 24 70 00 00 00 	movl   $0x70,(%esp)
  30:	89 44 24 08          	mov    %eax,0x8(%esp)
  34:	e8 31 03 00 00       	call   36a <kthread_create>
    printf(1, "%s %d: %d\n", __FILE__, __LINE__, rez);
  39:	c7 44 24 0c 22 00 00 	movl   $0x22,0xc(%esp)
  40:	00 
  41:	c7 44 24 08 59 0a 00 	movl   $0xa59,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 62 0a 00 	movl   $0xa62,0x4(%esp)
  50:	00 
  51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  58:	89 44 24 10          	mov    %eax,0x10(%esp)
  5c:	e8 ef 03 00 00       	call   450 <printf>
#endif // KTHREADS
    exit();
  61:	e8 3c 02 00 00       	call   2a2 <exit>
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <func1>:
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
}
  73:	5d                   	pop    %ebp
    kthread_exit(i);
  74:	e9 01 03 00 00       	jmp    37a <kthread_exit>
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 45 08             	mov    0x8(%ebp),%eax
  86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  89:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 55 08             	mov    0x8(%ebp),%edx
  b6:	53                   	push   %ebx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	74 2d                	je     ee <strcmp+0x3e>
  c1:	0f b6 19             	movzbl (%ecx),%ebx
  c4:	38 d8                	cmp    %bl,%al
  c6:	74 0e                	je     d6 <strcmp+0x26>
  c8:	eb 2b                	jmp    f5 <strcmp+0x45>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	38 c8                	cmp    %cl,%al
  d2:	75 15                	jne    e9 <strcmp+0x39>
    p++, q++;
  d4:	89 d9                	mov    %ebx,%ecx
  d6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  d9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  dc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  e3:	84 c0                	test   %al,%al
  e5:	75 e9                	jne    d0 <strcmp+0x20>
  e7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  e9:	29 c8                	sub    %ecx,%eax
}
  eb:	5b                   	pop    %ebx
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
  f1:	31 c0                	xor    %eax,%eax
  f3:	eb f4                	jmp    e9 <strcmp+0x39>
  f5:	0f b6 cb             	movzbl %bl,%ecx
  f8:	eb ef                	jmp    e9 <strcmp+0x39>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 39 00             	cmpb   $0x0,(%ecx)
 109:	74 12                	je     11d <strlen+0x1d>
 10b:	31 d2                	xor    %edx,%edx
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 11d:	31 c0                	xor    %eax,%eax
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	eb 0d                	jmp    130 <memset>
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	90                   	nop
 12b:	90                   	nop
 12c:	90                   	nop
 12d:	90                   	nop
 12e:	90                   	nop
 12f:	90                   	nop

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	53                   	push   %ebx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 15a:	0f b6 18             	movzbl (%eax),%ebx
 15d:	84 db                	test   %bl,%bl
 15f:	74 1d                	je     17e <strchr+0x2e>
    if(*s == c)
 161:	38 d3                	cmp    %dl,%bl
 163:	89 d1                	mov    %edx,%ecx
 165:	75 0d                	jne    174 <strchr+0x24>
 167:	eb 17                	jmp    180 <strchr+0x30>
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 170:	38 ca                	cmp    %cl,%dl
 172:	74 0c                	je     180 <strchr+0x30>
  for(; *s; s++)
 174:	83 c0 01             	add    $0x1,%eax
 177:	0f b6 10             	movzbl (%eax),%edx
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strchr+0x20>
      return (char*)s;
  return 0;
 17e:	31 c0                	xor    %eax,%eax
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	31 f6                	xor    %esi,%esi
{
 197:	53                   	push   %ebx
 198:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 19b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 19e:	eb 31                	jmp    1d1 <gets+0x41>
    cc = read(0, &c, 1);
 1a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a7:	00 
 1a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b3:	e8 02 01 00 00       	call   2ba <read>
    if(cc < 1)
 1b8:	85 c0                	test   %eax,%eax
 1ba:	7e 1d                	jle    1d9 <gets+0x49>
      break;
    buf[i++] = c;
 1bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 1c0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 1c2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1c5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 1c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cb:	74 0c                	je     1d9 <gets+0x49>
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 08                	je     1d9 <gets+0x49>
  for(i=0; i+1 < max; ){
 1d1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d7:	7c c7                	jl     1a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e0:	83 c4 2c             	add    $0x2c,%esp
 1e3:	5b                   	pop    %ebx
 1e4:	5e                   	pop    %esi
 1e5:	5f                   	pop    %edi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    
 1e8:	90                   	nop
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
 1f5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
 1fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 202:	00 
 203:	89 04 24             	mov    %eax,(%esp)
 206:	e8 d7 00 00 00       	call   2e2 <open>
  if(fd < 0)
 20b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 20d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 20f:	78 27                	js     238 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 211:	8b 45 0c             	mov    0xc(%ebp),%eax
 214:	89 1c 24             	mov    %ebx,(%esp)
 217:	89 44 24 04          	mov    %eax,0x4(%esp)
 21b:	e8 da 00 00 00       	call   2fa <fstat>
  close(fd);
 220:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 223:	89 c6                	mov    %eax,%esi
  close(fd);
 225:	e8 a0 00 00 00       	call   2ca <close>
  return r;
 22a:	89 f0                	mov    %esi,%eax
}
 22c:	83 c4 10             	add    $0x10,%esp
 22f:	5b                   	pop    %ebx
 230:	5e                   	pop    %esi
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	90                   	nop
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23d:	eb ed                	jmp    22c <stat+0x3c>
 23f:	90                   	nop

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
 246:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
  n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 254:	77 17                	ja     26d <atoi+0x2d>
 256:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 258:	83 c1 01             	add    $0x1,%ecx
 25b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 25e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 262:	0f be 11             	movsbl (%ecx),%edx
 265:	8d 5a d0             	lea    -0x30(%edx),%ebx
 268:	80 fb 09             	cmp    $0x9,%bl
 26b:	76 eb                	jbe    258 <atoi+0x18>
  return n;
}
 26d:	5b                   	pop    %ebx
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 270:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 271:	31 d2                	xor    %edx,%edx
{
 273:	89 e5                	mov    %esp,%ebp
 275:	56                   	push   %esi
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	53                   	push   %ebx
 27a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 280:	85 db                	test   %ebx,%ebx
 282:	7e 12                	jle    296 <memmove+0x26>
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 28f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 292:	39 da                	cmp    %ebx,%edx
 294:	75 f2                	jne    288 <memmove+0x18>
  return vdst;
}
 296:	5b                   	pop    %ebx
 297:	5e                   	pop    %esi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    

0000029a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29a:	b8 01 00 00 00       	mov    $0x1,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <exit>:
SYSCALL(exit)
 2a2:	b8 02 00 00 00       	mov    $0x2,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <wait>:
SYSCALL(wait)
 2aa:	b8 03 00 00 00       	mov    $0x3,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <pipe>:
SYSCALL(pipe)
 2b2:	b8 04 00 00 00       	mov    $0x4,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <read>:
SYSCALL(read)
 2ba:	b8 05 00 00 00       	mov    $0x5,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <write>:
SYSCALL(write)
 2c2:	b8 10 00 00 00       	mov    $0x10,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <close>:
SYSCALL(close)
 2ca:	b8 15 00 00 00       	mov    $0x15,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <kill>:
SYSCALL(kill)
 2d2:	b8 06 00 00 00       	mov    $0x6,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <exec>:
SYSCALL(exec)
 2da:	b8 07 00 00 00       	mov    $0x7,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <open>:
SYSCALL(open)
 2e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <mknod>:
SYSCALL(mknod)
 2ea:	b8 11 00 00 00       	mov    $0x11,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <unlink>:
SYSCALL(unlink)
 2f2:	b8 12 00 00 00       	mov    $0x12,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <fstat>:
SYSCALL(fstat)
 2fa:	b8 08 00 00 00       	mov    $0x8,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <link>:
SYSCALL(link)
 302:	b8 13 00 00 00       	mov    $0x13,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <mkdir>:
SYSCALL(mkdir)
 30a:	b8 14 00 00 00       	mov    $0x14,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <chdir>:
SYSCALL(chdir)
 312:	b8 09 00 00 00       	mov    $0x9,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <dup>:
SYSCALL(dup)
 31a:	b8 0a 00 00 00       	mov    $0xa,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <getpid>:
SYSCALL(getpid)
 322:	b8 0b 00 00 00       	mov    $0xb,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <sbrk>:
SYSCALL(sbrk)
 32a:	b8 0c 00 00 00       	mov    $0xc,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <sleep>:
SYSCALL(sleep)
 332:	b8 0d 00 00 00       	mov    $0xd,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <uptime>:
SYSCALL(uptime)
 33a:	b8 0e 00 00 00       	mov    $0xe,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 342:	b8 16 00 00 00       	mov    $0x16,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 34a:	b8 17 00 00 00       	mov    $0x17,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 352:	b8 18 00 00 00       	mov    $0x18,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 35a:	b8 19 00 00 00       	mov    $0x19,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 362:	b8 1a 00 00 00       	mov    $0x1a,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 36a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <kthread_join>:
SYSCALL(kthread_join)
 372:	b8 1c 00 00 00       	mov    $0x1c,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <kthread_exit>:
SYSCALL(kthread_exit)
 37a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 382:	b8 1e 00 00 00       	mov    $0x1e,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <kthread_yield>:
SYSCALL(kthread_yield)
 38a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 392:	b8 20 00 00 00       	mov    $0x20,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 39a:	b8 21 00 00 00       	mov    $0x21,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    
 3a2:	66 90                	xchg   %ax,%ax
 3a4:	66 90                	xchg   %ax,%ax
 3a6:	66 90                	xchg   %ax,%ax
 3a8:	66 90                	xchg   %ax,%ax
 3aa:	66 90                	xchg   %ax,%ax
 3ac:	66 90                	xchg   %ax,%ax
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	89 c6                	mov    %eax,%esi
 3b7:	53                   	push   %ebx
 3b8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3be:	85 db                	test   %ebx,%ebx
 3c0:	74 09                	je     3cb <printint+0x1b>
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	c1 e8 1f             	shr    $0x1f,%eax
 3c7:	84 c0                	test   %al,%al
 3c9:	75 75                	jne    440 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3cb:	89 d0                	mov    %edx,%eax
  neg = 0;
 3cd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3d4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 3d7:	31 ff                	xor    %edi,%edi
 3d9:	89 ce                	mov    %ecx,%esi
 3db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3de:	eb 02                	jmp    3e2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 3e0:	89 cf                	mov    %ecx,%edi
 3e2:	31 d2                	xor    %edx,%edx
 3e4:	f7 f6                	div    %esi
 3e6:	8d 4f 01             	lea    0x1(%edi),%ecx
 3e9:	0f b6 92 74 0a 00 00 	movzbl 0xa74(%edx),%edx
  }while((x /= base) != 0);
 3f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3f2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3f5:	75 e9                	jne    3e0 <printint+0x30>
  if(neg)
 3f7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 3fa:	89 c8                	mov    %ecx,%eax
 3fc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 3ff:	85 d2                	test   %edx,%edx
 401:	74 08                	je     40b <printint+0x5b>
    buf[i++] = '-';
 403:	8d 4f 02             	lea    0x2(%edi),%ecx
 406:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 40b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 40e:	66 90                	xchg   %ax,%ax
 410:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 415:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 418:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 41f:	00 
 420:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 424:	89 34 24             	mov    %esi,(%esp)
 427:	88 45 d7             	mov    %al,-0x29(%ebp)
 42a:	e8 93 fe ff ff       	call   2c2 <write>
  while(--i >= 0)
 42f:	83 ff ff             	cmp    $0xffffffff,%edi
 432:	75 dc                	jne    410 <printint+0x60>
    putc(fd, buf[i]);
}
 434:	83 c4 4c             	add    $0x4c,%esp
 437:	5b                   	pop    %ebx
 438:	5e                   	pop    %esi
 439:	5f                   	pop    %edi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 440:	89 d0                	mov    %edx,%eax
 442:	f7 d8                	neg    %eax
    neg = 1;
 444:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 44b:	eb 87                	jmp    3d4 <printint+0x24>
 44d:	8d 76 00             	lea    0x0(%esi),%esi

00000450 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 454:	31 ff                	xor    %edi,%edi
{
 456:	56                   	push   %esi
 457:	53                   	push   %ebx
 458:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 45b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 45e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 461:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 464:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 467:	0f b6 13             	movzbl (%ebx),%edx
 46a:	83 c3 01             	add    $0x1,%ebx
 46d:	84 d2                	test   %dl,%dl
 46f:	75 39                	jne    4aa <printf+0x5a>
 471:	e9 ca 00 00 00       	jmp    540 <printf+0xf0>
 476:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 478:	83 fa 25             	cmp    $0x25,%edx
 47b:	0f 84 c7 00 00 00    	je     548 <printf+0xf8>
  write(fd, &c, 1);
 481:	8d 45 e0             	lea    -0x20(%ebp),%eax
 484:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48b:	00 
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 493:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 496:	e8 27 fe ff ff       	call   2c2 <write>
 49b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 49e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4a2:	84 d2                	test   %dl,%dl
 4a4:	0f 84 96 00 00 00    	je     540 <printf+0xf0>
    if(state == 0){
 4aa:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 4ac:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 4af:	74 c7                	je     478 <printf+0x28>
      }
    } else if(state == '%'){
 4b1:	83 ff 25             	cmp    $0x25,%edi
 4b4:	75 e5                	jne    49b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 4b6:	83 fa 75             	cmp    $0x75,%edx
 4b9:	0f 84 99 00 00 00    	je     558 <printf+0x108>
 4bf:	83 fa 64             	cmp    $0x64,%edx
 4c2:	0f 84 90 00 00 00    	je     558 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4c8:	25 f7 00 00 00       	and    $0xf7,%eax
 4cd:	83 f8 70             	cmp    $0x70,%eax
 4d0:	0f 84 aa 00 00 00    	je     580 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4d6:	83 fa 73             	cmp    $0x73,%edx
 4d9:	0f 84 e9 00 00 00    	je     5c8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4df:	83 fa 63             	cmp    $0x63,%edx
 4e2:	0f 84 2b 01 00 00    	je     613 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4e8:	83 fa 25             	cmp    $0x25,%edx
 4eb:	0f 84 4f 01 00 00    	je     640 <printf+0x1f0>
  write(fd, &c, 1);
 4f1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4f4:	83 c3 01             	add    $0x1,%ebx
 4f7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4fe:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ff:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 501:	89 44 24 04          	mov    %eax,0x4(%esp)
 505:	89 34 24             	mov    %esi,(%esp)
 508:	89 55 d0             	mov    %edx,-0x30(%ebp)
 50b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 50f:	e8 ae fd ff ff       	call   2c2 <write>
        putc(fd, c);
 514:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 517:	8d 45 e7             	lea    -0x19(%ebp),%eax
 51a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 521:	00 
 522:	89 44 24 04          	mov    %eax,0x4(%esp)
 526:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 529:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 52c:	e8 91 fd ff ff       	call   2c2 <write>
  for(i = 0; fmt[i]; i++){
 531:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 535:	84 d2                	test   %dl,%dl
 537:	0f 85 6d ff ff ff    	jne    4aa <printf+0x5a>
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 540:	83 c4 3c             	add    $0x3c,%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
        state = '%';
 548:	bf 25 00 00 00       	mov    $0x25,%edi
 54d:	e9 49 ff ff ff       	jmp    49b <printf+0x4b>
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 558:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 55f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 564:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 567:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 569:	8b 10                	mov    (%eax),%edx
 56b:	89 f0                	mov    %esi,%eax
 56d:	e8 3e fe ff ff       	call   3b0 <printint>
        ap++;
 572:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 576:	e9 20 ff ff ff       	jmp    49b <printf+0x4b>
 57b:	90                   	nop
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 580:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 583:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 58a:	00 
 58b:	89 44 24 04          	mov    %eax,0x4(%esp)
 58f:	89 34 24             	mov    %esi,(%esp)
 592:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 596:	e8 27 fd ff ff       	call   2c2 <write>
 59b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 59e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a5:	00 
 5a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5aa:	89 34 24             	mov    %esi,(%esp)
 5ad:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 5b1:	e8 0c fd ff ff       	call   2c2 <write>
        printint(fd, *ap, 16, 0);
 5b6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5c2:	eb a0                	jmp    564 <printf+0x114>
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 5cf:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 5d1:	b8 6d 0a 00 00       	mov    $0xa6d,%eax
 5d6:	85 ff                	test   %edi,%edi
 5d8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 5db:	0f b6 07             	movzbl (%edi),%eax
 5de:	84 c0                	test   %al,%al
 5e0:	74 2a                	je     60c <printf+0x1bc>
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5e8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5eb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 5ee:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 5f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f8:	00 
 5f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fd:	89 34 24             	mov    %esi,(%esp)
 600:	e8 bd fc ff ff       	call   2c2 <write>
        while(*s != 0){
 605:	0f b6 07             	movzbl (%edi),%eax
 608:	84 c0                	test   %al,%al
 60a:	75 dc                	jne    5e8 <printf+0x198>
      state = 0;
 60c:	31 ff                	xor    %edi,%edi
 60e:	e9 88 fe ff ff       	jmp    49b <printf+0x4b>
        putc(fd, *ap);
 613:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 616:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 618:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 61a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 621:	00 
 622:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 625:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 628:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 62b:	89 44 24 04          	mov    %eax,0x4(%esp)
 62f:	e8 8e fc ff ff       	call   2c2 <write>
        ap++;
 634:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 638:	e9 5e fe ff ff       	jmp    49b <printf+0x4b>
 63d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 640:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 643:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 645:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 64c:	00 
 64d:	89 44 24 04          	mov    %eax,0x4(%esp)
 651:	89 34 24             	mov    %esi,(%esp)
 654:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 658:	e8 65 fc ff ff       	call   2c2 <write>
 65d:	e9 39 fe ff ff       	jmp    49b <printf+0x4b>
 662:	66 90                	xchg   %ax,%ax
 664:	66 90                	xchg   %ax,%ax
 666:	66 90                	xchg   %ax,%ax
 668:	66 90                	xchg   %ax,%ax
 66a:	66 90                	xchg   %ax,%ax
 66c:	66 90                	xchg   %ax,%ax
 66e:	66 90                	xchg   %ax,%ax

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 1c 0f 00 00       	mov    0xf1c,%eax
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 67e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 680:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 683:	39 d0                	cmp    %edx,%eax
 685:	72 11                	jb     698 <free+0x28>
 687:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 688:	39 c8                	cmp    %ecx,%eax
 68a:	72 04                	jb     690 <free+0x20>
 68c:	39 ca                	cmp    %ecx,%edx
 68e:	72 10                	jb     6a0 <free+0x30>
 690:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 692:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 696:	73 f0                	jae    688 <free+0x18>
 698:	39 ca                	cmp    %ecx,%edx
 69a:	72 04                	jb     6a0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69c:	39 c8                	cmp    %ecx,%eax
 69e:	72 f0                	jb     690 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6a3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 6a6:	39 cf                	cmp    %ecx,%edi
 6a8:	74 1e                	je     6c8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6aa:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ad:	8b 48 04             	mov    0x4(%eax),%ecx
 6b0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6b3:	39 f2                	cmp    %esi,%edx
 6b5:	74 28                	je     6df <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6b7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6b9:	a3 1c 0f 00 00       	mov    %eax,0xf1c
}
 6be:	5b                   	pop    %ebx
 6bf:	5e                   	pop    %esi
 6c0:	5f                   	pop    %edi
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    
 6c3:	90                   	nop
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6c8:	03 71 04             	add    0x4(%ecx),%esi
 6cb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ce:	8b 08                	mov    (%eax),%ecx
 6d0:	8b 09                	mov    (%ecx),%ecx
 6d2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6d5:	8b 48 04             	mov    0x4(%eax),%ecx
 6d8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6db:	39 f2                	cmp    %esi,%edx
 6dd:	75 d8                	jne    6b7 <free+0x47>
    p->s.size += bp->s.size;
 6df:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 6e2:	a3 1c 0f 00 00       	mov    %eax,0xf1c
    p->s.size += bp->s.size;
 6e7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ea:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6ed:	89 10                	mov    %edx,(%eax)
}
 6ef:	5b                   	pop    %ebx
 6f0:	5e                   	pop    %esi
 6f1:	5f                   	pop    %edi
 6f2:	5d                   	pop    %ebp
 6f3:	c3                   	ret    
 6f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 70c:	8b 1d 1c 0f 00 00    	mov    0xf1c,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8d 48 07             	lea    0x7(%eax),%ecx
 715:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 718:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 71a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 71d:	0f 84 9b 00 00 00    	je     7be <malloc+0xbe>
 723:	8b 13                	mov    (%ebx),%edx
 725:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 728:	39 fe                	cmp    %edi,%esi
 72a:	76 64                	jbe    790 <malloc+0x90>
 72c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 733:	bb 00 80 00 00       	mov    $0x8000,%ebx
 738:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 73b:	eb 0e                	jmp    74b <malloc+0x4b>
 73d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 740:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 742:	8b 78 04             	mov    0x4(%eax),%edi
 745:	39 fe                	cmp    %edi,%esi
 747:	76 4f                	jbe    798 <malloc+0x98>
 749:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 74b:	3b 15 1c 0f 00 00    	cmp    0xf1c,%edx
 751:	75 ed                	jne    740 <malloc+0x40>
  if(nu < 4096)
 753:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 756:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 75c:	bf 00 10 00 00       	mov    $0x1000,%edi
 761:	0f 43 fe             	cmovae %esi,%edi
 764:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 767:	89 04 24             	mov    %eax,(%esp)
 76a:	e8 bb fb ff ff       	call   32a <sbrk>
  if(p == (char*)-1)
 76f:	83 f8 ff             	cmp    $0xffffffff,%eax
 772:	74 18                	je     78c <malloc+0x8c>
  hp->s.size = nu;
 774:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 777:	83 c0 08             	add    $0x8,%eax
 77a:	89 04 24             	mov    %eax,(%esp)
 77d:	e8 ee fe ff ff       	call   670 <free>
  return freep;
 782:	8b 15 1c 0f 00 00    	mov    0xf1c,%edx
      if((p = morecore(nunits)) == 0)
 788:	85 d2                	test   %edx,%edx
 78a:	75 b4                	jne    740 <malloc+0x40>
        return 0;
 78c:	31 c0                	xor    %eax,%eax
 78e:	eb 20                	jmp    7b0 <malloc+0xb0>
    if(p->s.size >= nunits){
 790:	89 d0                	mov    %edx,%eax
 792:	89 da                	mov    %ebx,%edx
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 798:	39 fe                	cmp    %edi,%esi
 79a:	74 1c                	je     7b8 <malloc+0xb8>
        p->s.size -= nunits;
 79c:	29 f7                	sub    %esi,%edi
 79e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 7a1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 7a4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7a7:	89 15 1c 0f 00 00    	mov    %edx,0xf1c
      return (void*)(p + 1);
 7ad:	83 c0 08             	add    $0x8,%eax
  }
}
 7b0:	83 c4 1c             	add    $0x1c,%esp
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7b8:	8b 08                	mov    (%eax),%ecx
 7ba:	89 0a                	mov    %ecx,(%edx)
 7bc:	eb e9                	jmp    7a7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 7be:	c7 05 1c 0f 00 00 20 	movl   $0xf20,0xf1c
 7c5:	0f 00 00 
    base.s.size = 0;
 7c8:	ba 20 0f 00 00       	mov    $0xf20,%edx
    base.s.ptr = freep = prevp = &base;
 7cd:	c7 05 20 0f 00 00 20 	movl   $0xf20,0xf20
 7d4:	0f 00 00 
    base.s.size = 0;
 7d7:	c7 05 24 0f 00 00 00 	movl   $0x0,0xf24
 7de:	00 00 00 
 7e1:	e9 46 ff ff ff       	jmp    72c <malloc+0x2c>
 7e6:	66 90                	xchg   %ax,%ax
 7e8:	66 90                	xchg   %ax,%ax
 7ea:	66 90                	xchg   %ax,%ax
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	56                   	push   %esi
 7f4:	53                   	push   %ebx
 7f5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 7f8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 7ff:	e8 fc fe ff ff       	call   700 <malloc>

    if (bt == NULL) {
 804:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 806:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 808:	74 66                	je     870 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 80a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 811:	e8 ea fe ff ff       	call   700 <malloc>
    if (bt->bt_stack == NULL) {
 816:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 818:	89 c3                	mov    %eax,%ebx
 81a:	89 46 08             	mov    %eax,0x8(%esi)
 81d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 820:	74 5d                	je     87f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 822:	25 ff 0f 00 00       	and    $0xfff,%eax
 827:	75 37                	jne    860 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 829:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 82f:	8b 45 10             	mov    0x10(%ebp),%eax
 832:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 836:	89 44 24 04          	mov    %eax,0x4(%esp)
 83a:	8b 45 0c             	mov    0xc(%ebp),%eax
 83d:	89 04 24             	mov    %eax,(%esp)
 840:	e8 25 fb ff ff       	call   36a <kthread_create>
    if (bt->bid != 0) {
 845:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 847:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 849:	74 2d                	je     878 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	89 30                	mov    %esi,(%eax)
        result = 0;
 850:	31 c0                	xor    %eax,%eax
}
 852:	83 c4 10             	add    $0x10,%esp
 855:	5b                   	pop    %ebx
 856:	5e                   	pop    %esi
 857:	5d                   	pop    %ebp
 858:	c3                   	ret    
 859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 860:	29 c3                	sub    %eax,%ebx
 862:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 868:	89 5e 04             	mov    %ebx,0x4(%esi)
 86b:	eb bc                	jmp    829 <benny_thread_create+0x39>
 86d:	8d 76 00             	lea    0x0(%esi),%esi
 870:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 876:	eb b7                	jmp    82f <benny_thread_create+0x3f>
    int result = -1;
 878:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 87d:	eb d3                	jmp    852 <benny_thread_create+0x62>
        free(bt);
 87f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 882:	31 f6                	xor    %esi,%esi
        free(bt);
 884:	e8 e7 fd ff ff       	call   670 <free>
 889:	8b 5b 04             	mov    0x4(%ebx),%ebx
 88c:	eb a1                	jmp    82f <benny_thread_create+0x3f>
 88e:	66 90                	xchg   %ax,%ax

00000890 <benny_thread_bid>:
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 893:	8b 45 08             	mov    0x8(%ebp),%eax
}
 896:	5d                   	pop    %ebp
    return bt->bid;
 897:	8b 00                	mov    (%eax),%eax
}
 899:	c3                   	ret    
 89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008a0 <benny_thread_join>:
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	53                   	push   %ebx
 8a4:	83 ec 14             	sub    $0x14,%esp
 8a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 8aa:	8b 03                	mov    (%ebx),%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 be fa ff ff       	call   372 <kthread_join>
    if (retVal == 0) {
 8b4:	85 c0                	test   %eax,%eax
 8b6:	75 27                	jne    8df <benny_thread_join+0x3f>
        free(bt->mem_stack);
 8b8:	8b 53 08             	mov    0x8(%ebx),%edx
 8bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8be:	89 14 24             	mov    %edx,(%esp)
 8c1:	e8 aa fd ff ff       	call   670 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 8c6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8cd:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 8d4:	89 1c 24             	mov    %ebx,(%esp)
 8d7:	e8 94 fd ff ff       	call   670 <free>
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8df:	83 c4 14             	add    $0x14,%esp
 8e2:	5b                   	pop    %ebx
 8e3:	5d                   	pop    %ebp
 8e4:	c3                   	ret    
 8e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008f0 <benny_thread_exit>:
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
}
 8f3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 8f4:	e9 81 fa ff ff       	jmp    37a <kthread_exit>
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 906:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 90c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 913:	31 c0                	xor    %eax,%eax
 915:	5d                   	pop    %ebp
 916:	c3                   	ret    
 917:	89 f6                	mov    %esi,%esi
 919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 920:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 921:	b8 01 00 00 00       	mov    $0x1,%eax
 926:	89 e5                	mov    %esp,%ebp
 928:	56                   	push   %esi
 929:	53                   	push   %ebx
 92a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 92d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 930:	85 c0                	test   %eax,%eax
 932:	be 01 00 00 00       	mov    $0x1,%esi
 937:	74 15                	je     94e <benny_mootex_yieldlock+0x2e>
 939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 940:	e8 45 fa ff ff       	call   38a <kthread_yield>
 945:	89 f0                	mov    %esi,%eax
 947:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 94a:	85 c0                	test   %eax,%eax
 94c:	75 f2                	jne    940 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 94e:	e8 2f fa ff ff       	call   382 <kthread_self>
    benny_mootex->bid = benny_self();
 953:	89 43 04             	mov    %eax,0x4(%ebx)
}
 956:	31 c0                	xor    %eax,%eax
 958:	5b                   	pop    %ebx
 959:	5e                   	pop    %esi
 95a:	5d                   	pop    %ebp
 95b:	c3                   	ret    
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000960 <benny_mootex_spinlock>:
{
 960:	55                   	push   %ebp
 961:	ba 01 00 00 00       	mov    $0x1,%edx
 966:	89 e5                	mov    %esp,%ebp
 968:	53                   	push   %ebx
 969:	83 ec 04             	sub    $0x4,%esp
 96c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 96f:	90                   	nop
 970:	89 d0                	mov    %edx,%eax
 972:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 975:	85 c0                	test   %eax,%eax
 977:	75 f7                	jne    970 <benny_mootex_spinlock+0x10>
    return kthread_self();
 979:	e8 04 fa ff ff       	call   382 <kthread_self>
    benny_mootex->bid = benny_self();
 97e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 981:	83 c4 04             	add    $0x4,%esp
 984:	31 c0                	xor    %eax,%eax
 986:	5b                   	pop    %ebx
 987:	5d                   	pop    %ebp
 988:	c3                   	ret    
 989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000990 <benny_mootex_unlock>:
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	53                   	push   %ebx
 994:	83 ec 04             	sub    $0x4,%esp
 997:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 99a:	e8 e3 f9 ff ff       	call   382 <kthread_self>
    if(tid == benny_mootex->bid){
 99f:	39 43 04             	cmp    %eax,0x4(%ebx)
 9a2:	75 1c                	jne    9c0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 9a4:	0f ae f0             	mfence 
    return 0;
 9a7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 9a9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 9b0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 9b6:	83 c4 04             	add    $0x4,%esp
 9b9:	5b                   	pop    %ebx
 9ba:	5d                   	pop    %ebp
 9bb:	c3                   	ret    
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9c0:	83 c4 04             	add    $0x4,%esp
      return -1;
 9c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 9c8:	5b                   	pop    %ebx
 9c9:	5d                   	pop    %ebp
 9ca:	c3                   	ret    
 9cb:	90                   	nop
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009d0 <benny_mootex_trylock>:
{
 9d0:	55                   	push   %ebp
 9d1:	b8 01 00 00 00       	mov    $0x1,%eax
 9d6:	89 e5                	mov    %esp,%ebp
 9d8:	53                   	push   %ebx
 9d9:	83 ec 04             	sub    $0x4,%esp
 9dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9df:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 9e2:	85 c0                	test   %eax,%eax
 9e4:	75 08                	jne    9ee <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 9e6:	e8 97 f9 ff ff       	call   382 <kthread_self>
        benny_mootex->bid = tid;
 9eb:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9ee:	83 c4 04             	add    $0x4,%esp
 9f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9f6:	5b                   	pop    %ebx
 9f7:	5d                   	pop    %ebp
 9f8:	c3                   	ret    
 9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a00 <benny_mootex_wholock>:
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 a03:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a06:	5d                   	pop    %ebp
    return benny_mootex->bid;
 a07:	8b 40 04             	mov    0x4(%eax),%eax
}
 a0a:	c3                   	ret    
 a0b:	90                   	nop
 a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a10 <benny_mootex_islocked>:
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 a13:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a16:	5d                   	pop    %ebp
    return benny_mootex->locked;
 a17:	8b 00                	mov    (%eax),%eax
}
 a19:	c3                   	ret    
 a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a20 <benny_self>:
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
}
 a23:	5d                   	pop    %ebp
    return kthread_self();
 a24:	e9 59 f9 ff ff       	jmp    382 <kthread_self>
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_yield>:
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
    
}
 a33:	5d                   	pop    %ebp
    return kthread_yield();
 a34:	e9 51 f9 ff ff       	jmp    38a <kthread_yield>
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a40 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 a43:	5d                   	pop    %ebp
    return kthread_cpu_count();
 a44:	e9 49 f9 ff ff       	jmp    392 <kthread_cpu_count>
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a50 <benny_thread_count>:

int
benny_thread_count(void)
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 a53:	5d                   	pop    %ebp
    return kthread_thread_count();
 a54:	e9 41 f9 ff ff       	jmp    39a <kthread_thread_count>
