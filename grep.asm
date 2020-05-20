
_grep:     file format elf32-i386


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
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 10             	sub    $0x10,%esp
   c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
   f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  13:	0f 8e 8b 00 00 00    	jle    a4 <main+0xa4>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  19:	8b 43 04             	mov    0x4(%ebx),%eax
  1c:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  1f:	be 02 00 00 00       	mov    $0x2,%esi
  24:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  pattern = argv[1];
  28:	89 44 24 0c          	mov    %eax,0xc(%esp)
  if(argc <= 2){
  2c:	74 61                	je     8f <main+0x8f>
  2e:	66 90                	xchg   %ax,%ax
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  37:	00 
  38:	8b 03                	mov    (%ebx),%eax
  3a:	89 04 24             	mov    %eax,(%esp)
  3d:	e8 30 05 00 00       	call   572 <open>
  42:	85 c0                	test   %eax,%eax
  44:	89 c7                	mov    %eax,%edi
  46:	78 28                	js     70 <main+0x70>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  48:	89 44 24 04          	mov    %eax,0x4(%esp)
  4c:	8b 44 24 0c          	mov    0xc(%esp),%eax
  for(i = 2; i < argc; i++){
  50:	83 c6 01             	add    $0x1,%esi
  53:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  56:	89 04 24             	mov    %eax,(%esp)
  59:	e8 a2 01 00 00       	call   200 <grep>
    close(fd);
  5e:	89 3c 24             	mov    %edi,(%esp)
  61:	e8 f4 04 00 00       	call   55a <close>
  for(i = 2; i < argc; i++){
  66:	39 75 08             	cmp    %esi,0x8(%ebp)
  69:	7f c5                	jg     30 <main+0x30>
  }
  exit();
  6b:	e8 c2 04 00 00       	call   532 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  70:	8b 03                	mov    (%ebx),%eax
  72:	c7 44 24 04 0c 0d 00 	movl   $0xd0c,0x4(%esp)
  79:	00 
  7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  81:	89 44 24 08          	mov    %eax,0x8(%esp)
  85:	e8 56 06 00 00       	call   6e0 <printf>
      exit();
  8a:	e8 a3 04 00 00       	call   532 <exit>
    grep(pattern, 0);
  8f:	89 04 24             	mov    %eax,(%esp)
  92:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  99:	00 
  9a:	e8 61 01 00 00       	call   200 <grep>
    exit();
  9f:	e8 8e 04 00 00       	call   532 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  a4:	c7 44 24 04 ec 0c 00 	movl   $0xcec,0x4(%esp)
  ab:	00 
  ac:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  b3:	e8 28 06 00 00       	call   6e0 <printf>
    exit();
  b8:	e8 75 04 00 00       	call   532 <exit>
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  c5:	53                   	push   %ebx
  c6:	83 ec 1c             	sub    $0x1c,%esp
  c9:	8b 75 08             	mov    0x8(%ebp),%esi
  cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cf:	8b 5d 10             	mov    0x10(%ebp),%ebx
  d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  d8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  dc:	89 3c 24             	mov    %edi,(%esp)
  df:	e8 3c 00 00 00       	call   120 <matchhere>
  e4:	85 c0                	test   %eax,%eax
  e6:	75 20                	jne    108 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  e8:	0f be 13             	movsbl (%ebx),%edx
  eb:	84 d2                	test   %dl,%dl
  ed:	74 0c                	je     fb <matchstar+0x3b>
  ef:	83 c3 01             	add    $0x1,%ebx
  f2:	39 f2                	cmp    %esi,%edx
  f4:	74 e2                	je     d8 <matchstar+0x18>
  f6:	83 fe 2e             	cmp    $0x2e,%esi
  f9:	74 dd                	je     d8 <matchstar+0x18>
  return 0;
}
  fb:	83 c4 1c             	add    $0x1c,%esp
  fe:	5b                   	pop    %ebx
  ff:	5e                   	pop    %esi
 100:	5f                   	pop    %edi
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    
 103:	90                   	nop
 104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 108:	83 c4 1c             	add    $0x1c,%esp
      return 1;
 10b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 110:	5b                   	pop    %ebx
 111:	5e                   	pop    %esi
 112:	5f                   	pop    %edi
 113:	5d                   	pop    %ebp
 114:	c3                   	ret    
 115:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <matchhere>:
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	83 ec 14             	sub    $0x14,%esp
 127:	8b 55 08             	mov    0x8(%ebp),%edx
 12a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  if(re[0] == '\0')
 12d:	0f be 02             	movsbl (%edx),%eax
 130:	84 c0                	test   %al,%al
 132:	75 20                	jne    154 <matchhere+0x34>
 134:	eb 42                	jmp    178 <matchhere+0x58>
 136:	66 90                	xchg   %ax,%ax
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 138:	0f b6 19             	movzbl (%ecx),%ebx
 13b:	84 db                	test   %bl,%bl
 13d:	74 31                	je     170 <matchhere+0x50>
 13f:	3c 2e                	cmp    $0x2e,%al
 141:	74 04                	je     147 <matchhere+0x27>
 143:	38 d8                	cmp    %bl,%al
 145:	75 29                	jne    170 <matchhere+0x50>
    return matchhere(re+1, text+1);
 147:	83 c2 01             	add    $0x1,%edx
  if(re[0] == '\0')
 14a:	0f be 02             	movsbl (%edx),%eax
    return matchhere(re+1, text+1);
 14d:	83 c1 01             	add    $0x1,%ecx
  if(re[0] == '\0')
 150:	84 c0                	test   %al,%al
 152:	74 24                	je     178 <matchhere+0x58>
  if(re[1] == '*')
 154:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 158:	80 fb 2a             	cmp    $0x2a,%bl
 15b:	74 2b                	je     188 <matchhere+0x68>
  if(re[0] == '$' && re[1] == '\0')
 15d:	3c 24                	cmp    $0x24,%al
 15f:	75 d7                	jne    138 <matchhere+0x18>
 161:	84 db                	test   %bl,%bl
 163:	74 3c                	je     1a1 <matchhere+0x81>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 165:	0f b6 19             	movzbl (%ecx),%ebx
 168:	84 db                	test   %bl,%bl
 16a:	75 d7                	jne    143 <matchhere+0x23>
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	83 c4 14             	add    $0x14,%esp
 175:	5b                   	pop    %ebx
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    
 178:	83 c4 14             	add    $0x14,%esp
    return 1;
 17b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	90                   	nop
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchstar(re[0], re+2, text);
 188:	83 c2 02             	add    $0x2,%edx
 18b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 18f:	89 54 24 04          	mov    %edx,0x4(%esp)
 193:	89 04 24             	mov    %eax,(%esp)
 196:	e8 25 ff ff ff       	call   c0 <matchstar>
}
 19b:	83 c4 14             	add    $0x14,%esp
 19e:	5b                   	pop    %ebx
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
    return *text == '\0';
 1a1:	31 c0                	xor    %eax,%eax
 1a3:	80 39 00             	cmpb   $0x0,(%ecx)
 1a6:	0f 94 c0             	sete   %al
 1a9:	eb c7                	jmp    172 <matchhere+0x52>
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <match>:
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
 1b5:	83 ec 10             	sub    $0x10,%esp
 1b8:	8b 75 08             	mov    0x8(%ebp),%esi
 1bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1be:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1c1:	75 0e                	jne    1d1 <match+0x21>
 1c3:	eb 28                	jmp    1ed <match+0x3d>
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1c8:	83 c3 01             	add    $0x1,%ebx
 1cb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1cf:	74 15                	je     1e6 <match+0x36>
    if(matchhere(re, text))
 1d1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 1d5:	89 34 24             	mov    %esi,(%esp)
 1d8:	e8 43 ff ff ff       	call   120 <matchhere>
 1dd:	85 c0                	test   %eax,%eax
 1df:	74 e7                	je     1c8 <match+0x18>
      return 1;
 1e1:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1e6:	83 c4 10             	add    $0x10,%esp
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
    return matchhere(re+1, text);
 1ed:	83 c6 01             	add    $0x1,%esi
 1f0:	89 75 08             	mov    %esi,0x8(%ebp)
}
 1f3:	83 c4 10             	add    $0x10,%esp
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1f9:	e9 22 ff ff ff       	jmp    120 <matchhere>
 1fe:	66 90                	xchg   %ax,%ax

