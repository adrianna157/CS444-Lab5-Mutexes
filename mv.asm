
_mv:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

int mv(char *, char *);

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
    int i = 0;
    int res = -1;
    char *src = NULL;
    char *dest = NULL;
    struct stat st;
    char dirstr[DIRSTR] = {0};
   1:	31 c0                	xor    %eax,%eax
{
   3:	89 e5                	mov    %esp,%ebp
    char dirstr[DIRSTR] = {0};
   5:	b9 20 00 00 00       	mov    $0x20,%ecx
{
   a:	57                   	push   %edi
   b:	56                   	push   %esi
   c:	53                   	push   %ebx
   d:	83 e4 f0             	and    $0xfffffff0,%esp
  10:	81 ec c0 00 00 00    	sub    $0xc0,%esp
  16:	8b 75 0c             	mov    0xc(%ebp),%esi

    if (argc < 3) {
  19:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    char dirstr[DIRSTR] = {0};
  1d:	8d 5c 24 40          	lea    0x40(%esp),%ebx
  21:	89 df                	mov    %ebx,%edi
  23:	f3 ab                	rep stos %eax,%es:(%edi)
    if (argc < 3) {
  25:	7f 19                	jg     40 <main+0x40>
        printf(2, "must have at least 2 arguments\n");
  27:	c7 44 24 04 a0 0b 00 	movl   $0xba0,0x4(%esp)
  2e:	00 
  2f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  36:	e8 45 05 00 00       	call   580 <printf>
        exit();
  3b:	e8 92 03 00 00       	call   3d2 <exit>
    }

    src = argv[1];
    dest = argv[argc - 1];
  40:	8b 45 08             	mov    0x8(%ebp),%eax
    src = argv[1];
  43:	8b 7e 04             	mov    0x4(%esi),%edi
    dest = argv[argc - 1];
  46:	8b 44 86 fc          	mov    -0x4(%esi,%eax,4),%eax
  4a:	89 c1                	mov    %eax,%ecx
  4c:	89 44 24 18          	mov    %eax,0x18(%esp)
    // mv f1 f2 f3 dest
    res = stat(dest, &st);
  50:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  54:	89 44 24 04          	mov    %eax,0x4(%esp)
  58:	89 0c 24             	mov    %ecx,(%esp)
  5b:	e8 c0 02 00 00       	call   320 <stat>

    if (res < 0) {
  60:	85 c0                	test   %eax,%eax
  62:	78 44                	js     a8 <main+0xa8>
        mv(src, dest);
    }
    else {
        switch (st.type) {
  64:	0f b7 44 24 2c       	movzwl 0x2c(%esp),%eax
  69:	66 83 f8 01          	cmp    $0x1,%ax
  6d:	74 4b                	je     ba <main+0xba>
  6f:	66 83 f8 02          	cmp    $0x2,%ax
  73:	74 19                	je     8e <main+0x8e>
                strcpy(&(dirstr[strlen(dirstr)]), argv[i]);
                mv(argv[i], dirstr);
            }
            break;
        default:
            printf(2, "cannot rename to an existing device\n");
  75:	c7 44 24 04 c0 0b 00 	movl   $0xbc0,0x4(%esp)
  7c:	00 
  7d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  84:	e8 f7 04 00 00       	call   580 <printf>
            break;
        }
    }

    exit();
  89:	e8 44 03 00 00       	call   3d2 <exit>
            unlink(dest);
  8e:	8b 74 24 18          	mov    0x18(%esp),%esi
  92:	89 34 24             	mov    %esi,(%esp)
  95:	e8 88 03 00 00       	call   422 <unlink>
            mv(src, dest);
  9a:	89 74 24 04          	mov    %esi,0x4(%esp)
  9e:	89 3c 24             	mov    %edi,(%esp)
  a1:	e8 aa 00 00 00       	call   150 <mv>
            break;
  a6:	eb e1                	jmp    89 <main+0x89>
        mv(src, dest);
  a8:	8b 44 24 18          	mov    0x18(%esp),%eax
  ac:	89 3c 24             	mov    %edi,(%esp)
  af:	89 44 24 04          	mov    %eax,0x4(%esp)
  b3:	e8 98 00 00 00       	call   150 <mv>
  b8:	eb cf                	jmp    89 <main+0x89>
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
        switch (st.type) {
  bd:	bf 01 00 00 00       	mov    $0x1,%edi
  c2:	83 e8 01             	sub    $0x1,%eax
  c5:	89 44 24 14          	mov    %eax,0x14(%esp)
  c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                memset(dirstr, 0, DIRSTR);
  d0:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
  d7:	00 
  d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  df:	00 
  e0:	89 1c 24             	mov    %ebx,(%esp)
  e3:	e8 78 01 00 00       	call   260 <memset>
                strcpy(dirstr, dest);
  e8:	8b 44 24 18          	mov    0x18(%esp),%eax
  ec:	89 1c 24             	mov    %ebx,(%esp)
  ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  f3:	e8 b8 00 00 00       	call   1b0 <strcpy>
                dirstr[strlen(dirstr)] = '/';
  f8:	89 1c 24             	mov    %ebx,(%esp)
  fb:	e8 30 01 00 00       	call   230 <strlen>
                strcpy(&(dirstr[strlen(dirstr)]), argv[i]);
 100:	8b 14 be             	mov    (%esi,%edi,4),%edx
 103:	89 54 24 1c          	mov    %edx,0x1c(%esp)
                dirstr[strlen(dirstr)] = '/';
 107:	c6 44 04 40 2f       	movb   $0x2f,0x40(%esp,%eax,1)
                strcpy(&(dirstr[strlen(dirstr)]), argv[i]);
 10c:	89 1c 24             	mov    %ebx,(%esp)
 10f:	e8 1c 01 00 00       	call   230 <strlen>
 114:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 118:	89 54 24 04          	mov    %edx,0x4(%esp)
 11c:	01 d8                	add    %ebx,%eax
 11e:	89 04 24             	mov    %eax,(%esp)
 121:	e8 8a 00 00 00       	call   1b0 <strcpy>
                mv(argv[i], dirstr);
 126:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 12a:	8b 04 be             	mov    (%esi,%edi,4),%eax
            for (i = 1; i < (argc - 1); i++) {
 12d:	83 c7 01             	add    $0x1,%edi
                mv(argv[i], dirstr);
 130:	89 04 24             	mov    %eax,(%esp)
 133:	e8 18 00 00 00       	call   150 <mv>
            for (i = 1; i < (argc - 1); i++) {
 138:	3b 7c 24 14          	cmp    0x14(%esp),%edi
 13c:	75 92                	jne    d0 <main+0xd0>
 13e:	e9 46 ff ff ff       	jmp    89 <main+0x89>
 143:	66 90                	xchg   %ax,%ax
 145:	66 90                	xchg   %ax,%ax
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <mv>:
}

int
mv(char *src, char *dest)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	56                   	push   %esi
 154:	53                   	push   %ebx
 155:	83 ec 10             	sub    $0x10,%esp
 158:	8b 5d 08             	mov    0x8(%ebp),%ebx
 15b:	8b 75 0c             	mov    0xc(%ebp),%esi
    int res = -1;

    if (link(src, dest) < 0) {
 15e:	89 1c 24             	mov    %ebx,(%esp)
 161:	89 74 24 04          	mov    %esi,0x4(%esp)
 165:	e8 c8 02 00 00       	call   432 <link>
 16a:	85 c0                	test   %eax,%eax
 16c:	78 1a                	js     188 <mv+0x38>
        printf(2, "mv %s %s: failed\n", src, dest);
    }
    else {
        if (unlink(src) < 0) {
 16e:	89 1c 24             	mov    %ebx,(%esp)
 171:	e8 ac 02 00 00       	call   422 <unlink>
 176:	85 c0                	test   %eax,%eax
 178:	78 0e                	js     188 <mv+0x38>
            printf(2, "mv %s %s: failed\n", src, dest);
        }
        else {
            res = 0;
 17a:	31 c0                	xor    %eax,%eax
        }
    }
    return res;
}
 17c:	83 c4 10             	add    $0x10,%esp
 17f:	5b                   	pop    %ebx
 180:	5e                   	pop    %esi
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	90                   	nop
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(2, "mv %s %s: failed\n", src, dest);
 188:	89 74 24 0c          	mov    %esi,0xc(%esp)
 18c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 190:	c7 44 24 04 8c 0b 00 	movl   $0xb8c,0x4(%esp)
 197:	00 
 198:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 19f:	e8 dc 03 00 00       	call   580 <printf>
    int res = -1;
 1a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1a9:	eb d1                	jmp    17c <mv+0x2c>
 1ab:	66 90                	xchg   %ax,%ax
 1ad:	66 90                	xchg   %ax,%ax
 1af:	90                   	nop

000001b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1b9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ba:	89 c2                	mov    %eax,%edx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c0:	83 c1 01             	add    $0x1,%ecx
 1c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1c7:	83 c2 01             	add    $0x1,%edx
 1ca:	84 db                	test   %bl,%bl
 1cc:	88 5a ff             	mov    %bl,-0x1(%edx)
 1cf:	75 ef                	jne    1c0 <strcpy+0x10>
    ;
  return os;
}
 1d1:	5b                   	pop    %ebx
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
 1e6:	53                   	push   %ebx
 1e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ea:	0f b6 02             	movzbl (%edx),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	74 2d                	je     21e <strcmp+0x3e>
 1f1:	0f b6 19             	movzbl (%ecx),%ebx
 1f4:	38 d8                	cmp    %bl,%al
 1f6:	74 0e                	je     206 <strcmp+0x26>
 1f8:	eb 2b                	jmp    225 <strcmp+0x45>
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	38 c8                	cmp    %cl,%al
 202:	75 15                	jne    219 <strcmp+0x39>
    p++, q++;
 204:	89 d9                	mov    %ebx,%ecx
 206:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 209:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 20c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 20f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 213:	84 c0                	test   %al,%al
 215:	75 e9                	jne    200 <strcmp+0x20>
 217:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 219:	29 c8                	sub    %ecx,%eax
}
 21b:	5b                   	pop    %ebx
 21c:	5d                   	pop    %ebp
 21d:	c3                   	ret    
 21e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 221:	31 c0                	xor    %eax,%eax
 223:	eb f4                	jmp    219 <strcmp+0x39>
 225:	0f b6 cb             	movzbl %bl,%ecx
 228:	eb ef                	jmp    219 <strcmp+0x39>
 22a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000230 <strlen>:

uint
strlen(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 236:	80 39 00             	cmpb   $0x0,(%ecx)
 239:	74 12                	je     24d <strlen+0x1d>
 23b:	31 d2                	xor    %edx,%edx
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c2 01             	add    $0x1,%edx
 243:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 247:	89 d0                	mov    %edx,%eax
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 24d:	31 c0                	xor    %eax,%eax
}
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	eb 0d                	jmp    260 <memset>
 253:	90                   	nop
 254:	90                   	nop
 255:	90                   	nop
 256:	90                   	nop
 257:	90                   	nop
 258:	90                   	nop
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop
 25c:	90                   	nop
 25d:	90                   	nop
 25e:	90                   	nop
 25f:	90                   	nop

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 55 08             	mov    0x8(%ebp),%edx
 266:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	89 d0                	mov    %edx,%eax
 274:	5f                   	pop    %edi
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	53                   	push   %ebx
 287:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 28a:	0f b6 18             	movzbl (%eax),%ebx
 28d:	84 db                	test   %bl,%bl
 28f:	74 1d                	je     2ae <strchr+0x2e>
    if(*s == c)
 291:	38 d3                	cmp    %dl,%bl
 293:	89 d1                	mov    %edx,%ecx
 295:	75 0d                	jne    2a4 <strchr+0x24>
 297:	eb 17                	jmp    2b0 <strchr+0x30>
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a0:	38 ca                	cmp    %cl,%dl
 2a2:	74 0c                	je     2b0 <strchr+0x30>
  for(; *s; s++)
 2a4:	83 c0 01             	add    $0x1,%eax
 2a7:	0f b6 10             	movzbl (%eax),%edx
 2aa:	84 d2                	test   %dl,%dl
 2ac:	75 f2                	jne    2a0 <strchr+0x20>
      return (char*)s;
  return 0;
 2ae:	31 c0                	xor    %eax,%eax
}
 2b0:	5b                   	pop    %ebx
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret    
 2b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c5:	31 f6                	xor    %esi,%esi
{
 2c7:	53                   	push   %ebx
 2c8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 2cb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 2ce:	eb 31                	jmp    301 <gets+0x41>
    cc = read(0, &c, 1);
 2d0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2d7:	00 
 2d8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2e3:	e8 02 01 00 00       	call   3ea <read>
    if(cc < 1)
 2e8:	85 c0                	test   %eax,%eax
 2ea:	7e 1d                	jle    309 <gets+0x49>
      break;
    buf[i++] = c;
 2ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 2f0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 2f2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 2f5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 2f7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2fb:	74 0c                	je     309 <gets+0x49>
 2fd:	3c 0a                	cmp    $0xa,%al
 2ff:	74 08                	je     309 <gets+0x49>
  for(i=0; i+1 < max; ){
 301:	8d 5e 01             	lea    0x1(%esi),%ebx
 304:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 307:	7c c7                	jl     2d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 309:	8b 45 08             	mov    0x8(%ebp),%eax
 30c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 310:	83 c4 2c             	add    $0x2c,%esp
 313:	5b                   	pop    %ebx
 314:	5e                   	pop    %esi
 315:	5f                   	pop    %edi
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    
 318:	90                   	nop
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <stat>:

int
stat(const char *n, struct stat *st)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 332:	00 
 333:	89 04 24             	mov    %eax,(%esp)
 336:	e8 d7 00 00 00       	call   412 <open>
  if(fd < 0)
 33b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 33d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 33f:	78 27                	js     368 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 341:	8b 45 0c             	mov    0xc(%ebp),%eax
 344:	89 1c 24             	mov    %ebx,(%esp)
 347:	89 44 24 04          	mov    %eax,0x4(%esp)
 34b:	e8 da 00 00 00       	call   42a <fstat>
  close(fd);
 350:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 353:	89 c6                	mov    %eax,%esi
  close(fd);
 355:	e8 a0 00 00 00       	call   3fa <close>
  return r;
 35a:	89 f0                	mov    %esi,%eax
}
 35c:	83 c4 10             	add    $0x10,%esp
 35f:	5b                   	pop    %ebx
 360:	5e                   	pop    %esi
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	90                   	nop
 364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 368:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 36d:	eb ed                	jmp    35c <stat+0x3c>
 36f:	90                   	nop

00000370 <atoi>:

int
atoi(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 4d 08             	mov    0x8(%ebp),%ecx
 376:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 377:	0f be 11             	movsbl (%ecx),%edx
 37a:	8d 42 d0             	lea    -0x30(%edx),%eax
 37d:	3c 09                	cmp    $0x9,%al
  n = 0;
 37f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 384:	77 17                	ja     39d <atoi+0x2d>
 386:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 388:	83 c1 01             	add    $0x1,%ecx
 38b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 38e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 392:	0f be 11             	movsbl (%ecx),%edx
 395:	8d 5a d0             	lea    -0x30(%edx),%ebx
 398:	80 fb 09             	cmp    $0x9,%bl
 39b:	76 eb                	jbe    388 <atoi+0x18>
  return n;
}
 39d:	5b                   	pop    %ebx
 39e:	5d                   	pop    %ebp
 39f:	c3                   	ret    

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a1:	31 d2                	xor    %edx,%edx
{
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	56                   	push   %esi
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	53                   	push   %ebx
 3aa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ad:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 3b0:	85 db                	test   %ebx,%ebx
 3b2:	7e 12                	jle    3c6 <memmove+0x26>
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3c2:	39 da                	cmp    %ebx,%edx
 3c4:	75 f2                	jne    3b8 <memmove+0x18>
  return vdst;
}
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5d                   	pop    %ebp
 3c9:	c3                   	ret    

000003ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ca:	b8 01 00 00 00       	mov    $0x1,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <exit>:
SYSCALL(exit)
 3d2:	b8 02 00 00 00       	mov    $0x2,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <wait>:
SYSCALL(wait)
 3da:	b8 03 00 00 00       	mov    $0x3,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <pipe>:
SYSCALL(pipe)
 3e2:	b8 04 00 00 00       	mov    $0x4,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <read>:
SYSCALL(read)
 3ea:	b8 05 00 00 00       	mov    $0x5,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <write>:
SYSCALL(write)
 3f2:	b8 10 00 00 00       	mov    $0x10,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <close>:
SYSCALL(close)
 3fa:	b8 15 00 00 00       	mov    $0x15,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <kill>:
SYSCALL(kill)
 402:	b8 06 00 00 00       	mov    $0x6,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <exec>:
SYSCALL(exec)
 40a:	b8 07 00 00 00       	mov    $0x7,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <open>:
SYSCALL(open)
 412:	b8 0f 00 00 00       	mov    $0xf,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <mknod>:
SYSCALL(mknod)
 41a:	b8 11 00 00 00       	mov    $0x11,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <unlink>:
SYSCALL(unlink)
 422:	b8 12 00 00 00       	mov    $0x12,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <fstat>:
SYSCALL(fstat)
 42a:	b8 08 00 00 00       	mov    $0x8,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <link>:
SYSCALL(link)
 432:	b8 13 00 00 00       	mov    $0x13,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <mkdir>:
SYSCALL(mkdir)
 43a:	b8 14 00 00 00       	mov    $0x14,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <chdir>:
SYSCALL(chdir)
 442:	b8 09 00 00 00       	mov    $0x9,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <dup>:
SYSCALL(dup)
 44a:	b8 0a 00 00 00       	mov    $0xa,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <getpid>:
SYSCALL(getpid)
 452:	b8 0b 00 00 00       	mov    $0xb,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <sbrk>:
SYSCALL(sbrk)
 45a:	b8 0c 00 00 00       	mov    $0xc,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <sleep>:
SYSCALL(sleep)
 462:	b8 0d 00 00 00       	mov    $0xd,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <uptime>:
SYSCALL(uptime)
 46a:	b8 0e 00 00 00       	mov    $0xe,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 472:	b8 16 00 00 00       	mov    $0x16,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 47a:	b8 17 00 00 00       	mov    $0x17,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 482:	b8 18 00 00 00       	mov    $0x18,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 48a:	b8 19 00 00 00       	mov    $0x19,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 492:	b8 1a 00 00 00       	mov    $0x1a,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 49a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <kthread_join>:
SYSCALL(kthread_join)
 4a2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <kthread_exit>:
SYSCALL(kthread_exit)
 4aa:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 4b2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <kthread_yield>:
SYSCALL(kthread_yield)
 4ba:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 4c2:	b8 20 00 00 00       	mov    $0x20,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 4ca:	b8 21 00 00 00       	mov    $0x21,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    
 4d2:	66 90                	xchg   %ax,%ax
 4d4:	66 90                	xchg   %ax,%ax
 4d6:	66 90                	xchg   %ax,%ax
 4d8:	66 90                	xchg   %ax,%ax
 4da:	66 90                	xchg   %ax,%ax
 4dc:	66 90                	xchg   %ax,%ax
 4de:	66 90                	xchg   %ax,%ax

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	89 c6                	mov    %eax,%esi
 4e7:	53                   	push   %ebx
 4e8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ee:	85 db                	test   %ebx,%ebx
 4f0:	74 09                	je     4fb <printint+0x1b>
 4f2:	89 d0                	mov    %edx,%eax
 4f4:	c1 e8 1f             	shr    $0x1f,%eax
 4f7:	84 c0                	test   %al,%al
 4f9:	75 75                	jne    570 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4fb:	89 d0                	mov    %edx,%eax
  neg = 0;
 4fd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 504:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 507:	31 ff                	xor    %edi,%edi
 509:	89 ce                	mov    %ecx,%esi
 50b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 50e:	eb 02                	jmp    512 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 510:	89 cf                	mov    %ecx,%edi
 512:	31 d2                	xor    %edx,%edx
 514:	f7 f6                	div    %esi
 516:	8d 4f 01             	lea    0x1(%edi),%ecx
 519:	0f b6 92 ef 0b 00 00 	movzbl 0xbef(%edx),%edx
  }while((x /= base) != 0);
 520:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 522:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 525:	75 e9                	jne    510 <printint+0x30>
  if(neg)
 527:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 52a:	89 c8                	mov    %ecx,%eax
 52c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 52f:	85 d2                	test   %edx,%edx
 531:	74 08                	je     53b <printint+0x5b>
    buf[i++] = '-';
 533:	8d 4f 02             	lea    0x2(%edi),%ecx
 536:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 53b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 53e:	66 90                	xchg   %ax,%ax
 540:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 545:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 548:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 54f:	00 
 550:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 554:	89 34 24             	mov    %esi,(%esp)
 557:	88 45 d7             	mov    %al,-0x29(%ebp)
 55a:	e8 93 fe ff ff       	call   3f2 <write>
  while(--i >= 0)
 55f:	83 ff ff             	cmp    $0xffffffff,%edi
 562:	75 dc                	jne    540 <printint+0x60>
    putc(fd, buf[i]);
}
 564:	83 c4 4c             	add    $0x4c,%esp
 567:	5b                   	pop    %ebx
 568:	5e                   	pop    %esi
 569:	5f                   	pop    %edi
 56a:	5d                   	pop    %ebp
 56b:	c3                   	ret    
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 570:	89 d0                	mov    %edx,%eax
 572:	f7 d8                	neg    %eax
    neg = 1;
 574:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 57b:	eb 87                	jmp    504 <printint+0x24>
 57d:	8d 76 00             	lea    0x0(%esi),%esi

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 584:	31 ff                	xor    %edi,%edi
{
 586:	56                   	push   %esi
 587:	53                   	push   %ebx
 588:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 58b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 58e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 591:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 594:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 597:	0f b6 13             	movzbl (%ebx),%edx
 59a:	83 c3 01             	add    $0x1,%ebx
 59d:	84 d2                	test   %dl,%dl
 59f:	75 39                	jne    5da <printf+0x5a>
 5a1:	e9 ca 00 00 00       	jmp    670 <printf+0xf0>
 5a6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 5a8:	83 fa 25             	cmp    $0x25,%edx
 5ab:	0f 84 c7 00 00 00    	je     678 <printf+0xf8>
  write(fd, &c, 1);
 5b1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 5b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5bb:	00 
 5bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 5c3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 5c6:	e8 27 fe ff ff       	call   3f2 <write>
 5cb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 5ce:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5d2:	84 d2                	test   %dl,%dl
 5d4:	0f 84 96 00 00 00    	je     670 <printf+0xf0>
    if(state == 0){
 5da:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5dc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 5df:	74 c7                	je     5a8 <printf+0x28>
      }
    } else if(state == '%'){
 5e1:	83 ff 25             	cmp    $0x25,%edi
 5e4:	75 e5                	jne    5cb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 5e6:	83 fa 75             	cmp    $0x75,%edx
 5e9:	0f 84 99 00 00 00    	je     688 <printf+0x108>
 5ef:	83 fa 64             	cmp    $0x64,%edx
 5f2:	0f 84 90 00 00 00    	je     688 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5f8:	25 f7 00 00 00       	and    $0xf7,%eax
 5fd:	83 f8 70             	cmp    $0x70,%eax
 600:	0f 84 aa 00 00 00    	je     6b0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 606:	83 fa 73             	cmp    $0x73,%edx
 609:	0f 84 e9 00 00 00    	je     6f8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 60f:	83 fa 63             	cmp    $0x63,%edx
 612:	0f 84 2b 01 00 00    	je     743 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 618:	83 fa 25             	cmp    $0x25,%edx
 61b:	0f 84 4f 01 00 00    	je     770 <printf+0x1f0>
  write(fd, &c, 1);
 621:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 624:	83 c3 01             	add    $0x1,%ebx
 627:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 62e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 62f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 631:	89 44 24 04          	mov    %eax,0x4(%esp)
 635:	89 34 24             	mov    %esi,(%esp)
 638:	89 55 d0             	mov    %edx,-0x30(%ebp)
 63b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 63f:	e8 ae fd ff ff       	call   3f2 <write>
        putc(fd, c);
 644:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 647:	8d 45 e7             	lea    -0x19(%ebp),%eax
 64a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 651:	00 
 652:	89 44 24 04          	mov    %eax,0x4(%esp)
 656:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 659:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 65c:	e8 91 fd ff ff       	call   3f2 <write>
  for(i = 0; fmt[i]; i++){
 661:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 665:	84 d2                	test   %dl,%dl
 667:	0f 85 6d ff ff ff    	jne    5da <printf+0x5a>
 66d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 670:	83 c4 3c             	add    $0x3c,%esp
 673:	5b                   	pop    %ebx
 674:	5e                   	pop    %esi
 675:	5f                   	pop    %edi
 676:	5d                   	pop    %ebp
 677:	c3                   	ret    
        state = '%';
 678:	bf 25 00 00 00       	mov    $0x25,%edi
 67d:	e9 49 ff ff ff       	jmp    5cb <printf+0x4b>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 688:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 68f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 694:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 697:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 699:	8b 10                	mov    (%eax),%edx
 69b:	89 f0                	mov    %esi,%eax
 69d:	e8 3e fe ff ff       	call   4e0 <printint>
        ap++;
 6a2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6a6:	e9 20 ff ff ff       	jmp    5cb <printf+0x4b>
 6ab:	90                   	nop
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6b0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 6b3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6ba:	00 
 6bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bf:	89 34 24             	mov    %esi,(%esp)
 6c2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 6c6:	e8 27 fd ff ff       	call   3f2 <write>
 6cb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6d5:	00 
 6d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6da:	89 34 24             	mov    %esi,(%esp)
 6dd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 6e1:	e8 0c fd ff ff       	call   3f2 <write>
        printint(fd, *ap, 16, 0);
 6e6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6f2:	eb a0                	jmp    694 <printf+0x114>
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 6fb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 6ff:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 701:	b8 e8 0b 00 00       	mov    $0xbe8,%eax
 706:	85 ff                	test   %edi,%edi
 708:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 70b:	0f b6 07             	movzbl (%edi),%eax
 70e:	84 c0                	test   %al,%al
 710:	74 2a                	je     73c <printf+0x1bc>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 718:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 71b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 71e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 721:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 728:	00 
 729:	89 44 24 04          	mov    %eax,0x4(%esp)
 72d:	89 34 24             	mov    %esi,(%esp)
 730:	e8 bd fc ff ff       	call   3f2 <write>
        while(*s != 0){
 735:	0f b6 07             	movzbl (%edi),%eax
 738:	84 c0                	test   %al,%al
 73a:	75 dc                	jne    718 <printf+0x198>
      state = 0;
 73c:	31 ff                	xor    %edi,%edi
 73e:	e9 88 fe ff ff       	jmp    5cb <printf+0x4b>
        putc(fd, *ap);
 743:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 746:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 748:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 74a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 751:	00 
 752:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 755:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 758:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 75b:	89 44 24 04          	mov    %eax,0x4(%esp)
 75f:	e8 8e fc ff ff       	call   3f2 <write>
        ap++;
 764:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 768:	e9 5e fe ff ff       	jmp    5cb <printf+0x4b>
 76d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 770:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 773:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 775:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 77c:	00 
 77d:	89 44 24 04          	mov    %eax,0x4(%esp)
 781:	89 34 24             	mov    %esi,(%esp)
 784:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 788:	e8 65 fc ff ff       	call   3f2 <write>
 78d:	e9 39 fe ff ff       	jmp    5cb <printf+0x4b>
 792:	66 90                	xchg   %ax,%ax
 794:	66 90                	xchg   %ax,%ax
 796:	66 90                	xchg   %ax,%ax
 798:	66 90                	xchg   %ax,%ax
 79a:	66 90                	xchg   %ax,%ax
 79c:	66 90                	xchg   %ax,%ax
 79e:	66 90                	xchg   %ax,%ax

000007a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a1:	a1 a4 10 00 00       	mov    0x10a4,%eax
{
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	57                   	push   %edi
 7a9:	56                   	push   %esi
 7aa:	53                   	push   %ebx
 7ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ae:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 7b0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b3:	39 d0                	cmp    %edx,%eax
 7b5:	72 11                	jb     7c8 <free+0x28>
 7b7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b8:	39 c8                	cmp    %ecx,%eax
 7ba:	72 04                	jb     7c0 <free+0x20>
 7bc:	39 ca                	cmp    %ecx,%edx
 7be:	72 10                	jb     7d0 <free+0x30>
 7c0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c6:	73 f0                	jae    7b8 <free+0x18>
 7c8:	39 ca                	cmp    %ecx,%edx
 7ca:	72 04                	jb     7d0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7cc:	39 c8                	cmp    %ecx,%eax
 7ce:	72 f0                	jb     7c0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 7d6:	39 cf                	cmp    %ecx,%edi
 7d8:	74 1e                	je     7f8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7da:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7dd:	8b 48 04             	mov    0x4(%eax),%ecx
 7e0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 7e3:	39 f2                	cmp    %esi,%edx
 7e5:	74 28                	je     80f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7e7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7e9:	a3 a4 10 00 00       	mov    %eax,0x10a4
}
 7ee:	5b                   	pop    %ebx
 7ef:	5e                   	pop    %esi
 7f0:	5f                   	pop    %edi
 7f1:	5d                   	pop    %ebp
 7f2:	c3                   	ret    
 7f3:	90                   	nop
 7f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7f8:	03 71 04             	add    0x4(%ecx),%esi
 7fb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7fe:	8b 08                	mov    (%eax),%ecx
 800:	8b 09                	mov    (%ecx),%ecx
 802:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 805:	8b 48 04             	mov    0x4(%eax),%ecx
 808:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 80b:	39 f2                	cmp    %esi,%edx
 80d:	75 d8                	jne    7e7 <free+0x47>
    p->s.size += bp->s.size;
 80f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 812:	a3 a4 10 00 00       	mov    %eax,0x10a4
    p->s.size += bp->s.size;
 817:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 81a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 81d:	89 10                	mov    %edx,(%eax)
}
 81f:	5b                   	pop    %ebx
 820:	5e                   	pop    %esi
 821:	5f                   	pop    %edi
 822:	5d                   	pop    %ebp
 823:	c3                   	ret    
 824:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 82a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000830 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	57                   	push   %edi
 834:	56                   	push   %esi
 835:	53                   	push   %ebx
 836:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 83c:	8b 1d a4 10 00 00    	mov    0x10a4,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 842:	8d 48 07             	lea    0x7(%eax),%ecx
 845:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 848:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 84a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 84d:	0f 84 9b 00 00 00    	je     8ee <malloc+0xbe>
 853:	8b 13                	mov    (%ebx),%edx
 855:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 858:	39 fe                	cmp    %edi,%esi
 85a:	76 64                	jbe    8c0 <malloc+0x90>
 85c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 863:	bb 00 80 00 00       	mov    $0x8000,%ebx
 868:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 86b:	eb 0e                	jmp    87b <malloc+0x4b>
 86d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 870:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 872:	8b 78 04             	mov    0x4(%eax),%edi
 875:	39 fe                	cmp    %edi,%esi
 877:	76 4f                	jbe    8c8 <malloc+0x98>
 879:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 87b:	3b 15 a4 10 00 00    	cmp    0x10a4,%edx
 881:	75 ed                	jne    870 <malloc+0x40>
  if(nu < 4096)
 883:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 886:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 88c:	bf 00 10 00 00       	mov    $0x1000,%edi
 891:	0f 43 fe             	cmovae %esi,%edi
 894:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 897:	89 04 24             	mov    %eax,(%esp)
 89a:	e8 bb fb ff ff       	call   45a <sbrk>
  if(p == (char*)-1)
 89f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8a2:	74 18                	je     8bc <malloc+0x8c>
  hp->s.size = nu;
 8a4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 8a7:	83 c0 08             	add    $0x8,%eax
 8aa:	89 04 24             	mov    %eax,(%esp)
 8ad:	e8 ee fe ff ff       	call   7a0 <free>
  return freep;
 8b2:	8b 15 a4 10 00 00    	mov    0x10a4,%edx
      if((p = morecore(nunits)) == 0)
 8b8:	85 d2                	test   %edx,%edx
 8ba:	75 b4                	jne    870 <malloc+0x40>
        return 0;
 8bc:	31 c0                	xor    %eax,%eax
 8be:	eb 20                	jmp    8e0 <malloc+0xb0>
    if(p->s.size >= nunits){
 8c0:	89 d0                	mov    %edx,%eax
 8c2:	89 da                	mov    %ebx,%edx
 8c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8c8:	39 fe                	cmp    %edi,%esi
 8ca:	74 1c                	je     8e8 <malloc+0xb8>
        p->s.size -= nunits;
 8cc:	29 f7                	sub    %esi,%edi
 8ce:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 8d1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 8d4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8d7:	89 15 a4 10 00 00    	mov    %edx,0x10a4
      return (void*)(p + 1);
 8dd:	83 c0 08             	add    $0x8,%eax
  }
}
 8e0:	83 c4 1c             	add    $0x1c,%esp
 8e3:	5b                   	pop    %ebx
 8e4:	5e                   	pop    %esi
 8e5:	5f                   	pop    %edi
 8e6:	5d                   	pop    %ebp
 8e7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8e8:	8b 08                	mov    (%eax),%ecx
 8ea:	89 0a                	mov    %ecx,(%edx)
 8ec:	eb e9                	jmp    8d7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 8ee:	c7 05 a4 10 00 00 a8 	movl   $0x10a8,0x10a4
 8f5:	10 00 00 
    base.s.size = 0;
 8f8:	ba a8 10 00 00       	mov    $0x10a8,%edx
    base.s.ptr = freep = prevp = &base;
 8fd:	c7 05 a8 10 00 00 a8 	movl   $0x10a8,0x10a8
 904:	10 00 00 
    base.s.size = 0;
 907:	c7 05 ac 10 00 00 00 	movl   $0x0,0x10ac
 90e:	00 00 00 
 911:	e9 46 ff ff ff       	jmp    85c <malloc+0x2c>
 916:	66 90                	xchg   %ax,%ax
 918:	66 90                	xchg   %ax,%ax
 91a:	66 90                	xchg   %ax,%ax
 91c:	66 90                	xchg   %ax,%ax
 91e:	66 90                	xchg   %ax,%ax

00000920 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	56                   	push   %esi
 924:	53                   	push   %ebx
 925:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 928:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 92f:	e8 fc fe ff ff       	call   830 <malloc>

    if (bt == NULL) {
 934:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 936:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 938:	74 66                	je     9a0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 93a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 941:	e8 ea fe ff ff       	call   830 <malloc>
    if (bt->bt_stack == NULL) {
 946:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 948:	89 c3                	mov    %eax,%ebx
 94a:	89 46 08             	mov    %eax,0x8(%esi)
 94d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 950:	74 5d                	je     9af <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 952:	25 ff 0f 00 00       	and    $0xfff,%eax
 957:	75 37                	jne    990 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 959:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 95f:	8b 45 10             	mov    0x10(%ebp),%eax
 962:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 966:	89 44 24 04          	mov    %eax,0x4(%esp)
 96a:	8b 45 0c             	mov    0xc(%ebp),%eax
 96d:	89 04 24             	mov    %eax,(%esp)
 970:	e8 25 fb ff ff       	call   49a <kthread_create>
    if (bt->bid != 0) {
 975:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 977:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 979:	74 2d                	je     9a8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 97b:	8b 45 08             	mov    0x8(%ebp),%eax
 97e:	89 30                	mov    %esi,(%eax)
        result = 0;
 980:	31 c0                	xor    %eax,%eax
}
 982:	83 c4 10             	add    $0x10,%esp
 985:	5b                   	pop    %ebx
 986:	5e                   	pop    %esi
 987:	5d                   	pop    %ebp
 988:	c3                   	ret    
 989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 990:	29 c3                	sub    %eax,%ebx
 992:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 998:	89 5e 04             	mov    %ebx,0x4(%esi)
 99b:	eb bc                	jmp    959 <benny_thread_create+0x39>
 99d:	8d 76 00             	lea    0x0(%esi),%esi
 9a0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 9a6:	eb b7                	jmp    95f <benny_thread_create+0x3f>
    int result = -1;
 9a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 9ad:	eb d3                	jmp    982 <benny_thread_create+0x62>
        free(bt);
 9af:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 9b2:	31 f6                	xor    %esi,%esi
        free(bt);
 9b4:	e8 e7 fd ff ff       	call   7a0 <free>
 9b9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 9bc:	eb a1                	jmp    95f <benny_thread_create+0x3f>
 9be:	66 90                	xchg   %ax,%ax

000009c0 <benny_thread_bid>:
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 9c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9c6:	5d                   	pop    %ebp
    return bt->bid;
 9c7:	8b 00                	mov    (%eax),%eax
}
 9c9:	c3                   	ret    
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009d0 <benny_thread_join>:
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	53                   	push   %ebx
 9d4:	83 ec 14             	sub    $0x14,%esp
 9d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 9da:	8b 03                	mov    (%ebx),%eax
 9dc:	89 04 24             	mov    %eax,(%esp)
 9df:	e8 be fa ff ff       	call   4a2 <kthread_join>
    if (retVal == 0) {
 9e4:	85 c0                	test   %eax,%eax
 9e6:	75 27                	jne    a0f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 9e8:	8b 53 08             	mov    0x8(%ebx),%edx
 9eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9ee:	89 14 24             	mov    %edx,(%esp)
 9f1:	e8 aa fd ff ff       	call   7a0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 9f6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 9fd:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 a04:	89 1c 24             	mov    %ebx,(%esp)
 a07:	e8 94 fd ff ff       	call   7a0 <free>
 a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 a0f:	83 c4 14             	add    $0x14,%esp
 a12:	5b                   	pop    %ebx
 a13:	5d                   	pop    %ebp
 a14:	c3                   	ret    
 a15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a20 <benny_thread_exit>:
{
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
}
 a23:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 a24:	e9 81 fa ff ff       	jmp    4aa <kthread_exit>
 a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a30 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 a36:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 a3c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 a43:	31 c0                	xor    %eax,%eax
 a45:	5d                   	pop    %ebp
 a46:	c3                   	ret    
 a47:	89 f6                	mov    %esi,%esi
 a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a50 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 a50:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a51:	b8 01 00 00 00       	mov    $0x1,%eax
 a56:	89 e5                	mov    %esp,%ebp
 a58:	56                   	push   %esi
 a59:	53                   	push   %ebx
 a5a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a5d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 a60:	85 c0                	test   %eax,%eax
 a62:	be 01 00 00 00       	mov    $0x1,%esi
 a67:	74 15                	je     a7e <benny_mootex_yieldlock+0x2e>
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 a70:	e8 45 fa ff ff       	call   4ba <kthread_yield>
 a75:	89 f0                	mov    %esi,%eax
 a77:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a7a:	85 c0                	test   %eax,%eax
 a7c:	75 f2                	jne    a70 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 a7e:	e8 2f fa ff ff       	call   4b2 <kthread_self>
    benny_mootex->bid = benny_self();
 a83:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a86:	31 c0                	xor    %eax,%eax
 a88:	5b                   	pop    %ebx
 a89:	5e                   	pop    %esi
 a8a:	5d                   	pop    %ebp
 a8b:	c3                   	ret    
 a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a90 <benny_mootex_spinlock>:
{
 a90:	55                   	push   %ebp
 a91:	ba 01 00 00 00       	mov    $0x1,%edx
 a96:	89 e5                	mov    %esp,%ebp
 a98:	53                   	push   %ebx
 a99:	83 ec 04             	sub    $0x4,%esp
 a9c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a9f:	90                   	nop
 aa0:	89 d0                	mov    %edx,%eax
 aa2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 aa5:	85 c0                	test   %eax,%eax
 aa7:	75 f7                	jne    aa0 <benny_mootex_spinlock+0x10>
    return kthread_self();
 aa9:	e8 04 fa ff ff       	call   4b2 <kthread_self>
    benny_mootex->bid = benny_self();
 aae:	89 43 04             	mov    %eax,0x4(%ebx)
}
 ab1:	83 c4 04             	add    $0x4,%esp
 ab4:	31 c0                	xor    %eax,%eax
 ab6:	5b                   	pop    %ebx
 ab7:	5d                   	pop    %ebp
 ab8:	c3                   	ret    
 ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ac0 <benny_mootex_unlock>:
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	53                   	push   %ebx
 ac4:	83 ec 04             	sub    $0x4,%esp
 ac7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 aca:	e8 e3 f9 ff ff       	call   4b2 <kthread_self>
    if(tid == benny_mootex->bid){
 acf:	39 43 04             	cmp    %eax,0x4(%ebx)
 ad2:	75 1c                	jne    af0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 ad4:	0f ae f0             	mfence 
    return 0;
 ad7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 ad9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 ae0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 ae6:	83 c4 04             	add    $0x4,%esp
 ae9:	5b                   	pop    %ebx
 aea:	5d                   	pop    %ebp
 aeb:	c3                   	ret    
 aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 af0:	83 c4 04             	add    $0x4,%esp
      return -1;
 af3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 af8:	5b                   	pop    %ebx
 af9:	5d                   	pop    %ebp
 afa:	c3                   	ret    
 afb:	90                   	nop
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b00 <benny_mootex_trylock>:
{
 b00:	55                   	push   %ebp
 b01:	b8 01 00 00 00       	mov    $0x1,%eax
 b06:	89 e5                	mov    %esp,%ebp
 b08:	53                   	push   %ebx
 b09:	83 ec 04             	sub    $0x4,%esp
 b0c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b0f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 b12:	85 c0                	test   %eax,%eax
 b14:	75 08                	jne    b1e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 b16:	e8 97 f9 ff ff       	call   4b2 <kthread_self>
        benny_mootex->bid = tid;
 b1b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b1e:	83 c4 04             	add    $0x4,%esp
 b21:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b26:	5b                   	pop    %ebx
 b27:	5d                   	pop    %ebp
 b28:	c3                   	ret    
 b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b30 <benny_mootex_wholock>:
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 b33:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b36:	5d                   	pop    %ebp
    return benny_mootex->bid;
 b37:	8b 40 04             	mov    0x4(%eax),%eax
}
 b3a:	c3                   	ret    
 b3b:	90                   	nop
 b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b40 <benny_mootex_islocked>:
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 b43:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b46:	5d                   	pop    %ebp
    return benny_mootex->locked;
 b47:	8b 00                	mov    (%eax),%eax
}
 b49:	c3                   	ret    
 b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b50 <benny_self>:
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
}
 b53:	5d                   	pop    %ebp
    return kthread_self();
 b54:	e9 59 f9 ff ff       	jmp    4b2 <kthread_self>
 b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b60 <benny_yield>:
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
    
}
 b63:	5d                   	pop    %ebp
    return kthread_yield();
 b64:	e9 51 f9 ff ff       	jmp    4ba <kthread_yield>
 b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b70 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 b70:	55                   	push   %ebp
 b71:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 b73:	5d                   	pop    %ebp
    return kthread_cpu_count();
 b74:	e9 49 f9 ff ff       	jmp    4c2 <kthread_cpu_count>
 b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b80 <benny_thread_count>:

int
benny_thread_count(void)
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 b83:	5d                   	pop    %ebp
    return kthread_thread_count();
 b84:	e9 41 f9 ff ff       	jmp    4ca <kthread_thread_count>
