
_mult:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
# define MAXINT ((~ 0x0) & (~ (0x1 << (INTBITS - 1))))
#endif // MAXINT

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 20             	sub    $0x20,%esp
  int i;
  int j;
  int max = MAXINT;
  int sum = 0;

  if(argc > 1) {
   c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  10:	7e 60                	jle    72 <main+0x72>
    // change the upper bound on the iteration loops.
    max = atoi(argv[1]);
  12:	8b 45 0c             	mov    0xc(%ebp),%eax
  15:	8b 40 04             	mov    0x4(%eax),%eax
  18:	89 04 24             	mov    %eax,(%esp)
  1b:	e8 d0 02 00 00       	call   2f0 <atoi>
  20:	89 c7                	mov    %eax,%edi
  }
  printf(1, "mult begin: pid = %d     max = %d\n", getpid(), max);
  22:	e8 ab 03 00 00       	call   3d2 <getpid>
  27:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  2b:	c7 44 24 04 0c 0b 00 	movl   $0xb0c,0x4(%esp)
  32:	00 
  33:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3a:	89 44 24 08          	mov    %eax,0x8(%esp)
  3e:	e8 bd 04 00 00       	call   500 <printf>

  for (j = 0; j < max; j++) {
  43:	85 ff                	test   %edi,%edi
  45:	7e 05                	jle    4c <main+0x4c>
    for(i = 1; i < max; i++) {
  47:	83 ff 01             	cmp    $0x1,%edi
  4a:	75 50                	jne    9c <main+0x9c>
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if (sum > (MAXINT / 2)) {
        sum = 0;
      }
    }
  }
  printf(1, "mult done: pid = %d\n", getpid());
  50:	e8 7d 03 00 00       	call   3d2 <getpid>
  55:	c7 44 24 04 40 0b 00 	movl   $0xb40,0x4(%esp)
  5c:	00 
  5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  64:	89 44 24 08          	mov    %eax,0x8(%esp)
  68:	e8 93 04 00 00       	call   500 <printf>

  // in xv6, exit() does not take a parameter.
  exit();
  6d:	e8 e0 02 00 00       	call   352 <exit>
  printf(1, "mult begin: pid = %d     max = %d\n", getpid(), max);
  72:	e8 5b 03 00 00       	call   3d2 <getpid>
  int max = MAXINT;
  77:	bf ff ff ff 7f       	mov    $0x7fffffff,%edi
  printf(1, "mult begin: pid = %d     max = %d\n", getpid(), max);
  7c:	c7 44 24 0c ff ff ff 	movl   $0x7fffffff,0xc(%esp)
  83:	7f 
  84:	c7 44 24 04 0c 0b 00 	movl   $0xb0c,0x4(%esp)
  8b:	00 
  8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  93:	89 44 24 08          	mov    %eax,0x8(%esp)
  97:	e8 64 04 00 00       	call   500 <printf>
    for(i = 1; i < max; i++) {
  9c:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  a3:	00 
  a4:	31 db                	xor    %ebx,%ebx
      if (sum % (MAXSHORT * MAXSHORT) == 0) {
  a6:	b9 03 00 ff 3f       	mov    $0x3fff0003,%ecx
  ab:	90                   	nop
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  b0:	be 01 00 00 00       	mov    $0x1,%esi
  b5:	eb 16                	jmp    cd <main+0xcd>
  b7:	90                   	nop
        sum = 0;
  b8:	81 fb 00 00 00 40    	cmp    $0x40000000,%ebx
  be:	b8 00 00 00 00       	mov    $0x0,%eax
  c3:	0f 4d d8             	cmovge %eax,%ebx
    for(i = 1; i < max; i++) {
  c6:	83 c6 01             	add    $0x1,%esi
  c9:	39 fe                	cmp    %edi,%esi
  cb:	74 4b                	je     118 <main+0x118>
      sum ++;
  cd:	83 c3 01             	add    $0x1,%ebx
      if (sum % (MAXSHORT * MAXSHORT) == 0) {
  d0:	89 d8                	mov    %ebx,%eax
  d2:	f7 e9                	imul   %ecx
  d4:	89 d8                	mov    %ebx,%eax
  d6:	c1 f8 1f             	sar    $0x1f,%eax
  d9:	c1 fa 1c             	sar    $0x1c,%edx
  dc:	29 c2                	sub    %eax,%edx
  de:	69 d2 01 00 01 40    	imul   $0x40010001,%edx,%edx
  e4:	39 d3                	cmp    %edx,%ebx
  e6:	75 d0                	jne    b8 <main+0xb8>
  e8:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
        printf(1, "  mult: %d  %d\n", getpid(), sum);
  ec:	e8 e1 02 00 00       	call   3d2 <getpid>
  f1:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  f5:	c7 44 24 04 30 0b 00 	movl   $0xb30,0x4(%esp)
  fc:	00 
  fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 104:	89 44 24 08          	mov    %eax,0x8(%esp)
 108:	e8 f3 03 00 00       	call   500 <printf>
 10d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
 111:	eb a5                	jmp    b8 <main+0xb8>
 113:	90                   	nop
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (j = 0; j < max; j++) {
 118:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
 11d:	39 7c 24 18          	cmp    %edi,0x18(%esp)
 121:	7c 8d                	jl     b0 <main+0xb0>
 123:	e9 24 ff ff ff       	jmp    4c <main+0x4c>
 128:	66 90                	xchg   %ax,%ax
 12a:	66 90                	xchg   %ax,%ax
 12c:	66 90                	xchg   %ax,%ax
 12e:	66 90                	xchg   %ax,%ax

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 139:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 13a:	89 c2                	mov    %eax,%edx
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	83 c1 01             	add    $0x1,%ecx
 143:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 147:	83 c2 01             	add    $0x1,%edx
 14a:	84 db                	test   %bl,%bl
 14c:	88 5a ff             	mov    %bl,-0x1(%edx)
 14f:	75 ef                	jne    140 <strcpy+0x10>
    ;
  return os;
}
 151:	5b                   	pop    %ebx
 152:	5d                   	pop    %ebp
 153:	c3                   	ret    
 154:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 15a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000160 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 55 08             	mov    0x8(%ebp),%edx
 166:	53                   	push   %ebx
 167:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 16a:	0f b6 02             	movzbl (%edx),%eax
 16d:	84 c0                	test   %al,%al
 16f:	74 2d                	je     19e <strcmp+0x3e>
 171:	0f b6 19             	movzbl (%ecx),%ebx
 174:	38 d8                	cmp    %bl,%al
 176:	74 0e                	je     186 <strcmp+0x26>
 178:	eb 2b                	jmp    1a5 <strcmp+0x45>
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 180:	38 c8                	cmp    %cl,%al
 182:	75 15                	jne    199 <strcmp+0x39>
    p++, q++;
 184:	89 d9                	mov    %ebx,%ecx
 186:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 189:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 18c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 18f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 193:	84 c0                	test   %al,%al
 195:	75 e9                	jne    180 <strcmp+0x20>
 197:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 199:	29 c8                	sub    %ecx,%eax
}
 19b:	5b                   	pop    %ebx
 19c:	5d                   	pop    %ebp
 19d:	c3                   	ret    
 19e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 1a1:	31 c0                	xor    %eax,%eax
 1a3:	eb f4                	jmp    199 <strcmp+0x39>
 1a5:	0f b6 cb             	movzbl %bl,%ecx
 1a8:	eb ef                	jmp    199 <strcmp+0x39>
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 39 00             	cmpb   $0x0,(%ecx)
 1b9:	74 12                	je     1cd <strlen+0x1d>
 1bb:	31 d2                	xor    %edx,%edx
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c2 01             	add    $0x1,%edx
 1c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 1cd:	31 c0                	xor    %eax,%eax
}
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	eb 0d                	jmp    1e0 <memset>
 1d3:	90                   	nop
 1d4:	90                   	nop
 1d5:	90                   	nop
 1d6:	90                   	nop
 1d7:	90                   	nop
 1d8:	90                   	nop
 1d9:	90                   	nop
 1da:	90                   	nop
 1db:	90                   	nop
 1dc:	90                   	nop
 1dd:	90                   	nop
 1de:	90                   	nop
 1df:	90                   	nop

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
 1e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld    
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	89 d0                	mov    %edx,%eax
 1f4:	5f                   	pop    %edi
 1f5:	5d                   	pop    %ebp
 1f6:	c3                   	ret    
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	53                   	push   %ebx
 207:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 20a:	0f b6 18             	movzbl (%eax),%ebx
 20d:	84 db                	test   %bl,%bl
 20f:	74 1d                	je     22e <strchr+0x2e>
    if(*s == c)
 211:	38 d3                	cmp    %dl,%bl
 213:	89 d1                	mov    %edx,%ecx
 215:	75 0d                	jne    224 <strchr+0x24>
 217:	eb 17                	jmp    230 <strchr+0x30>
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 220:	38 ca                	cmp    %cl,%dl
 222:	74 0c                	je     230 <strchr+0x30>
  for(; *s; s++)
 224:	83 c0 01             	add    $0x1,%eax
 227:	0f b6 10             	movzbl (%eax),%edx
 22a:	84 d2                	test   %dl,%dl
 22c:	75 f2                	jne    220 <strchr+0x20>
      return (char*)s;
  return 0;
 22e:	31 c0                	xor    %eax,%eax
}
 230:	5b                   	pop    %ebx
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 245:	31 f6                	xor    %esi,%esi
{
 247:	53                   	push   %ebx
 248:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 24b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 24e:	eb 31                	jmp    281 <gets+0x41>
    cc = read(0, &c, 1);
 250:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 257:	00 
 258:	89 7c 24 04          	mov    %edi,0x4(%esp)
 25c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 263:	e8 02 01 00 00       	call   36a <read>
    if(cc < 1)
 268:	85 c0                	test   %eax,%eax
 26a:	7e 1d                	jle    289 <gets+0x49>
      break;
    buf[i++] = c;
 26c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 270:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 272:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 275:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 277:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 27b:	74 0c                	je     289 <gets+0x49>
 27d:	3c 0a                	cmp    $0xa,%al
 27f:	74 08                	je     289 <gets+0x49>
  for(i=0; i+1 < max; ){
 281:	8d 5e 01             	lea    0x1(%esi),%ebx
 284:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 287:	7c c7                	jl     250 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 290:	83 c4 2c             	add    $0x2c,%esp
 293:	5b                   	pop    %ebx
 294:	5e                   	pop    %esi
 295:	5f                   	pop    %edi
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	90                   	nop
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	53                   	push   %ebx
 2a5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b2:	00 
 2b3:	89 04 24             	mov    %eax,(%esp)
 2b6:	e8 d7 00 00 00       	call   392 <open>
  if(fd < 0)
 2bb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 2bd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2bf:	78 27                	js     2e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c4:	89 1c 24             	mov    %ebx,(%esp)
 2c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cb:	e8 da 00 00 00       	call   3aa <fstat>
  close(fd);
 2d0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2d3:	89 c6                	mov    %eax,%esi
  close(fd);
 2d5:	e8 a0 00 00 00       	call   37a <close>
  return r;
 2da:	89 f0                	mov    %esi,%eax
}
 2dc:	83 c4 10             	add    $0x10,%esp
 2df:	5b                   	pop    %ebx
 2e0:	5e                   	pop    %esi
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    
 2e3:	90                   	nop
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ed:	eb ed                	jmp    2dc <stat+0x3c>
 2ef:	90                   	nop

000002f0 <atoi>:

int
atoi(const char *s)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f7:	0f be 11             	movsbl (%ecx),%edx
 2fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2fd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 304:	77 17                	ja     31d <atoi+0x2d>
 306:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 308:	83 c1 01             	add    $0x1,%ecx
 30b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 30e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 312:	0f be 11             	movsbl (%ecx),%edx
 315:	8d 5a d0             	lea    -0x30(%edx),%ebx
 318:	80 fb 09             	cmp    $0x9,%bl
 31b:	76 eb                	jbe    308 <atoi+0x18>
  return n;
}
 31d:	5b                   	pop    %ebx
 31e:	5d                   	pop    %ebp
 31f:	c3                   	ret    

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 321:	31 d2                	xor    %edx,%edx
{
 323:	89 e5                	mov    %esp,%ebp
 325:	56                   	push   %esi
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	53                   	push   %ebx
 32a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 32d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 330:	85 db                	test   %ebx,%ebx
 332:	7e 12                	jle    346 <memmove+0x26>
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 33f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 342:	39 da                	cmp    %ebx,%edx
 344:	75 f2                	jne    338 <memmove+0x18>
  return vdst;
}
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    

0000034a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34a:	b8 01 00 00 00       	mov    $0x1,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <exit>:
SYSCALL(exit)
 352:	b8 02 00 00 00       	mov    $0x2,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <wait>:
SYSCALL(wait)
 35a:	b8 03 00 00 00       	mov    $0x3,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <pipe>:
SYSCALL(pipe)
 362:	b8 04 00 00 00       	mov    $0x4,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <read>:
SYSCALL(read)
 36a:	b8 05 00 00 00       	mov    $0x5,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <write>:
SYSCALL(write)
 372:	b8 10 00 00 00       	mov    $0x10,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <close>:
SYSCALL(close)
 37a:	b8 15 00 00 00       	mov    $0x15,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <kill>:
SYSCALL(kill)
 382:	b8 06 00 00 00       	mov    $0x6,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <exec>:
SYSCALL(exec)
 38a:	b8 07 00 00 00       	mov    $0x7,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <open>:
SYSCALL(open)
 392:	b8 0f 00 00 00       	mov    $0xf,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <mknod>:
SYSCALL(mknod)
 39a:	b8 11 00 00 00       	mov    $0x11,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <unlink>:
SYSCALL(unlink)
 3a2:	b8 12 00 00 00       	mov    $0x12,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <fstat>:
SYSCALL(fstat)
 3aa:	b8 08 00 00 00       	mov    $0x8,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <link>:
SYSCALL(link)
 3b2:	b8 13 00 00 00       	mov    $0x13,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <mkdir>:
SYSCALL(mkdir)
 3ba:	b8 14 00 00 00       	mov    $0x14,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <chdir>:
SYSCALL(chdir)
 3c2:	b8 09 00 00 00       	mov    $0x9,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <dup>:
SYSCALL(dup)
 3ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getpid>:
SYSCALL(getpid)
 3d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <sbrk>:
SYSCALL(sbrk)
 3da:	b8 0c 00 00 00       	mov    $0xc,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <sleep>:
SYSCALL(sleep)
 3e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <uptime>:
SYSCALL(uptime)
 3ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 3f2:	b8 16 00 00 00       	mov    $0x16,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 3fa:	b8 17 00 00 00       	mov    $0x17,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 402:	b8 18 00 00 00       	mov    $0x18,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 40a:	b8 19 00 00 00       	mov    $0x19,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 412:	b8 1a 00 00 00       	mov    $0x1a,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 41a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kthread_join>:
SYSCALL(kthread_join)
 422:	b8 1c 00 00 00       	mov    $0x1c,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <kthread_exit>:
SYSCALL(kthread_exit)
 42a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 432:	b8 1e 00 00 00       	mov    $0x1e,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <kthread_yield>:
SYSCALL(kthread_yield)
 43a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 442:	b8 20 00 00 00       	mov    $0x20,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 44a:	b8 21 00 00 00       	mov    $0x21,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    
 452:	66 90                	xchg   %ax,%ax
 454:	66 90                	xchg   %ax,%ax
 456:	66 90                	xchg   %ax,%ax
 458:	66 90                	xchg   %ax,%ax
 45a:	66 90                	xchg   %ax,%ax
 45c:	66 90                	xchg   %ax,%ax
 45e:	66 90                	xchg   %ax,%ax

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	89 c6                	mov    %eax,%esi
 467:	53                   	push   %ebx
 468:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 46b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 46e:	85 db                	test   %ebx,%ebx
 470:	74 09                	je     47b <printint+0x1b>
 472:	89 d0                	mov    %edx,%eax
 474:	c1 e8 1f             	shr    $0x1f,%eax
 477:	84 c0                	test   %al,%al
 479:	75 75                	jne    4f0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 47b:	89 d0                	mov    %edx,%eax
  neg = 0;
 47d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 484:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 487:	31 ff                	xor    %edi,%edi
 489:	89 ce                	mov    %ecx,%esi
 48b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 48e:	eb 02                	jmp    492 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 490:	89 cf                	mov    %ecx,%edi
 492:	31 d2                	xor    %edx,%edx
 494:	f7 f6                	div    %esi
 496:	8d 4f 01             	lea    0x1(%edi),%ecx
 499:	0f b6 92 5c 0b 00 00 	movzbl 0xb5c(%edx),%edx
  }while((x /= base) != 0);
 4a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4a2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4a5:	75 e9                	jne    490 <printint+0x30>
  if(neg)
 4a7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 4aa:	89 c8                	mov    %ecx,%eax
 4ac:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 4af:	85 d2                	test   %edx,%edx
 4b1:	74 08                	je     4bb <printint+0x5b>
    buf[i++] = '-';
 4b3:	8d 4f 02             	lea    0x2(%edi),%ecx
 4b6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 4bb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4be:	66 90                	xchg   %ax,%ax
 4c0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4c5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 4c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4cf:	00 
 4d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4d4:	89 34 24             	mov    %esi,(%esp)
 4d7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4da:	e8 93 fe ff ff       	call   372 <write>
  while(--i >= 0)
 4df:	83 ff ff             	cmp    $0xffffffff,%edi
 4e2:	75 dc                	jne    4c0 <printint+0x60>
    putc(fd, buf[i]);
}
 4e4:	83 c4 4c             	add    $0x4c,%esp
 4e7:	5b                   	pop    %ebx
 4e8:	5e                   	pop    %esi
 4e9:	5f                   	pop    %edi
 4ea:	5d                   	pop    %ebp
 4eb:	c3                   	ret    
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 4f0:	89 d0                	mov    %edx,%eax
 4f2:	f7 d8                	neg    %eax
    neg = 1;
 4f4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4fb:	eb 87                	jmp    484 <printint+0x24>
 4fd:	8d 76 00             	lea    0x0(%esi),%esi

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 504:	31 ff                	xor    %edi,%edi
{
 506:	56                   	push   %esi
 507:	53                   	push   %ebx
 508:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 50b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 50e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 511:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 514:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 517:	0f b6 13             	movzbl (%ebx),%edx
 51a:	83 c3 01             	add    $0x1,%ebx
 51d:	84 d2                	test   %dl,%dl
 51f:	75 39                	jne    55a <printf+0x5a>
 521:	e9 ca 00 00 00       	jmp    5f0 <printf+0xf0>
 526:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 528:	83 fa 25             	cmp    $0x25,%edx
 52b:	0f 84 c7 00 00 00    	je     5f8 <printf+0xf8>
  write(fd, &c, 1);
 531:	8d 45 e0             	lea    -0x20(%ebp),%eax
 534:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 53b:	00 
 53c:	89 44 24 04          	mov    %eax,0x4(%esp)
 540:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 543:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 546:	e8 27 fe ff ff       	call   372 <write>
 54b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 54e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 552:	84 d2                	test   %dl,%dl
 554:	0f 84 96 00 00 00    	je     5f0 <printf+0xf0>
    if(state == 0){
 55a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 55c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 55f:	74 c7                	je     528 <printf+0x28>
      }
    } else if(state == '%'){
 561:	83 ff 25             	cmp    $0x25,%edi
 564:	75 e5                	jne    54b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 566:	83 fa 75             	cmp    $0x75,%edx
 569:	0f 84 99 00 00 00    	je     608 <printf+0x108>
 56f:	83 fa 64             	cmp    $0x64,%edx
 572:	0f 84 90 00 00 00    	je     608 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 578:	25 f7 00 00 00       	and    $0xf7,%eax
 57d:	83 f8 70             	cmp    $0x70,%eax
 580:	0f 84 aa 00 00 00    	je     630 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 586:	83 fa 73             	cmp    $0x73,%edx
 589:	0f 84 e9 00 00 00    	je     678 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58f:	83 fa 63             	cmp    $0x63,%edx
 592:	0f 84 2b 01 00 00    	je     6c3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 598:	83 fa 25             	cmp    $0x25,%edx
 59b:	0f 84 4f 01 00 00    	je     6f0 <printf+0x1f0>
  write(fd, &c, 1);
 5a1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5a4:	83 c3 01             	add    $0x1,%ebx
 5a7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5ae:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5af:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b5:	89 34 24             	mov    %esi,(%esp)
 5b8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5bb:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 5bf:	e8 ae fd ff ff       	call   372 <write>
        putc(fd, c);
 5c4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 5c7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ca:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d1:	00 
 5d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 5d9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5dc:	e8 91 fd ff ff       	call   372 <write>
  for(i = 0; fmt[i]; i++){
 5e1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5e5:	84 d2                	test   %dl,%dl
 5e7:	0f 85 6d ff ff ff    	jne    55a <printf+0x5a>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 5f0:	83 c4 3c             	add    $0x3c,%esp
 5f3:	5b                   	pop    %ebx
 5f4:	5e                   	pop    %esi
 5f5:	5f                   	pop    %edi
 5f6:	5d                   	pop    %ebp
 5f7:	c3                   	ret    
        state = '%';
 5f8:	bf 25 00 00 00       	mov    $0x25,%edi
 5fd:	e9 49 ff ff ff       	jmp    54b <printf+0x4b>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 608:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 60f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 614:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 617:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 619:	8b 10                	mov    (%eax),%edx
 61b:	89 f0                	mov    %esi,%eax
 61d:	e8 3e fe ff ff       	call   460 <printint>
        ap++;
 622:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 626:	e9 20 ff ff ff       	jmp    54b <printf+0x4b>
 62b:	90                   	nop
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 630:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 633:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 63a:	00 
 63b:	89 44 24 04          	mov    %eax,0x4(%esp)
 63f:	89 34 24             	mov    %esi,(%esp)
 642:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 646:	e8 27 fd ff ff       	call   372 <write>
 64b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 64e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 655:	00 
 656:	89 44 24 04          	mov    %eax,0x4(%esp)
 65a:	89 34 24             	mov    %esi,(%esp)
 65d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 661:	e8 0c fd ff ff       	call   372 <write>
        printint(fd, *ap, 16, 0);
 666:	b9 10 00 00 00       	mov    $0x10,%ecx
 66b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 672:	eb a0                	jmp    614 <printf+0x114>
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 678:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 67b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 67f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 681:	b8 55 0b 00 00       	mov    $0xb55,%eax
 686:	85 ff                	test   %edi,%edi
 688:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 68b:	0f b6 07             	movzbl (%edi),%eax
 68e:	84 c0                	test   %al,%al
 690:	74 2a                	je     6bc <printf+0x1bc>
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 698:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 69b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 69e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 6a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6a8:	00 
 6a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ad:	89 34 24             	mov    %esi,(%esp)
 6b0:	e8 bd fc ff ff       	call   372 <write>
        while(*s != 0){
 6b5:	0f b6 07             	movzbl (%edi),%eax
 6b8:	84 c0                	test   %al,%al
 6ba:	75 dc                	jne    698 <printf+0x198>
      state = 0;
 6bc:	31 ff                	xor    %edi,%edi
 6be:	e9 88 fe ff ff       	jmp    54b <printf+0x4b>
        putc(fd, *ap);
 6c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6c6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 6c8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6ca:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6d1:	00 
 6d2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 6d5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6d8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6db:	89 44 24 04          	mov    %eax,0x4(%esp)
 6df:	e8 8e fc ff ff       	call   372 <write>
        ap++;
 6e4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6e8:	e9 5e fe ff ff       	jmp    54b <printf+0x4b>
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6f0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 6f3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6f5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6fc:	00 
 6fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 701:	89 34 24             	mov    %esi,(%esp)
 704:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 708:	e8 65 fc ff ff       	call   372 <write>
 70d:	e9 39 fe ff ff       	jmp    54b <printf+0x4b>
 712:	66 90                	xchg   %ax,%ax
 714:	66 90                	xchg   %ax,%ax
 716:	66 90                	xchg   %ax,%ax
 718:	66 90                	xchg   %ax,%ax
 71a:	66 90                	xchg   %ax,%ax
 71c:	66 90                	xchg   %ax,%ax
 71e:	66 90                	xchg   %ax,%ax

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 e8 0f 00 00       	mov    0xfe8,%eax
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 730:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 733:	39 d0                	cmp    %edx,%eax
 735:	72 11                	jb     748 <free+0x28>
 737:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 738:	39 c8                	cmp    %ecx,%eax
 73a:	72 04                	jb     740 <free+0x20>
 73c:	39 ca                	cmp    %ecx,%edx
 73e:	72 10                	jb     750 <free+0x30>
 740:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 742:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 744:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 746:	73 f0                	jae    738 <free+0x18>
 748:	39 ca                	cmp    %ecx,%edx
 74a:	72 04                	jb     750 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74c:	39 c8                	cmp    %ecx,%eax
 74e:	72 f0                	jb     740 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 750:	8b 73 fc             	mov    -0x4(%ebx),%esi
 753:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 756:	39 cf                	cmp    %ecx,%edi
 758:	74 1e                	je     778 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 75a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 48 04             	mov    0x4(%eax),%ecx
 760:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 763:	39 f2                	cmp    %esi,%edx
 765:	74 28                	je     78f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 767:	89 10                	mov    %edx,(%eax)
  freep = p;
 769:	a3 e8 0f 00 00       	mov    %eax,0xfe8
}
 76e:	5b                   	pop    %ebx
 76f:	5e                   	pop    %esi
 770:	5f                   	pop    %edi
 771:	5d                   	pop    %ebp
 772:	c3                   	ret    
 773:	90                   	nop
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 778:	03 71 04             	add    0x4(%ecx),%esi
 77b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 77e:	8b 08                	mov    (%eax),%ecx
 780:	8b 09                	mov    (%ecx),%ecx
 782:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 785:	8b 48 04             	mov    0x4(%eax),%ecx
 788:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 78b:	39 f2                	cmp    %esi,%edx
 78d:	75 d8                	jne    767 <free+0x47>
    p->s.size += bp->s.size;
 78f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 792:	a3 e8 0f 00 00       	mov    %eax,0xfe8
    p->s.size += bp->s.size;
 797:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 79a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 79d:	89 10                	mov    %edx,(%eax)
}
 79f:	5b                   	pop    %ebx
 7a0:	5e                   	pop    %esi
 7a1:	5f                   	pop    %edi
 7a2:	5d                   	pop    %ebp
 7a3:	c3                   	ret    
 7a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7bc:	8b 1d e8 0f 00 00    	mov    0xfe8,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c2:	8d 48 07             	lea    0x7(%eax),%ecx
 7c5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 7c8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ca:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 7cd:	0f 84 9b 00 00 00    	je     86e <malloc+0xbe>
 7d3:	8b 13                	mov    (%ebx),%edx
 7d5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7d8:	39 fe                	cmp    %edi,%esi
 7da:	76 64                	jbe    840 <malloc+0x90>
 7dc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 7e3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 7e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7eb:	eb 0e                	jmp    7fb <malloc+0x4b>
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7f2:	8b 78 04             	mov    0x4(%eax),%edi
 7f5:	39 fe                	cmp    %edi,%esi
 7f7:	76 4f                	jbe    848 <malloc+0x98>
 7f9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7fb:	3b 15 e8 0f 00 00    	cmp    0xfe8,%edx
 801:	75 ed                	jne    7f0 <malloc+0x40>
  if(nu < 4096)
 803:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 806:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 80c:	bf 00 10 00 00       	mov    $0x1000,%edi
 811:	0f 43 fe             	cmovae %esi,%edi
 814:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 817:	89 04 24             	mov    %eax,(%esp)
 81a:	e8 bb fb ff ff       	call   3da <sbrk>
  if(p == (char*)-1)
 81f:	83 f8 ff             	cmp    $0xffffffff,%eax
 822:	74 18                	je     83c <malloc+0x8c>
  hp->s.size = nu;
 824:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 827:	83 c0 08             	add    $0x8,%eax
 82a:	89 04 24             	mov    %eax,(%esp)
 82d:	e8 ee fe ff ff       	call   720 <free>
  return freep;
 832:	8b 15 e8 0f 00 00    	mov    0xfe8,%edx
      if((p = morecore(nunits)) == 0)
 838:	85 d2                	test   %edx,%edx
 83a:	75 b4                	jne    7f0 <malloc+0x40>
        return 0;
 83c:	31 c0                	xor    %eax,%eax
 83e:	eb 20                	jmp    860 <malloc+0xb0>
    if(p->s.size >= nunits){
 840:	89 d0                	mov    %edx,%eax
 842:	89 da                	mov    %ebx,%edx
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 848:	39 fe                	cmp    %edi,%esi
 84a:	74 1c                	je     868 <malloc+0xb8>
        p->s.size -= nunits;
 84c:	29 f7                	sub    %esi,%edi
 84e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 851:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 854:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 857:	89 15 e8 0f 00 00    	mov    %edx,0xfe8
      return (void*)(p + 1);
 85d:	83 c0 08             	add    $0x8,%eax
  }
}
 860:	83 c4 1c             	add    $0x1c,%esp
 863:	5b                   	pop    %ebx
 864:	5e                   	pop    %esi
 865:	5f                   	pop    %edi
 866:	5d                   	pop    %ebp
 867:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 868:	8b 08                	mov    (%eax),%ecx
 86a:	89 0a                	mov    %ecx,(%edx)
 86c:	eb e9                	jmp    857 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 86e:	c7 05 e8 0f 00 00 ec 	movl   $0xfec,0xfe8
 875:	0f 00 00 
    base.s.size = 0;
 878:	ba ec 0f 00 00       	mov    $0xfec,%edx
    base.s.ptr = freep = prevp = &base;
 87d:	c7 05 ec 0f 00 00 ec 	movl   $0xfec,0xfec
 884:	0f 00 00 
    base.s.size = 0;
 887:	c7 05 f0 0f 00 00 00 	movl   $0x0,0xff0
 88e:	00 00 00 
 891:	e9 46 ff ff ff       	jmp    7dc <malloc+0x2c>
 896:	66 90                	xchg   %ax,%ax
 898:	66 90                	xchg   %ax,%ax
 89a:	66 90                	xchg   %ax,%ax
 89c:	66 90                	xchg   %ax,%ax
 89e:	66 90                	xchg   %ax,%ax

