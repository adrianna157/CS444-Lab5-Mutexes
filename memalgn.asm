
_memalgn:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
# define PGSIZE 4096
#endif // PGSIZE

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 e4 f0             	and    $0xfffffff0,%esp
   8:	83 ec 10             	sub    $0x10,%esp
    void *ptr = NULL;

    ptr = malloc(50);
   b:	c7 04 24 32 00 00 00 	movl   $0x32,(%esp)
  12:	e8 09 07 00 00       	call   720 <malloc>
    ptr = malloc(PGSIZE * 2);
  17:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
  1e:	e8 fd 06 00 00       	call   720 <malloc>
    printf(1, "%p ptr\n", ptr);
  23:	c7 44 24 04 79 0a 00 	movl   $0xa79,0x4(%esp)
  2a:	00 
  2b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    ptr = malloc(PGSIZE * 2);
  32:	89 c3                	mov    %eax,%ebx
    printf(1, "%u pg offset ptr\n", ((unsigned long) ptr) % PGSIZE);
  34:	89 de                	mov    %ebx,%esi
  36:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
    printf(1, "%p ptr\n", ptr);
  3c:	89 44 24 08          	mov    %eax,0x8(%esp)

    ptr += (PGSIZE - ((unsigned long) ptr) % PGSIZE);
  40:	29 f3                	sub    %esi,%ebx
    printf(1, "%p ptr\n", ptr);
  42:	e8 29 04 00 00       	call   470 <printf>
    ptr += (PGSIZE - ((unsigned long) ptr) % PGSIZE);
  47:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    printf(1, "%u pg offset ptr\n", ((unsigned long) ptr) % PGSIZE);
  4d:	89 74 24 08          	mov    %esi,0x8(%esp)
  51:	c7 44 24 04 81 0a 00 	movl   $0xa81,0x4(%esp)
  58:	00 
  59:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  60:	e8 0b 04 00 00       	call   470 <printf>
    printf(1, "%p ptr\n", ptr);
  65:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    printf(1, "%u pg offset ptr\n", ((unsigned long) ptr) % PGSIZE);
  69:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
    printf(1, "%p ptr\n", ptr);
  6f:	c7 44 24 04 79 0a 00 	movl   $0xa79,0x4(%esp)
  76:	00 
  77:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7e:	e8 ed 03 00 00       	call   470 <printf>
    printf(1, "%u pg offset ptr\n", ((unsigned long) ptr) % PGSIZE);
  83:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  87:	c7 44 24 04 81 0a 00 	movl   $0xa81,0x4(%esp)
  8e:	00 
  8f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  96:	e8 d5 03 00 00       	call   470 <printf>

    exit();
  9b:	e8 22 02 00 00       	call   2c2 <exit>

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  a9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 55 08             	mov    0x8(%ebp),%edx
  d6:	53                   	push   %ebx
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  da:	0f b6 02             	movzbl (%edx),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 2d                	je     10e <strcmp+0x3e>
  e1:	0f b6 19             	movzbl (%ecx),%ebx
  e4:	38 d8                	cmp    %bl,%al
  e6:	74 0e                	je     f6 <strcmp+0x26>
  e8:	eb 2b                	jmp    115 <strcmp+0x45>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f0:	38 c8                	cmp    %cl,%al
  f2:	75 15                	jne    109 <strcmp+0x39>
    p++, q++;
  f4:	89 d9                	mov    %ebx,%ecx
  f6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  f9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  fc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  ff:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 103:	84 c0                	test   %al,%al
 105:	75 e9                	jne    f0 <strcmp+0x20>
 107:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 109:	29 c8                	sub    %ecx,%eax
}
 10b:	5b                   	pop    %ebx
 10c:	5d                   	pop    %ebp
 10d:	c3                   	ret    
 10e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 111:	31 c0                	xor    %eax,%eax
 113:	eb f4                	jmp    109 <strcmp+0x39>
 115:	0f b6 cb             	movzbl %bl,%ecx
 118:	eb ef                	jmp    109 <strcmp+0x39>
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000120 <strlen>:

uint
strlen(const char *s)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 126:	80 39 00             	cmpb   $0x0,(%ecx)
 129:	74 12                	je     13d <strlen+0x1d>
 12b:	31 d2                	xor    %edx,%edx
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	83 c2 01             	add    $0x1,%edx
 133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 137:	89 d0                	mov    %edx,%eax
 139:	75 f5                	jne    130 <strlen+0x10>
    ;
  return n;
}
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 13d:	31 c0                	xor    %eax,%eax
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <memset>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <memset>:

void*
memset(void *dst, int c, uint n)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
 156:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld    
 160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 162:	89 d0                	mov    %edx,%eax
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	53                   	push   %ebx
 177:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 17a:	0f b6 18             	movzbl (%eax),%ebx
 17d:	84 db                	test   %bl,%bl
 17f:	74 1d                	je     19e <strchr+0x2e>
    if(*s == c)
 181:	38 d3                	cmp    %dl,%bl
 183:	89 d1                	mov    %edx,%ecx
 185:	75 0d                	jne    194 <strchr+0x24>
 187:	eb 17                	jmp    1a0 <strchr+0x30>
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	38 ca                	cmp    %cl,%dl
 192:	74 0c                	je     1a0 <strchr+0x30>
  for(; *s; s++)
 194:	83 c0 01             	add    $0x1,%eax
 197:	0f b6 10             	movzbl (%eax),%edx
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strchr+0x20>
      return (char*)s;
  return 0;
 19e:	31 c0                	xor    %eax,%eax
}
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b5:	31 f6                	xor    %esi,%esi
{
 1b7:	53                   	push   %ebx
 1b8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 1bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1be:	eb 31                	jmp    1f1 <gets+0x41>
    cc = read(0, &c, 1);
 1c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1c7:	00 
 1c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1d3:	e8 02 01 00 00       	call   2da <read>
    if(cc < 1)
 1d8:	85 c0                	test   %eax,%eax
 1da:	7e 1d                	jle    1f9 <gets+0x49>
      break;
    buf[i++] = c;
 1dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 1e0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 1e2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1e5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 1e7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1eb:	74 0c                	je     1f9 <gets+0x49>
 1ed:	3c 0a                	cmp    $0xa,%al
 1ef:	74 08                	je     1f9 <gets+0x49>
  for(i=0; i+1 < max; ){
 1f1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1f7:	7c c7                	jl     1c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 200:	83 c4 2c             	add    $0x2c,%esp
 203:	5b                   	pop    %ebx
 204:	5e                   	pop    %esi
 205:	5f                   	pop    %edi
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
 208:	90                   	nop
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 222:	00 
 223:	89 04 24             	mov    %eax,(%esp)
 226:	e8 d7 00 00 00       	call   302 <open>
  if(fd < 0)
 22b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 22d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 22f:	78 27                	js     258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 231:	8b 45 0c             	mov    0xc(%ebp),%eax
 234:	89 1c 24             	mov    %ebx,(%esp)
 237:	89 44 24 04          	mov    %eax,0x4(%esp)
 23b:	e8 da 00 00 00       	call   31a <fstat>
  close(fd);
 240:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 243:	89 c6                	mov    %eax,%esi
  close(fd);
 245:	e8 a0 00 00 00       	call   2ea <close>
  return r;
 24a:	89 f0                	mov    %esi,%eax
}
 24c:	83 c4 10             	add    $0x10,%esp
 24f:	5b                   	pop    %ebx
 250:	5e                   	pop    %esi
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	90                   	nop
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 258:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 25d:	eb ed                	jmp    24c <stat+0x3c>
 25f:	90                   	nop

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 4d 08             	mov    0x8(%ebp),%ecx
 266:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 11             	movsbl (%ecx),%edx
 26a:	8d 42 d0             	lea    -0x30(%edx),%eax
 26d:	3c 09                	cmp    $0x9,%al
  n = 0;
 26f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 274:	77 17                	ja     28d <atoi+0x2d>
 276:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 278:	83 c1 01             	add    $0x1,%ecx
 27b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 27e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 282:	0f be 11             	movsbl (%ecx),%edx
 285:	8d 5a d0             	lea    -0x30(%edx),%ebx
 288:	80 fb 09             	cmp    $0x9,%bl
 28b:	76 eb                	jbe    278 <atoi+0x18>
  return n;
}
 28d:	5b                   	pop    %ebx
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 291:	31 d2                	xor    %edx,%edx
{
 293:	89 e5                	mov    %esp,%ebp
 295:	56                   	push   %esi
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	53                   	push   %ebx
 29a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 29d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 2a0:	85 db                	test   %ebx,%ebx
 2a2:	7e 12                	jle    2b6 <memmove+0x26>
 2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2b2:	39 da                	cmp    %ebx,%edx
 2b4:	75 f2                	jne    2a8 <memmove+0x18>
  return vdst;
}
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    

000002ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ba:	b8 01 00 00 00       	mov    $0x1,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <exit>:
SYSCALL(exit)
 2c2:	b8 02 00 00 00       	mov    $0x2,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <wait>:
SYSCALL(wait)
 2ca:	b8 03 00 00 00       	mov    $0x3,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <pipe>:
SYSCALL(pipe)
 2d2:	b8 04 00 00 00       	mov    $0x4,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <read>:
SYSCALL(read)
 2da:	b8 05 00 00 00       	mov    $0x5,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <write>:
SYSCALL(write)
 2e2:	b8 10 00 00 00       	mov    $0x10,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <close>:
SYSCALL(close)
 2ea:	b8 15 00 00 00       	mov    $0x15,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <kill>:
SYSCALL(kill)
 2f2:	b8 06 00 00 00       	mov    $0x6,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <exec>:
SYSCALL(exec)
 2fa:	b8 07 00 00 00       	mov    $0x7,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <open>:
SYSCALL(open)
 302:	b8 0f 00 00 00       	mov    $0xf,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <mknod>:
SYSCALL(mknod)
 30a:	b8 11 00 00 00       	mov    $0x11,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <unlink>:
SYSCALL(unlink)
 312:	b8 12 00 00 00       	mov    $0x12,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <fstat>:
SYSCALL(fstat)
 31a:	b8 08 00 00 00       	mov    $0x8,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <link>:
SYSCALL(link)
 322:	b8 13 00 00 00       	mov    $0x13,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <mkdir>:
SYSCALL(mkdir)
 32a:	b8 14 00 00 00       	mov    $0x14,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <chdir>:
SYSCALL(chdir)
 332:	b8 09 00 00 00       	mov    $0x9,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <dup>:
SYSCALL(dup)
 33a:	b8 0a 00 00 00       	mov    $0xa,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <getpid>:
SYSCALL(getpid)
 342:	b8 0b 00 00 00       	mov    $0xb,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <sbrk>:
SYSCALL(sbrk)
 34a:	b8 0c 00 00 00       	mov    $0xc,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <sleep>:
SYSCALL(sleep)
 352:	b8 0d 00 00 00       	mov    $0xd,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <uptime>:
SYSCALL(uptime)
 35a:	b8 0e 00 00 00       	mov    $0xe,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 362:	b8 16 00 00 00       	mov    $0x16,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 36a:	b8 17 00 00 00       	mov    $0x17,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 372:	b8 18 00 00 00       	mov    $0x18,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 37a:	b8 19 00 00 00       	mov    $0x19,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 382:	b8 1a 00 00 00       	mov    $0x1a,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 38a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <kthread_join>:
SYSCALL(kthread_join)
 392:	b8 1c 00 00 00       	mov    $0x1c,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <kthread_exit>:
SYSCALL(kthread_exit)
 39a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 3a2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <kthread_yield>:
SYSCALL(kthread_yield)
 3aa:	b8 1f 00 00 00       	mov    $0x1f,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 3b2:	b8 20 00 00 00       	mov    $0x20,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 3ba:	b8 21 00 00 00       	mov    $0x21,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    
 3c2:	66 90                	xchg   %ax,%ax
 3c4:	66 90                	xchg   %ax,%ax
 3c6:	66 90                	xchg   %ax,%ax
 3c8:	66 90                	xchg   %ax,%ax
 3ca:	66 90                	xchg   %ax,%ax
 3cc:	66 90                	xchg   %ax,%ax
 3ce:	66 90                	xchg   %ax,%ax

000003d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	89 c6                	mov    %eax,%esi
 3d7:	53                   	push   %ebx
 3d8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3de:	85 db                	test   %ebx,%ebx
 3e0:	74 09                	je     3eb <printint+0x1b>
 3e2:	89 d0                	mov    %edx,%eax
 3e4:	c1 e8 1f             	shr    $0x1f,%eax
 3e7:	84 c0                	test   %al,%al
 3e9:	75 75                	jne    460 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3eb:	89 d0                	mov    %edx,%eax
  neg = 0;
 3ed:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3f4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 3f7:	31 ff                	xor    %edi,%edi
 3f9:	89 ce                	mov    %ecx,%esi
 3fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3fe:	eb 02                	jmp    402 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 400:	89 cf                	mov    %ecx,%edi
 402:	31 d2                	xor    %edx,%edx
 404:	f7 f6                	div    %esi
 406:	8d 4f 01             	lea    0x1(%edi),%ecx
 409:	0f b6 92 9a 0a 00 00 	movzbl 0xa9a(%edx),%edx
  }while((x /= base) != 0);
 410:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 412:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 415:	75 e9                	jne    400 <printint+0x30>
  if(neg)
 417:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 41a:	89 c8                	mov    %ecx,%eax
 41c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 41f:	85 d2                	test   %edx,%edx
 421:	74 08                	je     42b <printint+0x5b>
    buf[i++] = '-';
 423:	8d 4f 02             	lea    0x2(%edi),%ecx
 426:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 42b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 42e:	66 90                	xchg   %ax,%ax
 430:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 435:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 438:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 43f:	00 
 440:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 444:	89 34 24             	mov    %esi,(%esp)
 447:	88 45 d7             	mov    %al,-0x29(%ebp)
 44a:	e8 93 fe ff ff       	call   2e2 <write>
  while(--i >= 0)
 44f:	83 ff ff             	cmp    $0xffffffff,%edi
 452:	75 dc                	jne    430 <printint+0x60>
    putc(fd, buf[i]);
}
 454:	83 c4 4c             	add    $0x4c,%esp
 457:	5b                   	pop    %ebx
 458:	5e                   	pop    %esi
 459:	5f                   	pop    %edi
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 460:	89 d0                	mov    %edx,%eax
 462:	f7 d8                	neg    %eax
    neg = 1;
 464:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 46b:	eb 87                	jmp    3f4 <printint+0x24>
 46d:	8d 76 00             	lea    0x0(%esi),%esi

