
_thtst3:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}
#endif // KTHREADS

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 70             	sub    $0x70,%esp
    next = seed;
   c:	c7 05 7c 15 00 00 03 	movl   $0x3,0x157c
  13:	00 00 00 
    int pid = -1;

    // 3 really is a good number
    mysrand(3);

    pid = fork();
  16:	e8 9f 07 00 00       	call   7ba <fork>
    if (pid == 0) {
  1b:	85 c0                	test   %eax,%eax
  1d:	0f 85 11 02 00 00    	jne    234 <main+0x234>
        lmatrix = malloc(sizeof(matrix_t));
  23:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  2a:	e8 f1 0b 00 00       	call   c20 <malloc>
        rmatrix = malloc(sizeof(matrix_t));
  2f:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
        lmatrix = malloc(sizeof(matrix_t));
  36:	a3 88 15 00 00       	mov    %eax,0x1588
        rmatrix = malloc(sizeof(matrix_t));
  3b:	e8 e0 0b 00 00       	call   c20 <malloc>
        omatrix = malloc(sizeof(matrix_t));
  40:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
        rmatrix = malloc(sizeof(matrix_t));
  47:	a3 84 15 00 00       	mov    %eax,0x1584
        omatrix = malloc(sizeof(matrix_t));
  4c:	e8 cf 0b 00 00       	call   c20 <malloc>

        if (argc > 1) {
  51:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
        omatrix = malloc(sizeof(matrix_t));
  55:	a3 8c 15 00 00       	mov    %eax,0x158c
        if (argc > 1) {
  5a:	7e 1f                	jle    7b <main+0x7b>
            numThreads = atoi(argv[1]);
  5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  5f:	8b 40 04             	mov    0x4(%eax),%eax
  62:	89 04 24             	mov    %eax,(%esp)
  65:	e8 f6 06 00 00       	call   760 <atoi>
  6a:	a3 80 15 00 00       	mov    %eax,0x1580
            if (numThreads < 1 || numThreads > MAX_THREADS) {
  6f:	83 e8 01             	sub    $0x1,%eax
  72:	83 f8 13             	cmp    $0x13,%eax
  75:	0f 87 be 01 00 00    	ja     239 <main+0x239>
                printf(1, "bad thread count - using %d\n", DEFAULT_NUM_THREADS);
                numThreads = DEFAULT_NUM_THREADS;
            }
        }
        printf(1, "num threads %d\n", numThreads);
  7b:	a1 80 15 00 00       	mov    0x1580,%eax
  80:	c7 44 24 04 99 0f 00 	movl   $0xf99,0x4(%esp)
  87:	00 
  88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8f:	89 44 24 08          	mov    %eax,0x8(%esp)
  93:	e8 d8 08 00 00       	call   970 <printf>
        if (numThreads < 1 || numThreads > MAX_THREADS) {
  98:	a1 80 15 00 00       	mov    0x1580,%eax
  9d:	83 e8 01             	sub    $0x1,%eax
  a0:	83 f8 13             	cmp    $0x13,%eax
  a3:	76 19                	jbe    be <main+0xbe>
            printf(2, "Bad thread count\n");
  a5:	c7 44 24 04 a9 0f 00 	movl   $0xfa9,0x4(%esp)
  ac:	00 
  ad:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  b4:	e8 b7 08 00 00       	call   970 <printf>
            exit();
  b9:	e8 04 07 00 00       	call   7c2 <exit>

        long tcount = 0;
        // I'm trying to keep some presure off of malloc()
        benny_thread_t wthreads[MAX_THREADS];

        gen_data(lmatrix);
  be:	a1 88 15 00 00       	mov    0x1588,%eax
  c3:	e8 98 02 00 00       	call   360 <gen_data>
        gen_data(rmatrix);
  c8:	a1 84 15 00 00       	mov    0x1584,%eax
  cd:	e8 8e 02 00 00       	call   360 <gen_data>

        printf(1, "%s %d: %d\n", __FILE__, __LINE__, numThreads);
  d2:	a1 80 15 00 00       	mov    0x1580,%eax
  d7:	c7 44 24 0c 67 00 00 	movl   $0x67,0xc(%esp)
  de:	00 
  df:	c7 44 24 08 bb 0f 00 	movl   $0xfbb,0x8(%esp)
  e6:	00 
  e7:	c7 44 24 04 c4 0f 00 	movl   $0xfc4,0x4(%esp)
  ee:	00 
  ef:	89 44 24 10          	mov    %eax,0x10(%esp)
  f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fa:	e8 71 08 00 00       	call   970 <printf>
        omatrix->rows = lmatrix->rows;
  ff:	a1 88 15 00 00       	mov    0x1588,%eax
 104:	8b 1d 8c 15 00 00    	mov    0x158c,%ebx
        omatrix->cols = rmatrix->cols;
 10a:	8b 15 84 15 00 00    	mov    0x1584,%edx
        omatrix->rows = lmatrix->rows;
 110:	8b 00                	mov    (%eax),%eax
 112:	89 03                	mov    %eax,(%ebx)
        omatrix->cols = rmatrix->cols;
 114:	8b 52 04             	mov    0x4(%edx),%edx
        omatrix->data = malloc(omatrix->rows * sizeof(MATRIX_TYPE *));
 117:	c1 e0 02             	shl    $0x2,%eax
        omatrix->cols = rmatrix->cols;
 11a:	89 53 04             	mov    %edx,0x4(%ebx)
        omatrix->data = malloc(omatrix->rows * sizeof(MATRIX_TYPE *));
 11d:	89 04 24             	mov    %eax,(%esp)
 120:	e8 fb 0a 00 00       	call   c20 <malloc>

        //kdebug(2);
        if (lmatrix->cols == rmatrix->rows) {
 125:	8b 15 88 15 00 00    	mov    0x1588,%edx
        omatrix->data = malloc(omatrix->rows * sizeof(MATRIX_TYPE *));
 12b:	89 43 08             	mov    %eax,0x8(%ebx)
        if (lmatrix->cols == rmatrix->rows) {
 12e:	a1 84 15 00 00       	mov    0x1584,%eax
 133:	8b 00                	mov    (%eax),%eax
 135:	39 42 04             	cmp    %eax,0x4(%edx)
 138:	0f 84 26 01 00 00    	je     264 <main+0x264>
                       , benny_thread_bid(wthreads[tcount]), tcount);
                benny_thread_join(wthreads[tcount]);
            }
        }
        else {
            printf(2, "*** the left matrix must have the "
 13e:	c7 44 24 04 08 10 00 	movl   $0x1008,0x4(%esp)
 145:	00 
 146:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 14d:	e8 1e 08 00 00       	call   970 <printf>
                    "same number of colums as the right matrix has rows ***\n");
        }

        // its the output that takes most of the time
        output_matrix(omatrix, "op.txt");
 152:	8b 3d 8c 15 00 00    	mov    0x158c,%edi
{
    int file = 1;
    uint row = 0;
    uint col = 0;

    if (NULL != matrix) {
 158:	85 ff                	test   %edi,%edi
 15a:	0f 84 b6 00 00 00    	je     216 <main+0x216>
        // always goes into the same file name
        file = open(fname, O_CREATE | O_RDWR);
 160:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
 167:	00 
 168:	c7 04 24 fc 0f 00 00 	movl   $0xffc,(%esp)
 16f:	e8 8e 06 00 00       	call   802 <open>
 174:	89 c3                	mov    %eax,%ebx

        printf(file,  "%d %d\n", matrix->rows, matrix->cols);
 176:	8b 47 04             	mov    0x4(%edi),%eax
 179:	89 44 24 0c          	mov    %eax,0xc(%esp)
 17d:	8b 07                	mov    (%edi),%eax
 17f:	c7 44 24 04 e0 0f 00 	movl   $0xfe0,0x4(%esp)
 186:	00 
 187:	89 1c 24             	mov    %ebx,(%esp)
 18a:	89 44 24 08          	mov    %eax,0x8(%esp)
 18e:	e8 dd 07 00 00       	call   970 <printf>
        for (row = 0; row < matrix->rows; row++) {
 193:	83 3f 00             	cmpl   $0x0,(%edi)
 196:	74 66                	je     1fe <main+0x1fe>
 198:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
 19f:	00 
            for (col = 0; col < matrix->cols; col++) {
 1a0:	8b 47 04             	mov    0x4(%edi),%eax
 1a3:	85 c0                	test   %eax,%eax
 1a5:	74 3a                	je     1e1 <main+0x1e1>
 1a7:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ab:	31 f6                	xor    %esi,%esi
 1ad:	c1 e0 02             	shl    $0x2,%eax
 1b0:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 1b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                printf(file, "%d ", matrix->data[row][col]);
 1b8:	8b 4f 08             	mov    0x8(%edi),%ecx
 1bb:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1bf:	8b 0c 01             	mov    (%ecx,%eax,1),%ecx
 1c2:	8b 0c b1             	mov    (%ecx,%esi,4),%ecx
            for (col = 0; col < matrix->cols; col++) {
 1c5:	83 c6 01             	add    $0x1,%esi
                printf(file, "%d ", matrix->data[row][col]);
 1c8:	c7 44 24 04 03 10 00 	movl   $0x1003,0x4(%esp)
 1cf:	00 
 1d0:	89 1c 24             	mov    %ebx,(%esp)
 1d3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 1d7:	e8 94 07 00 00       	call   970 <printf>
            for (col = 0; col < matrix->cols; col++) {
 1dc:	3b 77 04             	cmp    0x4(%edi),%esi
 1df:	72 d7                	jb     1b8 <main+0x1b8>
            }
            printf(file, "\n");
 1e1:	c7 44 24 04 cd 0f 00 	movl   $0xfcd,0x4(%esp)
 1e8:	00 
 1e9:	89 1c 24             	mov    %ebx,(%esp)
 1ec:	e8 7f 07 00 00       	call   970 <printf>
        for (row = 0; row < matrix->rows; row++) {
 1f1:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
 1f6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1fa:	3b 07                	cmp    (%edi),%eax
 1fc:	72 a2                	jb     1a0 <main+0x1a0>
        }
        printf(file, "\n");
 1fe:	c7 44 24 04 cd 0f 00 	movl   $0xfcd,0x4(%esp)
 205:	00 
 206:	89 1c 24             	mov    %ebx,(%esp)
 209:	e8 62 07 00 00       	call   970 <printf>

        close(file);
 20e:	89 1c 24             	mov    %ebx,(%esp)
 211:	e8 d4 05 00 00       	call   7ea <close>
        free_matrix(lmatrix);
 216:	a1 88 15 00 00       	mov    0x1588,%eax
 21b:	e8 30 02 00 00       	call   450 <free_matrix>
        free_matrix(rmatrix);
 220:	a1 84 15 00 00       	mov    0x1584,%eax
 225:	e8 26 02 00 00       	call   450 <free_matrix>
        free_matrix(omatrix);
 22a:	a1 8c 15 00 00       	mov    0x158c,%eax
 22f:	e8 1c 02 00 00       	call   450 <free_matrix>
                    exit();
 234:	e8 89 05 00 00       	call   7c2 <exit>
                printf(1, "bad thread count - using %d\n", DEFAULT_NUM_THREADS);
 239:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
 240:	00 
 241:	c7 44 24 04 7c 0f 00 	movl   $0xf7c,0x4(%esp)
 248:	00 
 249:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 250:	e8 1b 07 00 00       	call   970 <printf>
                numThreads = DEFAULT_NUM_THREADS;
 255:	c7 05 80 15 00 00 04 	movl   $0x4,0x1580
 25c:	00 00 00 
 25f:	e9 17 fe ff ff       	jmp    7b <main+0x7b>
            printf(1, "%s %d: %d\n", __FILE__, __LINE__, numThreads);
 264:	a1 80 15 00 00       	mov    0x1580,%eax
 269:	c7 44 24 0c 6e 00 00 	movl   $0x6e,0xc(%esp)
 270:	00 
 271:	c7 44 24 08 bb 0f 00 	movl   $0xfbb,0x8(%esp)
 278:	00 
 279:	c7 44 24 04 c4 0f 00 	movl   $0xfc4,0x4(%esp)
 280:	00 
 281:	89 44 24 10          	mov    %eax,0x10(%esp)
 285:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 28c:	e8 df 06 00 00       	call   970 <printf>
            for (tcount = 0; tcount < numThreads; tcount++) {
 291:	83 3d 80 15 00 00 00 	cmpl   $0x0,0x1580
 298:	0f 8e b4 fe ff ff    	jle    152 <main+0x152>
 29e:	8d 5c 24 20          	lea    0x20(%esp),%ebx
 2a2:	31 f6                	xor    %esi,%esi
 2a4:	eb 11                	jmp    2b7 <main+0x2b7>
 2a6:	66 90                	xchg   %ax,%ax
 2a8:	a1 80 15 00 00       	mov    0x1580,%eax
 2ad:	83 c6 01             	add    $0x1,%esi
 2b0:	83 c3 04             	add    $0x4,%ebx
 2b3:	39 f0                	cmp    %esi,%eax
 2b5:	7e 4d                	jle    304 <main+0x304>
                benny_thread_create(&(wthreads[tcount]), cal_rowThreadStep
 2b7:	89 74 24 08          	mov    %esi,0x8(%esp)
 2bb:	c7 44 24 04 a0 04 00 	movl   $0x4a0,0x4(%esp)
 2c2:	00 
 2c3:	89 1c 24             	mov    %ebx,(%esp)
 2c6:	e8 45 0a 00 00       	call   d10 <benny_thread_create>
                printf(1, "  created thread %d %d\n"
 2cb:	8b 03                	mov    (%ebx),%eax
 2cd:	89 04 24             	mov    %eax,(%esp)
 2d0:	e8 db 0a 00 00       	call   db0 <benny_thread_bid>
 2d5:	89 74 24 0c          	mov    %esi,0xc(%esp)
 2d9:	c7 44 24 04 cf 0f 00 	movl   $0xfcf,0x4(%esp)
 2e0:	00 
 2e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ec:	e8 7f 06 00 00       	call   970 <printf>
                if (benny_thread_bid(wthreads[tcount]) < 1) {
 2f1:	8b 03                	mov    (%ebx),%eax
 2f3:	89 04 24             	mov    %eax,(%esp)
 2f6:	e8 b5 0a 00 00       	call   db0 <benny_thread_bid>
 2fb:	85 c0                	test   %eax,%eax
 2fd:	7f a9                	jg     2a8 <main+0x2a8>
 2ff:	e9 30 ff ff ff       	jmp    234 <main+0x234>
            for (tcount = 0; tcount < numThreads; tcount++) {
 304:	85 c0                	test   %eax,%eax
 306:	0f 8e 46 fe ff ff    	jle    152 <main+0x152>
 30c:	31 db                	xor    %ebx,%ebx
 30e:	66 90                	xchg   %ax,%ax
                printf(1, "  join thread %d %d\n"
 310:	8b 44 9c 20          	mov    0x20(%esp,%ebx,4),%eax
 314:	89 04 24             	mov    %eax,(%esp)
 317:	e8 94 0a 00 00       	call   db0 <benny_thread_bid>
 31c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 320:	c7 44 24 04 e7 0f 00 	movl   $0xfe7,0x4(%esp)
 327:	00 
 328:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 32f:	89 44 24 08          	mov    %eax,0x8(%esp)
 333:	e8 38 06 00 00       	call   970 <printf>
                benny_thread_join(wthreads[tcount]);
 338:	8b 44 9c 20          	mov    0x20(%esp,%ebx,4),%eax
            for (tcount = 0; tcount < numThreads; tcount++) {
 33c:	83 c3 01             	add    $0x1,%ebx
                benny_thread_join(wthreads[tcount]);
 33f:	89 04 24             	mov    %eax,(%esp)
 342:	e8 79 0a 00 00       	call   dc0 <benny_thread_join>
            for (tcount = 0; tcount < numThreads; tcount++) {
 347:	39 1d 80 15 00 00    	cmp    %ebx,0x1580
 34d:	7f c1                	jg     310 <main+0x310>
 34f:	e9 fe fd ff ff       	jmp    152 <main+0x152>
 354:	66 90                	xchg   %ax,%ax
 356:	66 90                	xchg   %ax,%ax
 358:	66 90                	xchg   %ax,%ax
 35a:	66 90                	xchg   %ax,%ax
 35c:	66 90                	xchg   %ax,%ax
 35e:	66 90                	xchg   %ax,%ax

00000360 <gen_data>:
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	89 c7                	mov    %eax,%edi
 366:	56                   	push   %esi
 367:	53                   	push   %ebx
 368:	83 ec 2c             	sub    $0x2c,%esp
    matrix->rows = matrix->cols = MAX_MATRIX_SIZE;
 36b:	c7 40 04 1e 00 00 00 	movl   $0x1e,0x4(%eax)
 372:	c7 00 1e 00 00 00    	movl   $0x1e,(%eax)
        matrix->data = malloc(matrix->rows * sizeof(MATRIX_TYPE *));
 378:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
 37f:	e8 9c 08 00 00       	call   c20 <malloc>
        for (row = 0; row < matrix->rows; row++) {
 384:	8b 0f                	mov    (%edi),%ecx
 386:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 38d:	85 c9                	test   %ecx,%ecx
        matrix->data = malloc(matrix->rows * sizeof(MATRIX_TYPE *));
 38f:	89 47 08             	mov    %eax,0x8(%edi)
        for (row = 0; row < matrix->rows; row++) {
 392:	89 c3                	mov    %eax,%ebx
 394:	0f 84 ae 00 00 00    	je     448 <gen_data+0xe8>
 39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
 3a3:	c1 e0 02             	shl    $0x2,%eax
            matrix->data[row] = malloc(matrix->cols * sizeof(MATRIX_TYPE));
 3a6:	01 c3                	add    %eax,%ebx
 3a8:	89 45 dc             	mov    %eax,-0x24(%ebp)
 3ab:	8b 47 04             	mov    0x4(%edi),%eax
 3ae:	c1 e0 02             	shl    $0x2,%eax
 3b1:	89 04 24             	mov    %eax,(%esp)
 3b4:	e8 67 08 00 00       	call   c20 <malloc>
            for (col = 0; col < matrix->cols; col++) {
 3b9:	31 c9                	xor    %ecx,%ecx
            matrix->data[row] = malloc(matrix->cols * sizeof(MATRIX_TYPE));
 3bb:	89 03                	mov    %eax,(%ebx)
            for (col = 0; col < matrix->cols; col++) {
 3bd:	8b 57 04             	mov    0x4(%edi),%edx
 3c0:	a1 7c 15 00 00       	mov    0x157c,%eax
 3c5:	85 d2                	test   %edx,%edx
 3c7:	74 6c                	je     435 <gen_data+0xd5>
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    next = next * 1103515245 + 12345;
 3d0:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
 3d6:	05 39 30 00 00       	add    $0x3039,%eax
 3db:	89 c2                	mov    %eax,%edx
 3dd:	81 e2 00 00 01 00    	and    $0x10000,%edx
                neg = (myrand() % 2) == 0 ? 1 : -1;
 3e3:	83 fa 01             	cmp    $0x1,%edx
                matrix->data[row][col] = (myrand() % 100) * neg;
 3e6:	8b 55 dc             	mov    -0x24(%ebp),%edx
                neg = (myrand() % 2) == 0 ? 1 : -1;
 3e9:	19 db                	sbb    %ebx,%ebx
    next = next * 1103515245 + 12345;
 3eb:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
                neg = (myrand() % 2) == 0 ? 1 : -1;
 3f1:	83 e3 02             	and    $0x2,%ebx
 3f4:	83 eb 01             	sub    $0x1,%ebx
    next = next * 1103515245 + 12345;
 3f7:	05 39 30 00 00       	add    $0x3039,%eax
 3fc:	89 c6                	mov    %eax,%esi
 3fe:	89 45 e0             	mov    %eax,-0x20(%ebp)
                matrix->data[row][col] = (myrand() % 100) * neg;
 401:	8b 47 08             	mov    0x8(%edi),%eax
    return((unsigned) (next / DIVISOR) % MYRAND_MAX);
 404:	c1 ee 10             	shr    $0x10,%esi
                matrix->data[row][col] = (myrand() % 100) * neg;
 407:	8b 04 10             	mov    (%eax,%edx,1),%eax
 40a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 40d:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
 412:	f7 e6                	mul    %esi
 414:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 417:	c1 ea 05             	shr    $0x5,%edx
 41a:	6b d2 64             	imul   $0x64,%edx,%edx
 41d:	29 d6                	sub    %edx,%esi
 41f:	0f af de             	imul   %esi,%ebx
 422:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
            for (col = 0; col < matrix->cols; col++) {
 425:	83 c1 01             	add    $0x1,%ecx
 428:	8b 45 e0             	mov    -0x20(%ebp),%eax
 42b:	39 4f 04             	cmp    %ecx,0x4(%edi)
 42e:	77 a0                	ja     3d0 <gen_data+0x70>
 430:	a3 7c 15 00 00       	mov    %eax,0x157c
        for (row = 0; row < matrix->rows; row++) {
 435:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
 439:	8b 45 d8             	mov    -0x28(%ebp),%eax
 43c:	39 07                	cmp    %eax,(%edi)
 43e:	76 08                	jbe    448 <gen_data+0xe8>
 440:	8b 5f 08             	mov    0x8(%edi),%ebx
 443:	e9 58 ff ff ff       	jmp    3a0 <gen_data+0x40>
}
 448:	83 c4 2c             	add    $0x2c,%esp
 44b:	5b                   	pop    %ebx
 44c:	5e                   	pop    %esi
 44d:	5f                   	pop    %edi
 44e:	5d                   	pop    %ebp
 44f:	c3                   	ret    

00000450 <free_matrix>:
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	56                   	push   %esi
 454:	89 c6                	mov    %eax,%esi
 456:	53                   	push   %ebx
 457:	83 ec 10             	sub    $0x10,%esp
    if (matrix != NULL) {
 45a:	85 c0                	test   %eax,%eax
 45c:	74 32                	je     490 <free_matrix+0x40>
        for (row = 0; row < matrix->rows; row++) {
 45e:	8b 00                	mov    (%eax),%eax
 460:	31 db                	xor    %ebx,%ebx
 462:	85 c0                	test   %eax,%eax
 464:	74 17                	je     47d <free_matrix+0x2d>
 466:	66 90                	xchg   %ax,%ax
            free(matrix->data[row]);
 468:	8b 46 08             	mov    0x8(%esi),%eax
 46b:	8b 04 98             	mov    (%eax,%ebx,4),%eax
        for (row = 0; row < matrix->rows; row++) {
 46e:	83 c3 01             	add    $0x1,%ebx
            free(matrix->data[row]);
 471:	89 04 24             	mov    %eax,(%esp)
 474:	e8 17 07 00 00       	call   b90 <free>
        for (row = 0; row < matrix->rows; row++) {
 479:	39 1e                	cmp    %ebx,(%esi)
 47b:	77 eb                	ja     468 <free_matrix+0x18>
        free(matrix->data);
 47d:	8b 46 08             	mov    0x8(%esi),%eax
 480:	89 04 24             	mov    %eax,(%esp)
 483:	e8 08 07 00 00       	call   b90 <free>
        free(matrix);
 488:	89 34 24             	mov    %esi,(%esp)
 48b:	e8 00 07 00 00       	call   b90 <free>
}
 490:	83 c4 10             	add    $0x10,%esp
 493:	5b                   	pop    %ebx
 494:	5e                   	pop    %esi
 495:	5d                   	pop    %ebp
 496:	c3                   	ret    
 497:	89 f6                	mov    %esi,%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <cal_rowThreadStep>:
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
    for (row = tid; row < omatrix->rows; row += numThreads) {
 4a9:	8b 35 8c 15 00 00    	mov    0x158c,%esi
{
 4af:	8b 45 08             	mov    0x8(%ebp),%eax
    for (row = tid; row < omatrix->rows; row += numThreads) {
 4b2:	3b 06                	cmp    (%esi),%eax
{
 4b4:	89 45 c8             	mov    %eax,-0x38(%ebp)
    for (row = tid; row < omatrix->rows; row += numThreads) {
 4b7:	89 75 d0             	mov    %esi,-0x30(%ebp)
 4ba:	0f 83 c6 00 00 00    	jae    586 <cal_rowThreadStep+0xe6>
        calc_row(lmatrix, rmatrix, omatrix, row);
 4c0:	8b 1d 84 15 00 00    	mov    0x1584,%ebx
    omat->data[calc_row] = malloc(omat->cols * sizeof(MATRIX_TYPE));
 4c6:	c1 e0 02             	shl    $0x2,%eax
 4c9:	8b 4d d0             	mov    -0x30(%ebp),%ecx
 4cc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        calc_row(lmatrix, rmatrix, omatrix, row);
 4cf:	89 de                	mov    %ebx,%esi
 4d1:	89 5d d8             	mov    %ebx,-0x28(%ebp)
 4d4:	8b 1d 88 15 00 00    	mov    0x1588,%ebx
 4da:	89 5d cc             	mov    %ebx,-0x34(%ebp)
    omat->data[calc_row] = malloc(omat->cols * sizeof(MATRIX_TYPE));
 4dd:	8b 59 08             	mov    0x8(%ecx),%ebx
 4e0:	01 c3                	add    %eax,%ebx
 4e2:	8b 41 04             	mov    0x4(%ecx),%eax
 4e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4e8:	c1 e0 02             	shl    $0x2,%eax
 4eb:	89 04 24             	mov    %eax,(%esp)
 4ee:	e8 2d 07 00 00       	call   c20 <malloc>
 4f3:	89 03                	mov    %eax,(%ebx)
    for (rcol = 0; rcol < rmat->cols; rcol++) {
 4f5:	8b 46 04             	mov    0x4(%esi),%eax
 4f8:	85 c0                	test   %eax,%eax
 4fa:	74 6c                	je     568 <cal_rowThreadStep+0xc8>
 4fc:	31 db                	xor    %ebx,%ebx
 4fe:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 505:	8d 76 00             	lea    0x0(%esi),%esi
        for (lcol = 0; lcol < lmat->cols; lcol++) {
 508:	8b 75 cc             	mov    -0x34(%ebp),%esi
 50b:	8b 46 04             	mov    0x4(%esi),%eax
 50e:	85 c0                	test   %eax,%eax
 510:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 513:	0f 84 80 00 00 00    	je     599 <cal_rowThreadStep+0xf9>
 519:	8b 46 08             	mov    0x8(%esi),%eax
 51c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 51f:	8b 3c 08             	mov    (%eax,%ecx,1),%edi
 522:	31 c9                	xor    %ecx,%ecx
 524:	8b 45 d8             	mov    -0x28(%ebp),%eax
 527:	89 7d e0             	mov    %edi,-0x20(%ebp)
 52a:	8b 70 08             	mov    0x8(%eax),%esi
 52d:	31 c0                	xor    %eax,%eax
 52f:	90                   	nop
            sum += lmat->data[calc_row][lcol] * rmat->data[lcol][rcol];
 530:	8b 7d e0             	mov    -0x20(%ebp),%edi
 533:	8b 14 87             	mov    (%edi,%eax,4),%edx
 536:	8b 3c 86             	mov    (%esi,%eax,4),%edi
        for (lcol = 0; lcol < lmat->cols; lcol++) {
 539:	83 c0 01             	add    $0x1,%eax
            sum += lmat->data[calc_row][lcol] * rmat->data[lcol][rcol];
 53c:	0f af 14 1f          	imul   (%edi,%ebx,1),%edx
 540:	01 d1                	add    %edx,%ecx
        for (lcol = 0; lcol < lmat->cols; lcol++) {
 542:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 545:	75 e9                	jne    530 <cal_rowThreadStep+0x90>
        omat->data[calc_row][rcol] = sum;
 547:	8b 45 d0             	mov    -0x30(%ebp),%eax
 54a:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    for (rcol = 0; rcol < rmat->cols; rcol++) {
 54d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        omat->data[calc_row][rcol] = sum;
 551:	8b 40 08             	mov    0x8(%eax),%eax
 554:	8b 04 30             	mov    (%eax,%esi,1),%eax
 557:	89 0c 18             	mov    %ecx,(%eax,%ebx,1)
    for (rcol = 0; rcol < rmat->cols; rcol++) {
 55a:	8b 45 d8             	mov    -0x28(%ebp),%eax
 55d:	83 c3 04             	add    $0x4,%ebx
 560:	8b 4d dc             	mov    -0x24(%ebp),%ecx
 563:	3b 48 04             	cmp    0x4(%eax),%ecx
 566:	72 a0                	jb     508 <cal_rowThreadStep+0x68>
    for (row = tid; row < omatrix->rows; row += numThreads) {
 568:	8b 1d 8c 15 00 00    	mov    0x158c,%ebx
 56e:	a1 80 15 00 00       	mov    0x1580,%eax
 573:	01 45 c8             	add    %eax,-0x38(%ebp)
 576:	8b 75 c8             	mov    -0x38(%ebp),%esi
 579:	3b 33                	cmp    (%ebx),%esi
 57b:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 57e:	89 f0                	mov    %esi,%eax
 580:	0f 82 3a ff ff ff    	jb     4c0 <cal_rowThreadStep+0x20>
    benny_thread_exit(7);
 586:	c7 45 08 07 00 00 00 	movl   $0x7,0x8(%ebp)
}
 58d:	83 c4 3c             	add    $0x3c,%esp
 590:	5b                   	pop    %ebx
 591:	5e                   	pop    %esi
 592:	5f                   	pop    %edi
 593:	5d                   	pop    %ebp
    benny_thread_exit(7);
 594:	e9 77 08 00 00       	jmp    e10 <benny_thread_exit>
        for (lcol = 0; lcol < lmat->cols; lcol++) {
 599:	31 c9                	xor    %ecx,%ecx
 59b:	eb aa                	jmp    547 <cal_rowThreadStep+0xa7>
 59d:	66 90                	xchg   %ax,%ax
 59f:	90                   	nop

000005a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5a9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 5aa:	89 c2                	mov    %eax,%edx
 5ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5b0:	83 c1 01             	add    $0x1,%ecx
 5b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 5b7:	83 c2 01             	add    $0x1,%edx
 5ba:	84 db                	test   %bl,%bl
 5bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 5bf:	75 ef                	jne    5b0 <strcpy+0x10>
    ;
  return os;
}
 5c1:	5b                   	pop    %ebx
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    
 5c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000005d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	8b 55 08             	mov    0x8(%ebp),%edx
 5d6:	53                   	push   %ebx
 5d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 5da:	0f b6 02             	movzbl (%edx),%eax
 5dd:	84 c0                	test   %al,%al
 5df:	74 2d                	je     60e <strcmp+0x3e>
 5e1:	0f b6 19             	movzbl (%ecx),%ebx
 5e4:	38 d8                	cmp    %bl,%al
 5e6:	74 0e                	je     5f6 <strcmp+0x26>
 5e8:	eb 2b                	jmp    615 <strcmp+0x45>
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5f0:	38 c8                	cmp    %cl,%al
 5f2:	75 15                	jne    609 <strcmp+0x39>
    p++, q++;
 5f4:	89 d9                	mov    %ebx,%ecx
 5f6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 5f9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 5fc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 5ff:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 603:	84 c0                	test   %al,%al
 605:	75 e9                	jne    5f0 <strcmp+0x20>
 607:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 609:	29 c8                	sub    %ecx,%eax
}
 60b:	5b                   	pop    %ebx
 60c:	5d                   	pop    %ebp
 60d:	c3                   	ret    
 60e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 611:	31 c0                	xor    %eax,%eax
 613:	eb f4                	jmp    609 <strcmp+0x39>
 615:	0f b6 cb             	movzbl %bl,%ecx
 618:	eb ef                	jmp    609 <strcmp+0x39>
 61a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000620 <strlen>:

uint
strlen(const char *s)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 626:	80 39 00             	cmpb   $0x0,(%ecx)
 629:	74 12                	je     63d <strlen+0x1d>
 62b:	31 d2                	xor    %edx,%edx
 62d:	8d 76 00             	lea    0x0(%esi),%esi
 630:	83 c2 01             	add    $0x1,%edx
 633:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 637:	89 d0                	mov    %edx,%eax
 639:	75 f5                	jne    630 <strlen+0x10>
    ;
  return n;
}
 63b:	5d                   	pop    %ebp
 63c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 63d:	31 c0                	xor    %eax,%eax
}
 63f:	5d                   	pop    %ebp
 640:	c3                   	ret    
 641:	eb 0d                	jmp    650 <memset>
 643:	90                   	nop
 644:	90                   	nop
 645:	90                   	nop
 646:	90                   	nop
 647:	90                   	nop
 648:	90                   	nop
 649:	90                   	nop
 64a:	90                   	nop
 64b:	90                   	nop
 64c:	90                   	nop
 64d:	90                   	nop
 64e:	90                   	nop
 64f:	90                   	nop

00000650 <memset>:

void*
memset(void *dst, int c, uint n)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	8b 55 08             	mov    0x8(%ebp),%edx
 656:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 657:	8b 4d 10             	mov    0x10(%ebp),%ecx
 65a:	8b 45 0c             	mov    0xc(%ebp),%eax
 65d:	89 d7                	mov    %edx,%edi
 65f:	fc                   	cld    
 660:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 662:	89 d0                	mov    %edx,%eax
 664:	5f                   	pop    %edi
 665:	5d                   	pop    %ebp
 666:	c3                   	ret    
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <strchr>:

char*
strchr(const char *s, char c)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	8b 45 08             	mov    0x8(%ebp),%eax
 676:	53                   	push   %ebx
 677:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 67a:	0f b6 18             	movzbl (%eax),%ebx
 67d:	84 db                	test   %bl,%bl
 67f:	74 1d                	je     69e <strchr+0x2e>
    if(*s == c)
 681:	38 d3                	cmp    %dl,%bl
 683:	89 d1                	mov    %edx,%ecx
 685:	75 0d                	jne    694 <strchr+0x24>
 687:	eb 17                	jmp    6a0 <strchr+0x30>
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 690:	38 ca                	cmp    %cl,%dl
 692:	74 0c                	je     6a0 <strchr+0x30>
  for(; *s; s++)
 694:	83 c0 01             	add    $0x1,%eax
 697:	0f b6 10             	movzbl (%eax),%edx
 69a:	84 d2                	test   %dl,%dl
 69c:	75 f2                	jne    690 <strchr+0x20>
      return (char*)s;
  return 0;
 69e:	31 c0                	xor    %eax,%eax
}
 6a0:	5b                   	pop    %ebx
 6a1:	5d                   	pop    %ebp
 6a2:	c3                   	ret    
 6a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006b0 <gets>:

char*
gets(char *buf, int max)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6b5:	31 f6                	xor    %esi,%esi
{
 6b7:	53                   	push   %ebx
 6b8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 6bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 6be:	eb 31                	jmp    6f1 <gets+0x41>
    cc = read(0, &c, 1);
 6c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6c7:	00 
 6c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 6cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6d3:	e8 02 01 00 00       	call   7da <read>
    if(cc < 1)
 6d8:	85 c0                	test   %eax,%eax
 6da:	7e 1d                	jle    6f9 <gets+0x49>
      break;
    buf[i++] = c;
 6dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 6e0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 6e2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 6e5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 6e7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 6eb:	74 0c                	je     6f9 <gets+0x49>
 6ed:	3c 0a                	cmp    $0xa,%al
 6ef:	74 08                	je     6f9 <gets+0x49>
  for(i=0; i+1 < max; ){
 6f1:	8d 5e 01             	lea    0x1(%esi),%ebx
 6f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 6f7:	7c c7                	jl     6c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
 6fc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 700:	83 c4 2c             	add    $0x2c,%esp
 703:	5b                   	pop    %ebx
 704:	5e                   	pop    %esi
 705:	5f                   	pop    %edi
 706:	5d                   	pop    %ebp
 707:	c3                   	ret    
 708:	90                   	nop
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000710 <stat>:

int
stat(const char *n, struct stat *st)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	56                   	push   %esi
 714:	53                   	push   %ebx
 715:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 718:	8b 45 08             	mov    0x8(%ebp),%eax
 71b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 722:	00 
 723:	89 04 24             	mov    %eax,(%esp)
 726:	e8 d7 00 00 00       	call   802 <open>
  if(fd < 0)
 72b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 72d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 72f:	78 27                	js     758 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 731:	8b 45 0c             	mov    0xc(%ebp),%eax
 734:	89 1c 24             	mov    %ebx,(%esp)
 737:	89 44 24 04          	mov    %eax,0x4(%esp)
 73b:	e8 da 00 00 00       	call   81a <fstat>
  close(fd);
 740:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 743:	89 c6                	mov    %eax,%esi
  close(fd);
 745:	e8 a0 00 00 00       	call   7ea <close>
  return r;
 74a:	89 f0                	mov    %esi,%eax
}
 74c:	83 c4 10             	add    $0x10,%esp
 74f:	5b                   	pop    %ebx
 750:	5e                   	pop    %esi
 751:	5d                   	pop    %ebp
 752:	c3                   	ret    
 753:	90                   	nop
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 758:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 75d:	eb ed                	jmp    74c <stat+0x3c>
 75f:	90                   	nop

00000760 <atoi>:

int
atoi(const char *s)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	8b 4d 08             	mov    0x8(%ebp),%ecx
 766:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 767:	0f be 11             	movsbl (%ecx),%edx
 76a:	8d 42 d0             	lea    -0x30(%edx),%eax
 76d:	3c 09                	cmp    $0x9,%al
  n = 0;
 76f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 774:	77 17                	ja     78d <atoi+0x2d>
 776:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 778:	83 c1 01             	add    $0x1,%ecx
 77b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 77e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 782:	0f be 11             	movsbl (%ecx),%edx
 785:	8d 5a d0             	lea    -0x30(%edx),%ebx
 788:	80 fb 09             	cmp    $0x9,%bl
 78b:	76 eb                	jbe    778 <atoi+0x18>
  return n;
}
 78d:	5b                   	pop    %ebx
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    

00000790 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 790:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 791:	31 d2                	xor    %edx,%edx
{
 793:	89 e5                	mov    %esp,%ebp
 795:	56                   	push   %esi
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	53                   	push   %ebx
 79a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 79d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 7a0:	85 db                	test   %ebx,%ebx
 7a2:	7e 12                	jle    7b6 <memmove+0x26>
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 7a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 7ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 7af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 7b2:	39 da                	cmp    %ebx,%edx
 7b4:	75 f2                	jne    7a8 <memmove+0x18>
  return vdst;
}
 7b6:	5b                   	pop    %ebx
 7b7:	5e                   	pop    %esi
 7b8:	5d                   	pop    %ebp
 7b9:	c3                   	ret    

000007ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7ba:	b8 01 00 00 00       	mov    $0x1,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <exit>:
SYSCALL(exit)
 7c2:	b8 02 00 00 00       	mov    $0x2,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <wait>:
SYSCALL(wait)
 7ca:	b8 03 00 00 00       	mov    $0x3,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <pipe>:
SYSCALL(pipe)
 7d2:	b8 04 00 00 00       	mov    $0x4,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <read>:
SYSCALL(read)
 7da:	b8 05 00 00 00       	mov    $0x5,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <write>:
SYSCALL(write)
 7e2:	b8 10 00 00 00       	mov    $0x10,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <close>:
SYSCALL(close)
 7ea:	b8 15 00 00 00       	mov    $0x15,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <kill>:
SYSCALL(kill)
 7f2:	b8 06 00 00 00       	mov    $0x6,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <exec>:
SYSCALL(exec)
 7fa:	b8 07 00 00 00       	mov    $0x7,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    

00000802 <open>:
SYSCALL(open)
 802:	b8 0f 00 00 00       	mov    $0xf,%eax
 807:	cd 40                	int    $0x40
 809:	c3                   	ret    

0000080a <mknod>:
SYSCALL(mknod)
 80a:	b8 11 00 00 00       	mov    $0x11,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    

00000812 <unlink>:
SYSCALL(unlink)
 812:	b8 12 00 00 00       	mov    $0x12,%eax
 817:	cd 40                	int    $0x40
 819:	c3                   	ret    

0000081a <fstat>:
SYSCALL(fstat)
 81a:	b8 08 00 00 00       	mov    $0x8,%eax
 81f:	cd 40                	int    $0x40
 821:	c3                   	ret    

00000822 <link>:
SYSCALL(link)
 822:	b8 13 00 00 00       	mov    $0x13,%eax
 827:	cd 40                	int    $0x40
 829:	c3                   	ret    

0000082a <mkdir>:
SYSCALL(mkdir)
 82a:	b8 14 00 00 00       	mov    $0x14,%eax
 82f:	cd 40                	int    $0x40
 831:	c3                   	ret    

00000832 <chdir>:
SYSCALL(chdir)
 832:	b8 09 00 00 00       	mov    $0x9,%eax
 837:	cd 40                	int    $0x40
 839:	c3                   	ret    

0000083a <dup>:
SYSCALL(dup)
 83a:	b8 0a 00 00 00       	mov    $0xa,%eax
 83f:	cd 40                	int    $0x40
 841:	c3                   	ret    

00000842 <getpid>:
SYSCALL(getpid)
 842:	b8 0b 00 00 00       	mov    $0xb,%eax
 847:	cd 40                	int    $0x40
 849:	c3                   	ret    

0000084a <sbrk>:
SYSCALL(sbrk)
 84a:	b8 0c 00 00 00       	mov    $0xc,%eax
 84f:	cd 40                	int    $0x40
 851:	c3                   	ret    

00000852 <sleep>:
SYSCALL(sleep)
 852:	b8 0d 00 00 00       	mov    $0xd,%eax
 857:	cd 40                	int    $0x40
 859:	c3                   	ret    

0000085a <uptime>:
SYSCALL(uptime)
 85a:	b8 0e 00 00 00       	mov    $0xe,%eax
 85f:	cd 40                	int    $0x40
 861:	c3                   	ret    

00000862 <getppid>:
#ifdef GETPPID
SYSCALL(getppid)
 862:	b8 16 00 00 00       	mov    $0x16,%eax
 867:	cd 40                	int    $0x40
 869:	c3                   	ret    

0000086a <cps>:
#endif // GETPPID
#ifdef CPS
SYSCALL(cps)
 86a:	b8 17 00 00 00       	mov    $0x17,%eax
 86f:	cd 40                	int    $0x40
 871:	c3                   	ret    

00000872 <halt>:
#endif // CPS
#ifdef HALT
SYSCALL(halt)
 872:	b8 18 00 00 00       	mov    $0x18,%eax
 877:	cd 40                	int    $0x40
 879:	c3                   	ret    

0000087a <kdebug>:
#endif // HALT
#ifdef KDEBUG
SYSCALL(kdebug)
 87a:	b8 19 00 00 00       	mov    $0x19,%eax
 87f:	cd 40                	int    $0x40
 881:	c3                   	ret    

00000882 <va2pa>:
#endif // KDEBUG
#ifdef VA2PA
SYSCALL(va2pa)
 882:	b8 1a 00 00 00       	mov    $0x1a,%eax
 887:	cd 40                	int    $0x40
 889:	c3                   	ret    

0000088a <kthread_create>:
#endif // VA2PA
#ifdef KTHREADS
SYSCALL(kthread_create)
 88a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 88f:	cd 40                	int    $0x40
 891:	c3                   	ret    

00000892 <kthread_join>:
SYSCALL(kthread_join)
 892:	b8 1c 00 00 00       	mov    $0x1c,%eax
 897:	cd 40                	int    $0x40
 899:	c3                   	ret    

0000089a <kthread_exit>:
SYSCALL(kthread_exit)
 89a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 89f:	cd 40                	int    $0x40
 8a1:	c3                   	ret    

000008a2 <kthread_self>:
#endif // KTHREADS
#ifdef BENNY_MOOTEX
SYSCALL(kthread_self)
 8a2:	b8 1e 00 00 00       	mov    $0x1e,%eax
 8a7:	cd 40                	int    $0x40
 8a9:	c3                   	ret    

000008aa <kthread_yield>:
SYSCALL(kthread_yield)
 8aa:	b8 1f 00 00 00       	mov    $0x1f,%eax
 8af:	cd 40                	int    $0x40
 8b1:	c3                   	ret    

000008b2 <kthread_cpu_count>:
SYSCALL(kthread_cpu_count)
 8b2:	b8 20 00 00 00       	mov    $0x20,%eax
 8b7:	cd 40                	int    $0x40
 8b9:	c3                   	ret    

000008ba <kthread_thread_count>:
SYSCALL(kthread_thread_count)
 8ba:	b8 21 00 00 00       	mov    $0x21,%eax
 8bf:	cd 40                	int    $0x40
 8c1:	c3                   	ret    
 8c2:	66 90                	xchg   %ax,%ax
 8c4:	66 90                	xchg   %ax,%ax
 8c6:	66 90                	xchg   %ax,%ax
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 8d0:	55                   	push   %ebp
 8d1:	89 e5                	mov    %esp,%ebp
 8d3:	57                   	push   %edi
 8d4:	56                   	push   %esi
 8d5:	89 c6                	mov    %eax,%esi
 8d7:	53                   	push   %ebx
 8d8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 8db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8de:	85 db                	test   %ebx,%ebx
 8e0:	74 09                	je     8eb <printint+0x1b>
 8e2:	89 d0                	mov    %edx,%eax
 8e4:	c1 e8 1f             	shr    $0x1f,%eax
 8e7:	84 c0                	test   %al,%al
 8e9:	75 75                	jne    960 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 8eb:	89 d0                	mov    %edx,%eax
  neg = 0;
 8ed:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 8f4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 8f7:	31 ff                	xor    %edi,%edi
 8f9:	89 ce                	mov    %ecx,%esi
 8fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 8fe:	eb 02                	jmp    902 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 900:	89 cf                	mov    %ecx,%edi
 902:	31 d2                	xor    %edx,%edx
 904:	f7 f6                	div    %esi
 906:	8d 4f 01             	lea    0x1(%edi),%ecx
 909:	0f b6 92 6b 10 00 00 	movzbl 0x106b(%edx),%edx
  }while((x /= base) != 0);
 910:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 912:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 915:	75 e9                	jne    900 <printint+0x30>
  if(neg)
 917:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 91a:	89 c8                	mov    %ecx,%eax
 91c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 91f:	85 d2                	test   %edx,%edx
 921:	74 08                	je     92b <printint+0x5b>
    buf[i++] = '-';
 923:	8d 4f 02             	lea    0x2(%edi),%ecx
 926:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 92b:	8d 79 ff             	lea    -0x1(%ecx),%edi
 92e:	66 90                	xchg   %ax,%ax
 930:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 935:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 938:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 93f:	00 
 940:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 944:	89 34 24             	mov    %esi,(%esp)
 947:	88 45 d7             	mov    %al,-0x29(%ebp)
 94a:	e8 93 fe ff ff       	call   7e2 <write>
  while(--i >= 0)
 94f:	83 ff ff             	cmp    $0xffffffff,%edi
 952:	75 dc                	jne    930 <printint+0x60>
    putc(fd, buf[i]);
}
 954:	83 c4 4c             	add    $0x4c,%esp
 957:	5b                   	pop    %ebx
 958:	5e                   	pop    %esi
 959:	5f                   	pop    %edi
 95a:	5d                   	pop    %ebp
 95b:	c3                   	ret    
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 960:	89 d0                	mov    %edx,%eax
 962:	f7 d8                	neg    %eax
    neg = 1;
 964:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 96b:	eb 87                	jmp    8f4 <printint+0x24>
 96d:	8d 76 00             	lea    0x0(%esi),%esi

00000970 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 974:	31 ff                	xor    %edi,%edi
{
 976:	56                   	push   %esi
 977:	53                   	push   %ebx
 978:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 97b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 97e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 981:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 984:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 987:	0f b6 13             	movzbl (%ebx),%edx
 98a:	83 c3 01             	add    $0x1,%ebx
 98d:	84 d2                	test   %dl,%dl
 98f:	75 39                	jne    9ca <printf+0x5a>
 991:	e9 ca 00 00 00       	jmp    a60 <printf+0xf0>
 996:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 998:	83 fa 25             	cmp    $0x25,%edx
 99b:	0f 84 c7 00 00 00    	je     a68 <printf+0xf8>
  write(fd, &c, 1);
 9a1:	8d 45 e0             	lea    -0x20(%ebp),%eax
 9a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9ab:	00 
 9ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 9b0:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 9b3:	88 55 e0             	mov    %dl,-0x20(%ebp)
  write(fd, &c, 1);
 9b6:	e8 27 fe ff ff       	call   7e2 <write>
 9bb:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 9be:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 9c2:	84 d2                	test   %dl,%dl
 9c4:	0f 84 96 00 00 00    	je     a60 <printf+0xf0>
    if(state == 0){
 9ca:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 9cc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 9cf:	74 c7                	je     998 <printf+0x28>
      }
    } else if(state == '%'){
 9d1:	83 ff 25             	cmp    $0x25,%edi
 9d4:	75 e5                	jne    9bb <printf+0x4b>
      if(c == 'd' || c == 'u'){
 9d6:	83 fa 75             	cmp    $0x75,%edx
 9d9:	0f 84 99 00 00 00    	je     a78 <printf+0x108>
 9df:	83 fa 64             	cmp    $0x64,%edx
 9e2:	0f 84 90 00 00 00    	je     a78 <printf+0x108>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9e8:	25 f7 00 00 00       	and    $0xf7,%eax
 9ed:	83 f8 70             	cmp    $0x70,%eax
 9f0:	0f 84 aa 00 00 00    	je     aa0 <printf+0x130>
        putc(fd, '0');
        putc(fd, 'x');
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9f6:	83 fa 73             	cmp    $0x73,%edx
 9f9:	0f 84 e9 00 00 00    	je     ae8 <printf+0x178>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ff:	83 fa 63             	cmp    $0x63,%edx
 a02:	0f 84 2b 01 00 00    	je     b33 <printf+0x1c3>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a08:	83 fa 25             	cmp    $0x25,%edx
 a0b:	0f 84 4f 01 00 00    	je     b60 <printf+0x1f0>
  write(fd, &c, 1);
 a11:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 a14:	83 c3 01             	add    $0x1,%ebx
 a17:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a1e:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a1f:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 a21:	89 44 24 04          	mov    %eax,0x4(%esp)
 a25:	89 34 24             	mov    %esi,(%esp)
 a28:	89 55 d0             	mov    %edx,-0x30(%ebp)
 a2b:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 a2f:	e8 ae fd ff ff       	call   7e2 <write>
        putc(fd, c);
 a34:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 a37:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a3a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a41:	00 
 a42:	89 44 24 04          	mov    %eax,0x4(%esp)
 a46:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 a49:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a4c:	e8 91 fd ff ff       	call   7e2 <write>
  for(i = 0; fmt[i]; i++){
 a51:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 a55:	84 d2                	test   %dl,%dl
 a57:	0f 85 6d ff ff ff    	jne    9ca <printf+0x5a>
 a5d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
}
 a60:	83 c4 3c             	add    $0x3c,%esp
 a63:	5b                   	pop    %ebx
 a64:	5e                   	pop    %esi
 a65:	5f                   	pop    %edi
 a66:	5d                   	pop    %ebp
 a67:	c3                   	ret    
        state = '%';
 a68:	bf 25 00 00 00       	mov    $0x25,%edi
 a6d:	e9 49 ff ff ff       	jmp    9bb <printf+0x4b>
 a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 a78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a7f:	b9 0a 00 00 00       	mov    $0xa,%ecx
        printint(fd, *ap, 16, 0);
 a84:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 a87:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 a89:	8b 10                	mov    (%eax),%edx
 a8b:	89 f0                	mov    %esi,%eax
 a8d:	e8 3e fe ff ff       	call   8d0 <printint>
        ap++;
 a92:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a96:	e9 20 ff ff ff       	jmp    9bb <printf+0x4b>
 a9b:	90                   	nop
 a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 aa0:	8d 45 e1             	lea    -0x1f(%ebp),%eax
 aa3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 aaa:	00 
 aab:	89 44 24 04          	mov    %eax,0x4(%esp)
 aaf:	89 34 24             	mov    %esi,(%esp)
 ab2:	c6 45 e1 30          	movb   $0x30,-0x1f(%ebp)
 ab6:	e8 27 fd ff ff       	call   7e2 <write>
 abb:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 abe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 ac5:	00 
 ac6:	89 44 24 04          	mov    %eax,0x4(%esp)
 aca:	89 34 24             	mov    %esi,(%esp)
 acd:	c6 45 e2 78          	movb   $0x78,-0x1e(%ebp)
 ad1:	e8 0c fd ff ff       	call   7e2 <write>
        printint(fd, *ap, 16, 0);
 ad6:	b9 10 00 00 00       	mov    $0x10,%ecx
 adb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 ae2:	eb a0                	jmp    a84 <printf+0x114>
 ae4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 ae8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 aeb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 aef:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 af1:	b8 64 10 00 00       	mov    $0x1064,%eax
 af6:	85 ff                	test   %edi,%edi
 af8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 afb:	0f b6 07             	movzbl (%edi),%eax
 afe:	84 c0                	test   %al,%al
 b00:	74 2a                	je     b2c <printf+0x1bc>
 b02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b08:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 b0b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 b0e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 b11:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 b18:	00 
 b19:	89 44 24 04          	mov    %eax,0x4(%esp)
 b1d:	89 34 24             	mov    %esi,(%esp)
 b20:	e8 bd fc ff ff       	call   7e2 <write>
        while(*s != 0){
 b25:	0f b6 07             	movzbl (%edi),%eax
 b28:	84 c0                	test   %al,%al
 b2a:	75 dc                	jne    b08 <printf+0x198>
      state = 0;
 b2c:	31 ff                	xor    %edi,%edi
 b2e:	e9 88 fe ff ff       	jmp    9bb <printf+0x4b>
        putc(fd, *ap);
 b33:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 b36:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 b38:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 b3a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 b41:	00 
 b42:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 b45:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 b48:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 b4b:	89 44 24 04          	mov    %eax,0x4(%esp)
 b4f:	e8 8e fc ff ff       	call   7e2 <write>
        ap++;
 b54:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 b58:	e9 5e fe ff ff       	jmp    9bb <printf+0x4b>
 b5d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 b60:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 b63:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 b65:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 b6c:	00 
 b6d:	89 44 24 04          	mov    %eax,0x4(%esp)
 b71:	89 34 24             	mov    %esi,(%esp)
 b74:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 b78:	e8 65 fc ff ff       	call   7e2 <write>
 b7d:	e9 39 fe ff ff       	jmp    9bb <printf+0x4b>
 b82:	66 90                	xchg   %ax,%ax
 b84:	66 90                	xchg   %ax,%ax
 b86:	66 90                	xchg   %ax,%ax
 b88:	66 90                	xchg   %ax,%ax
 b8a:	66 90                	xchg   %ax,%ax
 b8c:	66 90                	xchg   %ax,%ax
 b8e:	66 90                	xchg   %ax,%ax

00000b90 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b90:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b91:	a1 90 15 00 00       	mov    0x1590,%eax
{
 b96:	89 e5                	mov    %esp,%ebp
 b98:	57                   	push   %edi
 b99:	56                   	push   %esi
 b9a:	53                   	push   %ebx
 b9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b9e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 ba0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ba3:	39 d0                	cmp    %edx,%eax
 ba5:	72 11                	jb     bb8 <free+0x28>
 ba7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ba8:	39 c8                	cmp    %ecx,%eax
 baa:	72 04                	jb     bb0 <free+0x20>
 bac:	39 ca                	cmp    %ecx,%edx
 bae:	72 10                	jb     bc0 <free+0x30>
 bb0:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bb2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bb4:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 bb6:	73 f0                	jae    ba8 <free+0x18>
 bb8:	39 ca                	cmp    %ecx,%edx
 bba:	72 04                	jb     bc0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 bbc:	39 c8                	cmp    %ecx,%eax
 bbe:	72 f0                	jb     bb0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 bc0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 bc3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 bc6:	39 cf                	cmp    %ecx,%edi
 bc8:	74 1e                	je     be8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 bca:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bcd:	8b 48 04             	mov    0x4(%eax),%ecx
 bd0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 bd3:	39 f2                	cmp    %esi,%edx
 bd5:	74 28                	je     bff <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 bd7:	89 10                	mov    %edx,(%eax)
  freep = p;
 bd9:	a3 90 15 00 00       	mov    %eax,0x1590
}
 bde:	5b                   	pop    %ebx
 bdf:	5e                   	pop    %esi
 be0:	5f                   	pop    %edi
 be1:	5d                   	pop    %ebp
 be2:	c3                   	ret    
 be3:	90                   	nop
 be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 be8:	03 71 04             	add    0x4(%ecx),%esi
 beb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 bee:	8b 08                	mov    (%eax),%ecx
 bf0:	8b 09                	mov    (%ecx),%ecx
 bf2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bf5:	8b 48 04             	mov    0x4(%eax),%ecx
 bf8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 bfb:	39 f2                	cmp    %esi,%edx
 bfd:	75 d8                	jne    bd7 <free+0x47>
    p->s.size += bp->s.size;
 bff:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 c02:	a3 90 15 00 00       	mov    %eax,0x1590
    p->s.size += bp->s.size;
 c07:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 c0a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 c0d:	89 10                	mov    %edx,(%eax)
}
 c0f:	5b                   	pop    %ebx
 c10:	5e                   	pop    %esi
 c11:	5f                   	pop    %edi
 c12:	5d                   	pop    %ebp
 c13:	c3                   	ret    
 c14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 c1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c20 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c20:	55                   	push   %ebp
 c21:	89 e5                	mov    %esp,%ebp
 c23:	57                   	push   %edi
 c24:	56                   	push   %esi
 c25:	53                   	push   %ebx
 c26:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c29:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 c2c:	8b 1d 90 15 00 00    	mov    0x1590,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c32:	8d 48 07             	lea    0x7(%eax),%ecx
 c35:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 c38:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c3a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 c3d:	0f 84 9b 00 00 00    	je     cde <malloc+0xbe>
 c43:	8b 13                	mov    (%ebx),%edx
 c45:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 c48:	39 fe                	cmp    %edi,%esi
 c4a:	76 64                	jbe    cb0 <malloc+0x90>
 c4c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 c53:	bb 00 80 00 00       	mov    $0x8000,%ebx
 c58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 c5b:	eb 0e                	jmp    c6b <malloc+0x4b>
 c5d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c60:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c62:	8b 78 04             	mov    0x4(%eax),%edi
 c65:	39 fe                	cmp    %edi,%esi
 c67:	76 4f                	jbe    cb8 <malloc+0x98>
 c69:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c6b:	3b 15 90 15 00 00    	cmp    0x1590,%edx
 c71:	75 ed                	jne    c60 <malloc+0x40>
  if(nu < 4096)
 c73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c76:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 c7c:	bf 00 10 00 00       	mov    $0x1000,%edi
 c81:	0f 43 fe             	cmovae %esi,%edi
 c84:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 c87:	89 04 24             	mov    %eax,(%esp)
 c8a:	e8 bb fb ff ff       	call   84a <sbrk>
  if(p == (char*)-1)
 c8f:	83 f8 ff             	cmp    $0xffffffff,%eax
 c92:	74 18                	je     cac <malloc+0x8c>
  hp->s.size = nu;
 c94:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 c97:	83 c0 08             	add    $0x8,%eax
 c9a:	89 04 24             	mov    %eax,(%esp)
 c9d:	e8 ee fe ff ff       	call   b90 <free>
  return freep;
 ca2:	8b 15 90 15 00 00    	mov    0x1590,%edx
      if((p = morecore(nunits)) == 0)
 ca8:	85 d2                	test   %edx,%edx
 caa:	75 b4                	jne    c60 <malloc+0x40>
        return 0;
 cac:	31 c0                	xor    %eax,%eax
 cae:	eb 20                	jmp    cd0 <malloc+0xb0>
    if(p->s.size >= nunits){
 cb0:	89 d0                	mov    %edx,%eax
 cb2:	89 da                	mov    %ebx,%edx
 cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 cb8:	39 fe                	cmp    %edi,%esi
 cba:	74 1c                	je     cd8 <malloc+0xb8>
        p->s.size -= nunits;
 cbc:	29 f7                	sub    %esi,%edi
 cbe:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 cc1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 cc4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 cc7:	89 15 90 15 00 00    	mov    %edx,0x1590
      return (void*)(p + 1);
 ccd:	83 c0 08             	add    $0x8,%eax
  }
}
 cd0:	83 c4 1c             	add    $0x1c,%esp
 cd3:	5b                   	pop    %ebx
 cd4:	5e                   	pop    %esi
 cd5:	5f                   	pop    %edi
 cd6:	5d                   	pop    %ebp
 cd7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 cd8:	8b 08                	mov    (%eax),%ecx
 cda:	89 0a                	mov    %ecx,(%edx)
 cdc:	eb e9                	jmp    cc7 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 cde:	c7 05 90 15 00 00 94 	movl   $0x1594,0x1590
 ce5:	15 00 00 
    base.s.size = 0;
 ce8:	ba 94 15 00 00       	mov    $0x1594,%edx
    base.s.ptr = freep = prevp = &base;
 ced:	c7 05 94 15 00 00 94 	movl   $0x1594,0x1594
 cf4:	15 00 00 
    base.s.size = 0;
 cf7:	c7 05 98 15 00 00 00 	movl   $0x0,0x1598
 cfe:	00 00 00 
 d01:	e9 46 ff ff ff       	jmp    c4c <malloc+0x2c>
 d06:	66 90                	xchg   %ax,%ax
 d08:	66 90                	xchg   %ax,%ax
 d0a:	66 90                	xchg   %ax,%ax
 d0c:	66 90                	xchg   %ax,%ax
 d0e:	66 90                	xchg   %ax,%ax

00000d10 <benny_thread_create>:

static struct benny_thread_s *bt_new(void);

int
benny_thread_create(benny_thread_t *abt, void (*func)(void*), void *arg_ptr)
{
 d10:	55                   	push   %ebp
 d11:	89 e5                	mov    %esp,%ebp
 d13:	56                   	push   %esi
 d14:	53                   	push   %ebx
 d15:	83 ec 10             	sub    $0x10,%esp
}

static struct benny_thread_s *
bt_new(void)
{
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 d18:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
 d1f:	e8 fc fe ff ff       	call   c20 <malloc>

    if (bt == NULL) {
 d24:	85 c0                	test   %eax,%eax
    struct benny_thread_s *bt = malloc(sizeof(struct benny_thread_s));
 d26:	89 c6                	mov    %eax,%esi
    if (bt == NULL) {
 d28:	74 66                	je     d90 <benny_thread_create+0x80>

    // allocate 2 pages worth of memory and then make sure the
    // beginning address used for the stack is page alligned.
    // we want it page alligned so that we don't generate a
    // page fault by accessing the stack for a thread.
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 d2a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 d31:	e8 ea fe ff ff       	call   c20 <malloc>
    if (bt->bt_stack == NULL) {
 d36:	85 c0                	test   %eax,%eax
    bt->bt_stack = bt->mem_stack = malloc(PGSIZE * 2);
 d38:	89 c3                	mov    %eax,%ebx
 d3a:	89 46 08             	mov    %eax,0x8(%esi)
 d3d:	89 46 04             	mov    %eax,0x4(%esi)
    if (bt->bt_stack == NULL) {
 d40:	74 5d                	je     d9f <benny_thread_create+0x8f>
        free(bt);
        return NULL;
    }
    if (((uint) bt->bt_stack) % PGSIZE != 0) {
 d42:	25 ff 0f 00 00       	and    $0xfff,%eax
 d47:	75 37                	jne    d80 <benny_thread_create+0x70>
        // allign the thread stack to a page boundary
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
    }
    bt->bid = -1;
 d49:	c7 06 ff ff ff ff    	movl   $0xffffffff,(%esi)
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 d4f:	8b 45 10             	mov    0x10(%ebp),%eax
 d52:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 d56:	89 44 24 04          	mov    %eax,0x4(%esp)
 d5a:	8b 45 0c             	mov    0xc(%ebp),%eax
 d5d:	89 04 24             	mov    %eax,(%esp)
 d60:	e8 25 fb ff ff       	call   88a <kthread_create>
    if (bt->bid != 0) {
 d65:	85 c0                	test   %eax,%eax
    bt->bid = kthread_create(func, arg_ptr, bt->bt_stack);
 d67:	89 06                	mov    %eax,(%esi)
    if (bt->bid != 0) {
 d69:	74 2d                	je     d98 <benny_thread_create+0x88>
        *abt = (benny_thread_t) bt;
 d6b:	8b 45 08             	mov    0x8(%ebp),%eax
 d6e:	89 30                	mov    %esi,(%eax)
        result = 0;
 d70:	31 c0                	xor    %eax,%eax
}
 d72:	83 c4 10             	add    $0x10,%esp
 d75:	5b                   	pop    %ebx
 d76:	5e                   	pop    %esi
 d77:	5d                   	pop    %ebp
 d78:	c3                   	ret    
 d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bt->bt_stack += (PGSIZE - ((uint) bt->bt_stack) % PGSIZE);
 d80:	29 c3                	sub    %eax,%ebx
 d82:	81 c3 00 10 00 00    	add    $0x1000,%ebx
 d88:	89 5e 04             	mov    %ebx,0x4(%esi)
 d8b:	eb bc                	jmp    d49 <benny_thread_create+0x39>
 d8d:	8d 76 00             	lea    0x0(%esi),%esi
 d90:	8b 1d 04 00 00 00    	mov    0x4,%ebx
 d96:	eb b7                	jmp    d4f <benny_thread_create+0x3f>
    int result = -1;
 d98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 d9d:	eb d3                	jmp    d72 <benny_thread_create+0x62>
        free(bt);
 d9f:	89 34 24             	mov    %esi,(%esp)
        return NULL;
 da2:	31 f6                	xor    %esi,%esi
        free(bt);
 da4:	e8 e7 fd ff ff       	call   b90 <free>
 da9:	8b 5b 04             	mov    0x4(%ebx),%ebx
 dac:	eb a1                	jmp    d4f <benny_thread_create+0x3f>
 dae:	66 90                	xchg   %ax,%ax

00000db0 <benny_thread_bid>:
{
 db0:	55                   	push   %ebp
 db1:	89 e5                	mov    %esp,%ebp
    return bt->bid;
 db3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 db6:	5d                   	pop    %ebp
    return bt->bid;
 db7:	8b 00                	mov    (%eax),%eax
}
 db9:	c3                   	ret    
 dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000dc0 <benny_thread_join>:
{
 dc0:	55                   	push   %ebp
 dc1:	89 e5                	mov    %esp,%ebp
 dc3:	53                   	push   %ebx
 dc4:	83 ec 14             	sub    $0x14,%esp
 dc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    retVal = kthread_join(bt->bid);
 dca:	8b 03                	mov    (%ebx),%eax
 dcc:	89 04 24             	mov    %eax,(%esp)
 dcf:	e8 be fa ff ff       	call   892 <kthread_join>
    if (retVal == 0) {
 dd4:	85 c0                	test   %eax,%eax
 dd6:	75 27                	jne    dff <benny_thread_join+0x3f>
        free(bt->mem_stack);
 dd8:	8b 53 08             	mov    0x8(%ebx),%edx
 ddb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 dde:	89 14 24             	mov    %edx,(%esp)
 de1:	e8 aa fd ff ff       	call   b90 <free>
        bt->bt_stack = bt->mem_stack = NULL;
 de6:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
 ded:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
        free(bt);
 df4:	89 1c 24             	mov    %ebx,(%esp)
 df7:	e8 94 fd ff ff       	call   b90 <free>
 dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 dff:	83 c4 14             	add    $0x14,%esp
 e02:	5b                   	pop    %ebx
 e03:	5d                   	pop    %ebp
 e04:	c3                   	ret    
 e05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e10 <benny_thread_exit>:
{
 e10:	55                   	push   %ebp
 e11:	89 e5                	mov    %esp,%ebp
}
 e13:	5d                   	pop    %ebp
    return kthread_exit(exitValue);
 e14:	e9 81 fa ff ff       	jmp    89a <kthread_exit>
 e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e20 <benny_mootex_init>:
}

# ifdef BENNY_MOOTEX
int 
benny_mootex_init(benny_mootex_t *benny_mootex)
{
 e20:	55                   	push   %ebp
 e21:	89 e5                	mov    %esp,%ebp
 e23:	8b 45 08             	mov    0x8(%ebp),%eax

    benny_mootex->locked = 0;
 e26:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    benny_mootex->bid = -1; 
 e2c:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
    return 0;
}
 e33:	31 c0                	xor    %eax,%eax
 e35:	5d                   	pop    %ebp
 e36:	c3                   	ret    
 e37:	89 f6                	mov    %esi,%esi
 e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e40 <benny_mootex_yieldlock>:

int 
benny_mootex_yieldlock(benny_mootex_t *benny_mootex)
{
 e40:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 e41:	b8 01 00 00 00       	mov    $0x1,%eax
 e46:	89 e5                	mov    %esp,%ebp
 e48:	56                   	push   %esi
 e49:	53                   	push   %ebx
 e4a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 e4d:	f0 87 03             	lock xchg %eax,(%ebx)
// #error this is the call to lock the mootex that will yield in a
// #error loop until the lock is acquired.
    while(xchg(&benny_mootex->locked, 1) != 0){
 e50:	85 c0                	test   %eax,%eax
 e52:	be 01 00 00 00       	mov    $0x1,%esi
 e57:	74 15                	je     e6e <benny_mootex_yieldlock+0x2e>
 e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
benny_yield(void)
{
// # error This just gives up the rest of this scheduled time slice to
// # error another process/thread.

    return kthread_yield();
 e60:	e8 45 fa ff ff       	call   8aa <kthread_yield>
 e65:	89 f0                	mov    %esi,%eax
 e67:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 e6a:	85 c0                	test   %eax,%eax
 e6c:	75 f2                	jne    e60 <benny_mootex_yieldlock+0x20>
    return kthread_self();
 e6e:	e8 2f fa ff ff       	call   8a2 <kthread_self>
    benny_mootex->bid = benny_self();
 e73:	89 43 04             	mov    %eax,0x4(%ebx)
}
 e76:	31 c0                	xor    %eax,%eax
 e78:	5b                   	pop    %ebx
 e79:	5e                   	pop    %esi
 e7a:	5d                   	pop    %ebp
 e7b:	c3                   	ret    
 e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e80 <benny_mootex_spinlock>:
{
 e80:	55                   	push   %ebp
 e81:	ba 01 00 00 00       	mov    $0x1,%edx
 e86:	89 e5                	mov    %esp,%ebp
 e88:	53                   	push   %ebx
 e89:	83 ec 04             	sub    $0x4,%esp
 e8c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 e8f:	90                   	nop
 e90:	89 d0                	mov    %edx,%eax
 e92:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&benny_mootex->locked, 1) != 0){
 e95:	85 c0                	test   %eax,%eax
 e97:	75 f7                	jne    e90 <benny_mootex_spinlock+0x10>
    return kthread_self();
 e99:	e8 04 fa ff ff       	call   8a2 <kthread_self>
    benny_mootex->bid = benny_self();
 e9e:	89 43 04             	mov    %eax,0x4(%ebx)
}
 ea1:	83 c4 04             	add    $0x4,%esp
 ea4:	31 c0                	xor    %eax,%eax
 ea6:	5b                   	pop    %ebx
 ea7:	5d                   	pop    %ebp
 ea8:	c3                   	ret    
 ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000eb0 <benny_mootex_unlock>:
{
 eb0:	55                   	push   %ebp
 eb1:	89 e5                	mov    %esp,%ebp
 eb3:	53                   	push   %ebx
 eb4:	83 ec 04             	sub    $0x4,%esp
 eb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    return kthread_self();
 eba:	e8 e3 f9 ff ff       	call   8a2 <kthread_self>
    if(tid == benny_mootex->bid){
 ebf:	39 43 04             	cmp    %eax,0x4(%ebx)
 ec2:	75 1c                	jne    ee0 <benny_mootex_unlock+0x30>
      __sync_synchronize();
 ec4:	0f ae f0             	mfence 
    return 0;
 ec7:	31 c0                	xor    %eax,%eax
      benny_mootex->bid = -1;
 ec9:	c7 43 04 ff ff ff ff 	movl   $0xffffffff,0x4(%ebx)
      __sync_lock_release(&benny_mootex->locked);
 ed0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
 ed6:	83 c4 04             	add    $0x4,%esp
 ed9:	5b                   	pop    %ebx
 eda:	5d                   	pop    %ebp
 edb:	c3                   	ret    
 edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 ee0:	83 c4 04             	add    $0x4,%esp
      return -1;
 ee3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 ee8:	5b                   	pop    %ebx
 ee9:	5d                   	pop    %ebp
 eea:	c3                   	ret    
 eeb:	90                   	nop
 eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ef0 <benny_mootex_trylock>:
{
 ef0:	55                   	push   %ebp
 ef1:	b8 01 00 00 00       	mov    $0x1,%eax
 ef6:	89 e5                	mov    %esp,%ebp
 ef8:	53                   	push   %ebx
 ef9:	83 ec 04             	sub    $0x4,%esp
 efc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 eff:	f0 87 03             	lock xchg %eax,(%ebx)
    if(xchg(&benny_mootex->locked, 1) != 0){
 f02:	85 c0                	test   %eax,%eax
 f04:	75 08                	jne    f0e <benny_mootex_trylock+0x1e>
        int tid = kthread_self();
 f06:	e8 97 f9 ff ff       	call   8a2 <kthread_self>
        benny_mootex->bid = tid;
 f0b:	89 43 04             	mov    %eax,0x4(%ebx)
}
 f0e:	83 c4 04             	add    $0x4,%esp
 f11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 f16:	5b                   	pop    %ebx
 f17:	5d                   	pop    %ebp
 f18:	c3                   	ret    
 f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f20 <benny_mootex_wholock>:
{
 f20:	55                   	push   %ebp
 f21:	89 e5                	mov    %esp,%ebp
    return benny_mootex->bid;
 f23:	8b 45 08             	mov    0x8(%ebp),%eax
}
 f26:	5d                   	pop    %ebp
    return benny_mootex->bid;
 f27:	8b 40 04             	mov    0x4(%eax),%eax
}
 f2a:	c3                   	ret    
 f2b:	90                   	nop
 f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f30 <benny_mootex_islocked>:
{
 f30:	55                   	push   %ebp
 f31:	89 e5                	mov    %esp,%ebp
    return benny_mootex->locked;
 f33:	8b 45 08             	mov    0x8(%ebp),%eax
}
 f36:	5d                   	pop    %ebp
    return benny_mootex->locked;
 f37:	8b 00                	mov    (%eax),%eax
}
 f39:	c3                   	ret    
 f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000f40 <benny_self>:
{
 f40:	55                   	push   %ebp
 f41:	89 e5                	mov    %esp,%ebp
}
 f43:	5d                   	pop    %ebp
    return kthread_self();
 f44:	e9 59 f9 ff ff       	jmp    8a2 <kthread_self>
 f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f50 <benny_yield>:
{
 f50:	55                   	push   %ebp
 f51:	89 e5                	mov    %esp,%ebp
    
}
 f53:	5d                   	pop    %ebp
    return kthread_yield();
 f54:	e9 51 f9 ff ff       	jmp    8aa <kthread_yield>
 f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f60 <benny_cpu_count>:

int
benny_cpu_count(void)
{
 f60:	55                   	push   %ebp
 f61:	89 e5                	mov    %esp,%ebp
// # error call the kthread_cpu_count() function.
    // kthread_cpu_count();

    return kthread_cpu_count();
}
 f63:	5d                   	pop    %ebp
    return kthread_cpu_count();
 f64:	e9 49 f9 ff ff       	jmp    8b2 <kthread_cpu_count>
 f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f70 <benny_thread_count>:

int
benny_thread_count(void)
{
 f70:	55                   	push   %ebp
 f71:	89 e5                	mov    %esp,%ebp
// # error call the kthread_thread_count() function.
    // kthread_thread_count()

    return kthread_thread_count();
}
 f73:	5d                   	pop    %ebp
    return kthread_thread_count();
 f74:	e9 41 f9 ff ff       	jmp    8ba <kthread_thread_count>