00000200 <grep>:
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
 205:	53                   	push   %ebx
 206:	83 ec 1c             	sub    $0x1c,%esp
 209:	8b 75 08             	mov    0x8(%ebp),%esi
  m = 0;
 20c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 213:	90                   	nop
 214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 218:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 21b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 220:	29 d0                	sub    %edx,%eax
 222:	89 44 24 08          	mov    %eax,0x8(%esp)
 226:	89 d0                	mov    %edx,%eax
 228:	05 c0 12 00 00       	add    $0x12c0,%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 0c             	mov    0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 0e 03 00 00       	call   54a <read>
 23c:	85 c0                	test   %eax,%eax
 23e:	0f 8e b8 00 00 00    	jle    2fc <grep+0xfc>
    m += n;
 244:	01 45 e4             	add    %eax,-0x1c(%ebp)
    p = buf;
 247:	bb c0 12 00 00       	mov    $0x12c0,%ebx
    buf[m] = '\0';
 24c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 24f:	c6 80 c0 12 00 00 00 	movb   $0x0,0x12c0(%eax)
 256:	66 90                	xchg   %ax,%ax
    while((q = strchr(p, '\n')) != 0){
 258:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 25f:	00 
 260:	89 1c 24             	mov    %ebx,(%esp)
 263:	e8 78 01 00 00       	call   3e0 <strchr>
 268:	85 c0                	test   %eax,%eax
 26a:	89 c7                	mov    %eax,%edi
 26c:	74 42                	je     2b0 <grep+0xb0>
      *q = 0;
 26e:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
 271:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 275:	89 34 24             	mov    %esi,(%esp)
 278:	e8 33 ff ff ff       	call   1b0 <match>
 27d:	85 c0                	test   %eax,%eax
 27f:	75 07                	jne    288 <grep+0x88>
 281:	8d 5f 01             	lea    0x1(%edi),%ebx
 284:	eb d2                	jmp    258 <grep+0x58>
 286:	66 90                	xchg   %ax,%ax
        *q = '\n';
 288:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
 28b:	83 c7 01             	add    $0x1,%edi
 28e:	89 f8                	mov    %edi,%eax
 290:	29 d8                	sub    %ebx,%eax
 292:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 296:	89 fb                	mov    %edi,%ebx
 298:	89 44 24 08          	mov    %eax,0x8(%esp)
 29c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a3:	e8 aa 02 00 00       	call   552 <write>
 2a8:	eb ae                	jmp    258 <grep+0x58>
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p == buf)
 2b0:	81 fb c0 12 00 00    	cmp    $0x12c0,%ebx
 2b6:	74 38                	je     2f0 <grep+0xf0>
    if(m > 0){
 2b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2bb:	85 c0                	test   %eax,%eax
 2bd:	0f 8e 55 ff ff ff    	jle    218 <grep+0x18>
      m -= p - buf;
 2c3:	b8 c0 12 00 00       	mov    $0x12c0,%eax
 2c8:	29 d8                	sub    %ebx,%eax
 2ca:	01 45 e4             	add    %eax,-0x1c(%ebp)
      memmove(buf, p, m);
 2cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2d4:	c7 04 24 c0 12 00 00 	movl   $0x12c0,(%esp)
 2db:	89 44 24 08          	mov    %eax,0x8(%esp)
 2df:	e8 1c 02 00 00       	call   500 <memmove>
 2e4:	e9 2f ff ff ff       	jmp    218 <grep+0x18>
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      m = 0;
 2f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2f7:	e9 1c ff ff ff       	jmp    218 <grep+0x18>
}
 2fc:	83 c4 1c             	add    $0x1c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
 304:	66 90                	xchg   %ax,%ax
 306:	66 90                	xchg   %ax,%ax
 308:	66 90                	xchg   %ax,%ax
 30a:	66 90                	xchg   %ax,%ax
 30c:	66 90                	xchg   %ax,%ax
 30e:	66 90                	xchg   %ax,%ax

