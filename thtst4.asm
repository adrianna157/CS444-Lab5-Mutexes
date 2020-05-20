
_thtst4:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}
#endif // KTHREADS

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
#ifdef KTHREADS
    int pid = -1;

    pid = fork();
   9:	e8 9c 04 00 00       	call   4aa <fork>
    if (pid == 0) {
   e:	85 c0                	test   %eax,%eax
  10:	74 05                	je     17 <main+0x17>
        benny_thread_join(bt[2]); // tid = 3
        
        printf(1, "All threads joined\n");
    }
#endif // KTHREADS
    exit();
  12:	e8 9b 04 00 00       	call   4b2 <exit>
        benny_thread_create(&(bt[0]), func1, (void *) 1);
  17:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  1e:	00 
  1f:	c7 44 24 04 10 01 00 	movl   $0x110,0x4(%esp)
  26:	00 
  27:	c7 04 24 00 12 00 00 	movl   $0x1200,(%esp)
  2e:	e8 cd 09 00 00       	call   a00 <benny_thread_create>
        long_time(20);
  33:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  3a:	e8 41 00 00 00       	call   80 <long_time>
        benny_thread_join(bt[0]); // tid = 1
  3f:	a1 00 12 00 00       	mov    0x1200,%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 64 0a 00 00       	call   ab0 <benny_thread_join>
        benny_thread_join(bt[1]); // tid = 2
  4c:	a1 04 12 00 00       	mov    0x1204,%eax
  51:	89 04 24             	mov    %eax,(%esp)
  54:	e8 57 0a 00 00       	call   ab0 <benny_thread_join>
        benny_thread_join(bt[2]); // tid = 3
  59:	a1 08 12 00 00       	mov    0x1208,%eax
  5e:	89 04 24             	mov    %eax,(%esp)
  61:	e8 4a 0a 00 00       	call   ab0 <benny_thread_join>
        printf(1, "All threads joined\n");
  66:	c7 44 24 04 7f 0c 00 	movl   $0xc7f,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  75:	e8 e6 05 00 00       	call   660 <printf>
  7a:	eb 96                	jmp    12 <main+0x12>
  7c:	66 90                	xchg   %ax,%ax
  7e:	66 90                	xchg   %ax,%ax

