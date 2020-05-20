
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
       9:	eb 0e                	jmp    19 <main+0x19>
       b:	90                   	nop
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	0f 8f cd 00 00 00    	jg     e6 <main+0xe6>
  while((fd = open("console", O_RDWR)) >= 0){
      19:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
      20:	00 
      21:	c7 04 24 7d 16 00 00 	movl   $0x167d,(%esp)
      28:	e8 35 0e 00 00       	call   e62 <open>
      2d:	85 c0                	test   %eax,%eax
      2f:	79 df                	jns    10 <main+0x10>
      31:	eb 23                	jmp    56 <main+0x56>
      33:	90                   	nop
      34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      38:	80 3d 82 1e 00 00 20 	cmpb   $0x20,0x1e82
      3f:	90                   	nop
      40:	74 60                	je     a2 <main+0xa2>
      42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      48:	e8 43 01 00 00       	call   190 <fork1>
      4d:	85 c0                	test   %eax,%eax
      4f:	74 38                	je     89 <main+0x89>
      runcmd(parsecmd(buf));
    wait();
      51:	e8 d4 0d 00 00       	call   e2a <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      56:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
      5d:	00 
      5e:	c7 04 24 80 1e 00 00 	movl   $0x1e80,(%esp)
      65:	e8 96 00 00 00       	call   100 <getcmd>
      6a:	85 c0                	test   %eax,%eax
      6c:	78 2f                	js     9d <main+0x9d>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      6e:	80 3d 80 1e 00 00 63 	cmpb   $0x63,0x1e80
      75:	75 d1                	jne    48 <main+0x48>
      77:	80 3d 81 1e 00 00 64 	cmpb   $0x64,0x1e81
      7e:	74 b8                	je     38 <main+0x38>
    if(fork1() == 0)
      80:	e8 0b 01 00 00       	call   190 <fork1>
      85:	85 c0                	test   %eax,%eax
      87:	75 c8                	jne    51 <main+0x51>
      runcmd(parsecmd(buf));
      89:	c7 04 24 80 1e 00 00 	movl   $0x1e80,(%esp)
      90:	e8 eb 0a 00 00       	call   b80 <parsecmd>
      95:	89 04 24             	mov    %eax,(%esp)
      98:	e8 13 01 00 00       	call   1b0 <runcmd>
  }
  exit();
      9d:	e8 80 0d 00 00       	call   e22 <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
      a2:	c7 04 24 80 1e 00 00 	movl   $0x1e80,(%esp)
      a9:	e8 d2 0b 00 00       	call   c80 <strlen>
      if(chdir(buf+3) < 0)
      ae:	c7 04 24 83 1e 00 00 	movl   $0x1e83,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      b5:	c6 80 7f 1e 00 00 00 	movb   $0x0,0x1e7f(%eax)
      if(chdir(buf+3) < 0)
      bc:	e8 d1 0d 00 00       	call   e92 <chdir>
      c1:	85 c0                	test   %eax,%eax
      c3:	79 91                	jns    56 <main+0x56>
        printf(2, "cannot cd %s\n", buf+3);
      c5:	c7 44 24 08 83 1e 00 	movl   $0x1e83,0x8(%esp)
      cc:	00 
      cd:	c7 44 24 04 85 16 00 	movl   $0x1685,0x4(%esp)
      d4:	00 
      d5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      dc:	e8 ef 0e 00 00       	call   fd0 <printf>
      e1:	e9 70 ff ff ff       	jmp    56 <main+0x56>
      close(fd);
      e6:	89 04 24             	mov    %eax,(%esp)
      e9:	e8 5c 0d 00 00       	call   e4a <close>
      ee:	66 90                	xchg   %ax,%ax
      break;
      f0:	e9 61 ff ff ff       	jmp    56 <main+0x56>
      f5:	66 90                	xchg   %ax,%ax
      f7:	66 90                	xchg   %ax,%ax
      f9:	66 90                	xchg   %ax,%ax
      fb:	66 90                	xchg   %ax,%ax
      fd:	66 90                	xchg   %ax,%ax
      ff:	90                   	nop

00000100 <getcmd>:
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	56                   	push   %esi
     104:	53                   	push   %ebx
     105:	83 ec 10             	sub    $0x10,%esp
     108:	8b 5d 08             	mov    0x8(%ebp),%ebx
     10b:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     10e:	c7 44 24 04 dc 15 00 	movl   $0x15dc,0x4(%esp)
     115:	00 
     116:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     11d:	e8 ae 0e 00 00       	call   fd0 <printf>
  memset(buf, 0, nbuf);
     122:	89 74 24 08          	mov    %esi,0x8(%esp)
     126:	89 1c 24             	mov    %ebx,(%esp)
     129:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     130:	00 
     131:	e8 7a 0b 00 00       	call   cb0 <memset>
  gets(buf, nbuf);
     136:	89 74 24 04          	mov    %esi,0x4(%esp)
     13a:	89 1c 24             	mov    %ebx,(%esp)
     13d:	e8 ce 0b 00 00       	call   d10 <gets>
  if(buf[0] == 0) // EOF
     142:	31 c0                	xor    %eax,%eax
     144:	80 3b 00             	cmpb   $0x0,(%ebx)
     147:	0f 94 c0             	sete   %al
}
     14a:	83 c4 10             	add    $0x10,%esp
     14d:	5b                   	pop    %ebx
  if(buf[0] == 0) // EOF
     14e:	f7 d8                	neg    %eax
}
     150:	5e                   	pop    %esi
     151:	5d                   	pop    %ebp
     152:	c3                   	ret    
     153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
}

void
panic(char *s)
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     166:	8b 45 08             	mov    0x8(%ebp),%eax
     169:	c7 44 24 04 79 16 00 	movl   $0x1679,0x4(%esp)
     170:	00 
     171:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     178:	89 44 24 08          	mov    %eax,0x8(%esp)
     17c:	e8 4f 0e 00 00       	call   fd0 <printf>
  exit();
     181:	e8 9c 0c 00 00       	call   e22 <exit>
     186:	8d 76 00             	lea    0x0(%esi),%esi
     189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <fork1>:
}