00000310 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 319:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 31a:	89 c2                	mov    %eax,%edx
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 320:	83 c1 01             	add    $0x1,%ecx
 323:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 327:	83 c2 01             	add    $0x1,%edx
 32a:	84 db                	test   %bl,%bl
 32c:	88 5a ff             	mov    %bl,-0x1(%edx)
 32f:	75 ef                	jne    320 <strcpy+0x10>
    ;
  return os;
}
 331:	5b                   	pop    %ebx
 332:	5d                   	pop    %ebp
 333:	c3                   	ret    
 334:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 33a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000340 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 55 08             	mov    0x8(%ebp),%edx
 346:	53                   	push   %ebx
 347:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 34a:	0f b6 02             	movzbl (%edx),%eax
 34d:	84 c0                	test   %al,%al
 34f:	74 2d                	je     37e <strcmp+0x3e>
 351:	0f b6 19             	movzbl (%ecx),%ebx
 354:	38 d8                	cmp    %bl,%al
 356:	74 0e                	je     366 <strcmp+0x26>
 358:	eb 2b                	jmp    385 <strcmp+0x45>
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 360:	38 c8                	cmp    %cl,%al
 362:	75 15                	jne    379 <strcmp+0x39>
    p++, q++;
 364:	89 d9                	mov    %ebx,%ecx
 366:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 369:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 36c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 36f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 373:	84 c0                	test   %al,%al
 375:	75 e9                	jne    360 <strcmp+0x20>
 377:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 379:	29 c8                	sub    %ecx,%eax
}
 37b:	5b                   	pop    %ebx
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 381:	31 c0                	xor    %eax,%eax
 383:	eb f4                	jmp    379 <strcmp+0x39>
 385:	0f b6 cb             	movzbl %bl,%ecx
 388:	eb ef                	jmp    379 <strcmp+0x39>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000390 <strlen>:

uint
strlen(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 396:	80 39 00             	cmpb   $0x0,(%ecx)
 399:	74 12                	je     3ad <strlen+0x1d>
 39b:	31 d2                	xor    %edx,%edx
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3a7:	89 d0                	mov    %edx,%eax
 3a9:	75 f5                	jne    3a0 <strlen+0x10>
    ;
  return n;
}
 3ab:	5d                   	pop    %ebp
 3ac:	c3                   	ret    
  for(n = 0; s[n]; n++)
 3ad:	31 c0                	xor    %eax,%eax
}
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret    
 3b1:	eb 0d                	jmp    3c0 <memset>
 3b3:	90                   	nop
 3b4:	90                   	nop
 3b5:	90                   	nop
 3b6:	90                   	nop
 3b7:	90                   	nop
 3b8:	90                   	nop
 3b9:	90                   	nop
 3ba:	90                   	nop
 3bb:	90                   	nop
 3bc:	90                   	nop
 3bd:	90                   	nop
 3be:	90                   	nop
 3bf:	90                   	nop

000003c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
 3c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cd:	89 d7                	mov    %edx,%edi
 3cf:	fc                   	cld    
 3d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3d2:	89 d0                	mov    %edx,%eax
 3d4:	5f                   	pop    %edi
 3d5:	5d                   	pop    %ebp
 3d6:	c3                   	ret    
 3d7:	89 f6                	mov    %esi,%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <strchr>:

char*
strchr(const char *s, char c)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	53                   	push   %ebx
 3e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 3ea:	0f b6 18             	movzbl (%eax),%ebx
 3ed:	84 db                	test   %bl,%bl
 3ef:	74 1d                	je     40e <strchr+0x2e>
    if(*s == c)
 3f1:	38 d3                	cmp    %dl,%bl
 3f3:	89 d1                	mov    %edx,%ecx
 3f5:	75 0d                	jne    404 <strchr+0x24>
 3f7:	eb 17                	jmp    410 <strchr+0x30>
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 400:	38 ca                	cmp    %cl,%dl
 402:	74 0c                	je     410 <strchr+0x30>
  for(; *s; s++)
 404:	83 c0 01             	add    $0x1,%eax
 407:	0f b6 10             	movzbl (%eax),%edx
 40a:	84 d2                	test   %dl,%dl
 40c:	75 f2                	jne    400 <strchr+0x20>
      return (char*)s;
  return 0;
 40e:	31 c0                	xor    %eax,%eax
}
 410:	5b                   	pop    %ebx
 411:	5d                   	pop    %ebp
 412:	c3                   	ret    
 413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <gets>:

char*
gets(char *buf, int max)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 425:	31 f6                	xor    %esi,%esi
{
 427:	53                   	push   %ebx
 428:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 42b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 42e:	eb 31                	jmp    461 <gets+0x41>
    cc = read(0, &c, 1);
 430:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 437:	00 
 438:	89 7c 24 04          	mov    %edi,0x4(%esp)
 43c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 443:	e8 02 01 00 00       	call   54a <read>
    if(cc < 1)
 448:	85 c0                	test   %eax,%eax
 44a:	7e 1d                	jle    469 <gets+0x49>
      break;
    buf[i++] = c;
 44c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 450:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 452:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 455:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 457:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 45b:	74 0c                	je     469 <gets+0x49>
 45d:	3c 0a                	cmp    $0xa,%al
 45f:	74 08                	je     469 <gets+0x49>
  for(i=0; i+1 < max; ){
 461:	8d 5e 01             	lea    0x1(%esi),%ebx
 464:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 467:	7c c7                	jl     430 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 469:	8b 45 08             	mov    0x8(%ebp),%eax
 46c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 470:	83 c4 2c             	add    $0x2c,%esp
 473:	5b                   	pop    %ebx
 474:	5e                   	pop    %esi
 475:	5f                   	pop    %edi
 476:	5d                   	pop    %ebp
 477:	c3                   	ret    
 478:	90                   	nop
 479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000480 <stat>:

int
stat(const char *n, struct stat *st)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	56                   	push   %esi
 484:	53                   	push   %ebx
 485:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 492:	00 
 493:	89 04 24             	mov    %eax,(%esp)
 496:	e8 d7 00 00 00       	call   572 <open>
  if(fd < 0)
 49b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 49d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 49f:	78 27                	js     4c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a4:	89 1c 24             	mov    %ebx,(%esp)
 4a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ab:	e8 da 00 00 00       	call   58a <fstat>
  close(fd);
 4b0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4b3:	89 c6                	mov    %eax,%esi
  close(fd);
 4b5:	e8 a0 00 00 00       	call   55a <close>
  return r;
 4ba:	89 f0                	mov    %esi,%eax
}
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	90                   	nop
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 4c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4cd:	eb ed                	jmp    4bc <stat+0x3c>
 4cf:	90                   	nop

000004d0 <atoi>:

int
atoi(const char *s)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 4d6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4d7:	0f be 11             	movsbl (%ecx),%edx
 4da:	8d 42 d0             	lea    -0x30(%edx),%eax
 4dd:	3c 09                	cmp    $0x9,%al
  n = 0;
 4df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 4e4:	77 17                	ja     4fd <atoi+0x2d>
 4e6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 4e8:	83 c1 01             	add    $0x1,%ecx
 4eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 4ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 4f2:	0f be 11             	movsbl (%ecx),%edx
 4f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 4f8:	80 fb 09             	cmp    $0x9,%bl
 4fb:	76 eb                	jbe    4e8 <atoi+0x18>
  return n;
}
 4fd:	5b                   	pop    %ebx
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    