000008a0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	56                   	push   %esi
 8a4:	53                   	push   %ebx
 8a5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 8a8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 8af:	e8 fc fe ff ff       	call   7b0 <malloc>

    if (bt == NULL) {
 8b4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 8b6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 8b8:	74 66                	je     920 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 8ba:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8c1:	e8 ea fe ff ff       	call   7b0 <malloc>
    if (bt->bt_stack == NULL) {
 8c6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 8c8:	89 c3                	mov    %eax,%ebx
 8ca:	89 46 08             	mov    %eax,0x8(%esi)
 8cd:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 8d0:	74 5d                	je     92f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 8d2:	25 ff 0f 00 00       	and    $0xfff,%eax
 8d7:	75 37                	jne    910 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 8d9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8df:	8b 45 10             	mov    0x10(%ebp),%eax
 8e2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 8ed:	89 04 24             	mov    %eax,(%esp)
 8f0:	e8 25 fb ff ff       	call   41a <kthread_create>
    if (bt->bid != 0) {
 8f5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8f7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 8f9:	74 2d                	je     928 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 8fb:	8b 45 08             	mov    0x8(%ebp),%eax
 8fe:	89 30                	mov    %esi,(%eax)
        result = 0;
 900:	31 c0                	xor    %eax,%eax
}
 902:	83 c4 10             	add    $0x10,%esp
 905:	5b                   	pop    %ebx
 906:	5e                   	pop    %esi
 907:	5d                   	pop    %ebp
 908:	c3                   	ret    
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 910:	29 c3                	sub    %eax,%ebx
 912:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 918:	89 5e 04             	mov    %ebx,0x4(%esi)
 91b:	eb bc                	jmp    8d9 <benny_thread_create+0x39>
 91d:	8d 76 00             	lea    0x0(%esi),%esi
 920:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 926:	eb b7                	jmp    8df <benny_thread_create+0x3f>
    int result = -1;
 928:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 92d:	eb d3                	jmp    902 <benny_thread_create+0x62>
        free(bt);
 92f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 932:	31 f6                	xor    %esi,%esi
        free(bt);
 934:	e8 e7 fd ff ff       	call   720 <free>
 939:	8b 5b 04             	mov    0x4(%ebx),%ebx
 93c:	eb a1                	jmp    8df <benny_thread_create+0x3f>
 93e:	66 90                	xchg   %ax,%ax

00000940 <benny_thread_bid>:
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 943:	8b 45 08             	mov    0x8(%ebp),%eax
}
 946:	5d                   	pop    %ebp
    return bt->bid;
 947:	8b 00                	mov    (%eax),%eax
}
 949:	c3                   	ret    
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000950 <benny_thread_join>:
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	53                   	push   %ebx
 954:	83 ec 14             	sub    $0x14,%esp
 957:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 95a:	8b 03                	mov    (%ebx),%eax
 95c:	89 04 24             	mov    %eax,(%esp)
 95f:	e8 be fa ff ff       	call   422 <kthread_join>
    if (retVal == 0) {
 964:	85 c0                	test   %eax,%eax
 966:	75 27                	jne    98f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 968:	8b 53 08             	mov    0x8(%ebx),%edx
 96b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 96e:	89 14 24             	mov    %edx,(%esp)
 971:	e8 aa fd ff ff       	call   720 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 976:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 97d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 984:	89 1c 24             	mov    %ebx,(%esp)
 987:	e8 94 fd ff ff       	call   720 <free>
 98c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 98f:	83 c4 14             	add    $0x14,%esp
 992:	5b                   	pop    %ebx
 993:	5d                   	pop    %ebp
 994:	c3                   	ret    
 995:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009a0 <benny_thread_exit>:
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
}
 9a3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 9a4:	e9 81 fa ff ff       	jmp    42a <kthread_exit>
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009b0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 9b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 9bc:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 9c3:	31 c0                	xor    %eax,%eax
 9c5:	5d                   	pop    %ebp
 9c6:	c3                   	ret    
 9c7:	89 f6                	mov    %esi,%esi
 9c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009d0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 9d0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 9d1:	b8 01 00 00 00       	mov    $0x1,%eax
 9d6:	89 e5                	mov    %esp,%ebp
 9d8:	56                   	push   %esi
 9d9:	53                   	push   %ebx
 9da:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9dd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 9e0:	85 c0                	test   %eax,%eax
 9e2:	be 01 00 00 00       	mov    $0x1,%esi
 9e7:	74 15                	je     9fe <benny_mootex_yieldlock+0x2e>
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 9f0:	e8 45 fa ff ff       	call   43a <kthread_yield>
 9f5:	89 f0                	mov    %esi,%eax
 9f7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 9fa:	85 c0                	test   %eax,%eax
 9fc:	75 f2                	jne    9f0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 9fe:	e8 2f fa ff ff       	call   432 <kthread_self>
    benny_mootex->bid = benny_self();
 a03:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a06:	31 c0                	xor    %eax,%eax
 a08:	5b                   	pop    %ebx
 a09:	5e                   	pop    %esi
 a0a:	5d                   	pop    %ebp
 a0b:	c3                   	ret    
 a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a10 <benny_mootex_spinlock>:
{
 a10:	55                   	push   %ebp
 a11:	ba 01 00 00 00       	mov    $0x1,%edx
 a16:	89 e5                	mov    %esp,%ebp
 a18:	53                   	push   %ebx
 a19:	83 ec 04             	sub    $0x4,%esp
 a1c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a1f:	90                   	nop
 a20:	89 d0                	mov    %edx,%eax
 a22:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a25:	85 c0                	test   %eax,%eax
 a27:	75 f7                	jne    a20 <benny_mootex_spinlock+0x10>
    return kthread_self();
 a29:	e8 04 fa ff ff       	call   432 <kthread_self>
    benny_mootex->bid = benny_self();
 a2e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a31:	83 c4 04             	add    $0x4,%esp
 a34:	31 c0                	xor    %eax,%eax
 a36:	5b                   	pop    %ebx
 a37:	5d                   	pop    %ebp
 a38:	c3                   	ret    
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a40 <benny_mootex_unlock>:
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	53                   	push   %ebx
 a44:	83 ec 04             	sub    $0x4,%esp
 a47:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 a4a:	e8 e3 f9 ff ff       	call   432 <kthread_self>
    if(tid == benny_mootex->bid){
 a4f:	39 43 04             	cmp    %eax,0x4(%ebx)
 a52:	75 1c                	jne    a70 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 a54:	0f ae f0             	mfence 
    return 0;
 a57:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 a59:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 a60:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 a66:	83 c4 04             	add    $0x4,%esp
 a69:	5b                   	pop    %ebx
 a6a:	5d                   	pop    %ebp
 a6b:	c3                   	ret    
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a70:	83 c4 04             	add    $0x4,%esp
      return -1;
 a73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a78:	5b                   	pop    %ebx
 a79:	5d                   	pop    %ebp
 a7a:	c3                   	ret    
 a7b:	90                   	nop
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a80 <benny_mootex_trylock>:
{
 a80:	55                   	push   %ebp
 a81:	b8 01 00 00 00       	mov    $0x1,%eax
 a86:	89 e5                	mov    %esp,%ebp
 a88:	53                   	push   %ebx
 a89:	83 ec 04             	sub    $0x4,%esp
 a8c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a8f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 a92:	85 c0                	test   %eax,%eax
 a94:	75 08                	jne    a9e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 a96:	e8 97 f9 ff ff       	call   432 <kthread_self>
        benny_mootex->bid = tid;
 a9b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a9e:	83 c4 04             	add    $0x4,%esp
 aa1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 aa6:	5b                   	pop    %ebx
 aa7:	5d                   	pop    %ebp
 aa8:	c3                   	ret    
 aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <benny_mootex_wholock>:
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 ab3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ab6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 ab7:	8b 40 04             	mov    0x4(%eax),%eax
}
 aba:	c3                   	ret    
 abb:	90                   	nop
 abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ac0 <benny_mootex_islocked>:
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 ac3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ac6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 ac7:	8b 00                	mov    (%eax),%eax
}
 ac9:	c3                   	ret    
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ad0 <benny_self>:
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
}
 ad3:	5d                   	pop    %ebp
    return kthread_self();
 ad4:	e9 59 f9 ff ff       	jmp    432 <kthread_self>
 ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ae0 <benny_yield>:
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
    
}
 ae3:	5d                   	pop    %ebp
    return kthread_yield();
 ae4:	e9 51 f9 ff ff       	jmp    43a <kthread_yield>
 ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000af0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 af3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 af4:	e9 49 f9 ff ff       	jmp    442 <kthread_cpu_count>
 af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b00 <benny_thread_count>:

int
benny_thread_count(void)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 b03:	5d                   	pop    %ebp
    return kthread_thread_count();
 b04:	e9 41 f9 ff ff       	jmp    44a <kthread_thread_count>