00000080 <long_time>:
{
  80:	55                   	push   %ebp
        if ((sum % (MAXSHORT * MAXSHORT)) == 0) {
  81:	b9 03 00 ff 3f       	mov    $0x3fff0003,%ecx
{
  86:	89 e5                	mov    %esp,%ebp
  88:	57                   	push   %edi
            sum = 0;
  89:	31 ff                	xor    %edi,%edi
{
  8b:	56                   	push   %esi
  8c:	be ff ff ff 7f       	mov    $0x7fffffff,%esi
  91:	53                   	push   %ebx
        sum ++;
  92:	bb 02 00 00 00       	mov    $0x2,%ebx
{
  97:	83 ec 2c             	sub    $0x2c,%esp
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            sum = 0;
  a0:	81 fb 00 00 00 40    	cmp    $0x40000000,%ebx
  a6:	0f 43 df             	cmovae %edi,%ebx
    for(i = 0; i < max; i++) {
  a9:	83 ee 01             	sub    $0x1,%esi
  ac:	74 53                	je     101 <long_time+0x81>
        sum ++;
  ae:	83 c3 01             	add    $0x1,%ebx
        if ((sum % (MAXSHORT * MAXSHORT)) == 0) {
  b1:	89 d8                	mov    %ebx,%eax
  b3:	f7 e1                	mul    %ecx
  b5:	c1 ea 1c             	shr    $0x1c,%edx
  b8:	69 d2 01 00 01 40    	imul   $0x40010001,%edx,%edx
  be:	39 d3                	cmp    %edx,%ebx
  c0:	75 de                	jne    a0 <long_time+0x20>
            sum += arg;
  c2:	03 5d 08             	add    0x8(%ebp),%ebx
  c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
            printf(1, "\t%d  thtst2: %d  %d\n\n", arg, getpid(), sum);
  c8:	e8 65 04 00 00       	call   532 <getpid>
  cd:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  d1:	c7 44 24 04 69 0c 00 	movl   $0xc69,0x4(%esp)
  d8:	00 
  d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e4:	8b 45 08             	mov    0x8(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	e8 70 05 00 00       	call   660 <printf>
            sum = 0;
  f0:	81 fb 00 00 00 40    	cmp    $0x40000000,%ebx
            printf(1, "\t%d  thtst2: %d  %d\n\n", arg, getpid(), sum);
  f6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
            sum = 0;
  f9:	0f 43 df             	cmovae %edi,%ebx
    for(i = 0; i < max; i++) {
  fc:	83 ee 01             	sub    $0x1,%esi
  ff:	75 ad                	jne    ae <long_time+0x2e>
}
 101:	83 c4 2c             	add    $0x2c,%esp
 104:	5b                   	pop    %ebx
 105:	5e                   	pop    %esi
 106:	5f                   	pop    %edi
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <func1>:
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	83 ec 14             	sub    $0x14,%esp
 117:	8b 5d 08             	mov    0x8(%ebp),%ebx
    benny_thread_create(&(bt[arg]), func2, (void *) (arg + 1));
 11a:	c7 44 24 04 80 01 00 	movl   $0x180,0x4(%esp)
 121:	00 
 122:	8d 43 01             	lea    0x1(%ebx),%eax
 125:	89 44 24 08          	mov    %eax,0x8(%esp)
 129:	8d 04 9d 00 12 00 00 	lea    0x1200(,%ebx,4),%eax
 130:	89 04 24             	mov    %eax,(%esp)
 133:	e8 c8 08 00 00       	call   a00 <benny_thread_create>
    long_time(arg);
 138:	89 1c 24             	mov    %ebx,(%esp)
 13b:	e8 40 ff ff ff       	call   80 <long_time>
    benny_thread_join(bt[3]); // tid = 4
 140:	a1 0c 12 00 00       	mov    0x120c,%eax
 145:	89 04 24             	mov    %eax,(%esp)
 148:	e8 63 09 00 00       	call   ab0 <benny_thread_join>
    benny_thread_join(bt[4]); // tid = 5
 14d:	a1 10 12 00 00       	mov    0x1210,%eax
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 56 09 00 00       	call   ab0 <benny_thread_join>
    benny_thread_exit(1);
 15a:	c7 45 08 01 00 00 00 	movl   $0x1,0x8(%ebp)
    bt[3] = NULL;
 161:	c7 05 0c 12 00 00 00 	movl   $0x0,0x120c
 168:	00 00 00 
    bt[4] = NULL;
 16b:	c7 05 10 12 00 00 00 	movl   $0x0,0x1210
 172:	00 00 00 
}
 175:	83 c4 14             	add    $0x14,%esp
 178:	5b                   	pop    %ebx
 179:	5d                   	pop    %ebp
    benny_thread_exit(1);
 17a:	e9 81 09 00 00       	jmp    b00 <benny_thread_exit>
 17f:	90                   	nop

00000180 <func2>:
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	83 ec 14             	sub    $0x14,%esp
 187:	8b 5d 08             	mov    0x8(%ebp),%ebx
    benny_thread_create(&(bt[arg]), func3, (void *) (arg + 1));
 18a:	c7 44 24 04 d0 01 00 	movl   $0x1d0,0x4(%esp)
 191:	00 
 192:	8d 43 01             	lea    0x1(%ebx),%eax
 195:	89 44 24 08          	mov    %eax,0x8(%esp)
 199:	8d 04 9d 00 12 00 00 	lea    0x1200(,%ebx,4),%eax
 1a0:	89 04 24             	mov    %eax,(%esp)
 1a3:	e8 58 08 00 00       	call   a00 <benny_thread_create>
    long_time(arg);
 1a8:	89 1c 24             	mov    %ebx,(%esp)
 1ab:	e8 d0 fe ff ff       	call   80 <long_time>
    benny_thread_exit(2);
 1b0:	c7 45 08 02 00 00 00 	movl   $0x2,0x8(%ebp)
}
 1b7:	83 c4 14             	add    $0x14,%esp
 1ba:	5b                   	pop    %ebx
 1bb:	5d                   	pop    %ebp
    benny_thread_exit(2);
 1bc:	e9 3f 09 00 00       	jmp    b00 <benny_thread_exit>
 1c1:	eb 0d                	jmp    1d0 <func3>
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

000001d0 <func3>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	83 ec 14             	sub    $0x14,%esp
 1d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    benny_thread_create(&(bt[arg]), func4, (void *) (arg + 1));
 1da:	c7 44 24 04 20 02 00 	movl   $0x220,0x4(%esp)
 1e1:	00 
 1e2:	8d 43 01             	lea    0x1(%ebx),%eax
 1e5:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e9:	8d 04 9d 00 12 00 00 	lea    0x1200(,%ebx,4),%eax
 1f0:	89 04 24             	mov    %eax,(%esp)
 1f3:	e8 08 08 00 00       	call   a00 <benny_thread_create>
    long_time(arg);
 1f8:	89 1c 24             	mov    %ebx,(%esp)
 1fb:	e8 80 fe ff ff       	call   80 <long_time>
    benny_thread_exit(3);
 200:	c7 45 08 03 00 00 00 	movl   $0x3,0x8(%ebp)
}
 207:	83 c4 14             	add    $0x14,%esp
 20a:	5b                   	pop    %ebx
 20b:	5d                   	pop    %ebp
    benny_thread_exit(3);
 20c:	e9 ef 08 00 00       	jmp    b00 <benny_thread_exit>
 211:	eb 0d                	jmp    220 <func4>
 213:	90                   	nop
 214:	90                   	nop
 215:	90                   	nop
 216:	90                   	nop
 217:	90                   	nop
 218:	90                   	nop
 219:	90                   	nop
 21a:	90                   	nop
 21b:	90                   	nop
 21c:	90                   	nop
 21d:	90                   	nop
 21e:	90                   	nop
 21f:	90                   	nop

00000220 <func4>:
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	83 ec 14             	sub    $0x14,%esp
 227:	8b 5d 08             	mov    0x8(%ebp),%ebx
    benny_thread_create(&(bt[arg]), func5, (void *) (arg + 1));
 22a:	c7 44 24 04 70 02 00 	movl   $0x270,0x4(%esp)
 231:	00 
 232:	8d 43 01             	lea    0x1(%ebx),%eax
 235:	89 44 24 08          	mov    %eax,0x8(%esp)
 239:	8d 04 9d 00 12 00 00 	lea    0x1200(,%ebx,4),%eax
 240:	89 04 24             	mov    %eax,(%esp)
 243:	e8 b8 07 00 00       	call   a00 <benny_thread_create>
    long_time(arg);
 248:	89 1c 24             	mov    %ebx,(%esp)
 24b:	e8 30 fe ff ff       	call   80 <long_time>
    benny_thread_exit(4);
 250:	c7 45 08 04 00 00 00 	movl   $0x4,0x8(%ebp)
}
 257:	83 c4 14             	add    $0x14,%esp
 25a:	5b                   	pop    %ebx
 25b:	5d                   	pop    %ebp
    benny_thread_exit(4);
 25c:	e9 9f 08 00 00       	jmp    b00 <benny_thread_exit>
 261:	eb 0d                	jmp    270 <func5>
 263:	90                   	nop
 264:	90                   	nop
 265:	90                   	nop
 266:	90                   	nop
 267:	90                   	nop
 268:	90                   	nop
 269:	90                   	nop
 26a:	90                   	nop
 26b:	90                   	nop
 26c:	90                   	nop
 26d:	90                   	nop
 26e:	90                   	nop
 26f:	90                   	nop

00000270 <func5>:
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	83 ec 18             	sub    $0x18,%esp
    long_time(arg);
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	89 04 24             	mov    %eax,(%esp)
 27c:	e8 ff fd ff ff       	call   80 <long_time>
    benny_thread_exit(5);
 281:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
 288:	c9                   	leave  
    benny_thread_exit(5);
 289:	e9 72 08 00 00       	jmp    b00 <benny_thread_exit>
 28e:	66 90                	xchg   %ax,%ax

00000290 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 299:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 29a:	89 c2                	mov    %eax,%edx
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a0:	83 c1 01             	add    $0x1,%ecx
 2a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 2a7:	83 c2 01             	add    $0x1,%edx
 2aa:	84 db                	test   %bl,%bl
 2ac:	88 5a ff             	mov    %bl,-0x1(%edx)
 2af:	75 ef                	jne    2a0 <strcpy+0x10>
    ;
  return os;
}
 2b1:	5b                   	pop    %ebx
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 55 08             	mov    0x8(%ebp),%edx
 2c6:	53                   	push   %ebx
 2c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 2ca:	0f b6 02             	movzbl (%edx),%eax
 2cd:	84 c0                	test   %al,%al
 2cf:	74 2d                	je     2fe <strcmp+0x3e>
 2d1:	0f b6 19             	movzbl (%ecx),%ebx
 2d4:	38 d8                	cmp    %bl,%al
 2d6:	74 0e                	je     2e6 <strcmp+0x26>
 2d8:	eb 2b                	jmp    305 <strcmp+0x45>
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2e0:	38 c8                	cmp    %cl,%al
 2e2:	75 15                	jne    2f9 <strcmp+0x39>
    p++, q++;
 2e4:	89 d9                	mov    %ebx,%ecx
 2e6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2e9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 2ec:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 2ef:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 2f3:	84 c0                	test   %al,%al
 2f5:	75 e9                	jne    2e0 <strcmp+0x20>
 2f7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2f9:	29 c8                	sub    %ecx,%eax
}
 2fb:	5b                   	pop    %ebx
 2fc:	5d                   	pop    %ebp
 2fd:	c3                   	ret    
 2fe:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 301:	31 c0                	xor    %eax,%eax
 303:	eb f4                	jmp    2f9 <strcmp+0x39>
 305:	0f b6 cb             	movzbl %bl,%ecx
 308:	eb ef                	jmp    2f9 <strcmp+0x39>
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <strlen>:

uint
strlen(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 316:	80 39 00             	cmpb   $0x0,(%ecx)
 319:	74 12                	je     32d <strlen+0x1d>
 31b:	31 d2                	xor    %edx,%edx
 31d:	8d 76 00             	lea    0x0(%esi),%esi
 320:	83 c2 01             	add    $0x1,%edx
 323:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 327:	89 d0                	mov    %edx,%eax
 329:	75 f5                	jne    320 <strlen+0x10>
    ;
  return n;
}
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 32d:	31 c0                	xor    %eax,%eax
}
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	eb 0d                	jmp    340 <memset>
 333:	90                   	nop
 334:	90                   	nop
 335:	90                   	nop
 336:	90                   	nop
 337:	90                   	nop
 338:	90                   	nop
 339:	90                   	nop
 33a:	90                   	nop
 33b:	90                   	nop
 33c:	90                   	nop
 33d:	90                   	nop
 33e:	90                   	nop
 33f:	90                   	nop

00000340 <memset>:

void*
memset(void *dst, int c, uint n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 55 08             	mov    0x8(%ebp),%edx
 346:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 347:	8b 4d 10             	mov    0x10(%ebp),%ecx
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	89 d7                	mov    %edx,%edi
 34f:	fc                   	cld    
 350:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 352:	89 d0                	mov    %edx,%eax
 354:	5f                   	pop    %edi
 355:	5d                   	pop    %ebp
 356:	c3                   	ret    
 357:	89 f6                	mov    %esi,%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	53                   	push   %ebx
 367:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 36a:	0f b6 18             	movzbl (%eax),%ebx
 36d:	84 db                	test   %bl,%bl
 36f:	74 1d                	je     38e <strchr+0x2e>
    if(*s == c)
 371:	38 d3                	cmp    %dl,%bl
 373:	89 d1                	mov    %edx,%ecx
 375:	75 0d                	jne    384 <strchr+0x24>
 377:	eb 17                	jmp    390 <strchr+0x30>
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 380:	38 ca                	cmp    %cl,%dl
 382:	74 0c                	je     390 <strchr+0x30>
  for(; *s; s++)
 384:	83 c0 01             	add    $0x1,%eax
 387:	0f b6 10             	movzbl (%eax),%edx
 38a:	84 d2                	test   %dl,%dl
 38c:	75 f2                	jne    380 <strchr+0x20>
      return (char*)s;
  return 0;
 38e:	31 c0                	xor    %eax,%eax
}
 390:	5b                   	pop    %ebx
 391:	5d                   	pop    %ebp
 392:	c3                   	ret    
 393:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a5:	31 f6                	xor    %esi,%esi
{
 3a7:	53                   	push   %ebx
 3a8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 3ab:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 3ae:	eb 31                	jmp    3e1 <gets+0x41>
    cc = read(0, &c, 1);
 3b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b7:	00 
 3b8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 3bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3c3:	e8 02 01 00 00       	call   4ca <read>
    if(cc < 1)
 3c8:	85 c0                	test   %eax,%eax
 3ca:	7e 1d                	jle    3e9 <gets+0x49>
      break;
    buf[i++] = c;
 3cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 3d0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 3d2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 3d5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 3d7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 3db:	74 0c                	je     3e9 <gets+0x49>
 3dd:	3c 0a                	cmp    $0xa,%al
 3df:	74 08                	je     3e9 <gets+0x49>
  for(i=0; i+1 < max; ){
 3e1:	8d 5e 01             	lea    0x1(%esi),%ebx
 3e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3e7:	7c c7                	jl     3b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3f0:	83 c4 2c             	add    $0x2c,%esp
 3f3:	5b                   	pop    %ebx
 3f4:	5e                   	pop    %esi
 3f5:	5f                   	pop    %edi
 3f6:	5d                   	pop    %ebp
 3f7:	c3                   	ret    
 3f8:	90                   	nop
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <stat>:

int
stat(const char *n, struct stat *st)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	56                   	push   %esi
 404:	53                   	push   %ebx
 405:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 408:	8b 45 08             	mov    0x8(%ebp),%eax
 40b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 412:	00 
 413:	89 04 24             	mov    %eax,(%esp)
 416:	e8 d7 00 00 00       	call   4f2 <open>
  if(fd < 0)
 41b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 41d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 41f:	78 27                	js     448 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 421:	8b 45 0c             	mov    0xc(%ebp),%eax
 424:	89 1c 24             	mov    %ebx,(%esp)
 427:	89 44 24 04          	mov    %eax,0x4(%esp)
 42b:	e8 da 00 00 00       	call   50a <fstat>
  close(fd);
 430:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 433:	89 c6                	mov    %eax,%esi
  close(fd);
 435:	e8 a0 00 00 00       	call   4da <close>
  return r;
 43a:	89 f0                	mov    %esi,%eax
}
 43c:	83 c4 10             	add    $0x10,%esp
 43f:	5b                   	pop    %ebx
 440:	5e                   	pop    %esi
 441:	5d                   	pop    %ebp
 442:	c3                   	ret    
 443:	90                   	nop
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 448:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 44d:	eb ed                	jmp    43c <stat+0x3c>
 44f:	90                   	nop

00000450 <atoi>:

int
atoi(const char *s)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	8b 4d 08             	mov    0x8(%ebp),%ecx
 456:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 457:	0f be 11             	movsbl (%ecx),%edx
 45a:	8d 42 d0             	lea    -0x30(%edx),%eax
 45d:	3c 09                	cmp    $0x9,%al
  n = 0;
 45f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 464:	77 17                	ja     47d <atoi+0x2d>
 466:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 468:	83 c1 01             	add    $0x1,%ecx
 46b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 46e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 472:	0f be 11             	movsbl (%ecx),%edx
 475:	8d 5a d0             	lea    -0x30(%edx),%ebx
 478:	80 fb 09             	cmp    $0x9,%bl
 47b:	76 eb                	jbe    468 <atoi+0x18>
  return n;
}
 47d:	5b                   	pop    %ebx
 47e:	5d                   	pop    %ebp
 47f:	c3                   	ret    

00000480 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 480:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 481:	31 d2                	xor    %edx,%edx
{
 483:	89 e5                	mov    %esp,%ebp
 485:	56                   	push   %esi
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	53                   	push   %ebx
 48a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 48d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 490:	85 db                	test   %ebx,%ebx
 492:	7e 12                	jle    4a6 <memmove+0x26>
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 498:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 49c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 49f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 4a2:	39 da                	cmp    %ebx,%edx
 4a4:	75 f2                	jne    498 <memmove+0x18>
  return vdst;
}
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    

000004aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4aa:	b8 01 00 00 00       	mov    $0x1,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <exit>:
SYSCALL(exit)
 4b2:	b8 02 00 00 00       	mov    $0x2,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <wait>:
SYSCALL(wait)
 4ba:	b8 03 00 00 00       	mov    $0x3,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <pipe>:
SYSCALL(pipe)
 4c2:	b8 04 00 00 00       	mov    $0x4,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <read>:
SYSCALL(read)
 4ca:	b8 05 00 00 00       	mov    $0x5,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <write>:
SYSCALL(write)
 4d2:	b8 10 00 00 00       	mov    $0x10,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <close>:
SYSCALL(close)
 4da:	b8 15 00 00 00       	mov    $0x15,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <kill>:
SYSCALL(kill)
 4e2:	b8 06 00 00 00       	mov    $0x6,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <exec>:
SYSCALL(exec)
 4ea:	b8 07 00 00 00       	mov    $0x7,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <open>:
SYSCALL(open)
 4f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <mknod>:
SYSCALL(mknod)
 4fa:	b8 11 00 00 00       	mov    $0x11,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <unlink>:
SYSCALL(unlink)
 502:	b8 12 00 00 00       	mov    $0x12,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <fstat>:
SYSCALL(fstat)
 50a:	b8 08 00 00 00       	mov    $0x8,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <link>:
SYSCALL(link)
 512:	b8 13 00 00 00       	mov    $0x13,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <mkdir>:
SYSCALL(mkdir)
 51a:	b8 14 00 00 00       	mov    $0x14,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <chdir>:
SYSCALL(chdir)
 522:	b8 09 00 00 00       	mov    $0x9,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <dup>:
SYSCALL(dup)
 52a:	b8 0a 00 00 00       	mov    $0xa,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <getpid>:
SYSCALL(getpid)
 532:	b8 0b 00 00 00       	mov    $0xb,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <sbrk>:
SYSCALL(sbrk)
 53a:	b8 0c 00 00 00       	mov    $0xc,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <sleep>:
SYSCALL(sleep)
 542:	b8 0d 00 00 00       	mov    $0xd,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <uptime>:
SYSCALL(uptime)
 54a:	b8 0e 00 00 00       	mov    $0xe,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 552:	b8 16 00 00 00       	mov    $0x16,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 55a:	b8 17 00 00 00       	mov    $0x17,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 562:	b8 18 00 00 00       	mov    $0x18,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 56a:	b8 19 00 00 00       	mov    $0x19,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 572:	b8 1a 00 00 00       	mov    $0x1a,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 57a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <kthread_join>:
SYSCALL(kthread_join)
 582:	b8 1c 00 00 00       	mov    $0x1c,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <kthread_exit>:
SYSCALL(kthread_exit)
 58a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 592:	b8 1e 00 00 00       	mov    $0x1e,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <kthread_yield>:
SYSCALL(kthread_yield)
 59a:	b8 1f 00 00 00       	mov    $0x1f,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 5a2:	b8 20 00 00 00       	mov    $0x20,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 5aa:	b8 21 00 00 00       	mov    $0x21,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    
 5b2:	66 90                	xchg   %ax,%ax
 5b4:	66 90                	xchg   %ax,%ax
 5b6:	66 90                	xchg   %ax,%ax
 5b8:	66 90                	xchg   %ax,%ax
 5ba:	66 90                	xchg   %ax,%ax
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	89 c6                	mov    %eax,%esi
 5c7:	53                   	push   %ebx
 5c8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ce:	85 db                	test   %ebx,%ebx
 5d0:	74 09                	je     5db <printint+0x1b>
 5d2:	89 d0                	mov    %edx,%eax
 5d4:	c1 e8 1f             	shr    $0x1f,%eax
 5d7:	84 c0                	test   %al,%al
 5d9:	75 75                	jne    650 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5db:	89 d0                	mov    %edx,%eax
  neg = 0;
 5dd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5e4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 5e7:	31 ff                	xor    %edi,%edi
 5e9:	89 ce                	mov    %ecx,%esi
 5eb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 5ee:	eb 02                	jmp    5f2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 5f0:	89 cf                	mov    %ecx,%edi
 5f2:	31 d2                	xor    %edx,%edx
 5f4:	f7 f6                	div    %esi
 5f6:	8d 4f 01             	lea    0x1(%edi),%ecx
 5f9:	0f b6 92 9a 0c 00 00 	movzbl 0xc9a(%edx),%edx
  }while((x /= base) != 0);
 600:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 602:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 605:	75 e9                	jne    5f0 <printint+0x30>
  if(neg)
 607:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 60a:	89 c8                	mov    %ecx,%eax
 60c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 60f:	85 d2                	test   %edx,%edx
 611:	74 08                	je     61b <printint+0x5b>
    buf[i++] = '-';
 613:	8d 4f 02             	lea    0x2(%edi),%ecx
 616:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 61b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 61e:	66 90                	xchg   %ax,%ax
 620:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 625:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 628:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 62f:	00 
 630:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 634:	89 34 24             	mov    %esi,(%esp)
 637:	88 45 d7             	mov    %al,-0x29(%ebp)
 63a:	e8 93 fe ff ff       	call   4d2 <write>
  while(--i >= 0)
 63f:	83 ff ff             	cmp    $0xffffffff,%edi
 642:	75 dc                	jne    620 <printint+0x60>
    putc(fd, buf[i]);
}
 644:	83 c4 4c             	add    $0x4c,%esp
 647:	5b                   	pop    %ebx
 648:	5e                   	pop    %esi
 649:	5f                   	pop    %edi
 64a:	5d                   	pop    %ebp
 64b:	c3                   	ret    
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 650:	89 d0                	mov    %edx,%eax
 652:	f7 d8                	neg    %eax
    neg = 1;
 654:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 65b:	eb 87                	jmp    5e4 <printint+0x24>
 65d:	8d 76 00             	lea    0x0(%esi),%esi