int
fork1(void)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 18             	sub    $0x18,%esp
  int pid;

  pid = fork();
     196:	e8 7f 0c 00 00       	call   e1a <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
    panic("fork");
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
    panic("fork");
     1a2:	c7 04 24 df 15 00 00 	movl   $0x15df,(%esp)
     1a9:	e8 b2 ff ff ff       	call   160 <panic>
     1ae:	66 90                	xchg   %ax,%ax

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	57                   	push   %edi
     1b4:	56                   	push   %esi
     1b5:	53                   	push   %ebx
     1b6:	83 ec 3c             	sub    $0x3c,%esp
     1b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1bc:	85 db                	test   %ebx,%ebx
     1be:	74 66                	je     226 <runcmd+0x76>
  switch(cmd->type){
     1c0:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c3:	0f 87 25 01 00 00    	ja     2ee <runcmd+0x13e>
     1c9:	8b 03                	mov    (%ebx),%eax
     1cb:	ff 24 85 94 16 00 00 	jmp    *0x1694(,%eax,4)
    if(pipe(p) < 0)
     1d2:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     1d5:	89 04 24             	mov    %eax,(%esp)
     1d8:	e8 55 0c 00 00       	call   e32 <pipe>
     1dd:	85 c0                	test   %eax,%eax
     1df:	0f 88 15 01 00 00    	js     2fa <runcmd+0x14a>
    if(fork1() == 0){
     1e5:	e8 a6 ff ff ff       	call   190 <fork1>
     1ea:	85 c0                	test   %eax,%eax
     1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     1f0:	0f 84 68 01 00 00    	je     35e <runcmd+0x1ae>
    if(fork1() == 0){
     1f6:	e8 95 ff ff ff       	call   190 <fork1>
     1fb:	85 c0                	test   %eax,%eax
     1fd:	8d 76 00             	lea    0x0(%esi),%esi
     200:	0f 84 20 01 00 00    	je     326 <runcmd+0x176>
    close(p[0]);
     206:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     209:	89 04 24             	mov    %eax,(%esp)
     20c:	e8 39 0c 00 00       	call   e4a <close>
    close(p[1]);
     211:	8b 45 d8             	mov    -0x28(%ebp),%eax
     214:	89 04 24             	mov    %eax,(%esp)
     217:	e8 2e 0c 00 00       	call   e4a <close>
    wait();
     21c:	e8 09 0c 00 00       	call   e2a <wait>
    wait();
     221:	e8 04 0c 00 00       	call   e2a <wait>
      exit();
     226:	e8 f7 0b 00 00       	call   e22 <exit>
     22b:	90                   	nop
     22c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fork1() == 0)
     230:	e8 5b ff ff ff       	call   190 <fork1>
     235:	85 c0                	test   %eax,%eax
     237:	75 ed                	jne    226 <runcmd+0x76>
     239:	e9 a5 00 00 00       	jmp    2e3 <runcmd+0x133>
    if(ecmd->argv[0] == 0)
     23e:	8b 43 04             	mov    0x4(%ebx),%eax
     241:	85 c0                	test   %eax,%eax
     243:	74 e1                	je     226 <runcmd+0x76>
    exec(ecmd->argv[0], ecmd->argv);
     245:	8d 73 04             	lea    0x4(%ebx),%esi
     248:	89 74 24 04          	mov    %esi,0x4(%esp)
        char ncmd[20] = "/";
     24c:	8d 7d d8             	lea    -0x28(%ebp),%edi
    exec(ecmd->argv[0], ecmd->argv);
     24f:	89 04 24             	mov    %eax,(%esp)
     252:	e8 03 0c 00 00       	call   e5a <exec>
        char ncmd[20] = "/";
     257:	31 c0                	xor    %eax,%eax
     259:	b9 04 00 00 00       	mov    $0x4,%ecx
     25e:	f3 ab                	rep stos %eax,%es:(%edi)
        strcpy(&ncmd[1], ecmd->argv[0]);
     260:	8b 43 04             	mov    0x4(%ebx),%eax
     263:	8d 7d d4             	lea    -0x2c(%ebp),%edi
        char ncmd[20] = "/";
     266:	c7 45 d4 2f 00 00 00 	movl   $0x2f,-0x2c(%ebp)
        strcpy(&ncmd[1], ecmd->argv[0]);
     26d:	89 44 24 04          	mov    %eax,0x4(%esp)
     271:	8d 45 d5             	lea    -0x2b(%ebp),%eax
     274:	89 04 24             	mov    %eax,(%esp)
     277:	e8 84 09 00 00       	call   c00 <strcpy>
        exec(ncmd, ecmd->argv);
     27c:	89 74 24 04          	mov    %esi,0x4(%esp)
     280:	89 3c 24             	mov    %edi,(%esp)
     283:	e8 d2 0b 00 00       	call   e5a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     288:	8b 43 04             	mov    0x4(%ebx),%eax
     28b:	c7 44 24 04 eb 15 00 	movl   $0x15eb,0x4(%esp)
     292:	00 
     293:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     29a:	89 44 24 08          	mov    %eax,0x8(%esp)
     29e:	e8 2d 0d 00 00       	call   fd0 <printf>
    break;
     2a3:	eb 81                	jmp    226 <runcmd+0x76>
    if(fork1() == 0)
     2a5:	e8 e6 fe ff ff       	call   190 <fork1>
     2aa:	85 c0                	test   %eax,%eax
     2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     2b0:	74 31                	je     2e3 <runcmd+0x133>
    wait();
     2b2:	e8 73 0b 00 00       	call   e2a <wait>
    runcmd(lcmd->right);
     2b7:	8b 43 08             	mov    0x8(%ebx),%eax
     2ba:	89 04 24             	mov    %eax,(%esp)
     2bd:	e8 ee fe ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     2c2:	8b 43 14             	mov    0x14(%ebx),%eax
     2c5:	89 04 24             	mov    %eax,(%esp)
     2c8:	e8 7d 0b 00 00       	call   e4a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     2cd:	8b 43 10             	mov    0x10(%ebx),%eax
     2d0:	89 44 24 04          	mov    %eax,0x4(%esp)
     2d4:	8b 43 08             	mov    0x8(%ebx),%eax
     2d7:	89 04 24             	mov    %eax,(%esp)
     2da:	e8 83 0b 00 00       	call   e62 <open>
     2df:	85 c0                	test   %eax,%eax
     2e1:	78 23                	js     306 <runcmd+0x156>
      runcmd(bcmd->cmd);
     2e3:	8b 43 04             	mov    0x4(%ebx),%eax
     2e6:	89 04 24             	mov    %eax,(%esp)
     2e9:	e8 c2 fe ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2ee:	c7 04 24 e4 15 00 00 	movl   $0x15e4,(%esp)
     2f5:	e8 66 fe ff ff       	call   160 <panic>
      panic("pipe");
     2fa:	c7 04 24 0b 16 00 00 	movl   $0x160b,(%esp)
     301:	e8 5a fe ff ff       	call   160 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     306:	8b 43 08             	mov    0x8(%ebx),%eax
     309:	c7 44 24 04 fb 15 00 	movl   $0x15fb,0x4(%esp)
     310:	00 
     311:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     318:	89 44 24 08          	mov    %eax,0x8(%esp)
     31c:	e8 af 0c 00 00       	call   fd0 <printf>
     321:	e9 00 ff ff ff       	jmp    226 <runcmd+0x76>
      close(0);
     326:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     32d:	e8 18 0b 00 00       	call   e4a <close>
      dup(p[0]);
     332:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     335:	89 04 24             	mov    %eax,(%esp)
     338:	e8 5d 0b 00 00       	call   e9a <dup>
      close(p[0]);
     33d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     340:	89 04 24             	mov    %eax,(%esp)
     343:	e8 02 0b 00 00       	call   e4a <close>
      close(p[1]);
     348:	8b 45 d8             	mov    -0x28(%ebp),%eax
     34b:	89 04 24             	mov    %eax,(%esp)
     34e:	e8 f7 0a 00 00       	call   e4a <close>
      runcmd(pcmd->right);
     353:	8b 43 08             	mov    0x8(%ebx),%eax
     356:	89 04 24             	mov    %eax,(%esp)
     359:	e8 52 fe ff ff       	call   1b0 <runcmd>
      close(1);
     35e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     365:	e8 e0 0a 00 00       	call   e4a <close>
      dup(p[1]);
     36a:	8b 45 d8             	mov    -0x28(%ebp),%eax
     36d:	89 04 24             	mov    %eax,(%esp)
     370:	e8 25 0b 00 00       	call   e9a <dup>
      close(p[0]);
     375:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     378:	89 04 24             	mov    %eax,(%esp)
     37b:	e8 ca 0a 00 00       	call   e4a <close>
      close(p[1]);
     380:	8b 45 d8             	mov    -0x28(%ebp),%eax
     383:	89 04 24             	mov    %eax,(%esp)
     386:	e8 bf 0a 00 00       	call   e4a <close>
      runcmd(pcmd->left);
     38b:	8b 43 04             	mov    0x4(%ebx),%eax
     38e:	89 04 24             	mov    %eax,(%esp)
     391:	e8 1a fe ff ff       	call   1b0 <runcmd>
     396:	8d 76 00             	lea    0x0(%esi),%esi
     399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3ae:	e8 cd 0e 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3b3:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3ba:	00 
     3bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3c2:	00 
  cmd = malloc(sizeof(*cmd));
     3c3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c5:	89 04 24             	mov    %eax,(%esp)
     3c8:	e8 e3 08 00 00       	call   cb0 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     3cd:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
     3cf:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
     3d5:	83 c4 14             	add    $0x14,%esp
     3d8:	5b                   	pop    %ebx
     3d9:	5d                   	pop    %ebp
     3da:	c3                   	ret    
     3db:	90                   	nop
     3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3ee:	e8 8d 0e 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3f3:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     3fa:	00 
     3fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     402:	00 
     403:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     406:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     408:	e8 a3 08 00 00       	call   cb0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     40d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     410:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     416:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     419:	8b 45 0c             	mov    0xc(%ebp),%eax
     41c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     41f:	8b 45 10             	mov    0x10(%ebp),%eax
     422:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     425:	8b 45 14             	mov    0x14(%ebp),%eax
     428:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     42b:	8b 45 18             	mov    0x18(%ebp),%eax
     42e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     431:	83 c4 14             	add    $0x14,%esp
     434:	89 d8                	mov    %ebx,%eax
     436:	5b                   	pop    %ebx
     437:	5d                   	pop    %ebp
     438:	c3                   	ret    
     439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000440 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     44e:	e8 2d 0e 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     453:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     45a:	00 
     45b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     462:	00 
     463:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     466:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     468:	e8 43 08 00 00       	call   cb0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     46d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     470:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     476:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     479:	8b 45 0c             	mov    0xc(%ebp),%eax
     47c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     47f:	83 c4 14             	add    $0x14,%esp
     482:	89 d8                	mov    %ebx,%eax
     484:	5b                   	pop    %ebx
     485:	5d                   	pop    %ebp
     486:	c3                   	ret    
     487:	89 f6                	mov    %esi,%esi
     489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	53                   	push   %ebx
     494:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     497:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     49e:	e8 dd 0d 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4a3:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4aa:	00 
     4ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4b2:	00 
     4b3:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     4b6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4b8:	e8 f3 07 00 00       	call   cb0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     4bd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     4c0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     4c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     4c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     4cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     4cf:	83 c4 14             	add    $0x14,%esp
     4d2:	89 d8                	mov    %ebx,%eax
     4d4:	5b                   	pop    %ebx
     4d5:	5d                   	pop    %ebp
     4d6:	c3                   	ret    
     4d7:	89 f6                	mov    %esi,%esi
     4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4e0:	55                   	push   %ebp
     4e1:	89 e5                	mov    %esp,%ebp
     4e3:	53                   	push   %ebx
     4e4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4e7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4ee:	e8 8d 0d 00 00       	call   1280 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4f3:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     4fa:	00 
     4fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     502:	00 
     503:	89 04 24             	mov    %eax,(%esp)
  cmd = malloc(sizeof(*cmd));
     506:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     508:	e8 a3 07 00 00       	call   cb0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     50d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     510:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     516:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     519:	83 c4 14             	add    $0x14,%esp
     51c:	89 d8                	mov    %ebx,%eax
     51e:	5b                   	pop    %ebx
     51f:	5d                   	pop    %ebp
     520:	c3                   	ret    
     521:	eb 0d                	jmp    530 <gettoken>
     523:	90                   	nop
     524:	90                   	nop
     525:	90                   	nop
     526:	90                   	nop
     527:	90                   	nop
     528:	90                   	nop
     529:	90                   	nop
     52a:	90                   	nop
     52b:	90                   	nop
     52c:	90                   	nop
     52d:	90                   	nop
     52e:	90                   	nop
     52f:	90                   	nop

00000530 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	57                   	push   %edi
     534:	56                   	push   %esi
     535:	53                   	push   %ebx
     536:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     539:	8b 45 08             	mov    0x8(%ebp),%eax
{
     53c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     53f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     542:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     544:	39 df                	cmp    %ebx,%edi
     546:	72 0f                	jb     557 <gettoken+0x27>
     548:	eb 24                	jmp    56e <gettoken+0x3e>
     54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     550:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     553:	39 df                	cmp    %ebx,%edi
     555:	74 17                	je     56e <gettoken+0x3e>
     557:	0f be 07             	movsbl (%edi),%eax
     55a:	c7 04 24 78 1e 00 00 	movl   $0x1e78,(%esp)
     561:	89 44 24 04          	mov    %eax,0x4(%esp)
     565:	e8 66 07 00 00       	call   cd0 <strchr>
     56a:	85 c0                	test   %eax,%eax
     56c:	75 e2                	jne    550 <gettoken+0x20>
  if(q)
     56e:	85 f6                	test   %esi,%esi
     570:	74 02                	je     574 <gettoken+0x44>
    *q = s;
     572:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     574:	0f b6 0f             	movzbl (%edi),%ecx
     577:	0f be f1             	movsbl %cl,%esi
  switch(*s){
     57a:	80 f9 29             	cmp    $0x29,%cl
  ret = *s;
     57d:	89 f0                	mov    %esi,%eax
  switch(*s){
     57f:	7f 4f                	jg     5d0 <gettoken+0xa0>
     581:	80 f9 28             	cmp    $0x28,%cl
     584:	7d 55                	jge    5db <gettoken+0xab>
     586:	84 c9                	test   %cl,%cl
     588:	0f 85 ca 00 00 00    	jne    658 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     58e:	8b 45 14             	mov    0x14(%ebp),%eax
     591:	85 c0                	test   %eax,%eax
     593:	74 05                	je     59a <gettoken+0x6a>
    *eq = s;
     595:	8b 45 14             	mov    0x14(%ebp),%eax
     598:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     59a:	39 df                	cmp    %ebx,%edi
     59c:	72 09                	jb     5a7 <gettoken+0x77>
     59e:	eb 1e                	jmp    5be <gettoken+0x8e>
    s++;
     5a0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     5a3:	39 df                	cmp    %ebx,%edi
     5a5:	74 17                	je     5be <gettoken+0x8e>
     5a7:	0f be 07             	movsbl (%edi),%eax
     5aa:	c7 04 24 78 1e 00 00 	movl   $0x1e78,(%esp)
     5b1:	89 44 24 04          	mov    %eax,0x4(%esp)
     5b5:	e8 16 07 00 00       	call   cd0 <strchr>
     5ba:	85 c0                	test   %eax,%eax
     5bc:	75 e2                	jne    5a0 <gettoken+0x70>
  *ps = s;
     5be:	8b 45 08             	mov    0x8(%ebp),%eax
     5c1:	89 38                	mov    %edi,(%eax)
  return ret;
}
     5c3:	83 c4 1c             	add    $0x1c,%esp
     5c6:	89 f0                	mov    %esi,%eax
     5c8:	5b                   	pop    %ebx
     5c9:	5e                   	pop    %esi
     5ca:	5f                   	pop    %edi
     5cb:	5d                   	pop    %ebp
     5cc:	c3                   	ret    
     5cd:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     5d0:	80 f9 3e             	cmp    $0x3e,%cl
     5d3:	75 0b                	jne    5e0 <gettoken+0xb0>
    if(*s == '>'){
     5d5:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     5d9:	74 6d                	je     648 <gettoken+0x118>
    s++;
     5db:	83 c7 01             	add    $0x1,%edi
     5de:	eb ae                	jmp    58e <gettoken+0x5e>
  switch(*s){
     5e0:	7f 56                	jg     638 <gettoken+0x108>
     5e2:	83 e9 3b             	sub    $0x3b,%ecx
     5e5:	80 f9 01             	cmp    $0x1,%cl
     5e8:	76 f1                	jbe    5db <gettoken+0xab>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5ea:	39 fb                	cmp    %edi,%ebx
     5ec:	77 2b                	ja     619 <gettoken+0xe9>
     5ee:	66 90                	xchg   %ax,%ax
     5f0:	eb 3b                	jmp    62d <gettoken+0xfd>
     5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     5f8:	0f be 07             	movsbl (%edi),%eax
     5fb:	c7 04 24 70 1e 00 00 	movl   $0x1e70,(%esp)
     602:	89 44 24 04          	mov    %eax,0x4(%esp)
     606:	e8 c5 06 00 00       	call   cd0 <strchr>
     60b:	85 c0                	test   %eax,%eax
     60d:	75 1e                	jne    62d <gettoken+0xfd>
      s++;
     60f:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     612:	39 df                	cmp    %ebx,%edi
     614:	74 17                	je     62d <gettoken+0xfd>
     616:	0f be 07             	movsbl (%edi),%eax
     619:	89 44 24 04          	mov    %eax,0x4(%esp)
     61d:	c7 04 24 78 1e 00 00 	movl   $0x1e78,(%esp)
     624:	e8 a7 06 00 00       	call   cd0 <strchr>
     629:	85 c0                	test   %eax,%eax
     62b:	74 cb                	je     5f8 <gettoken+0xc8>
    ret = 'a';
     62d:	be 61 00 00 00       	mov    $0x61,%esi
     632:	e9 57 ff ff ff       	jmp    58e <gettoken+0x5e>
     637:	90                   	nop
  switch(*s){
     638:	80 f9 7c             	cmp    $0x7c,%cl
     63b:	74 9e                	je     5db <gettoken+0xab>
     63d:	8d 76 00             	lea    0x0(%esi),%esi
     640:	eb a8                	jmp    5ea <gettoken+0xba>
     642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      s++;
     648:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     64b:	be 2b 00 00 00       	mov    $0x2b,%esi
     650:	e9 39 ff ff ff       	jmp    58e <gettoken+0x5e>
     655:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     658:	80 f9 26             	cmp    $0x26,%cl
     65b:	75 8d                	jne    5ea <gettoken+0xba>
     65d:	e9 79 ff ff ff       	jmp    5db <gettoken+0xab>
     662:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	57                   	push   %edi
     674:	56                   	push   %esi
     675:	53                   	push   %ebx
     676:	83 ec 1c             	sub    $0x1c,%esp
     679:	8b 7d 08             	mov    0x8(%ebp),%edi
     67c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     67f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     681:	39 f3                	cmp    %esi,%ebx
     683:	72 0a                	jb     68f <peek+0x1f>
     685:	eb 1f                	jmp    6a6 <peek+0x36>
     687:	90                   	nop
    s++;
     688:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     68b:	39 f3                	cmp    %esi,%ebx
     68d:	74 17                	je     6a6 <peek+0x36>
     68f:	0f be 03             	movsbl (%ebx),%eax
     692:	c7 04 24 78 1e 00 00 	movl   $0x1e78,(%esp)
     699:	89 44 24 04          	mov    %eax,0x4(%esp)
     69d:	e8 2e 06 00 00       	call   cd0 <strchr>
     6a2:	85 c0                	test   %eax,%eax
     6a4:	75 e2                	jne    688 <peek+0x18>
  *ps = s;
     6a6:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     6a8:	0f be 13             	movsbl (%ebx),%edx
     6ab:	31 c0                	xor    %eax,%eax
     6ad:	84 d2                	test   %dl,%dl
     6af:	74 17                	je     6c8 <peek+0x58>
     6b1:	8b 45 10             	mov    0x10(%ebp),%eax
     6b4:	89 54 24 04          	mov    %edx,0x4(%esp)
     6b8:	89 04 24             	mov    %eax,(%esp)
     6bb:	e8 10 06 00 00       	call   cd0 <strchr>
     6c0:	85 c0                	test   %eax,%eax
     6c2:	0f 95 c0             	setne  %al
     6c5:	0f b6 c0             	movzbl %al,%eax
}
     6c8:	83 c4 1c             	add    $0x1c,%esp
     6cb:	5b                   	pop    %ebx
     6cc:	5e                   	pop    %esi
     6cd:	5f                   	pop    %edi
     6ce:	5d                   	pop    %ebp
     6cf:	c3                   	ret    

000006d0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	57                   	push   %edi
     6d4:	56                   	push   %esi
     6d5:	53                   	push   %ebx
     6d6:	83 ec 3c             	sub    $0x3c,%esp
     6d9:	8b 75 0c             	mov    0xc(%ebp),%esi
     6dc:	8b 5d 10             	mov    0x10(%ebp),%ebx
     6df:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6e0:	c7 44 24 08 2d 16 00 	movl   $0x162d,0x8(%esp)
     6e7:	00 
     6e8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     6ec:	89 34 24             	mov    %esi,(%esp)
     6ef:	e8 7c ff ff ff       	call   670 <peek>
     6f4:	85 c0                	test   %eax,%eax
     6f6:	0f 84 9c 00 00 00    	je     798 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
     6fc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     703:	00 
     704:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     70b:	00 
     70c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     710:	89 34 24             	mov    %esi,(%esp)
     713:	e8 18 fe ff ff       	call   530 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     718:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     71c:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
     71f:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     721:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     724:	89 44 24 0c          	mov    %eax,0xc(%esp)
     728:	8d 45 e0             	lea    -0x20(%ebp),%eax
     72b:	89 44 24 08          	mov    %eax,0x8(%esp)
     72f:	e8 fc fd ff ff       	call   530 <gettoken>
     734:	83 f8 61             	cmp    $0x61,%eax
     737:	75 6a                	jne    7a3 <parseredirs+0xd3>
      panic("missing file for redirection");
    switch(tok){
     739:	83 ff 3c             	cmp    $0x3c,%edi
     73c:	74 42                	je     780 <parseredirs+0xb0>
     73e:	83 ff 3e             	cmp    $0x3e,%edi
     741:	74 05                	je     748 <parseredirs+0x78>
     743:	83 ff 2b             	cmp    $0x2b,%edi
     746:	75 98                	jne    6e0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     748:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     74f:	00 
     750:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     757:	00 
     758:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     75b:	89 44 24 08          	mov    %eax,0x8(%esp)
     75f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     762:	89 44 24 04          	mov    %eax,0x4(%esp)
     766:	8b 45 08             	mov    0x8(%ebp),%eax
     769:	89 04 24             	mov    %eax,(%esp)
     76c:	e8 6f fc ff ff       	call   3e0 <redircmd>
     771:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     774:	e9 67 ff ff ff       	jmp    6e0 <parseredirs+0x10>
     779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     780:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     787:	00 
     788:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     78f:	00 
     790:	eb c6                	jmp    758 <parseredirs+0x88>
     792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     798:	8b 45 08             	mov    0x8(%ebp),%eax
     79b:	83 c4 3c             	add    $0x3c,%esp
     79e:	5b                   	pop    %ebx
     79f:	5e                   	pop    %esi
     7a0:	5f                   	pop    %edi
     7a1:	5d                   	pop    %ebp
     7a2:	c3                   	ret    
      panic("missing file for redirection");
     7a3:	c7 04 24 10 16 00 00 	movl   $0x1610,(%esp)
     7aa:	e8 b1 f9 ff ff       	call   160 <panic>
     7af:	90                   	nop

000007b0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     7b0:	55                   	push   %ebp
     7b1:	89 e5                	mov    %esp,%ebp
     7b3:	57                   	push   %edi
     7b4:	56                   	push   %esi
     7b5:	53                   	push   %ebx
     7b6:	83 ec 3c             	sub    $0x3c,%esp
     7b9:	8b 75 08             	mov    0x8(%ebp),%esi
     7bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     7bf:	c7 44 24 08 30 16 00 	movl   $0x1630,0x8(%esp)
     7c6:	00 
     7c7:	89 34 24             	mov    %esi,(%esp)
     7ca:	89 7c 24 04          	mov    %edi,0x4(%esp)
     7ce:	e8 9d fe ff ff       	call   670 <peek>
     7d3:	85 c0                	test   %eax,%eax
     7d5:	0f 85 a5 00 00 00    	jne    880 <parseexec+0xd0>
    return parseblock(ps, es);

  ret = execcmd();
     7db:	e8 c0 fb ff ff       	call   3a0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7e0:	89 7c 24 08          	mov    %edi,0x8(%esp)
     7e4:	89 74 24 04          	mov    %esi,0x4(%esp)
     7e8:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
     7eb:	89 c3                	mov    %eax,%ebx
     7ed:	89 45 cc             	mov    %eax,-0x34(%ebp)
  ret = parseredirs(ret, ps, es);
     7f0:	e8 db fe ff ff       	call   6d0 <parseredirs>
  argc = 0;
     7f5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  ret = parseredirs(ret, ps, es);
     7fc:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     7ff:	eb 1d                	jmp    81e <parseexec+0x6e>
     801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     808:	8b 45 d0             	mov    -0x30(%ebp),%eax
     80b:	89 7c 24 08          	mov    %edi,0x8(%esp)
     80f:	89 74 24 04          	mov    %esi,0x4(%esp)
     813:	89 04 24             	mov    %eax,(%esp)
     816:	e8 b5 fe ff ff       	call   6d0 <parseredirs>
     81b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     81e:	c7 44 24 08 47 16 00 	movl   $0x1647,0x8(%esp)
     825:	00 
     826:	89 7c 24 04          	mov    %edi,0x4(%esp)
     82a:	89 34 24             	mov    %esi,(%esp)
     82d:	e8 3e fe ff ff       	call   670 <peek>
     832:	85 c0                	test   %eax,%eax
     834:	75 62                	jne    898 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     836:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     839:	89 44 24 0c          	mov    %eax,0xc(%esp)
     83d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     840:	89 44 24 08          	mov    %eax,0x8(%esp)
     844:	89 7c 24 04          	mov    %edi,0x4(%esp)
     848:	89 34 24             	mov    %esi,(%esp)
     84b:	e8 e0 fc ff ff       	call   530 <gettoken>
     850:	85 c0                	test   %eax,%eax
     852:	74 44                	je     898 <parseexec+0xe8>
    if(tok != 'a')
     854:	83 f8 61             	cmp    $0x61,%eax
     857:	75 61                	jne    8ba <parseexec+0x10a>
    cmd->argv[argc] = q;
     859:	8b 45 e0             	mov    -0x20(%ebp),%eax
     85c:	83 c3 04             	add    $0x4,%ebx
    argc++;
     85f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    cmd->argv[argc] = q;
     863:	89 03                	mov    %eax,(%ebx)
    cmd->eargv[argc] = eq;
     865:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     868:	89 43 28             	mov    %eax,0x28(%ebx)
    if(argc >= MAXARGS)
     86b:	83 7d d4 0a          	cmpl   $0xa,-0x2c(%ebp)
     86f:	75 97                	jne    808 <parseexec+0x58>
      panic("too many args");
     871:	c7 04 24 39 16 00 00 	movl   $0x1639,(%esp)
     878:	e8 e3 f8 ff ff       	call   160 <panic>
     87d:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     880:	89 7c 24 04          	mov    %edi,0x4(%esp)
     884:	89 34 24             	mov    %esi,(%esp)
     887:	e8 84 01 00 00       	call   a10 <parseblock>
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     88c:	83 c4 3c             	add    $0x3c,%esp
     88f:	5b                   	pop    %ebx
     890:	5e                   	pop    %esi
     891:	5f                   	pop    %edi
     892:	5d                   	pop    %ebp
     893:	c3                   	ret    
     894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     898:	8b 45 cc             	mov    -0x34(%ebp),%eax
     89b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     89e:	8d 04 90             	lea    (%eax,%edx,4),%eax
  cmd->argv[argc] = 0;
     8a1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     8a8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  return ret;
     8af:	8b 45 d0             	mov    -0x30(%ebp),%eax
}
     8b2:	83 c4 3c             	add    $0x3c,%esp
     8b5:	5b                   	pop    %ebx
     8b6:	5e                   	pop    %esi
     8b7:	5f                   	pop    %edi
     8b8:	5d                   	pop    %ebp
     8b9:	c3                   	ret    
      panic("syntax");
     8ba:	c7 04 24 32 16 00 00 	movl   $0x1632,(%esp)
     8c1:	e8 9a f8 ff ff       	call   160 <panic>
     8c6:	8d 76 00             	lea    0x0(%esi),%esi
     8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008d0 <parsepipe>:
{
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	57                   	push   %edi
     8d4:	56                   	push   %esi
     8d5:	53                   	push   %ebx
     8d6:	83 ec 1c             	sub    $0x1c,%esp
     8d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
     8df:	89 1c 24             	mov    %ebx,(%esp)
     8e2:	89 74 24 04          	mov    %esi,0x4(%esp)
     8e6:	e8 c5 fe ff ff       	call   7b0 <parseexec>
  if(peek(ps, es, "|")){
     8eb:	c7 44 24 08 4c 16 00 	movl   $0x164c,0x8(%esp)
     8f2:	00 
     8f3:	89 74 24 04          	mov    %esi,0x4(%esp)
     8f7:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
     8fa:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     8fc:	e8 6f fd ff ff       	call   670 <peek>
     901:	85 c0                	test   %eax,%eax
     903:	75 0b                	jne    910 <parsepipe+0x40>
}
     905:	83 c4 1c             	add    $0x1c,%esp
     908:	89 f8                	mov    %edi,%eax
     90a:	5b                   	pop    %ebx
     90b:	5e                   	pop    %esi
     90c:	5f                   	pop    %edi
     90d:	5d                   	pop    %ebp
     90e:	c3                   	ret    
     90f:	90                   	nop
    gettoken(ps, es, 0, 0);
     910:	89 74 24 04          	mov    %esi,0x4(%esp)
     914:	89 1c 24             	mov    %ebx,(%esp)
     917:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     91e:	00 
     91f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     926:	00 
     927:	e8 04 fc ff ff       	call   530 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     92c:	89 74 24 04          	mov    %esi,0x4(%esp)
     930:	89 1c 24             	mov    %ebx,(%esp)
     933:	e8 98 ff ff ff       	call   8d0 <parsepipe>
     938:	89 7d 08             	mov    %edi,0x8(%ebp)
     93b:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     93e:	83 c4 1c             	add    $0x1c,%esp
     941:	5b                   	pop    %ebx
     942:	5e                   	pop    %esi
     943:	5f                   	pop    %edi
     944:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     945:	e9 f6 fa ff ff       	jmp    440 <pipecmd>
     94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000950 <parseline>:
{
     950:	55                   	push   %ebp
     951:	89 e5                	mov    %esp,%ebp
     953:	57                   	push   %edi
     954:	56                   	push   %esi
     955:	53                   	push   %ebx
     956:	83 ec 1c             	sub    $0x1c,%esp
     959:	8b 5d 08             	mov    0x8(%ebp),%ebx
     95c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     95f:	89 1c 24             	mov    %ebx,(%esp)
     962:	89 74 24 04          	mov    %esi,0x4(%esp)
     966:	e8 65 ff ff ff       	call   8d0 <parsepipe>
     96b:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     96d:	eb 27                	jmp    996 <parseline+0x46>
     96f:	90                   	nop
    gettoken(ps, es, 0, 0);
     970:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     977:	00 
     978:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     97f:	00 
     980:	89 74 24 04          	mov    %esi,0x4(%esp)
     984:	89 1c 24             	mov    %ebx,(%esp)
     987:	e8 a4 fb ff ff       	call   530 <gettoken>
    cmd = backcmd(cmd);
     98c:	89 3c 24             	mov    %edi,(%esp)
     98f:	e8 4c fb ff ff       	call   4e0 <backcmd>
     994:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     996:	c7 44 24 08 4e 16 00 	movl   $0x164e,0x8(%esp)
     99d:	00 
     99e:	89 74 24 04          	mov    %esi,0x4(%esp)
     9a2:	89 1c 24             	mov    %ebx,(%esp)
     9a5:	e8 c6 fc ff ff       	call   670 <peek>
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 c2                	jne    970 <parseline+0x20>
  if(peek(ps, es, ";")){
     9ae:	c7 44 24 08 4a 16 00 	movl   $0x164a,0x8(%esp)
     9b5:	00 
     9b6:	89 74 24 04          	mov    %esi,0x4(%esp)
     9ba:	89 1c 24             	mov    %ebx,(%esp)
     9bd:	e8 ae fc ff ff       	call   670 <peek>
     9c2:	85 c0                	test   %eax,%eax
     9c4:	75 0a                	jne    9d0 <parseline+0x80>
}
     9c6:	83 c4 1c             	add    $0x1c,%esp
     9c9:	89 f8                	mov    %edi,%eax
     9cb:	5b                   	pop    %ebx
     9cc:	5e                   	pop    %esi
     9cd:	5f                   	pop    %edi
     9ce:	5d                   	pop    %ebp
     9cf:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     9d0:	89 74 24 04          	mov    %esi,0x4(%esp)
     9d4:	89 1c 24             	mov    %ebx,(%esp)
     9d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9de:	00 
     9df:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     9e6:	00 
     9e7:	e8 44 fb ff ff       	call   530 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9ec:	89 74 24 04          	mov    %esi,0x4(%esp)
     9f0:	89 1c 24             	mov    %ebx,(%esp)
     9f3:	e8 58 ff ff ff       	call   950 <parseline>
     9f8:	89 7d 08             	mov    %edi,0x8(%ebp)
     9fb:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     9fe:	83 c4 1c             	add    $0x1c,%esp
     a01:	5b                   	pop    %ebx
     a02:	5e                   	pop    %esi
     a03:	5f                   	pop    %edi
     a04:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     a05:	e9 86 fa ff ff       	jmp    490 <listcmd>
     a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a10 <parseblock>:
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
     a16:	83 ec 1c             	sub    $0x1c,%esp
     a19:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a1f:	c7 44 24 08 30 16 00 	movl   $0x1630,0x8(%esp)
     a26:	00 
     a27:	89 1c 24             	mov    %ebx,(%esp)
     a2a:	89 74 24 04          	mov    %esi,0x4(%esp)
     a2e:	e8 3d fc ff ff       	call   670 <peek>
     a33:	85 c0                	test   %eax,%eax
     a35:	74 76                	je     aad <parseblock+0x9d>
  gettoken(ps, es, 0, 0);
     a37:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a3e:	00 
     a3f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a46:	00 
     a47:	89 74 24 04          	mov    %esi,0x4(%esp)
     a4b:	89 1c 24             	mov    %ebx,(%esp)
     a4e:	e8 dd fa ff ff       	call   530 <gettoken>
  cmd = parseline(ps, es);
     a53:	89 74 24 04          	mov    %esi,0x4(%esp)
     a57:	89 1c 24             	mov    %ebx,(%esp)
     a5a:	e8 f1 fe ff ff       	call   950 <parseline>
  if(!peek(ps, es, ")"))
     a5f:	c7 44 24 08 6c 16 00 	movl   $0x166c,0x8(%esp)
     a66:	00 
     a67:	89 74 24 04          	mov    %esi,0x4(%esp)
     a6b:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
     a6e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a70:	e8 fb fb ff ff       	call   670 <peek>
     a75:	85 c0                	test   %eax,%eax
     a77:	74 40                	je     ab9 <parseblock+0xa9>
  gettoken(ps, es, 0, 0);
     a79:	89 74 24 04          	mov    %esi,0x4(%esp)
     a7d:	89 1c 24             	mov    %ebx,(%esp)
     a80:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a87:	00 
     a88:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a8f:	00 
     a90:	e8 9b fa ff ff       	call   530 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a95:	89 74 24 08          	mov    %esi,0x8(%esp)
     a99:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     a9d:	89 3c 24             	mov    %edi,(%esp)
     aa0:	e8 2b fc ff ff       	call   6d0 <parseredirs>
}
     aa5:	83 c4 1c             	add    $0x1c,%esp
     aa8:	5b                   	pop    %ebx
     aa9:	5e                   	pop    %esi
     aaa:	5f                   	pop    %edi
     aab:	5d                   	pop    %ebp
     aac:	c3                   	ret    
    panic("parseblock");
     aad:	c7 04 24 50 16 00 00 	movl   $0x1650,(%esp)
     ab4:	e8 a7 f6 ff ff       	call   160 <panic>
    panic("syntax - missing )");
     ab9:	c7 04 24 5b 16 00 00 	movl   $0x165b,(%esp)
     ac0:	e8 9b f6 ff ff       	call   160 <panic>
     ac5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ad0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	53                   	push   %ebx
     ad4:	83 ec 14             	sub    $0x14,%esp
     ad7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     ada:	85 db                	test   %ebx,%ebx
     adc:	0f 84 8e 00 00 00    	je     b70 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     ae2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ae5:	77 49                	ja     b30 <nulterminate+0x60>
     ae7:	8b 03                	mov    (%ebx),%eax
     ae9:	ff 24 85 ac 16 00 00 	jmp    *0x16ac(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     af0:	8b 43 04             	mov    0x4(%ebx),%eax
     af3:	89 04 24             	mov    %eax,(%esp)
     af6:	e8 d5 ff ff ff       	call   ad0 <nulterminate>
    nulterminate(lcmd->right);
     afb:	8b 43 08             	mov    0x8(%ebx),%eax
     afe:	89 04 24             	mov    %eax,(%esp)
     b01:	e8 ca ff ff ff       	call   ad0 <nulterminate>
    break;
     b06:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     b08:	83 c4 14             	add    $0x14,%esp
     b0b:	5b                   	pop    %ebx
     b0c:	5d                   	pop    %ebp
     b0d:	c3                   	ret    
     b0e:	66 90                	xchg   %ax,%ax
    for(i=0; ecmd->argv[i]; i++)
     b10:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b13:	89 d8                	mov    %ebx,%eax
     b15:	85 c9                	test   %ecx,%ecx
     b17:	74 17                	je     b30 <nulterminate+0x60>
     b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
     b20:	8b 50 2c             	mov    0x2c(%eax),%edx
     b23:	83 c0 04             	add    $0x4,%eax
     b26:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b29:	8b 50 04             	mov    0x4(%eax),%edx
     b2c:	85 d2                	test   %edx,%edx
     b2e:	75 f0                	jne    b20 <nulterminate+0x50>
}
     b30:	83 c4 14             	add    $0x14,%esp
  switch(cmd->type){
     b33:	89 d8                	mov    %ebx,%eax
}
     b35:	5b                   	pop    %ebx
     b36:	5d                   	pop    %ebp
     b37:	c3                   	ret    
    nulterminate(bcmd->cmd);
     b38:	8b 43 04             	mov    0x4(%ebx),%eax
     b3b:	89 04 24             	mov    %eax,(%esp)
     b3e:	e8 8d ff ff ff       	call   ad0 <nulterminate>
}
     b43:	83 c4 14             	add    $0x14,%esp
    break;
     b46:	89 d8                	mov    %ebx,%eax
}
     b48:	5b                   	pop    %ebx
     b49:	5d                   	pop    %ebp
     b4a:	c3                   	ret    
     b4b:	90                   	nop
     b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
     b50:	8b 43 04             	mov    0x4(%ebx),%eax
     b53:	89 04 24             	mov    %eax,(%esp)
     b56:	e8 75 ff ff ff       	call   ad0 <nulterminate>
    *rcmd->efile = 0;
     b5b:	8b 43 0c             	mov    0xc(%ebx),%eax
     b5e:	c6 00 00             	movb   $0x0,(%eax)
}
     b61:	83 c4 14             	add    $0x14,%esp
    break;
     b64:	89 d8                	mov    %ebx,%eax
}
     b66:	5b                   	pop    %ebx
     b67:	5d                   	pop    %ebp
     b68:	c3                   	ret    
     b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;
     b70:	31 c0                	xor    %eax,%eax
     b72:	eb 94                	jmp    b08 <nulterminate+0x38>
     b74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b80 <parsecmd>:
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	56                   	push   %esi
     b84:	53                   	push   %ebx
     b85:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
     b88:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b8b:	89 1c 24             	mov    %ebx,(%esp)
     b8e:	e8 ed 00 00 00       	call   c80 <strlen>
     b93:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b95:	8d 45 08             	lea    0x8(%ebp),%eax
     b98:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     b9c:	89 04 24             	mov    %eax,(%esp)
     b9f:	e8 ac fd ff ff       	call   950 <parseline>
  peek(&s, es, "");
     ba4:	c7 44 24 08 fa 15 00 	movl   $0x15fa,0x8(%esp)
     bab:	00 
     bac:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
     bb0:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     bb2:	8d 45 08             	lea    0x8(%ebp),%eax
     bb5:	89 04 24             	mov    %eax,(%esp)
     bb8:	e8 b3 fa ff ff       	call   670 <peek>
  if(s != es){
     bbd:	8b 45 08             	mov    0x8(%ebp),%eax
     bc0:	39 d8                	cmp    %ebx,%eax
     bc2:	75 11                	jne    bd5 <parsecmd+0x55>
  nulterminate(cmd);
     bc4:	89 34 24             	mov    %esi,(%esp)
     bc7:	e8 04 ff ff ff       	call   ad0 <nulterminate>
}
     bcc:	83 c4 10             	add    $0x10,%esp
     bcf:	89 f0                	mov    %esi,%eax
     bd1:	5b                   	pop    %ebx
     bd2:	5e                   	pop    %esi
     bd3:	5d                   	pop    %ebp
     bd4:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     bd5:	89 44 24 08          	mov    %eax,0x8(%esp)
     bd9:	c7 44 24 04 6e 16 00 	movl   $0x166e,0x4(%esp)
     be0:	00 
     be1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     be8:	e8 e3 03 00 00       	call   fd0 <printf>
    panic("syntax");
     bed:	c7 04 24 32 16 00 00 	movl   $0x1632,(%esp)
     bf4:	e8 67 f5 ff ff       	call   160 <panic>
     bf9:	66 90                	xchg   %ax,%ax
     bfb:	66 90                	xchg   %ax,%ax
     bfd:	66 90                	xchg   %ax,%ax
     bff:	90                   	nop

00000c00 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	8b 45 08             	mov    0x8(%ebp),%eax
     c06:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     c09:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c0a:	89 c2                	mov    %eax,%edx
     c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c10:	83 c1 01             	add    $0x1,%ecx
     c13:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     c17:	83 c2 01             	add    $0x1,%edx
     c1a:	84 db                	test   %bl,%bl
     c1c:	88 5a ff             	mov    %bl,-0x1(%edx)
     c1f:	75 ef                	jne    c10 <strcpy+0x10>
    ;
  return os;
}
     c21:	5b                   	pop    %ebx
     c22:	5d                   	pop    %ebp
     c23:	c3                   	ret    
     c24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c30 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	8b 55 08             	mov    0x8(%ebp),%edx
     c36:	53                   	push   %ebx
     c37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c3a:	0f b6 02             	movzbl (%edx),%eax
     c3d:	84 c0                	test   %al,%al
     c3f:	74 2d                	je     c6e <strcmp+0x3e>
     c41:	0f b6 19             	movzbl (%ecx),%ebx
     c44:	38 d8                	cmp    %bl,%al
     c46:	74 0e                	je     c56 <strcmp+0x26>
     c48:	eb 2b                	jmp    c75 <strcmp+0x45>
     c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c50:	38 c8                	cmp    %cl,%al
     c52:	75 15                	jne    c69 <strcmp+0x39>
    p++, q++;
     c54:	89 d9                	mov    %ebx,%ecx
     c56:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     c59:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     c5c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c5f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
     c63:	84 c0                	test   %al,%al
     c65:	75 e9                	jne    c50 <strcmp+0x20>
     c67:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     c69:	29 c8                	sub    %ecx,%eax
}
     c6b:	5b                   	pop    %ebx
     c6c:	5d                   	pop    %ebp
     c6d:	c3                   	ret    
     c6e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
     c71:	31 c0                	xor    %eax,%eax
     c73:	eb f4                	jmp    c69 <strcmp+0x39>
     c75:	0f b6 cb             	movzbl %bl,%ecx
     c78:	eb ef                	jmp    c69 <strcmp+0x39>
     c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c80 <strlen>:

uint
strlen(const char *s)
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     c86:	80 39 00             	cmpb   $0x0,(%ecx)
     c89:	74 12                	je     c9d <strlen+0x1d>
     c8b:	31 d2                	xor    %edx,%edx
     c8d:	8d 76 00             	lea    0x0(%esi),%esi
     c90:	83 c2 01             	add    $0x1,%edx
     c93:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     c97:	89 d0                	mov    %edx,%eax
     c99:	75 f5                	jne    c90 <strlen+0x10>
    ;
  return n;
}
     c9b:	5d                   	pop    %ebp
     c9c:	c3                   	ret    
  for(n = 0; s[n]; n++)
     c9d:	31 c0                	xor    %eax,%eax
}
     c9f:	5d                   	pop    %ebp
     ca0:	c3                   	ret    
     ca1:	eb 0d                	jmp    cb0 <memset>
     ca3:	90                   	nop
     ca4:	90                   	nop
     ca5:	90                   	nop
     ca6:	90                   	nop
     ca7:	90                   	nop
     ca8:	90                   	nop
     ca9:	90                   	nop
     caa:	90                   	nop
     cab:	90                   	nop
     cac:	90                   	nop
     cad:	90                   	nop
     cae:	90                   	nop
     caf:	90                   	nop

