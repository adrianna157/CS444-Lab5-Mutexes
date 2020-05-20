
_sizeof:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
    printf(1, "This appears to be a %d bit system.\n", __WORDSIZE);
   9:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
  10:	00 
  11:	c7 44 24 04 5c 0b 00 	movl   $0xb5c,0x4(%esp)
  18:	00 
  19:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  20:	e8 2b 05 00 00       	call   550 <printf>
    {
        unsigned int i = 1;

        char *c = (char *) &i;
        if (0 != (*c)) {
            printf(1, "    This system is little endian.\n");
  25:	c7 44 24 04 84 0b 00 	movl   $0xb84,0x4(%esp)
  2c:	00 
  2d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  34:	e8 17 05 00 00       	call   550 <printf>
        }
        else {
            printf(1, "    This system is big endian.\n");
        }
    }
    printf(1, "\n");
  39:	c7 44 24 04 f6 0c 00 	movl   $0xcf6,0x4(%esp)
  40:	00 
  41:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  48:	e8 03 05 00 00       	call   550 <printf>

    printf(1, "Size of basic C data types\n");
  4d:	c7 44 24 04 dc 0c 00 	movl   $0xcdc,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 ef 04 00 00       	call   550 <printf>
    printf(1, "                        bytes  bits\n");
  61:	c7 44 24 04 a8 0b 00 	movl   $0xba8,0x4(%esp)
  68:	00 
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 db 04 00 00       	call   550 <printf>
    printf(1, "    sizeof(char)        %d      %d\n"
  75:	c7 44 24 0c 08 00 00 	movl   $0x8,0xc(%esp)
  7c:	00 
  7d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  84:	00 
  85:	c7 44 24 04 d0 0b 00 	movl   $0xbd0,0x4(%esp)
  8c:	00 
  8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  94:	e8 b7 04 00 00       	call   550 <printf>
           , (int) sizeof(char)
           , (int) CHARBITS);
    printf(1, "    sizeof(short)       %d      %d\n"
  99:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
  a0:	00 
  a1:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
  a8:	00 
  a9:	c7 44 24 04 f4 0b 00 	movl   $0xbf4,0x4(%esp)
  b0:	00 
  b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b8:	e8 93 04 00 00       	call   550 <printf>
           , (int) sizeof(short)
           , (int) SHORTBITS);
    printf(1, "    sizeof(int)         %d      %d\n"
  bd:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
  c4:	00 
  c5:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  cc:	00 
  cd:	c7 44 24 04 18 0c 00 	movl   $0xc18,0x4(%esp)
  d4:	00 
  d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  dc:	e8 6f 04 00 00       	call   550 <printf>
           , (int) sizeof(int)
           , (int) INTBITS);
    printf(1, "    sizeof(unsigned)    %d      %d\n"
  e1:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
  e8:	00 
  e9:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
  f0:	00 
  f1:	c7 44 24 04 3c 0c 00 	movl   $0xc3c,0x4(%esp)
  f8:	00 
  f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 100:	e8 4b 04 00 00       	call   550 <printf>
           , (int) sizeof(unsigned)
           // This is not directly supported by a nice macro, so I'm
           //   calculating it.
           , (int) (sizeof(unsigned) * CHARBITS));
    printf(1, "    sizeof(long)        %d      %d\n"
 105:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
 10c:	00 
 10d:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
 114:	00 
 115:	c7 44 24 04 60 0c 00 	movl   $0xc60,0x4(%esp)
 11c:	00 
 11d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 124:	e8 27 04 00 00       	call   550 <printf>
           , (int) sizeof(long)
           , (int) LONGBITS);
    printf(1, "    sizeof(long long)   %d      %d\n"
 129:	c7 44 24 0c 40 00 00 	movl   $0x40,0xc(%esp)
 130:	00 
 131:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 138:	00 
 139:	c7 44 24 04 84 0c 00 	movl   $0xc84,0x4(%esp)
 140:	00 
 141:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 148:	e8 03 04 00 00       	call   550 <printf>
           , (int) sizeof(long long)
           // This is not directly supported by a nice macro, sir I'm
           //   calculating it.
           , (int) (sizeof(long long) * CHARBITS));

    printf(1, "    sizeof(void *)      %d      %d (aka a pointer)\n"
 14d:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
 154:	00 
 155:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
 15c:	00 
 15d:	c7 44 24 04 a8 0c 00 	movl   $0xca8,0x4(%esp)
 164:	00 
 165:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 16c:	e8 df 03 00 00       	call   550 <printf>
           , (int) sizeof(void *), (int) PTRBITS);

    // You MUST call exit() as the last thing your code does in xv6.
    exit();
 171:	e8 2c 02 00 00       	call   3a2 <exit>
 176:	66 90                	xchg   %ax,%ax
 178:	66 90                	xchg   %ax,%ax
 17a:	66 90                	xchg   %ax,%ax
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 189:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 18a:	89 c2                	mov    %eax,%edx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 190:	83 c1 01             	add    $0x1,%ecx
 193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 197:	83 c2 01             	add    $0x1,%edx
 19a:	84 db                	test   %bl,%bl
 19c:	88 5a ff             	mov    %bl,-0x1(%edx)
 19f:	75 ef                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 1a1:	5b                   	pop    %ebx
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    
 1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	53                   	push   %ebx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	74 2d                	je     1ee <strcmp+0x3e>
 1c1:	0f b6 19             	movzbl (%ecx),%ebx
 1c4:	38 d8                	cmp    %bl,%al
 1c6:	74 0e                	je     1d6 <strcmp+0x26>
 1c8:	eb 2b                	jmp    1f5 <strcmp+0x45>
 1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1d0:	38 c8                	cmp    %cl,%al
 1d2:	75 15                	jne    1e9 <strcmp+0x39>
    p++, q++;
 1d4:	89 d9                	mov    %ebx,%ecx
 1d6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1d9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1dc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 1e3:	84 c0                	test   %al,%al
 1e5:	75 e9                	jne    1d0 <strcmp+0x20>
 1e7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1e9:	29 c8                	sub    %ecx,%eax
}
 1eb:	5b                   	pop    %ebx
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret    
 1ee:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 1f1:	31 c0                	xor    %eax,%eax
 1f3:	eb f4                	jmp    1e9 <strcmp+0x39>
 1f5:	0f b6 cb             	movzbl %bl,%ecx
 1f8:	eb ef                	jmp    1e9 <strcmp+0x39>
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <strlen>:

uint
strlen(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 206:	80 39 00             	cmpb   $0x0,(%ecx)
 209:	74 12                	je     21d <strlen+0x1d>
 20b:	31 d2                	xor    %edx,%edx
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	83 c2 01             	add    $0x1,%edx
 213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 217:	89 d0                	mov    %edx,%eax
 219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 21d:	31 c0                	xor    %eax,%eax
}
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	eb 0d                	jmp    230 <memset>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 55 08             	mov    0x8(%ebp),%edx
 236:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 237:	8b 4d 10             	mov    0x10(%ebp),%ecx
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 d7                	mov    %edx,%edi
 23f:	fc                   	cld    
 240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 242:	89 d0                	mov    %edx,%eax
 244:	5f                   	pop    %edi
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	53                   	push   %ebx
 257:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 25a:	0f b6 18             	movzbl (%eax),%ebx
 25d:	84 db                	test   %bl,%bl
 25f:	74 1d                	je     27e <strchr+0x2e>
    if(*s == c)
 261:	38 d3                	cmp    %dl,%bl
 263:	89 d1                	mov    %edx,%ecx
 265:	75 0d                	jne    274 <strchr+0x24>
 267:	eb 17                	jmp    280 <strchr+0x30>
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0c                	je     280 <strchr+0x30>
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	0f b6 10             	movzbl (%eax),%edx
 27a:	84 d2                	test   %dl,%dl
 27c:	75 f2                	jne    270 <strchr+0x20>
      return (char*)s;
  return 0;
 27e:	31 c0                	xor    %eax,%eax
}
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <gets>:

char*
gets(char *buf, int max)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 295:	31 f6                	xor    %esi,%esi
{
 297:	53                   	push   %ebx
 298:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 29b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 29e:	eb 31                	jmp    2d1 <gets+0x41>
    cc = read(0, &c, 1);
 2a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2a7:	00 
 2a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2b3:	e8 02 01 00 00       	call   3ba <read>
    if(cc < 1)
 2b8:	85 c0                	test   %eax,%eax
 2ba:	7e 1d                	jle    2d9 <gets+0x49>
      break;
    buf[i++] = c;
 2bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 2c0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 2c2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 2c5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 2c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cb:	74 0c                	je     2d9 <gets+0x49>
 2cd:	3c 0a                	cmp    $0xa,%al
 2cf:	74 08                	je     2d9 <gets+0x49>
  for(i=0; i+1 < max; ){
 2d1:	8d 5e 01             	lea    0x1(%esi),%ebx
 2d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2d7:	7c c7                	jl     2a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2d9:	8b 45 08             	mov    0x8(%ebp),%eax
 2dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e0:	83 c4 2c             	add    $0x2c,%esp
 2e3:	5b                   	pop    %ebx
 2e4:	5e                   	pop    %esi
 2e5:	5f                   	pop    %edi
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    
 2e8:	90                   	nop
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
 2fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 302:	00 
 303:	89 04 24             	mov    %eax,(%esp)
 306:	e8 d7 00 00 00       	call   3e2 <open>
  if(fd < 0)
 30b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 30d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 30f:	78 27                	js     338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 311:	8b 45 0c             	mov    0xc(%ebp),%eax
 314:	89 1c 24             	mov    %ebx,(%esp)
 317:	89 44 24 04          	mov    %eax,0x4(%esp)
 31b:	e8 da 00 00 00       	call   3fa <fstat>
  close(fd);
 320:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 323:	89 c6                	mov    %eax,%esi
  close(fd);
 325:	e8 a0 00 00 00       	call   3ca <close>
  return r;
 32a:	89 f0                	mov    %esi,%eax
}
 32c:	83 c4 10             	add    $0x10,%esp
 32f:	5b                   	pop    %ebx
 330:	5e                   	pop    %esi
 331:	5d                   	pop    %ebp
 332:	c3                   	ret    
 333:	90                   	nop
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 338:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 33d:	eb ed                	jmp    32c <stat+0x3c>
 33f:	90                   	nop

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 4d 08             	mov    0x8(%ebp),%ecx
 346:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 347:	0f be 11             	movsbl (%ecx),%edx
 34a:	8d 42 d0             	lea    -0x30(%edx),%eax
 34d:	3c 09                	cmp    $0x9,%al
  n = 0;
 34f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 354:	77 17                	ja     36d <atoi+0x2d>
 356:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 358:	83 c1 01             	add    $0x1,%ecx
 35b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 35e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 362:	0f be 11             	movsbl (%ecx),%edx
 365:	8d 5a d0             	lea    -0x30(%edx),%ebx
 368:	80 fb 09             	cmp    $0x9,%bl
 36b:	76 eb                	jbe    358 <atoi+0x18>
  return n;
}
 36d:	5b                   	pop    %ebx
 36e:	5d                   	pop    %ebp
 36f:	c3                   	ret    

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 371:	31 d2                	xor    %edx,%edx
{
 373:	89 e5                	mov    %esp,%ebp
 375:	56                   	push   %esi
 376:	8b 45 08             	mov    0x8(%ebp),%eax
 379:	53                   	push   %ebx
 37a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 37d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 380:	85 db                	test   %ebx,%ebx
 382:	7e 12                	jle    396 <memmove+0x26>
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 388:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 38c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 38f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 392:	39 da                	cmp    %ebx,%edx
 394:	75 f2                	jne    388 <memmove+0x18>
  return vdst;
}
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 39a:	b8 01 00 00 00       	mov    $0x1,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <exit>:
SYSCALL(exit)
 3a2:	b8 02 00 00 00       	mov    $0x2,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <wait>:
SYSCALL(wait)
 3aa:	b8 03 00 00 00       	mov    $0x3,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <pipe>:
SYSCALL(pipe)
 3b2:	b8 04 00 00 00       	mov    $0x4,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <read>:
SYSCALL(read)
 3ba:	b8 05 00 00 00       	mov    $0x5,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <write>:
SYSCALL(write)
 3c2:	b8 10 00 00 00       	mov    $0x10,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <close>:
SYSCALL(close)
 3ca:	b8 15 00 00 00       	mov    $0x15,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <kill>:
SYSCALL(kill)
 3d2:	b8 06 00 00 00       	mov    $0x6,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <exec>:
SYSCALL(exec)
 3da:	b8 07 00 00 00       	mov    $0x7,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <open>:
SYSCALL(open)
 3e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <mknod>:
SYSCALL(mknod)
 3ea:	b8 11 00 00 00       	mov    $0x11,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <unlink>:
SYSCALL(unlink)
 3f2:	b8 12 00 00 00       	mov    $0x12,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <fstat>:
SYSCALL(fstat)
 3fa:	b8 08 00 00 00       	mov    $0x8,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <link>:
SYSCALL(link)
 402:	b8 13 00 00 00       	mov    $0x13,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <mkdir>:
SYSCALL(mkdir)
 40a:	b8 14 00 00 00       	mov    $0x14,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <chdir>:
SYSCALL(chdir)
 412:	b8 09 00 00 00       	mov    $0x9,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <dup>:
SYSCALL(dup)
 41a:	b8 0a 00 00 00       	mov    $0xa,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <getpid>:
SYSCALL(getpid)
 422:	b8 0b 00 00 00       	mov    $0xb,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <sbrk>:
SYSCALL(sbrk)
 42a:	b8 0c 00 00 00       	mov    $0xc,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <sleep>:
SYSCALL(sleep)
 432:	b8 0d 00 00 00       	mov    $0xd,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <uptime>:
SYSCALL(uptime)
 43a:	b8 0e 00 00 00       	mov    $0xe,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 442:	b8 16 00 00 00       	mov    $0x16,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 44a:	b8 17 00 00 00       	mov    $0x17,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 452:	b8 18 00 00 00       	mov    $0x18,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 45a:	b8 19 00 00 00       	mov    $0x19,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 462:	b8 1a 00 00 00       	mov    $0x1a,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 46a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <kthread_join>:
SYSCALL(kthread_join)
 472:	b8 1c 00 00 00       	mov    $0x1c,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <kthread_exit>:
SYSCALL(kthread_exit)
 47a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 482:	b8 1e 00 00 00       	mov    $0x1e,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <kthread_yield>:
SYSCALL(kthread_yield)
 48a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 492:	b8 20 00 00 00       	mov    $0x20,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 49a:	b8 21 00 00 00       	mov    $0x21,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    
 4a2:	66 90                	xchg   %ax,%ax
 4a4:	66 90                	xchg   %ax,%ax
 4a6:	66 90                	xchg   %ax,%ax
 4a8:	66 90                	xchg   %ax,%ax
 4aa:	66 90                	xchg   %ax,%ax
 4ac:	66 90                	xchg   %ax,%ax
 4ae:	66 90                	xchg   %ax,%ax

