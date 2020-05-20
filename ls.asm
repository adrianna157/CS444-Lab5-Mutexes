
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
#ifdef LS_IS_MORE
  printf(1, "%s\t\t%s\t%s\t%s\t%s\n",
         "name", "type", "# lks", "ino #", "size"
      );
#endif // LS_IS_MORE
  if(argc < 2){
   6:	bb 01 00 00 00       	mov    $0x1,%ebx
{
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 20             	sub    $0x20,%esp
  11:	8b 75 08             	mov    0x8(%ebp),%esi
  printf(1, "%s\t\t%s\t%s\t%s\t%s\n",
  14:	c7 44 24 18 04 0e 00 	movl   $0xe04,0x18(%esp)
  1b:	00 
{
  1c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  printf(1, "%s\t\t%s\t%s\t%s\t%s\n",
  1f:	c7 44 24 14 09 0e 00 	movl   $0xe09,0x14(%esp)
  26:	00 
  27:	c7 44 24 10 0f 0e 00 	movl   $0xe0f,0x10(%esp)
  2e:	00 
  2f:	c7 44 24 0c 15 0e 00 	movl   $0xe15,0xc(%esp)
  36:	00 
  37:	c7 44 24 08 1a 0e 00 	movl   $0xe1a,0x8(%esp)
  3e:	00 
  3f:	c7 44 24 04 1f 0e 00 	movl   $0xe1f,0x4(%esp)
  46:	00 
  47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4e:	e8 5d 07 00 00       	call   7b0 <printf>
  if(argc < 2){
  53:	83 fe 01             	cmp    $0x1,%esi
  56:	7e 17                	jle    6f <main+0x6f>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  58:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
  for(i=1; i<argc; i++)
  5b:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  5e:	89 04 24             	mov    %eax,(%esp)
  61:	e8 da 00 00 00       	call   140 <ls>
  for(i=1; i<argc; i++)
  66:	39 f3                	cmp    %esi,%ebx
  68:	75 ee                	jne    58 <main+0x58>
  exit();
  6a:	e8 93 05 00 00       	call   602 <exit>
    ls(".");
  6f:	c7 04 24 30 0e 00 00 	movl   $0xe30,(%esp)
  76:	e8 c5 00 00 00       	call   140 <ls>
    exit();
  7b:	e8 82 05 00 00       	call   602 <exit>

00000080 <filetype>:
{
  80:	55                   	push   %ebp
    switch (sttype) {
  81:	b8 3f 00 00 00       	mov    $0x3f,%eax
{
  86:	89 e5                	mov    %esp,%ebp
  88:	8b 55 08             	mov    0x8(%ebp),%edx
  8b:	8d 4a ff             	lea    -0x1(%edx),%ecx
  8e:	83 f9 02             	cmp    $0x2,%ecx
  91:	77 07                	ja     9a <filetype+0x1a>
  93:	0f b6 82 31 0e 00 00 	movzbl 0xe31(%edx),%eax
}
  9a:	5d                   	pop    %ebp
  9b:	c3                   	ret    
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <fmtname>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
  a5:	83 ec 10             	sub    $0x10,%esp
  a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  ab:	89 1c 24             	mov    %ebx,(%esp)
  ae:	e8 ad 03 00 00       	call   460 <strlen>
  b3:	01 d8                	add    %ebx,%eax
  b5:	73 10                	jae    c7 <fmtname+0x27>
  b7:	eb 13                	jmp    cc <fmtname+0x2c>
  b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  c0:	83 e8 01             	sub    $0x1,%eax
  c3:	39 c3                	cmp    %eax,%ebx
  c5:	77 05                	ja     cc <fmtname+0x2c>
  c7:	80 38 2f             	cmpb   $0x2f,(%eax)
  ca:	75 f4                	jne    c0 <fmtname+0x20>
  p++;
  cc:	8d 58 01             	lea    0x1(%eax),%ebx
  if(strlen(p) >= DIRSIZ)
  cf:	89 1c 24             	mov    %ebx,(%esp)
  d2:	e8 89 03 00 00       	call   460 <strlen>
  d7:	83 f8 0d             	cmp    $0xd,%eax
  da:	77 53                	ja     12f <fmtname+0x8f>
  memmove(buf, p, strlen(p));
  dc:	89 1c 24             	mov    %ebx,(%esp)
  df:	e8 7c 03 00 00       	call   460 <strlen>
  e4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  e8:	c7 04 24 50 13 00 00 	movl   $0x1350,(%esp)
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	e8 d8 04 00 00       	call   5d0 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  f8:	89 1c 24             	mov    %ebx,(%esp)
  fb:	e8 60 03 00 00       	call   460 <strlen>
 100:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
 103:	bb 50 13 00 00       	mov    $0x1350,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
 108:	89 c6                	mov    %eax,%esi
 10a:	e8 51 03 00 00       	call   460 <strlen>
 10f:	ba 0e 00 00 00       	mov    $0xe,%edx
 114:	29 f2                	sub    %esi,%edx
 116:	89 54 24 08          	mov    %edx,0x8(%esp)
 11a:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
 121:	00 
 122:	05 50 13 00 00       	add    $0x1350,%eax
 127:	89 04 24             	mov    %eax,(%esp)
 12a:	e8 61 03 00 00       	call   490 <memset>
}
 12f:	83 c4 10             	add    $0x10,%esp
 132:	89 d8                	mov    %ebx,%eax
 134:	5b                   	pop    %ebx
 135:	5e                   	pop    %esi
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    
 138:	90                   	nop
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <ls>:
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
 14c:	8b 75 08             	mov    0x8(%ebp),%esi
  if((fd = open(path, 0)) < 0){
 14f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 156:	00 
 157:	89 34 24             	mov    %esi,(%esp)
 15a:	e8 e3 04 00 00       	call   642 <open>
 15f:	85 c0                	test   %eax,%eax
 161:	89 c3                	mov    %eax,%ebx
 163:	0f 88 e7 01 00 00    	js     350 <ls+0x210>
  if(fstat(fd, &st) < 0){
 169:	8d bd d4 fd ff ff    	lea    -0x22c(%ebp),%edi
 16f:	89 7c 24 04          	mov    %edi,0x4(%esp)
 173:	89 04 24             	mov    %eax,(%esp)
 176:	e8 df 04 00 00       	call   65a <fstat>
 17b:	85 c0                	test   %eax,%eax
 17d:	0f 88 15 02 00 00    	js     398 <ls+0x258>
  switch(st.type){
 183:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 18a:	66 83 f8 01          	cmp    $0x1,%ax
 18e:	74 78                	je     208 <ls+0xc8>
 190:	66 83 f8 02          	cmp    $0x2,%ax
 194:	75 5f                	jne    1f5 <ls+0xb5>
      printf(1, "%s\t%c\t%d\t%d\t%d\n"
 196:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 19c:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 1a2:	89 34 24             	mov    %esi,(%esp)
 1a5:	0f bf bd e0 fd ff ff 	movswl -0x220(%ebp),%edi
 1ac:	89 8d b0 fd ff ff    	mov    %ecx,-0x250(%ebp)
 1b2:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 1b8:	e8 e3 fe ff ff       	call   a0 <fmtname>
 1bd:	8b 8d b0 fd ff ff    	mov    -0x250(%ebp),%ecx
 1c3:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 1c9:	89 7c 24 10          	mov    %edi,0x10(%esp)
 1cd:	c7 44 24 0c 66 00 00 	movl   $0x66,0xc(%esp)
 1d4:	00 
 1d5:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 1d9:	89 54 24 14          	mov    %edx,0x14(%esp)
 1dd:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e1:	c7 44 24 04 e1 0d 00 	movl   $0xde1,0x4(%esp)
 1e8:	00 
 1e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1f0:	e8 bb 05 00 00       	call   7b0 <printf>
  close(fd);
 1f5:	89 1c 24             	mov    %ebx,(%esp)
 1f8:	e8 2d 04 00 00       	call   62a <close>
}
 1fd:	81 c4 7c 02 00 00    	add    $0x27c,%esp
 203:	5b                   	pop    %ebx
 204:	5e                   	pop    %esi
 205:	5f                   	pop    %edi
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 208:	89 34 24             	mov    %esi,(%esp)
 20b:	e8 50 02 00 00       	call   460 <strlen>
 210:	83 c0 10             	add    $0x10,%eax
 213:	3d 00 02 00 00       	cmp    $0x200,%eax
 218:	0f 87 5a 01 00 00    	ja     378 <ls+0x238>
    strcpy(buf, path);
 21e:	89 74 24 04          	mov    %esi,0x4(%esp)
 222:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 228:	89 34 24             	mov    %esi,(%esp)
 22b:	e8 b0 01 00 00       	call   3e0 <strcpy>
    p = buf+strlen(buf);
 230:	89 34 24             	mov    %esi,(%esp)
 233:	e8 28 02 00 00       	call   460 <strlen>
 238:	01 f0                	add    %esi,%eax
    *p++ = '/';
 23a:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 23d:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
    *p++ = '/';
 243:	89 8d a0 fd ff ff    	mov    %ecx,-0x260(%ebp)
 249:	c6 00 2f             	movb   $0x2f,(%eax)
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 250:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 256:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 25d:	00 
 25e:	89 44 24 04          	mov    %eax,0x4(%esp)
 262:	89 1c 24             	mov    %ebx,(%esp)
 265:	e8 b0 03 00 00       	call   61a <read>
 26a:	83 f8 10             	cmp    $0x10,%eax
 26d:	75 86                	jne    1f5 <ls+0xb5>
      if(de.inum == 0)
 26f:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 276:	00 
 277:	74 d7                	je     250 <ls+0x110>
      memmove(p, de.name, DIRSIZ);
 279:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 27f:	89 44 24 04          	mov    %eax,0x4(%esp)
 283:	8b 85 a0 fd ff ff    	mov    -0x260(%ebp),%eax
 289:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 290:	00 
 291:	89 04 24             	mov    %eax,(%esp)
 294:	e8 37 03 00 00       	call   5d0 <memmove>
      p[DIRSIZ] = 0;
 299:	8b 85 a4 fd ff ff    	mov    -0x25c(%ebp),%eax
 29f:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 2a3:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2a7:	89 34 24             	mov    %esi,(%esp)
 2aa:	e8 a1 02 00 00       	call   550 <stat>
 2af:	85 c0                	test   %eax,%eax
 2b1:	0f 88 09 01 00 00    	js     3c0 <ls+0x280>
      printf(1, "%s\t%c\t%d\t%d\t%d\n", fmtname(buf), filetype(st.type), st.nlink, st.ino, st.size);
 2b7:	8b 85 dc fd ff ff    	mov    -0x224(%ebp),%eax
    switch (sttype) {
 2bd:	ba 3f 00 00 00       	mov    $0x3f,%edx
      printf(1, "%s\t%c\t%d\t%d\t%d\n", fmtname(buf), filetype(st.type), st.nlink, st.ino, st.size);
 2c2:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 2c8:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 2ce:	0f bf 85 e0 fd ff ff 	movswl -0x220(%ebp),%eax
 2d5:	89 85 b0 fd ff ff    	mov    %eax,-0x250(%ebp)
    switch (sttype) {
 2db:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 2e2:	83 e8 01             	sub    $0x1,%eax
 2e5:	83 f8 02             	cmp    $0x2,%eax
 2e8:	77 07                	ja     2f1 <ls+0x1b1>
 2ea:	0f be 90 32 0e 00 00 	movsbl 0xe32(%eax),%edx
      printf(1, "%s\t%c\t%d\t%d\t%d\n", fmtname(buf), filetype(st.type), st.nlink, st.ino, st.size);
 2f1:	89 34 24             	mov    %esi,(%esp)
 2f4:	89 8d a8 fd ff ff    	mov    %ecx,-0x258(%ebp)
 2fa:	89 95 ac fd ff ff    	mov    %edx,-0x254(%ebp)
 300:	e8 9b fd ff ff       	call   a0 <fmtname>
 305:	8b 8d a8 fd ff ff    	mov    -0x258(%ebp),%ecx
 30b:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 311:	c7 44 24 04 e1 0d 00 	movl   $0xde1,0x4(%esp)
 318:	00 
 319:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 320:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 324:	8b 8d b4 fd ff ff    	mov    -0x24c(%ebp),%ecx
 32a:	89 54 24 10          	mov    %edx,0x10(%esp)
 32e:	8b 95 ac fd ff ff    	mov    -0x254(%ebp),%edx
 334:	89 44 24 08          	mov    %eax,0x8(%esp)
 338:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 33c:	89 54 24 0c          	mov    %edx,0xc(%esp)
 340:	e8 6b 04 00 00       	call   7b0 <printf>
 345:	e9 06 ff ff ff       	jmp    250 <ls+0x110>
 34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 350:	89 74 24 08          	mov    %esi,0x8(%esp)
 354:	c7 44 24 04 b9 0d 00 	movl   $0xdb9,0x4(%esp)
 35b:	00 
 35c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 363:	e8 48 04 00 00       	call   7b0 <printf>
}
 368:	81 c4 7c 02 00 00    	add    $0x27c,%esp
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5f                   	pop    %edi
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    
 373:	90                   	nop
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 378:	c7 44 24 04 f1 0d 00 	movl   $0xdf1,0x4(%esp)
 37f:	00 
 380:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 387:	e8 24 04 00 00       	call   7b0 <printf>
      break;
 38c:	e9 64 fe ff ff       	jmp    1f5 <ls+0xb5>
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot stat %s\n", path);
 398:	89 74 24 08          	mov    %esi,0x8(%esp)
 39c:	c7 44 24 04 cd 0d 00 	movl   $0xdcd,0x4(%esp)
 3a3:	00 
 3a4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 3ab:	e8 00 04 00 00       	call   7b0 <printf>
    close(fd);
 3b0:	89 1c 24             	mov    %ebx,(%esp)
 3b3:	e8 72 02 00 00       	call   62a <close>
    return;
 3b8:	e9 40 fe ff ff       	jmp    1fd <ls+0xbd>
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 3c0:	89 74 24 08          	mov    %esi,0x8(%esp)
 3c4:	c7 44 24 04 cd 0d 00 	movl   $0xdcd,0x4(%esp)
 3cb:	00 
 3cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3d3:	e8 d8 03 00 00       	call   7b0 <printf>
        continue;
 3d8:	e9 73 fe ff ff       	jmp    250 <ls+0x110>
 3dd:	66 90                	xchg   %ax,%ax
 3df:	90                   	nop

000003e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3e9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3ea:	89 c2                	mov    %eax,%edx
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3f0:	83 c1 01             	add    $0x1,%ecx
 3f3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 3f7:	83 c2 01             	add    $0x1,%edx
 3fa:	84 db                	test   %bl,%bl
 3fc:	88 5a ff             	mov    %bl,-0x1(%edx)
 3ff:	75 ef                	jne    3f0 <strcpy+0x10>
    ;
  return os;
}
 401:	5b                   	pop    %ebx
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 40a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000410 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 55 08             	mov    0x8(%ebp),%edx
 416:	53                   	push   %ebx
 417:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 41a:	0f b6 02             	movzbl (%edx),%eax
 41d:	84 c0                	test   %al,%al
 41f:	74 2d                	je     44e <strcmp+0x3e>
 421:	0f b6 19             	movzbl (%ecx),%ebx
 424:	38 d8                	cmp    %bl,%al
 426:	74 0e                	je     436 <strcmp+0x26>
 428:	eb 2b                	jmp    455 <strcmp+0x45>
 42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 430:	38 c8                	cmp    %cl,%al
 432:	75 15                	jne    449 <strcmp+0x39>
    p++, q++;
 434:	89 d9                	mov    %ebx,%ecx
 436:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 439:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 43c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 43f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 443:	84 c0                	test   %al,%al
 445:	75 e9                	jne    430 <strcmp+0x20>
 447:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 449:	29 c8                	sub    %ecx,%eax
}
 44b:	5b                   	pop    %ebx
 44c:	5d                   	pop    %ebp
 44d:	c3                   	ret    
 44e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 451:	31 c0                	xor    %eax,%eax
 453:	eb f4                	jmp    449 <strcmp+0x39>
 455:	0f b6 cb             	movzbl %bl,%ecx
 458:	eb ef                	jmp    449 <strcmp+0x39>
 45a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000460 <strlen>:

uint
strlen(const char *s)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 466:	80 39 00             	cmpb   $0x0,(%ecx)
 469:	74 12                	je     47d <strlen+0x1d>
 46b:	31 d2                	xor    %edx,%edx
 46d:	8d 76 00             	lea    0x0(%esi),%esi
 470:	83 c2 01             	add    $0x1,%edx
 473:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 477:	89 d0                	mov    %edx,%eax
 479:	75 f5                	jne    470 <strlen+0x10>
    ;
  return n;
}
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 47d:	31 c0                	xor    %eax,%eax
}
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    
 481:	eb 0d                	jmp    490 <memset>
 483:	90                   	nop
 484:	90                   	nop
 485:	90                   	nop
 486:	90                   	nop
 487:	90                   	nop
 488:	90                   	nop
 489:	90                   	nop
 48a:	90                   	nop
 48b:	90                   	nop
 48c:	90                   	nop
 48d:	90                   	nop
 48e:	90                   	nop
 48f:	90                   	nop

00000490 <memset>:

void*
memset(void *dst, int c, uint n)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	8b 55 08             	mov    0x8(%ebp),%edx
 496:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 497:	8b 4d 10             	mov    0x10(%ebp),%ecx
 49a:	8b 45 0c             	mov    0xc(%ebp),%eax
 49d:	89 d7                	mov    %edx,%edi
 49f:	fc                   	cld    
 4a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	5f                   	pop    %edi
 4a5:	5d                   	pop    %ebp
 4a6:	c3                   	ret    
 4a7:	89 f6                	mov    %esi,%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <strchr>:

char*
strchr(const char *s, char c)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	53                   	push   %ebx
 4b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 4ba:	0f b6 18             	movzbl (%eax),%ebx
 4bd:	84 db                	test   %bl,%bl
 4bf:	74 1d                	je     4de <strchr+0x2e>
    if(*s == c)
 4c1:	38 d3                	cmp    %dl,%bl
 4c3:	89 d1                	mov    %edx,%ecx
 4c5:	75 0d                	jne    4d4 <strchr+0x24>
 4c7:	eb 17                	jmp    4e0 <strchr+0x30>
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4d0:	38 ca                	cmp    %cl,%dl
 4d2:	74 0c                	je     4e0 <strchr+0x30>
  for(; *s; s++)
 4d4:	83 c0 01             	add    $0x1,%eax
 4d7:	0f b6 10             	movzbl (%eax),%edx
 4da:	84 d2                	test   %dl,%dl
 4dc:	75 f2                	jne    4d0 <strchr+0x20>
      return (char*)s;
  return 0;
 4de:	31 c0                	xor    %eax,%eax
}
 4e0:	5b                   	pop    %ebx
 4e1:	5d                   	pop    %ebp
 4e2:	c3                   	ret    
 4e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004f0 <gets>:

char*
gets(char *buf, int max)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4f5:	31 f6                	xor    %esi,%esi
{
 4f7:	53                   	push   %ebx
 4f8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 4fb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 4fe:	eb 31                	jmp    531 <gets+0x41>
    cc = read(0, &c, 1);
 500:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 507:	00 
 508:	89 7c 24 04          	mov    %edi,0x4(%esp)
 50c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 513:	e8 02 01 00 00       	call   61a <read>
    if(cc < 1)
 518:	85 c0                	test   %eax,%eax
 51a:	7e 1d                	jle    539 <gets+0x49>
      break;
    buf[i++] = c;
 51c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 520:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 522:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 525:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 527:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 52b:	74 0c                	je     539 <gets+0x49>
 52d:	3c 0a                	cmp    $0xa,%al
 52f:	74 08                	je     539 <gets+0x49>
  for(i=0; i+1 < max; ){
 531:	8d 5e 01             	lea    0x1(%esi),%ebx
 534:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 537:	7c c7                	jl     500 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 540:	83 c4 2c             	add    $0x2c,%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	90                   	nop
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <stat>:

int
stat(const char *n, struct stat *st)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	56                   	push   %esi
 554:	53                   	push   %ebx
 555:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 562:	00 
 563:	89 04 24             	mov    %eax,(%esp)
 566:	e8 d7 00 00 00       	call   642 <open>
  if(fd < 0)
 56b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 56d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 56f:	78 27                	js     598 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 571:	8b 45 0c             	mov    0xc(%ebp),%eax
 574:	89 1c 24             	mov    %ebx,(%esp)
 577:	89 44 24 04          	mov    %eax,0x4(%esp)
 57b:	e8 da 00 00 00       	call   65a <fstat>
  close(fd);
 580:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 583:	89 c6                	mov    %eax,%esi
  close(fd);
 585:	e8 a0 00 00 00       	call   62a <close>
  return r;
 58a:	89 f0                	mov    %esi,%eax
}
 58c:	83 c4 10             	add    $0x10,%esp
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5d                   	pop    %ebp
 592:	c3                   	ret    
 593:	90                   	nop
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 598:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 59d:	eb ed                	jmp    58c <stat+0x3c>
 59f:	90                   	nop

000005a0 <atoi>:

int
atoi(const char *s)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 5a6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5a7:	0f be 11             	movsbl (%ecx),%edx
 5aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 5ad:	3c 09                	cmp    $0x9,%al
  n = 0;
 5af:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 5b4:	77 17                	ja     5cd <atoi+0x2d>
 5b6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 5b8:	83 c1 01             	add    $0x1,%ecx
 5bb:	8d 04 80             	lea    (%eax,%eax,4),%eax
 5be:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 5c2:	0f be 11             	movsbl (%ecx),%edx
 5c5:	8d 5a d0             	lea    -0x30(%edx),%ebx
 5c8:	80 fb 09             	cmp    $0x9,%bl
 5cb:	76 eb                	jbe    5b8 <atoi+0x18>
  return n;
}
 5cd:	5b                   	pop    %ebx
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    

000005d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5d0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5d1:	31 d2                	xor    %edx,%edx
{
 5d3:	89 e5                	mov    %esp,%ebp
 5d5:	56                   	push   %esi
 5d6:	8b 45 08             	mov    0x8(%ebp),%eax
 5d9:	53                   	push   %ebx
 5da:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5dd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 5e0:	85 db                	test   %ebx,%ebx
 5e2:	7e 12                	jle    5f6 <memmove+0x26>
 5e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 5e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 5ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 5ef:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 5f2:	39 da                	cmp    %ebx,%edx
 5f4:	75 f2                	jne    5e8 <memmove+0x18>
  return vdst;
}
 5f6:	5b                   	pop    %ebx
 5f7:	5e                   	pop    %esi
 5f8:	5d                   	pop    %ebp
 5f9:	c3                   	ret    

000005fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5fa:	b8 01 00 00 00       	mov    $0x1,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <exit>:
SYSCALL(exit)
 602:	b8 02 00 00 00       	mov    $0x2,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <wait>:
SYSCALL(wait)
 60a:	b8 03 00 00 00       	mov    $0x3,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <pipe>:
SYSCALL(pipe)
 612:	b8 04 00 00 00       	mov    $0x4,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <read>:
SYSCALL(read)
 61a:	b8 05 00 00 00       	mov    $0x5,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <write>:
SYSCALL(write)
 622:	b8 10 00 00 00       	mov    $0x10,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <close>:
SYSCALL(close)
 62a:	b8 15 00 00 00       	mov    $0x15,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <kill>:
SYSCALL(kill)
 632:	b8 06 00 00 00       	mov    $0x6,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <exec>:
SYSCALL(exec)
 63a:	b8 07 00 00 00       	mov    $0x7,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <open>:
SYSCALL(open)
 642:	b8 0f 00 00 00       	mov    $0xf,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <mknod>:
SYSCALL(mknod)
 64a:	b8 11 00 00 00       	mov    $0x11,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <unlink>:
SYSCALL(unlink)
 652:	b8 12 00 00 00       	mov    $0x12,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <fstat>:
SYSCALL(fstat)
 65a:	b8 08 00 00 00       	mov    $0x8,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <link>:
SYSCALL(link)
 662:	b8 13 00 00 00       	mov    $0x13,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <mkdir>:
SYSCALL(mkdir)
 66a:	b8 14 00 00 00       	mov    $0x14,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <chdir>:
SYSCALL(chdir)
 672:	b8 09 00 00 00       	mov    $0x9,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <dup>:
SYSCALL(dup)
 67a:	b8 0a 00 00 00       	mov    $0xa,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <getpid>:
SYSCALL(getpid)
 682:	b8 0b 00 00 00       	mov    $0xb,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <sbrk>:
SYSCALL(sbrk)
 68a:	b8 0c 00 00 00       	mov    $0xc,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <sleep>:
SYSCALL(sleep)
 692:	b8 0d 00 00 00       	mov    $0xd,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <uptime>:
SYSCALL(uptime)
 69a:	b8 0e 00 00 00       	mov    $0xe,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 6a2:	b8 16 00 00 00       	mov    $0x16,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 6aa:	b8 17 00 00 00       	mov    $0x17,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 6b2:	b8 18 00 00 00       	mov    $0x18,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 6ba:	b8 19 00 00 00       	mov    $0x19,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 6c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 6ca:	b8 1b 00 00 00       	mov    $0x1b,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <kthread_join>:
SYSCALL(kthread_join)
 6d2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <kthread_exit>:
SYSCALL(kthread_exit)
 6da:	b8 1d 00 00 00       	mov    $0x1d,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 6e2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <kthread_yield>:
SYSCALL(kthread_yield)
 6ea:	b8 1f 00 00 00       	mov    $0x1f,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 6f2:	b8 20 00 00 00       	mov    $0x20,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 6fa:	b8 21 00 00 00       	mov    $0x21,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    
 702:	66 90                	xchg   %ax,%ax
 704:	66 90                	xchg   %ax,%ax
 706:	66 90                	xchg   %ax,%ax
 708:	66 90                	xchg   %ax,%ax
 70a:	66 90                	xchg   %ax,%ax
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	89 c6                	mov    %eax,%esi
 717:	53                   	push   %ebx
 718:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 71e:	85 db                	test   %ebx,%ebx
 720:	74 09                	je     72b <printint+0x1b>
 722:	89 d0                	mov    %edx,%eax
 724:	c1 e8 1f             	shr    $0x1f,%eax
 727:	84 c0                	test   %al,%al
 729:	75 75                	jne    7a0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 72b:	89 d0                	mov    %edx,%eax
  neg = 0;
 72d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 734:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 737:	31 ff                	xor    %edi,%edi
 739:	89 ce                	mov    %ecx,%esi
 73b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 73e:	eb 02                	jmp    742 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 740:	89 cf                	mov    %ecx,%edi
 742:	31 d2                	xor    %edx,%edx
 744:	f7 f6                	div    %esi
 746:	8d 4f 01             	lea    0x1(%edi),%ecx
 749:	0f b6 92 3c 0e 00 00 	movzbl 0xe3c(%edx),%edx
  }while((x /= base) != 0);
 750:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 752:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 755:	75 e9                	jne    740 <printint+0x30>
  if(neg)
 757:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 75a:	89 c8                	mov    %ecx,%eax
 75c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 75f:	85 d2                	test   %edx,%edx
 761:	74 08                	je     76b <printint+0x5b>
    buf[i++] = '-';
 763:	8d 4f 02             	lea    0x2(%edi),%ecx
 766:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 76b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 76e:	66 90                	xchg   %ax,%ax
 770:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 775:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 778:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 77f:	00 
 780:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 784:	89 34 24             	mov    %esi,(%esp)
 787:	88 45 d7             	mov    %al,-0x29(%ebp)
 78a:	e8 93 fe ff ff       	call   622 <write>
  while(--i >= 0)
 78f:	83 ff ff             	cmp    $0xffffffff,%edi
 792:	75 dc                	jne    770 <printint+0x60>
    putc(fd, buf[i]);
}
 794:	83 c4 4c             	add    $0x4c,%esp
 797:	5b                   	pop    %ebx
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 7a0:	89 d0                	mov    %edx,%eax
 7a2:	f7 d8                	neg    %eax
    neg = 1;
 7a4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 7ab:	eb 87                	jmp    734 <printint+0x24>
 7ad:	8d 76 00             	lea    0x0(%esi),%esi

000007b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 7b4:	31 ff                	xor    %edi,%edi
{
 7b6:	56                   	push   %esi
 7b7:	53                   	push   %ebx
 7b8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 7be:	8d 45 10             	lea    0x10(%ebp),%eax
{
 7c1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 7c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 7c7:	0f b6 13             	movzbl (%ebx),%edx
 7ca:	83 c3 01             	add    $0x1,%ebx
 7cd:	84 d2                	test   %dl,%dl
 7cf:	75 39                	jne    80a <printf+0x5a>
 7d1:	e9 ca 00 00 00       	jmp    8a0 <printf+0xf0>
 7d6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7d8:	83 fa 25             	cmp    $0x25,%edx
 7db:	0f 84 c7 00 00 00    	je     8a8 <printf+0xf8>
  write(fd, &c, 1);
 7e1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 7e4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7eb:	00 
 7ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 7f3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 7f6:	e8 27 fe ff ff       	call   622 <write>
 7fb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 7fe:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 802:	84 d2                	test   %dl,%dl
 804:	0f 84 96 00 00 00    	je     8a0 <printf+0xf0>
    if(state == 0){
 80a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 80c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 80f:	74 c7                	je     7d8 <printf+0x28>
      }
    } else if(state == '%'){
 811:	83 ff 25             	cmp    $0x25,%edi
 814:	75 e5                	jne    7fb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 816:	83 fa 75             	cmp    $0x75,%edx
 819:	0f 84 99 00 00 00    	je     8b8 <printf+0x108>
 81f:	83 fa 64             	cmp    $0x64,%edx
 822:	0f 84 90 00 00 00    	je     8b8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 828:	25 f7 00 00 00       	and    $0xf7,%eax
 82d:	83 f8 70             	cmp    $0x70,%eax
 830:	0f 84 aa 00 00 00    	je     8e0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 836:	83 fa 73             	cmp    $0x73,%edx
 839:	0f 84 e9 00 00 00    	je     928 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 83f:	83 fa 63             	cmp    $0x63,%edx
 842:	0f 84 2b 01 00 00    	je     973 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 848:	83 fa 25             	cmp    $0x25,%edx
 84b:	0f 84 4f 01 00 00    	je     9a0 <printf+0x1f0>
  write(fd, &c, 1);
 851:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 854:	83 c3 01             	add    $0x1,%ebx
 857:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 85e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 85f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 861:	89 44 24 04          	mov    %eax,0x4(%esp)
 865:	89 34 24             	mov    %esi,(%esp)
 868:	89 55 d0             	mov    %edx,-0x30(%ebp)
 86b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 86f:	e8 ae fd ff ff       	call   622 <write>
        putc(fd, c);
 874:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 877:	8d 45 e7             	lea    -0x19(%ebp),%eax
 87a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 881:	00 
 882:	89 44 24 04          	mov    %eax,0x4(%esp)
 886:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 889:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 88c:	e8 91 fd ff ff       	call   622 <write>
  for(i = 0; fmt[i]; i++){
 891:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 895:	84 d2                	test   %dl,%dl
 897:	0f 85 6d ff ff ff    	jne    80a <printf+0x5a>
 89d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 8a0:	83 c4 3c             	add    $0x3c,%esp
 8a3:	5b                   	pop    %ebx
 8a4:	5e                   	pop    %esi
 8a5:	5f                   	pop    %edi
 8a6:	5d                   	pop    %ebp
 8a7:	c3                   	ret    
        state = '%';
 8a8:	bf 25 00 00 00       	mov    $0x25,%edi
 8ad:	e9 49 ff ff ff       	jmp    7fb <printf+0x4b>
 8b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 8b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8bf:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 8c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 8c7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 8c9:	8b 10                	mov    (%eax),%edx
 8cb:	89 f0                	mov    %esi,%eax
 8cd:	e8 3e fe ff ff       	call   710 <printint>
        ap++;
 8d2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8d6:	e9 20 ff ff ff       	jmp    7fb <printf+0x4b>
 8db:	90                   	nop
 8dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 8e0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 8e3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8ea:	00 
 8eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ef:	89 34 24             	mov    %esi,(%esp)
 8f2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 8f6:	e8 27 fd ff ff       	call   622 <write>
 8fb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 8fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 905:	00 
 906:	89 44 24 04          	mov    %eax,0x4(%esp)
 90a:	89 34 24             	mov    %esi,(%esp)
 90d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 911:	e8 0c fd ff ff       	call   622 <write>
        printint(fd, *ap, 16, 0);
 916:	b9 10 00 00 00       	mov    $0x10,%ecx
 91b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 922:	eb a0                	jmp    8c4 <printf+0x114>
 924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 928:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 92b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 92f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 931:	b8 35 0e 00 00       	mov    $0xe35,%eax
 936:	85 ff                	test   %edi,%edi
 938:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 93b:	0f b6 07             	movzbl (%edi),%eax
 93e:	84 c0                	test   %al,%al
 940:	74 2a                	je     96c <printf+0x1bc>
 942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 948:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 94b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 94e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 951:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 958:	00 
 959:	89 44 24 04          	mov    %eax,0x4(%esp)
 95d:	89 34 24             	mov    %esi,(%esp)
 960:	e8 bd fc ff ff       	call   622 <write>
        while(*s != 0){
 965:	0f b6 07             	movzbl (%edi),%eax
 968:	84 c0                	test   %al,%al
 96a:	75 dc                	jne    948 <printf+0x198>
      state = 0;
 96c:	31 ff                	xor    %edi,%edi
 96e:	e9 88 fe ff ff       	jmp    7fb <printf+0x4b>
        putc(fd, *ap);
 973:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 976:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 978:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 97a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 981:	00 
 982:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 985:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 988:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 98b:	89 44 24 04          	mov    %eax,0x4(%esp)
 98f:	e8 8e fc ff ff       	call   622 <write>
        ap++;
 994:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 998:	e9 5e fe ff ff       	jmp    7fb <printf+0x4b>
 99d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 9a0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 9a3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 9a5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9ac:	00 
 9ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 9b1:	89 34 24             	mov    %esi,(%esp)
 9b4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 9b8:	e8 65 fc ff ff       	call   622 <write>
 9bd:	e9 39 fe ff ff       	jmp    7fb <printf+0x4b>
 9c2:	66 90                	xchg   %ax,%ax
 9c4:	66 90                	xchg   %ax,%ax
 9c6:	66 90                	xchg   %ax,%ax
 9c8:	66 90                	xchg   %ax,%ax
 9ca:	66 90                	xchg   %ax,%ax
 9cc:	66 90                	xchg   %ax,%ax
 9ce:	66 90                	xchg   %ax,%ax

000009d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d1:	a1 60 13 00 00       	mov    0x1360,%eax
{
 9d6:	89 e5                	mov    %esp,%ebp
 9d8:	57                   	push   %edi
 9d9:	56                   	push   %esi
 9da:	53                   	push   %ebx
 9db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9de:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 9e0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e3:	39 d0                	cmp    %edx,%eax
 9e5:	72 11                	jb     9f8 <free+0x28>
 9e7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e8:	39 c8                	cmp    %ecx,%eax
 9ea:	72 04                	jb     9f0 <free+0x20>
 9ec:	39 ca                	cmp    %ecx,%edx
 9ee:	72 10                	jb     a00 <free+0x30>
 9f0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f6:	73 f0                	jae    9e8 <free+0x18>
 9f8:	39 ca                	cmp    %ecx,%edx
 9fa:	72 04                	jb     a00 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9fc:	39 c8                	cmp    %ecx,%eax
 9fe:	72 f0                	jb     9f0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a00:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a03:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 a06:	39 cf                	cmp    %ecx,%edi
 a08:	74 1e                	je     a28 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a0a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a0d:	8b 48 04             	mov    0x4(%eax),%ecx
 a10:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 a13:	39 f2                	cmp    %esi,%edx
 a15:	74 28                	je     a3f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a17:	89 10                	mov    %edx,(%eax)
  freep = p;
 a19:	a3 60 13 00 00       	mov    %eax,0x1360
}
 a1e:	5b                   	pop    %ebx
 a1f:	5e                   	pop    %esi
 a20:	5f                   	pop    %edi
 a21:	5d                   	pop    %ebp
 a22:	c3                   	ret    
 a23:	90                   	nop
 a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a28:	03 71 04             	add    0x4(%ecx),%esi
 a2b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a2e:	8b 08                	mov    (%eax),%ecx
 a30:	8b 09                	mov    (%ecx),%ecx
 a32:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a35:	8b 48 04             	mov    0x4(%eax),%ecx
 a38:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 a3b:	39 f2                	cmp    %esi,%edx
 a3d:	75 d8                	jne    a17 <free+0x47>
    p->s.size += bp->s.size;
 a3f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 a42:	a3 60 13 00 00       	mov    %eax,0x1360
    p->s.size += bp->s.size;
 a47:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a4a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a4d:	89 10                	mov    %edx,(%eax)
}
 a4f:	5b                   	pop    %ebx
 a50:	5e                   	pop    %esi
 a51:	5f                   	pop    %edi
 a52:	5d                   	pop    %ebp
 a53:	c3                   	ret    
 a54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a60 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a60:	55                   	push   %ebp
 a61:	89 e5                	mov    %esp,%ebp
 a63:	57                   	push   %edi
 a64:	56                   	push   %esi
 a65:	53                   	push   %ebx
 a66:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a69:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a6c:	8b 1d 60 13 00 00    	mov    0x1360,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a72:	8d 48 07             	lea    0x7(%eax),%ecx
 a75:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 a78:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a7a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 a7d:	0f 84 9b 00 00 00    	je     b1e <malloc+0xbe>
 a83:	8b 13                	mov    (%ebx),%edx
 a85:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a88:	39 fe                	cmp    %edi,%esi
 a8a:	76 64                	jbe    af0 <malloc+0x90>
 a8c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 a93:	bb 00 80 00 00       	mov    $0x8000,%ebx
 a98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a9b:	eb 0e                	jmp    aab <malloc+0x4b>
 a9d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 aa2:	8b 78 04             	mov    0x4(%eax),%edi
 aa5:	39 fe                	cmp    %edi,%esi
 aa7:	76 4f                	jbe    af8 <malloc+0x98>
 aa9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aab:	3b 15 60 13 00 00    	cmp    0x1360,%edx
 ab1:	75 ed                	jne    aa0 <malloc+0x40>
  if(nu < 4096)
 ab3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 ab6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 abc:	bf 00 10 00 00       	mov    $0x1000,%edi
 ac1:	0f 43 fe             	cmovae %esi,%edi
 ac4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 ac7:	89 04 24             	mov    %eax,(%esp)
 aca:	e8 bb fb ff ff       	call   68a <sbrk>
  if(p == (char*)-1)
 acf:	83 f8 ff             	cmp    $0xffffffff,%eax
 ad2:	74 18                	je     aec <malloc+0x8c>
  hp->s.size = nu;
 ad4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 ad7:	83 c0 08             	add    $0x8,%eax
 ada:	89 04 24             	mov    %eax,(%esp)
 add:	e8 ee fe ff ff       	call   9d0 <free>
  return freep;
 ae2:	8b 15 60 13 00 00    	mov    0x1360,%edx
      if((p = morecore(nunits)) == 0)
 ae8:	85 d2                	test   %edx,%edx
 aea:	75 b4                	jne    aa0 <malloc+0x40>
        return 0;
 aec:	31 c0                	xor    %eax,%eax
 aee:	eb 20                	jmp    b10 <malloc+0xb0>
    if(p->s.size >= nunits){
 af0:	89 d0                	mov    %edx,%eax
 af2:	89 da                	mov    %ebx,%edx
 af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 af8:	39 fe                	cmp    %edi,%esi
 afa:	74 1c                	je     b18 <malloc+0xb8>
        p->s.size -= nunits;
 afc:	29 f7                	sub    %esi,%edi
 afe:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 b01:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 b04:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 b07:	89 15 60 13 00 00    	mov    %edx,0x1360
      return (void*)(p + 1);
 b0d:	83 c0 08             	add    $0x8,%eax
  }
}
 b10:	83 c4 1c             	add    $0x1c,%esp
 b13:	5b                   	pop    %ebx
 b14:	5e                   	pop    %esi
 b15:	5f                   	pop    %edi
 b16:	5d                   	pop    %ebp
 b17:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 b18:	8b 08                	mov    (%eax),%ecx
 b1a:	89 0a                	mov    %ecx,(%edx)
 b1c:	eb e9                	jmp    b07 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 b1e:	c7 05 60 13 00 00 64 	movl   $0x1364,0x1360
 b25:	13 00 00 
    base.s.size = 0;
 b28:	ba 64 13 00 00       	mov    $0x1364,%edx
    base.s.ptr = freep = prevp = &base;
 b2d:	c7 05 64 13 00 00 64 	movl   $0x1364,0x1364
 b34:	13 00 00 
    base.s.size = 0;
 b37:	c7 05 68 13 00 00 00 	movl   $0x0,0x1368
 b3e:	00 00 00 
 b41:	e9 46 ff ff ff       	jmp    a8c <malloc+0x2c>
 b46:	66 90                	xchg   %ax,%ax
 b48:	66 90                	xchg   %ax,%ax
 b4a:	66 90                	xchg   %ax,%ax
 b4c:	66 90                	xchg   %ax,%ax
 b4e:	66 90                	xchg   %ax,%ax

00000b50 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	56                   	push   %esi
 b54:	53                   	push   %ebx
 b55:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 b58:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 b5f:	e8 fc fe ff ff       	call   a60 <malloc>

    if (bt == NULL) {
 b64:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 b66:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 b68:	74 66                	je     bd0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 b6a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b71:	e8 ea fe ff ff       	call   a60 <malloc>
    if (bt->bt_stack == NULL) {
 b76:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 b78:	89 c3                	mov    %eax,%ebx
 b7a:	89 46 08             	mov    %eax,0x8(%esi)
 b7d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 b80:	74 5d                	je     bdf <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 b82:	25 ff 0f 00 00       	and    $0xfff,%eax
 b87:	75 37                	jne    bc0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 b89:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 b8f:	8b 45 10             	mov    0x10(%ebp),%eax
 b92:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 b96:	89 44 24 04          	mov    %eax,0x4(%esp)
 b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
 b9d:	89 04 24             	mov    %eax,(%esp)
 ba0:	e8 25 fb ff ff       	call   6ca <kthread_create>
    if (bt->bid != 0) {
 ba5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 ba7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 ba9:	74 2d                	je     bd8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 bab:	8b 45 08             	mov    0x8(%ebp),%eax
 bae:	89 30                	mov    %esi,(%eax)
        result = 0;
 bb0:	31 c0                	xor    %eax,%eax
}
 bb2:	83 c4 10             	add    $0x10,%esp
 bb5:	5b                   	pop    %ebx
 bb6:	5e                   	pop    %esi
 bb7:	5d                   	pop    %ebp
 bb8:	c3                   	ret    
 bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 bc0:	29 c3                	sub    %eax,%ebx
 bc2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 bc8:	89 5e 04             	mov    %ebx,0x4(%esi)
 bcb:	eb bc                	jmp    b89 <benny_thread_create+0x39>
 bcd:	8d 76 00             	lea    0x0(%esi),%esi
 bd0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 bd6:	eb b7                	jmp    b8f <benny_thread_create+0x3f>
    int result = -1;
 bd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 bdd:	eb d3                	jmp    bb2 <benny_thread_create+0x62>
        free(bt);
 bdf:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 be2:	31 f6                	xor    %esi,%esi
        free(bt);
 be4:	e8 e7 fd ff ff       	call   9d0 <free>
 be9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 bec:	eb a1                	jmp    b8f <benny_thread_create+0x3f>
 bee:	66 90                	xchg   %ax,%ax

00000bf0 <benny_thread_bid>:
{
 bf0:	55                   	push   %ebp
 bf1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 bf3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 bf6:	5d                   	pop    %ebp
    return bt->bid;
 bf7:	8b 00                	mov    (%eax),%eax
}
 bf9:	c3                   	ret    
 bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c00 <benny_thread_join>:
{
 c00:	55                   	push   %ebp
 c01:	89 e5                	mov    %esp,%ebp
 c03:	53                   	push   %ebx
 c04:	83 ec 14             	sub    $0x14,%esp
 c07:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 c0a:	8b 03                	mov    (%ebx),%eax
 c0c:	89 04 24             	mov    %eax,(%esp)
 c0f:	e8 be fa ff ff       	call   6d2 <kthread_join>
    if (retVal == 0) {
 c14:	85 c0                	test   %eax,%eax
 c16:	75 27                	jne    c3f <benny_thread_join+0x3f>
        free(bt->mem_stack);
 c18:	8b 53 08             	mov    0x8(%ebx),%edx
 c1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c1e:	89 14 24             	mov    %edx,(%esp)
 c21:	e8 aa fd ff ff       	call   9d0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 c26:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 c2d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 c34:	89 1c 24             	mov    %ebx,(%esp)
 c37:	e8 94 fd ff ff       	call   9d0 <free>
 c3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 c3f:	83 c4 14             	add    $0x14,%esp
 c42:	5b                   	pop    %ebx
 c43:	5d                   	pop    %ebp
 c44:	c3                   	ret    
 c45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c50 <benny_thread_exit>:
{
 c50:	55                   	push   %ebp
 c51:	89 e5                	mov    %esp,%ebp
}
 c53:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 c54:	e9 81 fa ff ff       	jmp    6da <kthread_exit>
 c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 c60:	55                   	push   %ebp
 c61:	89 e5                	mov    %esp,%ebp
 c63:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 c66:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 c6c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 c73:	31 c0                	xor    %eax,%eax
 c75:	5d                   	pop    %ebp
 c76:	c3                   	ret    
 c77:	89 f6                	mov    %esi,%esi
 c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c80 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 c80:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 c81:	b8 01 00 00 00       	mov    $0x1,%eax
 c86:	89 e5                	mov    %esp,%ebp
 c88:	56                   	push   %esi
 c89:	53                   	push   %ebx
 c8a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 c8d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 c90:	85 c0                	test   %eax,%eax
 c92:	be 01 00 00 00       	mov    $0x1,%esi
 c97:	74 15                	je     cae <benny_mootex_yieldlock+0x2e>
 c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 ca0:	e8 45 fa ff ff       	call   6ea <kthread_yield>
 ca5:	89 f0                	mov    %esi,%eax
 ca7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 caa:	85 c0                	test   %eax,%eax
 cac:	75 f2                	jne    ca0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 cae:	e8 2f fa ff ff       	call   6e2 <kthread_self>
    benny_mootex->bid = benny_self();
 cb3:	89 43 04             	mov    %eax,0x4(%ebx)
}
 cb6:	31 c0                	xor    %eax,%eax
 cb8:	5b                   	pop    %ebx
 cb9:	5e                   	pop    %esi
 cba:	5d                   	pop    %ebp
 cbb:	c3                   	ret    
 cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <benny_mootex_spinlock>:
{
 cc0:	55                   	push   %ebp
 cc1:	ba 01 00 00 00       	mov    $0x1,%edx
 cc6:	89 e5                	mov    %esp,%ebp
 cc8:	53                   	push   %ebx
 cc9:	83 ec 04             	sub    $0x4,%esp
 ccc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ccf:	90                   	nop
 cd0:	89 d0                	mov    %edx,%eax
 cd2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 cd5:	85 c0                	test   %eax,%eax
 cd7:	75 f7                	jne    cd0 <benny_mootex_spinlock+0x10>
    return kthread_self();
 cd9:	e8 04 fa ff ff       	call   6e2 <kthread_self>
    benny_mootex->bid = benny_self();
 cde:	89 43 04             	mov    %eax,0x4(%ebx)
}
 ce1:	83 c4 04             	add    $0x4,%esp
 ce4:	31 c0                	xor    %eax,%eax
 ce6:	5b                   	pop    %ebx
 ce7:	5d                   	pop    %ebp
 ce8:	c3                   	ret    
 ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cf0 <benny_mootex_unlock>:
{
 cf0:	55                   	push   %ebp
 cf1:	89 e5                	mov    %esp,%ebp
 cf3:	53                   	push   %ebx
 cf4:	83 ec 04             	sub    $0x4,%esp
 cf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 cfa:	e8 e3 f9 ff ff       	call   6e2 <kthread_self>
    if(tid == benny_mootex->bid){
 cff:	39 43 04             	cmp    %eax,0x4(%ebx)
 d02:	75 1c                	jne    d20 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 d04:	0f ae f0             	mfence 
    return 0;
 d07:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 d09:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 d10:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 d16:	83 c4 04             	add    $0x4,%esp
 d19:	5b                   	pop    %ebx
 d1a:	5d                   	pop    %ebp
 d1b:	c3                   	ret    
 d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 d20:	83 c4 04             	add    $0x4,%esp
      return -1;
 d23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d28:	5b                   	pop    %ebx
 d29:	5d                   	pop    %ebp
 d2a:	c3                   	ret    
 d2b:	90                   	nop
 d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d30 <benny_mootex_trylock>:
{
 d30:	55                   	push   %ebp
 d31:	b8 01 00 00 00       	mov    $0x1,%eax
 d36:	89 e5                	mov    %esp,%ebp
 d38:	53                   	push   %ebx
 d39:	83 ec 04             	sub    $0x4,%esp
 d3c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 d3f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 d42:	85 c0                	test   %eax,%eax
 d44:	75 08                	jne    d4e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 d46:	e8 97 f9 ff ff       	call   6e2 <kthread_self>
        benny_mootex->bid = tid;
 d4b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 d4e:	83 c4 04             	add    $0x4,%esp
 d51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d56:	5b                   	pop    %ebx
 d57:	5d                   	pop    %ebp
 d58:	c3                   	ret    
 d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d60 <benny_mootex_wholock>:
{
 d60:	55                   	push   %ebp
 d61:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 d63:	8b 45 08             	mov    0x8(%ebp),%eax
}
 d66:	5d                   	pop    %ebp
    return benny_mootex->bid;
 d67:	8b 40 04             	mov    0x4(%eax),%eax
}
 d6a:	c3                   	ret    
 d6b:	90                   	nop
 d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d70 <benny_mootex_islocked>:
{
 d70:	55                   	push   %ebp
 d71:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 d73:	8b 45 08             	mov    0x8(%ebp),%eax
}
 d76:	5d                   	pop    %ebp
    return benny_mootex->locked;
 d77:	8b 00                	mov    (%eax),%eax
}
 d79:	c3                   	ret    
 d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d80 <benny_self>:
{
 d80:	55                   	push   %ebp
 d81:	89 e5                	mov    %esp,%ebp
}
 d83:	5d                   	pop    %ebp
    return kthread_self();
 d84:	e9 59 f9 ff ff       	jmp    6e2 <kthread_self>
 d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d90 <benny_yield>:
{
 d90:	55                   	push   %ebp
 d91:	89 e5                	mov    %esp,%ebp
    
}
 d93:	5d                   	pop    %ebp
    return kthread_yield();
 d94:	e9 51 f9 ff ff       	jmp    6ea <kthread_yield>
 d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000da0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 da0:	55                   	push   %ebp
 da1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 da3:	5d                   	pop    %ebp
    return kthread_cpu_count();
 da4:	e9 49 f9 ff ff       	jmp    6f2 <kthread_cpu_count>
 da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000db0 <benny_thread_count>:

int
benny_thread_count(void)
{
 db0:	55                   	push   %ebp
 db1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 db3:	5d                   	pop    %ebp
    return kthread_thread_count();
 db4:	e9 41 f9 ff ff       	jmp    6fa <kthread_thread_count>