00000cb0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 55 08             	mov    0x8(%ebp),%edx
     cb6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     cb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     cba:	8b 45 0c             	mov    0xc(%ebp),%eax
     cbd:	89 d7                	mov    %edx,%edi
     cbf:	fc                   	cld    
     cc0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     cc2:	89 d0                	mov    %edx,%eax
     cc4:	5f                   	pop    %edi
     cc5:	5d                   	pop    %ebp
     cc6:	c3                   	ret    
     cc7:	89 f6                	mov    %esi,%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <strchr>:

char*
strchr(const char *s, char c)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	8b 45 08             	mov    0x8(%ebp),%eax
     cd6:	53                   	push   %ebx
     cd7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
     cda:	0f b6 18             	movzbl (%eax),%ebx
     cdd:	84 db                	test   %bl,%bl
     cdf:	74 1d                	je     cfe <strchr+0x2e>
    if(*s == c)
     ce1:	38 d3                	cmp    %dl,%bl
     ce3:	89 d1                	mov    %edx,%ecx
     ce5:	75 0d                	jne    cf4 <strchr+0x24>
     ce7:	eb 17                	jmp    d00 <strchr+0x30>
     ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     cf0:	38 ca                	cmp    %cl,%dl
     cf2:	74 0c                	je     d00 <strchr+0x30>
  for(; *s; s++)
     cf4:	83 c0 01             	add    $0x1,%eax
     cf7:	0f b6 10             	movzbl (%eax),%edx
     cfa:	84 d2                	test   %dl,%dl
     cfc:	75 f2                	jne    cf0 <strchr+0x20>
      return (char*)s;
  return 0;
     cfe:	31 c0                	xor    %eax,%eax
}
     d00:	5b                   	pop    %ebx
     d01:	5d                   	pop    %ebp
     d02:	c3                   	ret    
     d03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d10 <gets>:

char*
gets(char *buf, int max)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	57                   	push   %edi
     d14:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d15:	31 f6                	xor    %esi,%esi
{
     d17:	53                   	push   %ebx
     d18:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
     d1b:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     d1e:	eb 31                	jmp    d51 <gets+0x41>
    cc = read(0, &c, 1);
     d20:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     d27:	00 
     d28:	89 7c 24 04          	mov    %edi,0x4(%esp)
     d2c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d33:	e8 02 01 00 00       	call   e3a <read>
    if(cc < 1)
     d38:	85 c0                	test   %eax,%eax
     d3a:	7e 1d                	jle    d59 <gets+0x49>
      break;
    buf[i++] = c;
     d3c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
     d40:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
     d42:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
     d45:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
     d47:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d4b:	74 0c                	je     d59 <gets+0x49>
     d4d:	3c 0a                	cmp    $0xa,%al
     d4f:	74 08                	je     d59 <gets+0x49>
  for(i=0; i+1 < max; ){
     d51:	8d 5e 01             	lea    0x1(%esi),%ebx
     d54:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d57:	7c c7                	jl     d20 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     d59:	8b 45 08             	mov    0x8(%ebp),%eax
     d5c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     d60:	83 c4 2c             	add    $0x2c,%esp
     d63:	5b                   	pop    %ebx
     d64:	5e                   	pop    %esi
     d65:	5f                   	pop    %edi
     d66:	5d                   	pop    %ebp
     d67:	c3                   	ret    
     d68:	90                   	nop
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d70 <stat>:

int
stat(const char *n, struct stat *st)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	56                   	push   %esi
     d74:	53                   	push   %ebx
     d75:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d78:	8b 45 08             	mov    0x8(%ebp),%eax
     d7b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d82:	00 
     d83:	89 04 24             	mov    %eax,(%esp)
     d86:	e8 d7 00 00 00       	call   e62 <open>
  if(fd < 0)
     d8b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
     d8d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     d8f:	78 27                	js     db8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     d91:	8b 45 0c             	mov    0xc(%ebp),%eax
     d94:	89 1c 24             	mov    %ebx,(%esp)
     d97:	89 44 24 04          	mov    %eax,0x4(%esp)
     d9b:	e8 da 00 00 00       	call   e7a <fstat>
  close(fd);
     da0:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     da3:	89 c6                	mov    %eax,%esi
  close(fd);
     da5:	e8 a0 00 00 00       	call   e4a <close>
  return r;
     daa:	89 f0                	mov    %esi,%eax
}
     dac:	83 c4 10             	add    $0x10,%esp
     daf:	5b                   	pop    %ebx
     db0:	5e                   	pop    %esi
     db1:	5d                   	pop    %ebp
     db2:	c3                   	ret    
     db3:	90                   	nop
     db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     db8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     dbd:	eb ed                	jmp    dac <stat+0x3c>
     dbf:	90                   	nop

00000dc0 <atoi>:

int
atoi(const char *s)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     dc6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     dc7:	0f be 11             	movsbl (%ecx),%edx
     dca:	8d 42 d0             	lea    -0x30(%edx),%eax
     dcd:	3c 09                	cmp    $0x9,%al
  n = 0;
     dcf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     dd4:	77 17                	ja     ded <atoi+0x2d>
     dd6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     dd8:	83 c1 01             	add    $0x1,%ecx
     ddb:	8d 04 80             	lea    (%eax,%eax,4),%eax
     dde:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     de2:	0f be 11             	movsbl (%ecx),%edx
     de5:	8d 5a d0             	lea    -0x30(%edx),%ebx
     de8:	80 fb 09             	cmp    $0x9,%bl
     deb:	76 eb                	jbe    dd8 <atoi+0x18>
  return n;
}
     ded:	5b                   	pop    %ebx
     dee:	5d                   	pop    %ebp
     def:	c3                   	ret    

