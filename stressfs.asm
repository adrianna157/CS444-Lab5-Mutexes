
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
  int fd, i;
  char path[] = "stressfs0";
   1:	b8 30 00 00 00       	mov    $0x30,%eax
{
   6:	89 e5                	mov    %esp,%ebp
   8:	57                   	push   %edi
   9:	56                   	push   %esi
   a:	53                   	push   %ebx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
   b:	31 db                	xor    %ebx,%ebx
{
   d:	83 e4 f0             	and    $0xfffffff0,%esp
  10:	81 ec 20 02 00 00    	sub    $0x220,%esp
  printf(1, "stressfs starting\n");
  16:	c7 44 24 04 19 0b 00 	movl   $0xb19,0x4(%esp)
  1d:	00 
  memset(data, 'a', sizeof(data));
  1e:	8d 74 24 20          	lea    0x20(%esp),%esi
  printf(1, "stressfs starting\n");
  22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  char path[] = "stressfs0";
  29:	66 89 44 24 1e       	mov    %ax,0x1e(%esp)
  2e:	c7 44 24 16 73 74 72 	movl   $0x65727473,0x16(%esp)
  35:	65 
  36:	c7 44 24 1a 73 73 66 	movl   $0x73667373,0x1a(%esp)
  3d:	73 
  printf(1, "stressfs starting\n");
  3e:	e8 cd 04 00 00       	call   510 <printf>
  memset(data, 'a', sizeof(data));
  43:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  4a:	00 
  4b:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  52:	00 
  53:	89 34 24             	mov    %esi,(%esp)
  56:	e8 95 01 00 00       	call   1f0 <memset>
    if(fork() > 0)
  5b:	e8 fa 02 00 00       	call   35a <fork>
  60:	85 c0                	test   %eax,%eax
  62:	0f 8f c3 00 00 00    	jg     12b <main+0x12b>
  for(i = 0; i < 4; i++)
  68:	83 c3 01             	add    $0x1,%ebx
  6b:	83 fb 04             	cmp    $0x4,%ebx
  6e:	75 eb                	jne    5b <main+0x5b>
  70:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  75:	89 5c 24 08          	mov    %ebx,0x8(%esp)

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  79:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  7e:	c7 44 24 04 2c 0b 00 	movl   $0xb2c,0x4(%esp)
  85:	00 
  86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8d:	e8 7e 04 00 00       	call   510 <printf>
  path[8] += i;
  92:	89 f8                	mov    %edi,%eax
  94:	00 44 24 1e          	add    %al,0x1e(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  98:	8d 44 24 16          	lea    0x16(%esp),%eax
  9c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  a3:	00 
  a4:	89 04 24             	mov    %eax,(%esp)
  a7:	e8 f6 02 00 00       	call   3a2 <open>
  ac:	89 c7                	mov    %eax,%edi
  ae:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  b7:	00 
  b8:	89 74 24 04          	mov    %esi,0x4(%esp)
  bc:	89 3c 24             	mov    %edi,(%esp)
  bf:	e8 be 02 00 00       	call   382 <write>
  for(i = 0; i < 20; i++)
  c4:	83 eb 01             	sub    $0x1,%ebx
  c7:	75 e7                	jne    b0 <main+0xb0>
  close(fd);
  c9:	89 3c 24             	mov    %edi,(%esp)

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  cc:	bb 14 00 00 00       	mov    $0x14,%ebx
  close(fd);
  d1:	e8 b4 02 00 00       	call   38a <close>
  printf(1, "read\n");
  d6:	c7 44 24 04 36 0b 00 	movl   $0xb36,0x4(%esp)
  dd:	00 
  de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e5:	e8 26 04 00 00       	call   510 <printf>
  fd = open(path, O_RDONLY);
  ea:	8d 44 24 16          	lea    0x16(%esp),%eax
  ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  f5:	00 
  f6:	89 04 24             	mov    %eax,(%esp)
  f9:	e8 a4 02 00 00       	call   3a2 <open>
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 107:	00 
 108:	89 74 24 04          	mov    %esi,0x4(%esp)
 10c:	89 3c 24             	mov    %edi,(%esp)
 10f:	e8 66 02 00 00       	call   37a <read>
  for (i = 0; i < 20; i++)
 114:	83 eb 01             	sub    $0x1,%ebx
 117:	75 e7                	jne    100 <main+0x100>
  close(fd);
 119:	89 3c 24             	mov    %edi,(%esp)
 11c:	e8 69 02 00 00       	call   38a <close>

  wait();
 121:	e8 44 02 00 00       	call   36a <wait>

  exit();
 126:	e8 37 02 00 00       	call   362 <exit>
 12b:	89 df                	mov    %ebx,%edi
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	e9 40 ff ff ff       	jmp    75 <main+0x75>
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 149:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 14a:	89 c2                	mov    %eax,%edx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	83 c1 01             	add    $0x1,%ecx
 153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 157:	83 c2 01             	add    $0x1,%edx
 15a:	84 db                	test   %bl,%bl
 15c:	88 5a ff             	mov    %bl,-0x1(%edx)
 15f:	75 ef                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 161:	5b                   	pop    %ebx
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 55 08             	mov    0x8(%ebp),%edx
 176:	53                   	push   %ebx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	74 2d                	je     1ae <strcmp+0x3e>
 181:	0f b6 19             	movzbl (%ecx),%ebx
 184:	38 d8                	cmp    %bl,%al
 186:	74 0e                	je     196 <strcmp+0x26>
 188:	eb 2b                	jmp    1b5 <strcmp+0x45>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 190:	38 c8                	cmp    %cl,%al
 192:	75 15                	jne    1a9 <strcmp+0x39>
    p++, q++;
 194:	89 d9                	mov    %ebx,%ecx
 196:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 199:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 19c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 19f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 1a3:	84 c0                	test   %al,%al
 1a5:	75 e9                	jne    190 <strcmp+0x20>
 1a7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1a9:	29 c8                	sub    %ecx,%eax
}
 1ab:	5b                   	pop    %ebx
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret    
 1ae:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 1b1:	31 c0                	xor    %eax,%eax
 1b3:	eb f4                	jmp    1a9 <strcmp+0x39>
 1b5:	0f b6 cb             	movzbl %bl,%ecx
 1b8:	eb ef                	jmp    1a9 <strcmp+0x39>
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 39 00             	cmpb   $0x0,(%ecx)
 1c9:	74 12                	je     1dd <strlen+0x1d>
 1cb:	31 d2                	xor    %edx,%edx
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c2 01             	add    $0x1,%edx
 1d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1d7:	89 d0                	mov    %edx,%eax
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 1dd:	31 c0                	xor    %eax,%eax
}
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	eb 0d                	jmp    1f0 <memset>
 1e3:	90                   	nop
 1e4:	90                   	nop
 1e5:	90                   	nop
 1e6:	90                   	nop
 1e7:	90                   	nop
 1e8:	90                   	nop
 1e9:	90                   	nop
 1ea:	90                   	nop
 1eb:	90                   	nop
 1ec:	90                   	nop
 1ed:	90                   	nop
 1ee:	90                   	nop
 1ef:	90                   	nop

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 55 08             	mov    0x8(%ebp),%edx
 1f6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	89 d0                	mov    %edx,%eax
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	53                   	push   %ebx
 217:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 21a:	0f b6 18             	movzbl (%eax),%ebx
 21d:	84 db                	test   %bl,%bl
 21f:	74 1d                	je     23e <strchr+0x2e>
    if(*s == c)
 221:	38 d3                	cmp    %dl,%bl
 223:	89 d1                	mov    %edx,%ecx
 225:	75 0d                	jne    234 <strchr+0x24>
 227:	eb 17                	jmp    240 <strchr+0x30>
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 230:	38 ca                	cmp    %cl,%dl
 232:	74 0c                	je     240 <strchr+0x30>
  for(; *s; s++)
 234:	83 c0 01             	add    $0x1,%eax
 237:	0f b6 10             	movzbl (%eax),%edx
 23a:	84 d2                	test   %dl,%dl
 23c:	75 f2                	jne    230 <strchr+0x20>
      return (char*)s;
  return 0;
 23e:	31 c0                	xor    %eax,%eax
}
 240:	5b                   	pop    %ebx
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 255:	31 f6                	xor    %esi,%esi
{
 257:	53                   	push   %ebx
 258:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 25b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 25e:	eb 31                	jmp    291 <gets+0x41>
    cc = read(0, &c, 1);
 260:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 267:	00 
 268:	89 7c 24 04          	mov    %edi,0x4(%esp)
 26c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 273:	e8 02 01 00 00       	call   37a <read>
    if(cc < 1)
 278:	85 c0                	test   %eax,%eax
 27a:	7e 1d                	jle    299 <gets+0x49>
      break;
    buf[i++] = c;
 27c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 280:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 282:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 285:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 287:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 28b:	74 0c                	je     299 <gets+0x49>
 28d:	3c 0a                	cmp    $0xa,%al
 28f:	74 08                	je     299 <gets+0x49>
  for(i=0; i+1 < max; ){
 291:	8d 5e 01             	lea    0x1(%esi),%ebx
 294:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 297:	7c c7                	jl     260 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2a0:	83 c4 2c             	add    $0x2c,%esp
 2a3:	5b                   	pop    %ebx
 2a4:	5e                   	pop    %esi
 2a5:	5f                   	pop    %edi
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    
 2a8:	90                   	nop
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
 2b5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2c2:	00 
 2c3:	89 04 24             	mov    %eax,(%esp)
 2c6:	e8 d7 00 00 00       	call   3a2 <open>
  if(fd < 0)
 2cb:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 2cd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2cf:	78 27                	js     2f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d4:	89 1c 24             	mov    %ebx,(%esp)
 2d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2db:	e8 da 00 00 00       	call   3ba <fstat>
  close(fd);
 2e0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2e3:	89 c6                	mov    %eax,%esi
  close(fd);
 2e5:	e8 a0 00 00 00       	call   38a <close>
  return r;
 2ea:	89 f0                	mov    %esi,%eax
}
 2ec:	83 c4 10             	add    $0x10,%esp
 2ef:	5b                   	pop    %ebx
 2f0:	5e                   	pop    %esi
 2f1:	5d                   	pop    %ebp
 2f2:	c3                   	ret    
 2f3:	90                   	nop
 2f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2fd:	eb ed                	jmp    2ec <stat+0x3c>
 2ff:	90                   	nop

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	8b 4d 08             	mov    0x8(%ebp),%ecx
 306:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 11             	movsbl (%ecx),%edx
 30a:	8d 42 d0             	lea    -0x30(%edx),%eax
 30d:	3c 09                	cmp    $0x9,%al
  n = 0;
 30f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 314:	77 17                	ja     32d <atoi+0x2d>
 316:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 318:	83 c1 01             	add    $0x1,%ecx
 31b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 31e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 322:	0f be 11             	movsbl (%ecx),%edx
 325:	8d 5a d0             	lea    -0x30(%edx),%ebx
 328:	80 fb 09             	cmp    $0x9,%bl
 32b:	76 eb                	jbe    318 <atoi+0x18>
  return n;
}
 32d:	5b                   	pop    %ebx
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    