000004b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	89 c6                	mov    %eax,%esi
 4b7:	53                   	push   %ebx
 4b8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4be:	85 db                	test   %ebx,%ebx
 4c0:	74 09                	je     4cb <printint+0x1b>
 4c2:	89 d0                	mov    %edx,%eax
 4c4:	c1 e8 1f             	shr    $0x1f,%eax
 4c7:	84 c0                	test   %al,%al
 4c9:	75 75                	jne    540 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4cb:	89 d0                	mov    %edx,%eax
  neg = 0;
 4cd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4d4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 4d7:	31 ff                	xor    %edi,%edi
 4d9:	89 ce                	mov    %ecx,%esi
 4db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4de:	eb 02                	jmp    4e2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 4e0:	89 cf                	mov    %ecx,%edi
 4e2:	31 d2                	xor    %edx,%edx
 4e4:	f7 f6                	div    %esi
 4e6:	8d 4f 01             	lea    0x1(%edi),%ecx
 4e9:	0f b6 92 ff 0c 00 00 	movzbl 0xcff(%edx),%edx
  }while((x /= base) != 0);
 4f0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4f2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4f5:	75 e9                	jne    4e0 <printint+0x30>
  if(neg)
 4f7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 4fa:	89 c8                	mov    %ecx,%eax
 4fc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 4ff:	85 d2                	test   %edx,%edx
 501:	74 08                	je     50b <printint+0x5b>
    buf[i++] = '-';
 503:	8d 4f 02             	lea    0x2(%edi),%ecx
 506:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 50b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 50e:	66 90                	xchg   %ax,%ax
 510:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 515:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 518:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51f:	00 
 520:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 524:	89 34 24             	mov    %esi,(%esp)
 527:	88 45 d7             	mov    %al,-0x29(%ebp)
 52a:	e8 93 fe ff ff       	call   3c2 <write>
  while(--i >= 0)
 52f:	83 ff ff             	cmp    $0xffffffff,%edi
 532:	75 dc                	jne    510 <printint+0x60>
    putc(fd, buf[i]);
}
 534:	83 c4 4c             	add    $0x4c,%esp
 537:	5b                   	pop    %ebx
 538:	5e                   	pop    %esi
 539:	5f                   	pop    %edi
 53a:	5d                   	pop    %ebp
 53b:	c3                   	ret    
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 540:	89 d0                	mov    %edx,%eax
 542:	f7 d8                	neg    %eax
    neg = 1;
 544:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 54b:	eb 87                	jmp    4d4 <printint+0x24>
 54d:	8d 76 00             	lea    0x0(%esi),%esi