00000df0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     df0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     df1:	31 d2                	xor    %edx,%edx
{
     df3:	89 e5                	mov    %esp,%ebp
     df5:	56                   	push   %esi
     df6:	8b 45 08             	mov    0x8(%ebp),%eax
     df9:	53                   	push   %ebx
     dfa:	8b 5d 10             	mov    0x10(%ebp),%ebx
     dfd:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
     e00:	85 db                	test   %ebx,%ebx
     e02:	7e 12                	jle    e16 <memmove+0x26>
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     e08:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     e0c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     e0f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     e12:	39 da                	cmp    %ebx,%edx
     e14:	75 f2                	jne    e08 <memmove+0x18>
  return vdst;
}
     e16:	5b                   	pop    %ebx
     e17:	5e                   	pop    %esi
     e18:	5d                   	pop    %ebp
     e19:	c3                   	ret    

00000e1a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e1a:	b8 01 00 00 00       	mov    $0x1,%eax
     e1f:	cd 40                	int    $0x40
     e21:	c3                   	ret    

00000e22 <exit>:
SYSCALL(exit)
     e22:	b8 02 00 00 00       	mov    $0x2,%eax
     e27:	cd 40                	int    $0x40
     e29:	c3                   	ret    

00000e2a <wait>:
SYSCALL(wait)
     e2a:	b8 03 00 00 00       	mov    $0x3,%eax
     e2f:	cd 40                	int    $0x40
     e31:	c3                   	ret    

