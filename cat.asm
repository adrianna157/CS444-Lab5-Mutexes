
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
  int fd, i;

  if(argc <= 1){
   5:	be 01 00 00 00       	mov    $0x1,%esi
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(argc <= 1){
  14:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  18:	8d 58 04             	lea    0x4(%eax),%ebx
  1b:	7e 5a                	jle    77 <main+0x77>
  1d:	8d 76 00             	lea    0x0(%esi),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  27:	00 
  28:	8b 03                	mov    (%ebx),%eax
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 50 03 00 00       	call   382 <open>
  32:	85 c0                	test   %eax,%eax
  34:	89 c7                	mov    %eax,%edi
  36:	78 20                	js     58 <main+0x58>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  38:	89 04 24             	mov    %eax,(%esp)
  for(i = 1; i < argc; i++){
  3b:	83 c6 01             	add    $0x1,%esi
  3e:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  41:	e8 4a 00 00 00       	call   90 <cat>
    close(fd);
  46:	89 3c 24             	mov    %edi,(%esp)
  49:	e8 1c 03 00 00       	call   36a <close>
  for(i = 1; i < argc; i++){
  4e:	3b 75 08             	cmp    0x8(%ebp),%esi
  51:	75 cd                	jne    20 <main+0x20>
  }
  exit();
  53:	e8 ea 02 00 00       	call   342 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  58:	8b 03                	mov    (%ebx),%eax
  5a:	c7 44 24 04 1c 0b 00 	movl   $0xb1c,0x4(%esp)
  61:	00 
  62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  69:	89 44 24 08          	mov    %eax,0x8(%esp)
  6d:	e8 7e 04 00 00       	call   4f0 <printf>
      exit();
  72:	e8 cb 02 00 00       	call   342 <exit>
    cat(0);
  77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7e:	e8 0d 00 00 00       	call   90 <cat>
    exit();
  83:	e8 ba 02 00 00       	call   342 <exit>
  88:	66 90                	xchg   %ax,%ax
  8a:	66 90                	xchg   %ax,%ax
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	83 ec 10             	sub    $0x10,%esp
  98:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  9b:	eb 1f                	jmp    bc <cat+0x2c>
  9d:	8d 76 00             	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  a4:	c7 44 24 04 20 10 00 	movl   $0x1020,0x4(%esp)
  ab:	00 
  ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b3:	e8 aa 02 00 00       	call   362 <write>
  b8:	39 d8                	cmp    %ebx,%eax
  ba:	75 28                	jne    e4 <cat+0x54>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  bc:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  c3:	00 
  c4:	c7 44 24 04 20 10 00 	movl   $0x1020,0x4(%esp)
  cb:	00 
  cc:	89 34 24             	mov    %esi,(%esp)
  cf:	e8 86 02 00 00       	call   35a <read>
  d4:	83 f8 00             	cmp    $0x0,%eax
  d7:	89 c3                	mov    %eax,%ebx
  d9:	7f c5                	jg     a0 <cat+0x10>
  if(n < 0){
  db:	75 20                	jne    fd <cat+0x6d>
}
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	5b                   	pop    %ebx
  e1:	5e                   	pop    %esi
  e2:	5d                   	pop    %ebp
  e3:	c3                   	ret    
      printf(1, "cat: write error\n");
  e4:	c7 44 24 04 f9 0a 00 	movl   $0xaf9,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	e8 f8 03 00 00       	call   4f0 <printf>
      exit();
  f8:	e8 45 02 00 00       	call   342 <exit>
    printf(1, "cat: read error\n");
  fd:	c7 44 24 04 0b 0b 00 	movl   $0xb0b,0x4(%esp)
 104:	00 
 105:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10c:	e8 df 03 00 00       	call   4f0 <printf>
    exit();
 111:	e8 2c 02 00 00       	call   342 <exit>
 116:	66 90                	xchg   %ax,%ax
 118:	66 90                	xchg   %ax,%ax
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 129:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12a:	89 c2                	mov    %eax,%edx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	83 c1 01             	add    $0x1,%ecx
 133:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 db                	test   %bl,%bl
 13c:	88 5a ff             	mov    %bl,-0x1(%edx)
 13f:	75 ef                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 141:	5b                   	pop    %ebx
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 14a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
 156:	53                   	push   %ebx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	74 2d                	je     18e <strcmp+0x3e>
 161:	0f b6 19             	movzbl (%ecx),%ebx
 164:	38 d8                	cmp    %bl,%al
 166:	74 0e                	je     176 <strcmp+0x26>
 168:	eb 2b                	jmp    195 <strcmp+0x45>
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 170:	38 c8                	cmp    %cl,%al
 172:	75 15                	jne    189 <strcmp+0x39>
    p++, q++;
 174:	89 d9                	mov    %ebx,%ecx
 176:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 179:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 17c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 17f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 183:	84 c0                	test   %al,%al
 185:	75 e9                	jne    170 <strcmp+0x20>
 187:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 189:	29 c8                	sub    %ecx,%eax
}
 18b:	5b                   	pop    %ebx
 18c:	5d                   	pop    %ebp
 18d:	c3                   	ret    
 18e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 191:	31 c0                	xor    %eax,%eax
 193:	eb f4                	jmp    189 <strcmp+0x39>
 195:	0f b6 cb             	movzbl %bl,%ecx
 198:	eb ef                	jmp    189 <strcmp+0x39>
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 39 00             	cmpb   $0x0,(%ecx)
 1a9:	74 12                	je     1bd <strlen+0x1d>
 1ab:	31 d2                	xor    %edx,%edx
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 1bd:	31 c0                	xor    %eax,%eax
}
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	eb 0d                	jmp    1d0 <memset>
 1c3:	90                   	nop
 1c4:	90                   	nop
 1c5:	90                   	nop
 1c6:	90                   	nop
 1c7:	90                   	nop
 1c8:	90                   	nop
 1c9:	90                   	nop
 1ca:	90                   	nop
 1cb:	90                   	nop
 1cc:	90                   	nop
 1cd:	90                   	nop
 1ce:	90                   	nop
 1cf:	90                   	nop

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
 1d6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	89 d0                	mov    %edx,%eax
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	53                   	push   %ebx
 1f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 1fa:	0f b6 18             	movzbl (%eax),%ebx
 1fd:	84 db                	test   %bl,%bl
 1ff:	74 1d                	je     21e <strchr+0x2e>
    if(*s == c)
 201:	38 d3                	cmp    %dl,%bl
 203:	89 d1                	mov    %edx,%ecx
 205:	75 0d                	jne    214 <strchr+0x24>
 207:	eb 17                	jmp    220 <strchr+0x30>
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 210:	38 ca                	cmp    %cl,%dl
 212:	74 0c                	je     220 <strchr+0x30>
  for(; *s; s++)
 214:	83 c0 01             	add    $0x1,%eax
 217:	0f b6 10             	movzbl (%eax),%edx
 21a:	84 d2                	test   %dl,%dl
 21c:	75 f2                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
 21e:	31 c0                	xor    %eax,%eax
}
 220:	5b                   	pop    %ebx
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 235:	31 f6                	xor    %esi,%esi
{
 237:	53                   	push   %ebx
 238:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 23b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 23e:	eb 31                	jmp    271 <gets+0x41>
    cc = read(0, &c, 1);
 240:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 247:	00 
 248:	89 7c 24 04          	mov    %edi,0x4(%esp)
 24c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 253:	e8 02 01 00 00       	call   35a <read>
    if(cc < 1)
 258:	85 c0                	test   %eax,%eax
 25a:	7e 1d                	jle    279 <gets+0x49>
      break;
    buf[i++] = c;
 25c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 260:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 262:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 265:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 267:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 26b:	74 0c                	je     279 <gets+0x49>
 26d:	3c 0a                	cmp    $0xa,%al
 26f:	74 08                	je     279 <gets+0x49>
  for(i=0; i+1 < max; ){
 271:	8d 5e 01             	lea    0x1(%esi),%ebx
 274:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 277:	7c c7                	jl     240 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 279:	8b 45 08             	mov    0x8(%ebp),%eax
 27c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 280:	83 c4 2c             	add    $0x2c,%esp
 283:	5b                   	pop    %ebx
 284:	5e                   	pop    %esi
 285:	5f                   	pop    %edi
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    
 288:	90                   	nop
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
 295:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a2:	00 
 2a3:	89 04 24             	mov    %eax,(%esp)
 2a6:	e8 d7 00 00 00       	call   382 <open>
  if(fd < 0)
 2ab:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 2ad:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2af:	78 27                	js     2d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b4:	89 1c 24             	mov    %ebx,(%esp)
 2b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2bb:	e8 da 00 00 00       	call   39a <fstat>
  close(fd);
 2c0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2c3:	89 c6                	mov    %eax,%esi
  close(fd);
 2c5:	e8 a0 00 00 00       	call   36a <close>
  return r;
 2ca:	89 f0                	mov    %esi,%eax
}
 2cc:	83 c4 10             	add    $0x10,%esp
 2cf:	5b                   	pop    %ebx
 2d0:	5e                   	pop    %esi
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	90                   	nop
 2d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2dd:	eb ed                	jmp    2cc <stat+0x3c>
 2df:	90                   	nop

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e7:	0f be 11             	movsbl (%ecx),%edx
 2ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 2ed:	3c 09                	cmp    $0x9,%al
  n = 0;
 2ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2f4:	77 17                	ja     30d <atoi+0x2d>
 2f6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2f8:	83 c1 01             	add    $0x1,%ecx
 2fb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2fe:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 302:	0f be 11             	movsbl (%ecx),%edx
 305:	8d 5a d0             	lea    -0x30(%edx),%ebx
 308:	80 fb 09             	cmp    $0x9,%bl
 30b:	76 eb                	jbe    2f8 <atoi+0x18>
  return n;
}
 30d:	5b                   	pop    %ebx
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 311:	31 d2                	xor    %edx,%edx
{
 313:	89 e5                	mov    %esp,%ebp
 315:	56                   	push   %esi
 316:	8b 45 08             	mov    0x8(%ebp),%eax
 319:	53                   	push   %ebx
 31a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 31d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 320:	85 db                	test   %ebx,%ebx
 322:	7e 12                	jle    336 <memmove+0x26>
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 32c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 32f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 332:	39 da                	cmp    %ebx,%edx
 334:	75 f2                	jne    328 <memmove+0x18>
  return vdst;
}
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    

