
_mfork:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *exec_args[] = {"mult", '\0'};

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 e4 f0             	and    $0xfffffff0,%esp
   8:	83 ec 10             	sub    $0x10,%esp
  int i;
  int max = 5;
  int pid = 0;

  if (argc > 1) {
   b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   f:	7e 79                	jle    8a <main+0x8a>
    max = atoi(argv[1]);
  11:	8b 45 0c             	mov    0xc(%ebp),%eax
  14:	8b 40 04             	mov    0x4(%eax),%eax
  17:	89 04 24             	mov    %eax,(%esp)
  1a:	e8 51 02 00 00       	call   270 <atoi>
  }
  printf(1, "forking %d processes\n", max);
  1f:	c7 44 24 04 89 0a 00 	movl   $0xa89,0x4(%esp)
  26:	00 
  27:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    max = atoi(argv[1]);
  2e:	89 c6                	mov    %eax,%esi
  printf(1, "forking %d processes\n", max);
  30:	89 44 24 08          	mov    %eax,0x8(%esp)
  34:	e8 47 04 00 00       	call   480 <printf>

  for (i = 0; i < max; i++) {
  39:	85 f6                	test   %esi,%esi
  3b:	7e 48                	jle    85 <main+0x85>
{
  3d:	31 db                	xor    %ebx,%ebx
  3f:	eb 0e                	jmp    4f <main+0x4f>
  41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < max; i++) {
  48:	83 c3 01             	add    $0x1,%ebx
  4b:	39 f3                	cmp    %esi,%ebx
  4d:	7d 36                	jge    85 <main+0x85>
    pid = fork();
  4f:	e8 76 02 00 00       	call   2ca <fork>
    if (pid == 0) {
  54:	85 c0                	test   %eax,%eax
  56:	75 f0                	jne    48 <main+0x48>
      exec(exec_args[0], exec_args);
  58:	a1 50 0f 00 00       	mov    0xf50,%eax
  5d:	c7 44 24 04 50 0f 00 	movl   $0xf50,0x4(%esp)
  64:	00 
  65:	89 04 24             	mov    %eax,(%esp)
  68:	e8 9d 02 00 00       	call   30a <exec>
      printf(1, "fork failed for process %d\n", i);
  6d:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  71:	c7 44 24 04 9f 0a 00 	movl   $0xa9f,0x4(%esp)
  78:	00 
  79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  80:	e8 fb 03 00 00       	call   480 <printf>
      exit();
  85:	e8 48 02 00 00       	call   2d2 <exit>
  printf(1, "forking %d processes\n", max);
  8a:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
  91:	00 
  int max = 5;
  92:	be 05 00 00 00       	mov    $0x5,%esi
  printf(1, "forking %d processes\n", max);
  97:	c7 44 24 04 89 0a 00 	movl   $0xa89,0x4(%esp)
  9e:	00 
  9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a6:	e8 d5 03 00 00       	call   480 <printf>
  ab:	eb 90                	jmp    3d <main+0x3d>
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  b9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ba:	89 c2                	mov    %eax,%edx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c0:	83 c1 01             	add    $0x1,%ecx
  c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  c7:	83 c2 01             	add    $0x1,%edx
  ca:	84 db                	test   %bl,%bl
  cc:	88 5a ff             	mov    %bl,-0x1(%edx)
  cf:	75 ef                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  d1:	5b                   	pop    %ebx
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    
  d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  e6:	53                   	push   %ebx
  e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ea:	0f b6 02             	movzbl (%edx),%eax
  ed:	84 c0                	test   %al,%al
  ef:	74 2d                	je     11e <strcmp+0x3e>
  f1:	0f b6 19             	movzbl (%ecx),%ebx
  f4:	38 d8                	cmp    %bl,%al
  f6:	74 0e                	je     106 <strcmp+0x26>
  f8:	eb 2b                	jmp    125 <strcmp+0x45>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 100:	38 c8                	cmp    %cl,%al
 102:	75 15                	jne    119 <strcmp+0x39>
    p++, q++;
 104:	89 d9                	mov    %ebx,%ecx
 106:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 109:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 10c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 10f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 113:	84 c0                	test   %al,%al
 115:	75 e9                	jne    100 <strcmp+0x20>
 117:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 119:	29 c8                	sub    %ecx,%eax
}
 11b:	5b                   	pop    %ebx
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    
 11e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 121:	31 c0                	xor    %eax,%eax
 123:	eb f4                	jmp    119 <strcmp+0x39>
 125:	0f b6 cb             	movzbl %bl,%ecx
 128:	eb ef                	jmp    119 <strcmp+0x39>
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000130 <strlen>:

uint
strlen(const char *s)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 136:	80 39 00             	cmpb   $0x0,(%ecx)
 139:	74 12                	je     14d <strlen+0x1d>
 13b:	31 d2                	xor    %edx,%edx
 13d:	8d 76 00             	lea    0x0(%esi),%esi
 140:	83 c2 01             	add    $0x1,%edx
 143:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 147:	89 d0                	mov    %edx,%eax
 149:	75 f5                	jne    140 <strlen+0x10>
    ;
  return n;
}
 14b:	5d                   	pop    %ebp
 14c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 14d:	31 c0                	xor    %eax,%eax
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    
 151:	eb 0d                	jmp    160 <memset>
 153:	90                   	nop
 154:	90                   	nop
 155:	90                   	nop
 156:	90                   	nop
 157:	90                   	nop
 158:	90                   	nop
 159:	90                   	nop
 15a:	90                   	nop
 15b:	90                   	nop
 15c:	90                   	nop
 15d:	90                   	nop
 15e:	90                   	nop
 15f:	90                   	nop

00000160 <memset>:

void*
memset(void *dst, int c, uint n)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 55 08             	mov    0x8(%ebp),%edx
 166:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 167:	8b 4d 10             	mov    0x10(%ebp),%ecx
 16a:	8b 45 0c             	mov    0xc(%ebp),%eax
 16d:	89 d7                	mov    %edx,%edi
 16f:	fc                   	cld    
 170:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 172:	89 d0                	mov    %edx,%eax
 174:	5f                   	pop    %edi
 175:	5d                   	pop    %ebp
 176:	c3                   	ret    
 177:	89 f6                	mov    %esi,%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	53                   	push   %ebx
 187:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 18a:	0f b6 18             	movzbl (%eax),%ebx
 18d:	84 db                	test   %bl,%bl
 18f:	74 1d                	je     1ae <strchr+0x2e>
    if(*s == c)
 191:	38 d3                	cmp    %dl,%bl
 193:	89 d1                	mov    %edx,%ecx
 195:	75 0d                	jne    1a4 <strchr+0x24>
 197:	eb 17                	jmp    1b0 <strchr+0x30>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a0:	38 ca                	cmp    %cl,%dl
 1a2:	74 0c                	je     1b0 <strchr+0x30>
  for(; *s; s++)
 1a4:	83 c0 01             	add    $0x1,%eax
 1a7:	0f b6 10             	movzbl (%eax),%edx
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strchr+0x20>
      return (char*)s;
  return 0;
 1ae:	31 c0                	xor    %eax,%eax
}
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <gets>:

char*
gets(char *buf, int max)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c5:	31 f6                	xor    %esi,%esi
{
 1c7:	53                   	push   %ebx
 1c8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 1cb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1ce:	eb 31                	jmp    201 <gets+0x41>
    cc = read(0, &c, 1);
 1d0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1d7:	00 
 1d8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e3:	e8 02 01 00 00       	call   2ea <read>
    if(cc < 1)
 1e8:	85 c0                	test   %eax,%eax
 1ea:	7e 1d                	jle    209 <gets+0x49>
      break;
    buf[i++] = c;
 1ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 1f0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 1f2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1f5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 1f7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1fb:	74 0c                	je     209 <gets+0x49>
 1fd:	3c 0a                	cmp    $0xa,%al
 1ff:	74 08                	je     209 <gets+0x49>
  for(i=0; i+1 < max; ){
 201:	8d 5e 01             	lea    0x1(%esi),%ebx
 204:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 207:	7c c7                	jl     1d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 210:	83 c4 2c             	add    $0x2c,%esp
 213:	5b                   	pop    %ebx
 214:	5e                   	pop    %esi
 215:	5f                   	pop    %edi
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    
 218:	90                   	nop
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <stat>:

int
stat(const char *n, struct stat *st)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 232:	00 
 233:	89 04 24             	mov    %eax,(%esp)
 236:	e8 d7 00 00 00       	call   312 <open>
  if(fd < 0)
 23b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 23d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 23f:	78 27                	js     268 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 241:	8b 45 0c             	mov    0xc(%ebp),%eax
 244:	89 1c 24             	mov    %ebx,(%esp)
 247:	89 44 24 04          	mov    %eax,0x4(%esp)
 24b:	e8 da 00 00 00       	call   32a <fstat>
  close(fd);
 250:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 253:	89 c6                	mov    %eax,%esi
  close(fd);
 255:	e8 a0 00 00 00       	call   2fa <close>
  return r;
 25a:	89 f0                	mov    %esi,%eax
}
 25c:	83 c4 10             	add    $0x10,%esp
 25f:	5b                   	pop    %ebx
 260:	5e                   	pop    %esi
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	90                   	nop
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 268:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 26d:	eb ed                	jmp    25c <stat+0x3c>
 26f:	90                   	nop

00000270 <atoi>:

int
atoi(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 4d 08             	mov    0x8(%ebp),%ecx
 276:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 277:	0f be 11             	movsbl (%ecx),%edx
 27a:	8d 42 d0             	lea    -0x30(%edx),%eax
 27d:	3c 09                	cmp    $0x9,%al
  n = 0;
 27f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 284:	77 17                	ja     29d <atoi+0x2d>
 286:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 288:	83 c1 01             	add    $0x1,%ecx
 28b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 28e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 292:	0f be 11             	movsbl (%ecx),%edx
 295:	8d 5a d0             	lea    -0x30(%edx),%ebx
 298:	80 fb 09             	cmp    $0x9,%bl
 29b:	76 eb                	jbe    288 <atoi+0x18>
  return n;
}
 29d:	5b                   	pop    %ebx
 29e:	5d                   	pop    %ebp
 29f:	c3                   	ret    

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a1:	31 d2                	xor    %edx,%edx
{
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	56                   	push   %esi
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	53                   	push   %ebx
 2aa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2ad:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 2b0:	85 db                	test   %ebx,%ebx
 2b2:	7e 12                	jle    2c6 <memmove+0x26>
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2c2:	39 da                	cmp    %ebx,%edx
 2c4:	75 f2                	jne    2b8 <memmove+0x18>
  return vdst;
}
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    

000002ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ca:	b8 01 00 00 00       	mov    $0x1,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <exit>:
SYSCALL(exit)
 2d2:	b8 02 00 00 00       	mov    $0x2,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <wait>:
SYSCALL(wait)
 2da:	b8 03 00 00 00       	mov    $0x3,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <pipe>:
SYSCALL(pipe)
 2e2:	b8 04 00 00 00       	mov    $0x4,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <read>:
SYSCALL(read)
 2ea:	b8 05 00 00 00       	mov    $0x5,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <write>:
SYSCALL(write)
 2f2:	b8 10 00 00 00       	mov    $0x10,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <close>:
SYSCALL(close)
 2fa:	b8 15 00 00 00       	mov    $0x15,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <kill>:
SYSCALL(kill)
 302:	b8 06 00 00 00       	mov    $0x6,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <exec>:
SYSCALL(exec)
 30a:	b8 07 00 00 00       	mov    $0x7,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <open>:
SYSCALL(open)
 312:	b8 0f 00 00 00       	mov    $0xf,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <mknod>:
SYSCALL(mknod)
 31a:	b8 11 00 00 00       	mov    $0x11,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <unlink>:
SYSCALL(unlink)
 322:	b8 12 00 00 00       	mov    $0x12,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <fstat>:
SYSCALL(fstat)
 32a:	b8 08 00 00 00       	mov    $0x8,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <link>:
SYSCALL(link)
 332:	b8 13 00 00 00       	mov    $0x13,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <mkdir>:
SYSCALL(mkdir)
 33a:	b8 14 00 00 00       	mov    $0x14,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <chdir>:
SYSCALL(chdir)
 342:	b8 09 00 00 00       	mov    $0x9,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <dup>:
SYSCALL(dup)
 34a:	b8 0a 00 00 00       	mov    $0xa,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <getpid>:
SYSCALL(getpid)
 352:	b8 0b 00 00 00       	mov    $0xb,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <sbrk>:
SYSCALL(sbrk)
 35a:	b8 0c 00 00 00       	mov    $0xc,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <sleep>:
SYSCALL(sleep)
 362:	b8 0d 00 00 00       	mov    $0xd,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <uptime>:
SYSCALL(uptime)
 36a:	b8 0e 00 00 00       	mov    $0xe,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 372:	b8 16 00 00 00       	mov    $0x16,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 37a:	b8 17 00 00 00       	mov    $0x17,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 382:	b8 18 00 00 00       	mov    $0x18,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 38a:	b8 19 00 00 00       	mov    $0x19,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 392:	b8 1a 00 00 00       	mov    $0x1a,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 39a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <kthread_join>:
SYSCALL(kthread_join)
 3a2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <kthread_exit>:
SYSCALL(kthread_exit)
 3aa:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 3b2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <kthread_yield>:
SYSCALL(kthread_yield)
 3ba:	b8 1f 00 00 00       	mov    $0x1f,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 3c2:	b8 20 00 00 00       	mov    $0x20,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 3ca:	b8 21 00 00 00       	mov    $0x21,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    
 3d2:	66 90                	xchg   %ax,%ax
 3d4:	66 90                	xchg   %ax,%ax
 3d6:	66 90                	xchg   %ax,%ax
 3d8:	66 90                	xchg   %ax,%ax
 3da:	66 90                	xchg   %ax,%ax
 3dc:	66 90                	xchg   %ax,%ax
 3de:	66 90                	xchg   %ax,%ax

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	89 c6                	mov    %eax,%esi
 3e7:	53                   	push   %ebx
 3e8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3ee:	85 db                	test   %ebx,%ebx
 3f0:	74 09                	je     3fb <printint+0x1b>
 3f2:	89 d0                	mov    %edx,%eax
 3f4:	c1 e8 1f             	shr    $0x1f,%eax
 3f7:	84 c0                	test   %al,%al
 3f9:	75 75                	jne    470 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3fb:	89 d0                	mov    %edx,%eax
  neg = 0;
 3fd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 404:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 407:	31 ff                	xor    %edi,%edi
 409:	89 ce                	mov    %ecx,%esi
 40b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 40e:	eb 02                	jmp    412 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 410:	89 cf                	mov    %ecx,%edi
 412:	31 d2                	xor    %edx,%edx
 414:	f7 f6                	div    %esi
 416:	8d 4f 01             	lea    0x1(%edi),%ecx
 419:	0f b6 92 c7 0a 00 00 	movzbl 0xac7(%edx),%edx
  }while((x /= base) != 0);
 420:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 422:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 425:	75 e9                	jne    410 <printint+0x30>
  if(neg)
 427:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 42a:	89 c8                	mov    %ecx,%eax
 42c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 42f:	85 d2                	test   %edx,%edx
 431:	74 08                	je     43b <printint+0x5b>
    buf[i++] = '-';
 433:	8d 4f 02             	lea    0x2(%edi),%ecx
 436:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 43b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 43e:	66 90                	xchg   %ax,%ax
 440:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 445:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 448:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44f:	00 
 450:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 454:	89 34 24             	mov    %esi,(%esp)
 457:	88 45 d7             	mov    %al,-0x29(%ebp)
 45a:	e8 93 fe ff ff       	call   2f2 <write>
  while(--i >= 0)
 45f:	83 ff ff             	cmp    $0xffffffff,%edi
 462:	75 dc                	jne    440 <printint+0x60>
    putc(fd, buf[i]);
}
 464:	83 c4 4c             	add    $0x4c,%esp
 467:	5b                   	pop    %ebx
 468:	5e                   	pop    %esi
 469:	5f                   	pop    %edi
 46a:	5d                   	pop    %ebp
 46b:	c3                   	ret    
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 470:	89 d0                	mov    %edx,%eax
 472:	f7 d8                	neg    %eax
    neg = 1;
 474:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 47b:	eb 87                	jmp    404 <printint+0x24>
 47d:	8d 76 00             	lea    0x0(%esi),%esi