00000550 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 554:	31 ff                	xor    %edi,%edi
{
 556:	56                   	push   %esi
 557:	53                   	push   %ebx
 558:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 55b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 55e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 561:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 564:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 567:	0f b6 13             	movzbl (%ebx),%edx
 56a:	83 c3 01             	add    $0x1,%ebx
 56d:	84 d2                	test   %dl,%dl
 56f:	75 39                	jne    5aa <printf+0x5a>
 571:	e9 ca 00 00 00       	jmp    640 <printf+0xf0>
 576:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 578:	83 fa 25             	cmp    $0x25,%edx
 57b:	0f 84 c7 00 00 00    	je     648 <printf+0xf8>
  write(fd, &c, 1);
 581:	8d 45 e0             	lea    -0x20(%ebp),%eax
 584:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 58b:	00 
 58c:	89 44 24 04          	mov    %eax,0x4(%esp)
 590:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 593:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 596:	e8 27 fe ff ff       	call   3c2 <write>
 59b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 59e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5a2:	84 d2                	test   %dl,%dl
 5a4:	0f 84 96 00 00 00    	je     640 <printf+0xf0>
    if(state == 0){
 5aa:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5ac:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 5af:	74 c7                	je     578 <printf+0x28>
      }
    } else if(state == '%'){
 5b1:	83 ff 25             	cmp    $0x25,%edi
 5b4:	75 e5                	jne    59b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 5b6:	83 fa 75             	cmp    $0x75,%edx
 5b9:	0f 84 99 00 00 00    	je     658 <printf+0x108>
 5bf:	83 fa 64             	cmp    $0x64,%edx
 5c2:	0f 84 90 00 00 00    	je     658 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5c8:	25 f7 00 00 00       	and    $0xf7,%eax
 5cd:	83 f8 70             	cmp    $0x70,%eax
 5d0:	0f 84 aa 00 00 00    	je     680 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5d6:	83 fa 73             	cmp    $0x73,%edx
 5d9:	0f 84 e9 00 00 00    	je     6c8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5df:	83 fa 63             	cmp    $0x63,%edx
 5e2:	0f 84 2b 01 00 00    	je     713 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5e8:	83 fa 25             	cmp    $0x25,%edx
 5eb:	0f 84 4f 01 00 00    	je     740 <printf+0x1f0>
  write(fd, &c, 1);
 5f1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5f4:	83 c3 01             	add    $0x1,%ebx
 5f7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5fe:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ff:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 601:	89 44 24 04          	mov    %eax,0x4(%esp)
 605:	89 34 24             	mov    %esi,(%esp)
 608:	89 55 d0             	mov    %edx,-0x30(%ebp)
 60b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 60f:	e8 ae fd ff ff       	call   3c2 <write>
        putc(fd, c);
 614:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 617:	8d 45 e7             	lea    -0x19(%ebp),%eax
 61a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 621:	00 
 622:	89 44 24 04          	mov    %eax,0x4(%esp)
 626:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 629:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 62c:	e8 91 fd ff ff       	call   3c2 <write>
  for(i = 0; fmt[i]; i++){
 631:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 635:	84 d2                	test   %dl,%dl
 637:	0f 85 6d ff ff ff    	jne    5aa <printf+0x5a>
 63d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 640:	83 c4 3c             	add    $0x3c,%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
        state = '%';
 648:	bf 25 00 00 00       	mov    $0x25,%edi
 64d:	e9 49 ff ff ff       	jmp    59b <printf+0x4b>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 658:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 65f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 664:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 667:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 669:	8b 10                	mov    (%eax),%edx
 66b:	89 f0                	mov    %esi,%eax
 66d:	e8 3e fe ff ff       	call   4b0 <printint>
        ap++;
 672:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 676:	e9 20 ff ff ff       	jmp    59b <printf+0x4b>
 67b:	90                   	nop
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 680:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 683:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 68a:	00 
 68b:	89 44 24 04          	mov    %eax,0x4(%esp)
 68f:	89 34 24             	mov    %esi,(%esp)
 692:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 696:	e8 27 fd ff ff       	call   3c2 <write>
 69b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 69e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6a5:	00 
 6a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6aa:	89 34 24             	mov    %esi,(%esp)
 6ad:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 6b1:	e8 0c fd ff ff       	call   3c2 <write>
        printint(fd, *ap, 16, 0);
 6b6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6c2:	eb a0                	jmp    664 <printf+0x114>
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 6cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 6cf:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 6d1:	b8 f8 0c 00 00       	mov    $0xcf8,%eax
 6d6:	85 ff                	test   %edi,%edi
 6d8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 6db:	0f b6 07             	movzbl (%edi),%eax
 6de:	84 c0                	test   %al,%al
 6e0:	74 2a                	je     70c <printf+0x1bc>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6e8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6eb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 6ee:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 6f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6f8:	00 
 6f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fd:	89 34 24             	mov    %esi,(%esp)
 700:	e8 bd fc ff ff       	call   3c2 <write>
        while(*s != 0){
 705:	0f b6 07             	movzbl (%edi),%eax
 708:	84 c0                	test   %al,%al
 70a:	75 dc                	jne    6e8 <printf+0x198>
      state = 0;
 70c:	31 ff                	xor    %edi,%edi
 70e:	e9 88 fe ff ff       	jmp    59b <printf+0x4b>
        putc(fd, *ap);
 713:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 716:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 718:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 71a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 721:	00 
 722:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 725:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 728:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 72b:	89 44 24 04          	mov    %eax,0x4(%esp)
 72f:	e8 8e fc ff ff       	call   3c2 <write>
        ap++;
 734:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 738:	e9 5e fe ff ff       	jmp    59b <printf+0x4b>
 73d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 740:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 743:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 745:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 74c:	00 
 74d:	89 44 24 04          	mov    %eax,0x4(%esp)
 751:	89 34 24             	mov    %esi,(%esp)
 754:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 758:	e8 65 fc ff ff       	call   3c2 <write>
 75d:	e9 39 fe ff ff       	jmp    59b <printf+0x4b>
 762:	66 90                	xchg   %ax,%ax
 764:	66 90                	xchg   %ax,%ax
 766:	66 90                	xchg   %ax,%ax
 768:	66 90                	xchg   %ax,%ax
 76a:	66 90                	xchg   %ax,%ax
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	a1 84 11 00 00       	mov    0x1184,%eax
{
 776:	89 e5                	mov    %esp,%ebp
 778:	57                   	push   %edi
 779:	56                   	push   %esi
 77a:	53                   	push   %ebx
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 77e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 780:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 783:	39 d0                	cmp    %edx,%eax
 785:	72 11                	jb     798 <free+0x28>
 787:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	39 c8                	cmp    %ecx,%eax
 78a:	72 04                	jb     790 <free+0x20>
 78c:	39 ca                	cmp    %ecx,%edx
 78e:	72 10                	jb     7a0 <free+0x30>
 790:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 792:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 794:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 796:	73 f0                	jae    788 <free+0x18>
 798:	39 ca                	cmp    %ecx,%edx
 79a:	72 04                	jb     7a0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79c:	39 c8                	cmp    %ecx,%eax
 79e:	72 f0                	jb     790 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7a3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 7a6:	39 cf                	cmp    %ecx,%edi
 7a8:	74 1e                	je     7c8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7aa:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ad:	8b 48 04             	mov    0x4(%eax),%ecx
 7b0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 7b3:	39 f2                	cmp    %esi,%edx
 7b5:	74 28                	je     7df <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7b7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7b9:	a3 84 11 00 00       	mov    %eax,0x1184
}
 7be:	5b                   	pop    %ebx
 7bf:	5e                   	pop    %esi
 7c0:	5f                   	pop    %edi
 7c1:	5d                   	pop    %ebp
 7c2:	c3                   	ret    
 7c3:	90                   	nop
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7c8:	03 71 04             	add    0x4(%ecx),%esi
 7cb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ce:	8b 08                	mov    (%eax),%ecx
 7d0:	8b 09                	mov    (%ecx),%ecx
 7d2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7d5:	8b 48 04             	mov    0x4(%eax),%ecx
 7d8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 7db:	39 f2                	cmp    %esi,%edx
 7dd:	75 d8                	jne    7b7 <free+0x47>
    p->s.size += bp->s.size;
 7df:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 7e2:	a3 84 11 00 00       	mov    %eax,0x1184
    p->s.size += bp->s.size;
 7e7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ea:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ed:	89 10                	mov    %edx,(%eax)
}
 7ef:	5b                   	pop    %ebx
 7f0:	5e                   	pop    %esi
 7f1:	5f                   	pop    %edi
 7f2:	5d                   	pop    %ebp
 7f3:	c3                   	ret    
 7f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000800 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 80c:	8b 1d 84 11 00 00    	mov    0x1184,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 812:	8d 48 07             	lea    0x7(%eax),%ecx
 815:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 818:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 81d:	0f 84 9b 00 00 00    	je     8be <malloc+0xbe>
 823:	8b 13                	mov    (%ebx),%edx
 825:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 828:	39 fe                	cmp    %edi,%esi
 82a:	76 64                	jbe    890 <malloc+0x90>
 82c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 833:	bb 00 80 00 00       	mov    $0x8000,%ebx
 838:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 83b:	eb 0e                	jmp    84b <malloc+0x4b>
 83d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 842:	8b 78 04             	mov    0x4(%eax),%edi
 845:	39 fe                	cmp    %edi,%esi
 847:	76 4f                	jbe    898 <malloc+0x98>
 849:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 84b:	3b 15 84 11 00 00    	cmp    0x1184,%edx
 851:	75 ed                	jne    840 <malloc+0x40>
  if(nu < 4096)
 853:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 856:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 85c:	bf 00 10 00 00       	mov    $0x1000,%edi
 861:	0f 43 fe             	cmovae %esi,%edi
 864:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 867:	89 04 24             	mov    %eax,(%esp)
 86a:	e8 bb fb ff ff       	call   42a <sbrk>
  if(p == (char*)-1)
 86f:	83 f8 ff             	cmp    $0xffffffff,%eax
 872:	74 18                	je     88c <malloc+0x8c>
  hp->s.size = nu;
 874:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 877:	83 c0 08             	add    $0x8,%eax
 87a:	89 04 24             	mov    %eax,(%esp)
 87d:	e8 ee fe ff ff       	call   770 <free>
  return freep;
 882:	8b 15 84 11 00 00    	mov    0x1184,%edx
      if((p = morecore(nunits)) == 0)
 888:	85 d2                	test   %edx,%edx
 88a:	75 b4                	jne    840 <malloc+0x40>
        return 0;
 88c:	31 c0                	xor    %eax,%eax
 88e:	eb 20                	jmp    8b0 <malloc+0xb0>
    if(p->s.size >= nunits){
 890:	89 d0                	mov    %edx,%eax
 892:	89 da                	mov    %ebx,%edx
 894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 898:	39 fe                	cmp    %edi,%esi
 89a:	74 1c                	je     8b8 <malloc+0xb8>
        p->s.size -= nunits;
 89c:	29 f7                	sub    %esi,%edi
 89e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 8a1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 8a4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8a7:	89 15 84 11 00 00    	mov    %edx,0x1184
      return (void*)(p + 1);
 8ad:	83 c0 08             	add    $0x8,%eax
  }
}
 8b0:	83 c4 1c             	add    $0x1c,%esp
 8b3:	5b                   	pop    %ebx
 8b4:	5e                   	pop    %esi
 8b5:	5f                   	pop    %edi
 8b6:	5d                   	pop    %ebp
 8b7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8b8:	8b 08                	mov    (%eax),%ecx
 8ba:	89 0a                	mov    %ecx,(%edx)
 8bc:	eb e9                	jmp    8a7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 8be:	c7 05 84 11 00 00 88 	movl   $0x1188,0x1184
 8c5:	11 00 00 
    base.s.size = 0;
 8c8:	ba 88 11 00 00       	mov    $0x1188,%edx
    base.s.ptr = freep = prevp = &base;
 8cd:	c7 05 88 11 00 00 88 	movl   $0x1188,0x1188
 8d4:	11 00 00 
    base.s.size = 0;
 8d7:	c7 05 8c 11 00 00 00 	movl   $0x0,0x118c
 8de:	00 00 00 
 8e1:	e9 46 ff ff ff       	jmp    82c <malloc+0x2c>
 8e6:	66 90                	xchg   %ax,%ax
 8e8:	66 90                	xchg   %ax,%ax
 8ea:	66 90                	xchg   %ax,%ax
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	56                   	push   %esi
 8f4:	53                   	push   %ebx
 8f5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 8f8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 8ff:	e8 fc fe ff ff       	call   800 <malloc>

    if (bt == NULL) {
 904:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 906:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 908:	74 66                	je     970 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 90a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 911:	e8 ea fe ff ff       	call   800 <malloc>
    if (bt->bt_stack == NULL) {
 916:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 918:	89 c3                	mov    %eax,%ebx
 91a:	89 46 08             	mov    %eax,0x8(%esi)
 91d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 920:	74 5d                	je     97f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 922:	25 ff 0f 00 00       	and    $0xfff,%eax
 927:	75 37                	jne    960 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 929:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 92f:	8b 45 10             	mov    0x10(%ebp),%eax
 932:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 936:	89 44 24 04          	mov    %eax,0x4(%esp)
 93a:	8b 45 0c             	mov    0xc(%ebp),%eax
 93d:	89 04 24             	mov    %eax,(%esp)
 940:	e8 25 fb ff ff       	call   46a <kthread_create>
    if (bt->bid != 0) {
 945:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 947:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 949:	74 2d                	je     978 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 94b:	8b 45 08             	mov    0x8(%ebp),%eax
 94e:	89 30                	mov    %esi,(%eax)
        result = 0;
 950:	31 c0                	xor    %eax,%eax
}
 952:	83 c4 10             	add    $0x10,%esp
 955:	5b                   	pop    %ebx
 956:	5e                   	pop    %esi
 957:	5d                   	pop    %ebp
 958:	c3                   	ret    
 959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 960:	29 c3                	sub    %eax,%ebx
 962:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 968:	89 5e 04             	mov    %ebx,0x4(%esi)
 96b:	eb bc                	jmp    929 <benny_thread_create+0x39>
 96d:	8d 76 00             	lea    0x0(%esi),%esi
 970:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 976:	eb b7                	jmp    92f <benny_thread_create+0x3f>
    int result = -1;
 978:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 97d:	eb d3                	jmp    952 <benny_thread_create+0x62>
        free(bt);
 97f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 982:	31 f6                	xor    %esi,%esi
        free(bt);
 984:	e8 e7 fd ff ff       	call   770 <free>
 989:	8b 5b 04             	mov    0x4(%ebx),%ebx
 98c:	eb a1                	jmp    92f <benny_thread_create+0x3f>
 98e:	66 90                	xchg   %ax,%ax

00000990 <benny_thread_bid>:
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 993:	8b 45 08             	mov    0x8(%ebp),%eax
}
 996:	5d                   	pop    %ebp
    return bt->bid;
 997:	8b 00                	mov    (%eax),%eax
}
 999:	c3                   	ret    
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009a0 <benny_thread_join>:
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	53                   	push   %ebx
 9a4:	83 ec 14             	sub    $0x14,%esp
 9a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 9aa:	8b 03                	mov    (%ebx),%eax
 9ac:	89 04 24             	mov    %eax,(%esp)
 9af:	e8 be fa ff ff       	call   472 <kthread_join>
    if (retVal == 0) {
 9b4:	85 c0                	test   %eax,%eax
 9b6:	75 27                	jne    9df <benny_thread_join+0x3f>
        free(bt->mem_stack);
 9b8:	8b 53 08             	mov    0x8(%ebx),%edx
 9bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9be:	89 14 24             	mov    %edx,(%esp)
 9c1:	e8 aa fd ff ff       	call   770 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 9c6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 9cd:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 9d4:	89 1c 24             	mov    %ebx,(%esp)
 9d7:	e8 94 fd ff ff       	call   770 <free>
 9dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 9df:	83 c4 14             	add    $0x14,%esp
 9e2:	5b                   	pop    %ebx
 9e3:	5d                   	pop    %ebp
 9e4:	c3                   	ret    
 9e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009f0 <benny_thread_exit>:
{
 9f0:	55                   	push   %ebp
 9f1:	89 e5                	mov    %esp,%ebp
}
 9f3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 9f4:	e9 81 fa ff ff       	jmp    47a <kthread_exit>
 9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a00 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 a06:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 a0c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 a13:	31 c0                	xor    %eax,%eax
 a15:	5d                   	pop    %ebp
 a16:	c3                   	ret    
 a17:	89 f6                	mov    %esi,%esi
 a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a20 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 a20:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a21:	b8 01 00 00 00       	mov    $0x1,%eax
 a26:	89 e5                	mov    %esp,%ebp
 a28:	56                   	push   %esi
 a29:	53                   	push   %ebx
 a2a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a2d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 a30:	85 c0                	test   %eax,%eax
 a32:	be 01 00 00 00       	mov    $0x1,%esi
 a37:	74 15                	je     a4e <benny_mootex_yieldlock+0x2e>
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 a40:	e8 45 fa ff ff       	call   48a <kthread_yield>
 a45:	89 f0                	mov    %esi,%eax
 a47:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a4a:	85 c0                	test   %eax,%eax
 a4c:	75 f2                	jne    a40 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 a4e:	e8 2f fa ff ff       	call   482 <kthread_self>
    benny_mootex->bid = benny_self();
 a53:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a56:	31 c0                	xor    %eax,%eax
 a58:	5b                   	pop    %ebx
 a59:	5e                   	pop    %esi
 a5a:	5d                   	pop    %ebp
 a5b:	c3                   	ret    
 a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a60 <benny_mootex_spinlock>:
{
 a60:	55                   	push   %ebp
 a61:	ba 01 00 00 00       	mov    $0x1,%edx
 a66:	89 e5                	mov    %esp,%ebp
 a68:	53                   	push   %ebx
 a69:	83 ec 04             	sub    $0x4,%esp
 a6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a6f:	90                   	nop
 a70:	89 d0                	mov    %edx,%eax
 a72:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a75:	85 c0                	test   %eax,%eax
 a77:	75 f7                	jne    a70 <benny_mootex_spinlock+0x10>
    return kthread_self();
 a79:	e8 04 fa ff ff       	call   482 <kthread_self>
    benny_mootex->bid = benny_self();
 a7e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a81:	83 c4 04             	add    $0x4,%esp
 a84:	31 c0                	xor    %eax,%eax
 a86:	5b                   	pop    %ebx
 a87:	5d                   	pop    %ebp
 a88:	c3                   	ret    
 a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a90 <benny_mootex_unlock>:
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	53                   	push   %ebx
 a94:	83 ec 04             	sub    $0x4,%esp
 a97:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 a9a:	e8 e3 f9 ff ff       	call   482 <kthread_self>
    if(tid == benny_mootex->bid){
 a9f:	39 43 04             	cmp    %eax,0x4(%ebx)
 aa2:	75 1c                	jne    ac0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 aa4:	0f ae f0             	mfence 
    return 0;
 aa7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 aa9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 ab0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 ab6:	83 c4 04             	add    $0x4,%esp
 ab9:	5b                   	pop    %ebx
 aba:	5d                   	pop    %ebp
 abb:	c3                   	ret    
 abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ac0:	83 c4 04             	add    $0x4,%esp
      return -1;
 ac3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 ac8:	5b                   	pop    %ebx
 ac9:	5d                   	pop    %ebp
 aca:	c3                   	ret    
 acb:	90                   	nop
 acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <benny_mootex_trylock>:
{
 ad0:	55                   	push   %ebp
 ad1:	b8 01 00 00 00       	mov    $0x1,%eax
 ad6:	89 e5                	mov    %esp,%ebp
 ad8:	53                   	push   %ebx
 ad9:	83 ec 04             	sub    $0x4,%esp
 adc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 adf:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 ae2:	85 c0                	test   %eax,%eax
 ae4:	75 08                	jne    aee <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 ae6:	e8 97 f9 ff ff       	call   482 <kthread_self>
        benny_mootex->bid = tid;
 aeb:	89 43 04             	mov    %eax,0x4(%ebx)
}
 aee:	83 c4 04             	add    $0x4,%esp
 af1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 af6:	5b                   	pop    %ebx
 af7:	5d                   	pop    %ebp
 af8:	c3                   	ret    
 af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b00 <benny_mootex_wholock>:
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 b03:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b06:	5d                   	pop    %ebp
    return benny_mootex->bid;
 b07:	8b 40 04             	mov    0x4(%eax),%eax
}
 b0a:	c3                   	ret    
 b0b:	90                   	nop
 b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b10 <benny_mootex_islocked>:
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 b13:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b16:	5d                   	pop    %ebp
    return benny_mootex->locked;
 b17:	8b 00                	mov    (%eax),%eax
}
 b19:	c3                   	ret    
 b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b20 <benny_self>:
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
}
 b23:	5d                   	pop    %ebp
    return kthread_self();
 b24:	e9 59 f9 ff ff       	jmp    482 <kthread_self>
 b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b30 <benny_yield>:
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
    
}
 b33:	5d                   	pop    %ebp
    return kthread_yield();
 b34:	e9 51 f9 ff ff       	jmp    48a <kthread_yield>
 b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b40 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 b43:	5d                   	pop    %ebp
    return kthread_cpu_count();
 b44:	e9 49 f9 ff ff       	jmp    492 <kthread_cpu_count>
 b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b50 <benny_thread_count>:

int
benny_thread_count(void)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 b53:	5d                   	pop    %ebp
    return kthread_thread_count();
 b54:	e9 41 f9 ff ff       	jmp    49a <kthread_thread_count>