00000470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 474:	31 ff                	xor    %edi,%edi
{
 476:	56                   	push   %esi
 477:	53                   	push   %ebx
 478:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 47b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 47e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 481:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 484:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 487:	0f b6 13             	movzbl (%ebx),%edx
 48a:	83 c3 01             	add    $0x1,%ebx
 48d:	84 d2                	test   %dl,%dl
 48f:	75 39                	jne    4ca <printf+0x5a>
 491:	e9 ca 00 00 00       	jmp    560 <printf+0xf0>
 496:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 498:	83 fa 25             	cmp    $0x25,%edx
 49b:	0f 84 c7 00 00 00    	je     568 <printf+0xf8>
  write(fd, &c, 1);
 4a1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 4a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ab:	00 
 4ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 4b3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 4b6:	e8 27 fe ff ff       	call   2e2 <write>
 4bb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 4be:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4c2:	84 d2                	test   %dl,%dl
 4c4:	0f 84 96 00 00 00    	je     560 <printf+0xf0>
    if(state == 0){
 4ca:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 4cc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 4cf:	74 c7                	je     498 <printf+0x28>
      }
    } else if(state == '%'){
 4d1:	83 ff 25             	cmp    $0x25,%edi
 4d4:	75 e5                	jne    4bb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 4d6:	83 fa 75             	cmp    $0x75,%edx
 4d9:	0f 84 99 00 00 00    	je     578 <printf+0x108>
 4df:	83 fa 64             	cmp    $0x64,%edx
 4e2:	0f 84 90 00 00 00    	je     578 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4e8:	25 f7 00 00 00       	and    $0xf7,%eax
 4ed:	83 f8 70             	cmp    $0x70,%eax
 4f0:	0f 84 aa 00 00 00    	je     5a0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4f6:	83 fa 73             	cmp    $0x73,%edx
 4f9:	0f 84 e9 00 00 00    	je     5e8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4ff:	83 fa 63             	cmp    $0x63,%edx
 502:	0f 84 2b 01 00 00    	je     633 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 508:	83 fa 25             	cmp    $0x25,%edx
 50b:	0f 84 4f 01 00 00    	je     660 <printf+0x1f0>
  write(fd, &c, 1);
 511:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 514:	83 c3 01             	add    $0x1,%ebx
 517:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 51f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 521:	89 44 24 04          	mov    %eax,0x4(%esp)
 525:	89 34 24             	mov    %esi,(%esp)
 528:	89 55 d0             	mov    %edx,-0x30(%ebp)
 52b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 52f:	e8 ae fd ff ff       	call   2e2 <write>
        putc(fd, c);
 534:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 537:	8d 45 e7             	lea    -0x19(%ebp),%eax
 53a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 541:	00 
 542:	89 44 24 04          	mov    %eax,0x4(%esp)
 546:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 549:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 54c:	e8 91 fd ff ff       	call   2e2 <write>
  for(i = 0; fmt[i]; i++){
 551:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 555:	84 d2                	test   %dl,%dl
 557:	0f 85 6d ff ff ff    	jne    4ca <printf+0x5a>
 55d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 560:	83 c4 3c             	add    $0x3c,%esp
 563:	5b                   	pop    %ebx
 564:	5e                   	pop    %esi
 565:	5f                   	pop    %edi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    
        state = '%';
 568:	bf 25 00 00 00       	mov    $0x25,%edi
 56d:	e9 49 ff ff ff       	jmp    4bb <printf+0x4b>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 578:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 57f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 584:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 587:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 589:	8b 10                	mov    (%eax),%edx
 58b:	89 f0                	mov    %esi,%eax
 58d:	e8 3e fe ff ff       	call   3d0 <printint>
        ap++;
 592:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 596:	e9 20 ff ff ff       	jmp    4bb <printf+0x4b>
 59b:	90                   	nop
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5a0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 5a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5aa:	00 
 5ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 5af:	89 34 24             	mov    %esi,(%esp)
 5b2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 5b6:	e8 27 fd ff ff       	call   2e2 <write>
 5bb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 5be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c5:	00 
 5c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ca:	89 34 24             	mov    %esi,(%esp)
 5cd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 5d1:	e8 0c fd ff ff       	call   2e2 <write>
        printint(fd, *ap, 16, 0);
 5d6:	b9 10 00 00 00       	mov    $0x10,%ecx
 5db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5e2:	eb a0                	jmp    584 <printf+0x114>
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 5eb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 5ef:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 5f1:	b8 93 0a 00 00       	mov    $0xa93,%eax
 5f6:	85 ff                	test   %edi,%edi
 5f8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 5fb:	0f b6 07             	movzbl (%edi),%eax
 5fe:	84 c0                	test   %al,%al
 600:	74 2a                	je     62c <printf+0x1bc>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 608:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 60b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 60e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 611:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 618:	00 
 619:	89 44 24 04          	mov    %eax,0x4(%esp)
 61d:	89 34 24             	mov    %esi,(%esp)
 620:	e8 bd fc ff ff       	call   2e2 <write>
        while(*s != 0){
 625:	0f b6 07             	movzbl (%edi),%eax
 628:	84 c0                	test   %al,%al
 62a:	75 dc                	jne    608 <printf+0x198>
      state = 0;
 62c:	31 ff                	xor    %edi,%edi
 62e:	e9 88 fe ff ff       	jmp    4bb <printf+0x4b>
        putc(fd, *ap);
 633:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 636:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 638:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 63a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 641:	00 
 642:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 645:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 648:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 64b:	89 44 24 04          	mov    %eax,0x4(%esp)
 64f:	e8 8e fc ff ff       	call   2e2 <write>
        ap++;
 654:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 658:	e9 5e fe ff ff       	jmp    4bb <printf+0x4b>
 65d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 660:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 663:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 665:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 66c:	00 
 66d:	89 44 24 04          	mov    %eax,0x4(%esp)
 671:	89 34 24             	mov    %esi,(%esp)
 674:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 678:	e8 65 fc ff ff       	call   2e2 <write>
 67d:	e9 39 fe ff ff       	jmp    4bb <printf+0x4b>
 682:	66 90                	xchg   %ax,%ax
 684:	66 90                	xchg   %ax,%ax
 686:	66 90                	xchg   %ax,%ax
 688:	66 90                	xchg   %ax,%ax
 68a:	66 90                	xchg   %ax,%ax
 68c:	66 90                	xchg   %ax,%ax
 68e:	66 90                	xchg   %ax,%ax

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	a1 24 0f 00 00       	mov    0xf24,%eax
{
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 69e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 6a0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a3:	39 d0                	cmp    %edx,%eax
 6a5:	72 11                	jb     6b8 <free+0x28>
 6a7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a8:	39 c8                	cmp    %ecx,%eax
 6aa:	72 04                	jb     6b0 <free+0x20>
 6ac:	39 ca                	cmp    %ecx,%edx
 6ae:	72 10                	jb     6c0 <free+0x30>
 6b0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b6:	73 f0                	jae    6a8 <free+0x18>
 6b8:	39 ca                	cmp    %ecx,%edx
 6ba:	72 04                	jb     6c0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6bc:	39 c8                	cmp    %ecx,%eax
 6be:	72 f0                	jb     6b0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6c3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 6c6:	39 cf                	cmp    %ecx,%edi
 6c8:	74 1e                	je     6e8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6ca:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cd:	8b 48 04             	mov    0x4(%eax),%ecx
 6d0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6d3:	39 f2                	cmp    %esi,%edx
 6d5:	74 28                	je     6ff <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6d7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6d9:	a3 24 0f 00 00       	mov    %eax,0xf24
}
 6de:	5b                   	pop    %ebx
 6df:	5e                   	pop    %esi
 6e0:	5f                   	pop    %edi
 6e1:	5d                   	pop    %ebp
 6e2:	c3                   	ret    
 6e3:	90                   	nop
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6e8:	03 71 04             	add    0x4(%ecx),%esi
 6eb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ee:	8b 08                	mov    (%eax),%ecx
 6f0:	8b 09                	mov    (%ecx),%ecx
 6f2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f5:	8b 48 04             	mov    0x4(%eax),%ecx
 6f8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 6fb:	39 f2                	cmp    %esi,%edx
 6fd:	75 d8                	jne    6d7 <free+0x47>
    p->s.size += bp->s.size;
 6ff:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 702:	a3 24 0f 00 00       	mov    %eax,0xf24
    p->s.size += bp->s.size;
 707:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 70a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 70d:	89 10                	mov    %edx,(%eax)
}
 70f:	5b                   	pop    %ebx
 710:	5e                   	pop    %esi
 711:	5f                   	pop    %edi
 712:	5d                   	pop    %ebp
 713:	c3                   	ret    
 714:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 71a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 72c:	8b 1d 24 0f 00 00    	mov    0xf24,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 732:	8d 48 07             	lea    0x7(%eax),%ecx
 735:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 738:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 73d:	0f 84 9b 00 00 00    	je     7de <malloc+0xbe>
 743:	8b 13                	mov    (%ebx),%edx
 745:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 748:	39 fe                	cmp    %edi,%esi
 74a:	76 64                	jbe    7b0 <malloc+0x90>
 74c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 753:	bb 00 80 00 00       	mov    $0x8000,%ebx
 758:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 75b:	eb 0e                	jmp    76b <malloc+0x4b>
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 760:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 762:	8b 78 04             	mov    0x4(%eax),%edi
 765:	39 fe                	cmp    %edi,%esi
 767:	76 4f                	jbe    7b8 <malloc+0x98>
 769:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 76b:	3b 15 24 0f 00 00    	cmp    0xf24,%edx
 771:	75 ed                	jne    760 <malloc+0x40>
  if(nu < 4096)
 773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 776:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 77c:	bf 00 10 00 00       	mov    $0x1000,%edi
 781:	0f 43 fe             	cmovae %esi,%edi
 784:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 787:	89 04 24             	mov    %eax,(%esp)
 78a:	e8 bb fb ff ff       	call   34a <sbrk>
  if(p == (char*)-1)
 78f:	83 f8 ff             	cmp    $0xffffffff,%eax
 792:	74 18                	je     7ac <malloc+0x8c>
  hp->s.size = nu;
 794:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 797:	83 c0 08             	add    $0x8,%eax
 79a:	89 04 24             	mov    %eax,(%esp)
 79d:	e8 ee fe ff ff       	call   690 <free>
  return freep;
 7a2:	8b 15 24 0f 00 00    	mov    0xf24,%edx
      if((p = morecore(nunits)) == 0)
 7a8:	85 d2                	test   %edx,%edx
 7aa:	75 b4                	jne    760 <malloc+0x40>
        return 0;
 7ac:	31 c0                	xor    %eax,%eax
 7ae:	eb 20                	jmp    7d0 <malloc+0xb0>
    if(p->s.size >= nunits){
 7b0:	89 d0                	mov    %edx,%eax
 7b2:	89 da                	mov    %ebx,%edx
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7b8:	39 fe                	cmp    %edi,%esi
 7ba:	74 1c                	je     7d8 <malloc+0xb8>
        p->s.size -= nunits;
 7bc:	29 f7                	sub    %esi,%edi
 7be:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 7c1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 7c4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7c7:	89 15 24 0f 00 00    	mov    %edx,0xf24
      return (void*)(p + 1);
 7cd:	83 c0 08             	add    $0x8,%eax
  }
}
 7d0:	83 c4 1c             	add    $0x1c,%esp
 7d3:	5b                   	pop    %ebx
 7d4:	5e                   	pop    %esi
 7d5:	5f                   	pop    %edi
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7d8:	8b 08                	mov    (%eax),%ecx
 7da:	89 0a                	mov    %ecx,(%edx)
 7dc:	eb e9                	jmp    7c7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 7de:	c7 05 24 0f 00 00 28 	movl   $0xf28,0xf24
 7e5:	0f 00 00 
    base.s.size = 0;
 7e8:	ba 28 0f 00 00       	mov    $0xf28,%edx
    base.s.ptr = freep = prevp = &base;
 7ed:	c7 05 28 0f 00 00 28 	movl   $0xf28,0xf28
 7f4:	0f 00 00 
    base.s.size = 0;
 7f7:	c7 05 2c 0f 00 00 00 	movl   $0x0,0xf2c
 7fe:	00 00 00 
 801:	e9 46 ff ff ff       	jmp    74c <malloc+0x2c>
 806:	66 90                	xchg   %ax,%ax
 808:	66 90                	xchg   %ax,%ax
 80a:	66 90                	xchg   %ax,%ax
 80c:	66 90                	xchg   %ax,%ax
 80e:	66 90                	xchg   %ax,%ax

00000810 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	56                   	push   %esi
 814:	53                   	push   %ebx
 815:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 818:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 81f:	e8 fc fe ff ff       	call   720 <malloc>

    if (bt == NULL) {
 824:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 826:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 828:	74 66                	je     890 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 82a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 831:	e8 ea fe ff ff       	call   720 <malloc>
    if (bt->bt_stack == NULL) {
 836:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 838:	89 c3                	mov    %eax,%ebx
 83a:	89 46 08             	mov    %eax,0x8(%esi)
 83d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 840:	74 5d                	je     89f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 842:	25 ff 0f 00 00       	and    $0xfff,%eax
 847:	75 37                	jne    880 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 849:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 84f:	8b 45 10             	mov    0x10(%ebp),%eax
 852:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 856:	89 44 24 04          	mov    %eax,0x4(%esp)
 85a:	8b 45 0c             	mov    0xc(%ebp),%eax
 85d:	89 04 24             	mov    %eax,(%esp)
 860:	e8 25 fb ff ff       	call   38a <kthread_create>
    if (bt->bid != 0) {
 865:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 867:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 869:	74 2d                	je     898 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	89 30                	mov    %esi,(%eax)
        result = 0;
 870:	31 c0                	xor    %eax,%eax
}
 872:	83 c4 10             	add    $0x10,%esp
 875:	5b                   	pop    %ebx
 876:	5e                   	pop    %esi
 877:	5d                   	pop    %ebp
 878:	c3                   	ret    
 879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 880:	29 c3                	sub    %eax,%ebx
 882:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 888:	89 5e 04             	mov    %ebx,0x4(%esi)
 88b:	eb bc                	jmp    849 <benny_thread_create+0x39>
 88d:	8d 76 00             	lea    0x0(%esi),%esi
 890:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 896:	eb b7                	jmp    84f <benny_thread_create+0x3f>
    int result = -1;
 898:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 89d:	eb d3                	jmp    872 <benny_thread_create+0x62>
        free(bt);
 89f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 8a2:	31 f6                	xor    %esi,%esi
        free(bt);
 8a4:	e8 e7 fd ff ff       	call   690 <free>
 8a9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 8ac:	eb a1                	jmp    84f <benny_thread_create+0x3f>
 8ae:	66 90                	xchg   %ax,%ax

000008b0 <benny_thread_bid>:
{
 8b0:	55                   	push   %ebp
 8b1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8b6:	5d                   	pop    %ebp
    return bt->bid;
 8b7:	8b 00                	mov    (%eax),%eax
}
 8b9:	c3                   	ret    
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008c0 <benny_thread_join>:
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	53                   	push   %ebx
 8c4:	83 ec 14             	sub    $0x14,%esp
 8c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 8ca:	8b 03                	mov    (%ebx),%eax
 8cc:	89 04 24             	mov    %eax,(%esp)
 8cf:	e8 be fa ff ff       	call   392 <kthread_join>
    if (retVal == 0) {
 8d4:	85 c0                	test   %eax,%eax
 8d6:	75 27                	jne    8ff <benny_thread_join+0x3f>
        free(bt->mem_stack);
 8d8:	8b 53 08             	mov    0x8(%ebx),%edx
 8db:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8de:	89 14 24             	mov    %edx,(%esp)
 8e1:	e8 aa fd ff ff       	call   690 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 8e6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 8ed:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 8f4:	89 1c 24             	mov    %ebx,(%esp)
 8f7:	e8 94 fd ff ff       	call   690 <free>
 8fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 8ff:	83 c4 14             	add    $0x14,%esp
 902:	5b                   	pop    %ebx
 903:	5d                   	pop    %ebp
 904:	c3                   	ret    
 905:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000910 <benny_thread_exit>:
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
}
 913:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 914:	e9 81 fa ff ff       	jmp    39a <kthread_exit>
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000920 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 926:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 92c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 933:	31 c0                	xor    %eax,%eax
 935:	5d                   	pop    %ebp
 936:	c3                   	ret    
 937:	89 f6                	mov    %esi,%esi
 939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000940 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 940:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 941:	b8 01 00 00 00       	mov    $0x1,%eax
 946:	89 e5                	mov    %esp,%ebp
 948:	56                   	push   %esi
 949:	53                   	push   %ebx
 94a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 94d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 950:	85 c0                	test   %eax,%eax
 952:	be 01 00 00 00       	mov    $0x1,%esi
 957:	74 15                	je     96e <benny_mootex_yieldlock+0x2e>
 959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 960:	e8 45 fa ff ff       	call   3aa <kthread_yield>
 965:	89 f0                	mov    %esi,%eax
 967:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 96a:	85 c0                	test   %eax,%eax
 96c:	75 f2                	jne    960 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 96e:	e8 2f fa ff ff       	call   3a2 <kthread_self>
    benny_mootex->bid = benny_self();
 973:	89 43 04             	mov    %eax,0x4(%ebx)
}
 976:	31 c0                	xor    %eax,%eax
 978:	5b                   	pop    %ebx
 979:	5e                   	pop    %esi
 97a:	5d                   	pop    %ebp
 97b:	c3                   	ret    
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000980 <benny_mootex_spinlock>:
{
 980:	55                   	push   %ebp
 981:	ba 01 00 00 00       	mov    $0x1,%edx
 986:	89 e5                	mov    %esp,%ebp
 988:	53                   	push   %ebx
 989:	83 ec 04             	sub    $0x4,%esp
 98c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 98f:	90                   	nop
 990:	89 d0                	mov    %edx,%eax
 992:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 995:	85 c0                	test   %eax,%eax
 997:	75 f7                	jne    990 <benny_mootex_spinlock+0x10>
    return kthread_self();
 999:	e8 04 fa ff ff       	call   3a2 <kthread_self>
    benny_mootex->bid = benny_self();
 99e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 9a1:	83 c4 04             	add    $0x4,%esp
 9a4:	31 c0                	xor    %eax,%eax
 9a6:	5b                   	pop    %ebx
 9a7:	5d                   	pop    %ebp
 9a8:	c3                   	ret    
 9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000009b0 <benny_mootex_unlock>:
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	53                   	push   %ebx
 9b4:	83 ec 04             	sub    $0x4,%esp
 9b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 9ba:	e8 e3 f9 ff ff       	call   3a2 <kthread_self>
    if(tid == benny_mootex->bid){
 9bf:	39 43 04             	cmp    %eax,0x4(%ebx)
 9c2:	75 1c                	jne    9e0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 9c4:	0f ae f0             	mfence 
    return 0;
 9c7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 9c9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 9d0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 9d6:	83 c4 04             	add    $0x4,%esp
 9d9:	5b                   	pop    %ebx
 9da:	5d                   	pop    %ebp
 9db:	c3                   	ret    
 9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9e0:	83 c4 04             	add    $0x4,%esp
      return -1;
 9e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 9e8:	5b                   	pop    %ebx
 9e9:	5d                   	pop    %ebp
 9ea:	c3                   	ret    
 9eb:	90                   	nop
 9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009f0 <benny_mootex_trylock>:
{
 9f0:	55                   	push   %ebp
 9f1:	b8 01 00 00 00       	mov    $0x1,%eax
 9f6:	89 e5                	mov    %esp,%ebp
 9f8:	53                   	push   %ebx
 9f9:	83 ec 04             	sub    $0x4,%esp
 9fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9ff:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 a02:	85 c0                	test   %eax,%eax
 a04:	75 08                	jne    a0e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 a06:	e8 97 f9 ff ff       	call   3a2 <kthread_self>
        benny_mootex->bid = tid;
 a0b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a0e:	83 c4 04             	add    $0x4,%esp
 a11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a16:	5b                   	pop    %ebx
 a17:	5d                   	pop    %ebp
 a18:	c3                   	ret    
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a20 <benny_mootex_wholock>:
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 a23:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a26:	5d                   	pop    %ebp
    return benny_mootex->bid;
 a27:	8b 40 04             	mov    0x4(%eax),%eax
}
 a2a:	c3                   	ret    
 a2b:	90                   	nop
 a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_mootex_islocked>:
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 a33:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a36:	5d                   	pop    %ebp
    return benny_mootex->locked;
 a37:	8b 00                	mov    (%eax),%eax
}
 a39:	c3                   	ret    
 a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a40 <benny_self>:
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
}
 a43:	5d                   	pop    %ebp
    return kthread_self();
 a44:	e9 59 f9 ff ff       	jmp    3a2 <kthread_self>
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a50 <benny_yield>:
{
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
    
}
 a53:	5d                   	pop    %ebp
    return kthread_yield();
 a54:	e9 51 f9 ff ff       	jmp    3aa <kthread_yield>
 a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a60 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 a63:	5d                   	pop    %ebp
    return kthread_cpu_count();
 a64:	e9 49 f9 ff ff       	jmp    3b2 <kthread_cpu_count>
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a70 <benny_thread_count>:

int
benny_thread_count(void)
{
 a70:	55                   	push   %ebp
 a71:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 a73:	5d                   	pop    %ebp
    return kthread_thread_count();
 a74:	e9 41 f9 ff ff       	jmp    3ba <kthread_thread_count>