0000033a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33a:	b8 01 00 00 00       	mov    $0x1,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <exit>:
SYSCALL(exit)
 342:	b8 02 00 00 00       	mov    $0x2,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <wait>:
SYSCALL(wait)
 34a:	b8 03 00 00 00       	mov    $0x3,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <pipe>:
SYSCALL(pipe)
 352:	b8 04 00 00 00       	mov    $0x4,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <read>:
SYSCALL(read)
 35a:	b8 05 00 00 00       	mov    $0x5,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <write>:
SYSCALL(write)
 362:	b8 10 00 00 00       	mov    $0x10,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <close>:
SYSCALL(close)
 36a:	b8 15 00 00 00       	mov    $0x15,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <kill>:
SYSCALL(kill)
 372:	b8 06 00 00 00       	mov    $0x6,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <exec>:
SYSCALL(exec)
 37a:	b8 07 00 00 00       	mov    $0x7,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <open>:
SYSCALL(open)
 382:	b8 0f 00 00 00       	mov    $0xf,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <mknod>:
SYSCALL(mknod)
 38a:	b8 11 00 00 00       	mov    $0x11,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <unlink>:
SYSCALL(unlink)
 392:	b8 12 00 00 00       	mov    $0x12,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <fstat>:
SYSCALL(fstat)
 39a:	b8 08 00 00 00       	mov    $0x8,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <link>:
SYSCALL(link)
 3a2:	b8 13 00 00 00       	mov    $0x13,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <mkdir>:
SYSCALL(mkdir)
 3aa:	b8 14 00 00 00       	mov    $0x14,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <chdir>:
SYSCALL(chdir)
 3b2:	b8 09 00 00 00       	mov    $0x9,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <dup>:
SYSCALL(dup)
 3ba:	b8 0a 00 00 00       	mov    $0xa,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <getpid>:
SYSCALL(getpid)
 3c2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <sbrk>:
SYSCALL(sbrk)
 3ca:	b8 0c 00 00 00       	mov    $0xc,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <sleep>:
SYSCALL(sleep)
 3d2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <uptime>:
SYSCALL(uptime)
 3da:	b8 0e 00 00 00       	mov    $0xe,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 3e2:	b8 16 00 00 00       	mov    $0x16,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 3ea:	b8 17 00 00 00       	mov    $0x17,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 3f2:	b8 18 00 00 00       	mov    $0x18,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 3fa:	b8 19 00 00 00       	mov    $0x19,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 402:	b8 1a 00 00 00       	mov    $0x1a,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 40a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <kthread_join>:
SYSCALL(kthread_join)
 412:	b8 1c 00 00 00       	mov    $0x1c,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <kthread_exit>:
SYSCALL(kthread_exit)
 41a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 422:	b8 1e 00 00 00       	mov    $0x1e,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <kthread_yield>:
SYSCALL(kthread_yield)
 42a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 432:	b8 20 00 00 00       	mov    $0x20,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 43a:	b8 21 00 00 00       	mov    $0x21,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    
 442:	66 90                	xchg   %ax,%ax
 444:	66 90                	xchg   %ax,%ax
 446:	66 90                	xchg   %ax,%ax
 448:	66 90                	xchg   %ax,%ax
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	89 c6                	mov    %eax,%esi
 457:	53                   	push   %ebx
 458:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 45e:	85 db                	test   %ebx,%ebx
 460:	74 09                	je     46b <printint+0x1b>
 462:	89 d0                	mov    %edx,%eax
 464:	c1 e8 1f             	shr    $0x1f,%eax
 467:	84 c0                	test   %al,%al
 469:	75 75                	jne    4e0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 46b:	89 d0                	mov    %edx,%eax
  neg = 0;
 46d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 474:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 477:	31 ff                	xor    %edi,%edi
 479:	89 ce                	mov    %ecx,%esi
 47b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 47e:	eb 02                	jmp    482 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 480:	89 cf                	mov    %ecx,%edi
 482:	31 d2                	xor    %edx,%edx
 484:	f7 f6                	div    %esi
 486:	8d 4f 01             	lea    0x1(%edi),%ecx
 489:	0f b6 92 38 0b 00 00 	movzbl 0xb38(%edx),%edx
  }while((x /= base) != 0);
 490:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 492:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 495:	75 e9                	jne    480 <printint+0x30>
  if(neg)
 497:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 49a:	89 c8                	mov    %ecx,%eax
 49c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 49f:	85 d2                	test   %edx,%edx
 4a1:	74 08                	je     4ab <printint+0x5b>
    buf[i++] = '-';
 4a3:	8d 4f 02             	lea    0x2(%edi),%ecx
 4a6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 4ab:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4ae:	66 90                	xchg   %ax,%ax
 4b0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4b5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 4b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4bf:	00 
 4c0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4c4:	89 34 24             	mov    %esi,(%esp)
 4c7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4ca:	e8 93 fe ff ff       	call   362 <write>
  while(--i >= 0)
 4cf:	83 ff ff             	cmp    $0xffffffff,%edi
 4d2:	75 dc                	jne    4b0 <printint+0x60>
    putc(fd, buf[i]);
}
 4d4:	83 c4 4c             	add    $0x4c,%esp
 4d7:	5b                   	pop    %ebx
 4d8:	5e                   	pop    %esi
 4d9:	5f                   	pop    %edi
 4da:	5d                   	pop    %ebp
 4db:	c3                   	ret    
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 4e0:	89 d0                	mov    %edx,%eax
 4e2:	f7 d8                	neg    %eax
    neg = 1;
 4e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4eb:	eb 87                	jmp    474 <printint+0x24>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi

000004f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4f4:	31 ff                	xor    %edi,%edi
{
 4f6:	56                   	push   %esi
 4f7:	53                   	push   %ebx
 4f8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 4fe:	8d 45 10             	lea    0x10(%ebp),%eax
{
 501:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 504:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 507:	0f b6 13             	movzbl (%ebx),%edx
 50a:	83 c3 01             	add    $0x1,%ebx
 50d:	84 d2                	test   %dl,%dl
 50f:	75 39                	jne    54a <printf+0x5a>
 511:	e9 ca 00 00 00       	jmp    5e0 <printf+0xf0>
 516:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 518:	83 fa 25             	cmp    $0x25,%edx
 51b:	0f 84 c7 00 00 00    	je     5e8 <printf+0xf8>
  write(fd, &c, 1);
 521:	8d 45 e0             	lea    -0x20(%ebp),%eax
 524:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52b:	00 
 52c:	89 44 24 04          	mov    %eax,0x4(%esp)
 530:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 533:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 536:	e8 27 fe ff ff       	call   362 <write>
 53b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 53e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 542:	84 d2                	test   %dl,%dl
 544:	0f 84 96 00 00 00    	je     5e0 <printf+0xf0>
    if(state == 0){
 54a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 54c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 54f:	74 c7                	je     518 <printf+0x28>
      }
    } else if(state == '%'){
 551:	83 ff 25             	cmp    $0x25,%edi
 554:	75 e5                	jne    53b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 556:	83 fa 75             	cmp    $0x75,%edx
 559:	0f 84 99 00 00 00    	je     5f8 <printf+0x108>
 55f:	83 fa 64             	cmp    $0x64,%edx
 562:	0f 84 90 00 00 00    	je     5f8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 568:	25 f7 00 00 00       	and    $0xf7,%eax
 56d:	83 f8 70             	cmp    $0x70,%eax
 570:	0f 84 aa 00 00 00    	je     620 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 576:	83 fa 73             	cmp    $0x73,%edx
 579:	0f 84 e9 00 00 00    	je     668 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57f:	83 fa 63             	cmp    $0x63,%edx
 582:	0f 84 2b 01 00 00    	je     6b3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 588:	83 fa 25             	cmp    $0x25,%edx
 58b:	0f 84 4f 01 00 00    	je     6e0 <printf+0x1f0>
  write(fd, &c, 1);
 591:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 594:	83 c3 01             	add    $0x1,%ebx
 597:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 59e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 59f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a5:	89 34 24             	mov    %esi,(%esp)
 5a8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5ab:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 5af:	e8 ae fd ff ff       	call   362 <write>
        putc(fd, c);
 5b4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 5b7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ba:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c1:	00 
 5c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 5c9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5cc:	e8 91 fd ff ff       	call   362 <write>
  for(i = 0; fmt[i]; i++){
 5d1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5d5:	84 d2                	test   %dl,%dl
 5d7:	0f 85 6d ff ff ff    	jne    54a <printf+0x5a>
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 5e0:	83 c4 3c             	add    $0x3c,%esp
 5e3:	5b                   	pop    %ebx
 5e4:	5e                   	pop    %esi
 5e5:	5f                   	pop    %edi
 5e6:	5d                   	pop    %ebp
 5e7:	c3                   	ret    
        state = '%';
 5e8:	bf 25 00 00 00       	mov    $0x25,%edi
 5ed:	e9 49 ff ff ff       	jmp    53b <printf+0x4b>
 5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5ff:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 604:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 607:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 609:	8b 10                	mov    (%eax),%edx
 60b:	89 f0                	mov    %esi,%eax
 60d:	e8 3e fe ff ff       	call   450 <printint>
        ap++;
 612:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 616:	e9 20 ff ff ff       	jmp    53b <printf+0x4b>
 61b:	90                   	nop
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 620:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 623:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 62a:	00 
 62b:	89 44 24 04          	mov    %eax,0x4(%esp)
 62f:	89 34 24             	mov    %esi,(%esp)
 632:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 636:	e8 27 fd ff ff       	call   362 <write>
 63b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 63e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 645:	00 
 646:	89 44 24 04          	mov    %eax,0x4(%esp)
 64a:	89 34 24             	mov    %esi,(%esp)
 64d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 651:	e8 0c fd ff ff       	call   362 <write>
        printint(fd, *ap, 16, 0);
 656:	b9 10 00 00 00       	mov    $0x10,%ecx
 65b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 662:	eb a0                	jmp    604 <printf+0x114>
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 668:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 66b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 66f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 671:	b8 31 0b 00 00       	mov    $0xb31,%eax
 676:	85 ff                	test   %edi,%edi
 678:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 67b:	0f b6 07             	movzbl (%edi),%eax
 67e:	84 c0                	test   %al,%al
 680:	74 2a                	je     6ac <printf+0x1bc>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 688:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 68b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 68e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 691:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 698:	00 
 699:	89 44 24 04          	mov    %eax,0x4(%esp)
 69d:	89 34 24             	mov    %esi,(%esp)
 6a0:	e8 bd fc ff ff       	call   362 <write>
        while(*s != 0){
 6a5:	0f b6 07             	movzbl (%edi),%eax
 6a8:	84 c0                	test   %al,%al
 6aa:	75 dc                	jne    688 <printf+0x198>
      state = 0;
 6ac:	31 ff                	xor    %edi,%edi
 6ae:	e9 88 fe ff ff       	jmp    53b <printf+0x4b>
        putc(fd, *ap);
 6b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6b6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 6b8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6ba:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6c1:	00 
 6c2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 6c5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6c8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cf:	e8 8e fc ff ff       	call   362 <write>
        ap++;
 6d4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6d8:	e9 5e fe ff ff       	jmp    53b <printf+0x4b>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6e0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 6e3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6e5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6ec:	00 
 6ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f1:	89 34 24             	mov    %esi,(%esp)
 6f4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 6f8:	e8 65 fc ff ff       	call   362 <write>
 6fd:	e9 39 fe ff ff       	jmp    53b <printf+0x4b>
 702:	66 90                	xchg   %ax,%ax
 704:	66 90                	xchg   %ax,%ax
 706:	66 90                	xchg   %ax,%ax
 708:	66 90                	xchg   %ax,%ax
 70a:	66 90                	xchg   %ax,%ax
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 00 10 00 00       	mov    0x1000,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 71e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 720:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 723:	39 d0                	cmp    %edx,%eax
 725:	72 11                	jb     738 <free+0x28>
 727:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 728:	39 c8                	cmp    %ecx,%eax
 72a:	72 04                	jb     730 <free+0x20>
 72c:	39 ca                	cmp    %ecx,%edx
 72e:	72 10                	jb     740 <free+0x30>
 730:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 732:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 734:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 736:	73 f0                	jae    728 <free+0x18>
 738:	39 ca                	cmp    %ecx,%edx
 73a:	72 04                	jb     740 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73c:	39 c8                	cmp    %ecx,%eax
 73e:	72 f0                	jb     730 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 740:	8b 73 fc             	mov    -0x4(%ebx),%esi
 743:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 746:	39 cf                	cmp    %ecx,%edi
 748:	74 1e                	je     768 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 74a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74d:	8b 48 04             	mov    0x4(%eax),%ecx
 750:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 753:	39 f2                	cmp    %esi,%edx
 755:	74 28                	je     77f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 757:	89 10                	mov    %edx,(%eax)
  freep = p;
 759:	a3 00 10 00 00       	mov    %eax,0x1000
}
 75e:	5b                   	pop    %ebx
 75f:	5e                   	pop    %esi
 760:	5f                   	pop    %edi
 761:	5d                   	pop    %ebp
 762:	c3                   	ret    
 763:	90                   	nop
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 768:	03 71 04             	add    0x4(%ecx),%esi
 76b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 76e:	8b 08                	mov    (%eax),%ecx
 770:	8b 09                	mov    (%ecx),%ecx
 772:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 775:	8b 48 04             	mov    0x4(%eax),%ecx
 778:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 77b:	39 f2                	cmp    %esi,%edx
 77d:	75 d8                	jne    757 <free+0x47>
    p->s.size += bp->s.size;
 77f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 782:	a3 00 10 00 00       	mov    %eax,0x1000
    p->s.size += bp->s.size;
 787:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 78a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 78d:	89 10                	mov    %edx,(%eax)
}
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 79a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 1d 00 10 00 00    	mov    0x1000,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 48 07             	lea    0x7(%eax),%ecx
 7b5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 7b8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ba:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 7bd:	0f 84 9b 00 00 00    	je     85e <malloc+0xbe>
 7c3:	8b 13                	mov    (%ebx),%edx
 7c5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7c8:	39 fe                	cmp    %edi,%esi
 7ca:	76 64                	jbe    830 <malloc+0x90>
 7cc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 7d3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 7d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7db:	eb 0e                	jmp    7eb <malloc+0x4b>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7e2:	8b 78 04             	mov    0x4(%eax),%edi
 7e5:	39 fe                	cmp    %edi,%esi
 7e7:	76 4f                	jbe    838 <malloc+0x98>
 7e9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7eb:	3b 15 00 10 00 00    	cmp    0x1000,%edx
 7f1:	75 ed                	jne    7e0 <malloc+0x40>
  if(nu < 4096)
 7f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 7fc:	bf 00 10 00 00       	mov    $0x1000,%edi
 801:	0f 43 fe             	cmovae %esi,%edi
 804:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 807:	89 04 24             	mov    %eax,(%esp)
 80a:	e8 bb fb ff ff       	call   3ca <sbrk>
  if(p == (char*)-1)
 80f:	83 f8 ff             	cmp    $0xffffffff,%eax
 812:	74 18                	je     82c <malloc+0x8c>
  hp->s.size = nu;
 814:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 817:	83 c0 08             	add    $0x8,%eax
 81a:	89 04 24             	mov    %eax,(%esp)
 81d:	e8 ee fe ff ff       	call   710 <free>
  return freep;
 822:	8b 15 00 10 00 00    	mov    0x1000,%edx
      if((p = morecore(nunits)) == 0)
 828:	85 d2                	test   %edx,%edx
 82a:	75 b4                	jne    7e0 <malloc+0x40>
        return 0;
 82c:	31 c0                	xor    %eax,%eax
 82e:	eb 20                	jmp    850 <malloc+0xb0>
    if(p->s.size >= nunits){
 830:	89 d0                	mov    %edx,%eax
 832:	89 da                	mov    %ebx,%edx
 834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 838:	39 fe                	cmp    %edi,%esi
 83a:	74 1c                	je     858 <malloc+0xb8>
        p->s.size -= nunits;
 83c:	29 f7                	sub    %esi,%edi
 83e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 841:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 844:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 847:	89 15 00 10 00 00    	mov    %edx,0x1000
      return (void*)(p + 1);
 84d:	83 c0 08             	add    $0x8,%eax
  }
}
 850:	83 c4 1c             	add    $0x1c,%esp
 853:	5b                   	pop    %ebx
 854:	5e                   	pop    %esi
 855:	5f                   	pop    %edi
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 858:	8b 08                	mov    (%eax),%ecx
 85a:	89 0a                	mov    %ecx,(%edx)
 85c:	eb e9                	jmp    847 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 85e:	c7 05 00 10 00 00 04 	movl   $0x1004,0x1000
 865:	10 00 00 
    base.s.size = 0;
 868:	ba 04 10 00 00       	mov    $0x1004,%edx
    base.s.ptr = freep = prevp = &base;
 86d:	c7 05 04 10 00 00 04 	movl   $0x1004,0x1004
 874:	10 00 00 
    base.s.size = 0;
 877:	c7 05 08 10 00 00 00 	movl   $0x0,0x1008
 87e:	00 00 00 
 881:	e9 46 ff ff ff       	jmp    7cc <malloc+0x2c>
 886:	66 90                	xchg   %ax,%ax
 888:	66 90                	xchg   %ax,%ax
 88a:	66 90                	xchg   %ax,%ax
 88c:	66 90                	xchg   %ax,%ax
 88e:	66 90                	xchg   %ax,%ax

00000890 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	56                   	push   %esi
 894:	53                   	push   %ebx
 895:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 898:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 89f:	e8 fc fe ff ff       	call   7a0 <malloc>

    if (bt == NULL) {
 8a4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 8a6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 8a8:	74 66                	je     910 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 8aa:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8b1:	e8 ea fe ff ff       	call   7a0 <malloc>
    if (bt->bt_stack == NULL) {
 8b6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 8b8:	89 c3                	mov    %eax,%ebx
 8ba:	89 46 08             	mov    %eax,0x8(%esi)
 8bd:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 8c0:	74 5d                	je     91f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 8c2:	25 ff 0f 00 00       	and    $0xfff,%eax
 8c7:	75 37                	jne    900 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 8c9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8cf:	8b 45 10             	mov    0x10(%ebp),%eax
 8d2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8da:	8b 45 0c             	mov    0xc(%ebp),%eax
 8dd:	89 04 24             	mov    %eax,(%esp)
 8e0:	e8 25 fb ff ff       	call   40a <kthread_create>
    if (bt->bid != 0) {
 8e5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8e7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 8e9:	74 2d                	je     918 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 8eb:	8b 45 08             	mov    0x8(%ebp),%eax
 8ee:	89 30                	mov    %esi,(%eax)
        result = 0;
 8f0:	31 c0                	xor    %eax,%eax
}
 8f2:	83 c4 10             	add    $0x10,%esp
 8f5:	5b                   	pop    %ebx
 8f6:	5e                   	pop    %esi
 8f7:	5d                   	pop    %ebp
 8f8:	c3                   	ret    
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 900:	29 c3                	sub    %eax,%ebx
 902:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 908:	89 5e 04             	mov    %ebx,0x4(%esi)
 90b:	eb bc                	jmp    8c9 <benny_thread_create+0x39>
 90d:	8d 76 00             	lea    0x0(%esi),%esi
 910:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 916:	eb b7                	jmp    8cf <benny_thread_create+0x3f>
    int result = -1;
 918:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 91d:	eb d3                	jmp    8f2 <benny_thread_create+0x62>
        free(bt);
 91f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 922:	31 f6                	xor    %esi,%esi
        free(bt);
 924:	e8 e7 fd ff ff       	call   710 <free>
 929:	8b 5b 04             	mov    0x4(%ebx),%ebx
 92c:	eb a1                	jmp    8cf <benny_thread_create+0x3f>
 92e:	66 90                	xchg   %ax,%ax

00000930 <benny_thread_bid>:
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 933:	8b 45 08             	mov    0x8(%ebp),%eax
}
 936:	5d                   	pop    %ebp
    return bt->bid;
 937:	8b 00                	mov    (%eax),%eax
}
 939:	c3                   	ret    
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000940 <benny_thread_join>:
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	53                   	push   %ebx
 944:	83 ec 14             	sub    $0x14,%esp
 947:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 94a:	8b 03                	mov    (%ebx),%eax
 94c:	89 04 24             	mov    %eax,(%esp)
 94f:	e8 be fa ff ff       	call   412 <kthread_join>
    if (retVal == 0) {
 954:	85 c0                	test   %eax,%eax
 956:	75 27                	jne    97f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 958:	8b 53 08             	mov    0x8(%ebx),%edx
 95b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 95e:	89 14 24             	mov    %edx,(%esp)
 961:	e8 aa fd ff ff       	call   710 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 966:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 96d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 974:	89 1c 24             	mov    %ebx,(%esp)
 977:	e8 94 fd ff ff       	call   710 <free>
 97c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 97f:	83 c4 14             	add    $0x14,%esp
 982:	5b                   	pop    %ebx
 983:	5d                   	pop    %ebp
 984:	c3                   	ret    
 985:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <benny_thread_exit>:
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
}
 993:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 994:	e9 81 fa ff ff       	jmp    41a <kthread_exit>
 999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009a0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 9a6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 9ac:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 9b3:	31 c0                	xor    %eax,%eax
 9b5:	5d                   	pop    %ebp
 9b6:	c3                   	ret    
 9b7:	89 f6                	mov    %esi,%esi
 9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009c0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 9c0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 9c1:	b8 01 00 00 00       	mov    $0x1,%eax
 9c6:	89 e5                	mov    %esp,%ebp
 9c8:	56                   	push   %esi
 9c9:	53                   	push   %ebx
 9ca:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9cd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 9d0:	85 c0                	test   %eax,%eax
 9d2:	be 01 00 00 00       	mov    $0x1,%esi
 9d7:	74 15                	je     9ee <benny_mootex_yieldlock+0x2e>
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 9e0:	e8 45 fa ff ff       	call   42a <kthread_yield>
 9e5:	89 f0                	mov    %esi,%eax
 9e7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 9ea:	85 c0                	test   %eax,%eax
 9ec:	75 f2                	jne    9e0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 9ee:	e8 2f fa ff ff       	call   422 <kthread_self>
    benny_mootex->bid = benny_self();
 9f3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9f6:	31 c0                	xor    %eax,%eax
 9f8:	5b                   	pop    %ebx
 9f9:	5e                   	pop    %esi
 9fa:	5d                   	pop    %ebp
 9fb:	c3                   	ret    
 9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a00 <benny_mootex_spinlock>:
{
 a00:	55                   	push   %ebp
 a01:	ba 01 00 00 00       	mov    $0x1,%edx
 a06:	89 e5                	mov    %esp,%ebp
 a08:	53                   	push   %ebx
 a09:	83 ec 04             	sub    $0x4,%esp
 a0c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a0f:	90                   	nop
 a10:	89 d0                	mov    %edx,%eax
 a12:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a15:	85 c0                	test   %eax,%eax
 a17:	75 f7                	jne    a10 <benny_mootex_spinlock+0x10>
    return kthread_self();
 a19:	e8 04 fa ff ff       	call   422 <kthread_self>
    benny_mootex->bid = benny_self();
 a1e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a21:	83 c4 04             	add    $0x4,%esp
 a24:	31 c0                	xor    %eax,%eax
 a26:	5b                   	pop    %ebx
 a27:	5d                   	pop    %ebp
 a28:	c3                   	ret    
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_mootex_unlock>:
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	53                   	push   %ebx
 a34:	83 ec 04             	sub    $0x4,%esp
 a37:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 a3a:	e8 e3 f9 ff ff       	call   422 <kthread_self>
    if(tid == benny_mootex->bid){
 a3f:	39 43 04             	cmp    %eax,0x4(%ebx)
 a42:	75 1c                	jne    a60 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 a44:	0f ae f0             	mfence 
    return 0;
 a47:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 a49:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 a50:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 a56:	83 c4 04             	add    $0x4,%esp
 a59:	5b                   	pop    %ebx
 a5a:	5d                   	pop    %ebp
 a5b:	c3                   	ret    
 a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a60:	83 c4 04             	add    $0x4,%esp
      return -1;
 a63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a68:	5b                   	pop    %ebx
 a69:	5d                   	pop    %ebp
 a6a:	c3                   	ret    
 a6b:	90                   	nop
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <benny_mootex_trylock>:
{
 a70:	55                   	push   %ebp
 a71:	b8 01 00 00 00       	mov    $0x1,%eax
 a76:	89 e5                	mov    %esp,%ebp
 a78:	53                   	push   %ebx
 a79:	83 ec 04             	sub    $0x4,%esp
 a7c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a7f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 a82:	85 c0                	test   %eax,%eax
 a84:	75 08                	jne    a8e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 a86:	e8 97 f9 ff ff       	call   422 <kthread_self>
        benny_mootex->bid = tid;
 a8b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a8e:	83 c4 04             	add    $0x4,%esp
 a91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a96:	5b                   	pop    %ebx
 a97:	5d                   	pop    %ebp
 a98:	c3                   	ret    
 a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <benny_mootex_wholock>:
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 aa3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 aa6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 aa7:	8b 40 04             	mov    0x4(%eax),%eax
}
 aaa:	c3                   	ret    
 aab:	90                   	nop
 aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ab0 <benny_mootex_islocked>:
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 ab3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ab6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 ab7:	8b 00                	mov    (%eax),%eax
}
 ab9:	c3                   	ret    
 aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ac0 <benny_self>:
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
}
 ac3:	5d                   	pop    %ebp
    return kthread_self();
 ac4:	e9 59 f9 ff ff       	jmp    422 <kthread_self>
 ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <benny_yield>:
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
    
}
 ad3:	5d                   	pop    %ebp
    return kthread_yield();
 ad4:	e9 51 f9 ff ff       	jmp    42a <kthread_yield>
 ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ae0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 ae3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 ae4:	e9 49 f9 ff ff       	jmp    432 <kthread_cpu_count>
 ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000af0 <benny_thread_count>:

int
benny_thread_count(void)
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 af3:	5d                   	pop    %ebp
    return kthread_thread_count();
 af4:	e9 41 f9 ff ff       	jmp    43a <kthread_thread_count>
