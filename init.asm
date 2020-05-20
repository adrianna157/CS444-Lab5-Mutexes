
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  11:	00 
  12:	c7 04 24 e9 0a 00 00 	movl   $0xae9,(%esp)
  19:	e8 54 03 00 00       	call   372 <open>
  1e:	85 c0                	test   %eax,%eax
  20:	0f 88 ac 00 00 00    	js     d2 <main+0xd2>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2d:	e8 78 03 00 00       	call   3aa <dup>
  dup(0);  // stderr
  32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  39:	e8 6c 03 00 00       	call   3aa <dup>
  3e:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
  40:	c7 44 24 04 f1 0a 00 	movl   $0xaf1,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 8c 04 00 00       	call   4e0 <printf>
    pid = fork();
  54:	e8 d1 02 00 00       	call   32a <fork>
    if(pid < 0){
  59:	85 c0                	test   %eax,%eax
    pid = fork();
  5b:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5d:	78 2d                	js     8c <main+0x8c>
  5f:	90                   	nop
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  60:	74 43                	je     a5 <main+0xa5>
  62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  68:	e8 cd 02 00 00       	call   33a <wait>
  6d:	85 c0                	test   %eax,%eax
  6f:	90                   	nop
  70:	78 ce                	js     40 <main+0x40>
  72:	39 d8                	cmp    %ebx,%eax
  74:	74 ca                	je     40 <main+0x40>
      printf(1, "zombie!\n");
  76:	c7 44 24 04 30 0b 00 	movl   $0xb30,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 56 04 00 00       	call   4e0 <printf>
  8a:	eb dc                	jmp    68 <main+0x68>
      printf(1, "init: fork failed\n");
  8c:	c7 44 24 04 04 0b 00 	movl   $0xb04,0x4(%esp)
  93:	00 
  94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9b:	e8 40 04 00 00       	call   4e0 <printf>
      exit();
  a0:	e8 8d 02 00 00       	call   332 <exit>
      exec("sh", argv);
  a5:	c7 44 24 04 c8 0f 00 	movl   $0xfc8,0x4(%esp)
  ac:	00 
  ad:	c7 04 24 17 0b 00 00 	movl   $0xb17,(%esp)
  b4:	e8 b1 02 00 00       	call   36a <exec>
      printf(1, "init: exec sh failed\n");
  b9:	c7 44 24 04 1a 0b 00 	movl   $0xb1a,0x4(%esp)
  c0:	00 
  c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c8:	e8 13 04 00 00       	call   4e0 <printf>
      exit();
  cd:	e8 60 02 00 00       	call   332 <exit>
    mknod("console", 1, 1);
  d2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  d9:	00 
  da:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  e1:	00 
  e2:	c7 04 24 e9 0a 00 00 	movl   $0xae9,(%esp)
  e9:	e8 8c 02 00 00       	call   37a <mknod>
    open("console", O_RDWR);
  ee:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  f5:	00 
  f6:	c7 04 24 e9 0a 00 00 	movl   $0xae9,(%esp)
  fd:	e8 70 02 00 00       	call   372 <open>
 102:	e9 1f ff ff ff       	jmp    26 <main+0x26>
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 119:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 11a:	89 c2                	mov    %eax,%edx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	83 c1 01             	add    $0x1,%ecx
 123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 db                	test   %bl,%bl
 12c:	88 5a ff             	mov    %bl,-0x1(%edx)
 12f:	75 ef                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 131:	5b                   	pop    %ebx
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 55 08             	mov    0x8(%ebp),%edx
 146:	53                   	push   %ebx
 147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14a:	0f b6 02             	movzbl (%edx),%eax
 14d:	84 c0                	test   %al,%al
 14f:	74 2d                	je     17e <strcmp+0x3e>
 151:	0f b6 19             	movzbl (%ecx),%ebx
 154:	38 d8                	cmp    %bl,%al
 156:	74 0e                	je     166 <strcmp+0x26>
 158:	eb 2b                	jmp    185 <strcmp+0x45>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 160:	38 c8                	cmp    %cl,%al
 162:	75 15                	jne    179 <strcmp+0x39>
    p++, q++;
 164:	89 d9                	mov    %ebx,%ecx
 166:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 169:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 16c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 16f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 173:	84 c0                	test   %al,%al
 175:	75 e9                	jne    160 <strcmp+0x20>
 177:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 179:	29 c8                	sub    %ecx,%eax
}
 17b:	5b                   	pop    %ebx
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
 17e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 181:	31 c0                	xor    %eax,%eax
 183:	eb f4                	jmp    179 <strcmp+0x39>
 185:	0f b6 cb             	movzbl %bl,%ecx
 188:	eb ef                	jmp    179 <strcmp+0x39>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 12                	je     1ad <strlen+0x1d>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
  for(n = 0; s[n]; n++)
 1ad:	31 c0                	xor    %eax,%eax
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	eb 0d                	jmp    1c0 <memset>
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	53                   	push   %ebx
 1e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1ea:	0f b6 18             	movzbl (%eax),%ebx
 1ed:	84 db                	test   %bl,%bl
 1ef:	74 1d                	je     20e <strchr+0x2e>
    if(*s == c)
 1f1:	38 d3                	cmp    %dl,%bl
 1f3:	89 d1                	mov    %edx,%ecx
 1f5:	75 0d                	jne    204 <strchr+0x24>
 1f7:	eb 17                	jmp    210 <strchr+0x30>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0c                	je     210 <strchr+0x30>
  for(; *s; s++)
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strchr+0x20>
      return (char*)s;
  return 0;
 20e:	31 c0                	xor    %eax,%eax
}
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 225:	31 f6                	xor    %esi,%esi
{
 227:	53                   	push   %ebx
 228:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 22b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 22e:	eb 31                	jmp    261 <gets+0x41>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	89 7c 24 04          	mov    %edi,0x4(%esp)
 23c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 243:	e8 02 01 00 00       	call   34a <read>
    if(cc < 1)
 248:	85 c0                	test   %eax,%eax
 24a:	7e 1d                	jle    269 <gets+0x49>
      break;
    buf[i++] = c;
 24c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 250:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 252:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 255:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 257:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 25b:	74 0c                	je     269 <gets+0x49>
 25d:	3c 0a                	cmp    $0xa,%al
 25f:	74 08                	je     269 <gets+0x49>
  for(i=0; i+1 < max; ){
 261:	8d 5e 01             	lea    0x1(%esi),%ebx
 264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 267:	7c c7                	jl     230 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 269:	8b 45 08             	mov    0x8(%ebp),%eax
 26c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 270:	83 c4 2c             	add    $0x2c,%esp
 273:	5b                   	pop    %ebx
 274:	5e                   	pop    %esi
 275:	5f                   	pop    %edi
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
 285:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 292:	00 
 293:	89 04 24             	mov    %eax,(%esp)
 296:	e8 d7 00 00 00       	call   372 <open>
  if(fd < 0)
 29b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 29d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 29f:	78 27                	js     2c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 1c 24             	mov    %ebx,(%esp)
 2a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ab:	e8 da 00 00 00       	call   38a <fstat>
  close(fd);
 2b0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2b3:	89 c6                	mov    %eax,%esi
  close(fd);
 2b5:	e8 a0 00 00 00       	call   35a <close>
  return r;
 2ba:	89 f0                	mov    %esi,%eax
}
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	5b                   	pop    %ebx
 2c0:	5e                   	pop    %esi
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	90                   	nop
 2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cd:	eb ed                	jmp    2bc <stat+0x3c>
 2cf:	90                   	nop

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 11             	movsbl (%ecx),%edx
 2da:	8d 42 d0             	lea    -0x30(%edx),%eax
 2dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2e4:	77 17                	ja     2fd <atoi+0x2d>
 2e6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2e8:	83 c1 01             	add    $0x1,%ecx
 2eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2f2:	0f be 11             	movsbl (%ecx),%edx
 2f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2f8:	80 fb 09             	cmp    $0x9,%bl
 2fb:	76 eb                	jbe    2e8 <atoi+0x18>
  return n;
}
 2fd:	5b                   	pop    %ebx
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 301:	31 d2                	xor    %edx,%edx
{
 303:	89 e5                	mov    %esp,%ebp
 305:	56                   	push   %esi
 306:	8b 45 08             	mov    0x8(%ebp),%eax
 309:	53                   	push   %ebx
 30a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 30d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 310:	85 db                	test   %ebx,%ebx
 312:	7e 12                	jle    326 <memmove+0x26>
 314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 318:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 31c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 31f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 322:	39 da                	cmp    %ebx,%edx
 324:	75 f2                	jne    318 <memmove+0x18>
  return vdst;
}
 326:	5b                   	pop    %ebx
 327:	5e                   	pop    %esi
 328:	5d                   	pop    %ebp
 329:	c3                   	ret    

