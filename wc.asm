
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  1b:	7e 60                	jle    7d <main+0x7d>
  1d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  27:	00 
  28:	8b 03                	mov    (%ebx),%eax
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 c0 03 00 00       	call   3f2 <open>
  32:	85 c0                	test   %eax,%eax
  34:	89 c7                	mov    %eax,%edi
  36:	78 26                	js     5e <main+0x5e>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  38:	8b 13                	mov    (%ebx),%edx
  for(i = 1; i < argc; i++){
  3a:	83 c6 01             	add    $0x1,%esi
  3d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  40:	89 04 24             	mov    %eax,(%esp)
  43:	89 54 24 04          	mov    %edx,0x4(%esp)
  47:	e8 54 00 00 00       	call   a0 <wc>
    close(fd);
  4c:	89 3c 24             	mov    %edi,(%esp)
  4f:	e8 86 03 00 00       	call   3da <close>
  for(i = 1; i < argc; i++){
  54:	3b 75 08             	cmp    0x8(%ebp),%esi
  57:	75 c7                	jne    20 <main+0x20>
  }
  exit();
  59:	e8 54 03 00 00       	call   3b2 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  5e:	8b 03                	mov    (%ebx),%eax
  60:	c7 44 24 04 8c 0b 00 	movl   $0xb8c,0x4(%esp)
  67:	00 
  68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6f:	89 44 24 08          	mov    %eax,0x8(%esp)
  73:	e8 e8 04 00 00       	call   560 <printf>
      exit();
  78:	e8 35 03 00 00       	call   3b2 <exit>
    wc(0, "");
  7d:	c7 44 24 04 7e 0b 00 	movl   $0xb7e,0x4(%esp)
  84:	00 
  85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8c:	e8 0f 00 00 00       	call   a0 <wc>
    exit();
  91:	e8 1c 03 00 00       	call   3b2 <exit>
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  inword = 0;
  a5:	31 f6                	xor    %esi,%esi
{
  a7:	53                   	push   %ebx
  l = w = c = 0;
  a8:	31 db                	xor    %ebx,%ebx
{
  aa:	83 ec 3c             	sub    $0x3c,%esp
  l = w = c = 0;
  ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	8b 45 08             	mov    0x8(%ebp),%eax
  c3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  ca:	00 
  cb:	c7 44 24 04 a0 10 00 	movl   $0x10a0,0x4(%esp)
  d2:	00 
  d3:	89 04 24             	mov    %eax,(%esp)
  d6:	e8 ef 02 00 00       	call   3ca <read>
  db:	83 f8 00             	cmp    $0x0,%eax
  de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e1:	7e 54                	jle    137 <wc+0x97>
  e3:	31 ff                	xor    %edi,%edi
  e5:	eb 0b                	jmp    f2 <wc+0x52>
  e7:	90                   	nop
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
  f0:	74 38                	je     12a <wc+0x8a>
      if(buf[i] == '\n')
  f2:	0f be 87 a0 10 00 00 	movsbl 0x10a0(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
      if(strchr(" \r\t\n\v", buf[i]))
  fb:	c7 04 24 69 0b 00 00 	movl   $0xb69,(%esp)
        l++;
 102:	3c 0a                	cmp    $0xa,%al
 104:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 107:	89 44 24 04          	mov    %eax,0x4(%esp)
        l++;
 10b:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10d:	e8 4e 01 00 00       	call   260 <strchr>
 112:	85 c0                	test   %eax,%eax
 114:	75 d2                	jne    e8 <wc+0x48>
      else if(!inword){
 116:	85 f6                	test   %esi,%esi
 118:	75 16                	jne    130 <wc+0x90>
        w++;
 11a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    for(i=0; i<n; i++){
 11e:	83 c7 01             	add    $0x1,%edi
 121:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
        inword = 1;
 124:	66 be 01 00          	mov    $0x1,%si
    for(i=0; i<n; i++){
 128:	75 c8                	jne    f2 <wc+0x52>
 12a:	01 7d dc             	add    %edi,-0x24(%ebp)
 12d:	eb 91                	jmp    c0 <wc+0x20>
 12f:	90                   	nop
 130:	be 01 00 00 00       	mov    $0x1,%esi
 135:	eb b3                	jmp    ea <wc+0x4a>
  if(n < 0){
 137:	75 35                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 139:	8b 45 0c             	mov    0xc(%ebp),%eax
 13c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 140:	c7 44 24 04 7f 0b 00 	movl   $0xb7f,0x4(%esp)
 147:	00 
 148:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 14f:	89 44 24 14          	mov    %eax,0x14(%esp)
 153:	8b 45 dc             	mov    -0x24(%ebp),%eax
 156:	89 44 24 10          	mov    %eax,0x10(%esp)
 15a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 15d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 161:	e8 fa 03 00 00       	call   560 <printf>
}
 166:	83 c4 3c             	add    $0x3c,%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	c7 44 24 04 6f 0b 00 	movl   $0xb6f,0x4(%esp)
 175:	00 
 176:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 17d:	e8 de 03 00 00       	call   560 <printf>
    exit();
 182:	e8 2b 02 00 00       	call   3b2 <exit>
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 199:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 19a:	89 c2                	mov    %eax,%edx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1a7:	83 c2 01             	add    $0x1,%edx
 1aa:	84 db                	test   %bl,%bl
 1ac:	88 5a ff             	mov    %bl,-0x1(%edx)
 1af:	75 ef                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1b1:	5b                   	pop    %ebx
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	53                   	push   %ebx
 1c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ca:	0f b6 02             	movzbl (%edx),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	74 2d                	je     1fe <strcmp+0x3e>
 1d1:	0f b6 19             	movzbl (%ecx),%ebx
 1d4:	38 d8                	cmp    %bl,%al
 1d6:	74 0e                	je     1e6 <strcmp+0x26>
 1d8:	eb 2b                	jmp    205 <strcmp+0x45>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	38 c8                	cmp    %cl,%al
 1e2:	75 15                	jne    1f9 <strcmp+0x39>
    p++, q++;
 1e4:	89 d9                	mov    %ebx,%ecx
 1e6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1e9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1ec:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1ef:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 1f3:	84 c0                	test   %al,%al
 1f5:	75 e9                	jne    1e0 <strcmp+0x20>
 1f7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1f9:	29 c8                	sub    %ecx,%eax
}
 1fb:	5b                   	pop    %ebx
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    
 1fe:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 201:	31 c0                	xor    %eax,%eax
 203:	eb f4                	jmp    1f9 <strcmp+0x39>
 205:	0f b6 cb             	movzbl %bl,%ecx
 208:	eb ef                	jmp    1f9 <strcmp+0x39>
 20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 39 00             	cmpb   $0x0,(%ecx)
 219:	74 12                	je     22d <strlen+0x1d>
 21b:	31 d2                	xor    %edx,%edx
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c2 01             	add    $0x1,%edx
 223:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 227:	89 d0                	mov    %edx,%eax
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 22d:	31 c0                	xor    %eax,%eax
}
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	eb 0d                	jmp    240 <memset>
 233:	90                   	nop
 234:	90                   	nop
 235:	90                   	nop
 236:	90                   	nop
 237:	90                   	nop
 238:	90                   	nop
 239:	90                   	nop
 23a:	90                   	nop
 23b:	90                   	nop
 23c:	90                   	nop
 23d:	90                   	nop
 23e:	90                   	nop
 23f:	90                   	nop

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
 246:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	89 d0                	mov    %edx,%eax
 254:	5f                   	pop    %edi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	53                   	push   %ebx
 267:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 26a:	0f b6 18             	movzbl (%eax),%ebx
 26d:	84 db                	test   %bl,%bl
 26f:	74 1d                	je     28e <strchr+0x2e>
    if(*s == c)
 271:	38 d3                	cmp    %dl,%bl
 273:	89 d1                	mov    %edx,%ecx
 275:	75 0d                	jne    284 <strchr+0x24>
 277:	eb 17                	jmp    290 <strchr+0x30>
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 280:	38 ca                	cmp    %cl,%dl
 282:	74 0c                	je     290 <strchr+0x30>
  for(; *s; s++)
 284:	83 c0 01             	add    $0x1,%eax
 287:	0f b6 10             	movzbl (%eax),%edx
 28a:	84 d2                	test   %dl,%dl
 28c:	75 f2                	jne    280 <strchr+0x20>
      return (char*)s;
  return 0;
 28e:	31 c0                	xor    %eax,%eax
}
 290:	5b                   	pop    %ebx
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a5:	31 f6                	xor    %esi,%esi
{
 2a7:	53                   	push   %ebx
 2a8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 2ab:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 2ae:	eb 31                	jmp    2e1 <gets+0x41>
    cc = read(0, &c, 1);
 2b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2b7:	00 
 2b8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2c3:	e8 02 01 00 00       	call   3ca <read>
    if(cc < 1)
 2c8:	85 c0                	test   %eax,%eax
 2ca:	7e 1d                	jle    2e9 <gets+0x49>
      break;
    buf[i++] = c;
 2cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 2d0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 2d2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 2d5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 2d7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2db:	74 0c                	je     2e9 <gets+0x49>
 2dd:	3c 0a                	cmp    $0xa,%al
 2df:	74 08                	je     2e9 <gets+0x49>
  for(i=0; i+1 < max; ){
 2e1:	8d 5e 01             	lea    0x1(%esi),%ebx
 2e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2e7:	7c c7                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ec:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2f0:	83 c4 2c             	add    $0x2c,%esp
 2f3:	5b                   	pop    %ebx
 2f4:	5e                   	pop    %esi
 2f5:	5f                   	pop    %edi
 2f6:	5d                   	pop    %ebp
 2f7:	c3                   	ret    
 2f8:	90                   	nop
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
 305:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 312:	00 
 313:	89 04 24             	mov    %eax,(%esp)
 316:	e8 d7 00 00 00       	call   3f2 <open>
  if(fd < 0)
 31b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 31d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 31f:	78 27                	js     348 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 321:	8b 45 0c             	mov    0xc(%ebp),%eax
 324:	89 1c 24             	mov    %ebx,(%esp)
 327:	89 44 24 04          	mov    %eax,0x4(%esp)
 32b:	e8 da 00 00 00       	call   40a <fstat>
  close(fd);
 330:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 333:	89 c6                	mov    %eax,%esi
  close(fd);
 335:	e8 a0 00 00 00       	call   3da <close>
  return r;
 33a:	89 f0                	mov    %esi,%eax
}
 33c:	83 c4 10             	add    $0x10,%esp
 33f:	5b                   	pop    %ebx
 340:	5e                   	pop    %esi
 341:	5d                   	pop    %ebp
 342:	c3                   	ret    
 343:	90                   	nop
 344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 348:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 34d:	eb ed                	jmp    33c <stat+0x3c>
 34f:	90                   	nop

00000350 <atoi>:

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 4d 08             	mov    0x8(%ebp),%ecx
 356:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 357:	0f be 11             	movsbl (%ecx),%edx
 35a:	8d 42 d0             	lea    -0x30(%edx),%eax
 35d:	3c 09                	cmp    $0x9,%al
  n = 0;
 35f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 364:	77 17                	ja     37d <atoi+0x2d>
 366:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 368:	83 c1 01             	add    $0x1,%ecx
 36b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 36e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 372:	0f be 11             	movsbl (%ecx),%edx
 375:	8d 5a d0             	lea    -0x30(%edx),%ebx
 378:	80 fb 09             	cmp    $0x9,%bl
 37b:	76 eb                	jbe    368 <atoi+0x18>
  return n;
}
 37d:	5b                   	pop    %ebx
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 381:	31 d2                	xor    %edx,%edx
{
 383:	89 e5                	mov    %esp,%ebp
 385:	56                   	push   %esi
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	53                   	push   %ebx
 38a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 38d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 390:	85 db                	test   %ebx,%ebx
 392:	7e 12                	jle    3a6 <memmove+0x26>
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 398:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 39c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 39f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3a2:	39 da                	cmp    %ebx,%edx
 3a4:	75 f2                	jne    398 <memmove+0x18>
  return vdst;
}
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    

000003aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3aa:	b8 01 00 00 00       	mov    $0x1,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <exit>:
SYSCALL(exit)
 3b2:	b8 02 00 00 00       	mov    $0x2,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <wait>:
SYSCALL(wait)
 3ba:	b8 03 00 00 00       	mov    $0x3,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <pipe>:
SYSCALL(pipe)
 3c2:	b8 04 00 00 00       	mov    $0x4,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <read>:
SYSCALL(read)
 3ca:	b8 05 00 00 00       	mov    $0x5,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <write>:
SYSCALL(write)
 3d2:	b8 10 00 00 00       	mov    $0x10,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <close>:
SYSCALL(close)
 3da:	b8 15 00 00 00       	mov    $0x15,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <kill>:
SYSCALL(kill)
 3e2:	b8 06 00 00 00       	mov    $0x6,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <exec>:
SYSCALL(exec)
 3ea:	b8 07 00 00 00       	mov    $0x7,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <open>:
SYSCALL(open)
 3f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <mknod>:
SYSCALL(mknod)
 3fa:	b8 11 00 00 00       	mov    $0x11,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <unlink>:
SYSCALL(unlink)
 402:	b8 12 00 00 00       	mov    $0x12,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <fstat>:
SYSCALL(fstat)
 40a:	b8 08 00 00 00       	mov    $0x8,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <link>:
SYSCALL(link)
 412:	b8 13 00 00 00       	mov    $0x13,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <mkdir>:
SYSCALL(mkdir)
 41a:	b8 14 00 00 00       	mov    $0x14,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <chdir>:
SYSCALL(chdir)
 422:	b8 09 00 00 00       	mov    $0x9,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <dup>:
SYSCALL(dup)
 42a:	b8 0a 00 00 00       	mov    $0xa,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <getpid>:
SYSCALL(getpid)
 432:	b8 0b 00 00 00       	mov    $0xb,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <sbrk>:
SYSCALL(sbrk)
 43a:	b8 0c 00 00 00       	mov    $0xc,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <sleep>:
SYSCALL(sleep)
 442:	b8 0d 00 00 00       	mov    $0xd,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <uptime>:
SYSCALL(uptime)
 44a:	b8 0e 00 00 00       	mov    $0xe,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 452:	b8 16 00 00 00       	mov    $0x16,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 45a:	b8 17 00 00 00       	mov    $0x17,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 462:	b8 18 00 00 00       	mov    $0x18,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 46a:	b8 19 00 00 00       	mov    $0x19,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 472:	b8 1a 00 00 00       	mov    $0x1a,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 47a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <kthread_join>:
SYSCALL(kthread_join)
 482:	b8 1c 00 00 00       	mov    $0x1c,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <kthread_exit>:
SYSCALL(kthread_exit)
 48a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 492:	b8 1e 00 00 00       	mov    $0x1e,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <kthread_yield>:
SYSCALL(kthread_yield)
 49a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 4a2:	b8 20 00 00 00       	mov    $0x20,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 4aa:	b8 21 00 00 00       	mov    $0x21,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    
 4b2:	66 90                	xchg   %ax,%ax
 4b4:	66 90                	xchg   %ax,%ax
 4b6:	66 90                	xchg   %ax,%ax
 4b8:	66 90                	xchg   %ax,%ax
 4ba:	66 90                	xchg   %ax,%ax
 4bc:	66 90                	xchg   %ax,%ax
 4be:	66 90                	xchg   %ax,%ax

000004c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	57                   	push   %edi
 4c4:	56                   	push   %esi
 4c5:	89 c6                	mov    %eax,%esi
 4c7:	53                   	push   %ebx
 4c8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ce:	85 db                	test   %ebx,%ebx
 4d0:	74 09                	je     4db <printint+0x1b>
 4d2:	89 d0                	mov    %edx,%eax
 4d4:	c1 e8 1f             	shr    $0x1f,%eax
 4d7:	84 c0                	test   %al,%al
 4d9:	75 75                	jne    550 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4db:	89 d0                	mov    %edx,%eax
  neg = 0;
 4dd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4e4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 4e7:	31 ff                	xor    %edi,%edi
 4e9:	89 ce                	mov    %ecx,%esi
 4eb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4ee:	eb 02                	jmp    4f2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 4f0:	89 cf                	mov    %ecx,%edi
 4f2:	31 d2                	xor    %edx,%edx
 4f4:	f7 f6                	div    %esi
 4f6:	8d 4f 01             	lea    0x1(%edi),%ecx
 4f9:	0f b6 92 a7 0b 00 00 	movzbl 0xba7(%edx),%edx
  }while((x /= base) != 0);
 500:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 502:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 505:	75 e9                	jne    4f0 <printint+0x30>
  if(neg)
 507:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 50a:	89 c8                	mov    %ecx,%eax
 50c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 50f:	85 d2                	test   %edx,%edx
 511:	74 08                	je     51b <printint+0x5b>
    buf[i++] = '-';
 513:	8d 4f 02             	lea    0x2(%edi),%ecx
 516:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 51b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 51e:	66 90                	xchg   %ax,%ax
 520:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 525:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 528:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52f:	00 
 530:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 534:	89 34 24             	mov    %esi,(%esp)
 537:	88 45 d7             	mov    %al,-0x29(%ebp)
 53a:	e8 93 fe ff ff       	call   3d2 <write>
  while(--i >= 0)
 53f:	83 ff ff             	cmp    $0xffffffff,%edi
 542:	75 dc                	jne    520 <printint+0x60>
    putc(fd, buf[i]);
}
 544:	83 c4 4c             	add    $0x4c,%esp
 547:	5b                   	pop    %ebx
 548:	5e                   	pop    %esi
 549:	5f                   	pop    %edi
 54a:	5d                   	pop    %ebp
 54b:	c3                   	ret    
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 550:	89 d0                	mov    %edx,%eax
 552:	f7 d8                	neg    %eax
    neg = 1;
 554:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 55b:	eb 87                	jmp    4e4 <printint+0x24>
 55d:	8d 76 00             	lea    0x0(%esi),%esi

00000560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 564:	31 ff                	xor    %edi,%edi
{
 566:	56                   	push   %esi
 567:	53                   	push   %ebx
 568:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 56b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 56e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 571:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 574:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 577:	0f b6 13             	movzbl (%ebx),%edx
 57a:	83 c3 01             	add    $0x1,%ebx
 57d:	84 d2                	test   %dl,%dl
 57f:	75 39                	jne    5ba <printf+0x5a>
 581:	e9 ca 00 00 00       	jmp    650 <printf+0xf0>
 586:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 588:	83 fa 25             	cmp    $0x25,%edx
 58b:	0f 84 c7 00 00 00    	je     658 <printf+0xf8>
  write(fd, &c, 1);
 591:	8d 45 e0             	lea    -0x20(%ebp),%eax
 594:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 59b:	00 
 59c:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 5a3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 5a6:	e8 27 fe ff ff       	call   3d2 <write>
 5ab:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 5ae:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 5b2:	84 d2                	test   %dl,%dl
 5b4:	0f 84 96 00 00 00    	je     650 <printf+0xf0>
    if(state == 0){
 5ba:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 5bc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 5bf:	74 c7                	je     588 <printf+0x28>
      }
    } else if(state == '%'){
 5c1:	83 ff 25             	cmp    $0x25,%edi
 5c4:	75 e5                	jne    5ab <printf+0x4b>
      if(c == 'd' || c == 'u'){
 5c6:	83 fa 75             	cmp    $0x75,%edx
 5c9:	0f 84 99 00 00 00    	je     668 <printf+0x108>
 5cf:	83 fa 64             	cmp    $0x64,%edx
 5d2:	0f 84 90 00 00 00    	je     668 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5d8:	25 f7 00 00 00       	and    $0xf7,%eax
 5dd:	83 f8 70             	cmp    $0x70,%eax
 5e0:	0f 84 aa 00 00 00    	je     690 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5e6:	83 fa 73             	cmp    $0x73,%edx
 5e9:	0f 84 e9 00 00 00    	je     6d8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ef:	83 fa 63             	cmp    $0x63,%edx
 5f2:	0f 84 2b 01 00 00    	je     723 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5f8:	83 fa 25             	cmp    $0x25,%edx
 5fb:	0f 84 4f 01 00 00    	je     750 <printf+0x1f0>
  write(fd, &c, 1);
 601:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 604:	83 c3 01             	add    $0x1,%ebx
 607:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 60e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 611:	89 44 24 04          	mov    %eax,0x4(%esp)
 615:	89 34 24             	mov    %esi,(%esp)
 618:	89 55 d0             	mov    %edx,-0x30(%ebp)
 61b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 61f:	e8 ae fd ff ff       	call   3d2 <write>
        putc(fd, c);
 624:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 627:	8d 45 e7             	lea    -0x19(%ebp),%eax
 62a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 631:	00 
 632:	89 44 24 04          	mov    %eax,0x4(%esp)
 636:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 639:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 63c:	e8 91 fd ff ff       	call   3d2 <write>
  for(i = 0; fmt[i]; i++){
 641:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 645:	84 d2                	test   %dl,%dl
 647:	0f 85 6d ff ff ff    	jne    5ba <printf+0x5a>
 64d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 650:	83 c4 3c             	add    $0x3c,%esp
 653:	5b                   	pop    %ebx
 654:	5e                   	pop    %esi
 655:	5f                   	pop    %edi
 656:	5d                   	pop    %ebp
 657:	c3                   	ret    
        state = '%';
 658:	bf 25 00 00 00       	mov    $0x25,%edi
 65d:	e9 49 ff ff ff       	jmp    5ab <printf+0x4b>
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 668:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 66f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 674:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 677:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 679:	8b 10                	mov    (%eax),%edx
 67b:	89 f0                	mov    %esi,%eax
 67d:	e8 3e fe ff ff       	call   4c0 <printint>
        ap++;
 682:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 686:	e9 20 ff ff ff       	jmp    5ab <printf+0x4b>
 68b:	90                   	nop
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 690:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 693:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 69a:	00 
 69b:	89 44 24 04          	mov    %eax,0x4(%esp)
 69f:	89 34 24             	mov    %esi,(%esp)
 6a2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 6a6:	e8 27 fd ff ff       	call   3d2 <write>
 6ab:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 6ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b5:	00 
 6b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ba:	89 34 24             	mov    %esi,(%esp)
 6bd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 6c1:	e8 0c fd ff ff       	call   3d2 <write>
        printint(fd, *ap, 16, 0);
 6c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 6cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6d2:	eb a0                	jmp    674 <printf+0x114>
 6d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 6db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 6df:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 6e1:	b8 a0 0b 00 00       	mov    $0xba0,%eax
 6e6:	85 ff                	test   %edi,%edi
 6e8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 6eb:	0f b6 07             	movzbl (%edi),%eax
 6ee:	84 c0                	test   %al,%al
 6f0:	74 2a                	je     71c <printf+0x1bc>
 6f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6f8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 6fb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 6fe:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 701:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 708:	00 
 709:	89 44 24 04          	mov    %eax,0x4(%esp)
 70d:	89 34 24             	mov    %esi,(%esp)
 710:	e8 bd fc ff ff       	call   3d2 <write>
        while(*s != 0){
 715:	0f b6 07             	movzbl (%edi),%eax
 718:	84 c0                	test   %al,%al
 71a:	75 dc                	jne    6f8 <printf+0x198>
      state = 0;
 71c:	31 ff                	xor    %edi,%edi
 71e:	e9 88 fe ff ff       	jmp    5ab <printf+0x4b>
        putc(fd, *ap);
 723:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 726:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 728:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 72a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 731:	00 
 732:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 735:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 738:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 73b:	89 44 24 04          	mov    %eax,0x4(%esp)
 73f:	e8 8e fc ff ff       	call   3d2 <write>
        ap++;
 744:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 748:	e9 5e fe ff ff       	jmp    5ab <printf+0x4b>
 74d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 750:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 753:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 755:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 75c:	00 
 75d:	89 44 24 04          	mov    %eax,0x4(%esp)
 761:	89 34 24             	mov    %esi,(%esp)
 764:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 768:	e8 65 fc ff ff       	call   3d2 <write>
 76d:	e9 39 fe ff ff       	jmp    5ab <printf+0x4b>
 772:	66 90                	xchg   %ax,%ax
 774:	66 90                	xchg   %ax,%ax
 776:	66 90                	xchg   %ax,%ax
 778:	66 90                	xchg   %ax,%ax
 77a:	66 90                	xchg   %ax,%ax
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	a1 80 10 00 00       	mov    0x1080,%eax
{
 786:	89 e5                	mov    %esp,%ebp
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	53                   	push   %ebx
 78b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 790:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 793:	39 d0                	cmp    %edx,%eax
 795:	72 11                	jb     7a8 <free+0x28>
 797:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 798:	39 c8                	cmp    %ecx,%eax
 79a:	72 04                	jb     7a0 <free+0x20>
 79c:	39 ca                	cmp    %ecx,%edx
 79e:	72 10                	jb     7b0 <free+0x30>
 7a0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a6:	73 f0                	jae    798 <free+0x18>
 7a8:	39 ca                	cmp    %ecx,%edx
 7aa:	72 04                	jb     7b0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ac:	39 c8                	cmp    %ecx,%eax
 7ae:	72 f0                	jb     7a0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 7b6:	39 cf                	cmp    %ecx,%edi
 7b8:	74 1e                	je     7d8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7ba:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bd:	8b 48 04             	mov    0x4(%eax),%ecx
 7c0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 7c3:	39 f2                	cmp    %esi,%edx
 7c5:	74 28                	je     7ef <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7c7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7c9:	a3 80 10 00 00       	mov    %eax,0x1080
}
 7ce:	5b                   	pop    %ebx
 7cf:	5e                   	pop    %esi
 7d0:	5f                   	pop    %edi
 7d1:	5d                   	pop    %ebp
 7d2:	c3                   	ret    
 7d3:	90                   	nop
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7d8:	03 71 04             	add    0x4(%ecx),%esi
 7db:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7de:	8b 08                	mov    (%eax),%ecx
 7e0:	8b 09                	mov    (%ecx),%ecx
 7e2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7e5:	8b 48 04             	mov    0x4(%eax),%ecx
 7e8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 7eb:	39 f2                	cmp    %esi,%edx
 7ed:	75 d8                	jne    7c7 <free+0x47>
    p->s.size += bp->s.size;
 7ef:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 7f2:	a3 80 10 00 00       	mov    %eax,0x1080
    p->s.size += bp->s.size;
 7f7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7fa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7fd:	89 10                	mov    %edx,(%eax)
}
 7ff:	5b                   	pop    %ebx
 800:	5e                   	pop    %esi
 801:	5f                   	pop    %edi
 802:	5d                   	pop    %ebp
 803:	c3                   	ret    
 804:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000810 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 819:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 81c:	8b 1d 80 10 00 00    	mov    0x1080,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 822:	8d 48 07             	lea    0x7(%eax),%ecx
 825:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 828:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 82a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 82d:	0f 84 9b 00 00 00    	je     8ce <malloc+0xbe>
 833:	8b 13                	mov    (%ebx),%edx
 835:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 838:	39 fe                	cmp    %edi,%esi
 83a:	76 64                	jbe    8a0 <malloc+0x90>
 83c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 843:	bb 00 80 00 00       	mov    $0x8000,%ebx
 848:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 84b:	eb 0e                	jmp    85b <malloc+0x4b>
 84d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 850:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 852:	8b 78 04             	mov    0x4(%eax),%edi
 855:	39 fe                	cmp    %edi,%esi
 857:	76 4f                	jbe    8a8 <malloc+0x98>
 859:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 85b:	3b 15 80 10 00 00    	cmp    0x1080,%edx
 861:	75 ed                	jne    850 <malloc+0x40>
  if(nu < 4096)
 863:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 866:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 86c:	bf 00 10 00 00       	mov    $0x1000,%edi
 871:	0f 43 fe             	cmovae %esi,%edi
 874:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 877:	89 04 24             	mov    %eax,(%esp)
 87a:	e8 bb fb ff ff       	call   43a <sbrk>
  if(p == (char*)-1)
 87f:	83 f8 ff             	cmp    $0xffffffff,%eax
 882:	74 18                	je     89c <malloc+0x8c>
  hp->s.size = nu;
 884:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 887:	83 c0 08             	add    $0x8,%eax
 88a:	89 04 24             	mov    %eax,(%esp)
 88d:	e8 ee fe ff ff       	call   780 <free>
  return freep;
 892:	8b 15 80 10 00 00    	mov    0x1080,%edx
      if((p = morecore(nunits)) == 0)
 898:	85 d2                	test   %edx,%edx
 89a:	75 b4                	jne    850 <malloc+0x40>
        return 0;
 89c:	31 c0                	xor    %eax,%eax
 89e:	eb 20                	jmp    8c0 <malloc+0xb0>
    if(p->s.size >= nunits){
 8a0:	89 d0                	mov    %edx,%eax
 8a2:	89 da                	mov    %ebx,%edx
 8a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8a8:	39 fe                	cmp    %edi,%esi
 8aa:	74 1c                	je     8c8 <malloc+0xb8>
        p->s.size -= nunits;
 8ac:	29 f7                	sub    %esi,%edi
 8ae:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 8b1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 8b4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8b7:	89 15 80 10 00 00    	mov    %edx,0x1080
      return (void*)(p + 1);
 8bd:	83 c0 08             	add    $0x8,%eax
  }
}
 8c0:	83 c4 1c             	add    $0x1c,%esp
 8c3:	5b                   	pop    %ebx
 8c4:	5e                   	pop    %esi
 8c5:	5f                   	pop    %edi
 8c6:	5d                   	pop    %ebp
 8c7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8c8:	8b 08                	mov    (%eax),%ecx
 8ca:	89 0a                	mov    %ecx,(%edx)
 8cc:	eb e9                	jmp    8b7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 8ce:	c7 05 80 10 00 00 84 	movl   $0x1084,0x1080
 8d5:	10 00 00 
    base.s.size = 0;
 8d8:	ba 84 10 00 00       	mov    $0x1084,%edx
    base.s.ptr = freep = prevp = &base;
 8dd:	c7 05 84 10 00 00 84 	movl   $0x1084,0x1084
 8e4:	10 00 00 
    base.s.size = 0;
 8e7:	c7 05 88 10 00 00 00 	movl   $0x0,0x1088
 8ee:	00 00 00 
 8f1:	e9 46 ff ff ff       	jmp    83c <malloc+0x2c>
 8f6:	66 90                	xchg   %ax,%ax
 8f8:	66 90                	xchg   %ax,%ax
 8fa:	66 90                	xchg   %ax,%ax
 8fc:	66 90                	xchg   %ax,%ax
 8fe:	66 90                	xchg   %ax,%ax

00000900 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	56                   	push   %esi
 904:	53                   	push   %ebx
 905:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 908:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 90f:	e8 fc fe ff ff       	call   810 <malloc>

    if (bt == NULL) {
 914:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 916:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 918:	74 66                	je     980 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 91a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 921:	e8 ea fe ff ff       	call   810 <malloc>
    if (bt->bt_stack == NULL) {
 926:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 928:	89 c3                	mov    %eax,%ebx
 92a:	89 46 08             	mov    %eax,0x8(%esi)
 92d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 930:	74 5d                	je     98f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 932:	25 ff 0f 00 00       	and    $0xfff,%eax
 937:	75 37                	jne    970 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 939:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 93f:	8b 45 10             	mov    0x10(%ebp),%eax
 942:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 946:	89 44 24 04          	mov    %eax,0x4(%esp)
 94a:	8b 45 0c             	mov    0xc(%ebp),%eax
 94d:	89 04 24             	mov    %eax,(%esp)
 950:	e8 25 fb ff ff       	call   47a <kthread_create>
    if (bt->bid != 0) {
 955:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 957:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 959:	74 2d                	je     988 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 95b:	8b 45 08             	mov    0x8(%ebp),%eax
 95e:	89 30                	mov    %esi,(%eax)
        result = 0;
 960:	31 c0                	xor    %eax,%eax
}
 962:	83 c4 10             	add    $0x10,%esp
 965:	5b                   	pop    %ebx
 966:	5e                   	pop    %esi
 967:	5d                   	pop    %ebp
 968:	c3                   	ret    
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 970:	29 c3                	sub    %eax,%ebx
 972:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 978:	89 5e 04             	mov    %ebx,0x4(%esi)
 97b:	eb bc                	jmp    939 <benny_thread_create+0x39>
 97d:	8d 76 00             	lea    0x0(%esi),%esi
 980:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 986:	eb b7                	jmp    93f <benny_thread_create+0x3f>
    int result = -1;
 988:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 98d:	eb d3                	jmp    962 <benny_thread_create+0x62>
        free(bt);
 98f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 992:	31 f6                	xor    %esi,%esi
        free(bt);
 994:	e8 e7 fd ff ff       	call   780 <free>
 999:	8b 5b 04             	mov    0x4(%ebx),%ebx
 99c:	eb a1                	jmp    93f <benny_thread_create+0x3f>
 99e:	66 90                	xchg   %ax,%ax

000009a0 <benny_thread_bid>:
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 9a3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9a6:	5d                   	pop    %ebp
    return bt->bid;
 9a7:	8b 00                	mov    (%eax),%eax
}
 9a9:	c3                   	ret    
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000009b0 <benny_thread_join>:
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	53                   	push   %ebx
 9b4:	83 ec 14             	sub    $0x14,%esp
 9b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 9ba:	8b 03                	mov    (%ebx),%eax
 9bc:	89 04 24             	mov    %eax,(%esp)
 9bf:	e8 be fa ff ff       	call   482 <kthread_join>
    if (retVal == 0) {
 9c4:	85 c0                	test   %eax,%eax
 9c6:	75 27                	jne    9ef <benny_thread_join+0x3f>
        free(bt->mem_stack);
 9c8:	8b 53 08             	mov    0x8(%ebx),%edx
 9cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9ce:	89 14 24             	mov    %edx,(%esp)
 9d1:	e8 aa fd ff ff       	call   780 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 9d6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 9dd:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 9e4:	89 1c 24             	mov    %ebx,(%esp)
 9e7:	e8 94 fd ff ff       	call   780 <free>
 9ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 9ef:	83 c4 14             	add    $0x14,%esp
 9f2:	5b                   	pop    %ebx
 9f3:	5d                   	pop    %ebp
 9f4:	c3                   	ret    
 9f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a00 <benny_thread_exit>:
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
}
 a03:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 a04:	e9 81 fa ff ff       	jmp    48a <kthread_exit>
 a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a10 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 a10:	55                   	push   %ebp
 a11:	89 e5                	mov    %esp,%ebp
 a13:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 a16:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 a1c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 a23:	31 c0                	xor    %eax,%eax
 a25:	5d                   	pop    %ebp
 a26:	c3                   	ret    
 a27:	89 f6                	mov    %esi,%esi
 a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a30 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 a30:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a31:	b8 01 00 00 00       	mov    $0x1,%eax
 a36:	89 e5                	mov    %esp,%ebp
 a38:	56                   	push   %esi
 a39:	53                   	push   %ebx
 a3a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a3d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 a40:	85 c0                	test   %eax,%eax
 a42:	be 01 00 00 00       	mov    $0x1,%esi
 a47:	74 15                	je     a5e <benny_mootex_yieldlock+0x2e>
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 a50:	e8 45 fa ff ff       	call   49a <kthread_yield>
 a55:	89 f0                	mov    %esi,%eax
 a57:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a5a:	85 c0                	test   %eax,%eax
 a5c:	75 f2                	jne    a50 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 a5e:	e8 2f fa ff ff       	call   492 <kthread_self>
    benny_mootex->bid = benny_self();
 a63:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a66:	31 c0                	xor    %eax,%eax
 a68:	5b                   	pop    %ebx
 a69:	5e                   	pop    %esi
 a6a:	5d                   	pop    %ebp
 a6b:	c3                   	ret    
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <benny_mootex_spinlock>:
{
 a70:	55                   	push   %ebp
 a71:	ba 01 00 00 00       	mov    $0x1,%edx
 a76:	89 e5                	mov    %esp,%ebp
 a78:	53                   	push   %ebx
 a79:	83 ec 04             	sub    $0x4,%esp
 a7c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 a7f:	90                   	nop
 a80:	89 d0                	mov    %edx,%eax
 a82:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 a85:	85 c0                	test   %eax,%eax
 a87:	75 f7                	jne    a80 <benny_mootex_spinlock+0x10>
    return kthread_self();
 a89:	e8 04 fa ff ff       	call   492 <kthread_self>
    benny_mootex->bid = benny_self();
 a8e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 a91:	83 c4 04             	add    $0x4,%esp
 a94:	31 c0                	xor    %eax,%eax
 a96:	5b                   	pop    %ebx
 a97:	5d                   	pop    %ebp
 a98:	c3                   	ret    
 a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <benny_mootex_unlock>:
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	53                   	push   %ebx
 aa4:	83 ec 04             	sub    $0x4,%esp
 aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 aaa:	e8 e3 f9 ff ff       	call   492 <kthread_self>
    if(tid == benny_mootex->bid){
 aaf:	39 43 04             	cmp    %eax,0x4(%ebx)
 ab2:	75 1c                	jne    ad0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 ab4:	0f ae f0             	mfence 
    return 0;
 ab7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 ab9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 ac0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 ac6:	83 c4 04             	add    $0x4,%esp
 ac9:	5b                   	pop    %ebx
 aca:	5d                   	pop    %ebp
 acb:	c3                   	ret    
 acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ad0:	83 c4 04             	add    $0x4,%esp
      return -1;
 ad3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 ad8:	5b                   	pop    %ebx
 ad9:	5d                   	pop    %ebp
 ada:	c3                   	ret    
 adb:	90                   	nop
 adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ae0 <benny_mootex_trylock>:
{
 ae0:	55                   	push   %ebp
 ae1:	b8 01 00 00 00       	mov    $0x1,%eax
 ae6:	89 e5                	mov    %esp,%ebp
 ae8:	53                   	push   %ebx
 ae9:	83 ec 04             	sub    $0x4,%esp
 aec:	8b 5d 08             	mov    0x8(%ebp),%ebx
 aef:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 af2:	85 c0                	test   %eax,%eax
 af4:	75 08                	jne    afe <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 af6:	e8 97 f9 ff ff       	call   492 <kthread_self>
        benny_mootex->bid = tid;
 afb:	89 43 04             	mov    %eax,0x4(%ebx)
}
 afe:	83 c4 04             	add    $0x4,%esp
 b01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b06:	5b                   	pop    %ebx
 b07:	5d                   	pop    %ebp
 b08:	c3                   	ret    
 b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b10 <benny_mootex_wholock>:
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 b13:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b16:	5d                   	pop    %ebp
    return benny_mootex->bid;
 b17:	8b 40 04             	mov    0x4(%eax),%eax
}
 b1a:	c3                   	ret    
 b1b:	90                   	nop
 b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b20 <benny_mootex_islocked>:
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 b23:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b26:	5d                   	pop    %ebp
    return benny_mootex->locked;
 b27:	8b 00                	mov    (%eax),%eax
}
 b29:	c3                   	ret    
 b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b30 <benny_self>:
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
}
 b33:	5d                   	pop    %ebp
    return kthread_self();
 b34:	e9 59 f9 ff ff       	jmp    492 <kthread_self>
 b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b40 <benny_yield>:
{
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
    
}
 b43:	5d                   	pop    %ebp
    return kthread_yield();
 b44:	e9 51 f9 ff ff       	jmp    49a <kthread_yield>
 b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b50 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 b53:	5d                   	pop    %ebp
    return kthread_cpu_count();
 b54:	e9 49 f9 ff ff       	jmp    4a2 <kthread_cpu_count>
 b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b60 <benny_thread_count>:

int
benny_thread_count(void)
{
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 b63:	5d                   	pop    %ebp
    return kthread_thread_count();
 b64:	e9 41 f9 ff ff       	jmp    4aa <kthread_thread_count>
