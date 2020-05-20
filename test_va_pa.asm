
_test_va_pa:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char a = 'a';

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 e4 f0             	and    $0xfffffff0,%esp
   8:	83 ec 20             	sub    $0x20,%esp
#ifdef VA2PA
    char b = 'b';
    char *c = malloc(10);
   b:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    printf(1, " %p  \t\t  %x\tmain -> code segment\n", main, pa);

    pa = va2pa((int) &a);
    printf(1, " %p \t\t  %x\ta -> data segment\n", &a, pa);

    pa = va2pa((int) &b);
  12:	8d 74 24 1f          	lea    0x1f(%esp),%esi
    char b = 'b';
  16:	c6 44 24 1f 62       	movb   $0x62,0x1f(%esp)
    char *c = malloc(10);
  1b:	e8 40 07 00 00       	call   760 <malloc>
    printf(1, "logical addr\t physical addr\n");
  20:	c7 44 24 04 bc 0a 00 	movl   $0xabc,0x4(%esp)
  27:	00 
  28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    char *c = malloc(10);
  2f:	89 c3                	mov    %eax,%ebx
    printf(1, "logical addr\t physical addr\n");
  31:	e8 7a 04 00 00       	call   4b0 <printf>
    pa = va2pa((int) main);
  36:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3d:	e8 80 03 00 00       	call   3c2 <va2pa>
    printf(1, " %p  \t\t  %x\tmain -> code segment\n", main, pa);
  42:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  49:	00 
  4a:	c7 44 24 04 34 0b 00 	movl   $0xb34,0x4(%esp)
  51:	00 
  52:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  59:	89 44 24 0c          	mov    %eax,0xc(%esp)
  5d:	e8 4e 04 00 00       	call   4b0 <printf>
    pa = va2pa((int) &a);
  62:	c7 04 24 e8 0f 00 00 	movl   $0xfe8,(%esp)
  69:	e8 54 03 00 00       	call   3c2 <va2pa>
    printf(1, " %p \t\t  %x\ta -> data segment\n", &a, pa);
  6e:	c7 44 24 08 e8 0f 00 	movl   $0xfe8,0x8(%esp)
  75:	00 
  76:	c7 44 24 04 d9 0a 00 	movl   $0xad9,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	89 44 24 0c          	mov    %eax,0xc(%esp)
  89:	e8 22 04 00 00       	call   4b0 <printf>
    pa = va2pa((int) &b);
  8e:	89 34 24             	mov    %esi,(%esp)
  91:	e8 2c 03 00 00       	call   3c2 <va2pa>
    printf(1, " %p \t  %x\tb -> stack segment\n", &b, pa);
  96:	89 74 24 08          	mov    %esi,0x8(%esp)
  9a:	c7 44 24 04 f7 0a 00 	movl   $0xaf7,0x4(%esp)
  a1:	00 
  a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
  ad:	e8 fe 03 00 00       	call   4b0 <printf>

    pa = va2pa((int) c);
  b2:	89 1c 24             	mov    %ebx,(%esp)
  b5:	e8 08 03 00 00       	call   3c2 <va2pa>
    printf(1, " %p \t  %x\t*c -> heap segment\n", c, pa);
  ba:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  be:	c7 44 24 04 15 0b 00 	movl   $0xb15,0x4(%esp)
  c5:	00 
  c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  cd:	89 44 24 0c          	mov    %eax,0xc(%esp)
  d1:	e8 da 03 00 00       	call   4b0 <printf>
#endif // VA2PA
    exit();
  d6:	e8 27 02 00 00       	call   302 <exit>
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  e9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ea:	89 c2                	mov    %eax,%edx
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f0:	83 c1 01             	add    $0x1,%ecx
  f3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  f7:	83 c2 01             	add    $0x1,%edx
  fa:	84 db                	test   %bl,%bl
  fc:	88 5a ff             	mov    %bl,-0x1(%edx)
  ff:	75 ef                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
 101:	5b                   	pop    %ebx
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 10a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
 116:	53                   	push   %ebx
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11a:	0f b6 02             	movzbl (%edx),%eax
 11d:	84 c0                	test   %al,%al
 11f:	74 2d                	je     14e <strcmp+0x3e>
 121:	0f b6 19             	movzbl (%ecx),%ebx
 124:	38 d8                	cmp    %bl,%al
 126:	74 0e                	je     136 <strcmp+0x26>
 128:	eb 2b                	jmp    155 <strcmp+0x45>
 12a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 130:	38 c8                	cmp    %cl,%al
 132:	75 15                	jne    149 <strcmp+0x39>
    p++, q++;
 134:	89 d9                	mov    %ebx,%ecx
 136:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 139:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 13c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 13f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 143:	84 c0                	test   %al,%al
 145:	75 e9                	jne    130 <strcmp+0x20>
 147:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 149:	29 c8                	sub    %ecx,%eax
}
 14b:	5b                   	pop    %ebx
 14c:	5d                   	pop    %ebp
 14d:	c3                   	ret    
 14e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 151:	31 c0                	xor    %eax,%eax
 153:	eb f4                	jmp    149 <strcmp+0x39>
 155:	0f b6 cb             	movzbl %bl,%ecx
 158:	eb ef                	jmp    149 <strcmp+0x39>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000160 <strlen>:

