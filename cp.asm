
_cp:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void cp(char *, char *);

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	81 ec c0 00 00 00    	sub    $0xc0,%esp
   f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  12:	8b 7d 0c             	mov    0xc(%ebp),%edi
    int res;
    char *oname;
    struct stat st;
    char dirstr[DIRSTR];

    if (argc < 3) {
  15:	83 fb 02             	cmp    $0x2,%ebx
  18:	7f 19                	jg     33 <main+0x33>
        printf(2, "must have at least 2 arguments\n");
  1a:	c7 44 24 04 50 0c 00 	movl   $0xc50,0x4(%esp)
  21:	00 
  22:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  29:	e8 c2 05 00 00       	call   5f0 <printf>
        exit();
  2e:	e8 0f 04 00 00       	call   442 <exit>
    }

    // cp f1 f2
    oname = argv[argc - 1];
  33:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  37:	89 c1                	mov    %eax,%ecx
  39:	89 44 24 18          	mov    %eax,0x18(%esp)
    res = stat(oname, &st);
  3d:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  41:	89 44 24 04          	mov    %eax,0x4(%esp)
  45:	89 0c 24             	mov    %ecx,(%esp)
  48:	e8 43 03 00 00       	call   390 <stat>
    if (res < 0) {
  4d:	85 c0                	test   %eax,%eax
  4f:	78 11                	js     62 <main+0x62>
        // in form of
        //   cp f1 f2
        cp(oname, argv[1]);
    }
    else {
        switch (st.type) {
  51:	0f b7 44 24 2c       	movzwl 0x2c(%esp),%eax
  56:	66 83 f8 01          	cmp    $0x1,%ax
  5a:	74 37                	je     93 <main+0x93>
  5c:	66 83 f8 02          	cmp    $0x2,%ax
  60:	75 18                	jne    7a <main+0x7a>
        case T_FILE:
            //   cp f1 f2
            cp(oname, argv[1]);
  62:	8b 47 04             	mov    0x4(%edi),%eax
  65:	89 44 24 04          	mov    %eax,0x4(%esp)
  69:	8b 44 24 18          	mov    0x18(%esp),%eax
  6d:	89 04 24             	mov    %eax,(%esp)
  70:	e8 ab 00 00 00       	call   120 <cp>
            exit();
            break;
        }
    }

    exit();
  75:	e8 c8 03 00 00       	call   442 <exit>
            printf(2, "cannot copy to a device\n");
  7a:	c7 44 24 04 36 0c 00 	movl   $0xc36,0x4(%esp)
  81:	00 
  82:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  89:	e8 62 05 00 00       	call   5f0 <printf>
            exit();
  8e:	e8 af 03 00 00       	call   442 <exit>
  93:	8d 43 ff             	lea    -0x1(%ebx),%eax
        switch (st.type) {
  96:	be 01 00 00 00       	mov    $0x1,%esi
  9b:	89 44 24 14          	mov    %eax,0x14(%esp)
  9f:	8d 5c 24 40          	lea    0x40(%esp),%ebx
  a3:	90                   	nop
  a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                memset(dirstr, 0, DIRSTR);
  a8:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
  af:	00 
  b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  b7:	00 
  b8:	89 1c 24             	mov    %ebx,(%esp)
  bb:	e8 10 02 00 00       	call   2d0 <memset>
                strcpy(dirstr, oname);
  c0:	8b 44 24 18          	mov    0x18(%esp),%eax
  c4:	89 1c 24             	mov    %ebx,(%esp)
  c7:	89 44 24 04          	mov    %eax,0x4(%esp)
  cb:	e8 50 01 00 00       	call   220 <strcpy>
                dirstr[strlen(dirstr)] = '/';
  d0:	89 1c 24             	mov    %ebx,(%esp)
  d3:	e8 c8 01 00 00       	call   2a0 <strlen>
                strcpy(&(dirstr[strlen(dirstr)]), argv[i]);
  d8:	8b 14 b7             	mov    (%edi,%esi,4),%edx
  db:	89 54 24 1c          	mov    %edx,0x1c(%esp)
                dirstr[strlen(dirstr)] = '/';
  df:	c6 44 04 40 2f       	movb   $0x2f,0x40(%esp,%eax,1)
                strcpy(&(dirstr[strlen(dirstr)]), argv[i]);
  e4:	89 1c 24             	mov    %ebx,(%esp)
  e7:	e8 b4 01 00 00       	call   2a0 <strlen>
  ec:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  f0:	89 54 24 04          	mov    %edx,0x4(%esp)
  f4:	01 d8                	add    %ebx,%eax
  f6:	89 04 24             	mov    %eax,(%esp)
  f9:	e8 22 01 00 00       	call   220 <strcpy>
                cp(dirstr, argv[i]);
  fe:	8b 04 b7             	mov    (%edi,%esi,4),%eax
            for (i = 1; i < (argc - 1); i++) {
 101:	83 c6 01             	add    $0x1,%esi
                cp(dirstr, argv[i]);
 104:	89 1c 24             	mov    %ebx,(%esp)
 107:	89 44 24 04          	mov    %eax,0x4(%esp)
 10b:	e8 10 00 00 00       	call   120 <cp>
            for (i = 1; i < (argc - 1); i++) {
 110:	3b 74 24 14          	cmp    0x14(%esp),%esi
 114:	75 92                	jne    a8 <main+0xa8>
 116:	e9 5a ff ff ff       	jmp    75 <main+0x75>
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <cp>:
}

void
cp(char *oname, char *iname)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	53                   	push   %ebx
 126:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
 12c:	8b 7d 0c             	mov    0xc(%ebp),%edi
    int res = -1;
    struct stat st;
    int flags;
    char buf[BUFSIZE];

    if ((ifd = open(iname, O_RDONLY)) >= 0) {
 12f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 136:	00 
{
 137:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if ((ifd = open(iname, O_RDONLY)) >= 0) {
 13a:	89 3c 24             	mov    %edi,(%esp)
 13d:	e8 40 03 00 00       	call   482 <open>
 142:	85 c0                	test   %eax,%eax
 144:	89 c6                	mov    %eax,%esi
 146:	0f 88 83 00 00 00    	js     1cf <cp+0xaf>
        res = stat(oname, &st);
 14c:	8d 85 d4 fd ff ff    	lea    -0x22c(%ebp),%eax
 152:	89 44 24 04          	mov    %eax,0x4(%esp)
 156:	89 1c 24             	mov    %ebx,(%esp)
 159:	e8 32 02 00 00       	call   390 <stat>
        if (res >= 0) {
 15e:	85 c0                	test   %eax,%eax
 160:	78 08                	js     16a <cp+0x4a>
            unlink(oname);
 162:	89 1c 24             	mov    %ebx,(%esp)
 165:	e8 28 03 00 00       	call   492 <unlink>
        }
        flags = O_WRONLY | O_CREATE;
        if ((ofd = open(oname, flags)) >= 0) {
 16a:	c7 44 24 04 01 02 00 	movl   $0x201,0x4(%esp)
 171:	00 
 172:	89 1c 24             	mov    %ebx,(%esp)
 175:	e8 08 03 00 00       	call   482 <open>
 17a:	85 c0                	test   %eax,%eax
 17c:	89 c7                	mov    %eax,%edi
 17e:	78 6c                	js     1ec <cp+0xcc>
 180:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
 186:	eb 14                	jmp    19c <cp+0x7c>
            for ( ; ((n = read(ifd, buf, BUFSIZE)) > 0) && ((res = write(ofd, buf, n))); ) ;
 188:	89 44 24 08          	mov    %eax,0x8(%esp)
 18c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 190:	89 3c 24             	mov    %edi,(%esp)
 193:	e8 ca 02 00 00       	call   462 <write>
 198:	85 c0                	test   %eax,%eax
 19a:	74 18                	je     1b4 <cp+0x94>
 19c:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 1a3:	00 
 1a4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 1a8:	89 34 24             	mov    %esi,(%esp)
 1ab:	e8 aa 02 00 00       	call   45a <read>
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7f d4                	jg     188 <cp+0x68>
            close(ofd);
 1b4:	89 3c 24             	mov    %edi,(%esp)
 1b7:	e8 ae 02 00 00       	call   46a <close>
            close(ifd);
 1bc:	89 34 24             	mov    %esi,(%esp)
 1bf:	e8 a6 02 00 00       	call   46a <close>
    }
    else {
        printf(2, "could not open i/p file  %s\n", iname);
        exit();
    }
}
 1c4:	81 c4 3c 02 00 00    	add    $0x23c,%esp
 1ca:	5b                   	pop    %ebx
 1cb:	5e                   	pop    %esi
 1cc:	5f                   	pop    %edi
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    
        printf(2, "could not open i/p file  %s\n", iname);
 1cf:	89 7c 24 08          	mov    %edi,0x8(%esp)
 1d3:	c7 44 24 04 19 0c 00 	movl   $0xc19,0x4(%esp)
 1da:	00 
 1db:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 1e2:	e8 09 04 00 00       	call   5f0 <printf>
        exit();
 1e7:	e8 56 02 00 00       	call   442 <exit>
            printf(2, "could not open o/p file  %s\n", oname);
 1ec:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 1f0:	c7 44 24 04 fc 0b 00 	movl   $0xbfc,0x4(%esp)
 1f7:	00 
 1f8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 1ff:	e8 ec 03 00 00       	call   5f0 <printf>
            close(ifd);
 204:	89 34 24             	mov    %esi,(%esp)
 207:	e8 5e 02 00 00       	call   46a <close>
            exit();
 20c:	e8 31 02 00 00       	call   442 <exit>
 211:	66 90                	xchg   %ax,%ax
 213:	66 90                	xchg   %ax,%ax
 215:	66 90                	xchg   %ax,%ax
 217:	66 90                	xchg   %ax,%ax
 219:	66 90                	xchg   %ax,%ax
 21b:	66 90                	xchg   %ax,%ax
 21d:	66 90                	xchg   %ax,%ax
 21f:	90                   	nop

00000220 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 229:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 22a:	89 c2                	mov    %eax,%edx
 22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 230:	83 c1 01             	add    $0x1,%ecx
 233:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 237:	83 c2 01             	add    $0x1,%edx
 23a:	84 db                	test   %bl,%bl
 23c:	88 5a ff             	mov    %bl,-0x1(%edx)
 23f:	75 ef                	jne    230 <strcpy+0x10>
    ;
  return os;
}
 241:	5b                   	pop    %ebx
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
 244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 24a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000250 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 55 08             	mov    0x8(%ebp),%edx
 256:	53                   	push   %ebx
 257:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 25a:	0f b6 02             	movzbl (%edx),%eax
 25d:	84 c0                	test   %al,%al
 25f:	74 2d                	je     28e <strcmp+0x3e>
 261:	0f b6 19             	movzbl (%ecx),%ebx
 264:	38 d8                	cmp    %bl,%al
 266:	74 0e                	je     276 <strcmp+0x26>
 268:	eb 2b                	jmp    295 <strcmp+0x45>
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 270:	38 c8                	cmp    %cl,%al
 272:	75 15                	jne    289 <strcmp+0x39>
    p++, q++;
 274:	89 d9                	mov    %ebx,%ecx
 276:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 279:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 27c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 27f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 283:	84 c0                	test   %al,%al
 285:	75 e9                	jne    270 <strcmp+0x20>
 287:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 289:	29 c8                	sub    %ecx,%eax
}
 28b:	5b                   	pop    %ebx
 28c:	5d                   	pop    %ebp
 28d:	c3                   	ret    
 28e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 291:	31 c0                	xor    %eax,%eax
 293:	eb f4                	jmp    289 <strcmp+0x39>
 295:	0f b6 cb             	movzbl %bl,%ecx
 298:	eb ef                	jmp    289 <strcmp+0x39>
 29a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002a0 <strlen>:

uint
strlen(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2a6:	80 39 00             	cmpb   $0x0,(%ecx)
 2a9:	74 12                	je     2bd <strlen+0x1d>
 2ab:	31 d2                	xor    %edx,%edx
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	75 f5                	jne    2b0 <strlen+0x10>
    ;
  return n;
}
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
  for(n = 0; s[n]; n++)
 2bd:	31 c0                	xor    %eax,%eax
}
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	eb 0d                	jmp    2d0 <memset>
 2c3:	90                   	nop
 2c4:	90                   	nop
 2c5:	90                   	nop
 2c6:	90                   	nop
 2c7:	90                   	nop
 2c8:	90                   	nop
 2c9:	90                   	nop
 2ca:	90                   	nop
 2cb:	90                   	nop
 2cc:	90                   	nop
 2cd:	90                   	nop
 2ce:	90                   	nop
 2cf:	90                   	nop

000002d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 55 08             	mov    0x8(%ebp),%edx
 2d6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	89 d7                	mov    %edx,%edi
 2df:	fc                   	cld    
 2e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2e2:	89 d0                	mov    %edx,%eax
 2e4:	5f                   	pop    %edi
 2e5:	5d                   	pop    %ebp
 2e6:	c3                   	ret    
 2e7:	89 f6                	mov    %esi,%esi
 2e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002f0 <strchr>:

char*
strchr(const char *s, char c)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	53                   	push   %ebx
 2f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 2fa:	0f b6 18             	movzbl (%eax),%ebx
 2fd:	84 db                	test   %bl,%bl
 2ff:	74 1d                	je     31e <strchr+0x2e>
    if(*s == c)
 301:	38 d3                	cmp    %dl,%bl
 303:	89 d1                	mov    %edx,%ecx
 305:	75 0d                	jne    314 <strchr+0x24>
 307:	eb 17                	jmp    320 <strchr+0x30>
 309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 310:	38 ca                	cmp    %cl,%dl
 312:	74 0c                	je     320 <strchr+0x30>
  for(; *s; s++)
 314:	83 c0 01             	add    $0x1,%eax
 317:	0f b6 10             	movzbl (%eax),%edx
 31a:	84 d2                	test   %dl,%dl
 31c:	75 f2                	jne    310 <strchr+0x20>
      return (char*)s;
  return 0;
 31e:	31 c0                	xor    %eax,%eax
}
 320:	5b                   	pop    %ebx
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <gets>:

char*
gets(char *buf, int max)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 335:	31 f6                	xor    %esi,%esi
{
 337:	53                   	push   %ebx
 338:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 33b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 33e:	eb 31                	jmp    371 <gets+0x41>
    cc = read(0, &c, 1);
 340:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 347:	00 
 348:	89 7c 24 04          	mov    %edi,0x4(%esp)
 34c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 353:	e8 02 01 00 00       	call   45a <read>
    if(cc < 1)
 358:	85 c0                	test   %eax,%eax
 35a:	7e 1d                	jle    379 <gets+0x49>
      break;
    buf[i++] = c;
 35c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 360:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 362:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 365:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 367:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 36b:	74 0c                	je     379 <gets+0x49>
 36d:	3c 0a                	cmp    $0xa,%al
 36f:	74 08                	je     379 <gets+0x49>
  for(i=0; i+1 < max; ){
 371:	8d 5e 01             	lea    0x1(%esi),%ebx
 374:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 377:	7c c7                	jl     340 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 379:	8b 45 08             	mov    0x8(%ebp),%eax
 37c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 380:	83 c4 2c             	add    $0x2c,%esp
 383:	5b                   	pop    %ebx
 384:	5e                   	pop    %esi
 385:	5f                   	pop    %edi
 386:	5d                   	pop    %ebp
 387:	c3                   	ret    
 388:	90                   	nop
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <stat>:

int
stat(const char *n, struct stat *st)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
 395:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3a2:	00 
 3a3:	89 04 24             	mov    %eax,(%esp)
 3a6:	e8 d7 00 00 00       	call   482 <open>
  if(fd < 0)
 3ab:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 3ad:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 3af:	78 27                	js     3d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 3b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b4:	89 1c 24             	mov    %ebx,(%esp)
 3b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 3bb:	e8 da 00 00 00       	call   49a <fstat>
  close(fd);
 3c0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3c3:	89 c6                	mov    %eax,%esi
  close(fd);
 3c5:	e8 a0 00 00 00       	call   46a <close>
  return r;
 3ca:	89 f0                	mov    %esi,%eax
}
 3cc:	83 c4 10             	add    $0x10,%esp
 3cf:	5b                   	pop    %ebx
 3d0:	5e                   	pop    %esi
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    
 3d3:	90                   	nop
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3dd:	eb ed                	jmp    3cc <stat+0x3c>
 3df:	90                   	nop

000003e0 <atoi>:

int
atoi(const char *s)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3e6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e7:	0f be 11             	movsbl (%ecx),%edx
 3ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 3ed:	3c 09                	cmp    $0x9,%al
  n = 0;
 3ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 3f4:	77 17                	ja     40d <atoi+0x2d>
 3f6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3f8:	83 c1 01             	add    $0x1,%ecx
 3fb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 3fe:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 402:	0f be 11             	movsbl (%ecx),%edx
 405:	8d 5a d0             	lea    -0x30(%edx),%ebx
 408:	80 fb 09             	cmp    $0x9,%bl
 40b:	76 eb                	jbe    3f8 <atoi+0x18>
  return n;
}
 40d:	5b                   	pop    %ebx
 40e:	5d                   	pop    %ebp
 40f:	c3                   	ret    