00000330 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 330:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 331:	31 d2                	xor    %edx,%edx
{
 333:	89 e5                	mov    %esp,%ebp
 335:	56                   	push   %esi
 336:	8b 45 08             	mov    0x8(%ebp),%eax
 339:	53                   	push   %ebx
 33a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 33d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 340:	85 db                	test   %ebx,%ebx
 342:	7e 12                	jle    356 <memmove+0x26>
 344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 348:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 34c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 34f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 352:	39 da                	cmp    %ebx,%edx
 354:	75 f2                	jne    348 <memmove+0x18>
  return vdst;
}
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5d                   	pop    %ebp
 359:	c3                   	ret    

0000035a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35a:	b8 01 00 00 00       	mov    $0x1,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <exit>:
SYSCALL(exit)
 362:	b8 02 00 00 00       	mov    $0x2,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <wait>:
SYSCALL(wait)
 36a:	b8 03 00 00 00       	mov    $0x3,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <pipe>:
SYSCALL(pipe)
 372:	b8 04 00 00 00       	mov    $0x4,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <read>:
SYSCALL(read)
 37a:	b8 05 00 00 00       	mov    $0x5,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <write>:
SYSCALL(write)
 382:	b8 10 00 00 00       	mov    $0x10,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <close>:
SYSCALL(close)
 38a:	b8 15 00 00 00       	mov    $0x15,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <kill>:
SYSCALL(kill)
 392:	b8 06 00 00 00       	mov    $0x6,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <exec>:
SYSCALL(exec)
 39a:	b8 07 00 00 00       	mov    $0x7,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <open>:
SYSCALL(open)
 3a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <mknod>:
SYSCALL(mknod)
 3aa:	b8 11 00 00 00       	mov    $0x11,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <unlink>:
SYSCALL(unlink)
 3b2:	b8 12 00 00 00       	mov    $0x12,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <fstat>:
SYSCALL(fstat)
 3ba:	b8 08 00 00 00       	mov    $0x8,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <link>:
SYSCALL(link)
 3c2:	b8 13 00 00 00       	mov    $0x13,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <mkdir>:
SYSCALL(mkdir)
 3ca:	b8 14 00 00 00       	mov    $0x14,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <chdir>:
SYSCALL(chdir)
 3d2:	b8 09 00 00 00       	mov    $0x9,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <dup>:
SYSCALL(dup)
 3da:	b8 0a 00 00 00       	mov    $0xa,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <getpid>:
SYSCALL(getpid)
 3e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <sbrk>:
SYSCALL(sbrk)
 3ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <sleep>:
SYSCALL(sleep)
 3f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <uptime>:
SYSCALL(uptime)
 3fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 402:	b8 16 00 00 00       	mov    $0x16,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 40a:	b8 17 00 00 00       	mov    $0x17,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 412:	b8 18 00 00 00       	mov    $0x18,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 41a:	b8 19 00 00 00       	mov    $0x19,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 422:	b8 1a 00 00 00       	mov    $0x1a,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 42a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <kthread_join>:
SYSCALL(kthread_join)
 432:	b8 1c 00 00 00       	mov    $0x1c,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <kthread_exit>:
SYSCALL(kthread_exit)
 43a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 442:	b8 1e 00 00 00       	mov    $0x1e,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <kthread_yield>:
SYSCALL(kthread_yield)
 44a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 452:	b8 20 00 00 00       	mov    $0x20,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 45a:	b8 21 00 00 00       	mov    $0x21,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    
 462:	66 90                	xchg   %ax,%ax
 464:	66 90                	xchg   %ax,%ax
 466:	66 90                	xchg   %ax,%ax
 468:	66 90                	xchg   %ax,%ax
 46a:	66 90                	xchg   %ax,%ax
 46c:	66 90                	xchg   %ax,%ax
 46e:	66 90                	xchg   %ax,%ax

00000470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	89 c6                	mov    %eax,%esi
 477:	53                   	push   %ebx
 478:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 47b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 47e:	85 db                	test   %ebx,%ebx
 480:	74 09                	je     48b <printint+0x1b>
 482:	89 d0                	mov    %edx,%eax
 484:	c1 e8 1f             	shr    $0x1f,%eax
 487:	84 c0                	test   %al,%al
 489:	75 75                	jne    500 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 48b:	89 d0                	mov    %edx,%eax
  neg = 0;
 48d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 494:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 497:	31 ff                	xor    %edi,%edi
 499:	89 ce                	mov    %ecx,%esi
 49b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 49e:	eb 02                	jmp    4a2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 4a0:	89 cf                	mov    %ecx,%edi
 4a2:	31 d2                	xor    %edx,%edx
 4a4:	f7 f6                	div    %esi
 4a6:	8d 4f 01             	lea    0x1(%edi),%ecx
 4a9:	0f b6 92 43 0b 00 00 	movzbl 0xb43(%edx),%edx
  }while((x /= base) != 0);
 4b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4b2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4b5:	75 e9                	jne    4a0 <printint+0x30>
  if(neg)
 4b7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 4ba:	89 c8                	mov    %ecx,%eax
 4bc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 4bf:	85 d2                	test   %edx,%edx
 4c1:	74 08                	je     4cb <printint+0x5b>
    buf[i++] = '-';
 4c3:	8d 4f 02             	lea    0x2(%edi),%ecx
 4c6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 4cb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4ce:	66 90                	xchg   %ax,%ax
 4d0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4d5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 4d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4df:	00 
 4e0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4e4:	89 34 24             	mov    %esi,(%esp)
 4e7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4ea:	e8 93 fe ff ff       	call   382 <write>
  while(--i >= 0)
 4ef:	83 ff ff             	cmp    $0xffffffff,%edi
 4f2:	75 dc                	jne    4d0 <printint+0x60>
    putc(fd, buf[i]);
}
 4f4:	83 c4 4c             	add    $0x4c,%esp
 4f7:	5b                   	pop    %ebx
 4f8:	5e                   	pop    %esi
 4f9:	5f                   	pop    %edi
 4fa:	5d                   	pop    %ebp
 4fb:	c3                   	ret    
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 500:	89 d0                	mov    %edx,%eax
 502:	f7 d8                	neg    %eax
    neg = 1;
 504:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 50b:	eb 87                	jmp    494 <printint+0x24>
 50d:	8d 76 00             	lea    0x0(%esi),%esi

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 514:	31 ff                	xor    %edi,%edi
{
 516:	56                   	push   %esi
 517:	53                   	push   %ebx
 518:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 51b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 51e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 521:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 524:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 527:	0f b6 13             	movzbl (%ebx),%edx
 52a:	83 c3 01             	add    $0x1,%ebx
 52d:	84 d2                	test   %dl,%dl
 52f:	75 39                	jne    56a <printf+0x5a>
 531:	e9 ca 00 00 00       	jmp    600 <printf+0xf0>
 536:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 538:	83 fa 25             	cmp    $0x25,%edx
 53b:	0f 84 c7 00 00 00    	je     608 <printf+0xf8>
  write(fd, &c, 1);
 541:	8d 45 e0             	lea    -0x20(%ebp),%eax
 544:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 54b:	00 
 54c:	89 44 24 04          	mov    %eax,0x4(%esp)
 550:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 553:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 556:	e8 27 fe ff ff       	call   382 <write>
 55b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 55e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 562:	84 d2                	test   %dl,%dl
 564:	0f 84 96 00 00 00    	je     600 <printf+0xf0>
    if(state == 0){
 56a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 56c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 56f:	74 c7                	je     538 <printf+0x28>
      }
    } else if(state == '%'){
 571:	83 ff 25             	cmp    $0x25,%edi
 574:	75 e5                	jne    55b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 576:	83 fa 75             	cmp    $0x75,%edx
 579:	0f 84 99 00 00 00    	je     618 <printf+0x108>
 57f:	83 fa 64             	cmp    $0x64,%edx
 582:	0f 84 90 00 00 00    	je     618 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 588:	25 f7 00 00 00       	and    $0xf7,%eax
 58d:	83 f8 70             	cmp    $0x70,%eax
 590:	0f 84 aa 00 00 00    	je     640 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 596:	83 fa 73             	cmp    $0x73,%edx
 599:	0f 84 e9 00 00 00    	je     688 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59f:	83 fa 63             	cmp    $0x63,%edx
 5a2:	0f 84 2b 01 00 00    	je     6d3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5a8:	83 fa 25             	cmp    $0x25,%edx
 5ab:	0f 84 4f 01 00 00    	je     700 <printf+0x1f0>
  write(fd, &c, 1);
 5b1:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5b4:	83 c3 01             	add    $0x1,%ebx
 5b7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5be:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5bf:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c5:	89 34 24             	mov    %esi,(%esp)
 5c8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5cb:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 5cf:	e8 ae fd ff ff       	call   382 <write>
        putc(fd, c);
 5d4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 5d7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5da:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5e1:	00 
 5e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 5e9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5ec:	e8 91 fd ff ff       	call   382 <write>
  for(i = 0; fmt[i]; i++){
 5f1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5f5:	84 d2                	test   %dl,%dl
 5f7:	0f 85 6d ff ff ff    	jne    56a <printf+0x5a>
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 600:	83 c4 3c             	add    $0x3c,%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    
        state = '%';
 608:	bf 25 00 00 00       	mov    $0x25,%edi
 60d:	e9 49 ff ff ff       	jmp    55b <printf+0x4b>
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 618:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 61f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 624:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 627:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 629:	8b 10                	mov    (%eax),%edx
 62b:	89 f0                	mov    %esi,%eax
 62d:	e8 3e fe ff ff       	call   470 <printint>
        ap++;
 632:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 636:	e9 20 ff ff ff       	jmp    55b <printf+0x4b>
 63b:	90                   	nop
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 640:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 643:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 64a:	00 
 64b:	89 44 24 04          	mov    %eax,0x4(%esp)
 64f:	89 34 24             	mov    %esi,(%esp)
 652:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 656:	e8 27 fd ff ff       	call   382 <write>
 65b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 65e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 665:	00 
 666:	89 44 24 04          	mov    %eax,0x4(%esp)
 66a:	89 34 24             	mov    %esi,(%esp)
 66d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 671:	e8 0c fd ff ff       	call   382 <write>
        printint(fd, *ap, 16, 0);
 676:	b9 10 00 00 00       	mov    $0x10,%ecx
 67b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 682:	eb a0                	jmp    624 <printf+0x114>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 688:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 68b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 68f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 691:	b8 3c 0b 00 00       	mov    $0xb3c,%eax
 696:	85 ff                	test   %edi,%edi
 698:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 69b:	0f b6 07             	movzbl (%edi),%eax
 69e:	84 c0                	test   %al,%al
 6a0:	74 2a                	je     6cc <printf+0x1bc>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6a8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6ab:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 6ae:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 6b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b8:	00 
 6b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bd:	89 34 24             	mov    %esi,(%esp)
 6c0:	e8 bd fc ff ff       	call   382 <write>
        while(*s != 0){
 6c5:	0f b6 07             	movzbl (%edi),%eax
 6c8:	84 c0                	test   %al,%al
 6ca:	75 dc                	jne    6a8 <printf+0x198>
      state = 0;
 6cc:	31 ff                	xor    %edi,%edi
 6ce:	e9 88 fe ff ff       	jmp    55b <printf+0x4b>
        putc(fd, *ap);
 6d3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 6d6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 6d8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6da:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6e1:	00 
 6e2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 6e5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6e8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ef:	e8 8e fc ff ff       	call   382 <write>
        ap++;
 6f4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6f8:	e9 5e fe ff ff       	jmp    55b <printf+0x4b>
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 700:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 703:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 705:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 70c:	00 
 70d:	89 44 24 04          	mov    %eax,0x4(%esp)
 711:	89 34 24             	mov    %esi,(%esp)
 714:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 718:	e8 65 fc ff ff       	call   382 <write>
 71d:	e9 39 fe ff ff       	jmp    55b <printf+0x4b>
 722:	66 90                	xchg   %ax,%ax
 724:	66 90                	xchg   %ax,%ax
 726:	66 90                	xchg   %ax,%ax
 728:	66 90                	xchg   %ax,%ax
 72a:	66 90                	xchg   %ax,%ax
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 cc 0f 00 00       	mov    0xfcc,%eax
{
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 740:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 743:	39 d0                	cmp    %edx,%eax
 745:	72 11                	jb     758 <free+0x28>
 747:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 748:	39 c8                	cmp    %ecx,%eax
 74a:	72 04                	jb     750 <free+0x20>
 74c:	39 ca                	cmp    %ecx,%edx
 74e:	72 10                	jb     760 <free+0x30>
 750:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 752:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 754:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 756:	73 f0                	jae    748 <free+0x18>
 758:	39 ca                	cmp    %ecx,%edx
 75a:	72 04                	jb     760 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75c:	39 c8                	cmp    %ecx,%eax
 75e:	72 f0                	jb     750 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 760:	8b 73 fc             	mov    -0x4(%ebx),%esi
 763:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 766:	39 cf                	cmp    %ecx,%edi
 768:	74 1e                	je     788 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 76a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 76d:	8b 48 04             	mov    0x4(%eax),%ecx
 770:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 773:	39 f2                	cmp    %esi,%edx
 775:	74 28                	je     79f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 777:	89 10                	mov    %edx,(%eax)
  freep = p;
 779:	a3 cc 0f 00 00       	mov    %eax,0xfcc
}
 77e:	5b                   	pop    %ebx
 77f:	5e                   	pop    %esi
 780:	5f                   	pop    %edi
 781:	5d                   	pop    %ebp
 782:	c3                   	ret    
 783:	90                   	nop
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 788:	03 71 04             	add    0x4(%ecx),%esi
 78b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 78e:	8b 08                	mov    (%eax),%ecx
 790:	8b 09                	mov    (%ecx),%ecx
 792:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 795:	8b 48 04             	mov    0x4(%eax),%ecx
 798:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 79b:	39 f2                	cmp    %esi,%edx
 79d:	75 d8                	jne    777 <free+0x47>
    p->s.size += bp->s.size;
 79f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 7a2:	a3 cc 0f 00 00       	mov    %eax,0xfcc
    p->s.size += bp->s.size;
 7a7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7aa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7ad:	89 10                	mov    %edx,(%eax)
}
 7af:	5b                   	pop    %ebx
 7b0:	5e                   	pop    %esi
 7b1:	5f                   	pop    %edi
 7b2:	5d                   	pop    %ebp
 7b3:	c3                   	ret    
 7b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 1d cc 0f 00 00    	mov    0xfcc,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 48 07             	lea    0x7(%eax),%ecx
 7d5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 7d8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7da:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 7dd:	0f 84 9b 00 00 00    	je     87e <malloc+0xbe>
 7e3:	8b 13                	mov    (%ebx),%edx
 7e5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7e8:	39 fe                	cmp    %edi,%esi
 7ea:	76 64                	jbe    850 <malloc+0x90>
 7ec:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 7f3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 7f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7fb:	eb 0e                	jmp    80b <malloc+0x4b>
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 800:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 802:	8b 78 04             	mov    0x4(%eax),%edi
 805:	39 fe                	cmp    %edi,%esi
 807:	76 4f                	jbe    858 <malloc+0x98>
 809:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 80b:	3b 15 cc 0f 00 00    	cmp    0xfcc,%edx
 811:	75 ed                	jne    800 <malloc+0x40>
  if(nu < 4096)
 813:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 816:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 81c:	bf 00 10 00 00       	mov    $0x1000,%edi
 821:	0f 43 fe             	cmovae %esi,%edi
 824:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 827:	89 04 24             	mov    %eax,(%esp)
 82a:	e8 bb fb ff ff       	call   3ea <sbrk>
  if(p == (char*)-1)
 82f:	83 f8 ff             	cmp    $0xffffffff,%eax
 832:	74 18                	je     84c <malloc+0x8c>
  hp->s.size = nu;
 834:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 837:	83 c0 08             	add    $0x8,%eax
 83a:	89 04 24             	mov    %eax,(%esp)
 83d:	e8 ee fe ff ff       	call   730 <free>
  return freep;
 842:	8b 15 cc 0f 00 00    	mov    0xfcc,%edx
      if((p = morecore(nunits)) == 0)
 848:	85 d2                	test   %edx,%edx
 84a:	75 b4                	jne    800 <malloc+0x40>
        return 0;
 84c:	31 c0                	xor    %eax,%eax
 84e:	eb 20                	jmp    870 <malloc+0xb0>
    if(p->s.size >= nunits){
 850:	89 d0                	mov    %edx,%eax
 852:	89 da                	mov    %ebx,%edx
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 858:	39 fe                	cmp    %edi,%esi
 85a:	74 1c                	je     878 <malloc+0xb8>
        p->s.size -= nunits;
 85c:	29 f7                	sub    %esi,%edi
 85e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 861:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 864:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 867:	89 15 cc 0f 00 00    	mov    %edx,0xfcc
      return (void*)(p + 1);
 86d:	83 c0 08             	add    $0x8,%eax
  }
}
 870:	83 c4 1c             	add    $0x1c,%esp
 873:	5b                   	pop    %ebx
 874:	5e                   	pop    %esi
 875:	5f                   	pop    %edi
 876:	5d                   	pop    %ebp
 877:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 878:	8b 08                	mov    (%eax),%ecx
 87a:	89 0a                	mov    %ecx,(%edx)
 87c:	eb e9                	jmp    867 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 87e:	c7 05 cc 0f 00 00 d0 	movl   $0xfd0,0xfcc
 885:	0f 00 00 
    base.s.size = 0;
 888:	ba d0 0f 00 00       	mov    $0xfd0,%edx
    base.s.ptr = freep = prevp = &base;
 88d:	c7 05 d0 0f 00 00 d0 	movl   $0xfd0,0xfd0
 894:	0f 00 00 
    base.s.size = 0;
 897:	c7 05 d4 0f 00 00 00 	movl   $0x0,0xfd4
 89e:	00 00 00 
 8a1:	e9 46 ff ff ff       	jmp    7ec <malloc+0x2c>
 8a6:	66 90                	xchg   %ax,%ax
 8a8:	66 90                	xchg   %ax,%ax
 8aa:	66 90                	xchg   %ax,%ax
 8ac:	66 90                	xchg   %ax,%ax
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
 8b3:	56                   	push   %esi
 8b4:	53                   	push   %ebx
 8b5:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 8b8:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 8bf:	e8 fc fe ff ff       	call   7c0 <malloc>

    if (bt == NULL) {
 8c4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 8c6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 8c8:	74 66                	je     930 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 8ca:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8d1:	e8 ea fe ff ff       	call   7c0 <malloc>
    if (bt->bt_stack == NULL) {
 8d6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 8d8:	89 c3                	mov    %eax,%ebx
 8da:	89 46 08             	mov    %eax,0x8(%esi)
 8dd:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 8e0:	74 5d                	je     93f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 8e2:	25 ff 0f 00 00       	and    $0xfff,%eax
 8e7:	75 37                	jne    920 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 8e9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 8ef:	8b 45 10             	mov    0x10(%ebp),%eax
 8f2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 8fd:	89 04 24             	mov    %eax,(%esp)
 900:	e8 25 fb ff ff       	call   42a <kthread_create>
    if (bt->bid != 0) {
 905:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 907:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 909:	74 2d                	je     938 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 90b:	8b 45 08             	mov    0x8(%ebp),%eax
 90e:	89 30                	mov    %esi,(%eax)
        result = 0;
 910:	31 c0                	xor    %eax,%eax
}
 912:	83 c4 10             	add    $0x10,%esp
 915:	5b                   	pop    %ebx
 916:	5e                   	pop    %esi
 917:	5d                   	pop    %ebp
 918:	c3                   	ret    
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 920:	29 c3                	sub    %eax,%ebx
 922:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 928:	89 5e 04             	mov    %ebx,0x4(%esi)
 92b:	eb bc                	jmp    8e9 <benny_thread_create+0x39>
 92d:	8d 76 00             	lea    0x0(%esi),%esi
 930:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 936:	eb b7                	jmp    8ef <benny_thread_create+0x3f>
    int result = -1;
 938:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 93d:	eb d3                	jmp    912 <benny_thread_create+0x62>
        free(bt);
 93f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 942:	31 f6                	xor    %esi,%esi
        free(bt);
 944:	e8 e7 fd ff ff       	call   730 <free>
 949:	8b 5b 04             	mov    0x4(%ebx),%ebx
 94c:	eb a1                	jmp    8ef <benny_thread_create+0x3f>
 94e:	66 90                	xchg   %ax,%ax

00000950 <benny_thread_bid>:
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 953:	8b 45 08             	mov    0x8(%ebp),%eax
}
 956:	5d                   	pop    %ebp
    return bt->bid;
 957:	8b 00                	mov    (%eax),%eax
}
 959:	c3                   	ret    
 95a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000960 <benny_thread_join>:
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	53                   	push   %ebx
 964:	83 ec 14             	sub    $0x14,%esp
 967:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 96a:	8b 03                	mov    (%ebx),%eax
 96c:	89 04 24             	mov    %eax,(%esp)
 96f:	e8 be fa ff ff       	call   432 <kthread_join>
    if (retVal == 0) {
 974:	85 c0                	test   %eax,%eax
 976:	75 27                	jne    99f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 978:	8b 53 08             	mov    0x8(%ebx),%edx
 97b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 97e:	89 14 24             	mov    %edx,(%esp)
 981:	e8 aa fd ff ff       	call   730 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 986:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 98d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 994:	89 1c 24             	mov    %ebx,(%esp)
 997:	e8 94 fd ff ff       	call   730 <free>
 99c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 99f:	83 c4 14             	add    $0x14,%esp
 9a2:	5b                   	pop    %ebx
 9a3:	5d                   	pop    %ebp
 9a4:	c3                   	ret    
 9a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <benny_thread_exit>:
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
}
 9b3:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 9b4:	e9 81 fa ff ff       	jmp    43a <kthread_exit>
 9b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009c0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 9c6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 9cc:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 9d3:	31 c0                	xor    %eax,%eax
 9d5:	5d                   	pop    %ebp
 9d6:	c3                   	ret    
 9d7:	89 f6                	mov    %esi,%esi
 9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009e0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 9e0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 9e1:	b8 01 00 00 00       	mov    $0x1,%eax
 9e6:	89 e5                	mov    %esp,%ebp
 9e8:	56                   	push   %esi
 9e9:	53                   	push   %ebx
 9ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9ed:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 9f0:	85 c0                	test   %eax,%eax
 9f2:	be 01 00 00 00       	mov    $0x1,%esi
 9f7:	74 15                	je     a0e <benny_mootex_yieldlock+0x2e>
 9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 a00:	e8 45 fa ff ff       	call   44a <kthread_yield>
 a05:	89 f0                	mov    %esi,%eax
 a07:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a0a:	85 c0                	test   %eax,%eax
 a0c:	75 f2                	jne    a00 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 a0e:	e8 2f fa ff ff       	call   442 <kthread_self>
    benny_mootex->bid = benny_self();
 a13:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a16:	31 c0                	xor    %eax,%eax
 a18:	5b                   	pop    %ebx
 a19:	5e                   	pop    %esi
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    
 a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <benny_mootex_spinlock>:
{
 a20:	55                   	push   %ebp
 a21:	ba 01 00 00 00       	mov    $0x1,%edx
 a26:	89 e5                	mov    %esp,%ebp
 a28:	53                   	push   %ebx
 a29:	83 ec 04             	sub    $0x4,%esp
 a2c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a2f:	90                   	nop
 a30:	89 d0                	mov    %edx,%eax
 a32:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a35:	85 c0                	test   %eax,%eax
 a37:	75 f7                	jne    a30 <benny_mootex_spinlock+0x10>
    return kthread_self();
 a39:	e8 04 fa ff ff       	call   442 <kthread_self>
    benny_mootex->bid = benny_self();
 a3e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a41:	83 c4 04             	add    $0x4,%esp
 a44:	31 c0                	xor    %eax,%eax
 a46:	5b                   	pop    %ebx
 a47:	5d                   	pop    %ebp
 a48:	c3                   	ret    
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a50 <benny_mootex_unlock>:
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	53                   	push   %ebx
 a54:	83 ec 04             	sub    $0x4,%esp
 a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 a5a:	e8 e3 f9 ff ff       	call   442 <kthread_self>
    if(tid == benny_mootex->bid){
 a5f:	39 43 04             	cmp    %eax,0x4(%ebx)
 a62:	75 1c                	jne    a80 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 a64:	0f ae f0             	mfence 
    return 0;
 a67:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 a69:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 a70:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 a76:	83 c4 04             	add    $0x4,%esp
 a79:	5b                   	pop    %ebx
 a7a:	5d                   	pop    %ebp
 a7b:	c3                   	ret    
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a80:	83 c4 04             	add    $0x4,%esp
      return -1;
 a83:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a88:	5b                   	pop    %ebx
 a89:	5d                   	pop    %ebp
 a8a:	c3                   	ret    
 a8b:	90                   	nop
 a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a90 <benny_mootex_trylock>:
{
 a90:	55                   	push   %ebp
 a91:	b8 01 00 00 00       	mov    $0x1,%eax
 a96:	89 e5                	mov    %esp,%ebp
 a98:	53                   	push   %ebx
 a99:	83 ec 04             	sub    $0x4,%esp
 a9c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a9f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 aa2:	85 c0                	test   %eax,%eax
 aa4:	75 08                	jne    aae <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 aa6:	e8 97 f9 ff ff       	call   442 <kthread_self>
        benny_mootex->bid = tid;
 aab:	89 43 04             	mov    %eax,0x4(%ebx)
}
 aae:	83 c4 04             	add    $0x4,%esp
 ab1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ab6:	5b                   	pop    %ebx
 ab7:	5d                   	pop    %ebp
 ab8:	c3                   	ret    
 ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ac0 <benny_mootex_wholock>:
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 ac3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ac6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 ac7:	8b 40 04             	mov    0x4(%eax),%eax
}
 aca:	c3                   	ret    
 acb:	90                   	nop
 acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <benny_mootex_islocked>:
{
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 ad3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ad6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 ad7:	8b 00                	mov    (%eax),%eax
}
 ad9:	c3                   	ret    
 ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ae0 <benny_self>:
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
}
 ae3:	5d                   	pop    %ebp
    return kthread_self();
 ae4:	e9 59 f9 ff ff       	jmp    442 <kthread_self>
 ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000af0 <benny_yield>:
{
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
    
}
 af3:	5d                   	pop    %ebp
    return kthread_yield();
 af4:	e9 51 f9 ff ff       	jmp    44a <kthread_yield>
 af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b00 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 b03:	5d                   	pop    %ebp
    return kthread_cpu_count();
 b04:	e9 49 f9 ff ff       	jmp    452 <kthread_cpu_count>
 b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b10 <benny_thread_count>:

int
benny_thread_count(void)
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 b13:	5d                   	pop    %ebp
    return kthread_thread_count();
 b14:	e9 41 f9 ff ff       	jmp    45a <kthread_thread_count>