uint
strlen(const char *s)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 166:	80 39 00             	cmpb   $0x0,(%ecx)
 169:	74 12                	je     17d <strlen+0x1d>
 16b:	31 d2                	xor    %edx,%edx
 16d:	8d 76 00             	lea    0x0(%esi),%esi
 170:	83 c2 01             	add    $0x1,%edx
 173:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 177:	89 d0                	mov    %edx,%eax
 179:	75 f5                	jne    170 <strlen+0x10>
    ;
  return n;
}
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 17d:	31 c0                	xor    %eax,%eax
}
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	eb 0d                	jmp    190 <memset>
 183:	90                   	nop
 184:	90                   	nop
 185:	90                   	nop
 186:	90                   	nop
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 55 08             	mov    0x8(%ebp),%edx
 196:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 197:	8b 4d 10             	mov    0x10(%ebp),%ecx
 19a:	8b 45 0c             	mov    0xc(%ebp),%eax
 19d:	89 d7                	mov    %edx,%edi
 19f:	fc                   	cld    
 1a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a2:	89 d0                	mov    %edx,%eax
 1a4:	5f                   	pop    %edi
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret    
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <strchr>:

char*
strchr(const char *s, char c)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	53                   	push   %ebx
 1b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1ba:	0f b6 18             	movzbl (%eax),%ebx
 1bd:	84 db                	test   %bl,%bl
 1bf:	74 1d                	je     1de <strchr+0x2e>
    if(*s == c)
 1c1:	38 d3                	cmp    %dl,%bl
 1c3:	89 d1                	mov    %edx,%ecx
 1c5:	75 0d                	jne    1d4 <strchr+0x24>
 1c7:	eb 17                	jmp    1e0 <strchr+0x30>
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d0:	38 ca                	cmp    %cl,%dl
 1d2:	74 0c                	je     1e0 <strchr+0x30>
  for(; *s; s++)
 1d4:	83 c0 01             	add    $0x1,%eax
 1d7:	0f b6 10             	movzbl (%eax),%edx
 1da:	84 d2                	test   %dl,%dl
 1dc:	75 f2                	jne    1d0 <strchr+0x20>
      return (char*)s;
  return 0;
 1de:	31 c0                	xor    %eax,%eax
}
 1e0:	5b                   	pop    %ebx
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <gets>:

char*
gets(char *buf, int max)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f5:	31 f6                	xor    %esi,%esi
{
 1f7:	53                   	push   %ebx
 1f8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 1fb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1fe:	eb 31                	jmp    231 <gets+0x41>
    cc = read(0, &c, 1);
 200:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 207:	00 
 208:	89 7c 24 04          	mov    %edi,0x4(%esp)
 20c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 213:	e8 02 01 00 00       	call   31a <read>
    if(cc < 1)
 218:	85 c0                	test   %eax,%eax
 21a:	7e 1d                	jle    239 <gets+0x49>
      break;
    buf[i++] = c;
 21c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 220:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 222:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 225:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 227:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 22b:	74 0c                	je     239 <gets+0x49>
 22d:	3c 0a                	cmp    $0xa,%al
 22f:	74 08                	je     239 <gets+0x49>
  for(i=0; i+1 < max; ){
 231:	8d 5e 01             	lea    0x1(%esi),%ebx
 234:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 237:	7c c7                	jl     200 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 240:	83 c4 2c             	add    $0x2c,%esp
 243:	5b                   	pop    %ebx
 244:	5e                   	pop    %esi
 245:	5f                   	pop    %edi
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000250 <stat>:

int
stat(const char *n, struct stat *st)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
 255:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 262:	00 
 263:	89 04 24             	mov    %eax,(%esp)
 266:	e8 d7 00 00 00       	call   342 <open>
  if(fd < 0)
 26b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 26d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 26f:	78 27                	js     298 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 271:	8b 45 0c             	mov    0xc(%ebp),%eax
 274:	89 1c 24             	mov    %ebx,(%esp)
 277:	89 44 24 04          	mov    %eax,0x4(%esp)
 27b:	e8 da 00 00 00       	call   35a <fstat>
  close(fd);
 280:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 283:	89 c6                	mov    %eax,%esi
  close(fd);
 285:	e8 a0 00 00 00       	call   32a <close>
  return r;
 28a:	89 f0                	mov    %esi,%eax
}
 28c:	83 c4 10             	add    $0x10,%esp
 28f:	5b                   	pop    %ebx
 290:	5e                   	pop    %esi
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	90                   	nop
 294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 298:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29d:	eb ed                	jmp    28c <stat+0x3c>
 29f:	90                   	nop

000002a0 <atoi>:

int
atoi(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2a6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a7:	0f be 11             	movsbl (%ecx),%edx
 2aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2ad:	3c 09                	cmp    $0x9,%al
  n = 0;
 2af:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2b4:	77 17                	ja     2cd <atoi+0x2d>
 2b6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2b8:	83 c1 01             	add    $0x1,%ecx
 2bb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2be:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2c2:	0f be 11             	movsbl (%ecx),%edx
 2c5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2c8:	80 fb 09             	cmp    $0x9,%bl
 2cb:	76 eb                	jbe    2b8 <atoi+0x18>
  return n;
}
 2cd:	5b                   	pop    %ebx
 2ce:	5d                   	pop    %ebp
 2cf:	c3                   	ret    

000002d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2d0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d1:	31 d2                	xor    %edx,%edx
{
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	56                   	push   %esi
 2d6:	8b 45 08             	mov    0x8(%ebp),%eax
 2d9:	53                   	push   %ebx
 2da:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2dd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 2e0:	85 db                	test   %ebx,%ebx
 2e2:	7e 12                	jle    2f6 <memmove+0x26>
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2ef:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2f2:	39 da                	cmp    %ebx,%edx
 2f4:	75 f2                	jne    2e8 <memmove+0x18>
  return vdst;
}
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fa:	b8 01 00 00 00       	mov    $0x1,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <exit>:
SYSCALL(exit)
 302:	b8 02 00 00 00       	mov    $0x2,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <wait>:
SYSCALL(wait)
 30a:	b8 03 00 00 00       	mov    $0x3,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <pipe>:
SYSCALL(pipe)
 312:	b8 04 00 00 00       	mov    $0x4,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <read>:
SYSCALL(read)
 31a:	b8 05 00 00 00       	mov    $0x5,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <write>:
SYSCALL(write)
 322:	b8 10 00 00 00       	mov    $0x10,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <close>:
SYSCALL(close)
 32a:	b8 15 00 00 00       	mov    $0x15,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <kill>:
SYSCALL(kill)
 332:	b8 06 00 00 00       	mov    $0x6,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <exec>:
SYSCALL(exec)
 33a:	b8 07 00 00 00       	mov    $0x7,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <open>:
SYSCALL(open)
 342:	b8 0f 00 00 00       	mov    $0xf,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <mknod>:
SYSCALL(mknod)
 34a:	b8 11 00 00 00       	mov    $0x11,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <unlink>:
SYSCALL(unlink)
 352:	b8 12 00 00 00       	mov    $0x12,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <fstat>:
SYSCALL(fstat)
 35a:	b8 08 00 00 00       	mov    $0x8,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <link>:
SYSCALL(link)
 362:	b8 13 00 00 00       	mov    $0x13,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <mkdir>:
SYSCALL(mkdir)
 36a:	b8 14 00 00 00       	mov    $0x14,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <chdir>:
SYSCALL(chdir)
 372:	b8 09 00 00 00       	mov    $0x9,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <dup>:
SYSCALL(dup)
 37a:	b8 0a 00 00 00       	mov    $0xa,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <getpid>:
SYSCALL(getpid)
 382:	b8 0b 00 00 00       	mov    $0xb,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <sbrk>:
SYSCALL(sbrk)
 38a:	b8 0c 00 00 00       	mov    $0xc,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <sleep>:
SYSCALL(sleep)
 392:	b8 0d 00 00 00       	mov    $0xd,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <uptime>:
SYSCALL(uptime)
 39a:	b8 0e 00 00 00       	mov    $0xe,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 3a2:	b8 16 00 00 00       	mov    $0x16,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 3aa:	b8 17 00 00 00       	mov    $0x17,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 3b2:	b8 18 00 00 00       	mov    $0x18,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 3ba:	b8 19 00 00 00       	mov    $0x19,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 3c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 3ca:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <kthread_join>:
SYSCALL(kthread_join)
 3d2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <kthread_exit>:
SYSCALL(kthread_exit)
 3da:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 3e2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <kthread_yield>:
SYSCALL(kthread_yield)
 3ea:	b8 1f 00 00 00       	mov    $0x1f,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 3f2:	b8 20 00 00 00       	mov    $0x20,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 3fa:	b8 21 00 00 00       	mov    $0x21,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    
 402:	66 90                	xchg   %ax,%ax
 404:	66 90                	xchg   %ax,%ax
 406:	66 90                	xchg   %ax,%ax
 408:	66 90                	xchg   %ax,%ax
 40a:	66 90                	xchg   %ax,%ax
 40c:	66 90                	xchg   %ax,%ax
 40e:	66 90                	xchg   %ax,%ax

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	89 c6                	mov    %eax,%esi
 417:	53                   	push   %ebx
 418:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 41e:	85 db                	test   %ebx,%ebx
 420:	74 09                	je     42b <printint+0x1b>
 422:	89 d0                	mov    %edx,%eax
 424:	c1 e8 1f             	shr    $0x1f,%eax
 427:	84 c0                	test   %al,%al
 429:	75 75                	jne    4a0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 42b:	89 d0                	mov    %edx,%eax
  neg = 0;
 42d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 434:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 437:	31 ff                	xor    %edi,%edi
 439:	89 ce                	mov    %ecx,%esi
 43b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 43e:	eb 02                	jmp    442 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 440:	89 cf                	mov    %ecx,%edi
 442:	31 d2                	xor    %edx,%edx
 444:	f7 f6                	div    %esi
 446:	8d 4f 01             	lea    0x1(%edi),%ecx
 449:	0f b6 92 5f 0b 00 00 	movzbl 0xb5f(%edx),%edx
  }while((x /= base) != 0);
 450:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 452:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 455:	75 e9                	jne    440 <printint+0x30>
  if(neg)
 457:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 45a:	89 c8                	mov    %ecx,%eax
 45c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 45f:	85 d2                	test   %edx,%edx
 461:	74 08                	je     46b <printint+0x5b>
    buf[i++] = '-';
 463:	8d 4f 02             	lea    0x2(%edi),%ecx
 466:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 46b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 46e:	66 90                	xchg   %ax,%ax
 470:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 475:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 478:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47f:	00 
 480:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 484:	89 34 24             	mov    %esi,(%esp)
 487:	88 45 d7             	mov    %al,-0x29(%ebp)
 48a:	e8 93 fe ff ff       	call   322 <write>
  while(--i >= 0)
 48f:	83 ff ff             	cmp    $0xffffffff,%edi
 492:	75 dc                	jne    470 <printint+0x60>
    putc(fd, buf[i]);
}
 494:	83 c4 4c             	add    $0x4c,%esp
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 4a0:	89 d0                	mov    %edx,%eax
 4a2:	f7 d8                	neg    %eax
    neg = 1;
 4a4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4ab:	eb 87                	jmp    434 <printint+0x24>
 4ad:	8d 76 00             	lea    0x0(%esi),%esi