0000032a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 32a:	b8 01 00 00 00       	mov    $0x1,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <exit>:
SYSCALL(exit)
 332:	b8 02 00 00 00       	mov    $0x2,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <wait>:
SYSCALL(wait)
 33a:	b8 03 00 00 00       	mov    $0x3,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <pipe>:
SYSCALL(pipe)
 342:	b8 04 00 00 00       	mov    $0x4,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <read>:
SYSCALL(read)
 34a:	b8 05 00 00 00       	mov    $0x5,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <write>:
SYSCALL(write)
 352:	b8 10 00 00 00       	mov    $0x10,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <close>:
SYSCALL(close)
 35a:	b8 15 00 00 00       	mov    $0x15,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <kill>:
SYSCALL(kill)
 362:	b8 06 00 00 00       	mov    $0x6,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <exec>:
SYSCALL(exec)
 36a:	b8 07 00 00 00       	mov    $0x7,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <open>:
SYSCALL(open)
 372:	b8 0f 00 00 00       	mov    $0xf,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <mknod>:
SYSCALL(mknod)
 37a:	b8 11 00 00 00       	mov    $0x11,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <unlink>:
SYSCALL(unlink)
 382:	b8 12 00 00 00       	mov    $0x12,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <fstat>:
SYSCALL(fstat)
 38a:	b8 08 00 00 00       	mov    $0x8,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <link>:
SYSCALL(link)
 392:	b8 13 00 00 00       	mov    $0x13,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <mkdir>:
SYSCALL(mkdir)
 39a:	b8 14 00 00 00       	mov    $0x14,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <chdir>:
SYSCALL(chdir)
 3a2:	b8 09 00 00 00       	mov    $0x9,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <dup>:
SYSCALL(dup)
 3aa:	b8 0a 00 00 00       	mov    $0xa,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <getpid>:
SYSCALL(getpid)
 3b2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <sbrk>:
SYSCALL(sbrk)
 3ba:	b8 0c 00 00 00       	mov    $0xc,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <sleep>:
SYSCALL(sleep)
 3c2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <uptime>:
SYSCALL(uptime)
 3ca:	b8 0e 00 00 00       	mov    $0xe,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 3d2:	b8 16 00 00 00       	mov    $0x16,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 3da:	b8 17 00 00 00       	mov    $0x17,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 3e2:	b8 18 00 00 00       	mov    $0x18,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 3ea:	b8 19 00 00 00       	mov    $0x19,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 3f2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 3fa:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <kthread_join>:
SYSCALL(kthread_join)
 402:	b8 1c 00 00 00       	mov    $0x1c,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <kthread_exit>:
SYSCALL(kthread_exit)
 40a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 412:	b8 1e 00 00 00       	mov    $0x1e,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <kthread_yield>:
SYSCALL(kthread_yield)
 41a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 422:	b8 20 00 00 00       	mov    $0x20,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 42a:	b8 21 00 00 00       	mov    $0x21,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    
 432:	66 90                	xchg   %ax,%ax
 434:	66 90                	xchg   %ax,%ax
 436:	66 90                	xchg   %ax,%ax
 438:	66 90                	xchg   %ax,%ax
 43a:	66 90                	xchg   %ax,%ax
 43c:	66 90                	xchg   %ax,%ax
 43e:	66 90                	xchg   %ax,%ax

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	89 c6                	mov    %eax,%esi
 447:	53                   	push   %ebx
 448:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 44b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 44e:	85 db                	test   %ebx,%ebx
 450:	74 09                	je     45b <printint+0x1b>
 452:	89 d0                	mov    %edx,%eax
 454:	c1 e8 1f             	shr    $0x1f,%eax
 457:	84 c0                	test   %al,%al
 459:	75 75                	jne    4d0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 45b:	89 d0                	mov    %edx,%eax
  neg = 0;
 45d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 464:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 467:	31 ff                	xor    %edi,%edi
 469:	89 ce                	mov    %ecx,%esi
 46b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 46e:	eb 02                	jmp    472 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 470:	89 cf                	mov    %ecx,%edi
 472:	31 d2                	xor    %edx,%edx
 474:	f7 f6                	div    %esi
 476:	8d 4f 01             	lea    0x1(%edi),%ecx
 479:	0f b6 92 40 0b 00 00 	movzbl 0xb40(%edx),%edx
  }while((x /= base) != 0);
 480:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 482:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 485:	75 e9                	jne    470 <printint+0x30>
  if(neg)
 487:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 48a:	89 c8                	mov    %ecx,%eax
 48c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 48f:	85 d2                	test   %edx,%edx
 491:	74 08                	je     49b <printint+0x5b>
    buf[i++] = '-';
 493:	8d 4f 02             	lea    0x2(%edi),%ecx
 496:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 49b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 49e:	66 90                	xchg   %ax,%ax
 4a0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4a5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 4a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4af:	00 
 4b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4b4:	89 34 24             	mov    %esi,(%esp)
 4b7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4ba:	e8 93 fe ff ff       	call   352 <write>
  while(--i >= 0)
 4bf:	83 ff ff             	cmp    $0xffffffff,%edi
 4c2:	75 dc                	jne    4a0 <printint+0x60>
    putc(fd, buf[i]);
}
 4c4:	83 c4 4c             	add    $0x4c,%esp
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 4d0:	89 d0                	mov    %edx,%eax
 4d2:	f7 d8                	neg    %eax
    neg = 1;
 4d4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4db:	eb 87                	jmp    464 <printint+0x24>
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4e4:	31 ff                	xor    %edi,%edi
{
 4e6:	56                   	push   %esi
 4e7:	53                   	push   %ebx
 4e8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 4ee:	8d 45 10             	lea    0x10(%ebp),%eax
{
 4f1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 4f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 4f7:	0f b6 13             	movzbl (%ebx),%edx
 4fa:	83 c3 01             	add    $0x1,%ebx
 4fd:	84 d2                	test   %dl,%dl
 4ff:	75 39                	jne    53a <printf+0x5a>
 501:	e9 ca 00 00 00       	jmp    5d0 <printf+0xf0>
 506:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 508:	83 fa 25             	cmp    $0x25,%edx
 50b:	0f 84 c7 00 00 00    	je     5d8 <printf+0xf8>
  write(fd, &c, 1);
 511:	8d 45 e0             	lea    -0x20(%ebp),%eax
 514:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51b:	00 
 51c:	89 44 24 04          	mov    %eax,0x4(%esp)
 520:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 523:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 526:	e8 27 fe ff ff       	call   352 <write>
 52b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 52e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 532:	84 d2                	test   %dl,%dl
 534:	0f 84 96 00 00 00    	je     5d0 <printf+0xf0>
    if(state == 0){
 53a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 53c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 53f:	74 c7                	je     508 <printf+0x28>
      }
    } else if(state == '%'){
 541:	83 ff 25             	cmp    $0x25,%edi
 544:	75 e5                	jne    52b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 546:	83 fa 75             	cmp    $0x75,%edx
 549:	0f 84 99 00 00 00    	je     5e8 <printf+0x108>
 54f:	83 fa 64             	cmp    $0x64,%edx
 552:	0f 84 90 00 00 00    	je     5e8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 558:	25 f7 00 00 00       	and    $0xf7,%eax
 55d:	83 f8 70             	cmp    $0x70,%eax
 560:	0f 84 aa 00 00 00    	je     610 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 566:	83 fa 73             	cmp    $0x73,%edx
 569:	0f 84 e9 00 00 00    	je     658 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 56f:	83 fa 63             	cmp    $0x63,%edx
 572:	0f 84 2b 01 00 00    	je     6a3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 578:	83 fa 25             	cmp    $0x25,%edx
 57b:	0f 84 4f 01 00 00    	je     6d0 <printf+0x1f0>
  write(fd, &c, 1);
 581:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 584:	83 c3 01             	add    $0x1,%ebx
 587:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 58e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 58f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 591:	89 44 24 04          	mov    %eax,0x4(%esp)
 595:	89 34 24             	mov    %esi,(%esp)
 598:	89 55 d0             	mov    %edx,-0x30(%ebp)
 59b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 59f:	e8 ae fd ff ff       	call   352 <write>
        putc(fd, c);
 5a4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 5a7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b1:	00 
 5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 5b9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5bc:	e8 91 fd ff ff       	call   352 <write>
  for(i = 0; fmt[i]; i++){
 5c1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5c5:	84 d2                	test   %dl,%dl
 5c7:	0f 85 6d ff ff ff    	jne    53a <printf+0x5a>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 5d0:	83 c4 3c             	add    $0x3c,%esp
 5d3:	5b                   	pop    %ebx
 5d4:	5e                   	pop    %esi
 5d5:	5f                   	pop    %edi
 5d6:	5d                   	pop    %ebp
 5d7:	c3                   	ret    
        state = '%';
 5d8:	bf 25 00 00 00       	mov    $0x25,%edi
 5dd:	e9 49 ff ff ff       	jmp    52b <printf+0x4b>
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5ef:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 5f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 5f7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 5f9:	8b 10                	mov    (%eax),%edx
 5fb:	89 f0                	mov    %esi,%eax
 5fd:	e8 3e fe ff ff       	call   440 <printint>
        ap++;
 602:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 606:	e9 20 ff ff ff       	jmp    52b <printf+0x4b>
 60b:	90                   	nop
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 610:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 613:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 61a:	00 
 61b:	89 44 24 04          	mov    %eax,0x4(%esp)
 61f:	89 34 24             	mov    %esi,(%esp)
 622:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 626:	e8 27 fd ff ff       	call   352 <write>
 62b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 62e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 635:	00 
 636:	89 44 24 04          	mov    %eax,0x4(%esp)
 63a:	89 34 24             	mov    %esi,(%esp)
 63d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 641:	e8 0c fd ff ff       	call   352 <write>
        printint(fd, *ap, 16, 0);
 646:	b9 10 00 00 00       	mov    $0x10,%ecx
 64b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 652:	eb a0                	jmp    5f4 <printf+0x114>
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 658:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 65b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 65f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 661:	b8 39 0b 00 00       	mov    $0xb39,%eax
 666:	85 ff                	test   %edi,%edi
 668:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 66b:	0f b6 07             	movzbl (%edi),%eax
 66e:	84 c0                	test   %al,%al
 670:	74 2a                	je     69c <printf+0x1bc>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 678:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 67b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 67e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 681:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 688:	00 
 689:	89 44 24 04          	mov    %eax,0x4(%esp)
 68d:	89 34 24             	mov    %esi,(%esp)
 690:	e8 bd fc ff ff       	call   352 <write>
        while(*s != 0){
 695:	0f b6 07             	movzbl (%edi),%eax
 698:	84 c0                	test   %al,%al
 69a:	75 dc                	jne    678 <printf+0x198>
      state = 0;
 69c:	31 ff                	xor    %edi,%edi
 69e:	e9 88 fe ff ff       	jmp    52b <printf+0x4b>
        putc(fd, *ap);
 6a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6a6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 6a8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b1:	00 
 6b2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 6b5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6b8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bf:	e8 8e fc ff ff       	call   352 <write>
        ap++;
 6c4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6c8:	e9 5e fe ff ff       	jmp    52b <printf+0x4b>
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6d0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 6d3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6d5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6dc:	00 
 6dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e1:	89 34 24             	mov    %esi,(%esp)
 6e4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 6e8:	e8 65 fc ff ff       	call   352 <write>
 6ed:	e9 39 fe ff ff       	jmp    52b <printf+0x4b>
 6f2:	66 90                	xchg   %ax,%ax
 6f4:	66 90                	xchg   %ax,%ax
 6f6:	66 90                	xchg   %ax,%ax
 6f8:	66 90                	xchg   %ax,%ax
 6fa:	66 90                	xchg   %ax,%ax
 6fc:	66 90                	xchg   %ax,%ax
 6fe:	66 90                	xchg   %ax,%ax

00000700 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 700:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	a1 d0 0f 00 00       	mov    0xfd0,%eax
{
 706:	89 e5                	mov    %esp,%ebp
 708:	57                   	push   %edi
 709:	56                   	push   %esi
 70a:	53                   	push   %ebx
 70b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 710:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 713:	39 d0                	cmp    %edx,%eax
 715:	72 11                	jb     728 <free+0x28>
 717:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 718:	39 c8                	cmp    %ecx,%eax
 71a:	72 04                	jb     720 <free+0x20>
 71c:	39 ca                	cmp    %ecx,%edx
 71e:	72 10                	jb     730 <free+0x30>
 720:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 722:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 724:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 726:	73 f0                	jae    718 <free+0x18>
 728:	39 ca                	cmp    %ecx,%edx
 72a:	72 04                	jb     730 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72c:	39 c8                	cmp    %ecx,%eax
 72e:	72 f0                	jb     720 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 730:	8b 73 fc             	mov    -0x4(%ebx),%esi
 733:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 736:	39 cf                	cmp    %ecx,%edi
 738:	74 1e                	je     758 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 73a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 73d:	8b 48 04             	mov    0x4(%eax),%ecx
 740:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 743:	39 f2                	cmp    %esi,%edx
 745:	74 28                	je     76f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 747:	89 10                	mov    %edx,(%eax)
  freep = p;
 749:	a3 d0 0f 00 00       	mov    %eax,0xfd0
}
 74e:	5b                   	pop    %ebx
 74f:	5e                   	pop    %esi
 750:	5f                   	pop    %edi
 751:	5d                   	pop    %ebp
 752:	c3                   	ret    
 753:	90                   	nop
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 758:	03 71 04             	add    0x4(%ecx),%esi
 75b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 75e:	8b 08                	mov    (%eax),%ecx
 760:	8b 09                	mov    (%ecx),%ecx
 762:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 765:	8b 48 04             	mov    0x4(%eax),%ecx
 768:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 76b:	39 f2                	cmp    %esi,%edx
 76d:	75 d8                	jne    747 <free+0x47>
    p->s.size += bp->s.size;
 76f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 772:	a3 d0 0f 00 00       	mov    %eax,0xfd0
    p->s.size += bp->s.size;
 777:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 77a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 77d:	89 10                	mov    %edx,(%eax)
}
 77f:	5b                   	pop    %ebx
 780:	5e                   	pop    %esi
 781:	5f                   	pop    %edi
 782:	5d                   	pop    %ebp
 783:	c3                   	ret    
 784:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 78a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000790 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 799:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 79c:	8b 1d d0 0f 00 00    	mov    0xfd0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	8d 48 07             	lea    0x7(%eax),%ecx
 7a5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 7a8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7aa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 7ad:	0f 84 9b 00 00 00    	je     84e <malloc+0xbe>
 7b3:	8b 13                	mov    (%ebx),%edx
 7b5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7b8:	39 fe                	cmp    %edi,%esi
 7ba:	76 64                	jbe    820 <malloc+0x90>
 7bc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 7c3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 7c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7cb:	eb 0e                	jmp    7db <malloc+0x4b>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7d2:	8b 78 04             	mov    0x4(%eax),%edi
 7d5:	39 fe                	cmp    %edi,%esi
 7d7:	76 4f                	jbe    828 <malloc+0x98>
 7d9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7db:	3b 15 d0 0f 00 00    	cmp    0xfd0,%edx
 7e1:	75 ed                	jne    7d0 <malloc+0x40>
  if(nu < 4096)
 7e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7e6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7ec:	bf 00 10 00 00       	mov    $0x1000,%edi
 7f1:	0f 43 fe             	cmovae %esi,%edi
 7f4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 7f7:	89 04 24             	mov    %eax,(%esp)
 7fa:	e8 bb fb ff ff       	call   3ba <sbrk>
  if(p == (char*)-1)
 7ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 802:	74 18                	je     81c <malloc+0x8c>
  hp->s.size = nu;
 804:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 807:	83 c0 08             	add    $0x8,%eax
 80a:	89 04 24             	mov    %eax,(%esp)
 80d:	e8 ee fe ff ff       	call   700 <free>
  return freep;
 812:	8b 15 d0 0f 00 00    	mov    0xfd0,%edx
      if((p = morecore(nunits)) == 0)
 818:	85 d2                	test   %edx,%edx
 81a:	75 b4                	jne    7d0 <malloc+0x40>
        return 0;
 81c:	31 c0                	xor    %eax,%eax
 81e:	eb 20                	jmp    840 <malloc+0xb0>
    if(p->s.size >= nunits){
 820:	89 d0                	mov    %edx,%eax
 822:	89 da                	mov    %ebx,%edx
 824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 828:	39 fe                	cmp    %edi,%esi
 82a:	74 1c                	je     848 <malloc+0xb8>
        p->s.size -= nunits;
 82c:	29 f7                	sub    %esi,%edi
 82e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 831:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 834:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 837:	89 15 d0 0f 00 00    	mov    %edx,0xfd0
      return (void*)(p + 1);
 83d:	83 c0 08             	add    $0x8,%eax
  }
}
 840:	83 c4 1c             	add    $0x1c,%esp
 843:	5b                   	pop    %ebx
 844:	5e                   	pop    %esi
 845:	5f                   	pop    %edi
 846:	5d                   	pop    %ebp
 847:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 848:	8b 08                	mov    (%eax),%ecx
 84a:	89 0a                	mov    %ecx,(%edx)
 84c:	eb e9                	jmp    837 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 84e:	c7 05 d0 0f 00 00 d4 	movl   $0xfd4,0xfd0
 855:	0f 00 00 
    base.s.size = 0;
 858:	ba d4 0f 00 00       	mov    $0xfd4,%edx
    base.s.ptr = freep = prevp = &base;
 85d:	c7 05 d4 0f 00 00 d4 	movl   $0xfd4,0xfd4
 864:	0f 00 00 
    base.s.size = 0;
 867:	c7 05 d8 0f 00 00 00 	movl   $0x0,0xfd8
 86e:	00 00 00 
 871:	e9 46 ff ff ff       	jmp    7bc <malloc+0x2c>
 876:	66 90                	xchg   %ax,%ax
 878:	66 90                	xchg   %ax,%ax
 87a:	66 90                	xchg   %ax,%ax
 87c:	66 90                	xchg   %ax,%ax
 87e:	66 90                	xchg   %ax,%ax

00000880 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	56                   	push   %esi
 884:	53                   	push   %ebx
 885:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 888:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 88f:	e8 fc fe ff ff       	call   790 <malloc>

    if (bt == NULL) {
 894:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 896:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 898:	74 66                	je     900 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 89a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8a1:	e8 ea fe ff ff       	call   790 <malloc>
    if (bt->bt_stack == NULL) {
 8a6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 8a8:	89 c3                	mov    %eax,%ebx
 8aa:	89 46 08             	mov    %eax,0x8(%esi)
 8ad:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 8b0:	74 5d                	je     90f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 8b2:	25 ff 0f 00 00       	and    $0xfff,%eax
 8b7:	75 37                	jne    8f0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 8b9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8bf:	8b 45 10             	mov    0x10(%ebp),%eax
 8c2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 8cd:	89 04 24             	mov    %eax,(%esp)
 8d0:	e8 25 fb ff ff       	call   3fa <kthread_create>
    if (bt->bid != 0) {
 8d5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8d7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 8d9:	74 2d                	je     908 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 8db:	8b 45 08             	mov    0x8(%ebp),%eax
 8de:	89 30                	mov    %esi,(%eax)
        result = 0;
 8e0:	31 c0                	xor    %eax,%eax
}
 8e2:	83 c4 10             	add    $0x10,%esp
 8e5:	5b                   	pop    %ebx
 8e6:	5e                   	pop    %esi
 8e7:	5d                   	pop    %ebp
 8e8:	c3                   	ret    
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 8f0:	29 c3                	sub    %eax,%ebx
 8f2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 8f8:	89 5e 04             	mov    %ebx,0x4(%esi)
 8fb:	eb bc                	jmp    8b9 <benny_thread_create+0x39>
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
 900:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 906:	eb b7                	jmp    8bf <benny_thread_create+0x3f>
    int result = -1;
 908:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 90d:	eb d3                	jmp    8e2 <benny_thread_create+0x62>
        free(bt);
 90f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 912:	31 f6                	xor    %esi,%esi
        free(bt);
 914:	e8 e7 fd ff ff       	call   700 <free>
 919:	8b 5b 04             	mov    0x4(%ebx),%ebx
 91c:	eb a1                	jmp    8bf <benny_thread_create+0x3f>
 91e:	66 90                	xchg   %ax,%ax

00000920 <benny_thread_bid>:
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 923:	8b 45 08             	mov    0x8(%ebp),%eax
}
 926:	5d                   	pop    %ebp
    return bt->bid;
 927:	8b 00                	mov    (%eax),%eax
}
 929:	c3                   	ret    
 92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000930 <benny_thread_join>:
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	53                   	push   %ebx
 934:	83 ec 14             	sub    $0x14,%esp
 937:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 93a:	8b 03                	mov    (%ebx),%eax
 93c:	89 04 24             	mov    %eax,(%esp)
 93f:	e8 be fa ff ff       	call   402 <kthread_join>
    if (retVal == 0) {
 944:	85 c0                	test   %eax,%eax
 946:	75 27                	jne    96f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 948:	8b 53 08             	mov    0x8(%ebx),%edx
 94b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 94e:	89 14 24             	mov    %edx,(%esp)
 951:	e8 aa fd ff ff       	call   700 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 956:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 95d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 964:	89 1c 24             	mov    %ebx,(%esp)
 967:	e8 94 fd ff ff       	call   700 <free>
 96c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 96f:	83 c4 14             	add    $0x14,%esp
 972:	5b                   	pop    %ebx
 973:	5d                   	pop    %ebp
 974:	c3                   	ret    
 975:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000980 <benny_thread_exit>:
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
}
 983:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 984:	e9 81 fa ff ff       	jmp    40a <kthread_exit>
 989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000990 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 996:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 99c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 9a3:	31 c0                	xor    %eax,%eax
 9a5:	5d                   	pop    %ebp
 9a6:	c3                   	ret    
 9a7:	89 f6                	mov    %esi,%esi
 9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 9b0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 9b1:	b8 01 00 00 00       	mov    $0x1,%eax
 9b6:	89 e5                	mov    %esp,%ebp
 9b8:	56                   	push   %esi
 9b9:	53                   	push   %ebx
 9ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9bd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 9c0:	85 c0                	test   %eax,%eax
 9c2:	be 01 00 00 00       	mov    $0x1,%esi
 9c7:	74 15                	je     9de <benny_mootex_yieldlock+0x2e>
 9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 9d0:	e8 45 fa ff ff       	call   41a <kthread_yield>
 9d5:	89 f0                	mov    %esi,%eax
 9d7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 9da:	85 c0                	test   %eax,%eax
 9dc:	75 f2                	jne    9d0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 9de:	e8 2f fa ff ff       	call   412 <kthread_self>
    benny_mootex->bid = benny_self();
 9e3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9e6:	31 c0                	xor    %eax,%eax
 9e8:	5b                   	pop    %ebx
 9e9:	5e                   	pop    %esi
 9ea:	5d                   	pop    %ebp
 9eb:	c3                   	ret    
 9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009f0 <benny_mootex_spinlock>:
{
 9f0:	55                   	push   %ebp
 9f1:	ba 01 00 00 00       	mov    $0x1,%edx
 9f6:	89 e5                	mov    %esp,%ebp
 9f8:	53                   	push   %ebx
 9f9:	83 ec 04             	sub    $0x4,%esp
 9fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9ff:	90                   	nop
 a00:	89 d0                	mov    %edx,%eax
 a02:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a05:	85 c0                	test   %eax,%eax
 a07:	75 f7                	jne    a00 <benny_mootex_spinlock+0x10>
    return kthread_self();
 a09:	e8 04 fa ff ff       	call   412 <kthread_self>
    benny_mootex->bid = benny_self();
 a0e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a11:	83 c4 04             	add    $0x4,%esp
 a14:	31 c0                	xor    %eax,%eax
 a16:	5b                   	pop    %ebx
 a17:	5d                   	pop    %ebp
 a18:	c3                   	ret    
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a20 <benny_mootex_unlock>:
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
 a23:	53                   	push   %ebx
 a24:	83 ec 04             	sub    $0x4,%esp
 a27:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 a2a:	e8 e3 f9 ff ff       	call   412 <kthread_self>
    if(tid == benny_mootex->bid){
 a2f:	39 43 04             	cmp    %eax,0x4(%ebx)
 a32:	75 1c                	jne    a50 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 a34:	0f ae f0             	mfence 
    return 0;
 a37:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 a39:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 a40:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 a46:	83 c4 04             	add    $0x4,%esp
 a49:	5b                   	pop    %ebx
 a4a:	5d                   	pop    %ebp
 a4b:	c3                   	ret    
 a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a50:	83 c4 04             	add    $0x4,%esp
      return -1;
 a53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a58:	5b                   	pop    %ebx
 a59:	5d                   	pop    %ebp
 a5a:	c3                   	ret    
 a5b:	90                   	nop
 a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a60 <benny_mootex_trylock>:
{
 a60:	55                   	push   %ebp
 a61:	b8 01 00 00 00       	mov    $0x1,%eax
 a66:	89 e5                	mov    %esp,%ebp
 a68:	53                   	push   %ebx
 a69:	83 ec 04             	sub    $0x4,%esp
 a6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a6f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 a72:	85 c0                	test   %eax,%eax
 a74:	75 08                	jne    a7e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 a76:	e8 97 f9 ff ff       	call   412 <kthread_self>
        benny_mootex->bid = tid;
 a7b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a7e:	83 c4 04             	add    $0x4,%esp
 a81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a86:	5b                   	pop    %ebx
 a87:	5d                   	pop    %ebp
 a88:	c3                   	ret    
 a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a90 <benny_mootex_wholock>:
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 a93:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a96:	5d                   	pop    %ebp
    return benny_mootex->bid;
 a97:	8b 40 04             	mov    0x4(%eax),%eax
}
 a9a:	c3                   	ret    
 a9b:	90                   	nop
 a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <benny_mootex_islocked>:
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 aa3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 aa6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 aa7:	8b 00                	mov    (%eax),%eax
}
 aa9:	c3                   	ret    
 aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ab0 <benny_self>:
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
}
 ab3:	5d                   	pop    %ebp
    return kthread_self();
 ab4:	e9 59 f9 ff ff       	jmp    412 <kthread_self>
 ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ac0 <benny_yield>:
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
    
}
 ac3:	5d                   	pop    %ebp
    return kthread_yield();
 ac4:	e9 51 f9 ff ff       	jmp    41a <kthread_yield>
 ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 ad3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 ad4:	e9 49 f9 ff ff       	jmp    422 <kthread_cpu_count>
 ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ae0 <benny_thread_count>:

int
benny_thread_count(void)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 ae3:	5d                   	pop    %ebp
    return kthread_thread_count();
 ae4:	e9 41 f9 ff ff       	jmp    42a <kthread_thread_count>