00000660 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 664:	31 ff                	xor    %edi,%edi
{
 666:	56                   	push   %esi
 667:	53                   	push   %ebx
 668:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 66b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 66e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 671:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 674:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 677:	0f b6 13             	movzbl (%ebx),%edx
 67a:	83 c3 01             	add    $0x1,%ebx
 67d:	84 d2                	test   %dl,%dl
 67f:	75 39                	jne    6ba <printf+0x5a>
 681:	e9 ca 00 00 00       	jmp    750 <printf+0xf0>
 686:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 688:	83 fa 25             	cmp    $0x25,%edx
 68b:	0f 84 c7 00 00 00    	je     758 <printf+0xf8>
  write(fd, &c, 1);
 691:	8d 45 e0             	lea    -0x20(%ebp),%eax
 694:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 69b:	00 
 69c:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 6a3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 6a6:	e8 27 fe ff ff       	call   4d2 <write>
 6ab:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 6ae:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 6b2:	84 d2                	test   %dl,%dl
 6b4:	0f 84 96 00 00 00    	je     750 <printf+0xf0>
    if(state == 0){
 6ba:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 6bc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 6bf:	74 c7                	je     688 <printf+0x28>
      }
    } else if(state == '%'){
 6c1:	83 ff 25             	cmp    $0x25,%edi
 6c4:	75 e5                	jne    6ab <printf+0x4b>
      if(c == 'd' || c == 'u'){
 6c6:	83 fa 75             	cmp    $0x75,%edx
 6c9:	0f 84 99 00 00 00    	je     768 <printf+0x108>
 6cf:	83 fa 64             	cmp    $0x64,%edx
 6d2:	0f 84 90 00 00 00    	je     768 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6d8:	25 f7 00 00 00       	and    $0xf7,%eax
 6dd:	83 f8 70             	cmp    $0x70,%eax
 6e0:	0f 84 aa 00 00 00    	je     790 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6e6:	83 fa 73             	cmp    $0x73,%edx
 6e9:	0f 84 e9 00 00 00    	je     7d8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ef:	83 fa 63             	cmp    $0x63,%edx
 6f2:	0f 84 2b 01 00 00    	je     823 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6f8:	83 fa 25             	cmp    $0x25,%edx
 6fb:	0f 84 4f 01 00 00    	je     850 <printf+0x1f0>
  write(fd, &c, 1);
 701:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 704:	83 c3 01             	add    $0x1,%ebx
 707:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 70e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 70f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 711:	89 44 24 04          	mov    %eax,0x4(%esp)
 715:	89 34 24             	mov    %esi,(%esp)
 718:	89 55 d0             	mov    %edx,-0x30(%ebp)
 71b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 71f:	e8 ae fd ff ff       	call   4d2 <write>
        putc(fd, c);
 724:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 727:	8d 45 e7             	lea    -0x19(%ebp),%eax
 72a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 731:	00 
 732:	89 44 24 04          	mov    %eax,0x4(%esp)
 736:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 739:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 73c:	e8 91 fd ff ff       	call   4d2 <write>
  for(i = 0; fmt[i]; i++){
 741:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 745:	84 d2                	test   %dl,%dl
 747:	0f 85 6d ff ff ff    	jne    6ba <printf+0x5a>
 74d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 750:	83 c4 3c             	add    $0x3c,%esp
 753:	5b                   	pop    %ebx
 754:	5e                   	pop    %esi
 755:	5f                   	pop    %edi
 756:	5d                   	pop    %ebp
 757:	c3                   	ret    
        state = '%';
 758:	bf 25 00 00 00       	mov    $0x25,%edi
 75d:	e9 49 ff ff ff       	jmp    6ab <printf+0x4b>
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 768:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 76f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 774:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 777:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 779:	8b 10                	mov    (%eax),%edx
 77b:	89 f0                	mov    %esi,%eax
 77d:	e8 3e fe ff ff       	call   5c0 <printint>
        ap++;
 782:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 786:	e9 20 ff ff ff       	jmp    6ab <printf+0x4b>
 78b:	90                   	nop
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 790:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 793:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 79a:	00 
 79b:	89 44 24 04          	mov    %eax,0x4(%esp)
 79f:	89 34 24             	mov    %esi,(%esp)
 7a2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 7a6:	e8 27 fd ff ff       	call   4d2 <write>
 7ab:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 7ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7b5:	00 
 7b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ba:	89 34 24             	mov    %esi,(%esp)
 7bd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 7c1:	e8 0c fd ff ff       	call   4d2 <write>
        printint(fd, *ap, 16, 0);
 7c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 7cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 7d2:	eb a0                	jmp    774 <printf+0x114>
 7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 7db:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 7df:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 7e1:	b8 93 0c 00 00       	mov    $0xc93,%eax
 7e6:	85 ff                	test   %edi,%edi
 7e8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 7eb:	0f b6 07             	movzbl (%edi),%eax
 7ee:	84 c0                	test   %al,%al
 7f0:	74 2a                	je     81c <printf+0x1bc>
 7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7f8:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 7fb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 7fe:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 801:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 808:	00 
 809:	89 44 24 04          	mov    %eax,0x4(%esp)
 80d:	89 34 24             	mov    %esi,(%esp)
 810:	e8 bd fc ff ff       	call   4d2 <write>
        while(*s != 0){
 815:	0f b6 07             	movzbl (%edi),%eax
 818:	84 c0                	test   %al,%al
 81a:	75 dc                	jne    7f8 <printf+0x198>
      state = 0;
 81c:	31 ff                	xor    %edi,%edi
 81e:	e9 88 fe ff ff       	jmp    6ab <printf+0x4b>
        putc(fd, *ap);
 823:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 826:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 828:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 82a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 831:	00 
 832:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 835:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 838:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 83b:	89 44 24 04          	mov    %eax,0x4(%esp)
 83f:	e8 8e fc ff ff       	call   4d2 <write>
        ap++;
 844:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 848:	e9 5e fe ff ff       	jmp    6ab <printf+0x4b>
 84d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 850:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 853:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 855:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 85c:	00 
 85d:	89 44 24 04          	mov    %eax,0x4(%esp)
 861:	89 34 24             	mov    %esi,(%esp)
 864:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 868:	e8 65 fc ff ff       	call   4d2 <write>
 86d:	e9 39 fe ff ff       	jmp    6ab <printf+0x4b>
 872:	66 90                	xchg   %ax,%ax
 874:	66 90                	xchg   %ax,%ax
 876:	66 90                	xchg   %ax,%ax
 878:	66 90                	xchg   %ax,%ax
 87a:	66 90                	xchg   %ax,%ax
 87c:	66 90                	xchg   %ax,%ax
 87e:	66 90                	xchg   %ax,%ax

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 881:	a1 50 12 00 00       	mov    0x1250,%eax
{
 886:	89 e5                	mov    %esp,%ebp
 888:	57                   	push   %edi
 889:	56                   	push   %esi
 88a:	53                   	push   %ebx
 88b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 88e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 890:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 893:	39 d0                	cmp    %edx,%eax
 895:	72 11                	jb     8a8 <free+0x28>
 897:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 898:	39 c8                	cmp    %ecx,%eax
 89a:	72 04                	jb     8a0 <free+0x20>
 89c:	39 ca                	cmp    %ecx,%edx
 89e:	72 10                	jb     8b0 <free+0x30>
 8a0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a6:	73 f0                	jae    898 <free+0x18>
 8a8:	39 ca                	cmp    %ecx,%edx
 8aa:	72 04                	jb     8b0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ac:	39 c8                	cmp    %ecx,%eax
 8ae:	72 f0                	jb     8a0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 8b6:	39 cf                	cmp    %ecx,%edi
 8b8:	74 1e                	je     8d8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8ba:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8bd:	8b 48 04             	mov    0x4(%eax),%ecx
 8c0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 8c3:	39 f2                	cmp    %esi,%edx
 8c5:	74 28                	je     8ef <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8c7:	89 10                	mov    %edx,(%eax)
  freep = p;
 8c9:	a3 50 12 00 00       	mov    %eax,0x1250
}
 8ce:	5b                   	pop    %ebx
 8cf:	5e                   	pop    %esi
 8d0:	5f                   	pop    %edi
 8d1:	5d                   	pop    %ebp
 8d2:	c3                   	ret    
 8d3:	90                   	nop
 8d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8d8:	03 71 04             	add    0x4(%ecx),%esi
 8db:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8de:	8b 08                	mov    (%eax),%ecx
 8e0:	8b 09                	mov    (%ecx),%ecx
 8e2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8e5:	8b 48 04             	mov    0x4(%eax),%ecx
 8e8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 8eb:	39 f2                	cmp    %esi,%edx
 8ed:	75 d8                	jne    8c7 <free+0x47>
    p->s.size += bp->s.size;
 8ef:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 8f2:	a3 50 12 00 00       	mov    %eax,0x1250
    p->s.size += bp->s.size;
 8f7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8fa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8fd:	89 10                	mov    %edx,(%eax)
}
 8ff:	5b                   	pop    %ebx
 900:	5e                   	pop    %esi
 901:	5f                   	pop    %edi
 902:	5d                   	pop    %ebp
 903:	c3                   	ret    
 904:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 90a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000910 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	57                   	push   %edi
 914:	56                   	push   %esi
 915:	53                   	push   %ebx
 916:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 919:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 91c:	8b 1d 50 12 00 00    	mov    0x1250,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 922:	8d 48 07             	lea    0x7(%eax),%ecx
 925:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 928:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 92a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 92d:	0f 84 9b 00 00 00    	je     9ce <malloc+0xbe>
 933:	8b 13                	mov    (%ebx),%edx
 935:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 938:	39 fe                	cmp    %edi,%esi
 93a:	76 64                	jbe    9a0 <malloc+0x90>
 93c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 943:	bb 00 80 00 00       	mov    $0x8000,%ebx
 948:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 94b:	eb 0e                	jmp    95b <malloc+0x4b>
 94d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 950:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 952:	8b 78 04             	mov    0x4(%eax),%edi
 955:	39 fe                	cmp    %edi,%esi
 957:	76 4f                	jbe    9a8 <malloc+0x98>
 959:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 95b:	3b 15 50 12 00 00    	cmp    0x1250,%edx
 961:	75 ed                	jne    950 <malloc+0x40>
  if(nu < 4096)
 963:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 966:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 96c:	bf 00 10 00 00       	mov    $0x1000,%edi
 971:	0f 43 fe             	cmovae %esi,%edi
 974:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 977:	89 04 24             	mov    %eax,(%esp)
 97a:	e8 bb fb ff ff       	call   53a <sbrk>
  if(p == (char*)-1)
 97f:	83 f8 ff             	cmp    $0xffffffff,%eax
 982:	74 18                	je     99c <malloc+0x8c>
  hp->s.size = nu;
 984:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 987:	83 c0 08             	add    $0x8,%eax
 98a:	89 04 24             	mov    %eax,(%esp)
 98d:	e8 ee fe ff ff       	call   880 <free>
  return freep;
 992:	8b 15 50 12 00 00    	mov    0x1250,%edx
      if((p = morecore(nunits)) == 0)
 998:	85 d2                	test   %edx,%edx
 99a:	75 b4                	jne    950 <malloc+0x40>
        return 0;
 99c:	31 c0                	xor    %eax,%eax
 99e:	eb 20                	jmp    9c0 <malloc+0xb0>
    if(p->s.size >= nunits){
 9a0:	89 d0                	mov    %edx,%eax
 9a2:	89 da                	mov    %ebx,%edx
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 9a8:	39 fe                	cmp    %edi,%esi
 9aa:	74 1c                	je     9c8 <malloc+0xb8>
        p->s.size -= nunits;
 9ac:	29 f7                	sub    %esi,%edi
 9ae:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 9b1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 9b4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9b7:	89 15 50 12 00 00    	mov    %edx,0x1250
      return (void*)(p + 1);
 9bd:	83 c0 08             	add    $0x8,%eax
  }
}
 9c0:	83 c4 1c             	add    $0x1c,%esp
 9c3:	5b                   	pop    %ebx
 9c4:	5e                   	pop    %esi
 9c5:	5f                   	pop    %edi
 9c6:	5d                   	pop    %ebp
 9c7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9c8:	8b 08                	mov    (%eax),%ecx
 9ca:	89 0a                	mov    %ecx,(%edx)
 9cc:	eb e9                	jmp    9b7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 9ce:	c7 05 50 12 00 00 54 	movl   $0x1254,0x1250
 9d5:	12 00 00 
    base.s.size = 0;
 9d8:	ba 54 12 00 00       	mov    $0x1254,%edx
    base.s.ptr = freep = prevp = &base;
 9dd:	c7 05 54 12 00 00 54 	movl   $0x1254,0x1254
 9e4:	12 00 00 
    base.s.size = 0;
 9e7:	c7 05 58 12 00 00 00 	movl   $0x0,0x1258
 9ee:	00 00 00 
 9f1:	e9 46 ff ff ff       	jmp    93c <malloc+0x2c>
 9f6:	66 90                	xchg   %ax,%ax
 9f8:	66 90                	xchg   %ax,%ax
 9fa:	66 90                	xchg   %ax,%ax
 9fc:	66 90                	xchg   %ax,%ax
 9fe:	66 90                	xchg   %ax,%ax

00000a00 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	56                   	push   %esi
 a04:	53                   	push   %ebx
 a05:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 a08:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 a0f:	e8 fc fe ff ff       	call   910 <malloc>

    if (bt == NULL) {
 a14:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 a16:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 a18:	74 66                	je     a80 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 a1a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 a21:	e8 ea fe ff ff       	call   910 <malloc>
    if (bt->bt_stack == NULL) {
 a26:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 a28:	89 c3                	mov    %eax,%ebx
 a2a:	89 46 08             	mov    %eax,0x8(%esi)
 a2d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 a30:	74 5d                	je     a8f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 a32:	25 ff 0f 00 00       	and    $0xfff,%eax
 a37:	75 37                	jne    a70 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 a39:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 a3f:	8b 45 10             	mov    0x10(%ebp),%eax
 a42:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 a46:	89 44 24 04          	mov    %eax,0x4(%esp)
 a4a:	8b 45 0c             	mov    0xc(%ebp),%eax
 a4d:	89 04 24             	mov    %eax,(%esp)
 a50:	e8 25 fb ff ff       	call   57a <kthread_create>
    if (bt->bid != 0) {
 a55:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 a57:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 a59:	74 2d                	je     a88 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 a5b:	8b 45 08             	mov    0x8(%ebp),%eax
 a5e:	89 30                	mov    %esi,(%eax)
        result = 0;
 a60:	31 c0                	xor    %eax,%eax
}
 a62:	83 c4 10             	add    $0x10,%esp
 a65:	5b                   	pop    %ebx
 a66:	5e                   	pop    %esi
 a67:	5d                   	pop    %ebp
 a68:	c3                   	ret    
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 a70:	29 c3                	sub    %eax,%ebx
 a72:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 a78:	89 5e 04             	mov    %ebx,0x4(%esi)
 a7b:	eb bc                	jmp    a39 <benny_thread_create+0x39>
 a7d:	8d 76 00             	lea    0x0(%esi),%esi
 a80:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 a86:	eb b7                	jmp    a3f <benny_thread_create+0x3f>
    int result = -1;
 a88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 a8d:	eb d3                	jmp    a62 <benny_thread_create+0x62>
        free(bt);
 a8f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 a92:	31 f6                	xor    %esi,%esi
        free(bt);
 a94:	e8 e7 fd ff ff       	call   880 <free>
 a99:	8b 5b 04             	mov    0x4(%ebx),%ebx
 a9c:	eb a1                	jmp    a3f <benny_thread_create+0x3f>
 a9e:	66 90                	xchg   %ax,%ax

00000aa0 <benny_thread_bid>:
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 aa3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 aa6:	5d                   	pop    %ebp
    return bt->bid;
 aa7:	8b 00                	mov    (%eax),%eax
}
 aa9:	c3                   	ret    
 aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ab0 <benny_thread_join>:
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	53                   	push   %ebx
 ab4:	83 ec 14             	sub    $0x14,%esp
 ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 aba:	8b 03                	mov    (%ebx),%eax
 abc:	89 04 24             	mov    %eax,(%esp)
 abf:	e8 be fa ff ff       	call   582 <kthread_join>
    if (retVal == 0) {
 ac4:	85 c0                	test   %eax,%eax
 ac6:	75 27                	jne    aef <benny_thread_join+0x3f>
        free(bt->mem_stack);
 ac8:	8b 53 08             	mov    0x8(%ebx),%edx
 acb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ace:	89 14 24             	mov    %edx,(%esp)
 ad1:	e8 aa fd ff ff       	call   880 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 ad6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 add:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 ae4:	89 1c 24             	mov    %ebx,(%esp)
 ae7:	e8 94 fd ff ff       	call   880 <free>
 aec:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 aef:	83 c4 14             	add    $0x14,%esp
 af2:	5b                   	pop    %ebx
 af3:	5d                   	pop    %ebp
 af4:	c3                   	ret    
 af5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b00 <benny_thread_exit>:
{
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
}
 b03:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 b04:	e9 81 fa ff ff       	jmp    58a <kthread_exit>
 b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b10 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 b10:	55                   	push   %ebp
 b11:	89 e5                	mov    %esp,%ebp
 b13:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 b16:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 b1c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 b23:	31 c0                	xor    %eax,%eax
 b25:	5d                   	pop    %ebp
 b26:	c3                   	ret    
 b27:	89 f6                	mov    %esi,%esi
 b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b30 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 b30:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b31:	b8 01 00 00 00       	mov    $0x1,%eax
 b36:	89 e5                	mov    %esp,%ebp
 b38:	56                   	push   %esi
 b39:	53                   	push   %ebx
 b3a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b3d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 b40:	85 c0                	test   %eax,%eax
 b42:	be 01 00 00 00       	mov    $0x1,%esi
 b47:	74 15                	je     b5e <benny_mootex_yieldlock+0x2e>
 b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 b50:	e8 45 fa ff ff       	call   59a <kthread_yield>
 b55:	89 f0                	mov    %esi,%eax
 b57:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 b5a:	85 c0                	test   %eax,%eax
 b5c:	75 f2                	jne    b50 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 b5e:	e8 2f fa ff ff       	call   592 <kthread_self>
    benny_mootex->bid = benny_self();
 b63:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b66:	31 c0                	xor    %eax,%eax
 b68:	5b                   	pop    %ebx
 b69:	5e                   	pop    %esi
 b6a:	5d                   	pop    %ebp
 b6b:	c3                   	ret    
 b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b70 <benny_mootex_spinlock>:
{
 b70:	55                   	push   %ebp
 b71:	ba 01 00 00 00       	mov    $0x1,%edx
 b76:	89 e5                	mov    %esp,%ebp
 b78:	53                   	push   %ebx
 b79:	83 ec 04             	sub    $0x4,%esp
 b7c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 b7f:	90                   	nop
 b80:	89 d0                	mov    %edx,%eax
 b82:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 b85:	85 c0                	test   %eax,%eax
 b87:	75 f7                	jne    b80 <benny_mootex_spinlock+0x10>
    return kthread_self();
 b89:	e8 04 fa ff ff       	call   592 <kthread_self>
    benny_mootex->bid = benny_self();
 b8e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 b91:	83 c4 04             	add    $0x4,%esp
 b94:	31 c0                	xor    %eax,%eax
 b96:	5b                   	pop    %ebx
 b97:	5d                   	pop    %ebp
 b98:	c3                   	ret    
 b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <benny_mootex_unlock>:
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	53                   	push   %ebx
 ba4:	83 ec 04             	sub    $0x4,%esp
 ba7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 baa:	e8 e3 f9 ff ff       	call   592 <kthread_self>
    if(tid == benny_mootex->bid){
 baf:	39 43 04             	cmp    %eax,0x4(%ebx)
 bb2:	75 1c                	jne    bd0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 bb4:	0f ae f0             	mfence 
    return 0;
 bb7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 bb9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 bc0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 bc6:	83 c4 04             	add    $0x4,%esp
 bc9:	5b                   	pop    %ebx
 bca:	5d                   	pop    %ebp
 bcb:	c3                   	ret    
 bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bd0:	83 c4 04             	add    $0x4,%esp
      return -1;
 bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 bd8:	5b                   	pop    %ebx
 bd9:	5d                   	pop    %ebp
 bda:	c3                   	ret    
 bdb:	90                   	nop
 bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000be0 <benny_mootex_trylock>:
{
 be0:	55                   	push   %ebp
 be1:	b8 01 00 00 00       	mov    $0x1,%eax
 be6:	89 e5                	mov    %esp,%ebp
 be8:	53                   	push   %ebx
 be9:	83 ec 04             	sub    $0x4,%esp
 bec:	8b 5d 08             	mov    0x8(%ebp),%ebx
 bef:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 bf2:	85 c0                	test   %eax,%eax
 bf4:	75 08                	jne    bfe <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 bf6:	e8 97 f9 ff ff       	call   592 <kthread_self>
        benny_mootex->bid = tid;
 bfb:	89 43 04             	mov    %eax,0x4(%ebx)
}
 bfe:	83 c4 04             	add    $0x4,%esp
 c01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c06:	5b                   	pop    %ebx
 c07:	5d                   	pop    %ebp
 c08:	c3                   	ret    
 c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c10 <benny_mootex_wholock>:
{
 c10:	55                   	push   %ebp
 c11:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 c13:	8b 45 08             	mov    0x8(%ebp),%eax
}
 c16:	5d                   	pop    %ebp
    return benny_mootex->bid;
 c17:	8b 40 04             	mov    0x4(%eax),%eax
}
 c1a:	c3                   	ret    
 c1b:	90                   	nop
 c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c20 <benny_mootex_islocked>:
{
 c20:	55                   	push   %ebp
 c21:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 c23:	8b 45 08             	mov    0x8(%ebp),%eax
}
 c26:	5d                   	pop    %ebp
    return benny_mootex->locked;
 c27:	8b 00                	mov    (%eax),%eax
}
 c29:	c3                   	ret    
 c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c30 <benny_self>:
{
 c30:	55                   	push   %ebp
 c31:	89 e5                	mov    %esp,%ebp
}
 c33:	5d                   	pop    %ebp
    return kthread_self();
 c34:	e9 59 f9 ff ff       	jmp    592 <kthread_self>
 c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c40 <benny_yield>:
{
 c40:	55                   	push   %ebp
 c41:	89 e5                	mov    %esp,%ebp
    
}
 c43:	5d                   	pop    %ebp
    return kthread_yield();
 c44:	e9 51 f9 ff ff       	jmp    59a <kthread_yield>
 c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c50 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 c50:	55                   	push   %ebp
 c51:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 c53:	5d                   	pop    %ebp
    return kthread_cpu_count();
 c54:	e9 49 f9 ff ff       	jmp    5a2 <kthread_cpu_count>
 c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c60 <benny_thread_count>:

int
benny_thread_count(void)
{
 c60:	55                   	push   %ebp
 c61:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 c63:	5d                   	pop    %ebp
    return kthread_thread_count();
 c64:	e9 41 f9 ff ff       	jmp    5aa <kthread_thread_count>