00000500 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 500:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 501:	31 d2                	xor    %edx,%edx
{
 503:	89 e5                	mov    %esp,%ebp
 505:	56                   	push   %esi
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	53                   	push   %ebx
 50a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 50d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 510:	85 db                	test   %ebx,%ebx
 512:	7e 12                	jle    526 <memmove+0x26>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 518:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 51c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 51f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 522:	39 da                	cmp    %ebx,%edx
 524:	75 f2                	jne    518 <memmove+0x18>
  return vdst;
}
 526:	5b                   	pop    %ebx
 527:	5e                   	pop    %esi
 528:	5d                   	pop    %ebp
 529:	c3                   	ret    

0000052a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 52a:	b8 01 00 00 00       	mov    $0x1,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <exit>:
SYSCALL(exit)
 532:	b8 02 00 00 00       	mov    $0x2,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <wait>:
SYSCALL(wait)
 53a:	b8 03 00 00 00       	mov    $0x3,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <pipe>:
SYSCALL(pipe)
 542:	b8 04 00 00 00       	mov    $0x4,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <read>:
SYSCALL(read)
 54a:	b8 05 00 00 00       	mov    $0x5,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <write>:
SYSCALL(write)
 552:	b8 10 00 00 00       	mov    $0x10,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <close>:
SYSCALL(close)
 55a:	b8 15 00 00 00       	mov    $0x15,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <kill>:
SYSCALL(kill)
 562:	b8 06 00 00 00       	mov    $0x6,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <exec>:
SYSCALL(exec)
 56a:	b8 07 00 00 00       	mov    $0x7,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <open>:
SYSCALL(open)
 572:	b8 0f 00 00 00       	mov    $0xf,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <mknod>:
SYSCALL(mknod)
 57a:	b8 11 00 00 00       	mov    $0x11,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <unlink>:
SYSCALL(unlink)
 582:	b8 12 00 00 00       	mov    $0x12,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <fstat>:
SYSCALL(fstat)
 58a:	b8 08 00 00 00       	mov    $0x8,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <link>:
SYSCALL(link)
 592:	b8 13 00 00 00       	mov    $0x13,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <mkdir>:
SYSCALL(mkdir)
 59a:	b8 14 00 00 00       	mov    $0x14,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <chdir>:
SYSCALL(chdir)
 5a2:	b8 09 00 00 00       	mov    $0x9,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <dup>:
SYSCALL(dup)
 5aa:	b8 0a 00 00 00       	mov    $0xa,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <getpid>:
SYSCALL(getpid)
 5b2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <sbrk>:
SYSCALL(sbrk)
 5ba:	b8 0c 00 00 00       	mov    $0xc,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <sleep>:
SYSCALL(sleep)
 5c2:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <uptime>:
SYSCALL(uptime)
 5ca:	b8 0e 00 00 00       	mov    $0xe,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 5d2:	b8 16 00 00 00       	mov    $0x16,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 5da:	b8 17 00 00 00       	mov    $0x17,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 5e2:	b8 18 00 00 00       	mov    $0x18,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 5ea:	b8 19 00 00 00       	mov    $0x19,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 5f2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 5fa:	b8 1b 00 00 00       	mov    $0x1b,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <kthread_join>:
SYSCALL(kthread_join)
 602:	b8 1c 00 00 00       	mov    $0x1c,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <kthread_exit>:
SYSCALL(kthread_exit)
 60a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 612:	b8 1e 00 00 00       	mov    $0x1e,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <kthread_yield>:
SYSCALL(kthread_yield)
 61a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 622:	b8 20 00 00 00       	mov    $0x20,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 62a:	b8 21 00 00 00       	mov    $0x21,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    
 632:	66 90                	xchg   %ax,%ax
 634:	66 90                	xchg   %ax,%ax
 636:	66 90                	xchg   %ax,%ax
 638:	66 90                	xchg   %ax,%ax
 63a:	66 90                	xchg   %ax,%ax
 63c:	66 90                	xchg   %ax,%ax
 63e:	66 90                	xchg   %ax,%ax