000004b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4b4:	31 ff                	xor    %edi,%edi
{
 4b6:	56                   	push   %esi
 4b7:	53                   	push   %ebx
 4b8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 4be:	8d 45 10             	lea    0x10(%ebp),%eax
{
 4c1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 4c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 4c7:	0f b6 13             	movzbl (%ebx),%edx
 4ca:	83 c3 01             	add    $0x1,%ebx
 4cd:	84 d2                	test   %dl,%dl
 4cf:	75 39                	jne    50a <printf+0x5a>
 4d1:	e9 ca 00 00 00       	jmp    5a0 <printf+0xf0>
 4d6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d8:	83 fa 25             	cmp    $0x25,%edx
 4db:	0f 84 c7 00 00 00    	je     5a8 <printf+0xf8>
  write(fd, &c, 1);
 4e1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 4e4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4eb:	00 
 4ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 4f3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 4f6:	e8 27 fe ff ff       	call   322 <write>
 4fb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 4fe:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 502:	84 d2                	test   %dl,%dl
 504:	0f 84 96 00 00 00    	je     5a0 <printf+0xf0>
    if(state == 0){
 50a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 50c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 50f:	74 c7                	je     4d8 <printf+0x28>
      }
    } else if(state == '%'){
 511:	83 ff 25             	cmp    $0x25,%edi
 514:	75 e5                	jne    4fb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 516:	83 fa 75             	cmp    $0x75,%edx
 519:	0f 84 99 00 00 00    	je     5b8 <printf+0x108>
 51f:	83 fa 64             	cmp    $0x64,%edx
 522:	0f 84 90 00 00 00    	je     5b8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 528:	25 f7 00 00 00       	and    $0xf7,%eax
 52d:	83 f8 70             	cmp    $0x70,%eax
 530:	0f 84 aa 00 00 00    	je     5e0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 536:	83 fa 73             	cmp    $0x73,%edx
 539:	0f 84 e9 00 00 00    	je     628 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 53f:	83 fa 63             	cmp    $0x63,%edx
 542:	0f 84 2b 01 00 00    	je     673 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 548:	83 fa 25             	cmp    $0x25,%edx
 54b:	0f 84 4f 01 00 00    	je     6a0 <printf+0x1f0>
  write(fd, &c, 1);
 551:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 554:	83 c3 01             	add    $0x1,%ebx
 557:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 55e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 55f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 561:	89 44 24 04          	mov    %eax,0x4(%esp)
 565:	89 34 24             	mov    %esi,(%esp)
 568:	89 55 d0             	mov    %edx,-0x30(%ebp)
 56b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 56f:	e8 ae fd ff ff       	call   322 <write>
        putc(fd, c);
 574:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 577:	8d 45 e7             	lea    -0x19(%ebp),%eax
 57a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 581:	00 
 582:	89 44 24 04          	mov    %eax,0x4(%esp)
 586:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 589:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 58c:	e8 91 fd ff ff       	call   322 <write>
  for(i = 0; fmt[i]; i++){
 591:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 595:	84 d2                	test   %dl,%dl
 597:	0f 85 6d ff ff ff    	jne    50a <printf+0x5a>
 59d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 5a0:	83 c4 3c             	add    $0x3c,%esp
 5a3:	5b                   	pop    %ebx
 5a4:	5e                   	pop    %esi
 5a5:	5f                   	pop    %edi
 5a6:	5d                   	pop    %ebp
 5a7:	c3                   	ret    
        state = '%';
 5a8:	bf 25 00 00 00       	mov    $0x25,%edi
 5ad:	e9 49 ff ff ff       	jmp    4fb <printf+0x4b>
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5bf:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 5c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 5c7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 5c9:	8b 10                	mov    (%eax),%edx
 5cb:	89 f0                	mov    %esi,%eax
 5cd:	e8 3e fe ff ff       	call   410 <printint>
        ap++;
 5d2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5d6:	e9 20 ff ff ff       	jmp    4fb <printf+0x4b>
 5db:	90                   	nop
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5e0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 5e3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5ea:	00 
 5eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ef:	89 34 24             	mov    %esi,(%esp)
 5f2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 5f6:	e8 27 fd ff ff       	call   322 <write>
 5fb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 605:	00 
 606:	89 44 24 04          	mov    %eax,0x4(%esp)
 60a:	89 34 24             	mov    %esi,(%esp)
 60d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 611:	e8 0c fd ff ff       	call   322 <write>
        printint(fd, *ap, 16, 0);
 616:	b9 10 00 00 00       	mov    $0x10,%ecx
 61b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 622:	eb a0                	jmp    5c4 <printf+0x114>
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 628:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 62b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 62f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 631:	b8 58 0b 00 00       	mov    $0xb58,%eax
 636:	85 ff                	test   %edi,%edi
 638:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 63b:	0f b6 07             	movzbl (%edi),%eax
 63e:	84 c0                	test   %al,%al
 640:	74 2a                	je     66c <printf+0x1bc>
 642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 648:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 64b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 64e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 651:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 658:	00 
 659:	89 44 24 04          	mov    %eax,0x4(%esp)
 65d:	89 34 24             	mov    %esi,(%esp)
 660:	e8 bd fc ff ff       	call   322 <write>
        while(*s != 0){
 665:	0f b6 07             	movzbl (%edi),%eax
 668:	84 c0                	test   %al,%al
 66a:	75 dc                	jne    648 <printf+0x198>
      state = 0;
 66c:	31 ff                	xor    %edi,%edi
 66e:	e9 88 fe ff ff       	jmp    4fb <printf+0x4b>
        putc(fd, *ap);
 673:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 676:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 678:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 67a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 681:	00 
 682:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 685:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 688:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 68b:	89 44 24 04          	mov    %eax,0x4(%esp)
 68f:	e8 8e fc ff ff       	call   322 <write>
        ap++;
 694:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 698:	e9 5e fe ff ff       	jmp    4fb <printf+0x4b>
 69d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6a0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 6a3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6a5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6ac:	00 
 6ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b1:	89 34 24             	mov    %esi,(%esp)
 6b4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 6b8:	e8 65 fc ff ff       	call   322 <write>
 6bd:	e9 39 fe ff ff       	jmp    4fb <printf+0x4b>
 6c2:	66 90                	xchg   %ax,%ax
 6c4:	66 90                	xchg   %ax,%ax
 6c6:	66 90                	xchg   %ax,%ax
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	a1 ec 0f 00 00       	mov    0xfec,%eax
{
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	57                   	push   %edi
 6d9:	56                   	push   %esi
 6da:	53                   	push   %ebx
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6de:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 6e0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e3:	39 d0                	cmp    %edx,%eax
 6e5:	72 11                	jb     6f8 <free+0x28>
 6e7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e8:	39 c8                	cmp    %ecx,%eax
 6ea:	72 04                	jb     6f0 <free+0x20>
 6ec:	39 ca                	cmp    %ecx,%edx
 6ee:	72 10                	jb     700 <free+0x30>
 6f0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f6:	73 f0                	jae    6e8 <free+0x18>
 6f8:	39 ca                	cmp    %ecx,%edx
 6fa:	72 04                	jb     700 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6fc:	39 c8                	cmp    %ecx,%eax
 6fe:	72 f0                	jb     6f0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 700:	8b 73 fc             	mov    -0x4(%ebx),%esi
 703:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 706:	39 cf                	cmp    %ecx,%edi
 708:	74 1e                	je     728 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 70a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70d:	8b 48 04             	mov    0x4(%eax),%ecx
 710:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 713:	39 f2                	cmp    %esi,%edx
 715:	74 28                	je     73f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 717:	89 10                	mov    %edx,(%eax)
  freep = p;
 719:	a3 ec 0f 00 00       	mov    %eax,0xfec
}
 71e:	5b                   	pop    %ebx
 71f:	5e                   	pop    %esi
 720:	5f                   	pop    %edi
 721:	5d                   	pop    %ebp
 722:	c3                   	ret    
 723:	90                   	nop
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 728:	03 71 04             	add    0x4(%ecx),%esi
 72b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 72e:	8b 08                	mov    (%eax),%ecx
 730:	8b 09                	mov    (%ecx),%ecx
 732:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 735:	8b 48 04             	mov    0x4(%eax),%ecx
 738:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 73b:	39 f2                	cmp    %esi,%edx
 73d:	75 d8                	jne    717 <free+0x47>
    p->s.size += bp->s.size;
 73f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 742:	a3 ec 0f 00 00       	mov    %eax,0xfec
    p->s.size += bp->s.size;
 747:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 74a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 74d:	89 10                	mov    %edx,(%eax)
}
 74f:	5b                   	pop    %ebx
 750:	5e                   	pop    %esi
 751:	5f                   	pop    %edi
 752:	5d                   	pop    %ebp
 753:	c3                   	ret    
 754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 75a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 769:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 76c:	8b 1d ec 0f 00 00    	mov    0xfec,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 772:	8d 48 07             	lea    0x7(%eax),%ecx
 775:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 778:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 77a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 77d:	0f 84 9b 00 00 00    	je     81e <malloc+0xbe>
 783:	8b 13                	mov    (%ebx),%edx
 785:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 788:	39 fe                	cmp    %edi,%esi
 78a:	76 64                	jbe    7f0 <malloc+0x90>
 78c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 793:	bb 00 80 00 00       	mov    $0x8000,%ebx
 798:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 79b:	eb 0e                	jmp    7ab <malloc+0x4b>
 79d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7a2:	8b 78 04             	mov    0x4(%eax),%edi
 7a5:	39 fe                	cmp    %edi,%esi
 7a7:	76 4f                	jbe    7f8 <malloc+0x98>
 7a9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7ab:	3b 15 ec 0f 00 00    	cmp    0xfec,%edx
 7b1:	75 ed                	jne    7a0 <malloc+0x40>
  if(nu < 4096)
 7b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7bc:	bf 00 10 00 00       	mov    $0x1000,%edi
 7c1:	0f 43 fe             	cmovae %esi,%edi
 7c4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 7c7:	89 04 24             	mov    %eax,(%esp)
 7ca:	e8 bb fb ff ff       	call   38a <sbrk>
  if(p == (char*)-1)
 7cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d2:	74 18                	je     7ec <malloc+0x8c>
  hp->s.size = nu;
 7d4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7d7:	83 c0 08             	add    $0x8,%eax
 7da:	89 04 24             	mov    %eax,(%esp)
 7dd:	e8 ee fe ff ff       	call   6d0 <free>
  return freep;
 7e2:	8b 15 ec 0f 00 00    	mov    0xfec,%edx
      if((p = morecore(nunits)) == 0)
 7e8:	85 d2                	test   %edx,%edx
 7ea:	75 b4                	jne    7a0 <malloc+0x40>
        return 0;
 7ec:	31 c0                	xor    %eax,%eax
 7ee:	eb 20                	jmp    810 <malloc+0xb0>
    if(p->s.size >= nunits){
 7f0:	89 d0                	mov    %edx,%eax
 7f2:	89 da                	mov    %ebx,%edx
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7f8:	39 fe                	cmp    %edi,%esi
 7fa:	74 1c                	je     818 <malloc+0xb8>
        p->s.size -= nunits;
 7fc:	29 f7                	sub    %esi,%edi
 7fe:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 801:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 804:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 807:	89 15 ec 0f 00 00    	mov    %edx,0xfec
      return (void*)(p + 1);
 80d:	83 c0 08             	add    $0x8,%eax
  }
}
 810:	83 c4 1c             	add    $0x1c,%esp
 813:	5b                   	pop    %ebx
 814:	5e                   	pop    %esi
 815:	5f                   	pop    %edi
 816:	5d                   	pop    %ebp
 817:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 818:	8b 08                	mov    (%eax),%ecx
 81a:	89 0a                	mov    %ecx,(%edx)
 81c:	eb e9                	jmp    807 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 81e:	c7 05 ec 0f 00 00 f0 	movl   $0xff0,0xfec
 825:	0f 00 00 
    base.s.size = 0;
 828:	ba f0 0f 00 00       	mov    $0xff0,%edx
    base.s.ptr = freep = prevp = &base;
 82d:	c7 05 f0 0f 00 00 f0 	movl   $0xff0,0xff0
 834:	0f 00 00 
    base.s.size = 0;
 837:	c7 05 f4 0f 00 00 00 	movl   $0x0,0xff4
 83e:	00 00 00 
 841:	e9 46 ff ff ff       	jmp    78c <malloc+0x2c>
 846:	66 90                	xchg   %ax,%ax
 848:	66 90                	xchg   %ax,%ax
 84a:	66 90                	xchg   %ax,%ax
 84c:	66 90                	xchg   %ax,%ax
 84e:	66 90                	xchg   %ax,%ax

00000850 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	56                   	push   %esi
 854:	53                   	push   %ebx
 855:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 858:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 85f:	e8 fc fe ff ff       	call   760 <malloc>

    if (bt == NULL) {
 864:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 866:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 868:	74 66                	je     8d0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 86a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 871:	e8 ea fe ff ff       	call   760 <malloc>
    if (bt->bt_stack == NULL) {
 876:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 878:	89 c3                	mov    %eax,%ebx
 87a:	89 46 08             	mov    %eax,0x8(%esi)
 87d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 880:	74 5d                	je     8df <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 882:	25 ff 0f 00 00       	and    $0xfff,%eax
 887:	75 37                	jne    8c0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 889:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 88f:	8b 45 10             	mov    0x10(%ebp),%eax
 892:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 896:	89 44 24 04          	mov    %eax,0x4(%esp)
 89a:	8b 45 0c             	mov    0xc(%ebp),%eax
 89d:	89 04 24             	mov    %eax,(%esp)
 8a0:	e8 25 fb ff ff       	call   3ca <kthread_create>
    if (bt->bid != 0) {
 8a5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8a7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 8a9:	74 2d                	je     8d8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 8ab:	8b 45 08             	mov    0x8(%ebp),%eax
 8ae:	89 30                	mov    %esi,(%eax)
        result = 0;
 8b0:	31 c0                	xor    %eax,%eax
}
 8b2:	83 c4 10             	add    $0x10,%esp
 8b5:	5b                   	pop    %ebx
 8b6:	5e                   	pop    %esi
 8b7:	5d                   	pop    %ebp
 8b8:	c3                   	ret    
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 8c0:	29 c3                	sub    %eax,%ebx
 8c2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 8c8:	89 5e 04             	mov    %ebx,0x4(%esi)
 8cb:	eb bc                	jmp    889 <benny_thread_create+0x39>
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
 8d0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 8d6:	eb b7                	jmp    88f <benny_thread_create+0x3f>
    int result = -1;
 8d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8dd:	eb d3                	jmp    8b2 <benny_thread_create+0x62>
        free(bt);
 8df:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 8e2:	31 f6                	xor    %esi,%esi
        free(bt);
 8e4:	e8 e7 fd ff ff       	call   6d0 <free>
 8e9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 8ec:	eb a1                	jmp    88f <benny_thread_create+0x3f>
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <benny_thread_bid>:
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 8f3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8f6:	5d                   	pop    %ebp
    return bt->bid;
 8f7:	8b 00                	mov    (%eax),%eax
}
 8f9:	c3                   	ret    
 8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000900 <benny_thread_join>:
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	53                   	push   %ebx
 904:	83 ec 14             	sub    $0x14,%esp
 907:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 90a:	8b 03                	mov    (%ebx),%eax
 90c:	89 04 24             	mov    %eax,(%esp)
 90f:	e8 be fa ff ff       	call   3d2 <kthread_join>
    if (retVal == 0) {
 914:	85 c0                	test   %eax,%eax
 916:	75 27                	jne    93f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 918:	8b 53 08             	mov    0x8(%ebx),%edx
 91b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 91e:	89 14 24             	mov    %edx,(%esp)
 921:	e8 aa fd ff ff       	call   6d0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 926:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 92d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 934:	89 1c 24             	mov    %ebx,(%esp)
 937:	e8 94 fd ff ff       	call   6d0 <free>
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 93f:	83 c4 14             	add    $0x14,%esp
 942:	5b                   	pop    %ebx
 943:	5d                   	pop    %ebp
 944:	c3                   	ret    
 945:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000950 <benny_thread_exit>:
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
}
 953:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 954:	e9 81 fa ff ff       	jmp    3da <kthread_exit>
 959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000960 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 966:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 96c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 973:	31 c0                	xor    %eax,%eax
 975:	5d                   	pop    %ebp
 976:	c3                   	ret    
 977:	89 f6                	mov    %esi,%esi
 979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000980 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 980:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 981:	b8 01 00 00 00       	mov    $0x1,%eax
 986:	89 e5                	mov    %esp,%ebp
 988:	56                   	push   %esi
 989:	53                   	push   %ebx
 98a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 98d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 990:	85 c0                	test   %eax,%eax
 992:	be 01 00 00 00       	mov    $0x1,%esi
 997:	74 15                	je     9ae <benny_mootex_yieldlock+0x2e>
 999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 9a0:	e8 45 fa ff ff       	call   3ea <kthread_yield>
 9a5:	89 f0                	mov    %esi,%eax
 9a7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 9aa:	85 c0                	test   %eax,%eax
 9ac:	75 f2                	jne    9a0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 9ae:	e8 2f fa ff ff       	call   3e2 <kthread_self>
    benny_mootex->bid = benny_self();
 9b3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9b6:	31 c0                	xor    %eax,%eax
 9b8:	5b                   	pop    %ebx
 9b9:	5e                   	pop    %esi
 9ba:	5d                   	pop    %ebp
 9bb:	c3                   	ret    
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <benny_mootex_spinlock>:
{
 9c0:	55                   	push   %ebp
 9c1:	ba 01 00 00 00       	mov    $0x1,%edx
 9c6:	89 e5                	mov    %esp,%ebp
 9c8:	53                   	push   %ebx
 9c9:	83 ec 04             	sub    $0x4,%esp
 9cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9cf:	90                   	nop
 9d0:	89 d0                	mov    %edx,%eax
 9d2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 9d5:	85 c0                	test   %eax,%eax
 9d7:	75 f7                	jne    9d0 <benny_mootex_spinlock+0x10>
    return kthread_self();
 9d9:	e8 04 fa ff ff       	call   3e2 <kthread_self>
    benny_mootex->bid = benny_self();
 9de:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9e1:	83 c4 04             	add    $0x4,%esp
 9e4:	31 c0                	xor    %eax,%eax
 9e6:	5b                   	pop    %ebx
 9e7:	5d                   	pop    %ebp
 9e8:	c3                   	ret    
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009f0 <benny_mootex_unlock>:
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
 9f3:	53                   	push   %ebx
 9f4:	83 ec 04             	sub    $0x4,%esp
 9f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 9fa:	e8 e3 f9 ff ff       	call   3e2 <kthread_self>
    if(tid == benny_mootex->bid){
 9ff:	39 43 04             	cmp    %eax,0x4(%ebx)
 a02:	75 1c                	jne    a20 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 a04:	0f ae f0             	mfence 
    return 0;
 a07:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 a09:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 a10:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 a16:	83 c4 04             	add    $0x4,%esp
 a19:	5b                   	pop    %ebx
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    
 a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a20:	83 c4 04             	add    $0x4,%esp
      return -1;
 a23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a28:	5b                   	pop    %ebx
 a29:	5d                   	pop    %ebp
 a2a:	c3                   	ret    
 a2b:	90                   	nop
 a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_mootex_trylock>:
{
 a30:	55                   	push   %ebp
 a31:	b8 01 00 00 00       	mov    $0x1,%eax
 a36:	89 e5                	mov    %esp,%ebp
 a38:	53                   	push   %ebx
 a39:	83 ec 04             	sub    $0x4,%esp
 a3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a3f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 a42:	85 c0                	test   %eax,%eax
 a44:	75 08                	jne    a4e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 a46:	e8 97 f9 ff ff       	call   3e2 <kthread_self>
        benny_mootex->bid = tid;
 a4b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a4e:	83 c4 04             	add    $0x4,%esp
 a51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a56:	5b                   	pop    %ebx
 a57:	5d                   	pop    %ebp
 a58:	c3                   	ret    
 a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a60 <benny_mootex_wholock>:
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 a63:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a66:	5d                   	pop    %ebp
    return benny_mootex->bid;
 a67:	8b 40 04             	mov    0x4(%eax),%eax
}
 a6a:	c3                   	ret    
 a6b:	90                   	nop
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <benny_mootex_islocked>:
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 a73:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a76:	5d                   	pop    %ebp
    return benny_mootex->locked;
 a77:	8b 00                	mov    (%eax),%eax
}
 a79:	c3                   	ret    
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a80 <benny_self>:
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
}
 a83:	5d                   	pop    %ebp
    return kthread_self();
 a84:	e9 59 f9 ff ff       	jmp    3e2 <kthread_self>
 a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a90 <benny_yield>:
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
    
}
 a93:	5d                   	pop    %ebp
    return kthread_yield();
 a94:	e9 51 f9 ff ff       	jmp    3ea <kthread_yield>
 a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 aa3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 aa4:	e9 49 f9 ff ff       	jmp    3f2 <kthread_cpu_count>
 aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <benny_thread_count>:

int
benny_thread_count(void)
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 ab3:	5d                   	pop    %ebp
    return kthread_thread_count();
 ab4:	e9 41 f9 ff ff       	jmp    3fa <kthread_thread_count>