00000e32 <pipe>:
SYSCALL(pipe)
     e32:	b8 04 00 00 00       	mov    $0x4,%eax
     e37:	cd 40                	int    $0x40
     e39:	c3                   	ret    

00000e3a <read>:
SYSCALL(read)
     e3a:	b8 05 00 00 00       	mov    $0x5,%eax
     e3f:	cd 40                	int    $0x40
     e41:	c3                   	ret    

00000e42 <write>:
SYSCALL(write)
     e42:	b8 10 00 00 00       	mov    $0x10,%eax
     e47:	cd 40                	int    $0x40
     e49:	c3                   	ret    

00000e4a <close>:
SYSCALL(close)
     e4a:	b8 15 00 00 00       	mov    $0x15,%eax
     e4f:	cd 40                	int    $0x40
     e51:	c3                   	ret    

00000e52 <kill>:
SYSCALL(kill)
     e52:	b8 06 00 00 00       	mov    $0x6,%eax
     e57:	cd 40                	int    $0x40
     e59:	c3                   	ret    

00000e5a <exec>:
SYSCALL(exec)
     e5a:	b8 07 00 00 00       	mov    $0x7,%eax
     e5f:	cd 40                	int    $0x40
     e61:	c3                   	ret    

00000e62 <open>:
SYSCALL(open)
     e62:	b8 0f 00 00 00       	mov    $0xf,%eax
     e67:	cd 40                	int    $0x40
     e69:	c3                   	ret    

00000e6a <mknod>:
SYSCALL(mknod)
     e6a:	b8 11 00 00 00       	mov    $0x11,%eax
     e6f:	cd 40                	int    $0x40
     e71:	c3                   	ret    

00000e72 <unlink>:
SYSCALL(unlink)
     e72:	b8 12 00 00 00       	mov    $0x12,%eax
     e77:	cd 40                	int    $0x40
     e79:	c3                   	ret    

00000e7a <fstat>:
SYSCALL(fstat)
     e7a:	b8 08 00 00 00       	mov    $0x8,%eax
     e7f:	cd 40                	int    $0x40
     e81:	c3                   	ret    

00000e82 <link>:
SYSCALL(link)
     e82:	b8 13 00 00 00       	mov    $0x13,%eax
     e87:	cd 40                	int    $0x40
     e89:	c3                   	ret    

00000e8a <mkdir>:
SYSCALL(mkdir)
     e8a:	b8 14 00 00 00       	mov    $0x14,%eax
     e8f:	cd 40                	int    $0x40
     e91:	c3                   	ret    

00000e92 <chdir>:
SYSCALL(chdir)
     e92:	b8 09 00 00 00       	mov    $0x9,%eax
     e97:	cd 40                	int    $0x40
     e99:	c3                   	ret    

00000e9a <dup>:
SYSCALL(dup)
     e9a:	b8 0a 00 00 00       	mov    $0xa,%eax
     e9f:	cd 40                	int    $0x40
     ea1:	c3                   	ret    

00000ea2 <getpid>:
SYSCALL(getpid)
     ea2:	b8 0b 00 00 00       	mov    $0xb,%eax
     ea7:	cd 40                	int    $0x40
     ea9:	c3                   	ret    

00000eaa <sbrk>:
SYSCALL(sbrk)
     eaa:	b8 0c 00 00 00       	mov    $0xc,%eax
     eaf:	cd 40                	int    $0x40
     eb1:	c3                   	ret    

00000eb2 <sleep>:
SYSCALL(sleep)
     eb2:	b8 0d 00 00 00       	mov    $0xd,%eax
     eb7:	cd 40                	int    $0x40
     eb9:	c3                   	ret    

00000eba <uptime>:
SYSCALL(uptime)
     eba:	b8 0e 00 00 00       	mov    $0xe,%eax
     ebf:	cd 40                	int    $0x40
     ec1:	c3                   	ret    

00000ec2 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
     ec2:	b8 16 00 00 00       	mov    $0x16,%eax
     ec7:	cd 40                	int    $0x40
     ec9:	c3                   	ret    

00000eca <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
     eca:	b8 17 00 00 00       	mov    $0x17,%eax
     ecf:	cd 40                	int    $0x40
     ed1:	c3                   	ret    

00000ed2 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
     ed2:	b8 18 00 00 00       	mov    $0x18,%eax
     ed7:	cd 40                	int    $0x40
     ed9:	c3                   	ret    

00000eda <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
     eda:	b8 19 00 00 00       	mov    $0x19,%eax
     edf:	cd 40                	int    $0x40
     ee1:	c3                   	ret    

00000ee2 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
     ee2:	b8 1a 00 00 00       	mov    $0x1a,%eax
     ee7:	cd 40                	int    $0x40
     ee9:	c3                   	ret    

00000eea <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
     eea:	b8 1b 00 00 00       	mov    $0x1b,%eax
     eef:	cd 40                	int    $0x40
     ef1:	c3                   	ret    

00000ef2 <kthread_join>:
SYSCALL(kthread_join)
     ef2:	b8 1c 00 00 00       	mov    $0x1c,%eax
     ef7:	cd 40                	int    $0x40
     ef9:	c3                   	ret    

00000efa <kthread_exit>:
SYSCALL(kthread_exit)
     efa:	b8 1d 00 00 00       	mov    $0x1d,%eax
     eff:	cd 40                	int    $0x40
     f01:	c3                   	ret    

00000f02 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
     f02:	b8 1e 00 00 00       	mov    $0x1e,%eax
     f07:	cd 40                	int    $0x40
     f09:	c3                   	ret    

00000f0a <kthread_yield>:
SYSCALL(kthread_yield)
     f0a:	b8 1f 00 00 00       	mov    $0x1f,%eax
     f0f:	cd 40                	int    $0x40
     f11:	c3                   	ret    

00000f12 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
     f12:	b8 20 00 00 00       	mov    $0x20,%eax
     f17:	cd 40                	int    $0x40
     f19:	c3                   	ret    

00000f1a <kthread_thread_count>:
SYSCALL(kthread_thread_count)
     f1a:	b8 21 00 00 00       	mov    $0x21,%eax
     f1f:	cd 40                	int    $0x40
     f21:	c3                   	ret    
     f22:	66 90                	xchg   %ax,%ax
     f24:	66 90                	xchg   %ax,%ax
     f26:	66 90                	xchg   %ax,%ax
     f28:	66 90                	xchg   %ax,%ax
     f2a:	66 90                	xchg   %ax,%ax
     f2c:	66 90                	xchg   %ax,%ax
     f2e:	66 90                	xchg   %ax,%ax

00000f30 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	57                   	push   %edi
     f34:	56                   	push   %esi
     f35:	89 c6                	mov    %eax,%esi
     f37:	53                   	push   %ebx
     f38:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     f3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f3e:	85 db                	test   %ebx,%ebx
     f40:	74 09                	je     f4b <printint+0x1b>
     f42:	89 d0                	mov    %edx,%eax
     f44:	c1 e8 1f             	shr    $0x1f,%eax
     f47:	84 c0                	test   %al,%al
     f49:	75 75                	jne    fc0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     f4b:	89 d0                	mov    %edx,%eax
  neg = 0;
     f4d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     f54:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
     f57:	31 ff                	xor    %edi,%edi
     f59:	89 ce                	mov    %ecx,%esi
     f5b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     f5e:	eb 02                	jmp    f62 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
     f60:	89 cf                	mov    %ecx,%edi
     f62:	31 d2                	xor    %edx,%edx
     f64:	f7 f6                	div    %esi
     f66:	8d 4f 01             	lea    0x1(%edi),%ecx
     f69:	0f b6 92 cb 16 00 00 	movzbl 0x16cb(%edx),%edx
  }while((x /= base) != 0);
     f70:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     f72:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     f75:	75 e9                	jne    f60 <printint+0x30>
  if(neg)
     f77:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
     f7a:	89 c8                	mov    %ecx,%eax
     f7c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
     f7f:	85 d2                	test   %edx,%edx
     f81:	74 08                	je     f8b <printint+0x5b>
    buf[i++] = '-';
     f83:	8d 4f 02             	lea    0x2(%edi),%ecx
     f86:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
     f8b:	8d 79 ff             	lea    -0x1(%ecx),%edi
     f8e:	66 90                	xchg   %ax,%ax
     f90:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
     f95:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
     f98:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f9f:	00 
     fa0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     fa4:	89 34 24             	mov    %esi,(%esp)
     fa7:	88 45 d7             	mov    %al,-0x29(%ebp)
     faa:	e8 93 fe ff ff       	call   e42 <write>
  while(--i >= 0)
     faf:	83 ff ff             	cmp    $0xffffffff,%edi
     fb2:	75 dc                	jne    f90 <printint+0x60>
    putc(fd, buf[i]);
}
     fb4:	83 c4 4c             	add    $0x4c,%esp
     fb7:	5b                   	pop    %ebx
     fb8:	5e                   	pop    %esi
     fb9:	5f                   	pop    %edi
     fba:	5d                   	pop    %ebp
     fbb:	c3                   	ret    
     fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
     fc0:	89 d0                	mov    %edx,%eax
     fc2:	f7 d8                	neg    %eax
    neg = 1;
     fc4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     fcb:	eb 87                	jmp    f54 <printint+0x24>
     fcd:	8d 76 00             	lea    0x0(%esi),%esi