00000640 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	89 c6                	mov    %eax,%esi
 647:	53                   	push   %ebx
 648:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 64e:	85 db                	test   %ebx,%ebx
 650:	74 09                	je     65b <printint+0x1b>
 652:	89 d0                	mov    %edx,%eax
 654:	c1 e8 1f             	shr    $0x1f,%eax
 657:	84 c0                	test   %al,%al
 659:	75 75                	jne    6d0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 65b:	89 d0                	mov    %edx,%eax
  neg = 0;
 65d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 664:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 667:	31 ff                	xor    %edi,%edi
 669:	89 ce                	mov    %ecx,%esi
 66b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 66e:	eb 02                	jmp    672 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 670:	89 cf                	mov    %ecx,%edi
 672:	31 d2                	xor    %edx,%edx
 674:	f7 f6                	div    %esi
 676:	8d 4f 01             	lea    0x1(%edi),%ecx
 679:	0f b6 92 29 0d 00 00 	movzbl 0xd29(%edx),%edx
  }while((x /= base) != 0);
 680:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 682:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 685:	75 e9                	jne    670 <printint+0x30>
  if(neg)
 687:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 68a:	89 c8                	mov    %ecx,%eax
 68c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 68f:	85 d2                	test   %edx,%edx
 691:	74 08                	je     69b <printint+0x5b>
    buf[i++] = '-';
 693:	8d 4f 02             	lea    0x2(%edi),%ecx
 696:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 69b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 69e:	66 90                	xchg   %ax,%ax
 6a0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 6a5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 6a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6af:	00 
 6b0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 6b4:	89 34 24             	mov    %esi,(%esp)
 6b7:	88 45 d7             	mov    %al,-0x29(%ebp)
 6ba:	e8 93 fe ff ff       	call   552 <write>
  while(--i >= 0)
 6bf:	83 ff ff             	cmp    $0xffffffff,%edi
 6c2:	75 dc                	jne    6a0 <printint+0x60>
    putc(fd, buf[i]);
}
 6c4:	83 c4 4c             	add    $0x4c,%esp
 6c7:	5b                   	pop    %ebx
 6c8:	5e                   	pop    %esi
 6c9:	5f                   	pop    %edi
 6ca:	5d                   	pop    %ebp
 6cb:	c3                   	ret    
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 6d0:	89 d0                	mov    %edx,%eax
 6d2:	f7 d8                	neg    %eax
    neg = 1;
 6d4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 6db:	eb 87                	jmp    664 <printint+0x24>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi

000006e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6e4:	31 ff                	xor    %edi,%edi
{
 6e6:	56                   	push   %esi
 6e7:	53                   	push   %ebx
 6e8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 6ee:	8d 45 10             	lea    0x10(%ebp),%eax
{
 6f1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 6f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 6f7:	0f b6 13             	movzbl (%ebx),%edx
 6fa:	83 c3 01             	add    $0x1,%ebx
 6fd:	84 d2                	test   %dl,%dl
 6ff:	75 39                	jne    73a <printf+0x5a>
 701:	e9 ca 00 00 00       	jmp    7d0 <printf+0xf0>
 706:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 708:	83 fa 25             	cmp    $0x25,%edx
 70b:	0f 84 c7 00 00 00    	je     7d8 <printf+0xf8>
  write(fd, &c, 1);
 711:	8d 45 e0             	lea    -0x20(%ebp),%eax
 714:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 71b:	00 
 71c:	89 44 24 04          	mov    %eax,0x4(%esp)
 720:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 723:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 726:	e8 27 fe ff ff       	call   552 <write>
 72b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 72e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 732:	84 d2                	test   %dl,%dl
 734:	0f 84 96 00 00 00    	je     7d0 <printf+0xf0>
    if(state == 0){
 73a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 73c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 73f:	74 c7                	je     708 <printf+0x28>
      }
    } else if(state == '%'){
 741:	83 ff 25             	cmp    $0x25,%edi
 744:	75 e5                	jne    72b <printf+0x4b>
      if(c == 'd' || c == 'u'){
 746:	83 fa 75             	cmp    $0x75,%edx
 749:	0f 84 99 00 00 00    	je     7e8 <printf+0x108>
 74f:	83 fa 64             	cmp    $0x64,%edx
 752:	0f 84 90 00 00 00    	je     7e8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 758:	25 f7 00 00 00       	and    $0xf7,%eax
 75d:	83 f8 70             	cmp    $0x70,%eax
 760:	0f 84 aa 00 00 00    	je     810 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 766:	83 fa 73             	cmp    $0x73,%edx
 769:	0f 84 e9 00 00 00    	je     858 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 76f:	83 fa 63             	cmp    $0x63,%edx
 772:	0f 84 2b 01 00 00    	je     8a3 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 778:	83 fa 25             	cmp    $0x25,%edx
 77b:	0f 84 4f 01 00 00    	je     8d0 <printf+0x1f0>
  write(fd, &c, 1);
 781:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 784:	83 c3 01             	add    $0x1,%ebx
 787:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 78e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 78f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 791:	89 44 24 04          	mov    %eax,0x4(%esp)
 795:	89 34 24             	mov    %esi,(%esp)
 798:	89 55 d0             	mov    %edx,-0x30(%ebp)
 79b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 79f:	e8 ae fd ff ff       	call   552 <write>
        putc(fd, c);
 7a4:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 7a7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7b1:	00 
 7b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 7b9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7bc:	e8 91 fd ff ff       	call   552 <write>
  for(i = 0; fmt[i]; i++){
 7c1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 7c5:	84 d2                	test   %dl,%dl
 7c7:	0f 85 6d ff ff ff    	jne    73a <printf+0x5a>
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 7d0:	83 c4 3c             	add    $0x3c,%esp
 7d3:	5b                   	pop    %ebx
 7d4:	5e                   	pop    %esi
 7d5:	5f                   	pop    %edi
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
        state = '%';
 7d8:	bf 25 00 00 00       	mov    $0x25,%edi
 7dd:	e9 49 ff ff ff       	jmp    72b <printf+0x4b>
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 7e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 7ef:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 7f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 7f7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 7f9:	8b 10                	mov    (%eax),%edx
 7fb:	89 f0                	mov    %esi,%eax
 7fd:	e8 3e fe ff ff       	call   640 <printint>
        ap++;
 802:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 806:	e9 20 ff ff ff       	jmp    72b <printf+0x4b>
 80b:	90                   	nop
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 810:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 813:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 81a:	00 
 81b:	89 44 24 04          	mov    %eax,0x4(%esp)
 81f:	89 34 24             	mov    %esi,(%esp)
 822:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 826:	e8 27 fd ff ff       	call   552 <write>
 82b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 82e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 835:	00 
 836:	89 44 24 04          	mov    %eax,0x4(%esp)
 83a:	89 34 24             	mov    %esi,(%esp)
 83d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 841:	e8 0c fd ff ff       	call   552 <write>
        printint(fd, *ap, 16, 0);
 846:	b9 10 00 00 00       	mov    $0x10,%ecx
 84b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 852:	eb a0                	jmp    7f4 <printf+0x114>
 854:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 858:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 85b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 85f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 861:	b8 22 0d 00 00       	mov    $0xd22,%eax
 866:	85 ff                	test   %edi,%edi
 868:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 86b:	0f b6 07             	movzbl (%edi),%eax
 86e:	84 c0                	test   %al,%al
 870:	74 2a                	je     89c <printf+0x1bc>
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 878:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 87b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 87e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 881:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 888:	00 
 889:	89 44 24 04          	mov    %eax,0x4(%esp)
 88d:	89 34 24             	mov    %esi,(%esp)
 890:	e8 bd fc ff ff       	call   552 <write>
        while(*s != 0){
 895:	0f b6 07             	movzbl (%edi),%eax
 898:	84 c0                	test   %al,%al
 89a:	75 dc                	jne    878 <printf+0x198>
      state = 0;
 89c:	31 ff                	xor    %edi,%edi
 89e:	e9 88 fe ff ff       	jmp    72b <printf+0x4b>
        putc(fd, *ap);
 8a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 8a6:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 8a8:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 8aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8b1:	00 
 8b2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 8b5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8b8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8bf:	e8 8e fc ff ff       	call   552 <write>
        ap++;
 8c4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8c8:	e9 5e fe ff ff       	jmp    72b <printf+0x4b>
 8cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 8d0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 8d3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 8d5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8dc:	00 
 8dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e1:	89 34 24             	mov    %esi,(%esp)
 8e4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 8e8:	e8 65 fc ff ff       	call   552 <write>
 8ed:	e9 39 fe ff ff       	jmp    72b <printf+0x4b>
 8f2:	66 90                	xchg   %ax,%ax
 8f4:	66 90                	xchg   %ax,%ax
 8f6:	66 90                	xchg   %ax,%ax
 8f8:	66 90                	xchg   %ax,%ax
 8fa:	66 90                	xchg   %ax,%ax
 8fc:	66 90                	xchg   %ax,%ax
 8fe:	66 90                	xchg   %ax,%ax

00000900 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 900:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 901:	a1 a0 12 00 00       	mov    0x12a0,%eax
{
 906:	89 e5                	mov    %esp,%ebp
 908:	57                   	push   %edi
 909:	56                   	push   %esi
 90a:	53                   	push   %ebx
 90b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 910:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 913:	39 d0                	cmp    %edx,%eax
 915:	72 11                	jb     928 <free+0x28>
 917:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 918:	39 c8                	cmp    %ecx,%eax
 91a:	72 04                	jb     920 <free+0x20>
 91c:	39 ca                	cmp    %ecx,%edx
 91e:	72 10                	jb     930 <free+0x30>
 920:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 922:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 924:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 926:	73 f0                	jae    918 <free+0x18>
 928:	39 ca                	cmp    %ecx,%edx
 92a:	72 04                	jb     930 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 92c:	39 c8                	cmp    %ecx,%eax
 92e:	72 f0                	jb     920 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 930:	8b 73 fc             	mov    -0x4(%ebx),%esi
 933:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 936:	39 cf                	cmp    %ecx,%edi
 938:	74 1e                	je     958 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 93a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 93d:	8b 48 04             	mov    0x4(%eax),%ecx
 940:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 943:	39 f2                	cmp    %esi,%edx
 945:	74 28                	je     96f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 947:	89 10                	mov    %edx,(%eax)
  freep = p;
 949:	a3 a0 12 00 00       	mov    %eax,0x12a0
}
 94e:	5b                   	pop    %ebx
 94f:	5e                   	pop    %esi
 950:	5f                   	pop    %edi
 951:	5d                   	pop    %ebp
 952:	c3                   	ret    
 953:	90                   	nop
 954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 958:	03 71 04             	add    0x4(%ecx),%esi
 95b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 95e:	8b 08                	mov    (%eax),%ecx
 960:	8b 09                	mov    (%ecx),%ecx
 962:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 965:	8b 48 04             	mov    0x4(%eax),%ecx
 968:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 96b:	39 f2                	cmp    %esi,%edx
 96d:	75 d8                	jne    947 <free+0x47>
    p->s.size += bp->s.size;
 96f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 972:	a3 a0 12 00 00       	mov    %eax,0x12a0
    p->s.size += bp->s.size;
 977:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 97a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 97d:	89 10                	mov    %edx,(%eax)
}
 97f:	5b                   	pop    %ebx
 980:	5e                   	pop    %esi
 981:	5f                   	pop    %edi
 982:	5d                   	pop    %ebp
 983:	c3                   	ret    
 984:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 98a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000990 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	57                   	push   %edi
 994:	56                   	push   %esi
 995:	53                   	push   %ebx
 996:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 999:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 99c:	8b 1d a0 12 00 00    	mov    0x12a0,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a2:	8d 48 07             	lea    0x7(%eax),%ecx
 9a5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 9a8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9aa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 9ad:	0f 84 9b 00 00 00    	je     a4e <malloc+0xbe>
 9b3:	8b 13                	mov    (%ebx),%edx
 9b5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9b8:	39 fe                	cmp    %edi,%esi
 9ba:	76 64                	jbe    a20 <malloc+0x90>
 9bc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 9c3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 9c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 9cb:	eb 0e                	jmp    9db <malloc+0x4b>
 9cd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9d2:	8b 78 04             	mov    0x4(%eax),%edi
 9d5:	39 fe                	cmp    %edi,%esi
 9d7:	76 4f                	jbe    a28 <malloc+0x98>
 9d9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9db:	3b 15 a0 12 00 00    	cmp    0x12a0,%edx
 9e1:	75 ed                	jne    9d0 <malloc+0x40>
  if(nu < 4096)
 9e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9e6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 9ec:	bf 00 10 00 00       	mov    $0x1000,%edi
 9f1:	0f 43 fe             	cmovae %esi,%edi
 9f4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 9f7:	89 04 24             	mov    %eax,(%esp)
 9fa:	e8 bb fb ff ff       	call   5ba <sbrk>
  if(p == (char*)-1)
 9ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 a02:	74 18                	je     a1c <malloc+0x8c>
  hp->s.size = nu;
 a04:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 a07:	83 c0 08             	add    $0x8,%eax
 a0a:	89 04 24             	mov    %eax,(%esp)
 a0d:	e8 ee fe ff ff       	call   900 <free>
  return freep;
 a12:	8b 15 a0 12 00 00    	mov    0x12a0,%edx
      if((p = morecore(nunits)) == 0)
 a18:	85 d2                	test   %edx,%edx
 a1a:	75 b4                	jne    9d0 <malloc+0x40>
        return 0;
 a1c:	31 c0                	xor    %eax,%eax
 a1e:	eb 20                	jmp    a40 <malloc+0xb0>
    if(p->s.size >= nunits){
 a20:	89 d0                	mov    %edx,%eax
 a22:	89 da                	mov    %ebx,%edx
 a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 a28:	39 fe                	cmp    %edi,%esi
 a2a:	74 1c                	je     a48 <malloc+0xb8>
        p->s.size -= nunits;
 a2c:	29 f7                	sub    %esi,%edi
 a2e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 a31:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 a34:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 a37:	89 15 a0 12 00 00    	mov    %edx,0x12a0
      return (void*)(p + 1);
 a3d:	83 c0 08             	add    $0x8,%eax
  }
}
 a40:	83 c4 1c             	add    $0x1c,%esp
 a43:	5b                   	pop    %ebx
 a44:	5e                   	pop    %esi
 a45:	5f                   	pop    %edi
 a46:	5d                   	pop    %ebp
 a47:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a48:	8b 08                	mov    (%eax),%ecx
 a4a:	89 0a                	mov    %ecx,(%edx)
 a4c:	eb e9                	jmp    a37 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 a4e:	c7 05 a0 12 00 00 a4 	movl   $0x12a4,0x12a0
 a55:	12 00 00 
    base.s.size = 0;
 a58:	ba a4 12 00 00       	mov    $0x12a4,%edx
    base.s.ptr = freep = prevp = &base;
 a5d:	c7 05 a4 12 00 00 a4 	movl   $0x12a4,0x12a4
 a64:	12 00 00 
    base.s.size = 0;
 a67:	c7 05 a8 12 00 00 00 	movl   $0x0,0x12a8
 a6e:	00 00 00 
 a71:	e9 46 ff ff ff       	jmp    9bc <malloc+0x2c>
 a76:	66 90                	xchg   %ax,%ax
 a78:	66 90                	xchg   %ax,%ax
 a7a:	66 90                	xchg   %ax,%ax
 a7c:	66 90                	xchg   %ax,%ax
 a7e:	66 90                	xchg   %ax,%ax

00000a80 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	56                   	push   %esi
 a84:	53                   	push   %ebx
 a85:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 a88:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 a8f:	e8 fc fe ff ff       	call   990 <malloc>

    if (bt == NULL) {
 a94:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 a96:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 a98:	74 66                	je     b00 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 a9a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 aa1:	e8 ea fe ff ff       	call   990 <malloc>
    if (bt->bt_stack == NULL) {
 aa6:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 aa8:	89 c3                	mov    %eax,%ebx
 aaa:	89 46 08             	mov    %eax,0x8(%esi)
 aad:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 ab0:	74 5d                	je     b0f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 ab2:	25 ff 0f 00 00       	and    $0xfff,%eax
 ab7:	75 37                	jne    af0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 ab9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 abf:	8b 45 10             	mov    0x10(%ebp),%eax
 ac2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 ac6:	89 44 24 04          	mov    %eax,0x4(%esp)
 aca:	8b 45 0c             	mov    0xc(%ebp),%eax
 acd:	89 04 24             	mov    %eax,(%esp)
 ad0:	e8 25 fb ff ff       	call   5fa <kthread_create>
    if (bt->bid != 0) {
 ad5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 ad7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 ad9:	74 2d                	je     b08 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 adb:	8b 45 08             	mov    0x8(%ebp),%eax
 ade:	89 30                	mov    %esi,(%eax)
        result = 0;
 ae0:	31 c0                	xor    %eax,%eax
}
 ae2:	83 c4 10             	add    $0x10,%esp
 ae5:	5b                   	pop    %ebx
 ae6:	5e                   	pop    %esi
 ae7:	5d                   	pop    %ebp
 ae8:	c3                   	ret    
 ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 af0:	29 c3                	sub    %eax,%ebx
 af2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 af8:	89 5e 04             	mov    %ebx,0x4(%esi)
 afb:	eb bc                	jmp    ab9 <benny_thread_create+0x39>
 afd:	8d 76 00             	lea    0x0(%esi),%esi
 b00:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 b06:	eb b7                	jmp    abf <benny_thread_create+0x3f>
    int result = -1;
 b08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b0d:	eb d3                	jmp    ae2 <benny_thread_create+0x62>
        free(bt);
 b0f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 b12:	31 f6                	xor    %esi,%esi
        free(bt);
 b14:	e8 e7 fd ff ff       	call   900 <free>
 b19:	8b 5b 04             	mov    0x4(%ebx),%ebx
 b1c:	eb a1                	jmp    abf <benny_thread_create+0x3f>
 b1e:	66 90                	xchg   %ax,%ax

00000b20 <benny_thread_bid>:
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 b23:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b26:	5d                   	pop    %ebp
    return bt->bid;
 b27:	8b 00                	mov    (%eax),%eax
}
 b29:	c3                   	ret    
 b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b30 <benny_thread_join>:
{
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	53                   	push   %ebx
 b34:	83 ec 14             	sub    $0x14,%esp
 b37:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 b3a:	8b 03                	mov    (%ebx),%eax
 b3c:	89 04 24             	mov    %eax,(%esp)
 b3f:	e8 be fa ff ff       	call   602 <kthread_join>
    if (retVal == 0) {
 b44:	85 c0                	test   %eax,%eax
 b46:	75 27                	jne    b6f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 b48:	8b 53 08             	mov    0x8(%ebx),%edx
 b4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b4e:	89 14 24             	mov    %edx,(%esp)
 b51:	e8 aa fd ff ff       	call   900 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 b56:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 b5d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 b64:	89 1c 24             	mov    %ebx,(%esp)
 b67:	e8 94 fd ff ff       	call   900 <free>
 b6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 b6f:	83 c4 14             	add    $0x14,%esp
 b72:	5b                   	pop    %ebx
 b73:	5d                   	pop    %ebp
 b74:	c3                   	ret    
 b75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <benny_thread_exit>:
{
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
}
 b83:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 b84:	e9 81 fa ff ff       	jmp    60a <kthread_exit>
 b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b90 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 b90:	55                   	push   %ebp
 b91:	89 e5                	mov    %esp,%ebp
 b93:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 b96:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 b9c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 ba3:	31 c0                	xor    %eax,%eax
 ba5:	5d                   	pop    %ebp
 ba6:	c3                   	ret    
 ba7:	89 f6                	mov    %esi,%esi
 ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 bb0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 bb1:	b8 01 00 00 00       	mov    $0x1,%eax
 bb6:	89 e5                	mov    %esp,%ebp
 bb8:	56                   	push   %esi
 bb9:	53                   	push   %ebx
 bba:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bbd:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 bc0:	85 c0                	test   %eax,%eax
 bc2:	be 01 00 00 00       	mov    $0x1,%esi
 bc7:	74 15                	je     bde <benny_mootex_yieldlock+0x2e>
 bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 bd0:	e8 45 fa ff ff       	call   61a <kthread_yield>
 bd5:	89 f0                	mov    %esi,%eax
 bd7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 bda:	85 c0                	test   %eax,%eax
 bdc:	75 f2                	jne    bd0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 bde:	e8 2f fa ff ff       	call   612 <kthread_self>
    benny_mootex->bid = benny_self();
 be3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 be6:	31 c0                	xor    %eax,%eax
 be8:	5b                   	pop    %ebx
 be9:	5e                   	pop    %esi
 bea:	5d                   	pop    %ebp
 beb:	c3                   	ret    
 bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bf0 <benny_mootex_spinlock>:
{
 bf0:	55                   	push   %ebp
 bf1:	ba 01 00 00 00       	mov    $0x1,%edx
 bf6:	89 e5                	mov    %esp,%ebp
 bf8:	53                   	push   %ebx
 bf9:	83 ec 04             	sub    $0x4,%esp
 bfc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bff:	90                   	nop
 c00:	89 d0                	mov    %edx,%eax
 c02:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 c05:	85 c0                	test   %eax,%eax
 c07:	75 f7                	jne    c00 <benny_mootex_spinlock+0x10>
    return kthread_self();
 c09:	e8 04 fa ff ff       	call   612 <kthread_self>
    benny_mootex->bid = benny_self();
 c0e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 c11:	83 c4 04             	add    $0x4,%esp
 c14:	31 c0                	xor    %eax,%eax
 c16:	5b                   	pop    %ebx
 c17:	5d                   	pop    %ebp
 c18:	c3                   	ret    
 c19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c20 <benny_mootex_unlock>:
{
 c20:	55                   	push   %ebp
 c21:	89 e5                	mov    %esp,%ebp
 c23:	53                   	push   %ebx
 c24:	83 ec 04             	sub    $0x4,%esp
 c27:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 c2a:	e8 e3 f9 ff ff       	call   612 <kthread_self>
    if(tid == benny_mootex->bid){
 c2f:	39 43 04             	cmp    %eax,0x4(%ebx)
 c32:	75 1c                	jne    c50 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 c34:	0f ae f0             	mfence 
    return 0;
 c37:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 c39:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 c40:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 c46:	83 c4 04             	add    $0x4,%esp
 c49:	5b                   	pop    %ebx
 c4a:	5d                   	pop    %ebp
 c4b:	c3                   	ret    
 c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c50:	83 c4 04             	add    $0x4,%esp
      return -1;
 c53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 c58:	5b                   	pop    %ebx
 c59:	5d                   	pop    %ebp
 c5a:	c3                   	ret    
 c5b:	90                   	nop
 c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c60 <benny_mootex_trylock>:
{
 c60:	55                   	push   %ebp
 c61:	b8 01 00 00 00       	mov    $0x1,%eax
 c66:	89 e5                	mov    %esp,%ebp
 c68:	53                   	push   %ebx
 c69:	83 ec 04             	sub    $0x4,%esp
 c6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c6f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 c72:	85 c0                	test   %eax,%eax
 c74:	75 08                	jne    c7e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 c76:	e8 97 f9 ff ff       	call   612 <kthread_self>
        benny_mootex->bid = tid;
 c7b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 c7e:	83 c4 04             	add    $0x4,%esp
 c81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c86:	5b                   	pop    %ebx
 c87:	5d                   	pop    %ebp
 c88:	c3                   	ret    
 c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c90 <benny_mootex_wholock>:
{
 c90:	55                   	push   %ebp
 c91:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 c93:	8b 45 08             	mov    0x8(%ebp),%eax
}
 c96:	5d                   	pop    %ebp
    return benny_mootex->bid;
 c97:	8b 40 04             	mov    0x4(%eax),%eax
}
 c9a:	c3                   	ret    
 c9b:	90                   	nop
 c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ca0 <benny_mootex_islocked>:
{
 ca0:	55                   	push   %ebp
 ca1:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 ca3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 ca6:	5d                   	pop    %ebp
    return benny_mootex->locked;
 ca7:	8b 00                	mov    (%eax),%eax
}
 ca9:	c3                   	ret    
 caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000cb0 <benny_self>:
{
 cb0:	55                   	push   %ebp
 cb1:	89 e5                	mov    %esp,%ebp
}
 cb3:	5d                   	pop    %ebp
    return kthread_self();
 cb4:	e9 59 f9 ff ff       	jmp    612 <kthread_self>
 cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <benny_yield>:
{
 cc0:	55                   	push   %ebp
 cc1:	89 e5                	mov    %esp,%ebp
    
}
 cc3:	5d                   	pop    %ebp
    return kthread_yield();
 cc4:	e9 51 f9 ff ff       	jmp    61a <kthread_yield>
 cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cd0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 cd0:	55                   	push   %ebp
 cd1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 cd3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 cd4:	e9 49 f9 ff ff       	jmp    622 <kthread_cpu_count>
 cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ce0 <benny_thread_count>:

int
benny_thread_count(void)
{
 ce0:	55                   	push   %ebp
 ce1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 ce3:	5d                   	pop    %ebp
    return kthread_thread_count();
 ce4:	e9 41 f9 ff ff       	jmp    62a <kthread_thread_count>