00000410 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 410:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 411:	31 d2                	xor    %edx,%edx
{
 413:	89 e5                	mov    %esp,%ebp
 415:	56                   	push   %esi
 416:	8b 45 08             	mov    0x8(%ebp),%eax
 419:	53                   	push   %ebx
 41a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 41d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 420:	85 db                	test   %ebx,%ebx
 422:	7e 12                	jle    436 <memmove+0x26>
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 428:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 42c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 42f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 432:	39 da                	cmp    %ebx,%edx
 434:	75 f2                	jne    428 <memmove+0x18>
  return vdst;
}
 436:	5b                   	pop    %ebx
 437:	5e                   	pop    %esi
 438:	5d                   	pop    %ebp
 439:	c3                   	ret    

0000043a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 43a:	b8 01 00 00 00       	mov    $0x1,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <exit>:
SYSCALL(exit)
 442:	b8 02 00 00 00       	mov    $0x2,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <wait>:
SYSCALL(wait)
 44a:	b8 03 00 00 00       	mov    $0x3,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <pipe>:
SYSCALL(pipe)
 452:	b8 04 00 00 00       	mov    $0x4,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <read>:
SYSCALL(read)
 45a:	b8 05 00 00 00       	mov    $0x5,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <write>:
SYSCALL(write)
 462:	b8 10 00 00 00       	mov    $0x10,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <close>:
SYSCALL(close)
 46a:	b8 15 00 00 00       	mov    $0x15,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <kill>:
SYSCALL(kill)
 472:	b8 06 00 00 00       	mov    $0x6,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <exec>:
SYSCALL(exec)
 47a:	b8 07 00 00 00       	mov    $0x7,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <open>:
SYSCALL(open)
 482:	b8 0f 00 00 00       	mov    $0xf,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <mknod>:
SYSCALL(mknod)
 48a:	b8 11 00 00 00       	mov    $0x11,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <unlink>:
SYSCALL(unlink)
 492:	b8 12 00 00 00       	mov    $0x12,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <fstat>:
SYSCALL(fstat)
 49a:	b8 08 00 00 00       	mov    $0x8,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <link>:
SYSCALL(link)
 4a2:	b8 13 00 00 00       	mov    $0x13,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <mkdir>:
SYSCALL(mkdir)
 4aa:	b8 14 00 00 00       	mov    $0x14,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <chdir>:
SYSCALL(chdir)
 4b2:	b8 09 00 00 00       	mov    $0x9,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <dup>:
SYSCALL(dup)
 4ba:	b8 0a 00 00 00       	mov    $0xa,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <getpid>:
SYSCALL(getpid)
 4c2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <sbrk>:
SYSCALL(sbrk)
 4ca:	b8 0c 00 00 00       	mov    $0xc,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <sleep>:
SYSCALL(sleep)
 4d2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <uptime>:
SYSCALL(uptime)
 4da:	b8 0e 00 00 00       	mov    $0xe,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 4e2:	b8 16 00 00 00       	mov    $0x16,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 4ea:	b8 17 00 00 00       	mov    $0x17,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 4f2:	b8 18 00 00 00       	mov    $0x18,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 4fa:	b8 19 00 00 00       	mov    $0x19,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 502:	b8 1a 00 00 00       	mov    $0x1a,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 50a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <kthread_join>:
SYSCALL(kthread_join)
 512:	b8 1c 00 00 00       	mov    $0x1c,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <kthread_exit>:
SYSCALL(kthread_exit)
 51a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 522:	b8 1e 00 00 00       	mov    $0x1e,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <kthread_yield>:
SYSCALL(kthread_yield)
 52a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 532:	b8 20 00 00 00       	mov    $0x20,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 53a:	b8 21 00 00 00       	mov    $0x21,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    
 542:	66 90                	xchg   %ax,%ax
 544:	66 90                	xchg   %ax,%ax
 546:	66 90                	xchg   %ax,%ax
 548:	66 90                	xchg   %ax,%ax
 54a:	66 90                	xchg   %ax,%ax
 54c:	66 90                	xchg   %ax,%ax
 54e:	66 90                	xchg   %ax,%ax

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	89 c6                	mov    %eax,%esi
 557:	53                   	push   %ebx
 558:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 55b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 55e:	85 db                	test   %ebx,%ebx
 560:	74 09                	je     56b <printint+0x1b>
 562:	89 d0                	mov    %edx,%eax
 564:	c1 e8 1f             	shr    $0x1f,%eax
 567:	84 c0                	test   %al,%al
 569:	75 75                	jne    5e0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 56b:	89 d0                	mov    %edx,%eax
  neg = 0;
 56d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 574:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 577:	31 ff                	xor    %edi,%edi
 579:	89 ce                	mov    %ecx,%esi
 57b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 57e:	eb 02                	jmp    582 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 580:	89 cf                	mov    %ecx,%edi
 582:	31 d2                	xor    %edx,%edx
 584:	f7 f6                	div    %esi
 586:	8d 4f 01             	lea    0x1(%edi),%ecx
 589:	0f b6 92 77 0c 00 00 	movzbl 0xc77(%edx),%edx
  }while((x /= base) != 0);
 590:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 592:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 595:	75 e9                	jne    580 <printint+0x30>
  if(neg)
 597:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 59a:	89 c8                	mov    %ecx,%eax
 59c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 59f:	85 d2                	test   %edx,%edx
 5a1:	74 08                	je     5ab <printint+0x5b>
    buf[i++] = '-';
 5a3:	8d 4f 02             	lea    0x2(%edi),%ecx
 5a6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 5ab:	8d 79 ff             	lea    -0x1(%ecx),%edi
 5ae:	66 90                	xchg   %ax,%ax
 5b0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 5b5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 5b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5bf:	00 
 5c0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 5c4:	89 34 24             	mov    %esi,(%esp)
 5c7:	88 45 d7             	mov    %al,-0x29(%ebp)
 5ca:	e8 93 fe ff ff       	call   462 <write>
  while(--i >= 0)
 5cf:	83 ff ff             	cmp    $0xffffffff,%edi
 5d2:	75 dc                	jne    5b0 <printint+0x60>
    putc(fd, buf[i]);
}
 5d4:	83 c4 4c             	add    $0x4c,%esp
 5d7:	5b                   	pop    %ebx
 5d8:	5e                   	pop    %esi
 5d9:	5f                   	pop    %edi
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 5e0:	89 d0                	mov    %edx,%eax
 5e2:	f7 d8                	neg    %eax
    neg = 1;
 5e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 5eb:	eb 87                	jmp    574 <printint+0x24>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi

000005f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5f4:	31 ff                	xor    %edi,%edi
{
 5f6:	56                   	push   %esi
 5f7:	53                   	push   %ebx
 5f8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 5fe:	8d 45 10             	lea    0x10(%ebp),%eax
{
 601:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 604:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 607:	0f b6 13             	movzbl (%ebx),%edx
 60a:	83 c3 01             	add    $0x1,%ebx
 60d:	84 d2                	test   %dl,%dl
 60f:	75 39                	jne    64a <printf+0x5a>
 611:	e9 ca 00 00 00       	jmp    6e0 <printf+0xf0>
 616:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 618:	83 fa 25             	cmp    $0x25,%edx
 61b:	0f 84 c7 00 00 00    	je     6e8 <printf+0xf8>
  write(fd, &c, 1);
 621:	8d 45 e0             	lea    -0x20(%ebp),%eax
 624:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 62b:	00 
 62c:	89 44 24 04          	mov    %eax,0x4(%esp)
 630:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 633:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 636:	e8 27 fe ff ff       	call   462 <write>
 63b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 63e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 642:	84 d2                	test   %dl,%dl
 644:	0f 84 96 00 00 00    	je     6e0 <printf+0xf0>
    if(state == 0){
 64a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 64c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 64f:	74 c7                	je     618 <printf+0x28>
      }
    } else if(state == '%'){
 651:	83 ff 25             	cmp    $0x25,%edi
 654:	75 e5                	jne    63b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 656:	83 fa 75             	cmp    $0x75,%edx
 659:	0f 84 99 00 00 00    	je     6f8 <printf+0x108>
 65f:	83 fa 64             	cmp    $0x64,%edx
 662:	0f 84 90 00 00 00    	je     6f8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 668:	25 f7 00 00 00       	and    $0xf7,%eax
 66d:	83 f8 70             	cmp    $0x70,%eax
 670:	0f 84 aa 00 00 00    	je     720 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 676:	83 fa 73             	cmp    $0x73,%edx
 679:	0f 84 e9 00 00 00    	je     768 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 67f:	83 fa 63             	cmp    $0x63,%edx
 682:	0f 84 2b 01 00 00    	je     7b3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 688:	83 fa 25             	cmp    $0x25,%edx
 68b:	0f 84 4f 01 00 00    	je     7e0 <printf+0x1f0>
  write(fd, &c, 1);
 691:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 694:	83 c3 01             	add    $0x1,%ebx
 697:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 69e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 69f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a5:	89 34 24             	mov    %esi,(%esp)
 6a8:	89 55 d0             	mov    %edx,-0x30(%ebp)
 6ab:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 6af:	e8 ae fd ff ff       	call   462 <write>
        putc(fd, c);
 6b4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 6b7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6ba:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6c1:	00 
 6c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 6c9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6cc:	e8 91 fd ff ff       	call   462 <write>
  for(i = 0; fmt[i]; i++){
 6d1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 6d5:	84 d2                	test   %dl,%dl
 6d7:	0f 85 6d ff ff ff    	jne    64a <printf+0x5a>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 6e0:	83 c4 3c             	add    $0x3c,%esp
 6e3:	5b                   	pop    %ebx
 6e4:	5e                   	pop    %esi
 6e5:	5f                   	pop    %edi
 6e6:	5d                   	pop    %ebp
 6e7:	c3                   	ret    
        state = '%';
 6e8:	bf 25 00 00 00       	mov    $0x25,%edi
 6ed:	e9 49 ff ff ff       	jmp    63b <printf+0x4b>
 6f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6ff:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 704:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 707:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 709:	8b 10                	mov    (%eax),%edx
 70b:	89 f0                	mov    %esi,%eax
 70d:	e8 3e fe ff ff       	call   550 <printint>
        ap++;
 712:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 716:	e9 20 ff ff ff       	jmp    63b <printf+0x4b>
 71b:	90                   	nop
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 720:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 723:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 72a:	00 
 72b:	89 44 24 04          	mov    %eax,0x4(%esp)
 72f:	89 34 24             	mov    %esi,(%esp)
 732:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 736:	e8 27 fd ff ff       	call   462 <write>
 73b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 73e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 745:	00 
 746:	89 44 24 04          	mov    %eax,0x4(%esp)
 74a:	89 34 24             	mov    %esi,(%esp)
 74d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 751:	e8 0c fd ff ff       	call   462 <write>
        printint(fd, *ap, 16, 0);
 756:	b9 10 00 00 00       	mov    $0x10,%ecx
 75b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 762:	eb a0                	jmp    704 <printf+0x114>
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 768:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 76b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 76f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 771:	b8 70 0c 00 00       	mov    $0xc70,%eax
 776:	85 ff                	test   %edi,%edi
 778:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 77b:	0f b6 07             	movzbl (%edi),%eax
 77e:	84 c0                	test   %al,%al
 780:	74 2a                	je     7ac <printf+0x1bc>
 782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 788:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 78b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 78e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 791:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 798:	00 
 799:	89 44 24 04          	mov    %eax,0x4(%esp)
 79d:	89 34 24             	mov    %esi,(%esp)
 7a0:	e8 bd fc ff ff       	call   462 <write>
        while(*s != 0){
 7a5:	0f b6 07             	movzbl (%edi),%eax
 7a8:	84 c0                	test   %al,%al
 7aa:	75 dc                	jne    788 <printf+0x198>
      state = 0;
 7ac:	31 ff                	xor    %edi,%edi
 7ae:	e9 88 fe ff ff       	jmp    63b <printf+0x4b>
        putc(fd, *ap);
 7b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 7b6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 7b8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7ba:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7c1:	00 
 7c2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 7c5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 7c8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 7cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 7cf:	e8 8e fc ff ff       	call   462 <write>
        ap++;
 7d4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7d8:	e9 5e fe ff ff       	jmp    63b <printf+0x4b>
 7dd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7e0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 7e3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7e5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7ec:	00 
 7ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f1:	89 34 24             	mov    %esi,(%esp)
 7f4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 7f8:	e8 65 fc ff ff       	call   462 <write>
 7fd:	e9 39 fe ff ff       	jmp    63b <printf+0x4b>
 802:	66 90                	xchg   %ax,%ax
 804:	66 90                	xchg   %ax,%ax
 806:	66 90                	xchg   %ax,%ax
 808:	66 90                	xchg   %ax,%ax
 80a:	66 90                	xchg   %ax,%ax
 80c:	66 90                	xchg   %ax,%ax
 80e:	66 90                	xchg   %ax,%ax

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 811:	a1 30 11 00 00       	mov    0x1130,%eax
{
 816:	89 e5                	mov    %esp,%ebp
 818:	57                   	push   %edi
 819:	56                   	push   %esi
 81a:	53                   	push   %ebx
 81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 820:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 823:	39 d0                	cmp    %edx,%eax
 825:	72 11                	jb     838 <free+0x28>
 827:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 828:	39 c8                	cmp    %ecx,%eax
 82a:	72 04                	jb     830 <free+0x20>
 82c:	39 ca                	cmp    %ecx,%edx
 82e:	72 10                	jb     840 <free+0x30>
 830:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 832:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 836:	73 f0                	jae    828 <free+0x18>
 838:	39 ca                	cmp    %ecx,%edx
 83a:	72 04                	jb     840 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83c:	39 c8                	cmp    %ecx,%eax
 83e:	72 f0                	jb     830 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 840:	8b 73 fc             	mov    -0x4(%ebx),%esi
 843:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 846:	39 cf                	cmp    %ecx,%edi
 848:	74 1e                	je     868 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 84a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 84d:	8b 48 04             	mov    0x4(%eax),%ecx
 850:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 853:	39 f2                	cmp    %esi,%edx
 855:	74 28                	je     87f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 857:	89 10                	mov    %edx,(%eax)
  freep = p;
 859:	a3 30 11 00 00       	mov    %eax,0x1130
}
 85e:	5b                   	pop    %ebx
 85f:	5e                   	pop    %esi
 860:	5f                   	pop    %edi
 861:	5d                   	pop    %ebp
 862:	c3                   	ret    
 863:	90                   	nop
 864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 868:	03 71 04             	add    0x4(%ecx),%esi
 86b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 86e:	8b 08                	mov    (%eax),%ecx
 870:	8b 09                	mov    (%ecx),%ecx
 872:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 875:	8b 48 04             	mov    0x4(%eax),%ecx
 878:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 87b:	39 f2                	cmp    %esi,%edx
 87d:	75 d8                	jne    857 <free+0x47>
    p->s.size += bp->s.size;
 87f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 882:	a3 30 11 00 00       	mov    %eax,0x1130
    p->s.size += bp->s.size;
 887:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 88a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 88d:	89 10                	mov    %edx,(%eax)
}
 88f:	5b                   	pop    %ebx
 890:	5e                   	pop    %esi
 891:	5f                   	pop    %edi
 892:	5d                   	pop    %ebp
 893:	c3                   	ret    
 894:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 89a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	55                   	push   %ebp
 8a1:	89 e5                	mov    %esp,%ebp
 8a3:	57                   	push   %edi
 8a4:	56                   	push   %esi
 8a5:	53                   	push   %ebx
 8a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8ac:	8b 1d 30 11 00 00    	mov    0x1130,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b2:	8d 48 07             	lea    0x7(%eax),%ecx
 8b5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 8b8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8ba:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 8bd:	0f 84 9b 00 00 00    	je     95e <malloc+0xbe>
 8c3:	8b 13                	mov    (%ebx),%edx
 8c5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8c8:	39 fe                	cmp    %edi,%esi
 8ca:	76 64                	jbe    930 <malloc+0x90>
 8cc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 8d3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 8d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8db:	eb 0e                	jmp    8eb <malloc+0x4b>
 8dd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8e2:	8b 78 04             	mov    0x4(%eax),%edi
 8e5:	39 fe                	cmp    %edi,%esi
 8e7:	76 4f                	jbe    938 <malloc+0x98>
 8e9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8eb:	3b 15 30 11 00 00    	cmp    0x1130,%edx
 8f1:	75 ed                	jne    8e0 <malloc+0x40>
  if(nu < 4096)
 8f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8f6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8fc:	bf 00 10 00 00       	mov    $0x1000,%edi
 901:	0f 43 fe             	cmovae %esi,%edi
 904:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 907:	89 04 24             	mov    %eax,(%esp)
 90a:	e8 bb fb ff ff       	call   4ca <sbrk>
  if(p == (char*)-1)
 90f:	83 f8 ff             	cmp    $0xffffffff,%eax
 912:	74 18                	je     92c <malloc+0x8c>
  hp->s.size = nu;
 914:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 917:	83 c0 08             	add    $0x8,%eax
 91a:	89 04 24             	mov    %eax,(%esp)
 91d:	e8 ee fe ff ff       	call   810 <free>
  return freep;
 922:	8b 15 30 11 00 00    	mov    0x1130,%edx
      if((p = morecore(nunits)) == 0)
 928:	85 d2                	test   %edx,%edx
 92a:	75 b4                	jne    8e0 <malloc+0x40>
        return 0;
 92c:	31 c0                	xor    %eax,%eax
 92e:	eb 20                	jmp    950 <malloc+0xb0>
    if(p->s.size >= nunits){
 930:	89 d0                	mov    %edx,%eax
 932:	89 da                	mov    %ebx,%edx
 934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 938:	39 fe                	cmp    %edi,%esi
 93a:	74 1c                	je     958 <malloc+0xb8>
        p->s.size -= nunits;
 93c:	29 f7                	sub    %esi,%edi
 93e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 941:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 944:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 947:	89 15 30 11 00 00    	mov    %edx,0x1130
      return (void*)(p + 1);
 94d:	83 c0 08             	add    $0x8,%eax
  }
}
 950:	83 c4 1c             	add    $0x1c,%esp
 953:	5b                   	pop    %ebx
 954:	5e                   	pop    %esi
 955:	5f                   	pop    %edi
 956:	5d                   	pop    %ebp
 957:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 958:	8b 08                	mov    (%eax),%ecx
 95a:	89 0a                	mov    %ecx,(%edx)
 95c:	eb e9                	jmp    947 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 95e:	c7 05 30 11 00 00 34 	movl   $0x1134,0x1130
 965:	11 00 00 
    base.s.size = 0;
 968:	ba 34 11 00 00       	mov    $0x1134,%edx
    base.s.ptr = freep = prevp = &base;
 96d:	c7 05 34 11 00 00 34 	movl   $0x1134,0x1134
 974:	11 00 00 
    base.s.size = 0;
 977:	c7 05 38 11 00 00 00 	movl   $0x0,0x1138
 97e:	00 00 00 
 981:	e9 46 ff ff ff       	jmp    8cc <malloc+0x2c>
 986:	66 90                	xchg   %ax,%ax
 988:	66 90                	xchg   %ax,%ax
 98a:	66 90                	xchg   %ax,%ax
 98c:	66 90                	xchg   %ax,%ax
 98e:	66 90                	xchg   %ax,%ax

00000990 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	56                   	push   %esi
 994:	53                   	push   %ebx
 995:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 998:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 99f:	e8 fc fe ff ff       	call   8a0 <malloc>

    if (bt == NULL) {
 9a4:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 9a6:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 9a8:	74 66                	je     a10 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 9aa:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 9b1:	e8 ea fe ff ff       	call   8a0 <malloc>
    if (bt->bt_stack == NULL) {
 9b6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 9b8:	89 c3                	mov    %eax,%ebx
 9ba:	89 46 08             	mov    %eax,0x8(%esi)
 9bd:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 9c0:	74 5d                	je     a1f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 9c2:	25 ff 0f 00 00       	and    $0xfff,%eax
 9c7:	75 37                	jne    a00 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 9c9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 9cf:	8b 45 10             	mov    0x10(%ebp),%eax
 9d2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 9d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 9da:	8b 45 0c             	mov    0xc(%ebp),%eax
 9dd:	89 04 24             	mov    %eax,(%esp)
 9e0:	e8 25 fb ff ff       	call   50a <kthread_create>
    if (bt->bid != 0) {
 9e5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 9e7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 9e9:	74 2d                	je     a18 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 9eb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ee:	89 30                	mov    %esi,(%eax)
        result = 0;
 9f0:	31 c0                	xor    %eax,%eax
}
 9f2:	83 c4 10             	add    $0x10,%esp
 9f5:	5b                   	pop    %ebx
 9f6:	5e                   	pop    %esi
 9f7:	5d                   	pop    %ebp
 9f8:	c3                   	ret    
 9f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 a00:	29 c3                	sub    %eax,%ebx
 a02:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 a08:	89 5e 04             	mov    %ebx,0x4(%esi)
 a0b:	eb bc                	jmp    9c9 <benny_thread_create+0x39>
 a0d:	8d 76 00             	lea    0x0(%esi),%esi
 a10:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 a16:	eb b7                	jmp    9cf <benny_thread_create+0x3f>
    int result = -1;
 a18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a1d:	eb d3                	jmp    9f2 <benny_thread_create+0x62>
        free(bt);
 a1f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 a22:	31 f6                	xor    %esi,%esi
        free(bt);
 a24:	e8 e7 fd ff ff       	call   810 <free>
 a29:	8b 5b 04             	mov    0x4(%ebx),%ebx
 a2c:	eb a1                	jmp    9cf <benny_thread_create+0x3f>
 a2e:	66 90                	xchg   %ax,%ax

00000a30 <benny_thread_bid>:
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 a33:	8b 45 08             	mov    0x8(%ebp),%eax
}
 a36:	5d                   	pop    %ebp
    return bt->bid;
 a37:	8b 00                	mov    (%eax),%eax
}
 a39:	c3                   	ret    
 a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a40 <benny_thread_join>:
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	53                   	push   %ebx
 a44:	83 ec 14             	sub    $0x14,%esp
 a47:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 a4a:	8b 03                	mov    (%ebx),%eax
 a4c:	89 04 24             	mov    %eax,(%esp)
 a4f:	e8 be fa ff ff       	call   512 <kthread_join>
    if (retVal == 0) {
 a54:	85 c0                	test   %eax,%eax
 a56:	75 27                	jne    a7f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 a58:	8b 53 08             	mov    0x8(%ebx),%edx
 a5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a5e:	89 14 24             	mov    %edx,(%esp)
 a61:	e8 aa fd ff ff       	call   810 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 a66:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 a6d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 a74:	89 1c 24             	mov    %ebx,(%esp)
 a77:	e8 94 fd ff ff       	call   810 <free>
 a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 a7f:	83 c4 14             	add    $0x14,%esp
 a82:	5b                   	pop    %ebx
 a83:	5d                   	pop    %ebp
 a84:	c3                   	ret    
 a85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a90 <benny_thread_exit>:
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
}
 a93:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 a94:	e9 81 fa ff ff       	jmp    51a <kthread_exit>
 a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 aa6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 aac:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 ab3:	31 c0                	xor    %eax,%eax
 ab5:	5d                   	pop    %ebp
 ab6:	c3                   	ret    
 ab7:	89 f6                	mov    %esi,%esi
 ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ac0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 ac0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 ac1:	b8 01 00 00 00       	mov    $0x1,%eax
 ac6:	89 e5                	mov    %esp,%ebp
 ac8:	56                   	push   %esi
 ac9:	53                   	push   %ebx
 aca:	8b 5d 08             	mov    0x8(%ebp),%ebx
 acd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 ad0:	85 c0                	test   %eax,%eax
 ad2:	be 01 00 00 00       	mov    $0x1,%esi
 ad7:	74 15                	je     aee <benny_mootex_yieldlock+0x2e>
 ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 ae0:	e8 45 fa ff ff       	call   52a <kthread_yield>
 ae5:	89 f0                	mov    %esi,%eax
 ae7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 aea:	85 c0                	test   %eax,%eax
 aec:	75 f2                	jne    ae0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 aee:	e8 2f fa ff ff       	call   522 <kthread_self>
    benny_mootex->bid = benny_self();
 af3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 af6:	31 c0                	xor    %eax,%eax
 af8:	5b                   	pop    %ebx
 af9:	5e                   	pop    %esi
 afa:	5d                   	pop    %ebp
 afb:	c3                   	ret    
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b00 <benny_mootex_spinlock>:
{
 b00:	55                   	push   %ebp
 b01:	ba 01 00 00 00       	mov    $0x1,%edx
 b06:	89 e5                	mov    %esp,%ebp
 b08:	53                   	push   %ebx
 b09:	83 ec 04             	sub    $0x4,%esp
 b0c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b0f:	90                   	nop
 b10:	89 d0                	mov    %edx,%eax
 b12:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 b15:	85 c0                	test   %eax,%eax
 b17:	75 f7                	jne    b10 <benny_mootex_spinlock+0x10>
    return kthread_self();
 b19:	e8 04 fa ff ff       	call   522 <kthread_self>
    benny_mootex->bid = benny_self();
 b1e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b21:	83 c4 04             	add    $0x4,%esp
 b24:	31 c0                	xor    %eax,%eax
 b26:	5b                   	pop    %ebx
 b27:	5d                   	pop    %ebp
 b28:	c3                   	ret    
 b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b30 <benny_mootex_unlock>:
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	53                   	push   %ebx
 b34:	83 ec 04             	sub    $0x4,%esp
 b37:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 b3a:	e8 e3 f9 ff ff       	call   522 <kthread_self>
    if(tid == benny_mootex->bid){
 b3f:	39 43 04             	cmp    %eax,0x4(%ebx)
 b42:	75 1c                	jne    b60 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 b44:	0f ae f0             	mfence 
    return 0;
 b47:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 b49:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 b50:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 b56:	83 c4 04             	add    $0x4,%esp
 b59:	5b                   	pop    %ebx
 b5a:	5d                   	pop    %ebp
 b5b:	c3                   	ret    
 b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b60:	83 c4 04             	add    $0x4,%esp
      return -1;
 b63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b68:	5b                   	pop    %ebx
 b69:	5d                   	pop    %ebp
 b6a:	c3                   	ret    
 b6b:	90                   	nop
 b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b70 <benny_mootex_trylock>:
{
 b70:	55                   	push   %ebp
 b71:	b8 01 00 00 00       	mov    $0x1,%eax
 b76:	89 e5                	mov    %esp,%ebp
 b78:	53                   	push   %ebx
 b79:	83 ec 04             	sub    $0x4,%esp
 b7c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b7f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 b82:	85 c0                	test   %eax,%eax
 b84:	75 08                	jne    b8e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 b86:	e8 97 f9 ff ff       	call   522 <kthread_self>
        benny_mootex->bid = tid;
 b8b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b8e:	83 c4 04             	add    $0x4,%esp
 b91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b96:	5b                   	pop    %ebx
 b97:	5d                   	pop    %ebp
 b98:	c3                   	ret    
 b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <benny_mootex_wholock>:
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 ba3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ba6:	5d                   	pop    %ebp
    return benny_mootex->bid;
 ba7:	8b 40 04             	mov    0x4(%eax),%eax
}
 baa:	c3                   	ret    
 bab:	90                   	nop
 bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bb0 <benny_mootex_islocked>:
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 bb3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 bb6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 bb7:	8b 00                	mov    (%eax),%eax
}
 bb9:	c3                   	ret    
 bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000bc0 <benny_self>:
{
 bc0:	55                   	push   %ebp
 bc1:	89 e5                	mov    %esp,%ebp
}
 bc3:	5d                   	pop    %ebp
    return kthread_self();
 bc4:	e9 59 f9 ff ff       	jmp    522 <kthread_self>
 bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <benny_yield>:
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
    
}
 bd3:	5d                   	pop    %ebp
    return kthread_yield();
 bd4:	e9 51 f9 ff ff       	jmp    52a <kthread_yield>
 bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000be0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 be0:	55                   	push   %ebp
 be1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 be3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 be4:	e9 49 f9 ff ff       	jmp    532 <kthread_cpu_count>
 be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000bf0 <benny_thread_count>:

int
benny_thread_count(void)
{
 bf0:	55                   	push   %ebp
 bf1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 bf3:	5d                   	pop    %ebp
    return kthread_thread_count();
 bf4:	e9 41 f9 ff ff       	jmp    53a <kthread_thread_count>