00000fd0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     fd4:	31 ff                	xor    %edi,%edi
{
     fd6:	56                   	push   %esi
     fd7:	53                   	push   %ebx
     fd8:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     fdb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
     fde:	8d 45 10             	lea    0x10(%ebp),%eax
{
     fe1:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
     fe4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
     fe7:	0f b6 13             	movzbl (%ebx),%edx
     fea:	83 c3 01             	add    $0x1,%ebx
     fed:	84 d2                	test   %dl,%dl
     fef:	75 39                	jne    102a <printf+0x5a>
     ff1:	e9 ca 00 00 00       	jmp    10c0 <printf+0xf0>
     ff6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     ff8:	83 fa 25             	cmp    $0x25,%edx
     ffb:	0f 84 c7 00 00 00    	je     10c8 <printf+0xf8>
  write(fd, &c, 1);
    1001:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1004:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    100b:	00 
    100c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1010:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
    1013:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
    1016:	e8 27 fe ff ff       	call   e42 <write>
    101b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
    101e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1022:	84 d2                	test   %dl,%dl
    1024:	0f 84 96 00 00 00    	je     10c0 <printf+0xf0>
    if(state == 0){
    102a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    102c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    102f:	74 c7                	je     ff8 <printf+0x28>
      }
    } else if(state == '%'){
    1031:	83 ff 25             	cmp    $0x25,%edi
    1034:	75 e5                	jne    101b <printf+0x4b>
      if(c == 'd' || c == 'u'){
    1036:	83 fa 75             	cmp    $0x75,%edx
    1039:	0f 84 99 00 00 00    	je     10d8 <printf+0x108>
    103f:	83 fa 64             	cmp    $0x64,%edx
    1042:	0f 84 90 00 00 00    	je     10d8 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1048:	25 f7 00 00 00       	and    $0xf7,%eax
    104d:	83 f8 70             	cmp    $0x70,%eax
    1050:	0f 84 aa 00 00 00    	je     1100 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1056:	83 fa 73             	cmp    $0x73,%edx
    1059:	0f 84 e9 00 00 00    	je     1148 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    105f:	83 fa 63             	cmp    $0x63,%edx
    1062:	0f 84 2b 01 00 00    	je     1193 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1068:	83 fa 25             	cmp    $0x25,%edx
    106b:	0f 84 4f 01 00 00    	je     11c0 <printf+0x1f0>
  write(fd, &c, 1);
    1071:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1074:	83 c3 01             	add    $0x1,%ebx
    1077:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    107e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    107f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    1081:	89 44 24 04          	mov    %eax,0x4(%esp)
    1085:	89 34 24             	mov    %esi,(%esp)
    1088:	89 55 d0             	mov    %edx,-0x30(%ebp)
    108b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    108f:	e8 ae fd ff ff       	call   e42 <write>
        putc(fd, c);
    1094:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
    1097:	8d 45 e7             	lea    -0x19(%ebp),%eax
    109a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10a1:	00 
    10a2:	89 44 24 04          	mov    %eax,0x4(%esp)
    10a6:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
    10a9:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    10ac:	e8 91 fd ff ff       	call   e42 <write>
  for(i = 0; fmt[i]; i++){
    10b1:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    10b5:	84 d2                	test   %dl,%dl
    10b7:	0f 85 6d ff ff ff    	jne    102a <printf+0x5a>
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
    10c0:	83 c4 3c             	add    $0x3c,%esp
    10c3:	5b                   	pop    %ebx
    10c4:	5e                   	pop    %esi
    10c5:	5f                   	pop    %edi
    10c6:	5d                   	pop    %ebp
    10c7:	c3                   	ret    
        state = '%';
    10c8:	bf 25 00 00 00       	mov    $0x25,%edi
    10cd:	e9 49 ff ff ff       	jmp    101b <printf+0x4b>
    10d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    10d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10df:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
    10e4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    10e7:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
    10e9:	8b 10                	mov    (%eax),%edx
    10eb:	89 f0                	mov    %esi,%eax
    10ed:	e8 3e fe ff ff       	call   f30 <printint>
        ap++;
    10f2:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    10f6:	e9 20 ff ff ff       	jmp    101b <printf+0x4b>
    10fb:	90                   	nop
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1100:	8d 45 e1             	lea    -0x1f(%ebp),%eax
    1103:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    110a:	00 
    110b:	89 44 24 04          	mov    %eax,0x4(%esp)
    110f:	89 34 24             	mov    %esi,(%esp)
    1112:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
    1116:	e8 27 fd ff ff       	call   e42 <write>
    111b:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    111e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1125:	00 
    1126:	89 44 24 04          	mov    %eax,0x4(%esp)
    112a:	89 34 24             	mov    %esi,(%esp)
    112d:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
    1131:	e8 0c fd ff ff       	call   e42 <write>
        printint(fd, *ap, 16, 0);
    1136:	b9 10 00 00 00       	mov    $0x10,%ecx
    113b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1142:	eb a0                	jmp    10e4 <printf+0x114>
    1144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1148:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    114b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
    114f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
    1151:	b8 c4 16 00 00       	mov    $0x16c4,%eax
    1156:	85 ff                	test   %edi,%edi
    1158:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    115b:	0f b6 07             	movzbl (%edi),%eax
    115e:	84 c0                	test   %al,%al
    1160:	74 2a                	je     118c <printf+0x1bc>
    1162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1168:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    116b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
    116e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
    1171:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1178:	00 
    1179:	89 44 24 04          	mov    %eax,0x4(%esp)
    117d:	89 34 24             	mov    %esi,(%esp)
    1180:	e8 bd fc ff ff       	call   e42 <write>
        while(*s != 0){
    1185:	0f b6 07             	movzbl (%edi),%eax
    1188:	84 c0                	test   %al,%al
    118a:	75 dc                	jne    1168 <printf+0x198>
      state = 0;
    118c:	31 ff                	xor    %edi,%edi
    118e:	e9 88 fe ff ff       	jmp    101b <printf+0x4b>
        putc(fd, *ap);
    1193:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
    1196:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
    1198:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    119a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11a1:	00 
    11a2:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
    11a5:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    11a8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    11ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    11af:	e8 8e fc ff ff       	call   e42 <write>
        ap++;
    11b4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    11b8:	e9 5e fe ff ff       	jmp    101b <printf+0x4b>
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    11c0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
    11c3:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    11c5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11cc:	00 
    11cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    11d1:	89 34 24             	mov    %esi,(%esp)
    11d4:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    11d8:	e8 65 fc ff ff       	call   e42 <write>
    11dd:	e9 39 fe ff ff       	jmp    101b <printf+0x4b>
    11e2:	66 90                	xchg   %ax,%ax
    11e4:	66 90                	xchg   %ax,%ax
    11e6:	66 90                	xchg   %ax,%ax
    11e8:	66 90                	xchg   %ax,%ax
    11ea:	66 90                	xchg   %ax,%ax
    11ec:	66 90                	xchg   %ax,%ax
    11ee:	66 90                	xchg   %ax,%ax

000011f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    11f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11f1:	a1 e4 1e 00 00       	mov    0x1ee4,%eax
{
    11f6:	89 e5                	mov    %esp,%ebp
    11f8:	57                   	push   %edi
    11f9:	56                   	push   %esi
    11fa:	53                   	push   %ebx
    11fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11fe:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
    1200:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1203:	39 d0                	cmp    %edx,%eax
    1205:	72 11                	jb     1218 <free+0x28>
    1207:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1208:	39 c8                	cmp    %ecx,%eax
    120a:	72 04                	jb     1210 <free+0x20>
    120c:	39 ca                	cmp    %ecx,%edx
    120e:	72 10                	jb     1220 <free+0x30>
    1210:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1212:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1214:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1216:	73 f0                	jae    1208 <free+0x18>
    1218:	39 ca                	cmp    %ecx,%edx
    121a:	72 04                	jb     1220 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    121c:	39 c8                	cmp    %ecx,%eax
    121e:	72 f0                	jb     1210 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1220:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1223:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1226:	39 cf                	cmp    %ecx,%edi
    1228:	74 1e                	je     1248 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    122a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    122d:	8b 48 04             	mov    0x4(%eax),%ecx
    1230:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1233:	39 f2                	cmp    %esi,%edx
    1235:	74 28                	je     125f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1237:	89 10                	mov    %edx,(%eax)
  freep = p;
    1239:	a3 e4 1e 00 00       	mov    %eax,0x1ee4
}
    123e:	5b                   	pop    %ebx
    123f:	5e                   	pop    %esi
    1240:	5f                   	pop    %edi
    1241:	5d                   	pop    %ebp
    1242:	c3                   	ret    
    1243:	90                   	nop
    1244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1248:	03 71 04             	add    0x4(%ecx),%esi
    124b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    124e:	8b 08                	mov    (%eax),%ecx
    1250:	8b 09                	mov    (%ecx),%ecx
    1252:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1255:	8b 48 04             	mov    0x4(%eax),%ecx
    1258:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    125b:	39 f2                	cmp    %esi,%edx
    125d:	75 d8                	jne    1237 <free+0x47>
    p->s.size += bp->s.size;
    125f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
    1262:	a3 e4 1e 00 00       	mov    %eax,0x1ee4
    p->s.size += bp->s.size;
    1267:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    126a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    126d:	89 10                	mov    %edx,(%eax)
}
    126f:	5b                   	pop    %ebx
    1270:	5e                   	pop    %esi
    1271:	5f                   	pop    %edi
    1272:	5d                   	pop    %ebp
    1273:	c3                   	ret    
    1274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    127a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001280 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	57                   	push   %edi
    1284:	56                   	push   %esi
    1285:	53                   	push   %ebx
    1286:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1289:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    128c:	8b 1d e4 1e 00 00    	mov    0x1ee4,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1292:	8d 48 07             	lea    0x7(%eax),%ecx
    1295:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1298:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    129a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    129d:	0f 84 9b 00 00 00    	je     133e <malloc+0xbe>
    12a3:	8b 13                	mov    (%ebx),%edx
    12a5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    12a8:	39 fe                	cmp    %edi,%esi
    12aa:	76 64                	jbe    1310 <malloc+0x90>
    12ac:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
    12b3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    12b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    12bb:	eb 0e                	jmp    12cb <malloc+0x4b>
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12c2:	8b 78 04             	mov    0x4(%eax),%edi
    12c5:	39 fe                	cmp    %edi,%esi
    12c7:	76 4f                	jbe    1318 <malloc+0x98>
    12c9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12cb:	3b 15 e4 1e 00 00    	cmp    0x1ee4,%edx
    12d1:	75 ed                	jne    12c0 <malloc+0x40>
  if(nu < 4096)
    12d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12d6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    12dc:	bf 00 10 00 00       	mov    $0x1000,%edi
    12e1:	0f 43 fe             	cmovae %esi,%edi
    12e4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
    12e7:	89 04 24             	mov    %eax,(%esp)
    12ea:	e8 bb fb ff ff       	call   eaa <sbrk>
  if(p == (char*)-1)
    12ef:	83 f8 ff             	cmp    $0xffffffff,%eax
    12f2:	74 18                	je     130c <malloc+0x8c>
  hp->s.size = nu;
    12f4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    12f7:	83 c0 08             	add    $0x8,%eax
    12fa:	89 04 24             	mov    %eax,(%esp)
    12fd:	e8 ee fe ff ff       	call   11f0 <free>
  return freep;
    1302:	8b 15 e4 1e 00 00    	mov    0x1ee4,%edx
      if((p = morecore(nunits)) == 0)
    1308:	85 d2                	test   %edx,%edx
    130a:	75 b4                	jne    12c0 <malloc+0x40>
        return 0;
    130c:	31 c0                	xor    %eax,%eax
    130e:	eb 20                	jmp    1330 <malloc+0xb0>
    if(p->s.size >= nunits){
    1310:	89 d0                	mov    %edx,%eax
    1312:	89 da                	mov    %ebx,%edx
    1314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1318:	39 fe                	cmp    %edi,%esi
    131a:	74 1c                	je     1338 <malloc+0xb8>
        p->s.size -= nunits;
    131c:	29 f7                	sub    %esi,%edi
    131e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1321:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1324:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    1327:	89 15 e4 1e 00 00    	mov    %edx,0x1ee4
      return (void*)(p + 1);
    132d:	83 c0 08             	add    $0x8,%eax
  }
}
    1330:	83 c4 1c             	add    $0x1c,%esp
    1333:	5b                   	pop    %ebx
    1334:	5e                   	pop    %esi
    1335:	5f                   	pop    %edi
    1336:	5d                   	pop    %ebp
    1337:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1338:	8b 08                	mov    (%eax),%ecx
    133a:	89 0a                	mov    %ecx,(%edx)
    133c:	eb e9                	jmp    1327 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
    133e:	c7 05 e4 1e 00 00 e8 	movl   $0x1ee8,0x1ee4
    1345:	1e 00 00 
    base.s.size = 0;
    1348:	ba e8 1e 00 00       	mov    $0x1ee8,%edx
    base.s.ptr = freep = prevp = &base;
    134d:	c7 05 e8 1e 00 00 e8 	movl   $0x1ee8,0x1ee8
    1354:	1e 00 00 
    base.s.size = 0;
    1357:	c7 05 ec 1e 00 00 00 	movl   $0x0,0x1eec
    135e:	00 00 00 
    1361:	e9 46 ff ff ff       	jmp    12ac <malloc+0x2c>
    1366:	66 90                	xchg   %ax,%ax
    1368:	66 90                	xchg   %ax,%ax
    136a:	66 90                	xchg   %ax,%ax
    136c:	66 90                	xchg   %ax,%ax
    136e:	66 90                	xchg   %ax,%ax

00001370 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	56                   	push   %esi
    1374:	53                   	push   %ebx
    1375:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
    1378:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    137f:	e8 fc fe ff ff       	call   1280 <malloc>

    if (bt == NULL) {
    1384:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
    1386:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
    1388:	74 66                	je     13f0 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
    138a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1391:	e8 ea fe ff ff       	call   1280 <malloc>
    if (bt->bt_stack == NULL) {
    1396:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
    1398:	89 c3                	mov    %eax,%ebx
    139a:	89 46 08             	mov    %eax,0x8(%esi)
    139d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
    13a0:	74 5d                	je     13ff <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
    13a2:	25 ff 0f 00 00       	and    $0xfff,%eax
    13a7:	75 37                	jne    13e0 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
    13a9:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
    13af:	8b 45 10             	mov    0x10(%ebp),%eax
    13b2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    13b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    13ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    13bd:	89 04 24             	mov    %eax,(%esp)
    13c0:	e8 25 fb ff ff       	call   eea <kthread_create>
    if (bt->bid != 0) {
    13c5:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
    13c7:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
    13c9:	74 2d                	je     13f8 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
    13cb:	8b 45 08             	mov    0x8(%ebp),%eax
    13ce:	89 30                	mov    %esi,(%eax)
        result = 0;
    13d0:	31 c0                	xor    %eax,%eax
}
    13d2:	83 c4 10             	add    $0x10,%esp
    13d5:	5b                   	pop    %ebx
    13d6:	5e                   	pop    %esi
    13d7:	5d                   	pop    %ebp
    13d8:	c3                   	ret    
    13d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    13e0:	29 c3                	sub    %eax,%ebx
    13e2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    13e8:	89 5e 04             	mov    %ebx,0x4(%esi)
    13eb:	eb bc                	jmp    13a9 <benny_thread_create+0x39>
    13ed:	8d 76 00             	lea    0x0(%esi),%esi
    13f0:	8b 1d 04 00 00 00    	mov    0x4,%ebx
    13f6:	eb b7                	jmp    13af <benny_thread_create+0x3f>
    int result = -1;
    13f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    13fd:	eb d3                	jmp    13d2 <benny_thread_create+0x62>
        free(bt);
    13ff:	89 34 24             	mov    %esi,(%esp)
        return NULL;
    1402:	31 f6                	xor    %esi,%esi
        free(bt);
    1404:	e8 e7 fd ff ff       	call   11f0 <free>
    1409:	8b 5b 04             	mov    0x4(%ebx),%ebx
    140c:	eb a1                	jmp    13af <benny_thread_create+0x3f>
    140e:	66 90                	xchg   %ax,%ax

00001410 <benny_thread_bid>:
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    return bt->bid;
    1413:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1416:	5d                   	pop    %ebp
    return bt->bid;
    1417:	8b 00                	mov    (%eax),%eax
}
    1419:	c3                   	ret    
    141a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001420 <benny_thread_join>:
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	53                   	push   %ebx
    1424:	83 ec 14             	sub    $0x14,%esp
    1427:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
    142a:	8b 03                	mov    (%ebx),%eax
    142c:	89 04 24             	mov    %eax,(%esp)
    142f:	e8 be fa ff ff       	call   ef2 <kthread_join>
    if (retVal == 0) {
    1434:	85 c0                	test   %eax,%eax
    1436:	75 27                	jne    145f <benny_thread_join+0x3f>
        free(bt->mem_stack);
    1438:	8b 53 08             	mov    0x8(%ebx),%edx
    143b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    143e:	89 14 24             	mov    %edx,(%esp)
    1441:	e8 aa fd ff ff       	call   11f0 <free>
        bt->bt_stack = bt->mem_stack = NULL;
    1446:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    144d:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
    1454:	89 1c 24             	mov    %ebx,(%esp)
    1457:	e8 94 fd ff ff       	call   11f0 <free>
    145c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    145f:	83 c4 14             	add    $0x14,%esp
    1462:	5b                   	pop    %ebx
    1463:	5d                   	pop    %ebp
    1464:	c3                   	ret    
    1465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001470 <benny_thread_exit>:
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
}
    1473:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
    1474:	e9 81 fa ff ff       	jmp    efa <kthread_exit>
    1479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001480 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
    1486:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
    148c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
    1493:	31 c0                	xor    %eax,%eax
    1495:	5d                   	pop    %ebp
    1496:	c3                   	ret    
    1497:	89 f6                	mov    %esi,%esi
    1499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000014a0 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
    14a0:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    14a1:	b8 01 00 00 00       	mov    $0x1,%eax
    14a6:	89 e5                	mov    %esp,%ebp
    14a8:	56                   	push   %esi
    14a9:	53                   	push   %ebx
    14aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
    14ad:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
    14b0:	85 c0                	test   %eax,%eax
    14b2:	be 01 00 00 00       	mov    $0x1,%esi
    14b7:	74 15                	je     14ce <benny_mootex_yieldlock+0x2e>
    14b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
    14c0:	e8 45 fa ff ff       	call   f0a <kthread_yield>
    14c5:	89 f0                	mov    %esi,%eax
    14c7:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
    14ca:	85 c0                	test   %eax,%eax
    14cc:	75 f2                	jne    14c0 <benny_mootex_yieldlock+0x20>
    return kthread_self();
    14ce:	e8 2f fa ff ff       	call   f02 <kthread_self>
    benny_mootex->bid = benny_self();
    14d3:	89 43 04             	mov    %eax,0x4(%ebx)
}
    14d6:	31 c0                	xor    %eax,%eax
    14d8:	5b                   	pop    %ebx
    14d9:	5e                   	pop    %esi
    14da:	5d                   	pop    %ebp
    14db:	c3                   	ret    
    14dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014e0 <benny_mootex_spinlock>:
{
    14e0:	55                   	push   %ebp
    14e1:	ba 01 00 00 00       	mov    $0x1,%edx
    14e6:	89 e5                	mov    %esp,%ebp
    14e8:	53                   	push   %ebx
    14e9:	83 ec 04             	sub    $0x4,%esp
    14ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
    14ef:	90                   	nop
    14f0:	89 d0                	mov    %edx,%eax
    14f2:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
    14f5:	85 c0                	test   %eax,%eax
    14f7:	75 f7                	jne    14f0 <benny_mootex_spinlock+0x10>
    return kthread_self();
    14f9:	e8 04 fa ff ff       	call   f02 <kthread_self>
    benny_mootex->bid = benny_self();
    14fe:	89 43 04             	mov    %eax,0x4(%ebx)
}
    1501:	83 c4 04             	add    $0x4,%esp
    1504:	31 c0                	xor    %eax,%eax
    1506:	5b                   	pop    %ebx
    1507:	5d                   	pop    %ebp
    1508:	c3                   	ret    
    1509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001510 <benny_mootex_unlock>:
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	53                   	push   %ebx
    1514:	83 ec 04             	sub    $0x4,%esp
    1517:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
    151a:	e8 e3 f9 ff ff       	call   f02 <kthread_self>
    if(tid == benny_mootex->bid){
    151f:	39 43 04             	cmp    %eax,0x4(%ebx)
    1522:	75 1c                	jne    1540 <benny_mootex_unlock+0x30>
      __sync_synchronize();
    1524:	0f ae f0             	mfence 
    return 0;
    1527:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
    1529:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
    1530:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
    1536:	83 c4 04             	add    $0x4,%esp
    1539:	5b                   	pop    %ebx
    153a:	5d                   	pop    %ebp
    153b:	c3                   	ret    
    153c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1540:	83 c4 04             	add    $0x4,%esp
      return -1;
    1543:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1548:	5b                   	pop    %ebx
    1549:	5d                   	pop    %ebp
    154a:	c3                   	ret    
    154b:	90                   	nop
    154c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001550 <benny_mootex_trylock>:
{
    1550:	55                   	push   %ebp
    1551:	b8 01 00 00 00       	mov    $0x1,%eax
    1556:	89 e5                	mov    %esp,%ebp
    1558:	53                   	push   %ebx
    1559:	83 ec 04             	sub    $0x4,%esp
    155c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    155f:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
    1562:	85 c0                	test   %eax,%eax
    1564:	75 08                	jne    156e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
    1566:	e8 97 f9 ff ff       	call   f02 <kthread_self>
        benny_mootex->bid = tid;
    156b:	89 43 04             	mov    %eax,0x4(%ebx)
}
    156e:	83 c4 04             	add    $0x4,%esp
    1571:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1576:	5b                   	pop    %ebx
    1577:	5d                   	pop    %ebp
    1578:	c3                   	ret    
    1579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001580 <benny_mootex_wholock>:
{
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
    1583:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1586:	5d                   	pop    %ebp
    return benny_mootex->bid;
    1587:	8b 40 04             	mov    0x4(%eax),%eax
}
    158a:	c3                   	ret    
    158b:	90                   	nop
    158c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001590 <benny_mootex_islocked>:
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
    1593:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1596:	5d                   	pop    %ebp
    return benny_mootex->locked;
    1597:	8b 00                	mov    (%eax),%eax
}
    1599:	c3                   	ret    
    159a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000015a0 <benny_self>:
{
    15a0:	55                   	push   %ebp
    15a1:	89 e5                	mov    %esp,%ebp
}
    15a3:	5d                   	pop    %ebp
    return kthread_self();
    15a4:	e9 59 f9 ff ff       	jmp    f02 <kthread_self>
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015b0 <benny_yield>:
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    
}
    15b3:	5d                   	pop    %ebp
    return kthread_yield();
    15b4:	e9 51 f9 ff ff       	jmp    f0a <kthread_yield>
    15b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015c0 <benny_cpu_count>:

int
benny_cpu_count(void)
{
    15c0:	55                   	push   %ebp
    15c1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
    15c3:	5d                   	pop    %ebp
    return kthread_cpu_count();
    15c4:	e9 49 f9 ff ff       	jmp    f12 <kthread_cpu_count>
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015d0 <benny_thread_count>:

int
benny_thread_count(void)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
    15d3:	5d                   	pop    %ebp
    return kthread_thread_count();
    15d4:	e9 41 f9 ff ff       	jmp    f1a <kthread_thread_count>