00000480 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 484:	31 ff                	xor    %edi,%edi
{
 486:	56                   	push   %esi
 487:	53                   	push   %ebx
 488:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 48b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 48e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 491:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 494:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 497:	0f b6 13             	movzbl (%ebx),%edx
 49a:	83 c3 01             	add    $0x1,%ebx
 49d:	84 d2                	test   %dl,%dl
 49f:	75 39                	jne    4da <printf+0x5a>
 4a1:	e9 ca 00 00 00       	jmp    570 <printf+0xf0>
 4a6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4a8:	83 fa 25             	cmp    $0x25,%edx
 4ab:	0f 84 c7 00 00 00    	je     578 <printf+0xf8>
  write(fd, &c, 1);
 4b1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 4b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4bb:	00 
 4bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 4c3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 4c6:	e8 27 fe ff ff       	call   2f2 <write>
 4cb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 4ce:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4d2:	84 d2                	test   %dl,%dl
 4d4:	0f 84 96 00 00 00    	je     570 <printf+0xf0>
    if(state == 0){
 4da:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 4dc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 4df:	74 c7                	je     4a8 <printf+0x28>
      }
    } else if(state == '%'){
 4e1:	83 ff 25             	cmp    $0x25,%edi
 4e4:	75 e5                	jne    4cb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 4e6:	83 fa 75             	cmp    $0x75,%edx
 4e9:	0f 84 99 00 00 00    	je     588 <printf+0x108>
 4ef:	83 fa 64             	cmp    $0x64,%edx
 4f2:	0f 84 90 00 00 00    	je     588 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4f8:	25 f7 00 00 00       	and    $0xf7,%eax
 4fd:	83 f8 70             	cmp    $0x70,%eax
 500:	0f 84 aa 00 00 00    	je     5b0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 506:	83 fa 73             	cmp    $0x73,%edx
 509:	0f 84 e9 00 00 00    	je     5f8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 50f:	83 fa 63             	cmp    $0x63,%edx
 512:	0f 84 2b 01 00 00    	je     643 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 518:	83 fa 25             	cmp    $0x25,%edx
 51b:	0f 84 4f 01 00 00    	je     670 <printf+0x1f0>
  write(fd, &c, 1);
 521:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 524:	83 c3 01             	add    $0x1,%ebx
 527:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 52f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 531:	89 44 24 04          	mov    %eax,0x4(%esp)
 535:	89 34 24             	mov    %esi,(%esp)
 538:	89 55 d0             	mov    %edx,-0x30(%ebp)
 53b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 53f:	e8 ae fd ff ff       	call   2f2 <write>
        putc(fd, c);
 544:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 547:	8d 45 e7             	lea    -0x19(%ebp),%eax
 54a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 551:	00 
 552:	89 44 24 04          	mov    %eax,0x4(%esp)
 556:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 559:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 55c:	e8 91 fd ff ff       	call   2f2 <write>
  for(i = 0; fmt[i]; i++){
 561:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 565:	84 d2                	test   %dl,%dl
 567:	0f 85 6d ff ff ff    	jne    4da <printf+0x5a>
 56d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 570:	83 c4 3c             	add    $0x3c,%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5f                   	pop    %edi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
        state = '%';
 578:	bf 25 00 00 00       	mov    $0x25,%edi
 57d:	e9 49 ff ff ff       	jmp    4cb <printf+0x4b>
 582:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 588:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 58f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 594:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 597:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 599:	8b 10                	mov    (%eax),%edx
 59b:	89 f0                	mov    %esi,%eax
 59d:	e8 3e fe ff ff       	call   3e0 <printint>
        ap++;
 5a2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5a6:	e9 20 ff ff ff       	jmp    4cb <printf+0x4b>
 5ab:	90                   	nop
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5b0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 5b3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5ba:	00 
 5bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bf:	89 34 24             	mov    %esi,(%esp)
 5c2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 5c6:	e8 27 fd ff ff       	call   2f2 <write>
 5cb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d5:	00 
 5d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5da:	89 34 24             	mov    %esi,(%esp)
 5dd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 5e1:	e8 0c fd ff ff       	call   2f2 <write>
        printint(fd, *ap, 16, 0);
 5e6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5f2:	eb a0                	jmp    594 <printf+0x114>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5fb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 5ff:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 601:	b8 c0 0a 00 00       	mov    $0xac0,%eax
 606:	85 ff                	test   %edi,%edi
 608:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 60b:	0f b6 07             	movzbl (%edi),%eax
 60e:	84 c0                	test   %al,%al
 610:	74 2a                	je     63c <printf+0x1bc>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 618:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 61b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 61e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 621:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 628:	00 
 629:	89 44 24 04          	mov    %eax,0x4(%esp)
 62d:	89 34 24             	mov    %esi,(%esp)
 630:	e8 bd fc ff ff       	call   2f2 <write>
        while(*s != 0){
 635:	0f b6 07             	movzbl (%edi),%eax
 638:	84 c0                	test   %al,%al
 63a:	75 dc                	jne    618 <printf+0x198>
      state = 0;
 63c:	31 ff                	xor    %edi,%edi
 63e:	e9 88 fe ff ff       	jmp    4cb <printf+0x4b>
        putc(fd, *ap);
 643:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 646:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 648:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 64a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 651:	00 
 652:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 655:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 658:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 65b:	89 44 24 04          	mov    %eax,0x4(%esp)
 65f:	e8 8e fc ff ff       	call   2f2 <write>
        ap++;
 664:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 668:	e9 5e fe ff ff       	jmp    4cb <printf+0x4b>
 66d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 670:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 673:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 675:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 67c:	00 
 67d:	89 44 24 04          	mov    %eax,0x4(%esp)
 681:	89 34 24             	mov    %esi,(%esp)
 684:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 688:	e8 65 fc ff ff       	call   2f2 <write>
 68d:	e9 39 fe ff ff       	jmp    4cb <printf+0x4b>
 692:	66 90                	xchg   %ax,%ax
 694:	66 90                	xchg   %ax,%ax
 696:	66 90                	xchg   %ax,%ax
 698:	66 90                	xchg   %ax,%ax
 69a:	66 90                	xchg   %ax,%ax
 69c:	66 90                	xchg   %ax,%ax
 69e:	66 90                	xchg   %ax,%ax

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 58 0f 00 00       	mov    0xf58,%eax
{
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ae:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 6b0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b3:	39 d0                	cmp    %edx,%eax
 6b5:	72 11                	jb     6c8 <free+0x28>
 6b7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b8:	39 c8                	cmp    %ecx,%eax
 6ba:	72 04                	jb     6c0 <free+0x20>
 6bc:	39 ca                	cmp    %ecx,%edx
 6be:	72 10                	jb     6d0 <free+0x30>
 6c0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6c4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c6:	73 f0                	jae    6b8 <free+0x18>
 6c8:	39 ca                	cmp    %ecx,%edx
 6ca:	72 04                	jb     6d0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6cc:	39 c8                	cmp    %ecx,%eax
 6ce:	72 f0                	jb     6c0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6d3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 6d6:	39 cf                	cmp    %ecx,%edi
 6d8:	74 1e                	je     6f8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6da:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 48 04             	mov    0x4(%eax),%ecx
 6e0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6e3:	39 f2                	cmp    %esi,%edx
 6e5:	74 28                	je     70f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6e7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6e9:	a3 58 0f 00 00       	mov    %eax,0xf58
}
 6ee:	5b                   	pop    %ebx
 6ef:	5e                   	pop    %esi
 6f0:	5f                   	pop    %edi
 6f1:	5d                   	pop    %ebp
 6f2:	c3                   	ret    
 6f3:	90                   	nop
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6f8:	03 71 04             	add    0x4(%ecx),%esi
 6fb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6fe:	8b 08                	mov    (%eax),%ecx
 700:	8b 09                	mov    (%ecx),%ecx
 702:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 705:	8b 48 04             	mov    0x4(%eax),%ecx
 708:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 70b:	39 f2                	cmp    %esi,%edx
 70d:	75 d8                	jne    6e7 <free+0x47>
    p->s.size += bp->s.size;
 70f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 712:	a3 58 0f 00 00       	mov    %eax,0xf58
    p->s.size += bp->s.size;
 717:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 71a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 71d:	89 10                	mov    %edx,(%eax)
}
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5f                   	pop    %edi
 722:	5d                   	pop    %ebp
 723:	c3                   	ret    
 724:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 72a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 73c:	8b 1d 58 0f 00 00    	mov    0xf58,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	8d 48 07             	lea    0x7(%eax),%ecx
 745:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 748:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 74a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 74d:	0f 84 9b 00 00 00    	je     7ee <malloc+0xbe>
 753:	8b 13                	mov    (%ebx),%edx
 755:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 758:	39 fe                	cmp    %edi,%esi
 75a:	76 64                	jbe    7c0 <malloc+0x90>
 75c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 763:	bb 00 80 00 00       	mov    $0x8000,%ebx
 768:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 76b:	eb 0e                	jmp    77b <malloc+0x4b>
 76d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 770:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 772:	8b 78 04             	mov    0x4(%eax),%edi
 775:	39 fe                	cmp    %edi,%esi
 777:	76 4f                	jbe    7c8 <malloc+0x98>
 779:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 77b:	3b 15 58 0f 00 00    	cmp    0xf58,%edx
 781:	75 ed                	jne    770 <malloc+0x40>
  if(nu < 4096)
 783:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 786:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 78c:	bf 00 10 00 00       	mov    $0x1000,%edi
 791:	0f 43 fe             	cmovae %esi,%edi
 794:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 797:	89 04 24             	mov    %eax,(%esp)
 79a:	e8 bb fb ff ff       	call   35a <sbrk>
  if(p == (char*)-1)
 79f:	83 f8 ff             	cmp    $0xffffffff,%eax
 7a2:	74 18                	je     7bc <malloc+0x8c>
  hp->s.size = nu;
 7a4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7a7:	83 c0 08             	add    $0x8,%eax
 7aa:	89 04 24             	mov    %eax,(%esp)
 7ad:	e8 ee fe ff ff       	call   6a0 <free>
  return freep;
 7b2:	8b 15 58 0f 00 00    	mov    0xf58,%edx
      if((p = morecore(nunits)) == 0)
 7b8:	85 d2                	test   %edx,%edx
 7ba:	75 b4                	jne    770 <malloc+0x40>
        return 0;
 7bc:	31 c0                	xor    %eax,%eax
 7be:	eb 20                	jmp    7e0 <malloc+0xb0>
    if(p->s.size >= nunits){
 7c0:	89 d0                	mov    %edx,%eax
 7c2:	89 da                	mov    %ebx,%edx
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7c8:	39 fe                	cmp    %edi,%esi
 7ca:	74 1c                	je     7e8 <malloc+0xb8>
        p->s.size -= nunits;
 7cc:	29 f7                	sub    %esi,%edi
 7ce:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 7d1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 7d4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7d7:	89 15 58 0f 00 00    	mov    %edx,0xf58
      return (void*)(p + 1);
 7dd:	83 c0 08             	add    $0x8,%eax
  }
}
 7e0:	83 c4 1c             	add    $0x1c,%esp
 7e3:	5b                   	pop    %ebx
 7e4:	5e                   	pop    %esi
 7e5:	5f                   	pop    %edi
 7e6:	5d                   	pop    %ebp
 7e7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7e8:	8b 08                	mov    (%eax),%ecx
 7ea:	89 0a                	mov    %ecx,(%edx)
 7ec:	eb e9                	jmp    7d7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 7ee:	c7 05 58 0f 00 00 5c 	movl   $0xf5c,0xf58
 7f5:	0f 00 00 
    base.s.size = 0;
 7f8:	ba 5c 0f 00 00       	mov    $0xf5c,%edx
    base.s.ptr = freep = prevp = &base;
 7fd:	c7 05 5c 0f 00 00 5c 	movl   $0xf5c,0xf5c
 804:	0f 00 00 
    base.s.size = 0;
 807:	c7 05 60 0f 00 00 00 	movl   $0x0,0xf60
 80e:	00 00 00 
 811:	e9 46 ff ff ff       	jmp    75c <malloc+0x2c>
 816:	66 90                	xchg   %ax,%ax
 818:	66 90                	xchg   %ax,%ax
 81a:	66 90                	xchg   %ax,%ax
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 820:	55                   	push   %ebp
 821:	89 e5                	mov    %esp,%ebp
 823:	56                   	push   %esi
 824:	53                   	push   %ebx
 825:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 828:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 82f:	e8 fc fe ff ff       	call   730 <malloc>

    if (bt == NULL) {
 834:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 836:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 838:	74 66                	je     8a0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 83a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 841:	e8 ea fe ff ff       	call   730 <malloc>
    if (bt->bt_stack == NULL) {
 846:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 848:	89 c3                	mov    %eax,%ebx
 84a:	89 46 08             	mov    %eax,0x8(%esi)
 84d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 850:	74 5d                	je     8af <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 852:	25 ff 0f 00 00       	and    $0xfff,%eax
 857:	75 37                	jne    890 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 859:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 85f:	8b 45 10             	mov    0x10(%ebp),%eax
 862:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 866:	89 44 24 04          	mov    %eax,0x4(%esp)
 86a:	8b 45 0c             	mov    0xc(%ebp),%eax
 86d:	89 04 24             	mov    %eax,(%esp)
 870:	e8 25 fb ff ff       	call   39a <kthread_create>
    if (bt->bid != 0) {
 875:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 877:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 879:	74 2d                	je     8a8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	89 30                	mov    %esi,(%eax)
        result = 0;
 880:	31 c0                	xor    %eax,%eax
}
 882:	83 c4 10             	add    $0x10,%esp
 885:	5b                   	pop    %ebx
 886:	5e                   	pop    %esi
 887:	5d                   	pop    %ebp
 888:	c3                   	ret    
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 890:	29 c3                	sub    %eax,%ebx
 892:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 898:	89 5e 04             	mov    %ebx,0x4(%esi)
 89b:	eb bc                	jmp    859 <benny_thread_create+0x39>
 89d:	8d 76 00             	lea    0x0(%esi),%esi
 8a0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 8a6:	eb b7                	jmp    85f <benny_thread_create+0x3f>
    int result = -1;
 8a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8ad:	eb d3                	jmp    882 <benny_thread_create+0x62>
        free(bt);
 8af:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 8b2:	31 f6                	xor    %esi,%esi
        free(bt);
 8b4:	e8 e7 fd ff ff       	call   6a0 <free>
 8b9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 8bc:	eb a1                	jmp    85f <benny_thread_create+0x3f>
 8be:	66 90                	xchg   %ax,%ax

000008c0 <benny_thread_bid>:
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 8c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8c6:	5d                   	pop    %ebp
    return bt->bid;
 8c7:	8b 00                	mov    (%eax),%eax
}
 8c9:	c3                   	ret    
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008d0 <benny_thread_join>:
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	53                   	push   %ebx
 8d4:	83 ec 14             	sub    $0x14,%esp
 8d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 8da:	8b 03                	mov    (%ebx),%eax
 8dc:	89 04 24             	mov    %eax,(%esp)
 8df:	e8 be fa ff ff       	call   3a2 <kthread_join>
    if (retVal == 0) {
 8e4:	85 c0                	test   %eax,%eax
 8e6:	75 27                	jne    90f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 8e8:	8b 53 08             	mov    0x8(%ebx),%edx
 8eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ee:	89 14 24             	mov    %edx,(%esp)
 8f1:	e8 aa fd ff ff       	call   6a0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 8f6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8fd:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 904:	89 1c 24             	mov    %ebx,(%esp)
 907:	e8 94 fd ff ff       	call   6a0 <free>
 90c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 90f:	83 c4 14             	add    $0x14,%esp
 912:	5b                   	pop    %ebx
 913:	5d                   	pop    %ebp
 914:	c3                   	ret    
 915:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <benny_thread_exit>:
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
}
 923:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 924:	e9 81 fa ff ff       	jmp    3aa <kthread_exit>
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000930 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 936:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 93c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 943:	31 c0                	xor    %eax,%eax
 945:	5d                   	pop    %ebp
 946:	c3                   	ret    
 947:	89 f6                	mov    %esi,%esi
 949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000950 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 950:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 951:	b8 01 00 00 00       	mov    $0x1,%eax
 956:	89 e5                	mov    %esp,%ebp
 958:	56                   	push   %esi
 959:	53                   	push   %ebx
 95a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 95d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 960:	85 c0                	test   %eax,%eax
 962:	be 01 00 00 00       	mov    $0x1,%esi
 967:	74 15                	je     97e <benny_mootex_yieldlock+0x2e>
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 970:	e8 45 fa ff ff       	call   3ba <kthread_yield>
 975:	89 f0                	mov    %esi,%eax
 977:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 97a:	85 c0                	test   %eax,%eax
 97c:	75 f2                	jne    970 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 97e:	e8 2f fa ff ff       	call   3b2 <kthread_self>
    benny_mootex->bid = benny_self();
 983:	89 43 04             	mov    %eax,0x4(%ebx)
}
 986:	31 c0                	xor    %eax,%eax
 988:	5b                   	pop    %ebx
 989:	5e                   	pop    %esi
 98a:	5d                   	pop    %ebp
 98b:	c3                   	ret    
 98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000990 <benny_mootex_spinlock>:
{
 990:	55                   	push   %ebp
 991:	ba 01 00 00 00       	mov    $0x1,%edx
 996:	89 e5                	mov    %esp,%ebp
 998:	53                   	push   %ebx
 999:	83 ec 04             	sub    $0x4,%esp
 99c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 99f:	90                   	nop
 9a0:	89 d0                	mov    %edx,%eax
 9a2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 9a5:	85 c0                	test   %eax,%eax
 9a7:	75 f7                	jne    9a0 <benny_mootex_spinlock+0x10>
    return kthread_self();
 9a9:	e8 04 fa ff ff       	call   3b2 <kthread_self>
    benny_mootex->bid = benny_self();
 9ae:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9b1:	83 c4 04             	add    $0x4,%esp
 9b4:	31 c0                	xor    %eax,%eax
 9b6:	5b                   	pop    %ebx
 9b7:	5d                   	pop    %ebp
 9b8:	c3                   	ret    
 9b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009c0 <benny_mootex_unlock>:
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	53                   	push   %ebx
 9c4:	83 ec 04             	sub    $0x4,%esp
 9c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 9ca:	e8 e3 f9 ff ff       	call   3b2 <kthread_self>
    if(tid == benny_mootex->bid){
 9cf:	39 43 04             	cmp    %eax,0x4(%ebx)
 9d2:	75 1c                	jne    9f0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 9d4:	0f ae f0             	mfence 
    return 0;
 9d7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 9d9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 9e0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 9e6:	83 c4 04             	add    $0x4,%esp
 9e9:	5b                   	pop    %ebx
 9ea:	5d                   	pop    %ebp
 9eb:	c3                   	ret    
 9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9f0:	83 c4 04             	add    $0x4,%esp
      return -1;
 9f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 9f8:	5b                   	pop    %ebx
 9f9:	5d                   	pop    %ebp
 9fa:	c3                   	ret    
 9fb:	90                   	nop
 9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a00 <benny_mootex_trylock>:
{
 a00:	55                   	push   %ebp
 a01:	b8 01 00 00 00       	mov    $0x1,%eax
 a06:	89 e5                	mov    %esp,%ebp
 a08:	53                   	push   %ebx
 a09:	83 ec 04             	sub    $0x4,%esp
 a0c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a0f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 a12:	85 c0                	test   %eax,%eax
 a14:	75 08                	jne    a1e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 a16:	e8 97 f9 ff ff       	call   3b2 <kthread_self>
        benny_mootex->bid = tid;
 a1b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a1e:	83 c4 04             	add    $0x4,%esp
 a21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a26:	5b                   	pop    %ebx
 a27:	5d                   	pop    %ebp
 a28:	c3                   	ret    
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_mootex_wholock>:
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 a33:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a36:	5d                   	pop    %ebp
    return benny_mootex->bid;
 a37:	8b 40 04             	mov    0x4(%eax),%eax
}
 a3a:	c3                   	ret    
 a3b:	90                   	nop
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a40 <benny_mootex_islocked>:
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 a43:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a46:	5d                   	pop    %ebp
    return benny_mootex->locked;
 a47:	8b 00                	mov    (%eax),%eax
}
 a49:	c3                   	ret    
 a4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a50 <benny_self>:
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
}
 a53:	5d                   	pop    %ebp
    return kthread_self();
 a54:	e9 59 f9 ff ff       	jmp    3b2 <kthread_self>
 a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a60 <benny_yield>:
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
    
}
 a63:	5d                   	pop    %ebp
    return kthread_yield();
 a64:	e9 51 f9 ff ff       	jmp    3ba <kthread_yield>
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a70 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 a73:	5d                   	pop    %ebp
    return kthread_cpu_count();
 a74:	e9 49 f9 ff ff       	jmp    3c2 <kthread_cpu_count>
 a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a80 <benny_thread_count>:

int
benny_thread_count(void)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 a83:	5d                   	pop    %ebp
    return kthread_thread_count();
 a84:	e9 41 f9 ff ff       	jmp    3ca <kthread_thread_count>
