
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 c5 10 80       	mov    $0x8010c5d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 10 2e 10 80       	mov    $0x80102e10,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 c6 10 80       	mov    $0x8010c614,%ebx
{
80100049:	83 ec 14             	sub    $0x14,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	c7 44 24 04 e0 76 10 	movl   $0x801076e0,0x4(%esp)
80100053:	80 
80100054:	c7 04 24 e0 c5 10 80 	movl   $0x8010c5e0,(%esp)
8010005b:	e8 50 48 00 00       	call   801048b0 <initlock>
  bcache.head.next = &bcache.head;
80100060:	ba dc 0c 11 80       	mov    $0x80110cdc,%edx
  bcache.head.prev = &bcache.head;
80100065:	c7 05 2c 0d 11 80 dc 	movl   $0x80110cdc,0x80110d2c
8010006c:	0c 11 80 
  bcache.head.next = &bcache.head;
8010006f:	c7 05 30 0d 11 80 dc 	movl   $0x80110cdc,0x80110d30
80100076:	0c 11 80 
80100079:	eb 09                	jmp    80100084 <binit+0x44>
8010007b:	90                   	nop
8010007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 da                	mov    %ebx,%edx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100082:	89 c3                	mov    %eax,%ebx
80100084:	8d 43 0c             	lea    0xc(%ebx),%eax
    b->next = bcache.head.next;
80100087:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008a:	c7 43 50 dc 0c 11 80 	movl   $0x80110cdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100091:	89 04 24             	mov    %eax,(%esp)
80100094:	c7 44 24 04 e7 76 10 	movl   $0x801076e7,0x4(%esp)
8010009b:	80 
8010009c:	e8 df 46 00 00       	call   80104780 <initsleeplock>
    bcache.head.next->prev = b;
801000a1:	a1 30 0d 11 80       	mov    0x80110d30,%eax
801000a6:	89 58 50             	mov    %ebx,0x50(%eax)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a9:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000af:	3d dc 0c 11 80       	cmp    $0x80110cdc,%eax
    bcache.head.next = b;
801000b4:	89 1d 30 0d 11 80    	mov    %ebx,0x80110d30
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000ba:	75 c4                	jne    80100080 <binit+0x40>
  }
}
801000bc:	83 c4 14             	add    $0x14,%esp
801000bf:	5b                   	pop    %ebx
801000c0:	5d                   	pop    %ebp
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 1c             	sub    $0x1c,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&bcache.lock);
801000dc:	c7 04 24 e0 c5 10 80 	movl   $0x8010c5e0,(%esp)
{
801000e3:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000e6:	e8 35 49 00 00       	call   80104a20 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000eb:	8b 1d 30 0d 11 80    	mov    0x80110d30,%ebx
801000f1:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
801000f7:	75 12                	jne    8010010b <bread+0x3b>
801000f9:	eb 25                	jmp    80100120 <bread+0x50>
801000fb:	90                   	nop
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c 0d 11 80    	mov    0x80110d2c,%ebx
80100126:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 58                	jmp    80100188 <bread+0xb8>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc 0c 11 80    	cmp    $0x80110cdc,%ebx
80100139:	74 4d                	je     80100188 <bread+0xb8>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	c7 04 24 e0 c5 10 80 	movl   $0x8010c5e0,(%esp)
80100161:	e8 3a 49 00 00       	call   80104aa0 <release>
      acquiresleep(&b->lock);
80100166:	8d 43 0c             	lea    0xc(%ebx),%eax
80100169:	89 04 24             	mov    %eax,(%esp)
8010016c:	e8 4f 46 00 00       	call   801047c0 <acquiresleep>
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100171:	f6 03 02             	testb  $0x2,(%ebx)
80100174:	75 08                	jne    8010017e <bread+0xae>
    iderw(b);
80100176:	89 1c 24             	mov    %ebx,(%esp)
80100179:	e8 d2 1f 00 00       	call   80102150 <iderw>
  }
  return b;
}
8010017e:	83 c4 1c             	add    $0x1c,%esp
80100181:	89 d8                	mov    %ebx,%eax
80100183:	5b                   	pop    %ebx
80100184:	5e                   	pop    %esi
80100185:	5f                   	pop    %edi
80100186:	5d                   	pop    %ebp
80100187:	c3                   	ret    
  panic("bget: no buffers");
80100188:	c7 04 24 ee 76 10 80 	movl   $0x801076ee,(%esp)
8010018f:	e8 cc 01 00 00       	call   80100360 <panic>
80100194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010019a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801001a0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 14             	sub    $0x14,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	89 04 24             	mov    %eax,(%esp)
801001b0:	e8 ab 46 00 00       	call   80104860 <holdingsleep>
801001b5:	85 c0                	test   %eax,%eax
801001b7:	74 10                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001b9:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001bf:	83 c4 14             	add    $0x14,%esp
801001c2:	5b                   	pop    %ebx
801001c3:	5d                   	pop    %ebp
  iderw(b);
801001c4:	e9 87 1f 00 00       	jmp    80102150 <iderw>
    panic("bwrite");
801001c9:	c7 04 24 ff 76 10 80 	movl   $0x801076ff,(%esp)
801001d0:	e8 8b 01 00 00       	call   80100360 <panic>
801001d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	83 ec 10             	sub    $0x10,%esp
801001e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	89 34 24             	mov    %esi,(%esp)
801001f1:	e8 6a 46 00 00       	call   80104860 <holdingsleep>
801001f6:	85 c0                	test   %eax,%eax
801001f8:	74 5b                	je     80100255 <brelse+0x75>
    panic("brelse");

  releasesleep(&b->lock);
801001fa:	89 34 24             	mov    %esi,(%esp)
801001fd:	e8 1e 46 00 00       	call   80104820 <releasesleep>

  acquire(&bcache.lock);
80100202:	c7 04 24 e0 c5 10 80 	movl   $0x8010c5e0,(%esp)
80100209:	e8 12 48 00 00       	call   80104a20 <acquire>
  b->refcnt--;
  if (b->refcnt == 0) {
8010020e:	83 6b 4c 01          	subl   $0x1,0x4c(%ebx)
80100212:	75 2f                	jne    80100243 <brelse+0x63>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100214:	8b 43 54             	mov    0x54(%ebx),%eax
80100217:	8b 53 50             	mov    0x50(%ebx),%edx
8010021a:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
8010021d:	8b 43 50             	mov    0x50(%ebx),%eax
80100220:	8b 53 54             	mov    0x54(%ebx),%edx
80100223:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100226:	a1 30 0d 11 80       	mov    0x80110d30,%eax
    b->prev = &bcache.head;
8010022b:	c7 43 50 dc 0c 11 80 	movl   $0x80110cdc,0x50(%ebx)
    b->next = bcache.head.next;
80100232:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
80100235:	a1 30 0d 11 80       	mov    0x80110d30,%eax
8010023a:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
8010023d:	89 1d 30 0d 11 80    	mov    %ebx,0x80110d30
  }
  
  release(&bcache.lock);
80100243:	c7 45 08 e0 c5 10 80 	movl   $0x8010c5e0,0x8(%ebp)
}
8010024a:	83 c4 10             	add    $0x10,%esp
8010024d:	5b                   	pop    %ebx
8010024e:	5e                   	pop    %esi
8010024f:	5d                   	pop    %ebp
  release(&bcache.lock);
80100250:	e9 4b 48 00 00       	jmp    80104aa0 <release>
    panic("brelse");
80100255:	c7 04 24 06 77 10 80 	movl   $0x80107706,(%esp)
8010025c:	e8 ff 00 00 00       	call   80100360 <panic>
80100261:	66 90                	xchg   %ax,%ax
80100263:	66 90                	xchg   %ax,%ax
80100265:	66 90                	xchg   %ax,%ax
80100267:	66 90                	xchg   %ax,%ax
80100269:	66 90                	xchg   %ax,%ax
8010026b:	66 90                	xchg   %ax,%ax
8010026d:	66 90                	xchg   %ax,%ax
8010026f:	90                   	nop

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 1c             	sub    $0x1c,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	89 3c 24             	mov    %edi,(%esp)
80100282:	e8 39 15 00 00       	call   801017c0 <iunlock>
  target = n;
  acquire(&cons.lock);
80100287:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010028e:	e8 8d 47 00 00       	call   80104a20 <acquire>
  while(n > 0){
80100293:	8b 55 10             	mov    0x10(%ebp),%edx
80100296:	85 d2                	test   %edx,%edx
80100298:	0f 8e bc 00 00 00    	jle    8010035a <consoleread+0xea>
8010029e:	8b 5d 10             	mov    0x10(%ebp),%ebx
801002a1:	eb 25                	jmp    801002c8 <consoleread+0x58>
801002a3:	90                   	nop
801002a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(input.r == input.w){
      if(myproc()->killed){
801002a8:	e8 83 34 00 00       	call   80103730 <myproc>
801002ad:	8b 40 24             	mov    0x24(%eax),%eax
801002b0:	85 c0                	test   %eax,%eax
801002b2:	75 74                	jne    80100328 <consoleread+0xb8>
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b4:	c7 44 24 04 20 b5 10 	movl   $0x8010b520,0x4(%esp)
801002bb:	80 
801002bc:	c7 04 24 c0 0f 11 80 	movl   $0x80110fc0,(%esp)
801002c3:	e8 78 3e 00 00       	call   80104140 <sleep>
    while(input.r == input.w){
801002c8:	a1 c0 0f 11 80       	mov    0x80110fc0,%eax
801002cd:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
801002d3:	74 d3                	je     801002a8 <consoleread+0x38>
    }
    c = input.buf[input.r++ % INPUT_BUF];
801002d5:	8d 50 01             	lea    0x1(%eax),%edx
801002d8:	89 15 c0 0f 11 80    	mov    %edx,0x80110fc0
801002de:	89 c2                	mov    %eax,%edx
801002e0:	83 e2 7f             	and    $0x7f,%edx
801002e3:	0f b6 8a 40 0f 11 80 	movzbl -0x7feef0c0(%edx),%ecx
801002ea:	0f be d1             	movsbl %cl,%edx
    if(c == C('D')){  // EOF
801002ed:	83 fa 04             	cmp    $0x4,%edx
801002f0:	74 57                	je     80100349 <consoleread+0xd9>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002f2:	83 c6 01             	add    $0x1,%esi
    --n;
801002f5:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
801002f8:	83 fa 0a             	cmp    $0xa,%edx
    *dst++ = c;
801002fb:	88 4e ff             	mov    %cl,-0x1(%esi)
    if(c == '\n')
801002fe:	74 53                	je     80100353 <consoleread+0xe3>
  while(n > 0){
80100300:	85 db                	test   %ebx,%ebx
80100302:	75 c4                	jne    801002c8 <consoleread+0x58>
80100304:	8b 45 10             	mov    0x10(%ebp),%eax
      break;
  }
  release(&cons.lock);
80100307:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010030e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100311:	e8 8a 47 00 00       	call   80104aa0 <release>
  ilock(ip);
80100316:	89 3c 24             	mov    %edi,(%esp)
80100319:	e8 c2 13 00 00       	call   801016e0 <ilock>
8010031e:	8b 45 e4             	mov    -0x1c(%ebp),%eax

  return target - n;
80100321:	eb 1e                	jmp    80100341 <consoleread+0xd1>
80100323:	90                   	nop
80100324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        release(&cons.lock);
80100328:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010032f:	e8 6c 47 00 00       	call   80104aa0 <release>
        ilock(ip);
80100334:	89 3c 24             	mov    %edi,(%esp)
80100337:	e8 a4 13 00 00       	call   801016e0 <ilock>
        return -1;
8010033c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100341:	83 c4 1c             	add    $0x1c,%esp
80100344:	5b                   	pop    %ebx
80100345:	5e                   	pop    %esi
80100346:	5f                   	pop    %edi
80100347:	5d                   	pop    %ebp
80100348:	c3                   	ret    
      if(n < target){
80100349:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010034c:	76 05                	jbe    80100353 <consoleread+0xe3>
        input.r--;
8010034e:	a3 c0 0f 11 80       	mov    %eax,0x80110fc0
80100353:	8b 45 10             	mov    0x10(%ebp),%eax
80100356:	29 d8                	sub    %ebx,%eax
80100358:	eb ad                	jmp    80100307 <consoleread+0x97>
  while(n > 0){
8010035a:	31 c0                	xor    %eax,%eax
8010035c:	eb a9                	jmp    80100307 <consoleread+0x97>
8010035e:	66 90                	xchg   %ax,%ax

80100360 <panic>:
{
80100360:	55                   	push   %ebp
80100361:	89 e5                	mov    %esp,%ebp
80100363:	56                   	push   %esi
80100364:	53                   	push   %ebx
80100365:	83 ec 40             	sub    $0x40,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100368:	fa                   	cli    
  cons.locking = 0;
80100369:	c7 05 54 b5 10 80 00 	movl   $0x0,0x8010b554
80100370:	00 00 00 
  getcallerpcs(&s, pcs);
80100373:	8d 5d d0             	lea    -0x30(%ebp),%ebx
  cprintf("lapicid %d: panic: ", lapicid());
80100376:	e8 05 24 00 00       	call   80102780 <lapicid>
8010037b:	8d 75 f8             	lea    -0x8(%ebp),%esi
8010037e:	c7 04 24 0d 77 10 80 	movl   $0x8010770d,(%esp)
80100385:	89 44 24 04          	mov    %eax,0x4(%esp)
80100389:	e8 c2 02 00 00       	call   80100650 <cprintf>
  cprintf(s);
8010038e:	8b 45 08             	mov    0x8(%ebp),%eax
80100391:	89 04 24             	mov    %eax,(%esp)
80100394:	e8 b7 02 00 00       	call   80100650 <cprintf>
  cprintf("\n");
80100399:	c7 04 24 37 83 10 80 	movl   $0x80108337,(%esp)
801003a0:	e8 ab 02 00 00       	call   80100650 <cprintf>
  getcallerpcs(&s, pcs);
801003a5:	8d 45 08             	lea    0x8(%ebp),%eax
801003a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801003ac:	89 04 24             	mov    %eax,(%esp)
801003af:	e8 1c 45 00 00       	call   801048d0 <getcallerpcs>
801003b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf(" %p", pcs[i]);
801003b8:	8b 03                	mov    (%ebx),%eax
801003ba:	83 c3 04             	add    $0x4,%ebx
801003bd:	c7 04 24 21 77 10 80 	movl   $0x80107721,(%esp)
801003c4:	89 44 24 04          	mov    %eax,0x4(%esp)
801003c8:	e8 83 02 00 00       	call   80100650 <cprintf>
  for(i=0; i<10; i++)
801003cd:	39 f3                	cmp    %esi,%ebx
801003cf:	75 e7                	jne    801003b8 <panic+0x58>
  panicked = 1; // freeze other CPU
801003d1:	c7 05 58 b5 10 80 01 	movl   $0x1,0x8010b558
801003d8:	00 00 00 
801003db:	eb fe                	jmp    801003db <panic+0x7b>
801003dd:	8d 76 00             	lea    0x0(%esi),%esi

801003e0 <consputc>:
  if(panicked){
801003e0:	8b 15 58 b5 10 80    	mov    0x8010b558,%edx
801003e6:	85 d2                	test   %edx,%edx
801003e8:	74 06                	je     801003f0 <consputc+0x10>
801003ea:	fa                   	cli    
801003eb:	eb fe                	jmp    801003eb <consputc+0xb>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi
{
801003f0:	55                   	push   %ebp
801003f1:	89 e5                	mov    %esp,%ebp
801003f3:	57                   	push   %edi
801003f4:	56                   	push   %esi
801003f5:	53                   	push   %ebx
801003f6:	89 c3                	mov    %eax,%ebx
801003f8:	83 ec 1c             	sub    $0x1c,%esp
  if(c == BACKSPACE){
801003fb:	3d 00 01 00 00       	cmp    $0x100,%eax
80100400:	0f 84 ac 00 00 00    	je     801004b2 <consputc+0xd2>
    uartputc(c);
80100406:	89 04 24             	mov    %eax,(%esp)
80100409:	e8 32 5e 00 00       	call   80106240 <uartputc>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010040e:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100413:	b8 0e 00 00 00       	mov    $0xe,%eax
80100418:	89 fa                	mov    %edi,%edx
8010041a:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010041b:	be d5 03 00 00       	mov    $0x3d5,%esi
80100420:	89 f2                	mov    %esi,%edx
80100422:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100423:	0f b6 c8             	movzbl %al,%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100426:	89 fa                	mov    %edi,%edx
80100428:	c1 e1 08             	shl    $0x8,%ecx
8010042b:	b8 0f 00 00 00       	mov    $0xf,%eax
80100430:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100431:	89 f2                	mov    %esi,%edx
80100433:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
80100434:	0f b6 c0             	movzbl %al,%eax
80100437:	09 c1                	or     %eax,%ecx
  if(c == '\n')
80100439:	83 fb 0a             	cmp    $0xa,%ebx
8010043c:	0f 84 0d 01 00 00    	je     8010054f <consputc+0x16f>
  else if(c == BACKSPACE){
80100442:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
80100448:	0f 84 e8 00 00 00    	je     80100536 <consputc+0x156>
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010044e:	0f b6 db             	movzbl %bl,%ebx
80100451:	80 cf 07             	or     $0x7,%bh
80100454:	8d 79 01             	lea    0x1(%ecx),%edi
80100457:	66 89 9c 09 00 80 0b 	mov    %bx,-0x7ff48000(%ecx,%ecx,1)
8010045e:	80 
  if(pos < 0 || pos > 25*80)
8010045f:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
80100465:	0f 87 bf 00 00 00    	ja     8010052a <consputc+0x14a>
  if((pos/80) >= 24){  // Scroll up.
8010046b:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100471:	7f 68                	jg     801004db <consputc+0xfb>
80100473:	89 f8                	mov    %edi,%eax
80100475:	89 fb                	mov    %edi,%ebx
80100477:	c1 e8 08             	shr    $0x8,%eax
8010047a:	89 c6                	mov    %eax,%esi
8010047c:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100483:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100488:	b8 0e 00 00 00       	mov    $0xe,%eax
8010048d:	89 fa                	mov    %edi,%edx
8010048f:	ee                   	out    %al,(%dx)
80100490:	89 f0                	mov    %esi,%eax
80100492:	b2 d5                	mov    $0xd5,%dl
80100494:	ee                   	out    %al,(%dx)
80100495:	b8 0f 00 00 00       	mov    $0xf,%eax
8010049a:	89 fa                	mov    %edi,%edx
8010049c:	ee                   	out    %al,(%dx)
8010049d:	89 d8                	mov    %ebx,%eax
8010049f:	b2 d5                	mov    $0xd5,%dl
801004a1:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004a2:	b8 20 07 00 00       	mov    $0x720,%eax
801004a7:	66 89 01             	mov    %ax,(%ecx)
}
801004aa:	83 c4 1c             	add    $0x1c,%esp
801004ad:	5b                   	pop    %ebx
801004ae:	5e                   	pop    %esi
801004af:	5f                   	pop    %edi
801004b0:	5d                   	pop    %ebp
801004b1:	c3                   	ret    
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004b2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004b9:	e8 82 5d 00 00       	call   80106240 <uartputc>
801004be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004c5:	e8 76 5d 00 00       	call   80106240 <uartputc>
801004ca:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004d1:	e8 6a 5d 00 00       	call   80106240 <uartputc>
801004d6:	e9 33 ff ff ff       	jmp    8010040e <consputc+0x2e>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004db:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
801004e2:	00 
    pos -= 80;
801004e3:	8d 5f b0             	lea    -0x50(%edi),%ebx
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004e6:	c7 44 24 04 a0 80 0b 	movl   $0x800b80a0,0x4(%esp)
801004ed:	80 
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004ee:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f5:	c7 04 24 00 80 0b 80 	movl   $0x800b8000,(%esp)
801004fc:	e8 9f 46 00 00       	call   80104ba0 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100501:	b8 d0 07 00 00       	mov    $0x7d0,%eax
80100506:	29 f8                	sub    %edi,%eax
80100508:	01 c0                	add    %eax,%eax
8010050a:	89 34 24             	mov    %esi,(%esp)
8010050d:	89 44 24 08          	mov    %eax,0x8(%esp)
80100511:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100518:	00 
80100519:	e8 e2 45 00 00       	call   80104b00 <memset>
8010051e:	89 f1                	mov    %esi,%ecx
80100520:	be 07 00 00 00       	mov    $0x7,%esi
80100525:	e9 59 ff ff ff       	jmp    80100483 <consputc+0xa3>
    panic("pos under/overflow");
8010052a:	c7 04 24 25 77 10 80 	movl   $0x80107725,(%esp)
80100531:	e8 2a fe ff ff       	call   80100360 <panic>
    if(pos > 0) --pos;
80100536:	85 c9                	test   %ecx,%ecx
80100538:	8d 79 ff             	lea    -0x1(%ecx),%edi
8010053b:	0f 85 1e ff ff ff    	jne    8010045f <consputc+0x7f>
80100541:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
80100546:	31 db                	xor    %ebx,%ebx
80100548:	31 f6                	xor    %esi,%esi
8010054a:	e9 34 ff ff ff       	jmp    80100483 <consputc+0xa3>
    pos += 80 - pos%80;
8010054f:	89 c8                	mov    %ecx,%eax
80100551:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100556:	f7 ea                	imul   %edx
80100558:	c1 ea 05             	shr    $0x5,%edx
8010055b:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010055e:	c1 e0 04             	shl    $0x4,%eax
80100561:	8d 78 50             	lea    0x50(%eax),%edi
80100564:	e9 f6 fe ff ff       	jmp    8010045f <consputc+0x7f>
80100569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100570 <printint>:
{
80100570:	55                   	push   %ebp
80100571:	89 e5                	mov    %esp,%ebp
80100573:	57                   	push   %edi
80100574:	56                   	push   %esi
80100575:	89 d6                	mov    %edx,%esi
80100577:	53                   	push   %ebx
80100578:	83 ec 1c             	sub    $0x1c,%esp
  if(sign && (sign = xx < 0))
8010057b:	85 c9                	test   %ecx,%ecx
8010057d:	74 61                	je     801005e0 <printint+0x70>
8010057f:	85 c0                	test   %eax,%eax
80100581:	79 5d                	jns    801005e0 <printint+0x70>
    x = -xx;
80100583:	f7 d8                	neg    %eax
80100585:	bf 01 00 00 00       	mov    $0x1,%edi
  i = 0;
8010058a:	31 c9                	xor    %ecx,%ecx
8010058c:	eb 04                	jmp    80100592 <printint+0x22>
8010058e:	66 90                	xchg   %ax,%ax
    buf[i++] = digits[x % base];
80100590:	89 d9                	mov    %ebx,%ecx
80100592:	31 d2                	xor    %edx,%edx
80100594:	f7 f6                	div    %esi
80100596:	8d 59 01             	lea    0x1(%ecx),%ebx
80100599:	0f b6 92 50 77 10 80 	movzbl -0x7fef88b0(%edx),%edx
  }while((x /= base) != 0);
801005a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
801005a2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
  }while((x /= base) != 0);
801005a6:	75 e8                	jne    80100590 <printint+0x20>
  if(sign)
801005a8:	85 ff                	test   %edi,%edi
    buf[i++] = digits[x % base];
801005aa:	89 d8                	mov    %ebx,%eax
  if(sign)
801005ac:	74 08                	je     801005b6 <printint+0x46>
    buf[i++] = '-';
801005ae:	8d 59 02             	lea    0x2(%ecx),%ebx
801005b1:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
  while(--i >= 0)
801005b6:	83 eb 01             	sub    $0x1,%ebx
801005b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    consputc(buf[i]);
801005c0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
  while(--i >= 0)
801005c5:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
801005c8:	e8 13 fe ff ff       	call   801003e0 <consputc>
  while(--i >= 0)
801005cd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005d0:	75 ee                	jne    801005c0 <printint+0x50>
}
801005d2:	83 c4 1c             	add    $0x1c,%esp
801005d5:	5b                   	pop    %ebx
801005d6:	5e                   	pop    %esi
801005d7:	5f                   	pop    %edi
801005d8:	5d                   	pop    %ebp
801005d9:	c3                   	ret    
801005da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    x = xx;
801005e0:	31 ff                	xor    %edi,%edi
801005e2:	eb a6                	jmp    8010058a <printint+0x1a>
801005e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801005f0 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005f0:	55                   	push   %ebp
801005f1:	89 e5                	mov    %esp,%ebp
801005f3:	57                   	push   %edi
801005f4:	56                   	push   %esi
801005f5:	53                   	push   %ebx
801005f6:	83 ec 1c             	sub    $0x1c,%esp
  int i;

  iunlock(ip);
801005f9:	8b 45 08             	mov    0x8(%ebp),%eax
{
801005fc:	8b 75 10             	mov    0x10(%ebp),%esi
  iunlock(ip);
801005ff:	89 04 24             	mov    %eax,(%esp)
80100602:	e8 b9 11 00 00       	call   801017c0 <iunlock>
  acquire(&cons.lock);
80100607:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010060e:	e8 0d 44 00 00       	call   80104a20 <acquire>
80100613:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100616:	85 f6                	test   %esi,%esi
80100618:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010061b:	7e 12                	jle    8010062f <consolewrite+0x3f>
8010061d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100620:	0f b6 07             	movzbl (%edi),%eax
80100623:	83 c7 01             	add    $0x1,%edi
80100626:	e8 b5 fd ff ff       	call   801003e0 <consputc>
  for(i = 0; i < n; i++)
8010062b:	39 df                	cmp    %ebx,%edi
8010062d:	75 f1                	jne    80100620 <consolewrite+0x30>
  release(&cons.lock);
8010062f:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
80100636:	e8 65 44 00 00       	call   80104aa0 <release>
  ilock(ip);
8010063b:	8b 45 08             	mov    0x8(%ebp),%eax
8010063e:	89 04 24             	mov    %eax,(%esp)
80100641:	e8 9a 10 00 00       	call   801016e0 <ilock>

  return n;
}
80100646:	83 c4 1c             	add    $0x1c,%esp
80100649:	89 f0                	mov    %esi,%eax
8010064b:	5b                   	pop    %ebx
8010064c:	5e                   	pop    %esi
8010064d:	5f                   	pop    %edi
8010064e:	5d                   	pop    %ebp
8010064f:	c3                   	ret    

80100650 <cprintf>:
{
80100650:	55                   	push   %ebp
80100651:	89 e5                	mov    %esp,%ebp
80100653:	57                   	push   %edi
80100654:	56                   	push   %esi
80100655:	53                   	push   %ebx
80100656:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
80100659:	a1 54 b5 10 80       	mov    0x8010b554,%eax
  if(locking)
8010065e:	85 c0                	test   %eax,%eax
  locking = cons.locking;
80100660:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100663:	0f 85 77 01 00 00    	jne    801007e0 <cprintf+0x190>
  if (fmt == 0)
80100669:	8b 45 08             	mov    0x8(%ebp),%eax
8010066c:	85 c0                	test   %eax,%eax
8010066e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100671:	0f 84 7a 01 00 00    	je     801007f1 <cprintf+0x1a1>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100677:	0f b6 00             	movzbl (%eax),%eax
8010067a:	31 db                	xor    %ebx,%ebx
8010067c:	8d 75 0c             	lea    0xc(%ebp),%esi
8010067f:	85 c0                	test   %eax,%eax
80100681:	75 5b                	jne    801006de <cprintf+0x8e>
80100683:	eb 71                	jmp    801006f6 <cprintf+0xa6>
80100685:	8d 76 00             	lea    0x0(%esi),%esi
    c = fmt[++i] & 0xff;
80100688:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010068b:	83 c3 01             	add    $0x1,%ebx
8010068e:	0f b6 3c 18          	movzbl (%eax,%ebx,1),%edi
    if(c == 0)
80100692:	85 ff                	test   %edi,%edi
80100694:	74 60                	je     801006f6 <cprintf+0xa6>
    switch(c){
80100696:	83 ff 70             	cmp    $0x70,%edi
80100699:	0f 84 c1 00 00 00    	je     80100760 <cprintf+0x110>
8010069f:	7f 77                	jg     80100718 <cprintf+0xc8>
801006a1:	83 ff 63             	cmp    $0x63,%edi
801006a4:	0f 84 1e 01 00 00    	je     801007c8 <cprintf+0x178>
801006aa:	83 ff 64             	cmp    $0x64,%edi
801006ad:	8d 76 00             	lea    0x0(%esi),%esi
801006b0:	0f 84 f2 00 00 00    	je     801007a8 <cprintf+0x158>
801006b6:	83 ff 25             	cmp    $0x25,%edi
801006b9:	0f 85 d1 00 00 00    	jne    80100790 <cprintf+0x140>
      consputc('%');
801006bf:	b8 25 00 00 00       	mov    $0x25,%eax
801006c4:	e8 17 fd ff ff       	call   801003e0 <consputc>
801006c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006d3:	83 c3 01             	add    $0x1,%ebx
801006d6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
801006da:	85 c0                	test   %eax,%eax
801006dc:	74 18                	je     801006f6 <cprintf+0xa6>
    if(c != '%'){
801006de:	83 f8 25             	cmp    $0x25,%eax
801006e1:	74 a5                	je     80100688 <cprintf+0x38>
      consputc(c);
801006e3:	e8 f8 fc ff ff       	call   801003e0 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006eb:	83 c3 01             	add    $0x1,%ebx
801006ee:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
801006f2:	85 c0                	test   %eax,%eax
801006f4:	75 e8                	jne    801006de <cprintf+0x8e>
  if(locking)
801006f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006f9:	85 c0                	test   %eax,%eax
801006fb:	74 0c                	je     80100709 <cprintf+0xb9>
    release(&cons.lock);
801006fd:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
80100704:	e8 97 43 00 00       	call   80104aa0 <release>
}
80100709:	83 c4 1c             	add    $0x1c,%esp
8010070c:	5b                   	pop    %ebx
8010070d:	5e                   	pop    %esi
8010070e:	5f                   	pop    %edi
8010070f:	5d                   	pop    %ebp
80100710:	c3                   	ret    
80100711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100718:	83 ff 75             	cmp    $0x75,%edi
8010071b:	0f 84 87 00 00 00    	je     801007a8 <cprintf+0x158>
80100721:	83 ff 78             	cmp    $0x78,%edi
80100724:	74 3a                	je     80100760 <cprintf+0x110>
80100726:	83 ff 73             	cmp    $0x73,%edi
80100729:	75 65                	jne    80100790 <cprintf+0x140>
      if((s = (char*)*argp++) == 0)
8010072b:	8d 7e 04             	lea    0x4(%esi),%edi
8010072e:	8b 36                	mov    (%esi),%esi
        s = "(null)";
80100730:	b8 38 77 10 80       	mov    $0x80107738,%eax
80100735:	85 f6                	test   %esi,%esi
80100737:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
8010073a:	0f be 06             	movsbl (%esi),%eax
8010073d:	84 c0                	test   %al,%al
8010073f:	74 16                	je     80100757 <cprintf+0x107>
80100741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100748:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
8010074b:	e8 90 fc ff ff       	call   801003e0 <consputc>
      for(; *s; s++)
80100750:	0f be 06             	movsbl (%esi),%eax
80100753:	84 c0                	test   %al,%al
80100755:	75 f1                	jne    80100748 <cprintf+0xf8>
      if((s = (char*)*argp++) == 0)
80100757:	89 fe                	mov    %edi,%esi
80100759:	e9 72 ff ff ff       	jmp    801006d0 <cprintf+0x80>
8010075e:	66 90                	xchg   %ax,%ax
      consputc('0');
80100760:	b8 30 00 00 00       	mov    $0x30,%eax
80100765:	e8 76 fc ff ff       	call   801003e0 <consputc>
      consputc('x');
8010076a:	b8 78 00 00 00       	mov    $0x78,%eax
8010076f:	e8 6c fc ff ff       	call   801003e0 <consputc>
      printint(*argp++, 16, 0);
80100774:	8b 06                	mov    (%esi),%eax
80100776:	8d 7e 04             	lea    0x4(%esi),%edi
80100779:	31 c9                	xor    %ecx,%ecx
8010077b:	ba 10 00 00 00       	mov    $0x10,%edx
80100780:	89 fe                	mov    %edi,%esi
80100782:	e8 e9 fd ff ff       	call   80100570 <printint>
      break;
80100787:	e9 44 ff ff ff       	jmp    801006d0 <cprintf+0x80>
8010078c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      consputc('%');
80100790:	b8 25 00 00 00       	mov    $0x25,%eax
80100795:	e8 46 fc ff ff       	call   801003e0 <consputc>
      consputc(c);
8010079a:	89 f8                	mov    %edi,%eax
8010079c:	e8 3f fc ff ff       	call   801003e0 <consputc>
801007a1:	e9 42 ff ff ff       	jmp    801006e8 <cprintf+0x98>
801007a6:	66 90                	xchg   %ax,%ax
      printint(*argp++, 10, 1);
801007a8:	8b 06                	mov    (%esi),%eax
801007aa:	8d 7e 04             	lea    0x4(%esi),%edi
801007ad:	b9 01 00 00 00       	mov    $0x1,%ecx
801007b2:	ba 0a 00 00 00       	mov    $0xa,%edx
801007b7:	89 fe                	mov    %edi,%esi
801007b9:	e8 b2 fd ff ff       	call   80100570 <printint>
      break;
801007be:	e9 0d ff ff ff       	jmp    801006d0 <cprintf+0x80>
801007c3:	90                   	nop
801007c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        consputc(*argp++);
801007c8:	8b 06                	mov    (%esi),%eax
801007ca:	8d 7e 04             	lea    0x4(%esi),%edi
801007cd:	89 fe                	mov    %edi,%esi
801007cf:	e8 0c fc ff ff       	call   801003e0 <consputc>
        break;
801007d4:	e9 f7 fe ff ff       	jmp    801006d0 <cprintf+0x80>
801007d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
801007e0:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
801007e7:	e8 34 42 00 00       	call   80104a20 <acquire>
801007ec:	e9 78 fe ff ff       	jmp    80100669 <cprintf+0x19>
    panic("null fmt");
801007f1:	c7 04 24 3f 77 10 80 	movl   $0x8010773f,(%esp)
801007f8:	e8 63 fb ff ff       	call   80100360 <panic>
801007fd:	8d 76 00             	lea    0x0(%esi),%esi

80100800 <consoleintr>:
{
80100800:	55                   	push   %ebp
80100801:	89 e5                	mov    %esp,%ebp
80100803:	57                   	push   %edi
80100804:	56                   	push   %esi
  int c, doprocdump = 0;
80100805:	31 f6                	xor    %esi,%esi
{
80100807:	53                   	push   %ebx
80100808:	83 ec 1c             	sub    $0x1c,%esp
8010080b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&cons.lock);
8010080e:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
80100815:	e8 06 42 00 00       	call   80104a20 <acquire>
8010081a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while((c = getc()) >= 0){
80100820:	ff d3                	call   *%ebx
80100822:	85 c0                	test   %eax,%eax
80100824:	89 c7                	mov    %eax,%edi
80100826:	78 48                	js     80100870 <consoleintr+0x70>
    switch(c){
80100828:	83 ff 10             	cmp    $0x10,%edi
8010082b:	0f 84 2f 01 00 00    	je     80100960 <consoleintr+0x160>
80100831:	7e 5d                	jle    80100890 <consoleintr+0x90>
80100833:	83 ff 15             	cmp    $0x15,%edi
80100836:	0f 84 d4 00 00 00    	je     80100910 <consoleintr+0x110>
8010083c:	83 ff 7f             	cmp    $0x7f,%edi
8010083f:	90                   	nop
80100840:	75 53                	jne    80100895 <consoleintr+0x95>
      if(input.e != input.w){
80100842:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100847:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
8010084d:	74 d1                	je     80100820 <consoleintr+0x20>
        input.e--;
8010084f:	83 e8 01             	sub    $0x1,%eax
80100852:	a3 c8 0f 11 80       	mov    %eax,0x80110fc8
        consputc(BACKSPACE);
80100857:	b8 00 01 00 00       	mov    $0x100,%eax
8010085c:	e8 7f fb ff ff       	call   801003e0 <consputc>
  while((c = getc()) >= 0){
80100861:	ff d3                	call   *%ebx
80100863:	85 c0                	test   %eax,%eax
80100865:	89 c7                	mov    %eax,%edi
80100867:	79 bf                	jns    80100828 <consoleintr+0x28>
80100869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&cons.lock);
80100870:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
80100877:	e8 24 42 00 00       	call   80104aa0 <release>
  if(doprocdump) {
8010087c:	85 f6                	test   %esi,%esi
8010087e:	0f 85 ec 00 00 00    	jne    80100970 <consoleintr+0x170>
}
80100884:	83 c4 1c             	add    $0x1c,%esp
80100887:	5b                   	pop    %ebx
80100888:	5e                   	pop    %esi
80100889:	5f                   	pop    %edi
8010088a:	5d                   	pop    %ebp
8010088b:	c3                   	ret    
8010088c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    switch(c){
80100890:	83 ff 08             	cmp    $0x8,%edi
80100893:	74 ad                	je     80100842 <consoleintr+0x42>
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100895:	85 ff                	test   %edi,%edi
80100897:	74 87                	je     80100820 <consoleintr+0x20>
80100899:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
8010089e:	89 c2                	mov    %eax,%edx
801008a0:	2b 15 c0 0f 11 80    	sub    0x80110fc0,%edx
801008a6:	83 fa 7f             	cmp    $0x7f,%edx
801008a9:	0f 87 71 ff ff ff    	ja     80100820 <consoleintr+0x20>
        input.buf[input.e++ % INPUT_BUF] = c;
801008af:	8d 50 01             	lea    0x1(%eax),%edx
801008b2:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
801008b5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008b8:	89 15 c8 0f 11 80    	mov    %edx,0x80110fc8
        c = (c == '\r') ? '\n' : c;
801008be:	0f 84 b8 00 00 00    	je     8010097c <consoleintr+0x17c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008c4:	89 f9                	mov    %edi,%ecx
801008c6:	88 88 40 0f 11 80    	mov    %cl,-0x7feef0c0(%eax)
        consputc(c);
801008cc:	89 f8                	mov    %edi,%eax
801008ce:	e8 0d fb ff ff       	call   801003e0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008d3:	83 ff 04             	cmp    $0x4,%edi
801008d6:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
801008db:	74 19                	je     801008f6 <consoleintr+0xf6>
801008dd:	83 ff 0a             	cmp    $0xa,%edi
801008e0:	74 14                	je     801008f6 <consoleintr+0xf6>
801008e2:	8b 0d c0 0f 11 80    	mov    0x80110fc0,%ecx
801008e8:	8d 91 80 00 00 00    	lea    0x80(%ecx),%edx
801008ee:	39 d0                	cmp    %edx,%eax
801008f0:	0f 85 2a ff ff ff    	jne    80100820 <consoleintr+0x20>
          wakeup(&input.r);
801008f6:	c7 04 24 c0 0f 11 80 	movl   $0x80110fc0,(%esp)
          input.w = input.e;
801008fd:	a3 c4 0f 11 80       	mov    %eax,0x80110fc4
          wakeup(&input.r);
80100902:	e8 09 3a 00 00       	call   80104310 <wakeup>
80100907:	e9 14 ff ff ff       	jmp    80100820 <consoleintr+0x20>
8010090c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      while(input.e != input.w &&
80100910:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100915:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
8010091b:	75 2b                	jne    80100948 <consoleintr+0x148>
8010091d:	e9 fe fe ff ff       	jmp    80100820 <consoleintr+0x20>
80100922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        input.e--;
80100928:	a3 c8 0f 11 80       	mov    %eax,0x80110fc8
        consputc(BACKSPACE);
8010092d:	b8 00 01 00 00       	mov    $0x100,%eax
80100932:	e8 a9 fa ff ff       	call   801003e0 <consputc>
      while(input.e != input.w &&
80100937:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
8010093c:	3b 05 c4 0f 11 80    	cmp    0x80110fc4,%eax
80100942:	0f 84 d8 fe ff ff    	je     80100820 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100948:	83 e8 01             	sub    $0x1,%eax
8010094b:	89 c2                	mov    %eax,%edx
8010094d:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100950:	80 ba 40 0f 11 80 0a 	cmpb   $0xa,-0x7feef0c0(%edx)
80100957:	75 cf                	jne    80100928 <consoleintr+0x128>
80100959:	e9 c2 fe ff ff       	jmp    80100820 <consoleintr+0x20>
8010095e:	66 90                	xchg   %ax,%ax
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 b6 fe ff ff       	jmp    80100820 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
}
80100970:	83 c4 1c             	add    $0x1c,%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 c4 3c 00 00       	jmp    80104640 <procdump>
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 40 0f 11 80 0a 	movb   $0xa,-0x7feef0c0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 53 fa ff ff       	call   801003e0 <consputc>
8010098d:	a1 c8 0f 11 80       	mov    0x80110fc8,%eax
80100992:	e9 5f ff ff ff       	jmp    801008f6 <consoleintr+0xf6>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
801009a6:	c7 44 24 04 48 77 10 	movl   $0x80107748,0x4(%esp)
801009ad:	80 
801009ae:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
801009b5:	e8 f6 3e 00 00       	call   801048b0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801009c1:	00 
801009c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  devsw[CONSOLE].write = consolewrite;
801009c9:	c7 05 8c 19 11 80 f0 	movl   $0x801005f0,0x8011198c
801009d0:	05 10 80 
  devsw[CONSOLE].read = consoleread;
801009d3:	c7 05 88 19 11 80 70 	movl   $0x80100270,0x80111988
801009da:	02 10 80 
  cons.locking = 1;
801009dd:	c7 05 54 b5 10 80 01 	movl   $0x1,0x8010b554
801009e4:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
801009e7:	e8 f4 18 00 00       	call   801022e0 <ioapicenable>
}
801009ec:	c9                   	leave  
801009ed:	c3                   	ret    
801009ee:	66 90                	xchg   %ax,%ax

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 2c 01 00 00    	sub    $0x12c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009fc:	e8 2f 2d 00 00       	call   80103730 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a07:	e8 24 21 00 00       	call   80102b30 <begin_op>

  if((ip = namei(path)) == 0){
80100a0c:	8b 45 08             	mov    0x8(%ebp),%eax
80100a0f:	89 04 24             	mov    %eax,(%esp)
80100a12:	e8 19 15 00 00       	call   80101f30 <namei>
80100a17:	85 c0                	test   %eax,%eax
80100a19:	89 c3                	mov    %eax,%ebx
80100a1b:	74 37                	je     80100a54 <exec+0x64>
    end_op();
    //cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a1d:	89 04 24             	mov    %eax,(%esp)
80100a20:	e8 bb 0c 00 00       	call   801016e0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a25:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a2b:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
80100a32:	00 
80100a33:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80100a3a:	00 
80100a3b:	89 44 24 04          	mov    %eax,0x4(%esp)
80100a3f:	89 1c 24             	mov    %ebx,(%esp)
80100a42:	e8 49 0f 00 00       	call   80101990 <readi>
80100a47:	83 f8 34             	cmp    $0x34,%eax
80100a4a:	74 24                	je     80100a70 <exec+0x80>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a4c:	89 1c 24             	mov    %ebx,(%esp)
80100a4f:	e8 ec 0e 00 00       	call   80101940 <iunlockput>
    end_op();
80100a54:	e8 47 21 00 00       	call   80102ba0 <end_op>
  }
  return -1;
80100a59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a5e:	81 c4 2c 01 00 00    	add    $0x12c,%esp
80100a64:	5b                   	pop    %ebx
80100a65:	5e                   	pop    %esi
80100a66:	5f                   	pop    %edi
80100a67:	5d                   	pop    %ebp
80100a68:	c3                   	ret    
80100a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(elf.magic != ELF_MAGIC)
80100a70:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a77:	45 4c 46 
80100a7a:	75 d0                	jne    80100a4c <exec+0x5c>
  if((pgdir = setupkvm()) == 0)
80100a7c:	e8 af 69 00 00       	call   80107430 <setupkvm>
80100a81:	85 c0                	test   %eax,%eax
80100a83:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a89:	74 c1                	je     80100a4c <exec+0x5c>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a8b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a92:	00 
80100a93:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
  sz = 0;
80100a99:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100aa0:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100aa3:	0f 84 da 00 00 00    	je     80100b83 <exec+0x193>
80100aa9:	31 ff                	xor    %edi,%edi
80100aab:	eb 18                	jmp    80100ac5 <exec+0xd5>
80100aad:	8d 76 00             	lea    0x0(%esi),%esi
80100ab0:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100ab7:	83 c7 01             	add    $0x1,%edi
80100aba:	83 c6 20             	add    $0x20,%esi
80100abd:	39 f8                	cmp    %edi,%eax
80100abf:	0f 8e be 00 00 00    	jle    80100b83 <exec+0x193>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100ac5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100acb:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100ad2:	00 
80100ad3:	89 74 24 08          	mov    %esi,0x8(%esp)
80100ad7:	89 44 24 04          	mov    %eax,0x4(%esp)
80100adb:	89 1c 24             	mov    %ebx,(%esp)
80100ade:	e8 ad 0e 00 00       	call   80101990 <readi>
80100ae3:	83 f8 20             	cmp    $0x20,%eax
80100ae6:	0f 85 84 00 00 00    	jne    80100b70 <exec+0x180>
    if(ph.type != ELF_PROG_LOAD)
80100aec:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100af3:	75 bb                	jne    80100ab0 <exec+0xc0>
    if(ph.memsz < ph.filesz)
80100af5:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100afb:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b01:	72 6d                	jb     80100b70 <exec+0x180>
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100b03:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b09:	72 65                	jb     80100b70 <exec+0x180>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b0b:	89 44 24 08          	mov    %eax,0x8(%esp)
80100b0f:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b15:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b19:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b1f:	89 04 24             	mov    %eax,(%esp)
80100b22:	e8 79 67 00 00       	call   801072a0 <allocuvm>
80100b27:	85 c0                	test   %eax,%eax
80100b29:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b2f:	74 3f                	je     80100b70 <exec+0x180>
    if(ph.vaddr % PGSIZE != 0)
80100b31:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b37:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b3c:	75 32                	jne    80100b70 <exec+0x180>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b3e:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
80100b44:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b48:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b4e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80100b52:	89 54 24 10          	mov    %edx,0x10(%esp)
80100b56:	8b 95 08 ff ff ff    	mov    -0xf8(%ebp),%edx
80100b5c:	89 04 24             	mov    %eax,(%esp)
80100b5f:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100b63:	e8 78 66 00 00       	call   801071e0 <loaduvm>
80100b68:	85 c0                	test   %eax,%eax
80100b6a:	0f 89 40 ff ff ff    	jns    80100ab0 <exec+0xc0>
    freevm(pgdir);
80100b70:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b76:	89 04 24             	mov    %eax,(%esp)
80100b79:	e8 32 68 00 00       	call   801073b0 <freevm>
80100b7e:	e9 c9 fe ff ff       	jmp    80100a4c <exec+0x5c>
  iunlockput(ip);
80100b83:	89 1c 24             	mov    %ebx,(%esp)
80100b86:	e8 b5 0d 00 00       	call   80101940 <iunlockput>
80100b8b:	90                   	nop
80100b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  end_op();
80100b90:	e8 0b 20 00 00       	call   80102ba0 <end_op>
  sz = PGROUNDUP(sz);
80100b95:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b9b:	05 ff 0f 00 00       	add    $0xfff,%eax
80100ba0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100ba5:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100bab:	89 44 24 04          	mov    %eax,0x4(%esp)
80100baf:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100bb5:	89 54 24 08          	mov    %edx,0x8(%esp)
80100bb9:	89 04 24             	mov    %eax,(%esp)
80100bbc:	e8 df 66 00 00       	call   801072a0 <allocuvm>
80100bc1:	85 c0                	test   %eax,%eax
80100bc3:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
80100bc9:	75 18                	jne    80100be3 <exec+0x1f3>
    freevm(pgdir);
80100bcb:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100bd1:	89 04 24             	mov    %eax,(%esp)
80100bd4:	e8 d7 67 00 00       	call   801073b0 <freevm>
  return -1;
80100bd9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bde:	e9 7b fe ff ff       	jmp    80100a5e <exec+0x6e>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100be3:	8b 9d e8 fe ff ff    	mov    -0x118(%ebp),%ebx
80100be9:	89 d8                	mov    %ebx,%eax
80100beb:	2d 00 20 00 00       	sub    $0x2000,%eax
80100bf0:	89 44 24 04          	mov    %eax,0x4(%esp)
80100bf4:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100bfa:	89 04 24             	mov    %eax,(%esp)
80100bfd:	e8 de 68 00 00       	call   801074e0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c02:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c05:	8b 00                	mov    (%eax),%eax
80100c07:	85 c0                	test   %eax,%eax
80100c09:	0f 84 5c 01 00 00    	je     80100d6b <exec+0x37b>
80100c0f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80100c12:	31 d2                	xor    %edx,%edx
80100c14:	8d 71 04             	lea    0x4(%ecx),%esi
80100c17:	89 cf                	mov    %ecx,%edi
80100c19:	89 d1                	mov    %edx,%ecx
80100c1b:	89 f2                	mov    %esi,%edx
80100c1d:	89 fe                	mov    %edi,%esi
80100c1f:	89 cf                	mov    %ecx,%edi
80100c21:	eb 0d                	jmp    80100c30 <exec+0x240>
80100c23:	90                   	nop
80100c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c28:	83 c2 04             	add    $0x4,%edx
    if(argc >= MAXARG)
80100c2b:	83 ff 20             	cmp    $0x20,%edi
80100c2e:	74 9b                	je     80100bcb <exec+0x1db>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c30:	89 04 24             	mov    %eax,(%esp)
80100c33:	89 95 ec fe ff ff    	mov    %edx,-0x114(%ebp)
80100c39:	e8 e2 40 00 00       	call   80104d20 <strlen>
80100c3e:	f7 d0                	not    %eax
80100c40:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c42:	8b 06                	mov    (%esi),%eax
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c44:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c47:	89 04 24             	mov    %eax,(%esp)
80100c4a:	e8 d1 40 00 00       	call   80104d20 <strlen>
80100c4f:	83 c0 01             	add    $0x1,%eax
80100c52:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c56:	8b 06                	mov    (%esi),%eax
80100c58:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c5c:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c60:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100c66:	89 04 24             	mov    %eax,(%esp)
80100c69:	e8 d2 69 00 00       	call   80107640 <copyout>
80100c6e:	85 c0                	test   %eax,%eax
80100c70:	0f 88 55 ff ff ff    	js     80100bcb <exec+0x1db>
  for(argc = 0; argv[argc]; argc++) {
80100c76:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
    ustack[3+argc] = sp;
80100c7c:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100c82:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c89:	83 c7 01             	add    $0x1,%edi
80100c8c:	8b 02                	mov    (%edx),%eax
80100c8e:	89 d6                	mov    %edx,%esi
80100c90:	85 c0                	test   %eax,%eax
80100c92:	75 94                	jne    80100c28 <exec+0x238>
80100c94:	89 fa                	mov    %edi,%edx
  ustack[3+argc] = 0;
80100c96:	c7 84 95 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edx,4)
80100c9d:	00 00 00 00 
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca1:	8d 04 95 04 00 00 00 	lea    0x4(,%edx,4),%eax
  ustack[1] = argc;
80100ca8:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cae:	89 da                	mov    %ebx,%edx
80100cb0:	29 c2                	sub    %eax,%edx
  sp -= (3+argc+1) * 4;
80100cb2:	83 c0 0c             	add    $0xc,%eax
80100cb5:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cb7:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100cbb:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100cc1:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80100cc5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  ustack[0] = 0xffffffff;  // fake return PC
80100cc9:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100cd0:	ff ff ff 
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cd3:	89 04 24             	mov    %eax,(%esp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cd6:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cdc:	e8 5f 69 00 00       	call   80107640 <copyout>
80100ce1:	85 c0                	test   %eax,%eax
80100ce3:	0f 88 e2 fe ff ff    	js     80100bcb <exec+0x1db>
  for(last=s=path; *s; s++)
80100ce9:	8b 45 08             	mov    0x8(%ebp),%eax
80100cec:	0f b6 10             	movzbl (%eax),%edx
80100cef:	84 d2                	test   %dl,%dl
80100cf1:	74 19                	je     80100d0c <exec+0x31c>
80100cf3:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cf6:	83 c0 01             	add    $0x1,%eax
      last = s+1;
80100cf9:	80 fa 2f             	cmp    $0x2f,%dl
  for(last=s=path; *s; s++)
80100cfc:	0f b6 10             	movzbl (%eax),%edx
      last = s+1;
80100cff:	0f 44 c8             	cmove  %eax,%ecx
80100d02:	83 c0 01             	add    $0x1,%eax
  for(last=s=path; *s; s++)
80100d05:	84 d2                	test   %dl,%dl
80100d07:	75 f0                	jne    80100cf9 <exec+0x309>
80100d09:	89 4d 08             	mov    %ecx,0x8(%ebp)
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d0c:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100d12:	8b 45 08             	mov    0x8(%ebp),%eax
80100d15:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100d1c:	00 
80100d1d:	89 44 24 04          	mov    %eax,0x4(%esp)
80100d21:	89 f8                	mov    %edi,%eax
80100d23:	83 c0 6c             	add    $0x6c,%eax
80100d26:	89 04 24             	mov    %eax,(%esp)
80100d29:	e8 b2 3f 00 00       	call   80104ce0 <safestrcpy>
  curproc->pgdir = pgdir;
80100d2e:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
  oldpgdir = curproc->pgdir;
80100d34:	8b 77 04             	mov    0x4(%edi),%esi
  curproc->tf->eip = elf.entry;  // main
80100d37:	8b 47 18             	mov    0x18(%edi),%eax
  curproc->pgdir = pgdir;
80100d3a:	89 4f 04             	mov    %ecx,0x4(%edi)
  curproc->sz = sz;
80100d3d:	8b 8d e8 fe ff ff    	mov    -0x118(%ebp),%ecx
80100d43:	89 0f                	mov    %ecx,(%edi)
  curproc->tf->eip = elf.entry;  // main
80100d45:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d4b:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d4e:	8b 47 18             	mov    0x18(%edi),%eax
80100d51:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d54:	89 3c 24             	mov    %edi,(%esp)
80100d57:	e8 f4 62 00 00       	call   80107050 <switchuvm>
  freevm(oldpgdir);
80100d5c:	89 34 24             	mov    %esi,(%esp)
80100d5f:	e8 4c 66 00 00       	call   801073b0 <freevm>
  return 0;
80100d64:	31 c0                	xor    %eax,%eax
80100d66:	e9 f3 fc ff ff       	jmp    80100a5e <exec+0x6e>
  for(argc = 0; argv[argc]; argc++) {
80100d6b:	8b 9d e8 fe ff ff    	mov    -0x118(%ebp),%ebx
80100d71:	31 d2                	xor    %edx,%edx
80100d73:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100d79:	e9 18 ff ff ff       	jmp    80100c96 <exec+0x2a6>
80100d7e:	66 90                	xchg   %ax,%ax

80100d80 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
80100d86:	c7 44 24 04 61 77 10 	movl   $0x80107761,0x4(%esp)
80100d8d:	80 
80100d8e:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
80100d95:	e8 16 3b 00 00       	call   801048b0 <initlock>
}
80100d9a:	c9                   	leave  
80100d9b:	c3                   	ret    
80100d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100da0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100da0:	55                   	push   %ebp
80100da1:	89 e5                	mov    %esp,%ebp
80100da3:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100da4:	bb 14 10 11 80       	mov    $0x80111014,%ebx
{
80100da9:	83 ec 14             	sub    $0x14,%esp
  acquire(&ftable.lock);
80100dac:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
80100db3:	e8 68 3c 00 00       	call   80104a20 <acquire>
80100db8:	eb 11                	jmp    80100dcb <filealloc+0x2b>
80100dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100dc0:	83 c3 18             	add    $0x18,%ebx
80100dc3:	81 fb 74 19 11 80    	cmp    $0x80111974,%ebx
80100dc9:	74 25                	je     80100df0 <filealloc+0x50>
    if(f->ref == 0){
80100dcb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dce:	85 c0                	test   %eax,%eax
80100dd0:	75 ee                	jne    80100dc0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100dd2:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
      f->ref = 1;
80100dd9:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100de0:	e8 bb 3c 00 00       	call   80104aa0 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100de5:	83 c4 14             	add    $0x14,%esp
      return f;
80100de8:	89 d8                	mov    %ebx,%eax
}
80100dea:	5b                   	pop    %ebx
80100deb:	5d                   	pop    %ebp
80100dec:	c3                   	ret    
80100ded:	8d 76 00             	lea    0x0(%esi),%esi
  release(&ftable.lock);
80100df0:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
80100df7:	e8 a4 3c 00 00       	call   80104aa0 <release>
}
80100dfc:	83 c4 14             	add    $0x14,%esp
  return 0;
80100dff:	31 c0                	xor    %eax,%eax
}
80100e01:	5b                   	pop    %ebx
80100e02:	5d                   	pop    %ebp
80100e03:	c3                   	ret    
80100e04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100e10 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	53                   	push   %ebx
80100e14:	83 ec 14             	sub    $0x14,%esp
80100e17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e1a:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
80100e21:	e8 fa 3b 00 00       	call   80104a20 <acquire>
  if(f->ref < 1)
80100e26:	8b 43 04             	mov    0x4(%ebx),%eax
80100e29:	85 c0                	test   %eax,%eax
80100e2b:	7e 1a                	jle    80100e47 <filedup+0x37>
    panic("filedup");
  f->ref++;
80100e2d:	83 c0 01             	add    $0x1,%eax
80100e30:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e33:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
80100e3a:	e8 61 3c 00 00       	call   80104aa0 <release>
  return f;
}
80100e3f:	83 c4 14             	add    $0x14,%esp
80100e42:	89 d8                	mov    %ebx,%eax
80100e44:	5b                   	pop    %ebx
80100e45:	5d                   	pop    %ebp
80100e46:	c3                   	ret    
    panic("filedup");
80100e47:	c7 04 24 68 77 10 80 	movl   $0x80107768,(%esp)
80100e4e:	e8 0d f5 ff ff       	call   80100360 <panic>
80100e53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e60 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e60:	55                   	push   %ebp
80100e61:	89 e5                	mov    %esp,%ebp
80100e63:	57                   	push   %edi
80100e64:	56                   	push   %esi
80100e65:	53                   	push   %ebx
80100e66:	83 ec 1c             	sub    $0x1c,%esp
80100e69:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e6c:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
80100e73:	e8 a8 3b 00 00       	call   80104a20 <acquire>
  if(f->ref < 1)
80100e78:	8b 57 04             	mov    0x4(%edi),%edx
80100e7b:	85 d2                	test   %edx,%edx
80100e7d:	0f 8e 89 00 00 00    	jle    80100f0c <fileclose+0xac>
    panic("fileclose");
  if(--f->ref > 0){
80100e83:	83 ea 01             	sub    $0x1,%edx
80100e86:	85 d2                	test   %edx,%edx
80100e88:	89 57 04             	mov    %edx,0x4(%edi)
80100e8b:	74 13                	je     80100ea0 <fileclose+0x40>
    release(&ftable.lock);
80100e8d:	c7 45 08 e0 0f 11 80 	movl   $0x80110fe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e94:	83 c4 1c             	add    $0x1c,%esp
80100e97:	5b                   	pop    %ebx
80100e98:	5e                   	pop    %esi
80100e99:	5f                   	pop    %edi
80100e9a:	5d                   	pop    %ebp
    release(&ftable.lock);
80100e9b:	e9 00 3c 00 00       	jmp    80104aa0 <release>
  ff = *f;
80100ea0:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100ea4:	8b 37                	mov    (%edi),%esi
80100ea6:	8b 5f 0c             	mov    0xc(%edi),%ebx
  f->type = FD_NONE;
80100ea9:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  ff = *f;
80100eaf:	88 45 e7             	mov    %al,-0x19(%ebp)
80100eb2:	8b 47 10             	mov    0x10(%edi),%eax
  release(&ftable.lock);
80100eb5:	c7 04 24 e0 0f 11 80 	movl   $0x80110fe0,(%esp)
  ff = *f;
80100ebc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100ebf:	e8 dc 3b 00 00       	call   80104aa0 <release>
  if(ff.type == FD_PIPE)
80100ec4:	83 fe 01             	cmp    $0x1,%esi
80100ec7:	74 0f                	je     80100ed8 <fileclose+0x78>
  else if(ff.type == FD_INODE){
80100ec9:	83 fe 02             	cmp    $0x2,%esi
80100ecc:	74 22                	je     80100ef0 <fileclose+0x90>
}
80100ece:	83 c4 1c             	add    $0x1c,%esp
80100ed1:	5b                   	pop    %ebx
80100ed2:	5e                   	pop    %esi
80100ed3:	5f                   	pop    %edi
80100ed4:	5d                   	pop    %ebp
80100ed5:	c3                   	ret    
80100ed6:	66 90                	xchg   %ax,%ax
    pipeclose(ff.pipe, ff.writable);
80100ed8:	0f be 75 e7          	movsbl -0x19(%ebp),%esi
80100edc:	89 1c 24             	mov    %ebx,(%esp)
80100edf:	89 74 24 04          	mov    %esi,0x4(%esp)
80100ee3:	e8 98 23 00 00       	call   80103280 <pipeclose>
80100ee8:	eb e4                	jmp    80100ece <fileclose+0x6e>
80100eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    begin_op();
80100ef0:	e8 3b 1c 00 00       	call   80102b30 <begin_op>
    iput(ff.ip);
80100ef5:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100ef8:	89 04 24             	mov    %eax,(%esp)
80100efb:	e8 00 09 00 00       	call   80101800 <iput>
}
80100f00:	83 c4 1c             	add    $0x1c,%esp
80100f03:	5b                   	pop    %ebx
80100f04:	5e                   	pop    %esi
80100f05:	5f                   	pop    %edi
80100f06:	5d                   	pop    %ebp
    end_op();
80100f07:	e9 94 1c 00 00       	jmp    80102ba0 <end_op>
    panic("fileclose");
80100f0c:	c7 04 24 70 77 10 80 	movl   $0x80107770,(%esp)
80100f13:	e8 48 f4 ff ff       	call   80100360 <panic>
80100f18:	90                   	nop
80100f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100f20 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f20:	55                   	push   %ebp
80100f21:	89 e5                	mov    %esp,%ebp
80100f23:	53                   	push   %ebx
80100f24:	83 ec 14             	sub    $0x14,%esp
80100f27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f2a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f2d:	75 31                	jne    80100f60 <filestat+0x40>
    ilock(f->ip);
80100f2f:	8b 43 10             	mov    0x10(%ebx),%eax
80100f32:	89 04 24             	mov    %eax,(%esp)
80100f35:	e8 a6 07 00 00       	call   801016e0 <ilock>
    stati(f->ip, st);
80100f3a:	8b 45 0c             	mov    0xc(%ebp),%eax
80100f3d:	89 44 24 04          	mov    %eax,0x4(%esp)
80100f41:	8b 43 10             	mov    0x10(%ebx),%eax
80100f44:	89 04 24             	mov    %eax,(%esp)
80100f47:	e8 14 0a 00 00       	call   80101960 <stati>
    iunlock(f->ip);
80100f4c:	8b 43 10             	mov    0x10(%ebx),%eax
80100f4f:	89 04 24             	mov    %eax,(%esp)
80100f52:	e8 69 08 00 00       	call   801017c0 <iunlock>
    return 0;
  }
  return -1;
}
80100f57:	83 c4 14             	add    $0x14,%esp
    return 0;
80100f5a:	31 c0                	xor    %eax,%eax
}
80100f5c:	5b                   	pop    %ebx
80100f5d:	5d                   	pop    %ebp
80100f5e:	c3                   	ret    
80100f5f:	90                   	nop
80100f60:	83 c4 14             	add    $0x14,%esp
  return -1;
80100f63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f68:	5b                   	pop    %ebx
80100f69:	5d                   	pop    %ebp
80100f6a:	c3                   	ret    
80100f6b:	90                   	nop
80100f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f70 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f70:	55                   	push   %ebp
80100f71:	89 e5                	mov    %esp,%ebp
80100f73:	57                   	push   %edi
80100f74:	56                   	push   %esi
80100f75:	53                   	push   %ebx
80100f76:	83 ec 1c             	sub    $0x1c,%esp
80100f79:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f7f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f82:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f86:	74 68                	je     80100ff0 <fileread+0x80>
    return -1;
  if(f->type == FD_PIPE)
80100f88:	8b 03                	mov    (%ebx),%eax
80100f8a:	83 f8 01             	cmp    $0x1,%eax
80100f8d:	74 49                	je     80100fd8 <fileread+0x68>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f8f:	83 f8 02             	cmp    $0x2,%eax
80100f92:	75 63                	jne    80100ff7 <fileread+0x87>
    ilock(f->ip);
80100f94:	8b 43 10             	mov    0x10(%ebx),%eax
80100f97:	89 04 24             	mov    %eax,(%esp)
80100f9a:	e8 41 07 00 00       	call   801016e0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f9f:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100fa3:	8b 43 14             	mov    0x14(%ebx),%eax
80100fa6:	89 74 24 04          	mov    %esi,0x4(%esp)
80100faa:	89 44 24 08          	mov    %eax,0x8(%esp)
80100fae:	8b 43 10             	mov    0x10(%ebx),%eax
80100fb1:	89 04 24             	mov    %eax,(%esp)
80100fb4:	e8 d7 09 00 00       	call   80101990 <readi>
80100fb9:	85 c0                	test   %eax,%eax
80100fbb:	89 c6                	mov    %eax,%esi
80100fbd:	7e 03                	jle    80100fc2 <fileread+0x52>
      f->off += r;
80100fbf:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fc2:	8b 43 10             	mov    0x10(%ebx),%eax
80100fc5:	89 04 24             	mov    %eax,(%esp)
80100fc8:	e8 f3 07 00 00       	call   801017c0 <iunlock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100fcd:	89 f0                	mov    %esi,%eax
    return r;
  }
  panic("fileread");
}
80100fcf:	83 c4 1c             	add    $0x1c,%esp
80100fd2:	5b                   	pop    %ebx
80100fd3:	5e                   	pop    %esi
80100fd4:	5f                   	pop    %edi
80100fd5:	5d                   	pop    %ebp
80100fd6:	c3                   	ret    
80100fd7:	90                   	nop
    return piperead(f->pipe, addr, n);
80100fd8:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fdb:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100fde:	83 c4 1c             	add    $0x1c,%esp
80100fe1:	5b                   	pop    %ebx
80100fe2:	5e                   	pop    %esi
80100fe3:	5f                   	pop    %edi
80100fe4:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100fe5:	e9 16 24 00 00       	jmp    80103400 <piperead>
80100fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80100ff0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ff5:	eb d8                	jmp    80100fcf <fileread+0x5f>
  panic("fileread");
80100ff7:	c7 04 24 7a 77 10 80 	movl   $0x8010777a,(%esp)
80100ffe:	e8 5d f3 ff ff       	call   80100360 <panic>
80101003:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101010 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101010:	55                   	push   %ebp
80101011:	89 e5                	mov    %esp,%ebp
80101013:	57                   	push   %edi
80101014:	56                   	push   %esi
80101015:	53                   	push   %ebx
80101016:	83 ec 2c             	sub    $0x2c,%esp
80101019:	8b 45 0c             	mov    0xc(%ebp),%eax
8010101c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010101f:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101022:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
80101025:	80 7f 09 00          	cmpb   $0x0,0x9(%edi)
{
80101029:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
8010102c:	0f 84 ae 00 00 00    	je     801010e0 <filewrite+0xd0>
    return -1;
  if(f->type == FD_PIPE)
80101032:	8b 07                	mov    (%edi),%eax
80101034:	83 f8 01             	cmp    $0x1,%eax
80101037:	0f 84 c2 00 00 00    	je     801010ff <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010103d:	83 f8 02             	cmp    $0x2,%eax
80101040:	0f 85 d7 00 00 00    	jne    8010111d <filewrite+0x10d>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101046:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101049:	31 db                	xor    %ebx,%ebx
8010104b:	85 c0                	test   %eax,%eax
8010104d:	7f 31                	jg     80101080 <filewrite+0x70>
8010104f:	e9 9c 00 00 00       	jmp    801010f0 <filewrite+0xe0>
80101054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
      iunlock(f->ip);
80101058:	8b 4f 10             	mov    0x10(%edi),%ecx
        f->off += r;
8010105b:	01 47 14             	add    %eax,0x14(%edi)
8010105e:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101061:	89 0c 24             	mov    %ecx,(%esp)
80101064:	e8 57 07 00 00       	call   801017c0 <iunlock>
      end_op();
80101069:	e8 32 1b 00 00       	call   80102ba0 <end_op>
8010106e:	8b 45 e0             	mov    -0x20(%ebp),%eax

      if(r < 0)
        break;
      if(r != n1)
80101071:	39 f0                	cmp    %esi,%eax
80101073:	0f 85 98 00 00 00    	jne    80101111 <filewrite+0x101>
        panic("short filewrite");
      i += r;
80101079:	01 c3                	add    %eax,%ebx
    while(i < n){
8010107b:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
8010107e:	7e 70                	jle    801010f0 <filewrite+0xe0>
      int n1 = n - i;
80101080:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101083:	b8 00 06 00 00       	mov    $0x600,%eax
80101088:	29 de                	sub    %ebx,%esi
8010108a:	81 fe 00 06 00 00    	cmp    $0x600,%esi
80101090:	0f 4f f0             	cmovg  %eax,%esi
      begin_op();
80101093:	e8 98 1a 00 00       	call   80102b30 <begin_op>
      ilock(f->ip);
80101098:	8b 47 10             	mov    0x10(%edi),%eax
8010109b:	89 04 24             	mov    %eax,(%esp)
8010109e:	e8 3d 06 00 00       	call   801016e0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
801010a3:	89 74 24 0c          	mov    %esi,0xc(%esp)
801010a7:	8b 47 14             	mov    0x14(%edi),%eax
801010aa:	89 44 24 08          	mov    %eax,0x8(%esp)
801010ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010b1:	01 d8                	add    %ebx,%eax
801010b3:	89 44 24 04          	mov    %eax,0x4(%esp)
801010b7:	8b 47 10             	mov    0x10(%edi),%eax
801010ba:	89 04 24             	mov    %eax,(%esp)
801010bd:	e8 ce 09 00 00       	call   80101a90 <writei>
801010c2:	85 c0                	test   %eax,%eax
801010c4:	7f 92                	jg     80101058 <filewrite+0x48>
      iunlock(f->ip);
801010c6:	8b 4f 10             	mov    0x10(%edi),%ecx
801010c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010cc:	89 0c 24             	mov    %ecx,(%esp)
801010cf:	e8 ec 06 00 00       	call   801017c0 <iunlock>
      end_op();
801010d4:	e8 c7 1a 00 00       	call   80102ba0 <end_op>
      if(r < 0)
801010d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010dc:	85 c0                	test   %eax,%eax
801010de:	74 91                	je     80101071 <filewrite+0x61>
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010e0:	83 c4 2c             	add    $0x2c,%esp
    return -1;
801010e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801010e8:	5b                   	pop    %ebx
801010e9:	5e                   	pop    %esi
801010ea:	5f                   	pop    %edi
801010eb:	5d                   	pop    %ebp
801010ec:	c3                   	ret    
801010ed:	8d 76 00             	lea    0x0(%esi),%esi
    return i == n ? n : -1;
801010f0:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
801010f3:	89 d8                	mov    %ebx,%eax
801010f5:	75 e9                	jne    801010e0 <filewrite+0xd0>
}
801010f7:	83 c4 2c             	add    $0x2c,%esp
801010fa:	5b                   	pop    %ebx
801010fb:	5e                   	pop    %esi
801010fc:	5f                   	pop    %edi
801010fd:	5d                   	pop    %ebp
801010fe:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
801010ff:	8b 47 0c             	mov    0xc(%edi),%eax
80101102:	89 45 08             	mov    %eax,0x8(%ebp)
}
80101105:	83 c4 2c             	add    $0x2c,%esp
80101108:	5b                   	pop    %ebx
80101109:	5e                   	pop    %esi
8010110a:	5f                   	pop    %edi
8010110b:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
8010110c:	e9 ff 21 00 00       	jmp    80103310 <pipewrite>
        panic("short filewrite");
80101111:	c7 04 24 83 77 10 80 	movl   $0x80107783,(%esp)
80101118:	e8 43 f2 ff ff       	call   80100360 <panic>
  panic("filewrite");
8010111d:	c7 04 24 89 77 10 80 	movl   $0x80107789,(%esp)
80101124:	e8 37 f2 ff ff       	call   80100360 <panic>
80101129:	66 90                	xchg   %ax,%ax
8010112b:	66 90                	xchg   %ax,%ax
8010112d:	66 90                	xchg   %ax,%ax
8010112f:	90                   	nop

80101130 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101130:	55                   	push   %ebp
80101131:	89 e5                	mov    %esp,%ebp
80101133:	57                   	push   %edi
80101134:	89 d7                	mov    %edx,%edi
80101136:	56                   	push   %esi
80101137:	53                   	push   %ebx
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101138:	bb 01 00 00 00       	mov    $0x1,%ebx
{
8010113d:	83 ec 1c             	sub    $0x1c,%esp
  bp = bread(dev, BBLOCK(b, sb));
80101140:	c1 ea 0c             	shr    $0xc,%edx
80101143:	03 15 f8 19 11 80    	add    0x801119f8,%edx
80101149:	89 04 24             	mov    %eax,(%esp)
8010114c:	89 54 24 04          	mov    %edx,0x4(%esp)
80101150:	e8 7b ef ff ff       	call   801000d0 <bread>
  m = 1 << (bi % 8);
80101155:	89 f9                	mov    %edi,%ecx
  bi = b % BPB;
80101157:	81 e7 ff 0f 00 00    	and    $0xfff,%edi
8010115d:	89 fa                	mov    %edi,%edx
  m = 1 << (bi % 8);
8010115f:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
80101162:	c1 fa 03             	sar    $0x3,%edx
  m = 1 << (bi % 8);
80101165:	d3 e3                	shl    %cl,%ebx
  bp = bread(dev, BBLOCK(b, sb));
80101167:	89 c6                	mov    %eax,%esi
  if((bp->data[bi/8] & m) == 0)
80101169:	0f b6 44 10 5c       	movzbl 0x5c(%eax,%edx,1),%eax
8010116e:	0f b6 c8             	movzbl %al,%ecx
80101171:	85 d9                	test   %ebx,%ecx
80101173:	74 20                	je     80101195 <bfree+0x65>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101175:	f7 d3                	not    %ebx
80101177:	21 c3                	and    %eax,%ebx
80101179:	88 5c 16 5c          	mov    %bl,0x5c(%esi,%edx,1)
  log_write(bp);
8010117d:	89 34 24             	mov    %esi,(%esp)
80101180:	e8 4b 1b 00 00       	call   80102cd0 <log_write>
  brelse(bp);
80101185:	89 34 24             	mov    %esi,(%esp)
80101188:	e8 53 f0 ff ff       	call   801001e0 <brelse>
}
8010118d:	83 c4 1c             	add    $0x1c,%esp
80101190:	5b                   	pop    %ebx
80101191:	5e                   	pop    %esi
80101192:	5f                   	pop    %edi
80101193:	5d                   	pop    %ebp
80101194:	c3                   	ret    
    panic("freeing free block");
80101195:	c7 04 24 93 77 10 80 	movl   $0x80107793,(%esp)
8010119c:	e8 bf f1 ff ff       	call   80100360 <panic>
801011a1:	eb 0d                	jmp    801011b0 <balloc>
801011a3:	90                   	nop
801011a4:	90                   	nop
801011a5:	90                   	nop
801011a6:	90                   	nop
801011a7:	90                   	nop
801011a8:	90                   	nop
801011a9:	90                   	nop
801011aa:	90                   	nop
801011ab:	90                   	nop
801011ac:	90                   	nop
801011ad:	90                   	nop
801011ae:	90                   	nop
801011af:	90                   	nop

801011b0 <balloc>:
{
801011b0:	55                   	push   %ebp
801011b1:	89 e5                	mov    %esp,%ebp
801011b3:	57                   	push   %edi
801011b4:	56                   	push   %esi
801011b5:	53                   	push   %ebx
801011b6:	83 ec 2c             	sub    $0x2c,%esp
801011b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  for(b = 0; b < sb.size; b += BPB){
801011bc:	a1 e0 19 11 80       	mov    0x801119e0,%eax
801011c1:	85 c0                	test   %eax,%eax
801011c3:	0f 84 8c 00 00 00    	je     80101255 <balloc+0xa5>
801011c9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
801011d0:	8b 75 dc             	mov    -0x24(%ebp),%esi
801011d3:	89 f0                	mov    %esi,%eax
801011d5:	c1 f8 0c             	sar    $0xc,%eax
801011d8:	03 05 f8 19 11 80    	add    0x801119f8,%eax
801011de:	89 44 24 04          	mov    %eax,0x4(%esp)
801011e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
801011e5:	89 04 24             	mov    %eax,(%esp)
801011e8:	e8 e3 ee ff ff       	call   801000d0 <bread>
801011ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801011f0:	a1 e0 19 11 80       	mov    0x801119e0,%eax
801011f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801011f8:	31 c0                	xor    %eax,%eax
801011fa:	eb 33                	jmp    8010122f <balloc+0x7f>
801011fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101200:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101203:	89 c2                	mov    %eax,%edx
      m = 1 << (bi % 8);
80101205:	89 c1                	mov    %eax,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101207:	c1 fa 03             	sar    $0x3,%edx
      m = 1 << (bi % 8);
8010120a:	83 e1 07             	and    $0x7,%ecx
8010120d:	bf 01 00 00 00       	mov    $0x1,%edi
80101212:	d3 e7                	shl    %cl,%edi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101214:	0f b6 5c 13 5c       	movzbl 0x5c(%ebx,%edx,1),%ebx
      m = 1 << (bi % 8);
80101219:	89 f9                	mov    %edi,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010121b:	0f b6 fb             	movzbl %bl,%edi
8010121e:	85 cf                	test   %ecx,%edi
80101220:	74 46                	je     80101268 <balloc+0xb8>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101222:	83 c0 01             	add    $0x1,%eax
80101225:	83 c6 01             	add    $0x1,%esi
80101228:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010122d:	74 05                	je     80101234 <balloc+0x84>
8010122f:	3b 75 e0             	cmp    -0x20(%ebp),%esi
80101232:	72 cc                	jb     80101200 <balloc+0x50>
    brelse(bp);
80101234:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101237:	89 04 24             	mov    %eax,(%esp)
8010123a:	e8 a1 ef ff ff       	call   801001e0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010123f:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101246:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101249:	3b 05 e0 19 11 80    	cmp    0x801119e0,%eax
8010124f:	0f 82 7b ff ff ff    	jb     801011d0 <balloc+0x20>
  panic("balloc: out of blocks");
80101255:	c7 04 24 a6 77 10 80 	movl   $0x801077a6,(%esp)
8010125c:	e8 ff f0 ff ff       	call   80100360 <panic>
80101261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        bp->data[bi/8] |= m;  // Mark block in use.
80101268:	09 d9                	or     %ebx,%ecx
8010126a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010126d:	88 4c 13 5c          	mov    %cl,0x5c(%ebx,%edx,1)
        log_write(bp);
80101271:	89 1c 24             	mov    %ebx,(%esp)
80101274:	e8 57 1a 00 00       	call   80102cd0 <log_write>
        brelse(bp);
80101279:	89 1c 24             	mov    %ebx,(%esp)
8010127c:	e8 5f ef ff ff       	call   801001e0 <brelse>
  bp = bread(dev, bno);
80101281:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101284:	89 74 24 04          	mov    %esi,0x4(%esp)
80101288:	89 04 24             	mov    %eax,(%esp)
8010128b:	e8 40 ee ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
80101290:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80101297:	00 
80101298:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010129f:	00 
  bp = bread(dev, bno);
801012a0:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801012a2:	8d 40 5c             	lea    0x5c(%eax),%eax
801012a5:	89 04 24             	mov    %eax,(%esp)
801012a8:	e8 53 38 00 00       	call   80104b00 <memset>
  log_write(bp);
801012ad:	89 1c 24             	mov    %ebx,(%esp)
801012b0:	e8 1b 1a 00 00       	call   80102cd0 <log_write>
  brelse(bp);
801012b5:	89 1c 24             	mov    %ebx,(%esp)
801012b8:	e8 23 ef ff ff       	call   801001e0 <brelse>
}
801012bd:	83 c4 2c             	add    $0x2c,%esp
801012c0:	89 f0                	mov    %esi,%eax
801012c2:	5b                   	pop    %ebx
801012c3:	5e                   	pop    %esi
801012c4:	5f                   	pop    %edi
801012c5:	5d                   	pop    %ebp
801012c6:	c3                   	ret    
801012c7:	89 f6                	mov    %esi,%esi
801012c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801012d0 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	89 c7                	mov    %eax,%edi
801012d6:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
801012d7:	31 f6                	xor    %esi,%esi
{
801012d9:	53                   	push   %ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012da:	bb 34 1a 11 80       	mov    $0x80111a34,%ebx
{
801012df:	83 ec 1c             	sub    $0x1c,%esp
  acquire(&icache.lock);
801012e2:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
{
801012e9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
801012ec:	e8 2f 37 00 00       	call   80104a20 <acquire>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012f1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012f4:	eb 14                	jmp    8010130a <iget+0x3a>
801012f6:	66 90                	xchg   %ax,%ax
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801012f8:	85 f6                	test   %esi,%esi
801012fa:	74 3c                	je     80101338 <iget+0x68>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012fc:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101302:	81 fb 54 36 11 80    	cmp    $0x80113654,%ebx
80101308:	74 46                	je     80101350 <iget+0x80>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010130a:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010130d:	85 c9                	test   %ecx,%ecx
8010130f:	7e e7                	jle    801012f8 <iget+0x28>
80101311:	39 3b                	cmp    %edi,(%ebx)
80101313:	75 e3                	jne    801012f8 <iget+0x28>
80101315:	39 53 04             	cmp    %edx,0x4(%ebx)
80101318:	75 de                	jne    801012f8 <iget+0x28>
      ip->ref++;
8010131a:	83 c1 01             	add    $0x1,%ecx
      return ip;
8010131d:	89 de                	mov    %ebx,%esi
      release(&icache.lock);
8010131f:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
      ip->ref++;
80101326:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101329:	e8 72 37 00 00       	call   80104aa0 <release>
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010132e:	83 c4 1c             	add    $0x1c,%esp
80101331:	89 f0                	mov    %esi,%eax
80101333:	5b                   	pop    %ebx
80101334:	5e                   	pop    %esi
80101335:	5f                   	pop    %edi
80101336:	5d                   	pop    %ebp
80101337:	c3                   	ret    
80101338:	85 c9                	test   %ecx,%ecx
8010133a:	0f 44 f3             	cmove  %ebx,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010133d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101343:	81 fb 54 36 11 80    	cmp    $0x80113654,%ebx
80101349:	75 bf                	jne    8010130a <iget+0x3a>
8010134b:	90                   	nop
8010134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(empty == 0)
80101350:	85 f6                	test   %esi,%esi
80101352:	74 29                	je     8010137d <iget+0xad>
  ip->dev = dev;
80101354:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101356:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
80101359:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
80101360:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
80101367:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
8010136e:	e8 2d 37 00 00       	call   80104aa0 <release>
}
80101373:	83 c4 1c             	add    $0x1c,%esp
80101376:	89 f0                	mov    %esi,%eax
80101378:	5b                   	pop    %ebx
80101379:	5e                   	pop    %esi
8010137a:	5f                   	pop    %edi
8010137b:	5d                   	pop    %ebp
8010137c:	c3                   	ret    
    panic("iget: no inodes");
8010137d:	c7 04 24 bc 77 10 80 	movl   $0x801077bc,(%esp)
80101384:	e8 d7 ef ff ff       	call   80100360 <panic>
80101389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101390 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101390:	55                   	push   %ebp
80101391:	89 e5                	mov    %esp,%ebp
80101393:	57                   	push   %edi
80101394:	56                   	push   %esi
80101395:	53                   	push   %ebx
80101396:	89 c3                	mov    %eax,%ebx
80101398:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010139b:	83 fa 0b             	cmp    $0xb,%edx
8010139e:	77 18                	ja     801013b8 <bmap+0x28>
801013a0:	8d 34 90             	lea    (%eax,%edx,4),%esi
    if((addr = ip->addrs[bn]) == 0)
801013a3:	8b 46 5c             	mov    0x5c(%esi),%eax
801013a6:	85 c0                	test   %eax,%eax
801013a8:	74 66                	je     80101410 <bmap+0x80>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801013aa:	83 c4 1c             	add    $0x1c,%esp
801013ad:	5b                   	pop    %ebx
801013ae:	5e                   	pop    %esi
801013af:	5f                   	pop    %edi
801013b0:	5d                   	pop    %ebp
801013b1:	c3                   	ret    
801013b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;
801013b8:	8d 72 f4             	lea    -0xc(%edx),%esi
  if(bn < NINDIRECT){
801013bb:	83 fe 7f             	cmp    $0x7f,%esi
801013be:	77 77                	ja     80101437 <bmap+0xa7>
    if((addr = ip->addrs[NDIRECT]) == 0)
801013c0:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
801013c6:	85 c0                	test   %eax,%eax
801013c8:	74 5e                	je     80101428 <bmap+0x98>
    bp = bread(ip->dev, addr);
801013ca:	89 44 24 04          	mov    %eax,0x4(%esp)
801013ce:	8b 03                	mov    (%ebx),%eax
801013d0:	89 04 24             	mov    %eax,(%esp)
801013d3:	e8 f8 ec ff ff       	call   801000d0 <bread>
    if((addr = a[bn]) == 0){
801013d8:	8d 54 b0 5c          	lea    0x5c(%eax,%esi,4),%edx
    bp = bread(ip->dev, addr);
801013dc:	89 c7                	mov    %eax,%edi
    if((addr = a[bn]) == 0){
801013de:	8b 32                	mov    (%edx),%esi
801013e0:	85 f6                	test   %esi,%esi
801013e2:	75 19                	jne    801013fd <bmap+0x6d>
      a[bn] = addr = balloc(ip->dev);
801013e4:	8b 03                	mov    (%ebx),%eax
801013e6:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013e9:	e8 c2 fd ff ff       	call   801011b0 <balloc>
801013ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801013f1:	89 02                	mov    %eax,(%edx)
801013f3:	89 c6                	mov    %eax,%esi
      log_write(bp);
801013f5:	89 3c 24             	mov    %edi,(%esp)
801013f8:	e8 d3 18 00 00       	call   80102cd0 <log_write>
    brelse(bp);
801013fd:	89 3c 24             	mov    %edi,(%esp)
80101400:	e8 db ed ff ff       	call   801001e0 <brelse>
}
80101405:	83 c4 1c             	add    $0x1c,%esp
    brelse(bp);
80101408:	89 f0                	mov    %esi,%eax
}
8010140a:	5b                   	pop    %ebx
8010140b:	5e                   	pop    %esi
8010140c:	5f                   	pop    %edi
8010140d:	5d                   	pop    %ebp
8010140e:	c3                   	ret    
8010140f:	90                   	nop
      ip->addrs[bn] = addr = balloc(ip->dev);
80101410:	8b 03                	mov    (%ebx),%eax
80101412:	e8 99 fd ff ff       	call   801011b0 <balloc>
80101417:	89 46 5c             	mov    %eax,0x5c(%esi)
}
8010141a:	83 c4 1c             	add    $0x1c,%esp
8010141d:	5b                   	pop    %ebx
8010141e:	5e                   	pop    %esi
8010141f:	5f                   	pop    %edi
80101420:	5d                   	pop    %ebp
80101421:	c3                   	ret    
80101422:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101428:	8b 03                	mov    (%ebx),%eax
8010142a:	e8 81 fd ff ff       	call   801011b0 <balloc>
8010142f:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
80101435:	eb 93                	jmp    801013ca <bmap+0x3a>
  panic("bmap: out of range");
80101437:	c7 04 24 cc 77 10 80 	movl   $0x801077cc,(%esp)
8010143e:	e8 1d ef ff ff       	call   80100360 <panic>
80101443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101450 <readsb>:
{
80101450:	55                   	push   %ebp
80101451:	89 e5                	mov    %esp,%ebp
80101453:	56                   	push   %esi
80101454:	53                   	push   %ebx
80101455:	83 ec 10             	sub    $0x10,%esp
  bp = bread(dev, 1);
80101458:	8b 45 08             	mov    0x8(%ebp),%eax
8010145b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80101462:	00 
{
80101463:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101466:	89 04 24             	mov    %eax,(%esp)
80101469:	e8 62 ec ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
8010146e:	89 34 24             	mov    %esi,(%esp)
80101471:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
80101478:	00 
  bp = bread(dev, 1);
80101479:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
8010147b:	8d 40 5c             	lea    0x5c(%eax),%eax
8010147e:	89 44 24 04          	mov    %eax,0x4(%esp)
80101482:	e8 19 37 00 00       	call   80104ba0 <memmove>
  brelse(bp);
80101487:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010148a:	83 c4 10             	add    $0x10,%esp
8010148d:	5b                   	pop    %ebx
8010148e:	5e                   	pop    %esi
8010148f:	5d                   	pop    %ebp
  brelse(bp);
80101490:	e9 4b ed ff ff       	jmp    801001e0 <brelse>
80101495:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014a0 <iinit>:
{
801014a0:	55                   	push   %ebp
801014a1:	89 e5                	mov    %esp,%ebp
801014a3:	53                   	push   %ebx
801014a4:	bb 40 1a 11 80       	mov    $0x80111a40,%ebx
801014a9:	83 ec 24             	sub    $0x24,%esp
  initlock(&icache.lock, "icache");
801014ac:	c7 44 24 04 df 77 10 	movl   $0x801077df,0x4(%esp)
801014b3:	80 
801014b4:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
801014bb:	e8 f0 33 00 00       	call   801048b0 <initlock>
    initsleeplock(&icache.inode[i].lock, "inode");
801014c0:	89 1c 24             	mov    %ebx,(%esp)
801014c3:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014c9:	c7 44 24 04 e6 77 10 	movl   $0x801077e6,0x4(%esp)
801014d0:	80 
801014d1:	e8 aa 32 00 00       	call   80104780 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801014d6:	81 fb 60 36 11 80    	cmp    $0x80113660,%ebx
801014dc:	75 e2                	jne    801014c0 <iinit+0x20>
  readsb(dev, &sb);
801014de:	8b 45 08             	mov    0x8(%ebp),%eax
801014e1:	c7 44 24 04 e0 19 11 	movl   $0x801119e0,0x4(%esp)
801014e8:	80 
801014e9:	89 04 24             	mov    %eax,(%esp)
801014ec:	e8 5f ff ff ff       	call   80101450 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014f1:	a1 f8 19 11 80       	mov    0x801119f8,%eax
801014f6:	c7 04 24 4c 78 10 80 	movl   $0x8010784c,(%esp)
801014fd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
80101501:	a1 f4 19 11 80       	mov    0x801119f4,%eax
80101506:	89 44 24 18          	mov    %eax,0x18(%esp)
8010150a:	a1 f0 19 11 80       	mov    0x801119f0,%eax
8010150f:	89 44 24 14          	mov    %eax,0x14(%esp)
80101513:	a1 ec 19 11 80       	mov    0x801119ec,%eax
80101518:	89 44 24 10          	mov    %eax,0x10(%esp)
8010151c:	a1 e8 19 11 80       	mov    0x801119e8,%eax
80101521:	89 44 24 0c          	mov    %eax,0xc(%esp)
80101525:	a1 e4 19 11 80       	mov    0x801119e4,%eax
8010152a:	89 44 24 08          	mov    %eax,0x8(%esp)
8010152e:	a1 e0 19 11 80       	mov    0x801119e0,%eax
80101533:	89 44 24 04          	mov    %eax,0x4(%esp)
80101537:	e8 14 f1 ff ff       	call   80100650 <cprintf>
}
8010153c:	83 c4 24             	add    $0x24,%esp
8010153f:	5b                   	pop    %ebx
80101540:	5d                   	pop    %ebp
80101541:	c3                   	ret    
80101542:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101550 <ialloc>:
{
80101550:	55                   	push   %ebp
80101551:	89 e5                	mov    %esp,%ebp
80101553:	57                   	push   %edi
80101554:	56                   	push   %esi
80101555:	53                   	push   %ebx
80101556:	83 ec 2c             	sub    $0x2c,%esp
80101559:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(inum = 1; inum < sb.ninodes; inum++){
8010155c:	83 3d e8 19 11 80 01 	cmpl   $0x1,0x801119e8
{
80101563:	8b 7d 08             	mov    0x8(%ebp),%edi
80101566:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101569:	0f 86 a2 00 00 00    	jbe    80101611 <ialloc+0xc1>
8010156f:	be 01 00 00 00       	mov    $0x1,%esi
80101574:	bb 01 00 00 00       	mov    $0x1,%ebx
80101579:	eb 1a                	jmp    80101595 <ialloc+0x45>
8010157b:	90                   	nop
8010157c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    brelse(bp);
80101580:	89 14 24             	mov    %edx,(%esp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101583:	83 c3 01             	add    $0x1,%ebx
    brelse(bp);
80101586:	e8 55 ec ff ff       	call   801001e0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010158b:	89 de                	mov    %ebx,%esi
8010158d:	3b 1d e8 19 11 80    	cmp    0x801119e8,%ebx
80101593:	73 7c                	jae    80101611 <ialloc+0xc1>
    bp = bread(dev, IBLOCK(inum, sb));
80101595:	89 f0                	mov    %esi,%eax
80101597:	c1 e8 03             	shr    $0x3,%eax
8010159a:	03 05 f4 19 11 80    	add    0x801119f4,%eax
801015a0:	89 3c 24             	mov    %edi,(%esp)
801015a3:	89 44 24 04          	mov    %eax,0x4(%esp)
801015a7:	e8 24 eb ff ff       	call   801000d0 <bread>
801015ac:	89 c2                	mov    %eax,%edx
    dip = (struct dinode*)bp->data + inum%IPB;
801015ae:	89 f0                	mov    %esi,%eax
801015b0:	83 e0 07             	and    $0x7,%eax
801015b3:	c1 e0 06             	shl    $0x6,%eax
801015b6:	8d 4c 02 5c          	lea    0x5c(%edx,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
801015ba:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015be:	75 c0                	jne    80101580 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
801015c0:	89 0c 24             	mov    %ecx,(%esp)
801015c3:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
801015ca:	00 
801015cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801015d2:	00 
801015d3:	89 55 dc             	mov    %edx,-0x24(%ebp)
801015d6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015d9:	e8 22 35 00 00       	call   80104b00 <memset>
      dip->type = type;
801015de:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
      log_write(bp);   // mark it allocated on the disk
801015e2:	8b 55 dc             	mov    -0x24(%ebp),%edx
      dip->type = type;
801015e5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      log_write(bp);   // mark it allocated on the disk
801015e8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
      dip->type = type;
801015eb:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015ee:	89 14 24             	mov    %edx,(%esp)
801015f1:	e8 da 16 00 00       	call   80102cd0 <log_write>
      brelse(bp);
801015f6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801015f9:	89 14 24             	mov    %edx,(%esp)
801015fc:	e8 df eb ff ff       	call   801001e0 <brelse>
}
80101601:	83 c4 2c             	add    $0x2c,%esp
      return iget(dev, inum);
80101604:	89 f2                	mov    %esi,%edx
}
80101606:	5b                   	pop    %ebx
      return iget(dev, inum);
80101607:	89 f8                	mov    %edi,%eax
}
80101609:	5e                   	pop    %esi
8010160a:	5f                   	pop    %edi
8010160b:	5d                   	pop    %ebp
      return iget(dev, inum);
8010160c:	e9 bf fc ff ff       	jmp    801012d0 <iget>
  panic("ialloc: no inodes");
80101611:	c7 04 24 ec 77 10 80 	movl   $0x801077ec,(%esp)
80101618:	e8 43 ed ff ff       	call   80100360 <panic>
8010161d:	8d 76 00             	lea    0x0(%esi),%esi

80101620 <iupdate>:
{
80101620:	55                   	push   %ebp
80101621:	89 e5                	mov    %esp,%ebp
80101623:	56                   	push   %esi
80101624:	53                   	push   %ebx
80101625:	83 ec 10             	sub    $0x10,%esp
80101628:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010162b:	8b 43 04             	mov    0x4(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010162e:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101631:	c1 e8 03             	shr    $0x3,%eax
80101634:	03 05 f4 19 11 80    	add    0x801119f4,%eax
8010163a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010163e:	8b 43 a4             	mov    -0x5c(%ebx),%eax
80101641:	89 04 24             	mov    %eax,(%esp)
80101644:	e8 87 ea ff ff       	call   801000d0 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101649:	8b 53 a8             	mov    -0x58(%ebx),%edx
8010164c:	83 e2 07             	and    $0x7,%edx
8010164f:	c1 e2 06             	shl    $0x6,%edx
80101652:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101656:	89 c6                	mov    %eax,%esi
  dip->type = ip->type;
80101658:	0f b7 43 f4          	movzwl -0xc(%ebx),%eax
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010165c:	83 c2 0c             	add    $0xc,%edx
  dip->type = ip->type;
8010165f:	66 89 42 f4          	mov    %ax,-0xc(%edx)
  dip->major = ip->major;
80101663:	0f b7 43 f6          	movzwl -0xa(%ebx),%eax
80101667:	66 89 42 f6          	mov    %ax,-0xa(%edx)
  dip->minor = ip->minor;
8010166b:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
8010166f:	66 89 42 f8          	mov    %ax,-0x8(%edx)
  dip->nlink = ip->nlink;
80101673:	0f b7 43 fa          	movzwl -0x6(%ebx),%eax
80101677:	66 89 42 fa          	mov    %ax,-0x6(%edx)
  dip->size = ip->size;
8010167b:	8b 43 fc             	mov    -0x4(%ebx),%eax
8010167e:	89 42 fc             	mov    %eax,-0x4(%edx)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101681:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101685:	89 14 24             	mov    %edx,(%esp)
80101688:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010168f:	00 
80101690:	e8 0b 35 00 00       	call   80104ba0 <memmove>
  log_write(bp);
80101695:	89 34 24             	mov    %esi,(%esp)
80101698:	e8 33 16 00 00       	call   80102cd0 <log_write>
  brelse(bp);
8010169d:	89 75 08             	mov    %esi,0x8(%ebp)
}
801016a0:	83 c4 10             	add    $0x10,%esp
801016a3:	5b                   	pop    %ebx
801016a4:	5e                   	pop    %esi
801016a5:	5d                   	pop    %ebp
  brelse(bp);
801016a6:	e9 35 eb ff ff       	jmp    801001e0 <brelse>
801016ab:	90                   	nop
801016ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016b0 <idup>:
{
801016b0:	55                   	push   %ebp
801016b1:	89 e5                	mov    %esp,%ebp
801016b3:	53                   	push   %ebx
801016b4:	83 ec 14             	sub    $0x14,%esp
801016b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
801016ba:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
801016c1:	e8 5a 33 00 00       	call   80104a20 <acquire>
  ip->ref++;
801016c6:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801016ca:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
801016d1:	e8 ca 33 00 00       	call   80104aa0 <release>
}
801016d6:	83 c4 14             	add    $0x14,%esp
801016d9:	89 d8                	mov    %ebx,%eax
801016db:	5b                   	pop    %ebx
801016dc:	5d                   	pop    %ebp
801016dd:	c3                   	ret    
801016de:	66 90                	xchg   %ax,%ax

801016e0 <ilock>:
{
801016e0:	55                   	push   %ebp
801016e1:	89 e5                	mov    %esp,%ebp
801016e3:	56                   	push   %esi
801016e4:	53                   	push   %ebx
801016e5:	83 ec 10             	sub    $0x10,%esp
801016e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
801016eb:	85 db                	test   %ebx,%ebx
801016ed:	0f 84 b3 00 00 00    	je     801017a6 <ilock+0xc6>
801016f3:	8b 53 08             	mov    0x8(%ebx),%edx
801016f6:	85 d2                	test   %edx,%edx
801016f8:	0f 8e a8 00 00 00    	jle    801017a6 <ilock+0xc6>
  acquiresleep(&ip->lock);
801016fe:	8d 43 0c             	lea    0xc(%ebx),%eax
80101701:	89 04 24             	mov    %eax,(%esp)
80101704:	e8 b7 30 00 00       	call   801047c0 <acquiresleep>
  if(ip->valid == 0){
80101709:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010170c:	85 c0                	test   %eax,%eax
8010170e:	74 08                	je     80101718 <ilock+0x38>
}
80101710:	83 c4 10             	add    $0x10,%esp
80101713:	5b                   	pop    %ebx
80101714:	5e                   	pop    %esi
80101715:	5d                   	pop    %ebp
80101716:	c3                   	ret    
80101717:	90                   	nop
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101718:	8b 43 04             	mov    0x4(%ebx),%eax
8010171b:	c1 e8 03             	shr    $0x3,%eax
8010171e:	03 05 f4 19 11 80    	add    0x801119f4,%eax
80101724:	89 44 24 04          	mov    %eax,0x4(%esp)
80101728:	8b 03                	mov    (%ebx),%eax
8010172a:	89 04 24             	mov    %eax,(%esp)
8010172d:	e8 9e e9 ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101732:	8b 53 04             	mov    0x4(%ebx),%edx
80101735:	83 e2 07             	and    $0x7,%edx
80101738:	c1 e2 06             	shl    $0x6,%edx
8010173b:	8d 54 10 5c          	lea    0x5c(%eax,%edx,1),%edx
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010173f:	89 c6                	mov    %eax,%esi
    ip->type = dip->type;
80101741:	0f b7 02             	movzwl (%edx),%eax
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101744:	83 c2 0c             	add    $0xc,%edx
    ip->type = dip->type;
80101747:	66 89 43 50          	mov    %ax,0x50(%ebx)
    ip->major = dip->major;
8010174b:	0f b7 42 f6          	movzwl -0xa(%edx),%eax
8010174f:	66 89 43 52          	mov    %ax,0x52(%ebx)
    ip->minor = dip->minor;
80101753:	0f b7 42 f8          	movzwl -0x8(%edx),%eax
80101757:	66 89 43 54          	mov    %ax,0x54(%ebx)
    ip->nlink = dip->nlink;
8010175b:	0f b7 42 fa          	movzwl -0x6(%edx),%eax
8010175f:	66 89 43 56          	mov    %ax,0x56(%ebx)
    ip->size = dip->size;
80101763:	8b 42 fc             	mov    -0x4(%edx),%eax
80101766:	89 43 58             	mov    %eax,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101769:	8d 43 5c             	lea    0x5c(%ebx),%eax
8010176c:	89 54 24 04          	mov    %edx,0x4(%esp)
80101770:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101777:	00 
80101778:	89 04 24             	mov    %eax,(%esp)
8010177b:	e8 20 34 00 00       	call   80104ba0 <memmove>
    brelse(bp);
80101780:	89 34 24             	mov    %esi,(%esp)
80101783:	e8 58 ea ff ff       	call   801001e0 <brelse>
    if(ip->type == 0)
80101788:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
8010178d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101794:	0f 85 76 ff ff ff    	jne    80101710 <ilock+0x30>
      panic("ilock: no type");
8010179a:	c7 04 24 04 78 10 80 	movl   $0x80107804,(%esp)
801017a1:	e8 ba eb ff ff       	call   80100360 <panic>
    panic("ilock");
801017a6:	c7 04 24 fe 77 10 80 	movl   $0x801077fe,(%esp)
801017ad:	e8 ae eb ff ff       	call   80100360 <panic>
801017b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801017b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801017c0 <iunlock>:
{
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	56                   	push   %esi
801017c4:	53                   	push   %ebx
801017c5:	83 ec 10             	sub    $0x10,%esp
801017c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
801017cb:	85 db                	test   %ebx,%ebx
801017cd:	74 24                	je     801017f3 <iunlock+0x33>
801017cf:	8d 73 0c             	lea    0xc(%ebx),%esi
801017d2:	89 34 24             	mov    %esi,(%esp)
801017d5:	e8 86 30 00 00       	call   80104860 <holdingsleep>
801017da:	85 c0                	test   %eax,%eax
801017dc:	74 15                	je     801017f3 <iunlock+0x33>
801017de:	8b 43 08             	mov    0x8(%ebx),%eax
801017e1:	85 c0                	test   %eax,%eax
801017e3:	7e 0e                	jle    801017f3 <iunlock+0x33>
  releasesleep(&ip->lock);
801017e5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017e8:	83 c4 10             	add    $0x10,%esp
801017eb:	5b                   	pop    %ebx
801017ec:	5e                   	pop    %esi
801017ed:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
801017ee:	e9 2d 30 00 00       	jmp    80104820 <releasesleep>
    panic("iunlock");
801017f3:	c7 04 24 13 78 10 80 	movl   $0x80107813,(%esp)
801017fa:	e8 61 eb ff ff       	call   80100360 <panic>
801017ff:	90                   	nop

80101800 <iput>:
{
80101800:	55                   	push   %ebp
80101801:	89 e5                	mov    %esp,%ebp
80101803:	57                   	push   %edi
80101804:	56                   	push   %esi
80101805:	53                   	push   %ebx
80101806:	83 ec 1c             	sub    $0x1c,%esp
80101809:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
8010180c:	8d 7e 0c             	lea    0xc(%esi),%edi
8010180f:	89 3c 24             	mov    %edi,(%esp)
80101812:	e8 a9 2f 00 00       	call   801047c0 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
80101817:	8b 56 4c             	mov    0x4c(%esi),%edx
8010181a:	85 d2                	test   %edx,%edx
8010181c:	74 07                	je     80101825 <iput+0x25>
8010181e:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80101823:	74 2b                	je     80101850 <iput+0x50>
  releasesleep(&ip->lock);
80101825:	89 3c 24             	mov    %edi,(%esp)
80101828:	e8 f3 2f 00 00       	call   80104820 <releasesleep>
  acquire(&icache.lock);
8010182d:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
80101834:	e8 e7 31 00 00       	call   80104a20 <acquire>
  ip->ref--;
80101839:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
8010183d:	c7 45 08 00 1a 11 80 	movl   $0x80111a00,0x8(%ebp)
}
80101844:	83 c4 1c             	add    $0x1c,%esp
80101847:	5b                   	pop    %ebx
80101848:	5e                   	pop    %esi
80101849:	5f                   	pop    %edi
8010184a:	5d                   	pop    %ebp
  release(&icache.lock);
8010184b:	e9 50 32 00 00       	jmp    80104aa0 <release>
    acquire(&icache.lock);
80101850:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
80101857:	e8 c4 31 00 00       	call   80104a20 <acquire>
    int r = ip->ref;
8010185c:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
8010185f:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
80101866:	e8 35 32 00 00       	call   80104aa0 <release>
    if(r == 1){
8010186b:	83 fb 01             	cmp    $0x1,%ebx
8010186e:	75 b5                	jne    80101825 <iput+0x25>
80101870:	8d 4e 30             	lea    0x30(%esi),%ecx
80101873:	89 f3                	mov    %esi,%ebx
80101875:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101878:	89 cf                	mov    %ecx,%edi
8010187a:	eb 0b                	jmp    80101887 <iput+0x87>
8010187c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101880:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101883:	39 fb                	cmp    %edi,%ebx
80101885:	74 19                	je     801018a0 <iput+0xa0>
    if(ip->addrs[i]){
80101887:	8b 53 5c             	mov    0x5c(%ebx),%edx
8010188a:	85 d2                	test   %edx,%edx
8010188c:	74 f2                	je     80101880 <iput+0x80>
      bfree(ip->dev, ip->addrs[i]);
8010188e:	8b 06                	mov    (%esi),%eax
80101890:	e8 9b f8 ff ff       	call   80101130 <bfree>
      ip->addrs[i] = 0;
80101895:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
8010189c:	eb e2                	jmp    80101880 <iput+0x80>
8010189e:	66 90                	xchg   %ax,%ax
    }
  }

  if(ip->addrs[NDIRECT]){
801018a0:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
801018a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801018a9:	85 c0                	test   %eax,%eax
801018ab:	75 2b                	jne    801018d8 <iput+0xd8>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
801018ad:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
801018b4:	89 34 24             	mov    %esi,(%esp)
801018b7:	e8 64 fd ff ff       	call   80101620 <iupdate>
      ip->type = 0;
801018bc:	31 c0                	xor    %eax,%eax
801018be:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
801018c2:	89 34 24             	mov    %esi,(%esp)
801018c5:	e8 56 fd ff ff       	call   80101620 <iupdate>
      ip->valid = 0;
801018ca:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801018d1:	e9 4f ff ff ff       	jmp    80101825 <iput+0x25>
801018d6:	66 90                	xchg   %ax,%ax
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018d8:	89 44 24 04          	mov    %eax,0x4(%esp)
801018dc:	8b 06                	mov    (%esi),%eax
    for(j = 0; j < NINDIRECT; j++){
801018de:	31 db                	xor    %ebx,%ebx
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018e0:	89 04 24             	mov    %eax,(%esp)
801018e3:	e8 e8 e7 ff ff       	call   801000d0 <bread>
    for(j = 0; j < NINDIRECT; j++){
801018e8:	89 7d e0             	mov    %edi,-0x20(%ebp)
    a = (uint*)bp->data;
801018eb:	8d 48 5c             	lea    0x5c(%eax),%ecx
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(j = 0; j < NINDIRECT; j++){
801018f1:	89 cf                	mov    %ecx,%edi
801018f3:	31 c0                	xor    %eax,%eax
801018f5:	eb 0e                	jmp    80101905 <iput+0x105>
801018f7:	90                   	nop
801018f8:	83 c3 01             	add    $0x1,%ebx
801018fb:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
80101901:	89 d8                	mov    %ebx,%eax
80101903:	74 10                	je     80101915 <iput+0x115>
      if(a[j])
80101905:	8b 14 87             	mov    (%edi,%eax,4),%edx
80101908:	85 d2                	test   %edx,%edx
8010190a:	74 ec                	je     801018f8 <iput+0xf8>
        bfree(ip->dev, a[j]);
8010190c:	8b 06                	mov    (%esi),%eax
8010190e:	e8 1d f8 ff ff       	call   80101130 <bfree>
80101913:	eb e3                	jmp    801018f8 <iput+0xf8>
    brelse(bp);
80101915:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101918:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010191b:	89 04 24             	mov    %eax,(%esp)
8010191e:	e8 bd e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101923:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101929:	8b 06                	mov    (%esi),%eax
8010192b:	e8 00 f8 ff ff       	call   80101130 <bfree>
    ip->addrs[NDIRECT] = 0;
80101930:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101937:	00 00 00 
8010193a:	e9 6e ff ff ff       	jmp    801018ad <iput+0xad>
8010193f:	90                   	nop

80101940 <iunlockput>:
{
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	53                   	push   %ebx
80101944:	83 ec 14             	sub    $0x14,%esp
80101947:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010194a:	89 1c 24             	mov    %ebx,(%esp)
8010194d:	e8 6e fe ff ff       	call   801017c0 <iunlock>
  iput(ip);
80101952:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101955:	83 c4 14             	add    $0x14,%esp
80101958:	5b                   	pop    %ebx
80101959:	5d                   	pop    %ebp
  iput(ip);
8010195a:	e9 a1 fe ff ff       	jmp    80101800 <iput>
8010195f:	90                   	nop

80101960 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101960:	55                   	push   %ebp
80101961:	89 e5                	mov    %esp,%ebp
80101963:	8b 55 08             	mov    0x8(%ebp),%edx
80101966:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101969:	8b 0a                	mov    (%edx),%ecx
8010196b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010196e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101971:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101974:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101978:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010197b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010197f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101983:	8b 52 58             	mov    0x58(%edx),%edx
80101986:	89 50 10             	mov    %edx,0x10(%eax)
}
80101989:	5d                   	pop    %ebp
8010198a:	c3                   	ret    
8010198b:	90                   	nop
8010198c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101990 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101990:	55                   	push   %ebp
80101991:	89 e5                	mov    %esp,%ebp
80101993:	57                   	push   %edi
80101994:	56                   	push   %esi
80101995:	53                   	push   %ebx
80101996:	83 ec 2c             	sub    $0x2c,%esp
80101999:	8b 45 0c             	mov    0xc(%ebp),%eax
8010199c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010199f:	8b 75 10             	mov    0x10(%ebp),%esi
801019a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
801019a5:	8b 45 14             	mov    0x14(%ebp),%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
801019a8:	66 83 7f 50 03       	cmpw   $0x3,0x50(%edi)
{
801019ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(ip->type == T_DEV){
801019b0:	0f 84 aa 00 00 00    	je     80101a60 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
801019b6:	8b 47 58             	mov    0x58(%edi),%eax
801019b9:	39 f0                	cmp    %esi,%eax
801019bb:	0f 82 c7 00 00 00    	jb     80101a88 <readi+0xf8>
801019c1:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801019c4:	89 da                	mov    %ebx,%edx
801019c6:	01 f2                	add    %esi,%edx
801019c8:	0f 82 ba 00 00 00    	jb     80101a88 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019ce:	89 c1                	mov    %eax,%ecx
801019d0:	29 f1                	sub    %esi,%ecx
801019d2:	39 d0                	cmp    %edx,%eax
801019d4:	0f 43 cb             	cmovae %ebx,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019d7:	31 c0                	xor    %eax,%eax
801019d9:	85 c9                	test   %ecx,%ecx
    n = ip->size - off;
801019db:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019de:	74 70                	je     80101a50 <readi+0xc0>
801019e0:	89 7d d8             	mov    %edi,-0x28(%ebp)
801019e3:	89 c7                	mov    %eax,%edi
801019e5:	8d 76 00             	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019e8:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019eb:	89 f2                	mov    %esi,%edx
801019ed:	c1 ea 09             	shr    $0x9,%edx
801019f0:	89 d8                	mov    %ebx,%eax
801019f2:	e8 99 f9 ff ff       	call   80101390 <bmap>
801019f7:	89 44 24 04          	mov    %eax,0x4(%esp)
801019fb:	8b 03                	mov    (%ebx),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019fd:	bb 00 02 00 00       	mov    $0x200,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a02:	89 04 24             	mov    %eax,(%esp)
80101a05:	e8 c6 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101a0a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101a0d:	29 f9                	sub    %edi,%ecx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a0f:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a11:	89 f0                	mov    %esi,%eax
80101a13:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a18:	29 c3                	sub    %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a1a:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101a1e:	39 cb                	cmp    %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a20:	89 44 24 04          	mov    %eax,0x4(%esp)
80101a24:	8b 45 e0             	mov    -0x20(%ebp),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101a27:	0f 47 d9             	cmova  %ecx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101a2a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a2e:	01 df                	add    %ebx,%edi
80101a30:	01 de                	add    %ebx,%esi
    memmove(dst, bp->data + off%BSIZE, m);
80101a32:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a35:	89 04 24             	mov    %eax,(%esp)
80101a38:	e8 63 31 00 00       	call   80104ba0 <memmove>
    brelse(bp);
80101a3d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a40:	89 14 24             	mov    %edx,(%esp)
80101a43:	e8 98 e7 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a48:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a4b:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a4e:	77 98                	ja     801019e8 <readi+0x58>
  }
  return n;
80101a50:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a53:	83 c4 2c             	add    $0x2c,%esp
80101a56:	5b                   	pop    %ebx
80101a57:	5e                   	pop    %esi
80101a58:	5f                   	pop    %edi
80101a59:	5d                   	pop    %ebp
80101a5a:	c3                   	ret    
80101a5b:	90                   	nop
80101a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a60:	0f bf 47 52          	movswl 0x52(%edi),%eax
80101a64:	66 83 f8 09          	cmp    $0x9,%ax
80101a68:	77 1e                	ja     80101a88 <readi+0xf8>
80101a6a:	8b 04 c5 80 19 11 80 	mov    -0x7feee680(,%eax,8),%eax
80101a71:	85 c0                	test   %eax,%eax
80101a73:	74 13                	je     80101a88 <readi+0xf8>
    return devsw[ip->major].read(ip, dst, n);
80101a75:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101a78:	89 75 10             	mov    %esi,0x10(%ebp)
}
80101a7b:	83 c4 2c             	add    $0x2c,%esp
80101a7e:	5b                   	pop    %ebx
80101a7f:	5e                   	pop    %esi
80101a80:	5f                   	pop    %edi
80101a81:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101a82:	ff e0                	jmp    *%eax
80101a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
80101a88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a8d:	eb c4                	jmp    80101a53 <readi+0xc3>
80101a8f:	90                   	nop

80101a90 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a90:	55                   	push   %ebp
80101a91:	89 e5                	mov    %esp,%ebp
80101a93:	57                   	push   %edi
80101a94:	56                   	push   %esi
80101a95:	53                   	push   %ebx
80101a96:	83 ec 2c             	sub    $0x2c,%esp
80101a99:	8b 45 08             	mov    0x8(%ebp),%eax
80101a9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a9f:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101aa2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101aa7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101aaa:	8b 75 10             	mov    0x10(%ebp),%esi
80101aad:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101ab0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  if(ip->type == T_DEV){
80101ab3:	0f 84 b7 00 00 00    	je     80101b70 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101ab9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101abc:	39 70 58             	cmp    %esi,0x58(%eax)
80101abf:	0f 82 e3 00 00 00    	jb     80101ba8 <writei+0x118>
80101ac5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101ac8:	89 c8                	mov    %ecx,%eax
80101aca:	01 f0                	add    %esi,%eax
80101acc:	0f 82 d6 00 00 00    	jb     80101ba8 <writei+0x118>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101ad2:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ad7:	0f 87 cb 00 00 00    	ja     80101ba8 <writei+0x118>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101add:	85 c9                	test   %ecx,%ecx
80101adf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101ae6:	74 77                	je     80101b5f <writei+0xcf>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ae8:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101aeb:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101aed:	bb 00 02 00 00       	mov    $0x200,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101af2:	c1 ea 09             	shr    $0x9,%edx
80101af5:	89 f8                	mov    %edi,%eax
80101af7:	e8 94 f8 ff ff       	call   80101390 <bmap>
80101afc:	89 44 24 04          	mov    %eax,0x4(%esp)
80101b00:	8b 07                	mov    (%edi),%eax
80101b02:	89 04 24             	mov    %eax,(%esp)
80101b05:	e8 c6 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101b0a:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101b0d:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    memmove(bp->data + off%BSIZE, src, m);
80101b10:	8b 55 dc             	mov    -0x24(%ebp),%edx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b13:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101b15:	89 f0                	mov    %esi,%eax
80101b17:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b1c:	29 c3                	sub    %eax,%ebx
80101b1e:	39 cb                	cmp    %ecx,%ebx
80101b20:	0f 47 d9             	cmova  %ecx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101b23:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b27:	01 de                	add    %ebx,%esi
    memmove(bp->data + off%BSIZE, src, m);
80101b29:	89 54 24 04          	mov    %edx,0x4(%esp)
80101b2d:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101b31:	89 04 24             	mov    %eax,(%esp)
80101b34:	e8 67 30 00 00       	call   80104ba0 <memmove>
    log_write(bp);
80101b39:	89 3c 24             	mov    %edi,(%esp)
80101b3c:	e8 8f 11 00 00       	call   80102cd0 <log_write>
    brelse(bp);
80101b41:	89 3c 24             	mov    %edi,(%esp)
80101b44:	e8 97 e6 ff ff       	call   801001e0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b49:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b4c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b4f:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b52:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b55:	77 91                	ja     80101ae8 <writei+0x58>
  }

  if(n > 0 && off > ip->size){
80101b57:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b5a:	39 70 58             	cmp    %esi,0x58(%eax)
80101b5d:	72 39                	jb     80101b98 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b5f:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b62:	83 c4 2c             	add    $0x2c,%esp
80101b65:	5b                   	pop    %ebx
80101b66:	5e                   	pop    %esi
80101b67:	5f                   	pop    %edi
80101b68:	5d                   	pop    %ebp
80101b69:	c3                   	ret    
80101b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b74:	66 83 f8 09          	cmp    $0x9,%ax
80101b78:	77 2e                	ja     80101ba8 <writei+0x118>
80101b7a:	8b 04 c5 84 19 11 80 	mov    -0x7feee67c(,%eax,8),%eax
80101b81:	85 c0                	test   %eax,%eax
80101b83:	74 23                	je     80101ba8 <writei+0x118>
    return devsw[ip->major].write(ip, src, n);
80101b85:	89 4d 10             	mov    %ecx,0x10(%ebp)
}
80101b88:	83 c4 2c             	add    $0x2c,%esp
80101b8b:	5b                   	pop    %ebx
80101b8c:	5e                   	pop    %esi
80101b8d:	5f                   	pop    %edi
80101b8e:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101b8f:	ff e0                	jmp    *%eax
80101b91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    ip->size = off;
80101b98:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b9b:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b9e:	89 04 24             	mov    %eax,(%esp)
80101ba1:	e8 7a fa ff ff       	call   80101620 <iupdate>
80101ba6:	eb b7                	jmp    80101b5f <writei+0xcf>
}
80101ba8:	83 c4 2c             	add    $0x2c,%esp
      return -1;
80101bab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80101bb0:	5b                   	pop    %ebx
80101bb1:	5e                   	pop    %esi
80101bb2:	5f                   	pop    %edi
80101bb3:	5d                   	pop    %ebp
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80101bc6:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bc9:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101bd0:	00 
80101bd1:	89 44 24 04          	mov    %eax,0x4(%esp)
80101bd5:	8b 45 08             	mov    0x8(%ebp),%eax
80101bd8:	89 04 24             	mov    %eax,(%esp)
80101bdb:	e8 40 30 00 00       	call   80104c20 <strncmp>
}
80101be0:	c9                   	leave  
80101be1:	c3                   	ret    
80101be2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bf0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bf0:	55                   	push   %ebp
80101bf1:	89 e5                	mov    %esp,%ebp
80101bf3:	57                   	push   %edi
80101bf4:	56                   	push   %esi
80101bf5:	53                   	push   %ebx
80101bf6:	83 ec 2c             	sub    $0x2c,%esp
80101bf9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bfc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c01:	0f 85 97 00 00 00    	jne    80101c9e <dirlookup+0xae>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101c07:	8b 53 58             	mov    0x58(%ebx),%edx
80101c0a:	31 ff                	xor    %edi,%edi
80101c0c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101c0f:	85 d2                	test   %edx,%edx
80101c11:	75 0d                	jne    80101c20 <dirlookup+0x30>
80101c13:	eb 73                	jmp    80101c88 <dirlookup+0x98>
80101c15:	8d 76 00             	lea    0x0(%esi),%esi
80101c18:	83 c7 10             	add    $0x10,%edi
80101c1b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101c1e:	76 68                	jbe    80101c88 <dirlookup+0x98>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c20:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101c27:	00 
80101c28:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101c2c:	89 74 24 04          	mov    %esi,0x4(%esp)
80101c30:	89 1c 24             	mov    %ebx,(%esp)
80101c33:	e8 58 fd ff ff       	call   80101990 <readi>
80101c38:	83 f8 10             	cmp    $0x10,%eax
80101c3b:	75 55                	jne    80101c92 <dirlookup+0xa2>
      panic("dirlookup read");
    if(de.inum == 0)
80101c3d:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c42:	74 d4                	je     80101c18 <dirlookup+0x28>
  return strncmp(s, t, DIRSIZ);
80101c44:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c47:	89 44 24 04          	mov    %eax,0x4(%esp)
80101c4b:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c4e:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c55:	00 
80101c56:	89 04 24             	mov    %eax,(%esp)
80101c59:	e8 c2 2f 00 00       	call   80104c20 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101c5e:	85 c0                	test   %eax,%eax
80101c60:	75 b6                	jne    80101c18 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c62:	8b 45 10             	mov    0x10(%ebp),%eax
80101c65:	85 c0                	test   %eax,%eax
80101c67:	74 05                	je     80101c6e <dirlookup+0x7e>
        *poff = off;
80101c69:	8b 45 10             	mov    0x10(%ebp),%eax
80101c6c:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101c6e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101c72:	8b 03                	mov    (%ebx),%eax
80101c74:	e8 57 f6 ff ff       	call   801012d0 <iget>
    }
  }

  return 0;
}
80101c79:	83 c4 2c             	add    $0x2c,%esp
80101c7c:	5b                   	pop    %ebx
80101c7d:	5e                   	pop    %esi
80101c7e:	5f                   	pop    %edi
80101c7f:	5d                   	pop    %ebp
80101c80:	c3                   	ret    
80101c81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c88:	83 c4 2c             	add    $0x2c,%esp
  return 0;
80101c8b:	31 c0                	xor    %eax,%eax
}
80101c8d:	5b                   	pop    %ebx
80101c8e:	5e                   	pop    %esi
80101c8f:	5f                   	pop    %edi
80101c90:	5d                   	pop    %ebp
80101c91:	c3                   	ret    
      panic("dirlookup read");
80101c92:	c7 04 24 2d 78 10 80 	movl   $0x8010782d,(%esp)
80101c99:	e8 c2 e6 ff ff       	call   80100360 <panic>
    panic("dirlookup not DIR");
80101c9e:	c7 04 24 1b 78 10 80 	movl   $0x8010781b,(%esp)
80101ca5:	e8 b6 e6 ff ff       	call   80100360 <panic>
80101caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101cb0 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101cb0:	55                   	push   %ebp
80101cb1:	89 e5                	mov    %esp,%ebp
80101cb3:	57                   	push   %edi
80101cb4:	89 cf                	mov    %ecx,%edi
80101cb6:	56                   	push   %esi
80101cb7:	53                   	push   %ebx
80101cb8:	89 c3                	mov    %eax,%ebx
80101cba:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101cbd:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101cc0:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(*path == '/')
80101cc3:	0f 84 51 01 00 00    	je     80101e1a <namex+0x16a>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101cc9:	e8 62 1a 00 00       	call   80103730 <myproc>
80101cce:	8b 70 68             	mov    0x68(%eax),%esi
  acquire(&icache.lock);
80101cd1:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
80101cd8:	e8 43 2d 00 00       	call   80104a20 <acquire>
  ip->ref++;
80101cdd:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101ce1:	c7 04 24 00 1a 11 80 	movl   $0x80111a00,(%esp)
80101ce8:	e8 b3 2d 00 00       	call   80104aa0 <release>
80101ced:	eb 04                	jmp    80101cf3 <namex+0x43>
80101cef:	90                   	nop
    path++;
80101cf0:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101cf3:	0f b6 03             	movzbl (%ebx),%eax
80101cf6:	3c 2f                	cmp    $0x2f,%al
80101cf8:	74 f6                	je     80101cf0 <namex+0x40>
  if(*path == 0)
80101cfa:	84 c0                	test   %al,%al
80101cfc:	0f 84 ed 00 00 00    	je     80101def <namex+0x13f>
  while(*path != '/' && *path != 0)
80101d02:	0f b6 03             	movzbl (%ebx),%eax
80101d05:	89 da                	mov    %ebx,%edx
80101d07:	84 c0                	test   %al,%al
80101d09:	0f 84 b1 00 00 00    	je     80101dc0 <namex+0x110>
80101d0f:	3c 2f                	cmp    $0x2f,%al
80101d11:	75 0f                	jne    80101d22 <namex+0x72>
80101d13:	e9 a8 00 00 00       	jmp    80101dc0 <namex+0x110>
80101d18:	3c 2f                	cmp    $0x2f,%al
80101d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101d20:	74 0a                	je     80101d2c <namex+0x7c>
    path++;
80101d22:	83 c2 01             	add    $0x1,%edx
  while(*path != '/' && *path != 0)
80101d25:	0f b6 02             	movzbl (%edx),%eax
80101d28:	84 c0                	test   %al,%al
80101d2a:	75 ec                	jne    80101d18 <namex+0x68>
80101d2c:	89 d1                	mov    %edx,%ecx
80101d2e:	29 d9                	sub    %ebx,%ecx
  if(len >= DIRSIZ)
80101d30:	83 f9 0d             	cmp    $0xd,%ecx
80101d33:	0f 8e 8f 00 00 00    	jle    80101dc8 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101d39:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101d3d:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101d44:	00 
80101d45:	89 3c 24             	mov    %edi,(%esp)
80101d48:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d4b:	e8 50 2e 00 00       	call   80104ba0 <memmove>
    path++;
80101d50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d53:	89 d3                	mov    %edx,%ebx
  while(*path == '/')
80101d55:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d58:	75 0e                	jne    80101d68 <namex+0xb8>
80101d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    path++;
80101d60:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101d63:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d66:	74 f8                	je     80101d60 <namex+0xb0>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d68:	89 34 24             	mov    %esi,(%esp)
80101d6b:	e8 70 f9 ff ff       	call   801016e0 <ilock>
    if(ip->type != T_DIR){
80101d70:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d75:	0f 85 85 00 00 00    	jne    80101e00 <namex+0x150>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d7b:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d7e:	85 d2                	test   %edx,%edx
80101d80:	74 09                	je     80101d8b <namex+0xdb>
80101d82:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d85:	0f 84 a5 00 00 00    	je     80101e30 <namex+0x180>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d8b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101d92:	00 
80101d93:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101d97:	89 34 24             	mov    %esi,(%esp)
80101d9a:	e8 51 fe ff ff       	call   80101bf0 <dirlookup>
80101d9f:	85 c0                	test   %eax,%eax
80101da1:	74 5d                	je     80101e00 <namex+0x150>
  iunlock(ip);
80101da3:	89 34 24             	mov    %esi,(%esp)
80101da6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101da9:	e8 12 fa ff ff       	call   801017c0 <iunlock>
  iput(ip);
80101dae:	89 34 24             	mov    %esi,(%esp)
80101db1:	e8 4a fa ff ff       	call   80101800 <iput>
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
    ip = next;
80101db6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101db9:	89 c6                	mov    %eax,%esi
80101dbb:	e9 33 ff ff ff       	jmp    80101cf3 <namex+0x43>
  while(*path != '/' && *path != 0)
80101dc0:	31 c9                	xor    %ecx,%ecx
80101dc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memmove(name, s, len);
80101dc8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80101dcc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101dd0:	89 3c 24             	mov    %edi,(%esp)
80101dd3:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101dd6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101dd9:	e8 c2 2d 00 00       	call   80104ba0 <memmove>
    name[len] = 0;
80101dde:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101de1:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101de4:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101de8:	89 d3                	mov    %edx,%ebx
80101dea:	e9 66 ff ff ff       	jmp    80101d55 <namex+0xa5>
  }
  if(nameiparent){
80101def:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101df2:	85 c0                	test   %eax,%eax
80101df4:	75 4c                	jne    80101e42 <namex+0x192>
80101df6:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101df8:	83 c4 2c             	add    $0x2c,%esp
80101dfb:	5b                   	pop    %ebx
80101dfc:	5e                   	pop    %esi
80101dfd:	5f                   	pop    %edi
80101dfe:	5d                   	pop    %ebp
80101dff:	c3                   	ret    
  iunlock(ip);
80101e00:	89 34 24             	mov    %esi,(%esp)
80101e03:	e8 b8 f9 ff ff       	call   801017c0 <iunlock>
  iput(ip);
80101e08:	89 34 24             	mov    %esi,(%esp)
80101e0b:	e8 f0 f9 ff ff       	call   80101800 <iput>
}
80101e10:	83 c4 2c             	add    $0x2c,%esp
      return 0;
80101e13:	31 c0                	xor    %eax,%eax
}
80101e15:	5b                   	pop    %ebx
80101e16:	5e                   	pop    %esi
80101e17:	5f                   	pop    %edi
80101e18:	5d                   	pop    %ebp
80101e19:	c3                   	ret    
    ip = iget(ROOTDEV, ROOTINO);
80101e1a:	ba 01 00 00 00       	mov    $0x1,%edx
80101e1f:	b8 01 00 00 00       	mov    $0x1,%eax
80101e24:	e8 a7 f4 ff ff       	call   801012d0 <iget>
80101e29:	89 c6                	mov    %eax,%esi
80101e2b:	e9 c3 fe ff ff       	jmp    80101cf3 <namex+0x43>
      iunlock(ip);
80101e30:	89 34 24             	mov    %esi,(%esp)
80101e33:	e8 88 f9 ff ff       	call   801017c0 <iunlock>
}
80101e38:	83 c4 2c             	add    $0x2c,%esp
      return ip;
80101e3b:	89 f0                	mov    %esi,%eax
}
80101e3d:	5b                   	pop    %ebx
80101e3e:	5e                   	pop    %esi
80101e3f:	5f                   	pop    %edi
80101e40:	5d                   	pop    %ebp
80101e41:	c3                   	ret    
    iput(ip);
80101e42:	89 34 24             	mov    %esi,(%esp)
80101e45:	e8 b6 f9 ff ff       	call   80101800 <iput>
    return 0;
80101e4a:	31 c0                	xor    %eax,%eax
80101e4c:	eb aa                	jmp    80101df8 <namex+0x148>
80101e4e:	66 90                	xchg   %ax,%ax

80101e50 <dirlink>:
{
80101e50:	55                   	push   %ebp
80101e51:	89 e5                	mov    %esp,%ebp
80101e53:	57                   	push   %edi
80101e54:	56                   	push   %esi
80101e55:	53                   	push   %ebx
80101e56:	83 ec 2c             	sub    $0x2c,%esp
80101e59:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e5c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e5f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101e66:	00 
80101e67:	89 1c 24             	mov    %ebx,(%esp)
80101e6a:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e6e:	e8 7d fd ff ff       	call   80101bf0 <dirlookup>
80101e73:	85 c0                	test   %eax,%eax
80101e75:	0f 85 8b 00 00 00    	jne    80101f06 <dirlink+0xb6>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e7b:	8b 43 58             	mov    0x58(%ebx),%eax
80101e7e:	31 ff                	xor    %edi,%edi
80101e80:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e83:	85 c0                	test   %eax,%eax
80101e85:	75 13                	jne    80101e9a <dirlink+0x4a>
80101e87:	eb 35                	jmp    80101ebe <dirlink+0x6e>
80101e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e90:	8d 57 10             	lea    0x10(%edi),%edx
80101e93:	39 53 58             	cmp    %edx,0x58(%ebx)
80101e96:	89 d7                	mov    %edx,%edi
80101e98:	76 24                	jbe    80101ebe <dirlink+0x6e>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e9a:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101ea1:	00 
80101ea2:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101ea6:	89 74 24 04          	mov    %esi,0x4(%esp)
80101eaa:	89 1c 24             	mov    %ebx,(%esp)
80101ead:	e8 de fa ff ff       	call   80101990 <readi>
80101eb2:	83 f8 10             	cmp    $0x10,%eax
80101eb5:	75 5e                	jne    80101f15 <dirlink+0xc5>
    if(de.inum == 0)
80101eb7:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101ebc:	75 d2                	jne    80101e90 <dirlink+0x40>
  strncpy(de.name, name, DIRSIZ);
80101ebe:	8b 45 0c             	mov    0xc(%ebp),%eax
80101ec1:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101ec8:	00 
80101ec9:	89 44 24 04          	mov    %eax,0x4(%esp)
80101ecd:	8d 45 da             	lea    -0x26(%ebp),%eax
80101ed0:	89 04 24             	mov    %eax,(%esp)
80101ed3:	e8 b8 2d 00 00       	call   80104c90 <strncpy>
  de.inum = inum;
80101ed8:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101edb:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101ee2:	00 
80101ee3:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101ee7:	89 74 24 04          	mov    %esi,0x4(%esp)
80101eeb:	89 1c 24             	mov    %ebx,(%esp)
  de.inum = inum;
80101eee:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ef2:	e8 99 fb ff ff       	call   80101a90 <writei>
80101ef7:	83 f8 10             	cmp    $0x10,%eax
80101efa:	75 25                	jne    80101f21 <dirlink+0xd1>
  return 0;
80101efc:	31 c0                	xor    %eax,%eax
}
80101efe:	83 c4 2c             	add    $0x2c,%esp
80101f01:	5b                   	pop    %ebx
80101f02:	5e                   	pop    %esi
80101f03:	5f                   	pop    %edi
80101f04:	5d                   	pop    %ebp
80101f05:	c3                   	ret    
    iput(ip);
80101f06:	89 04 24             	mov    %eax,(%esp)
80101f09:	e8 f2 f8 ff ff       	call   80101800 <iput>
    return -1;
80101f0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f13:	eb e9                	jmp    80101efe <dirlink+0xae>
      panic("dirlink read");
80101f15:	c7 04 24 3c 78 10 80 	movl   $0x8010783c,(%esp)
80101f1c:	e8 3f e4 ff ff       	call   80100360 <panic>
    panic("dirlink");
80101f21:	c7 04 24 0e 81 10 80 	movl   $0x8010810e,(%esp)
80101f28:	e8 33 e4 ff ff       	call   80100360 <panic>
80101f2d:	8d 76 00             	lea    0x0(%esi),%esi

80101f30 <namei>:

struct inode*
namei(char *path)
{
80101f30:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f31:	31 d2                	xor    %edx,%edx
{
80101f33:	89 e5                	mov    %esp,%ebp
80101f35:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80101f38:	8b 45 08             	mov    0x8(%ebp),%eax
80101f3b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f3e:	e8 6d fd ff ff       	call   80101cb0 <namex>
}
80101f43:	c9                   	leave  
80101f44:	c3                   	ret    
80101f45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f50 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f50:	55                   	push   %ebp
  return namex(path, 1, name);
80101f51:	ba 01 00 00 00       	mov    $0x1,%edx
{
80101f56:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f58:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f5b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f5e:	5d                   	pop    %ebp
  return namex(path, 1, name);
80101f5f:	e9 4c fd ff ff       	jmp    80101cb0 <namex>
80101f64:	66 90                	xchg   %ax,%ax
80101f66:	66 90                	xchg   %ax,%ax
80101f68:	66 90                	xchg   %ax,%ax
80101f6a:	66 90                	xchg   %ax,%ax
80101f6c:	66 90                	xchg   %ax,%ax
80101f6e:	66 90                	xchg   %ax,%ax

80101f70 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f70:	55                   	push   %ebp
80101f71:	89 e5                	mov    %esp,%ebp
80101f73:	56                   	push   %esi
80101f74:	89 c6                	mov    %eax,%esi
80101f76:	53                   	push   %ebx
80101f77:	83 ec 10             	sub    $0x10,%esp
  if(b == 0)
80101f7a:	85 c0                	test   %eax,%eax
80101f7c:	0f 84 99 00 00 00    	je     8010201b <idestart+0xab>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f82:	8b 48 08             	mov    0x8(%eax),%ecx
80101f85:	81 f9 1f 4e 00 00    	cmp    $0x4e1f,%ecx
80101f8b:	0f 87 7e 00 00 00    	ja     8010200f <idestart+0x9f>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f91:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f96:	66 90                	xchg   %ax,%ax
80101f98:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f99:	83 e0 c0             	and    $0xffffffc0,%eax
80101f9c:	3c 40                	cmp    $0x40,%al
80101f9e:	75 f8                	jne    80101f98 <idestart+0x28>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101fa0:	31 db                	xor    %ebx,%ebx
80101fa2:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101fa7:	89 d8                	mov    %ebx,%eax
80101fa9:	ee                   	out    %al,(%dx)
80101faa:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101faf:	b8 01 00 00 00       	mov    $0x1,%eax
80101fb4:	ee                   	out    %al,(%dx)
80101fb5:	0f b6 c1             	movzbl %cl,%eax
80101fb8:	b2 f3                	mov    $0xf3,%dl
80101fba:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101fbb:	89 c8                	mov    %ecx,%eax
80101fbd:	b2 f4                	mov    $0xf4,%dl
80101fbf:	c1 f8 08             	sar    $0x8,%eax
80101fc2:	ee                   	out    %al,(%dx)
80101fc3:	b2 f5                	mov    $0xf5,%dl
80101fc5:	89 d8                	mov    %ebx,%eax
80101fc7:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
80101fc8:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101fcc:	b2 f6                	mov    $0xf6,%dl
80101fce:	83 e0 01             	and    $0x1,%eax
80101fd1:	c1 e0 04             	shl    $0x4,%eax
80101fd4:	83 c8 e0             	or     $0xffffffe0,%eax
80101fd7:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80101fd8:	f6 06 04             	testb  $0x4,(%esi)
80101fdb:	75 13                	jne    80101ff0 <idestart+0x80>
80101fdd:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fe2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fe7:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fe8:	83 c4 10             	add    $0x10,%esp
80101feb:	5b                   	pop    %ebx
80101fec:	5e                   	pop    %esi
80101fed:	5d                   	pop    %ebp
80101fee:	c3                   	ret    
80101fef:	90                   	nop
80101ff0:	b2 f7                	mov    $0xf7,%dl
80101ff2:	b8 30 00 00 00       	mov    $0x30,%eax
80101ff7:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
80101ff8:	b9 80 00 00 00       	mov    $0x80,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
80101ffd:	83 c6 5c             	add    $0x5c,%esi
80102000:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102005:	fc                   	cld    
80102006:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
80102008:	83 c4 10             	add    $0x10,%esp
8010200b:	5b                   	pop    %ebx
8010200c:	5e                   	pop    %esi
8010200d:	5d                   	pop    %ebp
8010200e:	c3                   	ret    
    panic("incorrect blockno");
8010200f:	c7 04 24 a8 78 10 80 	movl   $0x801078a8,(%esp)
80102016:	e8 45 e3 ff ff       	call   80100360 <panic>
    panic("idestart");
8010201b:	c7 04 24 9f 78 10 80 	movl   $0x8010789f,(%esp)
80102022:	e8 39 e3 ff ff       	call   80100360 <panic>
80102027:	89 f6                	mov    %esi,%esi
80102029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102030 <ideinit>:
{
80102030:	55                   	push   %ebp
80102031:	89 e5                	mov    %esp,%ebp
80102033:	83 ec 18             	sub    $0x18,%esp
  initlock(&idelock, "ide");
80102036:	c7 44 24 04 ba 78 10 	movl   $0x801078ba,0x4(%esp)
8010203d:	80 
8010203e:	c7 04 24 80 b5 10 80 	movl   $0x8010b580,(%esp)
80102045:	e8 66 28 00 00       	call   801048b0 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
8010204a:	a1 20 3d 11 80       	mov    0x80113d20,%eax
8010204f:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102056:	83 e8 01             	sub    $0x1,%eax
80102059:	89 44 24 04          	mov    %eax,0x4(%esp)
8010205d:	e8 7e 02 00 00       	call   801022e0 <ioapicenable>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102062:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102067:	90                   	nop
80102068:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102069:	83 e0 c0             	and    $0xffffffc0,%eax
8010206c:	3c 40                	cmp    $0x40,%al
8010206e:	75 f8                	jne    80102068 <ideinit+0x38>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102070:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102075:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010207a:	ee                   	out    %al,(%dx)
8010207b:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102080:	b2 f7                	mov    $0xf7,%dl
80102082:	eb 09                	jmp    8010208d <ideinit+0x5d>
80102084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<1000; i++){
80102088:	83 e9 01             	sub    $0x1,%ecx
8010208b:	74 0f                	je     8010209c <ideinit+0x6c>
8010208d:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
8010208e:	84 c0                	test   %al,%al
80102090:	74 f6                	je     80102088 <ideinit+0x58>
      havedisk1 = 1;
80102092:	c7 05 60 b5 10 80 01 	movl   $0x1,0x8010b560
80102099:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010209c:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020a1:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801020a6:	ee                   	out    %al,(%dx)
}
801020a7:	c9                   	leave  
801020a8:	c3                   	ret    
801020a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801020b0 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
801020b0:	55                   	push   %ebp
801020b1:	89 e5                	mov    %esp,%ebp
801020b3:	57                   	push   %edi
801020b4:	56                   	push   %esi
801020b5:	53                   	push   %ebx
801020b6:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801020b9:	c7 04 24 80 b5 10 80 	movl   $0x8010b580,(%esp)
801020c0:	e8 5b 29 00 00       	call   80104a20 <acquire>

  if((b = idequeue) == 0){
801020c5:	8b 1d 64 b5 10 80    	mov    0x8010b564,%ebx
801020cb:	85 db                	test   %ebx,%ebx
801020cd:	74 30                	je     801020ff <ideintr+0x4f>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
801020cf:	8b 43 58             	mov    0x58(%ebx),%eax
801020d2:	a3 64 b5 10 80       	mov    %eax,0x8010b564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801020d7:	8b 33                	mov    (%ebx),%esi
801020d9:	f7 c6 04 00 00 00    	test   $0x4,%esi
801020df:	74 37                	je     80102118 <ideintr+0x68>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020e1:	83 e6 fb             	and    $0xfffffffb,%esi
801020e4:	83 ce 02             	or     $0x2,%esi
801020e7:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801020e9:	89 1c 24             	mov    %ebx,(%esp)
801020ec:	e8 1f 22 00 00       	call   80104310 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801020f1:	a1 64 b5 10 80       	mov    0x8010b564,%eax
801020f6:	85 c0                	test   %eax,%eax
801020f8:	74 05                	je     801020ff <ideintr+0x4f>
    idestart(idequeue);
801020fa:	e8 71 fe ff ff       	call   80101f70 <idestart>
    release(&idelock);
801020ff:	c7 04 24 80 b5 10 80 	movl   $0x8010b580,(%esp)
80102106:	e8 95 29 00 00       	call   80104aa0 <release>

  release(&idelock);
}
8010210b:	83 c4 1c             	add    $0x1c,%esp
8010210e:	5b                   	pop    %ebx
8010210f:	5e                   	pop    %esi
80102110:	5f                   	pop    %edi
80102111:	5d                   	pop    %ebp
80102112:	c3                   	ret    
80102113:	90                   	nop
80102114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102118:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010211d:	8d 76 00             	lea    0x0(%esi),%esi
80102120:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102121:	89 c1                	mov    %eax,%ecx
80102123:	83 e1 c0             	and    $0xffffffc0,%ecx
80102126:	80 f9 40             	cmp    $0x40,%cl
80102129:	75 f5                	jne    80102120 <ideintr+0x70>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
8010212b:	a8 21                	test   $0x21,%al
8010212d:	75 b2                	jne    801020e1 <ideintr+0x31>
    insl(0x1f0, b->data, BSIZE/4);
8010212f:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80102132:	b9 80 00 00 00       	mov    $0x80,%ecx
80102137:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010213c:	fc                   	cld    
8010213d:	f3 6d                	rep insl (%dx),%es:(%edi)
8010213f:	8b 33                	mov    (%ebx),%esi
80102141:	eb 9e                	jmp    801020e1 <ideintr+0x31>
80102143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102150 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102150:	55                   	push   %ebp
80102151:	89 e5                	mov    %esp,%ebp
80102153:	53                   	push   %ebx
80102154:	83 ec 14             	sub    $0x14,%esp
80102157:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010215a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010215d:	89 04 24             	mov    %eax,(%esp)
80102160:	e8 fb 26 00 00       	call   80104860 <holdingsleep>
80102165:	85 c0                	test   %eax,%eax
80102167:	0f 84 9e 00 00 00    	je     8010220b <iderw+0xbb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010216d:	8b 03                	mov    (%ebx),%eax
8010216f:	83 e0 06             	and    $0x6,%eax
80102172:	83 f8 02             	cmp    $0x2,%eax
80102175:	0f 84 a8 00 00 00    	je     80102223 <iderw+0xd3>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010217b:	8b 53 04             	mov    0x4(%ebx),%edx
8010217e:	85 d2                	test   %edx,%edx
80102180:	74 0d                	je     8010218f <iderw+0x3f>
80102182:	a1 60 b5 10 80       	mov    0x8010b560,%eax
80102187:	85 c0                	test   %eax,%eax
80102189:	0f 84 88 00 00 00    	je     80102217 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
8010218f:	c7 04 24 80 b5 10 80 	movl   $0x8010b580,(%esp)
80102196:	e8 85 28 00 00       	call   80104a20 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010219b:	a1 64 b5 10 80       	mov    0x8010b564,%eax
  b->qnext = 0;
801021a0:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021a7:	85 c0                	test   %eax,%eax
801021a9:	75 07                	jne    801021b2 <iderw+0x62>
801021ab:	eb 4e                	jmp    801021fb <iderw+0xab>
801021ad:	8d 76 00             	lea    0x0(%esi),%esi
801021b0:	89 d0                	mov    %edx,%eax
801021b2:	8b 50 58             	mov    0x58(%eax),%edx
801021b5:	85 d2                	test   %edx,%edx
801021b7:	75 f7                	jne    801021b0 <iderw+0x60>
801021b9:	83 c0 58             	add    $0x58,%eax
    ;
  *pp = b;
801021bc:	89 18                	mov    %ebx,(%eax)

  // Start disk if necessary.
  if(idequeue == b)
801021be:	39 1d 64 b5 10 80    	cmp    %ebx,0x8010b564
801021c4:	74 3c                	je     80102202 <iderw+0xb2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021c6:	8b 03                	mov    (%ebx),%eax
801021c8:	83 e0 06             	and    $0x6,%eax
801021cb:	83 f8 02             	cmp    $0x2,%eax
801021ce:	74 1a                	je     801021ea <iderw+0x9a>
    sleep(b, &idelock);
801021d0:	c7 44 24 04 80 b5 10 	movl   $0x8010b580,0x4(%esp)
801021d7:	80 
801021d8:	89 1c 24             	mov    %ebx,(%esp)
801021db:	e8 60 1f 00 00       	call   80104140 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021e0:	8b 13                	mov    (%ebx),%edx
801021e2:	83 e2 06             	and    $0x6,%edx
801021e5:	83 fa 02             	cmp    $0x2,%edx
801021e8:	75 e6                	jne    801021d0 <iderw+0x80>
  }


  release(&idelock);
801021ea:	c7 45 08 80 b5 10 80 	movl   $0x8010b580,0x8(%ebp)
}
801021f1:	83 c4 14             	add    $0x14,%esp
801021f4:	5b                   	pop    %ebx
801021f5:	5d                   	pop    %ebp
  release(&idelock);
801021f6:	e9 a5 28 00 00       	jmp    80104aa0 <release>
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021fb:	b8 64 b5 10 80       	mov    $0x8010b564,%eax
80102200:	eb ba                	jmp    801021bc <iderw+0x6c>
    idestart(b);
80102202:	89 d8                	mov    %ebx,%eax
80102204:	e8 67 fd ff ff       	call   80101f70 <idestart>
80102209:	eb bb                	jmp    801021c6 <iderw+0x76>
    panic("iderw: buf not locked");
8010220b:	c7 04 24 be 78 10 80 	movl   $0x801078be,(%esp)
80102212:	e8 49 e1 ff ff       	call   80100360 <panic>
    panic("iderw: ide disk 1 not present");
80102217:	c7 04 24 e9 78 10 80 	movl   $0x801078e9,(%esp)
8010221e:	e8 3d e1 ff ff       	call   80100360 <panic>
    panic("iderw: nothing to do");
80102223:	c7 04 24 d4 78 10 80 	movl   $0x801078d4,(%esp)
8010222a:	e8 31 e1 ff ff       	call   80100360 <panic>
8010222f:	90                   	nop

80102230 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102230:	55                   	push   %ebp
80102231:	89 e5                	mov    %esp,%ebp
80102233:	56                   	push   %esi
80102234:	53                   	push   %ebx
80102235:	83 ec 10             	sub    $0x10,%esp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102238:	c7 05 54 36 11 80 00 	movl   $0xfec00000,0x80113654
8010223f:	00 c0 fe 
  ioapic->reg = reg;
80102242:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102249:	00 00 00 
  return ioapic->data;
8010224c:	8b 15 54 36 11 80    	mov    0x80113654,%edx
80102252:	8b 42 10             	mov    0x10(%edx),%eax
  ioapic->reg = reg;
80102255:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
8010225b:	8b 1d 54 36 11 80    	mov    0x80113654,%ebx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
80102261:	0f b6 15 80 37 11 80 	movzbl 0x80113780,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102268:	c1 e8 10             	shr    $0x10,%eax
8010226b:	0f b6 f0             	movzbl %al,%esi
  return ioapic->data;
8010226e:	8b 43 10             	mov    0x10(%ebx),%eax
  id = ioapicread(REG_ID) >> 24;
80102271:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102274:	39 c2                	cmp    %eax,%edx
80102276:	74 12                	je     8010228a <ioapicinit+0x5a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102278:	c7 04 24 08 79 10 80 	movl   $0x80107908,(%esp)
8010227f:	e8 cc e3 ff ff       	call   80100650 <cprintf>
80102284:	8b 1d 54 36 11 80    	mov    0x80113654,%ebx
8010228a:	ba 10 00 00 00       	mov    $0x10,%edx
8010228f:	31 c0                	xor    %eax,%eax
80102291:	eb 07                	jmp    8010229a <ioapicinit+0x6a>
80102293:	90                   	nop
80102294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102298:	89 cb                	mov    %ecx,%ebx
  ioapic->reg = reg;
8010229a:	89 13                	mov    %edx,(%ebx)
  ioapic->data = data;
8010229c:	8b 1d 54 36 11 80    	mov    0x80113654,%ebx
801022a2:	8d 48 20             	lea    0x20(%eax),%ecx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801022a5:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  for(i = 0; i <= maxintr; i++){
801022ab:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022ae:	89 4b 10             	mov    %ecx,0x10(%ebx)
801022b1:	8d 4a 01             	lea    0x1(%edx),%ecx
801022b4:	83 c2 02             	add    $0x2,%edx
  ioapic->reg = reg;
801022b7:	89 0b                	mov    %ecx,(%ebx)
  ioapic->data = data;
801022b9:	8b 0d 54 36 11 80    	mov    0x80113654,%ecx
  for(i = 0; i <= maxintr; i++){
801022bf:	39 c6                	cmp    %eax,%esi
  ioapic->data = data;
801022c1:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  for(i = 0; i <= maxintr; i++){
801022c8:	7d ce                	jge    80102298 <ioapicinit+0x68>
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022ca:	83 c4 10             	add    $0x10,%esp
801022cd:	5b                   	pop    %ebx
801022ce:	5e                   	pop    %esi
801022cf:	5d                   	pop    %ebp
801022d0:	c3                   	ret    
801022d1:	eb 0d                	jmp    801022e0 <ioapicenable>
801022d3:	90                   	nop
801022d4:	90                   	nop
801022d5:	90                   	nop
801022d6:	90                   	nop
801022d7:	90                   	nop
801022d8:	90                   	nop
801022d9:	90                   	nop
801022da:	90                   	nop
801022db:	90                   	nop
801022dc:	90                   	nop
801022dd:	90                   	nop
801022de:	90                   	nop
801022df:	90                   	nop

801022e0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	8b 55 08             	mov    0x8(%ebp),%edx
801022e6:	53                   	push   %ebx
801022e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022ea:	8d 5a 20             	lea    0x20(%edx),%ebx
801022ed:	8d 4c 12 10          	lea    0x10(%edx,%edx,1),%ecx
  ioapic->reg = reg;
801022f1:	8b 15 54 36 11 80    	mov    0x80113654,%edx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022f7:	c1 e0 18             	shl    $0x18,%eax
  ioapic->reg = reg;
801022fa:	89 0a                	mov    %ecx,(%edx)
  ioapic->data = data;
801022fc:	8b 15 54 36 11 80    	mov    0x80113654,%edx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102302:	83 c1 01             	add    $0x1,%ecx
  ioapic->data = data;
80102305:	89 5a 10             	mov    %ebx,0x10(%edx)
  ioapic->reg = reg;
80102308:	89 0a                	mov    %ecx,(%edx)
  ioapic->data = data;
8010230a:	8b 15 54 36 11 80    	mov    0x80113654,%edx
80102310:	89 42 10             	mov    %eax,0x10(%edx)
}
80102313:	5b                   	pop    %ebx
80102314:	5d                   	pop    %ebp
80102315:	c3                   	ret    
80102316:	66 90                	xchg   %ax,%ax
80102318:	66 90                	xchg   %ax,%ax
8010231a:	66 90                	xchg   %ax,%ax
8010231c:	66 90                	xchg   %ax,%ax
8010231e:	66 90                	xchg   %ax,%ax

80102320 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	53                   	push   %ebx
80102324:	83 ec 14             	sub    $0x14,%esp
80102327:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

#ifdef KTHREADS

  if (v == 0x0)
8010232a:	85 db                	test   %ebx,%ebx
8010232c:	74 3d                	je     8010236b <kfree+0x4b>
      return;
#endif // KTHREADS

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010232e:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102334:	75 68                	jne    8010239e <kfree+0x7e>
80102336:	81 fb c8 72 11 80    	cmp    $0x801172c8,%ebx
8010233c:	72 60                	jb     8010239e <kfree+0x7e>
8010233e:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102344:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102349:	77 53                	ja     8010239e <kfree+0x7e>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
#endif // KTHREADS

  if(kmem.use_lock)
8010234b:	8b 15 94 36 11 80    	mov    0x80113694,%edx
80102351:	85 d2                	test   %edx,%edx
80102353:	75 3b                	jne    80102390 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102355:	a1 98 36 11 80       	mov    0x80113698,%eax
8010235a:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010235c:	a1 94 36 11 80       	mov    0x80113694,%eax
  kmem.freelist = r;
80102361:	89 1d 98 36 11 80    	mov    %ebx,0x80113698
  if(kmem.use_lock)
80102367:	85 c0                	test   %eax,%eax
80102369:	75 0d                	jne    80102378 <kfree+0x58>
    release(&kmem.lock);
}
8010236b:	83 c4 14             	add    $0x14,%esp
8010236e:	5b                   	pop    %ebx
8010236f:	5d                   	pop    %ebp
80102370:	c3                   	ret    
80102371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    release(&kmem.lock);
80102378:	c7 45 08 60 36 11 80 	movl   $0x80113660,0x8(%ebp)
}
8010237f:	83 c4 14             	add    $0x14,%esp
80102382:	5b                   	pop    %ebx
80102383:	5d                   	pop    %ebp
    release(&kmem.lock);
80102384:	e9 17 27 00 00       	jmp    80104aa0 <release>
80102389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    acquire(&kmem.lock);
80102390:	c7 04 24 60 36 11 80 	movl   $0x80113660,(%esp)
80102397:	e8 84 26 00 00       	call   80104a20 <acquire>
8010239c:	eb b7                	jmp    80102355 <kfree+0x35>
    panic("kfree");
8010239e:	c7 04 24 3a 79 10 80 	movl   $0x8010793a,(%esp)
801023a5:	e8 b6 df ff ff       	call   80100360 <panic>
801023aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801023b0 <freerange>:
{
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	83 ec 10             	sub    $0x10,%esp
  p = (char*)PGROUNDUP((uint)vstart);
801023b8:	8b 45 08             	mov    0x8(%ebp),%eax
{
801023bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801023be:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
801023c4:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023ca:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
801023d0:	39 de                	cmp    %ebx,%esi
801023d2:	73 08                	jae    801023dc <freerange+0x2c>
801023d4:	eb 18                	jmp    801023ee <freerange+0x3e>
801023d6:	66 90                	xchg   %ax,%ax
801023d8:	89 da                	mov    %ebx,%edx
801023da:	89 c3                	mov    %eax,%ebx
    kfree(p);
801023dc:	89 14 24             	mov    %edx,(%esp)
801023df:	e8 3c ff ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023e4:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
801023ea:	39 f0                	cmp    %esi,%eax
801023ec:	76 ea                	jbe    801023d8 <freerange+0x28>
}
801023ee:	83 c4 10             	add    $0x10,%esp
801023f1:	5b                   	pop    %ebx
801023f2:	5e                   	pop    %esi
801023f3:	5d                   	pop    %ebp
801023f4:	c3                   	ret    
801023f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801023f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102400 <kinit1>:
{
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx
80102405:	83 ec 10             	sub    $0x10,%esp
80102408:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
8010240b:	c7 44 24 04 40 79 10 	movl   $0x80107940,0x4(%esp)
80102412:	80 
80102413:	c7 04 24 60 36 11 80 	movl   $0x80113660,(%esp)
8010241a:	e8 91 24 00 00       	call   801048b0 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010241f:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 0;
80102422:	c7 05 94 36 11 80 00 	movl   $0x0,0x80113694
80102429:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010242c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102432:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102438:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
8010243e:	39 de                	cmp    %ebx,%esi
80102440:	73 0a                	jae    8010244c <kinit1+0x4c>
80102442:	eb 1a                	jmp    8010245e <kinit1+0x5e>
80102444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102448:	89 da                	mov    %ebx,%edx
8010244a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010244c:	89 14 24             	mov    %edx,(%esp)
8010244f:	e8 cc fe ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102454:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010245a:	39 c6                	cmp    %eax,%esi
8010245c:	73 ea                	jae    80102448 <kinit1+0x48>
}
8010245e:	83 c4 10             	add    $0x10,%esp
80102461:	5b                   	pop    %ebx
80102462:	5e                   	pop    %esi
80102463:	5d                   	pop    %ebp
80102464:	c3                   	ret    
80102465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
{
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	56                   	push   %esi
80102474:	53                   	push   %ebx
80102475:	83 ec 10             	sub    $0x10,%esp
  p = (char*)PGROUNDUP((uint)vstart);
80102478:	8b 45 08             	mov    0x8(%ebp),%eax
{
8010247b:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010247e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
80102484:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010248a:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
80102490:	39 de                	cmp    %ebx,%esi
80102492:	73 08                	jae    8010249c <kinit2+0x2c>
80102494:	eb 18                	jmp    801024ae <kinit2+0x3e>
80102496:	66 90                	xchg   %ax,%ax
80102498:	89 da                	mov    %ebx,%edx
8010249a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010249c:	89 14 24             	mov    %edx,(%esp)
8010249f:	e8 7c fe ff ff       	call   80102320 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024a4:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
801024aa:	39 c6                	cmp    %eax,%esi
801024ac:	73 ea                	jae    80102498 <kinit2+0x28>
  kmem.use_lock = 1;
801024ae:	c7 05 94 36 11 80 01 	movl   $0x1,0x80113694
801024b5:	00 00 00 
}
801024b8:	83 c4 10             	add    $0x10,%esp
801024bb:	5b                   	pop    %ebx
801024bc:	5e                   	pop    %esi
801024bd:	5d                   	pop    %ebp
801024be:	c3                   	ret    
801024bf:	90                   	nop

801024c0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	53                   	push   %ebx
801024c4:	83 ec 14             	sub    $0x14,%esp
  struct run *r;

  if(kmem.use_lock)
801024c7:	a1 94 36 11 80       	mov    0x80113694,%eax
801024cc:	85 c0                	test   %eax,%eax
801024ce:	75 30                	jne    80102500 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024d0:	8b 1d 98 36 11 80    	mov    0x80113698,%ebx
  if(r)
801024d6:	85 db                	test   %ebx,%ebx
801024d8:	74 08                	je     801024e2 <kalloc+0x22>
    kmem.freelist = r->next;
801024da:	8b 13                	mov    (%ebx),%edx
801024dc:	89 15 98 36 11 80    	mov    %edx,0x80113698
  if(kmem.use_lock)
801024e2:	85 c0                	test   %eax,%eax
801024e4:	74 0c                	je     801024f2 <kalloc+0x32>
    release(&kmem.lock);
801024e6:	c7 04 24 60 36 11 80 	movl   $0x80113660,(%esp)
801024ed:	e8 ae 25 00 00       	call   80104aa0 <release>
  return (char*)r;
}
801024f2:	83 c4 14             	add    $0x14,%esp
801024f5:	89 d8                	mov    %ebx,%eax
801024f7:	5b                   	pop    %ebx
801024f8:	5d                   	pop    %ebp
801024f9:	c3                   	ret    
801024fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    acquire(&kmem.lock);
80102500:	c7 04 24 60 36 11 80 	movl   $0x80113660,(%esp)
80102507:	e8 14 25 00 00       	call   80104a20 <acquire>
8010250c:	a1 94 36 11 80       	mov    0x80113694,%eax
80102511:	eb bd                	jmp    801024d0 <kalloc+0x10>
80102513:	66 90                	xchg   %ax,%ax
80102515:	66 90                	xchg   %ax,%ax
80102517:	66 90                	xchg   %ax,%ax
80102519:	66 90                	xchg   %ax,%ax
8010251b:	66 90                	xchg   %ax,%ax
8010251d:	66 90                	xchg   %ax,%ax
8010251f:	90                   	nop

80102520 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102520:	ba 64 00 00 00       	mov    $0x64,%edx
80102525:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102526:	a8 01                	test   $0x1,%al
80102528:	0f 84 ba 00 00 00    	je     801025e8 <kbdgetc+0xc8>
8010252e:	b2 60                	mov    $0x60,%dl
80102530:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102531:	0f b6 c8             	movzbl %al,%ecx

  if(data == 0xE0){
80102534:	81 f9 e0 00 00 00    	cmp    $0xe0,%ecx
8010253a:	0f 84 88 00 00 00    	je     801025c8 <kbdgetc+0xa8>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102540:	84 c0                	test   %al,%al
80102542:	79 2c                	jns    80102570 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102544:	8b 15 b4 b5 10 80    	mov    0x8010b5b4,%edx
8010254a:	f6 c2 40             	test   $0x40,%dl
8010254d:	75 05                	jne    80102554 <kbdgetc+0x34>
8010254f:	89 c1                	mov    %eax,%ecx
80102551:	83 e1 7f             	and    $0x7f,%ecx
    shift &= ~(shiftcode[data] | E0ESC);
80102554:	0f b6 81 80 7a 10 80 	movzbl -0x7fef8580(%ecx),%eax
8010255b:	83 c8 40             	or     $0x40,%eax
8010255e:	0f b6 c0             	movzbl %al,%eax
80102561:	f7 d0                	not    %eax
80102563:	21 d0                	and    %edx,%eax
80102565:	a3 b4 b5 10 80       	mov    %eax,0x8010b5b4
    return 0;
8010256a:	31 c0                	xor    %eax,%eax
8010256c:	c3                   	ret    
8010256d:	8d 76 00             	lea    0x0(%esi),%esi
{
80102570:	55                   	push   %ebp
80102571:	89 e5                	mov    %esp,%ebp
80102573:	53                   	push   %ebx
80102574:	8b 1d b4 b5 10 80    	mov    0x8010b5b4,%ebx
  } else if(shift & E0ESC){
8010257a:	f6 c3 40             	test   $0x40,%bl
8010257d:	74 09                	je     80102588 <kbdgetc+0x68>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010257f:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102582:	83 e3 bf             	and    $0xffffffbf,%ebx
    data |= 0x80;
80102585:	0f b6 c8             	movzbl %al,%ecx
  }

  shift |= shiftcode[data];
80102588:	0f b6 91 80 7a 10 80 	movzbl -0x7fef8580(%ecx),%edx
  shift ^= togglecode[data];
8010258f:	0f b6 81 80 79 10 80 	movzbl -0x7fef8680(%ecx),%eax
  shift |= shiftcode[data];
80102596:	09 da                	or     %ebx,%edx
  shift ^= togglecode[data];
80102598:	31 c2                	xor    %eax,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010259a:	89 d0                	mov    %edx,%eax
8010259c:	83 e0 03             	and    $0x3,%eax
8010259f:	8b 04 85 60 79 10 80 	mov    -0x7fef86a0(,%eax,4),%eax
  shift ^= togglecode[data];
801025a6:	89 15 b4 b5 10 80    	mov    %edx,0x8010b5b4
  if(shift & CAPSLOCK){
801025ac:	83 e2 08             	and    $0x8,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
801025af:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  if(shift & CAPSLOCK){
801025b3:	74 0b                	je     801025c0 <kbdgetc+0xa0>
    if('a' <= c && c <= 'z')
801025b5:	8d 50 9f             	lea    -0x61(%eax),%edx
801025b8:	83 fa 19             	cmp    $0x19,%edx
801025bb:	77 1b                	ja     801025d8 <kbdgetc+0xb8>
      c += 'A' - 'a';
801025bd:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025c0:	5b                   	pop    %ebx
801025c1:	5d                   	pop    %ebp
801025c2:	c3                   	ret    
801025c3:	90                   	nop
801025c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    shift |= E0ESC;
801025c8:	83 0d b4 b5 10 80 40 	orl    $0x40,0x8010b5b4
    return 0;
801025cf:	31 c0                	xor    %eax,%eax
801025d1:	c3                   	ret    
801025d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    else if('A' <= c && c <= 'Z')
801025d8:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025db:	8d 50 20             	lea    0x20(%eax),%edx
801025de:	83 f9 19             	cmp    $0x19,%ecx
801025e1:	0f 46 c2             	cmovbe %edx,%eax
  return c;
801025e4:	eb da                	jmp    801025c0 <kbdgetc+0xa0>
801025e6:	66 90                	xchg   %ax,%ax
    return -1;
801025e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025ed:	c3                   	ret    
801025ee:	66 90                	xchg   %ax,%ax

801025f0 <kbdintr>:

void
kbdintr(void)
{
801025f0:	55                   	push   %ebp
801025f1:	89 e5                	mov    %esp,%ebp
801025f3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(kbdgetc);
801025f6:	c7 04 24 20 25 10 80 	movl   $0x80102520,(%esp)
801025fd:	e8 fe e1 ff ff       	call   80100800 <consoleintr>
}
80102602:	c9                   	leave  
80102603:	c3                   	ret    
80102604:	66 90                	xchg   %ax,%ax
80102606:	66 90                	xchg   %ax,%ax
80102608:	66 90                	xchg   %ax,%ax
8010260a:	66 90                	xchg   %ax,%ax
8010260c:	66 90                	xchg   %ax,%ax
8010260e:	66 90                	xchg   %ax,%ax

80102610 <fill_rtcdate>:
  return inb(CMOS_RETURN);
}

static void
fill_rtcdate(struct rtcdate *r)
{
80102610:	55                   	push   %ebp
80102611:	89 c1                	mov    %eax,%ecx
80102613:	89 e5                	mov    %esp,%ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102615:	ba 70 00 00 00       	mov    $0x70,%edx
8010261a:	53                   	push   %ebx
8010261b:	31 c0                	xor    %eax,%eax
8010261d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010261e:	bb 71 00 00 00       	mov    $0x71,%ebx
80102623:	89 da                	mov    %ebx,%edx
80102625:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
80102626:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102629:	b2 70                	mov    $0x70,%dl
8010262b:	89 01                	mov    %eax,(%ecx)
8010262d:	b8 02 00 00 00       	mov    $0x2,%eax
80102632:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102633:	89 da                	mov    %ebx,%edx
80102635:	ec                   	in     (%dx),%al
80102636:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102639:	b2 70                	mov    $0x70,%dl
8010263b:	89 41 04             	mov    %eax,0x4(%ecx)
8010263e:	b8 04 00 00 00       	mov    $0x4,%eax
80102643:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102644:	89 da                	mov    %ebx,%edx
80102646:	ec                   	in     (%dx),%al
80102647:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010264a:	b2 70                	mov    $0x70,%dl
8010264c:	89 41 08             	mov    %eax,0x8(%ecx)
8010264f:	b8 07 00 00 00       	mov    $0x7,%eax
80102654:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102655:	89 da                	mov    %ebx,%edx
80102657:	ec                   	in     (%dx),%al
80102658:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010265b:	b2 70                	mov    $0x70,%dl
8010265d:	89 41 0c             	mov    %eax,0xc(%ecx)
80102660:	b8 08 00 00 00       	mov    $0x8,%eax
80102665:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102666:	89 da                	mov    %ebx,%edx
80102668:	ec                   	in     (%dx),%al
80102669:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010266c:	b2 70                	mov    $0x70,%dl
8010266e:	89 41 10             	mov    %eax,0x10(%ecx)
80102671:	b8 09 00 00 00       	mov    $0x9,%eax
80102676:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102677:	89 da                	mov    %ebx,%edx
80102679:	ec                   	in     (%dx),%al
8010267a:	0f b6 d8             	movzbl %al,%ebx
8010267d:	89 59 14             	mov    %ebx,0x14(%ecx)
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
}
80102680:	5b                   	pop    %ebx
80102681:	5d                   	pop    %ebp
80102682:	c3                   	ret    
80102683:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102690 <lapicinit>:
  if(!lapic)
80102690:	a1 9c 36 11 80       	mov    0x8011369c,%eax
{
80102695:	55                   	push   %ebp
80102696:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102698:	85 c0                	test   %eax,%eax
8010269a:	0f 84 c0 00 00 00    	je     80102760 <lapicinit+0xd0>
  lapic[index] = value;
801026a0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801026a7:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026aa:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026ad:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
801026b4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026b7:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026ba:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801026c1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801026c4:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026c7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801026ce:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801026d1:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026d4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801026db:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026de:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801026e1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801026e8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026eb:	8b 50 20             	mov    0x20(%eax),%edx
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801026ee:	8b 50 30             	mov    0x30(%eax),%edx
801026f1:	c1 ea 10             	shr    $0x10,%edx
801026f4:	80 fa 03             	cmp    $0x3,%dl
801026f7:	77 6f                	ja     80102768 <lapicinit+0xd8>
  lapic[index] = value;
801026f9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102700:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102703:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102706:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010270d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102710:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102713:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010271a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010271d:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102720:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102727:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010272a:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010272d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102734:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102737:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010273a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102741:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102744:	8b 50 20             	mov    0x20(%eax),%edx
80102747:	90                   	nop
  while(lapic[ICRLO] & DELIVS)
80102748:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
8010274e:	80 e6 10             	and    $0x10,%dh
80102751:	75 f5                	jne    80102748 <lapicinit+0xb8>
  lapic[index] = value;
80102753:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
8010275a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010275d:	8b 40 20             	mov    0x20(%eax),%eax
}
80102760:	5d                   	pop    %ebp
80102761:	c3                   	ret    
80102762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic[index] = value;
80102768:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
8010276f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102772:	8b 50 20             	mov    0x20(%eax),%edx
80102775:	eb 82                	jmp    801026f9 <lapicinit+0x69>
80102777:	89 f6                	mov    %esi,%esi
80102779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102780 <lapicid>:
  if (!lapic)
80102780:	a1 9c 36 11 80       	mov    0x8011369c,%eax
{
80102785:	55                   	push   %ebp
80102786:	89 e5                	mov    %esp,%ebp
  if (!lapic)
80102788:	85 c0                	test   %eax,%eax
8010278a:	74 0c                	je     80102798 <lapicid+0x18>
  return lapic[ID] >> 24;
8010278c:	8b 40 20             	mov    0x20(%eax),%eax
}
8010278f:	5d                   	pop    %ebp
  return lapic[ID] >> 24;
80102790:	c1 e8 18             	shr    $0x18,%eax
}
80102793:	c3                   	ret    
80102794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
80102798:	31 c0                	xor    %eax,%eax
}
8010279a:	5d                   	pop    %ebp
8010279b:	c3                   	ret    
8010279c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027a0 <lapiceoi>:
  if(lapic)
801027a0:	a1 9c 36 11 80       	mov    0x8011369c,%eax
{
801027a5:	55                   	push   %ebp
801027a6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801027a8:	85 c0                	test   %eax,%eax
801027aa:	74 0d                	je     801027b9 <lapiceoi+0x19>
  lapic[index] = value;
801027ac:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027b3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027b6:	8b 40 20             	mov    0x20(%eax),%eax
}
801027b9:	5d                   	pop    %ebp
801027ba:	c3                   	ret    
801027bb:	90                   	nop
801027bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027c0 <microdelay>:
{
801027c0:	55                   	push   %ebp
801027c1:	89 e5                	mov    %esp,%ebp
}
801027c3:	5d                   	pop    %ebp
801027c4:	c3                   	ret    
801027c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027d0 <lapicstartap>:
{
801027d0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027d1:	ba 70 00 00 00       	mov    $0x70,%edx
801027d6:	89 e5                	mov    %esp,%ebp
801027d8:	b8 0f 00 00 00       	mov    $0xf,%eax
801027dd:	53                   	push   %ebx
801027de:	8b 4d 08             	mov    0x8(%ebp),%ecx
801027e1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801027e4:	ee                   	out    %al,(%dx)
801027e5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027ea:	b2 71                	mov    $0x71,%dl
801027ec:	ee                   	out    %al,(%dx)
  wrv[0] = 0;
801027ed:	31 c0                	xor    %eax,%eax
801027ef:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801027f5:	89 d8                	mov    %ebx,%eax
801027f7:	c1 e8 04             	shr    $0x4,%eax
801027fa:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
80102800:	a1 9c 36 11 80       	mov    0x8011369c,%eax
  lapicw(ICRHI, apicid<<24);
80102805:	c1 e1 18             	shl    $0x18,%ecx
    lapicw(ICRLO, STARTUP | (addr>>12));
80102808:	c1 eb 0c             	shr    $0xc,%ebx
  lapic[index] = value;
8010280b:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102811:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102814:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
8010281b:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010281e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102821:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102828:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010282b:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010282e:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102834:	8b 50 20             	mov    0x20(%eax),%edx
    lapicw(ICRLO, STARTUP | (addr>>12));
80102837:	89 da                	mov    %ebx,%edx
80102839:	80 ce 06             	or     $0x6,%dh
  lapic[index] = value;
8010283c:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102842:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102845:	89 88 10 03 00 00    	mov    %ecx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010284b:	8b 48 20             	mov    0x20(%eax),%ecx
  lapic[index] = value;
8010284e:	89 90 00 03 00 00    	mov    %edx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102854:	8b 40 20             	mov    0x20(%eax),%eax
}
80102857:	5b                   	pop    %ebx
80102858:	5d                   	pop    %ebp
80102859:	c3                   	ret    
8010285a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102860 <cmostime>:

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102860:	55                   	push   %ebp
80102861:	ba 70 00 00 00       	mov    $0x70,%edx
80102866:	89 e5                	mov    %esp,%ebp
80102868:	b8 0b 00 00 00       	mov    $0xb,%eax
8010286d:	57                   	push   %edi
8010286e:	56                   	push   %esi
8010286f:	53                   	push   %ebx
80102870:	83 ec 4c             	sub    $0x4c,%esp
80102873:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102874:	b2 71                	mov    $0x71,%dl
80102876:	ec                   	in     (%dx),%al
80102877:	88 45 b7             	mov    %al,-0x49(%ebp)
8010287a:	8d 5d b8             	lea    -0x48(%ebp),%ebx
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
8010287d:	80 65 b7 04          	andb   $0x4,-0x49(%ebp)
80102881:	8d 7d d0             	lea    -0x30(%ebp),%edi
80102884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102888:	be 70 00 00 00       	mov    $0x70,%esi

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
8010288d:	89 d8                	mov    %ebx,%eax
8010288f:	e8 7c fd ff ff       	call   80102610 <fill_rtcdate>
80102894:	b8 0a 00 00 00       	mov    $0xa,%eax
80102899:	89 f2                	mov    %esi,%edx
8010289b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289c:	ba 71 00 00 00       	mov    $0x71,%edx
801028a1:	ec                   	in     (%dx),%al
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
801028a2:	84 c0                	test   %al,%al
801028a4:	78 e7                	js     8010288d <cmostime+0x2d>
        continue;
    fill_rtcdate(&t2);
801028a6:	89 f8                	mov    %edi,%eax
801028a8:	e8 63 fd ff ff       	call   80102610 <fill_rtcdate>
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028ad:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
801028b4:	00 
801028b5:	89 7c 24 04          	mov    %edi,0x4(%esp)
801028b9:	89 1c 24             	mov    %ebx,(%esp)
801028bc:	e8 8f 22 00 00       	call   80104b50 <memcmp>
801028c1:	85 c0                	test   %eax,%eax
801028c3:	75 c3                	jne    80102888 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
801028c5:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028c9:	75 78                	jne    80102943 <cmostime+0xe3>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801028cb:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028ce:	89 c2                	mov    %eax,%edx
801028d0:	83 e0 0f             	and    $0xf,%eax
801028d3:	c1 ea 04             	shr    $0x4,%edx
801028d6:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028d9:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028dc:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801028df:	8b 45 bc             	mov    -0x44(%ebp),%eax
801028e2:	89 c2                	mov    %eax,%edx
801028e4:	83 e0 0f             	and    $0xf,%eax
801028e7:	c1 ea 04             	shr    $0x4,%edx
801028ea:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028ed:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028f0:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801028f3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801028f6:	89 c2                	mov    %eax,%edx
801028f8:	83 e0 0f             	and    $0xf,%eax
801028fb:	c1 ea 04             	shr    $0x4,%edx
801028fe:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102901:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102904:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102907:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010290a:	89 c2                	mov    %eax,%edx
8010290c:	83 e0 0f             	and    $0xf,%eax
8010290f:	c1 ea 04             	shr    $0x4,%edx
80102912:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102915:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102918:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
8010291b:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010291e:	89 c2                	mov    %eax,%edx
80102920:	83 e0 0f             	and    $0xf,%eax
80102923:	c1 ea 04             	shr    $0x4,%edx
80102926:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102929:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010292c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
8010292f:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102932:	89 c2                	mov    %eax,%edx
80102934:	83 e0 0f             	and    $0xf,%eax
80102937:	c1 ea 04             	shr    $0x4,%edx
8010293a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010293d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102940:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102943:	8b 4d 08             	mov    0x8(%ebp),%ecx
80102946:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102949:	89 01                	mov    %eax,(%ecx)
8010294b:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010294e:	89 41 04             	mov    %eax,0x4(%ecx)
80102951:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102954:	89 41 08             	mov    %eax,0x8(%ecx)
80102957:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010295a:	89 41 0c             	mov    %eax,0xc(%ecx)
8010295d:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102960:	89 41 10             	mov    %eax,0x10(%ecx)
80102963:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102966:	89 41 14             	mov    %eax,0x14(%ecx)
  r->year += 2000;
80102969:	81 41 14 d0 07 00 00 	addl   $0x7d0,0x14(%ecx)
}
80102970:	83 c4 4c             	add    $0x4c,%esp
80102973:	5b                   	pop    %ebx
80102974:	5e                   	pop    %esi
80102975:	5f                   	pop    %edi
80102976:	5d                   	pop    %ebp
80102977:	c3                   	ret    
80102978:	66 90                	xchg   %ax,%ax
8010297a:	66 90                	xchg   %ax,%ax
8010297c:	66 90                	xchg   %ax,%ax
8010297e:	66 90                	xchg   %ax,%ax

80102980 <install_trans>:
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102980:	55                   	push   %ebp
80102981:	89 e5                	mov    %esp,%ebp
80102983:	57                   	push   %edi
80102984:	56                   	push   %esi
80102985:	53                   	push   %ebx
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102986:	31 db                	xor    %ebx,%ebx
{
80102988:	83 ec 1c             	sub    $0x1c,%esp
  for (tail = 0; tail < log.lh.n; tail++) {
8010298b:	a1 e8 36 11 80       	mov    0x801136e8,%eax
80102990:	85 c0                	test   %eax,%eax
80102992:	7e 78                	jle    80102a0c <install_trans+0x8c>
80102994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102998:	a1 d4 36 11 80       	mov    0x801136d4,%eax
8010299d:	01 d8                	add    %ebx,%eax
8010299f:	83 c0 01             	add    $0x1,%eax
801029a2:	89 44 24 04          	mov    %eax,0x4(%esp)
801029a6:	a1 e4 36 11 80       	mov    0x801136e4,%eax
801029ab:	89 04 24             	mov    %eax,(%esp)
801029ae:	e8 1d d7 ff ff       	call   801000d0 <bread>
801029b3:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029b5:	8b 04 9d ec 36 11 80 	mov    -0x7feec914(,%ebx,4),%eax
  for (tail = 0; tail < log.lh.n; tail++) {
801029bc:	83 c3 01             	add    $0x1,%ebx
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029bf:	89 44 24 04          	mov    %eax,0x4(%esp)
801029c3:	a1 e4 36 11 80       	mov    0x801136e4,%eax
801029c8:	89 04 24             	mov    %eax,(%esp)
801029cb:	e8 00 d7 ff ff       	call   801000d0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801029d0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801029d7:	00 
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029d8:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
801029da:	8d 47 5c             	lea    0x5c(%edi),%eax
801029dd:	89 44 24 04          	mov    %eax,0x4(%esp)
801029e1:	8d 46 5c             	lea    0x5c(%esi),%eax
801029e4:	89 04 24             	mov    %eax,(%esp)
801029e7:	e8 b4 21 00 00       	call   80104ba0 <memmove>
    bwrite(dbuf);  // write dst to disk
801029ec:	89 34 24             	mov    %esi,(%esp)
801029ef:	e8 ac d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
801029f4:	89 3c 24             	mov    %edi,(%esp)
801029f7:	e8 e4 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
801029fc:	89 34 24             	mov    %esi,(%esp)
801029ff:	e8 dc d7 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102a04:	39 1d e8 36 11 80    	cmp    %ebx,0x801136e8
80102a0a:	7f 8c                	jg     80102998 <install_trans+0x18>
  }
}
80102a0c:	83 c4 1c             	add    $0x1c,%esp
80102a0f:	5b                   	pop    %ebx
80102a10:	5e                   	pop    %esi
80102a11:	5f                   	pop    %edi
80102a12:	5d                   	pop    %ebp
80102a13:	c3                   	ret    
80102a14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102a1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102a20 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a20:	55                   	push   %ebp
80102a21:	89 e5                	mov    %esp,%ebp
80102a23:	57                   	push   %edi
80102a24:	56                   	push   %esi
80102a25:	53                   	push   %ebx
80102a26:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a29:	a1 d4 36 11 80       	mov    0x801136d4,%eax
80102a2e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a32:	a1 e4 36 11 80       	mov    0x801136e4,%eax
80102a37:	89 04 24             	mov    %eax,(%esp)
80102a3a:	e8 91 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a3f:	8b 1d e8 36 11 80    	mov    0x801136e8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102a45:	31 d2                	xor    %edx,%edx
80102a47:	85 db                	test   %ebx,%ebx
  struct buf *buf = bread(log.dev, log.start);
80102a49:	89 c7                	mov    %eax,%edi
  hb->n = log.lh.n;
80102a4b:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102a4e:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102a51:	7e 17                	jle    80102a6a <write_head+0x4a>
80102a53:	90                   	nop
80102a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102a58:	8b 0c 95 ec 36 11 80 	mov    -0x7feec914(,%edx,4),%ecx
80102a5f:	89 4c 96 04          	mov    %ecx,0x4(%esi,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102a63:	83 c2 01             	add    $0x1,%edx
80102a66:	39 da                	cmp    %ebx,%edx
80102a68:	75 ee                	jne    80102a58 <write_head+0x38>
  }
  bwrite(buf);
80102a6a:	89 3c 24             	mov    %edi,(%esp)
80102a6d:	e8 2e d7 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102a72:	89 3c 24             	mov    %edi,(%esp)
80102a75:	e8 66 d7 ff ff       	call   801001e0 <brelse>
}
80102a7a:	83 c4 1c             	add    $0x1c,%esp
80102a7d:	5b                   	pop    %ebx
80102a7e:	5e                   	pop    %esi
80102a7f:	5f                   	pop    %edi
80102a80:	5d                   	pop    %ebp
80102a81:	c3                   	ret    
80102a82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a90 <initlog>:
{
80102a90:	55                   	push   %ebp
80102a91:	89 e5                	mov    %esp,%ebp
80102a93:	56                   	push   %esi
80102a94:	53                   	push   %ebx
80102a95:	83 ec 30             	sub    $0x30,%esp
80102a98:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102a9b:	c7 44 24 04 80 7b 10 	movl   $0x80107b80,0x4(%esp)
80102aa2:	80 
80102aa3:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102aaa:	e8 01 1e 00 00       	call   801048b0 <initlock>
  readsb(dev, &sb);
80102aaf:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102ab2:	89 44 24 04          	mov    %eax,0x4(%esp)
80102ab6:	89 1c 24             	mov    %ebx,(%esp)
80102ab9:	e8 92 e9 ff ff       	call   80101450 <readsb>
  log.start = sb.logstart;
80102abe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  log.size = sb.nlog;
80102ac1:	8b 55 e8             	mov    -0x18(%ebp),%edx
  struct buf *buf = bread(log.dev, log.start);
80102ac4:	89 1c 24             	mov    %ebx,(%esp)
  log.dev = dev;
80102ac7:	89 1d e4 36 11 80    	mov    %ebx,0x801136e4
  struct buf *buf = bread(log.dev, log.start);
80102acd:	89 44 24 04          	mov    %eax,0x4(%esp)
  log.size = sb.nlog;
80102ad1:	89 15 d8 36 11 80    	mov    %edx,0x801136d8
  log.start = sb.logstart;
80102ad7:	a3 d4 36 11 80       	mov    %eax,0x801136d4
  struct buf *buf = bread(log.dev, log.start);
80102adc:	e8 ef d5 ff ff       	call   801000d0 <bread>
  for (i = 0; i < log.lh.n; i++) {
80102ae1:	31 d2                	xor    %edx,%edx
  log.lh.n = lh->n;
80102ae3:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102ae6:	8d 70 5c             	lea    0x5c(%eax),%esi
  for (i = 0; i < log.lh.n; i++) {
80102ae9:	85 db                	test   %ebx,%ebx
  log.lh.n = lh->n;
80102aeb:	89 1d e8 36 11 80    	mov    %ebx,0x801136e8
  for (i = 0; i < log.lh.n; i++) {
80102af1:	7e 17                	jle    80102b0a <initlog+0x7a>
80102af3:	90                   	nop
80102af4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    log.lh.block[i] = lh->block[i];
80102af8:	8b 4c 96 04          	mov    0x4(%esi,%edx,4),%ecx
80102afc:	89 0c 95 ec 36 11 80 	mov    %ecx,-0x7feec914(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102b03:	83 c2 01             	add    $0x1,%edx
80102b06:	39 da                	cmp    %ebx,%edx
80102b08:	75 ee                	jne    80102af8 <initlog+0x68>
  brelse(buf);
80102b0a:	89 04 24             	mov    %eax,(%esp)
80102b0d:	e8 ce d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b12:	e8 69 fe ff ff       	call   80102980 <install_trans>
  log.lh.n = 0;
80102b17:	c7 05 e8 36 11 80 00 	movl   $0x0,0x801136e8
80102b1e:	00 00 00 
  write_head(); // clear the log
80102b21:	e8 fa fe ff ff       	call   80102a20 <write_head>
}
80102b26:	83 c4 30             	add    $0x30,%esp
80102b29:	5b                   	pop    %ebx
80102b2a:	5e                   	pop    %esi
80102b2b:	5d                   	pop    %ebp
80102b2c:	c3                   	ret    
80102b2d:	8d 76 00             	lea    0x0(%esi),%esi

80102b30 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b30:	55                   	push   %ebp
80102b31:	89 e5                	mov    %esp,%ebp
80102b33:	83 ec 18             	sub    $0x18,%esp
  acquire(&log.lock);
80102b36:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102b3d:	e8 de 1e 00 00       	call   80104a20 <acquire>
80102b42:	eb 18                	jmp    80102b5c <begin_op+0x2c>
80102b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102b48:	c7 44 24 04 a0 36 11 	movl   $0x801136a0,0x4(%esp)
80102b4f:	80 
80102b50:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102b57:	e8 e4 15 00 00       	call   80104140 <sleep>
    if(log.committing){
80102b5c:	a1 e0 36 11 80       	mov    0x801136e0,%eax
80102b61:	85 c0                	test   %eax,%eax
80102b63:	75 e3                	jne    80102b48 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102b65:	a1 dc 36 11 80       	mov    0x801136dc,%eax
80102b6a:	8b 15 e8 36 11 80    	mov    0x801136e8,%edx
80102b70:	83 c0 01             	add    $0x1,%eax
80102b73:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b76:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b79:	83 fa 1e             	cmp    $0x1e,%edx
80102b7c:	7f ca                	jg     80102b48 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102b7e:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
      log.outstanding += 1;
80102b85:	a3 dc 36 11 80       	mov    %eax,0x801136dc
      release(&log.lock);
80102b8a:	e8 11 1f 00 00       	call   80104aa0 <release>
      break;
    }
  }
}
80102b8f:	c9                   	leave  
80102b90:	c3                   	ret    
80102b91:	eb 0d                	jmp    80102ba0 <end_op>
80102b93:	90                   	nop
80102b94:	90                   	nop
80102b95:	90                   	nop
80102b96:	90                   	nop
80102b97:	90                   	nop
80102b98:	90                   	nop
80102b99:	90                   	nop
80102b9a:	90                   	nop
80102b9b:	90                   	nop
80102b9c:	90                   	nop
80102b9d:	90                   	nop
80102b9e:	90                   	nop
80102b9f:	90                   	nop

80102ba0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102ba0:	55                   	push   %ebp
80102ba1:	89 e5                	mov    %esp,%ebp
80102ba3:	57                   	push   %edi
80102ba4:	56                   	push   %esi
80102ba5:	53                   	push   %ebx
80102ba6:	83 ec 1c             	sub    $0x1c,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102ba9:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102bb0:	e8 6b 1e 00 00       	call   80104a20 <acquire>
  log.outstanding -= 1;
80102bb5:	a1 dc 36 11 80       	mov    0x801136dc,%eax
  if(log.committing)
80102bba:	8b 15 e0 36 11 80    	mov    0x801136e0,%edx
  log.outstanding -= 1;
80102bc0:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102bc3:	85 d2                	test   %edx,%edx
  log.outstanding -= 1;
80102bc5:	a3 dc 36 11 80       	mov    %eax,0x801136dc
  if(log.committing)
80102bca:	0f 85 f3 00 00 00    	jne    80102cc3 <end_op+0x123>
    panic("log.committing");
  if(log.outstanding == 0){
80102bd0:	85 c0                	test   %eax,%eax
80102bd2:	0f 85 cb 00 00 00    	jne    80102ca3 <end_op+0x103>
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102bd8:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
}

static void
commit()
{
  if (log.lh.n > 0) {
80102bdf:	31 db                	xor    %ebx,%ebx
    log.committing = 1;
80102be1:	c7 05 e0 36 11 80 01 	movl   $0x1,0x801136e0
80102be8:	00 00 00 
  release(&log.lock);
80102beb:	e8 b0 1e 00 00       	call   80104aa0 <release>
  if (log.lh.n > 0) {
80102bf0:	a1 e8 36 11 80       	mov    0x801136e8,%eax
80102bf5:	85 c0                	test   %eax,%eax
80102bf7:	0f 8e 90 00 00 00    	jle    80102c8d <end_op+0xed>
80102bfd:	8d 76 00             	lea    0x0(%esi),%esi
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c00:	a1 d4 36 11 80       	mov    0x801136d4,%eax
80102c05:	01 d8                	add    %ebx,%eax
80102c07:	83 c0 01             	add    $0x1,%eax
80102c0a:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c0e:	a1 e4 36 11 80       	mov    0x801136e4,%eax
80102c13:	89 04 24             	mov    %eax,(%esp)
80102c16:	e8 b5 d4 ff ff       	call   801000d0 <bread>
80102c1b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c1d:	8b 04 9d ec 36 11 80 	mov    -0x7feec914(,%ebx,4),%eax
  for (tail = 0; tail < log.lh.n; tail++) {
80102c24:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c27:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c2b:	a1 e4 36 11 80       	mov    0x801136e4,%eax
80102c30:	89 04 24             	mov    %eax,(%esp)
80102c33:	e8 98 d4 ff ff       	call   801000d0 <bread>
    memmove(to->data, from->data, BSIZE);
80102c38:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102c3f:	00 
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c40:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c42:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c45:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c49:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c4c:	89 04 24             	mov    %eax,(%esp)
80102c4f:	e8 4c 1f 00 00       	call   80104ba0 <memmove>
    bwrite(to);  // write the log
80102c54:	89 34 24             	mov    %esi,(%esp)
80102c57:	e8 44 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c5c:	89 3c 24             	mov    %edi,(%esp)
80102c5f:	e8 7c d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102c64:	89 34 24             	mov    %esi,(%esp)
80102c67:	e8 74 d5 ff ff       	call   801001e0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102c6c:	3b 1d e8 36 11 80    	cmp    0x801136e8,%ebx
80102c72:	7c 8c                	jl     80102c00 <end_op+0x60>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102c74:	e8 a7 fd ff ff       	call   80102a20 <write_head>
    install_trans(); // Now install writes to home locations
80102c79:	e8 02 fd ff ff       	call   80102980 <install_trans>
    log.lh.n = 0;
80102c7e:	c7 05 e8 36 11 80 00 	movl   $0x0,0x801136e8
80102c85:	00 00 00 
    write_head();    // Erase the transaction from the log
80102c88:	e8 93 fd ff ff       	call   80102a20 <write_head>
    acquire(&log.lock);
80102c8d:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102c94:	e8 87 1d 00 00       	call   80104a20 <acquire>
    log.committing = 0;
80102c99:	c7 05 e0 36 11 80 00 	movl   $0x0,0x801136e0
80102ca0:	00 00 00 
    wakeup(&log);
80102ca3:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102caa:	e8 61 16 00 00       	call   80104310 <wakeup>
    release(&log.lock);
80102caf:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102cb6:	e8 e5 1d 00 00       	call   80104aa0 <release>
}
80102cbb:	83 c4 1c             	add    $0x1c,%esp
80102cbe:	5b                   	pop    %ebx
80102cbf:	5e                   	pop    %esi
80102cc0:	5f                   	pop    %edi
80102cc1:	5d                   	pop    %ebp
80102cc2:	c3                   	ret    
    panic("log.committing");
80102cc3:	c7 04 24 84 7b 10 80 	movl   $0x80107b84,(%esp)
80102cca:	e8 91 d6 ff ff       	call   80100360 <panic>
80102ccf:	90                   	nop

80102cd0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102cd0:	55                   	push   %ebp
80102cd1:	89 e5                	mov    %esp,%ebp
80102cd3:	53                   	push   %ebx
80102cd4:	83 ec 14             	sub    $0x14,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102cd7:	a1 e8 36 11 80       	mov    0x801136e8,%eax
{
80102cdc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102cdf:	83 f8 1d             	cmp    $0x1d,%eax
80102ce2:	0f 8f 98 00 00 00    	jg     80102d80 <log_write+0xb0>
80102ce8:	8b 0d d8 36 11 80    	mov    0x801136d8,%ecx
80102cee:	8d 51 ff             	lea    -0x1(%ecx),%edx
80102cf1:	39 d0                	cmp    %edx,%eax
80102cf3:	0f 8d 87 00 00 00    	jge    80102d80 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102cf9:	a1 dc 36 11 80       	mov    0x801136dc,%eax
80102cfe:	85 c0                	test   %eax,%eax
80102d00:	0f 8e 86 00 00 00    	jle    80102d8c <log_write+0xbc>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d06:	c7 04 24 a0 36 11 80 	movl   $0x801136a0,(%esp)
80102d0d:	e8 0e 1d 00 00       	call   80104a20 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d12:	8b 15 e8 36 11 80    	mov    0x801136e8,%edx
80102d18:	83 fa 00             	cmp    $0x0,%edx
80102d1b:	7e 54                	jle    80102d71 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d1d:	8b 4b 08             	mov    0x8(%ebx),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102d20:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d22:	39 0d ec 36 11 80    	cmp    %ecx,0x801136ec
80102d28:	75 0f                	jne    80102d39 <log_write+0x69>
80102d2a:	eb 3c                	jmp    80102d68 <log_write+0x98>
80102d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102d30:	39 0c 85 ec 36 11 80 	cmp    %ecx,-0x7feec914(,%eax,4)
80102d37:	74 2f                	je     80102d68 <log_write+0x98>
  for (i = 0; i < log.lh.n; i++) {
80102d39:	83 c0 01             	add    $0x1,%eax
80102d3c:	39 d0                	cmp    %edx,%eax
80102d3e:	75 f0                	jne    80102d30 <log_write+0x60>
      break;
  }
  log.lh.block[i] = b->blockno;
80102d40:	89 0c 95 ec 36 11 80 	mov    %ecx,-0x7feec914(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102d47:	83 c2 01             	add    $0x1,%edx
80102d4a:	89 15 e8 36 11 80    	mov    %edx,0x801136e8
  b->flags |= B_DIRTY; // prevent eviction
80102d50:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102d53:	c7 45 08 a0 36 11 80 	movl   $0x801136a0,0x8(%ebp)
}
80102d5a:	83 c4 14             	add    $0x14,%esp
80102d5d:	5b                   	pop    %ebx
80102d5e:	5d                   	pop    %ebp
  release(&log.lock);
80102d5f:	e9 3c 1d 00 00       	jmp    80104aa0 <release>
80102d64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  log.lh.block[i] = b->blockno;
80102d68:	89 0c 85 ec 36 11 80 	mov    %ecx,-0x7feec914(,%eax,4)
80102d6f:	eb df                	jmp    80102d50 <log_write+0x80>
80102d71:	8b 43 08             	mov    0x8(%ebx),%eax
80102d74:	a3 ec 36 11 80       	mov    %eax,0x801136ec
  if (i == log.lh.n)
80102d79:	75 d5                	jne    80102d50 <log_write+0x80>
80102d7b:	eb ca                	jmp    80102d47 <log_write+0x77>
80102d7d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("too big a transaction");
80102d80:	c7 04 24 93 7b 10 80 	movl   $0x80107b93,(%esp)
80102d87:	e8 d4 d5 ff ff       	call   80100360 <panic>
    panic("log_write outside of trans");
80102d8c:	c7 04 24 a9 7b 10 80 	movl   $0x80107ba9,(%esp)
80102d93:	e8 c8 d5 ff ff       	call   80100360 <panic>
80102d98:	66 90                	xchg   %ax,%ax
80102d9a:	66 90                	xchg   %ax,%ax
80102d9c:	66 90                	xchg   %ax,%ax
80102d9e:	66 90                	xchg   %ax,%ax

80102da0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102da0:	55                   	push   %ebp
80102da1:	89 e5                	mov    %esp,%ebp
80102da3:	53                   	push   %ebx
80102da4:	83 ec 14             	sub    $0x14,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102da7:	e8 64 09 00 00       	call   80103710 <cpuid>
80102dac:	89 c3                	mov    %eax,%ebx
80102dae:	e8 5d 09 00 00       	call   80103710 <cpuid>
80102db3:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80102db7:	c7 04 24 c4 7b 10 80 	movl   $0x80107bc4,(%esp)
80102dbe:	89 44 24 04          	mov    %eax,0x4(%esp)
80102dc2:	e8 89 d8 ff ff       	call   80100650 <cprintf>
  idtinit();       // load idt register
80102dc7:	e8 a4 31 00 00       	call   80105f70 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102dcc:	e8 bf 08 00 00       	call   80103690 <mycpu>
80102dd1:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102dd3:	b8 01 00 00 00       	mov    $0x1,%eax
80102dd8:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102ddf:	e8 1c 0e 00 00       	call   80103c00 <scheduler>
80102de4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102dea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102df0 <mpenter>:
{
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102df6:	e8 35 42 00 00       	call   80107030 <switchkvm>
  seginit();
80102dfb:	e8 70 41 00 00       	call   80106f70 <seginit>
  lapicinit();
80102e00:	e8 8b f8 ff ff       	call   80102690 <lapicinit>
  mpmain();
80102e05:	e8 96 ff ff ff       	call   80102da0 <mpmain>
80102e0a:	66 90                	xchg   %ax,%ax
80102e0c:	66 90                	xchg   %ax,%ax
80102e0e:	66 90                	xchg   %ax,%ax

80102e10 <main>:
{
80102e10:	55                   	push   %ebp
80102e11:	89 e5                	mov    %esp,%ebp
80102e13:	53                   	push   %ebx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e14:	bb a0 37 11 80       	mov    $0x801137a0,%ebx
{
80102e19:	83 e4 f0             	and    $0xfffffff0,%esp
80102e1c:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e1f:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102e26:	80 
80102e27:	c7 04 24 c8 72 11 80 	movl   $0x801172c8,(%esp)
80102e2e:	e8 cd f5 ff ff       	call   80102400 <kinit1>
  kvmalloc();      // kernel page table
80102e33:	e8 88 46 00 00       	call   801074c0 <kvmalloc>
  mpinit();        // detect other processors
80102e38:	e8 73 01 00 00       	call   80102fb0 <mpinit>
80102e3d:	8d 76 00             	lea    0x0(%esi),%esi
  lapicinit();     // interrupt controller
80102e40:	e8 4b f8 ff ff       	call   80102690 <lapicinit>
  seginit();       // segment descriptors
80102e45:	e8 26 41 00 00       	call   80106f70 <seginit>
  picinit();       // disable pic
80102e4a:	e8 21 03 00 00       	call   80103170 <picinit>
80102e4f:	90                   	nop
  ioapicinit();    // another interrupt controller
80102e50:	e8 db f3 ff ff       	call   80102230 <ioapicinit>
  consoleinit();   // console hardware
80102e55:	e8 46 db ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102e5a:	e8 31 34 00 00       	call   80106290 <uartinit>
80102e5f:	90                   	nop
  pinit();         // process table
80102e60:	e8 0b 08 00 00       	call   80103670 <pinit>
  tvinit();        // trap vectors
80102e65:	e8 66 30 00 00       	call   80105ed0 <tvinit>
  binit();         // buffer cache
80102e6a:	e8 d1 d1 ff ff       	call   80100040 <binit>
80102e6f:	90                   	nop
  fileinit();      // file table
80102e70:	e8 0b df ff ff       	call   80100d80 <fileinit>
  ideinit();       // disk 
80102e75:	e8 b6 f1 ff ff       	call   80102030 <ideinit>
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102e7a:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102e81:	00 
80102e82:	c7 44 24 04 8c b4 10 	movl   $0x8010b48c,0x4(%esp)
80102e89:	80 
80102e8a:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102e91:	e8 0a 1d 00 00       	call   80104ba0 <memmove>
  for(c = cpus; c < cpus+ncpu; c++){
80102e96:	69 05 20 3d 11 80 b0 	imul   $0xb0,0x80113d20,%eax
80102e9d:	00 00 00 
80102ea0:	05 a0 37 11 80       	add    $0x801137a0,%eax
80102ea5:	39 d8                	cmp    %ebx,%eax
80102ea7:	76 6a                	jbe    80102f13 <main+0x103>
80102ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102eb0:	e8 db 07 00 00       	call   80103690 <mycpu>
80102eb5:	39 d8                	cmp    %ebx,%eax
80102eb7:	74 41                	je     80102efa <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102eb9:	e8 02 f6 ff ff       	call   801024c0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void(**)(void))(code-8) = mpenter;
80102ebe:	c7 05 f8 6f 00 80 f0 	movl   $0x80102df0,0x80006ff8
80102ec5:	2d 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102ec8:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
80102ecf:	a0 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
80102ed2:	05 00 10 00 00       	add    $0x1000,%eax
80102ed7:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc

    lapicstartap(c->apicid, V2P(code));
80102edc:	0f b6 03             	movzbl (%ebx),%eax
80102edf:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102ee6:	00 
80102ee7:	89 04 24             	mov    %eax,(%esp)
80102eea:	e8 e1 f8 ff ff       	call   801027d0 <lapicstartap>
80102eef:	90                   	nop

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102ef0:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102ef6:	85 c0                	test   %eax,%eax
80102ef8:	74 f6                	je     80102ef0 <main+0xe0>
  for(c = cpus; c < cpus+ncpu; c++){
80102efa:	69 05 20 3d 11 80 b0 	imul   $0xb0,0x80113d20,%eax
80102f01:	00 00 00 
80102f04:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f0a:	05 a0 37 11 80       	add    $0x801137a0,%eax
80102f0f:	39 c3                	cmp    %eax,%ebx
80102f11:	72 9d                	jb     80102eb0 <main+0xa0>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f13:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102f1a:	8e 
80102f1b:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102f22:	e8 49 f5 ff ff       	call   80102470 <kinit2>
  userinit();      // first user process
80102f27:	e8 34 08 00 00       	call   80103760 <userinit>
  mpmain();        // finish this processor's setup
80102f2c:	e8 6f fe ff ff       	call   80102da0 <mpmain>
80102f31:	66 90                	xchg   %ax,%ax
80102f33:	66 90                	xchg   %ax,%ax
80102f35:	66 90                	xchg   %ax,%ax
80102f37:	66 90                	xchg   %ax,%ax
80102f39:	66 90                	xchg   %ax,%ax
80102f3b:	66 90                	xchg   %ax,%ax
80102f3d:	66 90                	xchg   %ax,%ax
80102f3f:	90                   	nop

80102f40 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f40:	55                   	push   %ebp
80102f41:	89 e5                	mov    %esp,%ebp
80102f43:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f44:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
{
80102f4a:	53                   	push   %ebx
  e = addr+len;
80102f4b:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
{
80102f4e:	83 ec 10             	sub    $0x10,%esp
  for(p = addr; p < e; p += sizeof(struct mp))
80102f51:	39 de                	cmp    %ebx,%esi
80102f53:	73 3c                	jae    80102f91 <mpsearch1+0x51>
80102f55:	8d 76 00             	lea    0x0(%esi),%esi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102f58:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102f5f:	00 
80102f60:	c7 44 24 04 d8 7b 10 	movl   $0x80107bd8,0x4(%esp)
80102f67:	80 
80102f68:	89 34 24             	mov    %esi,(%esp)
80102f6b:	e8 e0 1b 00 00       	call   80104b50 <memcmp>
80102f70:	85 c0                	test   %eax,%eax
80102f72:	75 16                	jne    80102f8a <mpsearch1+0x4a>
80102f74:	31 c9                	xor    %ecx,%ecx
80102f76:	31 d2                	xor    %edx,%edx
    sum += addr[i];
80102f78:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
  for(i=0; i<len; i++)
80102f7c:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80102f7f:	01 c1                	add    %eax,%ecx
  for(i=0; i<len; i++)
80102f81:	83 fa 10             	cmp    $0x10,%edx
80102f84:	75 f2                	jne    80102f78 <mpsearch1+0x38>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102f86:	84 c9                	test   %cl,%cl
80102f88:	74 10                	je     80102f9a <mpsearch1+0x5a>
  for(p = addr; p < e; p += sizeof(struct mp))
80102f8a:	83 c6 10             	add    $0x10,%esi
80102f8d:	39 f3                	cmp    %esi,%ebx
80102f8f:	77 c7                	ja     80102f58 <mpsearch1+0x18>
      return (struct mp*)p;
  return 0;
}
80102f91:	83 c4 10             	add    $0x10,%esp
  return 0;
80102f94:	31 c0                	xor    %eax,%eax
}
80102f96:	5b                   	pop    %ebx
80102f97:	5e                   	pop    %esi
80102f98:	5d                   	pop    %ebp
80102f99:	c3                   	ret    
80102f9a:	83 c4 10             	add    $0x10,%esp
80102f9d:	89 f0                	mov    %esi,%eax
80102f9f:	5b                   	pop    %ebx
80102fa0:	5e                   	pop    %esi
80102fa1:	5d                   	pop    %ebp
80102fa2:	c3                   	ret    
80102fa3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102fb0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80102fb0:	55                   	push   %ebp
80102fb1:	89 e5                	mov    %esp,%ebp
80102fb3:	57                   	push   %edi
80102fb4:	56                   	push   %esi
80102fb5:	53                   	push   %ebx
80102fb6:	83 ec 1c             	sub    $0x1c,%esp
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80102fb9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102fc0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102fc7:	c1 e0 08             	shl    $0x8,%eax
80102fca:	09 d0                	or     %edx,%eax
80102fcc:	c1 e0 04             	shl    $0x4,%eax
80102fcf:	85 c0                	test   %eax,%eax
80102fd1:	75 1b                	jne    80102fee <mpinit+0x3e>
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80102fd3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102fda:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102fe1:	c1 e0 08             	shl    $0x8,%eax
80102fe4:	09 d0                	or     %edx,%eax
80102fe6:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80102fe9:	2d 00 04 00 00       	sub    $0x400,%eax
    if((mp = mpsearch1(p, 1024)))
80102fee:	ba 00 04 00 00       	mov    $0x400,%edx
80102ff3:	e8 48 ff ff ff       	call   80102f40 <mpsearch1>
80102ff8:	85 c0                	test   %eax,%eax
80102ffa:	89 c7                	mov    %eax,%edi
80102ffc:	0f 84 22 01 00 00    	je     80103124 <mpinit+0x174>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103002:	8b 77 04             	mov    0x4(%edi),%esi
80103005:	85 f6                	test   %esi,%esi
80103007:	0f 84 30 01 00 00    	je     8010313d <mpinit+0x18d>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010300d:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103013:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
8010301a:	00 
8010301b:	c7 44 24 04 dd 7b 10 	movl   $0x80107bdd,0x4(%esp)
80103022:	80 
80103023:	89 04 24             	mov    %eax,(%esp)
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103026:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103029:	e8 22 1b 00 00       	call   80104b50 <memcmp>
8010302e:	85 c0                	test   %eax,%eax
80103030:	0f 85 07 01 00 00    	jne    8010313d <mpinit+0x18d>
  if(conf->version != 1 && conf->version != 4)
80103036:	0f b6 86 06 00 00 80 	movzbl -0x7ffffffa(%esi),%eax
8010303d:	3c 04                	cmp    $0x4,%al
8010303f:	0f 85 0b 01 00 00    	jne    80103150 <mpinit+0x1a0>
  if(sum((uchar*)conf, conf->length) != 0)
80103045:	0f b7 86 04 00 00 80 	movzwl -0x7ffffffc(%esi),%eax
  for(i=0; i<len; i++)
8010304c:	85 c0                	test   %eax,%eax
8010304e:	74 21                	je     80103071 <mpinit+0xc1>
  sum = 0;
80103050:	31 c9                	xor    %ecx,%ecx
  for(i=0; i<len; i++)
80103052:	31 d2                	xor    %edx,%edx
80103054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103058:	0f b6 9c 16 00 00 00 	movzbl -0x80000000(%esi,%edx,1),%ebx
8010305f:	80 
  for(i=0; i<len; i++)
80103060:	83 c2 01             	add    $0x1,%edx
    sum += addr[i];
80103063:	01 d9                	add    %ebx,%ecx
  for(i=0; i<len; i++)
80103065:	39 d0                	cmp    %edx,%eax
80103067:	7f ef                	jg     80103058 <mpinit+0xa8>
  if(sum((uchar*)conf, conf->length) != 0)
80103069:	84 c9                	test   %cl,%cl
8010306b:	0f 85 cc 00 00 00    	jne    8010313d <mpinit+0x18d>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
80103071:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103074:	85 c0                	test   %eax,%eax
80103076:	0f 84 c1 00 00 00    	je     8010313d <mpinit+0x18d>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
8010307c:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
  ismp = 1;
80103082:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
80103087:	a3 9c 36 11 80       	mov    %eax,0x8011369c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010308c:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
80103093:	8d 86 2c 00 00 80    	lea    -0x7fffffd4(%esi),%eax
80103099:	03 55 e4             	add    -0x1c(%ebp),%edx
8010309c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801030a0:	39 c2                	cmp    %eax,%edx
801030a2:	76 1b                	jbe    801030bf <mpinit+0x10f>
801030a4:	0f b6 08             	movzbl (%eax),%ecx
    switch(*p){
801030a7:	80 f9 04             	cmp    $0x4,%cl
801030aa:	77 74                	ja     80103120 <mpinit+0x170>
801030ac:	ff 24 8d 1c 7c 10 80 	jmp    *-0x7fef83e4(,%ecx,4)
801030b3:	90                   	nop
801030b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801030b8:	83 c0 08             	add    $0x8,%eax
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030bb:	39 c2                	cmp    %eax,%edx
801030bd:	77 e5                	ja     801030a4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
801030bf:	85 db                	test   %ebx,%ebx
801030c1:	0f 84 93 00 00 00    	je     8010315a <mpinit+0x1aa>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
801030c7:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
801030cb:	74 12                	je     801030df <mpinit+0x12f>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801030cd:	ba 22 00 00 00       	mov    $0x22,%edx
801030d2:	b8 70 00 00 00       	mov    $0x70,%eax
801030d7:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801030d8:	b2 23                	mov    $0x23,%dl
801030da:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801030db:	83 c8 01             	or     $0x1,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801030de:	ee                   	out    %al,(%dx)
  }
}
801030df:	83 c4 1c             	add    $0x1c,%esp
801030e2:	5b                   	pop    %ebx
801030e3:	5e                   	pop    %esi
801030e4:	5f                   	pop    %edi
801030e5:	5d                   	pop    %ebp
801030e6:	c3                   	ret    
801030e7:	90                   	nop
      if(ncpu < NCPU) {
801030e8:	8b 35 20 3d 11 80    	mov    0x80113d20,%esi
801030ee:	83 fe 07             	cmp    $0x7,%esi
801030f1:	7f 17                	jg     8010310a <mpinit+0x15a>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
801030f3:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
801030f7:	69 f6 b0 00 00 00    	imul   $0xb0,%esi,%esi
        ncpu++;
801030fd:	83 05 20 3d 11 80 01 	addl   $0x1,0x80113d20
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103104:	88 8e a0 37 11 80    	mov    %cl,-0x7feec860(%esi)
      p += sizeof(struct mpproc);
8010310a:	83 c0 14             	add    $0x14,%eax
      continue;
8010310d:	eb 91                	jmp    801030a0 <mpinit+0xf0>
8010310f:	90                   	nop
      ioapicid = ioapic->apicno;
80103110:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
      p += sizeof(struct mpioapic);
80103114:	83 c0 08             	add    $0x8,%eax
      ioapicid = ioapic->apicno;
80103117:	88 0d 80 37 11 80    	mov    %cl,0x80113780
      continue;
8010311d:	eb 81                	jmp    801030a0 <mpinit+0xf0>
8010311f:	90                   	nop
      ismp = 0;
80103120:	31 db                	xor    %ebx,%ebx
80103122:	eb 83                	jmp    801030a7 <mpinit+0xf7>
  return mpsearch1(0xF0000, 0x10000);
80103124:	ba 00 00 01 00       	mov    $0x10000,%edx
80103129:	b8 00 00 0f 00       	mov    $0xf0000,%eax
8010312e:	e8 0d fe ff ff       	call   80102f40 <mpsearch1>
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103133:	85 c0                	test   %eax,%eax
  return mpsearch1(0xF0000, 0x10000);
80103135:	89 c7                	mov    %eax,%edi
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103137:	0f 85 c5 fe ff ff    	jne    80103002 <mpinit+0x52>
    panic("Expect to run on an SMP");
8010313d:	c7 04 24 e2 7b 10 80 	movl   $0x80107be2,(%esp)
80103144:	e8 17 d2 ff ff       	call   80100360 <panic>
80103149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(conf->version != 1 && conf->version != 4)
80103150:	3c 01                	cmp    $0x1,%al
80103152:	0f 84 ed fe ff ff    	je     80103045 <mpinit+0x95>
80103158:	eb e3                	jmp    8010313d <mpinit+0x18d>
    panic("Didn't find a suitable machine");
8010315a:	c7 04 24 fc 7b 10 80 	movl   $0x80107bfc,(%esp)
80103161:	e8 fa d1 ff ff       	call   80100360 <panic>
80103166:	66 90                	xchg   %ax,%ax
80103168:	66 90                	xchg   %ax,%ax
8010316a:	66 90                	xchg   %ax,%ax
8010316c:	66 90                	xchg   %ax,%ax
8010316e:	66 90                	xchg   %ax,%ax

80103170 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
80103170:	55                   	push   %ebp
80103171:	ba 21 00 00 00       	mov    $0x21,%edx
80103176:	89 e5                	mov    %esp,%ebp
80103178:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010317d:	ee                   	out    %al,(%dx)
8010317e:	b2 a1                	mov    $0xa1,%dl
80103180:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80103181:	5d                   	pop    %ebp
80103182:	c3                   	ret    
80103183:	66 90                	xchg   %ax,%ax
80103185:	66 90                	xchg   %ax,%ax
80103187:	66 90                	xchg   %ax,%ax
80103189:	66 90                	xchg   %ax,%ax
8010318b:	66 90                	xchg   %ax,%ax
8010318d:	66 90                	xchg   %ax,%ax
8010318f:	90                   	nop

80103190 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103190:	55                   	push   %ebp
80103191:	89 e5                	mov    %esp,%ebp
80103193:	57                   	push   %edi
80103194:	56                   	push   %esi
80103195:	53                   	push   %ebx
80103196:	83 ec 1c             	sub    $0x1c,%esp
80103199:	8b 75 08             	mov    0x8(%ebp),%esi
8010319c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010319f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801031a5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801031ab:	e8 f0 db ff ff       	call   80100da0 <filealloc>
801031b0:	85 c0                	test   %eax,%eax
801031b2:	89 06                	mov    %eax,(%esi)
801031b4:	0f 84 a4 00 00 00    	je     8010325e <pipealloc+0xce>
801031ba:	e8 e1 db ff ff       	call   80100da0 <filealloc>
801031bf:	85 c0                	test   %eax,%eax
801031c1:	89 03                	mov    %eax,(%ebx)
801031c3:	0f 84 87 00 00 00    	je     80103250 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801031c9:	e8 f2 f2 ff ff       	call   801024c0 <kalloc>
801031ce:	85 c0                	test   %eax,%eax
801031d0:	89 c7                	mov    %eax,%edi
801031d2:	74 7c                	je     80103250 <pipealloc+0xc0>
    goto bad;
  p->readopen = 1;
801031d4:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801031db:	00 00 00 
  p->writeopen = 1;
801031de:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801031e5:	00 00 00 
  p->nwrite = 0;
801031e8:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801031ef:	00 00 00 
  p->nread = 0;
801031f2:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801031f9:	00 00 00 
  initlock(&p->lock, "pipe");
801031fc:	89 04 24             	mov    %eax,(%esp)
801031ff:	c7 44 24 04 30 7c 10 	movl   $0x80107c30,0x4(%esp)
80103206:	80 
80103207:	e8 a4 16 00 00       	call   801048b0 <initlock>
  (*f0)->type = FD_PIPE;
8010320c:	8b 06                	mov    (%esi),%eax
8010320e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103214:	8b 06                	mov    (%esi),%eax
80103216:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010321a:	8b 06                	mov    (%esi),%eax
8010321c:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103220:	8b 06                	mov    (%esi),%eax
80103222:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103225:	8b 03                	mov    (%ebx),%eax
80103227:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
8010322d:	8b 03                	mov    (%ebx),%eax
8010322f:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103233:	8b 03                	mov    (%ebx),%eax
80103235:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103239:	8b 03                	mov    (%ebx),%eax
  return 0;
8010323b:	31 db                	xor    %ebx,%ebx
  (*f1)->pipe = p;
8010323d:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103240:	83 c4 1c             	add    $0x1c,%esp
80103243:	89 d8                	mov    %ebx,%eax
80103245:	5b                   	pop    %ebx
80103246:	5e                   	pop    %esi
80103247:	5f                   	pop    %edi
80103248:	5d                   	pop    %ebp
80103249:	c3                   	ret    
8010324a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(*f0)
80103250:	8b 06                	mov    (%esi),%eax
80103252:	85 c0                	test   %eax,%eax
80103254:	74 08                	je     8010325e <pipealloc+0xce>
    fileclose(*f0);
80103256:	89 04 24             	mov    %eax,(%esp)
80103259:	e8 02 dc ff ff       	call   80100e60 <fileclose>
  if(*f1)
8010325e:	8b 03                	mov    (%ebx),%eax
  return -1;
80103260:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  if(*f1)
80103265:	85 c0                	test   %eax,%eax
80103267:	74 d7                	je     80103240 <pipealloc+0xb0>
    fileclose(*f1);
80103269:	89 04 24             	mov    %eax,(%esp)
8010326c:	e8 ef db ff ff       	call   80100e60 <fileclose>
}
80103271:	83 c4 1c             	add    $0x1c,%esp
80103274:	89 d8                	mov    %ebx,%eax
80103276:	5b                   	pop    %ebx
80103277:	5e                   	pop    %esi
80103278:	5f                   	pop    %edi
80103279:	5d                   	pop    %ebp
8010327a:	c3                   	ret    
8010327b:	90                   	nop
8010327c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103280 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103280:	55                   	push   %ebp
80103281:	89 e5                	mov    %esp,%ebp
80103283:	56                   	push   %esi
80103284:	53                   	push   %ebx
80103285:	83 ec 10             	sub    $0x10,%esp
80103288:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010328b:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010328e:	89 1c 24             	mov    %ebx,(%esp)
80103291:	e8 8a 17 00 00       	call   80104a20 <acquire>
  if(writable){
80103296:	85 f6                	test   %esi,%esi
80103298:	74 3e                	je     801032d8 <pipeclose+0x58>
    p->writeopen = 0;
    wakeup(&p->nread);
8010329a:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
    p->writeopen = 0;
801032a0:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801032a7:	00 00 00 
    wakeup(&p->nread);
801032aa:	89 04 24             	mov    %eax,(%esp)
801032ad:	e8 5e 10 00 00       	call   80104310 <wakeup>
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801032b2:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801032b8:	85 d2                	test   %edx,%edx
801032ba:	75 0a                	jne    801032c6 <pipeclose+0x46>
801032bc:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801032c2:	85 c0                	test   %eax,%eax
801032c4:	74 32                	je     801032f8 <pipeclose+0x78>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801032c6:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801032c9:	83 c4 10             	add    $0x10,%esp
801032cc:	5b                   	pop    %ebx
801032cd:	5e                   	pop    %esi
801032ce:	5d                   	pop    %ebp
    release(&p->lock);
801032cf:	e9 cc 17 00 00       	jmp    80104aa0 <release>
801032d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    wakeup(&p->nwrite);
801032d8:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
    p->readopen = 0;
801032de:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801032e5:	00 00 00 
    wakeup(&p->nwrite);
801032e8:	89 04 24             	mov    %eax,(%esp)
801032eb:	e8 20 10 00 00       	call   80104310 <wakeup>
801032f0:	eb c0                	jmp    801032b2 <pipeclose+0x32>
801032f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&p->lock);
801032f8:	89 1c 24             	mov    %ebx,(%esp)
801032fb:	e8 a0 17 00 00       	call   80104aa0 <release>
    kfree((char*)p);
80103300:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80103303:	83 c4 10             	add    $0x10,%esp
80103306:	5b                   	pop    %ebx
80103307:	5e                   	pop    %esi
80103308:	5d                   	pop    %ebp
    kfree((char*)p);
80103309:	e9 12 f0 ff ff       	jmp    80102320 <kfree>
8010330e:	66 90                	xchg   %ax,%ax

80103310 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103310:	55                   	push   %ebp
80103311:	89 e5                	mov    %esp,%ebp
80103313:	57                   	push   %edi
80103314:	56                   	push   %esi
80103315:	53                   	push   %ebx
80103316:	83 ec 1c             	sub    $0x1c,%esp
80103319:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010331c:	89 1c 24             	mov    %ebx,(%esp)
8010331f:	e8 fc 16 00 00       	call   80104a20 <acquire>
  for(i = 0; i < n; i++){
80103324:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103327:	85 c9                	test   %ecx,%ecx
80103329:	0f 8e b2 00 00 00    	jle    801033e1 <pipewrite+0xd1>
8010332f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103332:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
80103338:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010333e:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103344:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103347:	03 4d 10             	add    0x10(%ebp),%ecx
8010334a:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010334d:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
80103353:	81 c1 00 02 00 00    	add    $0x200,%ecx
80103359:	39 c8                	cmp    %ecx,%eax
8010335b:	74 38                	je     80103395 <pipewrite+0x85>
8010335d:	eb 55                	jmp    801033b4 <pipewrite+0xa4>
8010335f:	90                   	nop
      if(p->readopen == 0 || myproc()->killed){
80103360:	e8 cb 03 00 00       	call   80103730 <myproc>
80103365:	8b 40 24             	mov    0x24(%eax),%eax
80103368:	85 c0                	test   %eax,%eax
8010336a:	75 33                	jne    8010339f <pipewrite+0x8f>
      wakeup(&p->nread);
8010336c:	89 3c 24             	mov    %edi,(%esp)
8010336f:	e8 9c 0f 00 00       	call   80104310 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103374:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103378:	89 34 24             	mov    %esi,(%esp)
8010337b:	e8 c0 0d 00 00       	call   80104140 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103380:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103386:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010338c:	05 00 02 00 00       	add    $0x200,%eax
80103391:	39 c2                	cmp    %eax,%edx
80103393:	75 23                	jne    801033b8 <pipewrite+0xa8>
      if(p->readopen == 0 || myproc()->killed){
80103395:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010339b:	85 d2                	test   %edx,%edx
8010339d:	75 c1                	jne    80103360 <pipewrite+0x50>
        release(&p->lock);
8010339f:	89 1c 24             	mov    %ebx,(%esp)
801033a2:	e8 f9 16 00 00       	call   80104aa0 <release>
        return -1;
801033a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801033ac:	83 c4 1c             	add    $0x1c,%esp
801033af:	5b                   	pop    %ebx
801033b0:	5e                   	pop    %esi
801033b1:	5f                   	pop    %edi
801033b2:	5d                   	pop    %ebp
801033b3:	c3                   	ret    
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033b4:	89 c2                	mov    %eax,%edx
801033b6:	66 90                	xchg   %ax,%ax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801033b8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801033bb:	8d 42 01             	lea    0x1(%edx),%eax
801033be:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801033c4:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801033ca:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801033ce:	0f b6 09             	movzbl (%ecx),%ecx
801033d1:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
801033d5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801033d8:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
801033db:	0f 85 6c ff ff ff    	jne    8010334d <pipewrite+0x3d>
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801033e1:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801033e7:	89 04 24             	mov    %eax,(%esp)
801033ea:	e8 21 0f 00 00       	call   80104310 <wakeup>
  release(&p->lock);
801033ef:	89 1c 24             	mov    %ebx,(%esp)
801033f2:	e8 a9 16 00 00       	call   80104aa0 <release>
  return n;
801033f7:	8b 45 10             	mov    0x10(%ebp),%eax
801033fa:	eb b0                	jmp    801033ac <pipewrite+0x9c>
801033fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103400 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103400:	55                   	push   %ebp
80103401:	89 e5                	mov    %esp,%ebp
80103403:	57                   	push   %edi
80103404:	56                   	push   %esi
80103405:	53                   	push   %ebx
80103406:	83 ec 1c             	sub    $0x1c,%esp
80103409:	8b 75 08             	mov    0x8(%ebp),%esi
8010340c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010340f:	89 34 24             	mov    %esi,(%esp)
80103412:	e8 09 16 00 00       	call   80104a20 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103417:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
8010341d:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103423:	75 5b                	jne    80103480 <piperead+0x80>
80103425:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010342b:	85 db                	test   %ebx,%ebx
8010342d:	74 51                	je     80103480 <piperead+0x80>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
8010342f:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
80103435:	eb 25                	jmp    8010345c <piperead+0x5c>
80103437:	90                   	nop
80103438:	89 74 24 04          	mov    %esi,0x4(%esp)
8010343c:	89 1c 24             	mov    %ebx,(%esp)
8010343f:	e8 fc 0c 00 00       	call   80104140 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103444:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
8010344a:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103450:	75 2e                	jne    80103480 <piperead+0x80>
80103452:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103458:	85 d2                	test   %edx,%edx
8010345a:	74 24                	je     80103480 <piperead+0x80>
    if(myproc()->killed){
8010345c:	e8 cf 02 00 00       	call   80103730 <myproc>
80103461:	8b 48 24             	mov    0x24(%eax),%ecx
80103464:	85 c9                	test   %ecx,%ecx
80103466:	74 d0                	je     80103438 <piperead+0x38>
      release(&p->lock);
80103468:	89 34 24             	mov    %esi,(%esp)
8010346b:	e8 30 16 00 00       	call   80104aa0 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103470:	83 c4 1c             	add    $0x1c,%esp
      return -1;
80103473:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103478:	5b                   	pop    %ebx
80103479:	5e                   	pop    %esi
8010347a:	5f                   	pop    %edi
8010347b:	5d                   	pop    %ebp
8010347c:	c3                   	ret    
8010347d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103480:	8b 55 10             	mov    0x10(%ebp),%edx
    if(p->nread == p->nwrite)
80103483:	31 db                	xor    %ebx,%ebx
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103485:	85 d2                	test   %edx,%edx
80103487:	7f 2b                	jg     801034b4 <piperead+0xb4>
80103489:	eb 31                	jmp    801034bc <piperead+0xbc>
8010348b:	90                   	nop
8010348c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103490:	8d 48 01             	lea    0x1(%eax),%ecx
80103493:	25 ff 01 00 00       	and    $0x1ff,%eax
80103498:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010349e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
801034a3:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801034a6:	83 c3 01             	add    $0x1,%ebx
801034a9:	3b 5d 10             	cmp    0x10(%ebp),%ebx
801034ac:	74 0e                	je     801034bc <piperead+0xbc>
    if(p->nread == p->nwrite)
801034ae:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
801034b4:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
801034ba:	75 d4                	jne    80103490 <piperead+0x90>
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
801034bc:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801034c2:	89 04 24             	mov    %eax,(%esp)
801034c5:	e8 46 0e 00 00       	call   80104310 <wakeup>
  release(&p->lock);
801034ca:	89 34 24             	mov    %esi,(%esp)
801034cd:	e8 ce 15 00 00       	call   80104aa0 <release>
}
801034d2:	83 c4 1c             	add    $0x1c,%esp
  return i;
801034d5:	89 d8                	mov    %ebx,%eax
}
801034d7:	5b                   	pop    %ebx
801034d8:	5e                   	pop    %esi
801034d9:	5f                   	pop    %edi
801034da:	5d                   	pop    %ebp
801034db:	c3                   	ret    
801034dc:	66 90                	xchg   %ax,%ax
801034de:	66 90                	xchg   %ax,%ax

801034e0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc *
allocproc(void)
{
801034e0:	55                   	push   %ebp
801034e1:	89 e5                	mov    %esp,%ebp
801034e3:	53                   	push   %ebx
  // int thread_exit_value;
  // ushort thread_count;

  acquire(&ptable.lock);

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801034e4:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
{
801034e9:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);
801034ec:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801034f3:	e8 28 15 00 00       	call   80104a20 <acquire>
801034f8:	eb 18                	jmp    80103512 <allocproc+0x32>
801034fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103500:	81 c3 b4 00 00 00    	add    $0xb4,%ebx
80103506:	81 fb 74 6a 11 80    	cmp    $0x80116a74,%ebx
8010350c:	0f 84 e6 00 00 00    	je     801035f8 <allocproc+0x118>
    if (p->state == UNUSED)
80103512:	8b 43 0c             	mov    0xc(%ebx),%eax
80103515:	85 c0                	test   %eax,%eax
80103517:	75 e7                	jne    80103500 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103519:	a1 04 b0 10 80       	mov    0x8010b004,%eax

  release(&ptable.lock);
8010351e:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
  p->state = EMBRYO;
80103525:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
8010352c:	8d 50 01             	lea    0x1(%eax),%edx
8010352f:	89 15 04 b0 10 80    	mov    %edx,0x8010b004
80103535:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103538:	e8 63 15 00 00       	call   80104aa0 <release>

  // Allocate kernel stack.
  if ((p->kstack = kalloc()) == 0)
8010353d:	e8 7e ef ff ff       	call   801024c0 <kalloc>
80103542:	85 c0                	test   %eax,%eax
80103544:	89 43 08             	mov    %eax,0x8(%ebx)
80103547:	0f 84 bf 00 00 00    	je     8010360c <allocproc+0x12c>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010354d:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint *)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103553:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
80103558:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint *)sp = (uint)trapret;
8010355b:	c7 40 14 b9 5e 10 80 	movl   $0x80105eb9,0x14(%eax)
  p->context = (struct context *)sp;
  memset(p->context, 0, sizeof *p->context);
80103562:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80103569:	00 
8010356a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80103571:	00 
80103572:	89 04 24             	mov    %eax,(%esp)
  p->context = (struct context *)sp;
80103575:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103578:	e8 83 15 00 00       	call   80104b00 <memset>
  p->context->eip = (uint)forkret;
8010357d:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103580:	c7 40 10 20 36 10 80 	movl   $0x80103620,0x10(%eax)

#ifdef PROC_TIMES
  cmostime(&(p->begin_date));
80103587:	8d 43 7c             	lea    0x7c(%ebx),%eax
8010358a:	89 04 24             	mov    %eax,(%esp)
8010358d:	e8 ce f2 ff ff       	call   80102860 <cmostime>
#ifdef KTHREADS
  // #error The new data memebers for the kthreads are initialized
  // #error in here. Be sure to give the oncpu member a value of -1
  // #error and next_tid a value of 1.
  p->oncpu = -1;
  p->is_thread = 0;
80103592:	31 c0                	xor    %eax,%eax
  p->is_parent = 0;
80103594:	31 d2                	xor    %edx,%edx
  p->is_thread = 0;
80103596:	66 89 83 a4 00 00 00 	mov    %ax,0xa4(%ebx)
  p->tid = 0;
  p->next_tid = 1;
8010359d:	b8 01 00 00 00       	mov    $0x1,%eax
  p->tid = 0;
801035a2:	31 c9                	xor    %ecx,%ecx
  p->next_tid = 1;
801035a4:	66 89 83 aa 00 00 00 	mov    %ax,0xaa(%ebx)
  p->thread_exit_value = 0;
  p->thread_count = 0;
801035ab:	31 c0                	xor    %eax,%eax
801035ad:	66 89 83 b0 00 00 00 	mov    %ax,0xb0(%ebx)
#endif // KTHREADS

  return p;
801035b4:	89 d8                	mov    %ebx,%eax
  p->ticks_total = 0;
801035b6:	c7 83 94 00 00 00 00 	movl   $0x0,0x94(%ebx)
801035bd:	00 00 00 
  p->sched_times = 0;
801035c0:	c7 83 9c 00 00 00 00 	movl   $0x0,0x9c(%ebx)
801035c7:	00 00 00 
  p->oncpu = -1;
801035ca:	c7 83 a0 00 00 00 ff 	movl   $0xffffffff,0xa0(%ebx)
801035d1:	ff ff ff 
  p->is_parent = 0;
801035d4:	66 89 93 a6 00 00 00 	mov    %dx,0xa6(%ebx)
  p->tid = 0;
801035db:	66 89 8b a8 00 00 00 	mov    %cx,0xa8(%ebx)
  p->thread_exit_value = 0;
801035e2:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
801035e9:	00 00 00 
}
801035ec:	83 c4 14             	add    $0x14,%esp
801035ef:	5b                   	pop    %ebx
801035f0:	5d                   	pop    %ebp
801035f1:	c3                   	ret    
801035f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
801035f8:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801035ff:	e8 9c 14 00 00       	call   80104aa0 <release>
}
80103604:	83 c4 14             	add    $0x14,%esp
  return 0;
80103607:	31 c0                	xor    %eax,%eax
}
80103609:	5b                   	pop    %ebx
8010360a:	5d                   	pop    %ebp
8010360b:	c3                   	ret    
    p->state = UNUSED;
8010360c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103613:	eb d7                	jmp    801035ec <allocproc+0x10c>
80103615:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103620 <forkret>:
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void forkret(void)
{
80103620:	55                   	push   %ebp
80103621:	89 e5                	mov    %esp,%ebp
80103623:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103626:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
8010362d:	e8 6e 14 00 00       	call   80104aa0 <release>

  if (first)
80103632:	a1 00 b0 10 80       	mov    0x8010b000,%eax
80103637:	85 c0                	test   %eax,%eax
80103639:	75 05                	jne    80103640 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010363b:	c9                   	leave  
8010363c:	c3                   	ret    
8010363d:	8d 76 00             	lea    0x0(%esi),%esi
    iinit(ROOTDEV);
80103640:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    first = 0;
80103647:	c7 05 00 b0 10 80 00 	movl   $0x0,0x8010b000
8010364e:	00 00 00 
    iinit(ROOTDEV);
80103651:	e8 4a de ff ff       	call   801014a0 <iinit>
    initlog(ROOTDEV);
80103656:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010365d:	e8 2e f4 ff ff       	call   80102a90 <initlog>
}
80103662:	c9                   	leave  
80103663:	c3                   	ret    
80103664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010366a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103670 <pinit>:
{
80103670:	55                   	push   %ebp
80103671:	89 e5                	mov    %esp,%ebp
80103673:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
80103676:	c7 44 24 04 35 7c 10 	movl   $0x80107c35,0x4(%esp)
8010367d:	80 
8010367e:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103685:	e8 26 12 00 00       	call   801048b0 <initlock>
}
8010368a:	c9                   	leave  
8010368b:	c3                   	ret    
8010368c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103690 <mycpu>:
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	56                   	push   %esi
80103694:	53                   	push   %ebx
80103695:	83 ec 10             	sub    $0x10,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103698:	9c                   	pushf  
80103699:	58                   	pop    %eax
  if (readeflags() & FL_IF)
8010369a:	f6 c4 02             	test   $0x2,%ah
8010369d:	75 57                	jne    801036f6 <mycpu+0x66>
  apicid = lapicid();
8010369f:	e8 dc f0 ff ff       	call   80102780 <lapicid>
  for (i = 0; i < ncpu; ++i)
801036a4:	8b 35 20 3d 11 80    	mov    0x80113d20,%esi
801036aa:	85 f6                	test   %esi,%esi
801036ac:	7e 3c                	jle    801036ea <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036ae:	0f b6 15 a0 37 11 80 	movzbl 0x801137a0,%edx
801036b5:	39 c2                	cmp    %eax,%edx
801036b7:	74 2d                	je     801036e6 <mycpu+0x56>
801036b9:	b9 50 38 11 80       	mov    $0x80113850,%ecx
  for (i = 0; i < ncpu; ++i)
801036be:	31 d2                	xor    %edx,%edx
801036c0:	83 c2 01             	add    $0x1,%edx
801036c3:	39 f2                	cmp    %esi,%edx
801036c5:	74 23                	je     801036ea <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036c7:	0f b6 19             	movzbl (%ecx),%ebx
801036ca:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
801036d0:	39 c3                	cmp    %eax,%ebx
801036d2:	75 ec                	jne    801036c0 <mycpu+0x30>
      return &cpus[i];
801036d4:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
}
801036da:	83 c4 10             	add    $0x10,%esp
801036dd:	5b                   	pop    %ebx
801036de:	5e                   	pop    %esi
801036df:	5d                   	pop    %ebp
      return &cpus[i];
801036e0:	05 a0 37 11 80       	add    $0x801137a0,%eax
}
801036e5:	c3                   	ret    
  for (i = 0; i < ncpu; ++i)
801036e6:	31 d2                	xor    %edx,%edx
801036e8:	eb ea                	jmp    801036d4 <mycpu+0x44>
  panic("unknown apicid\n");
801036ea:	c7 04 24 3c 7c 10 80 	movl   $0x80107c3c,(%esp)
801036f1:	e8 6a cc ff ff       	call   80100360 <panic>
    panic("mycpu called with interrupts enabled\n");
801036f6:	c7 04 24 54 7e 10 80 	movl   $0x80107e54,(%esp)
801036fd:	e8 5e cc ff ff       	call   80100360 <panic>
80103702:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103710 <cpuid>:
{
80103710:	55                   	push   %ebp
80103711:	89 e5                	mov    %esp,%ebp
80103713:	83 ec 08             	sub    $0x8,%esp
  return mycpu() - cpus;
80103716:	e8 75 ff ff ff       	call   80103690 <mycpu>
}
8010371b:	c9                   	leave  
  return mycpu() - cpus;
8010371c:	2d a0 37 11 80       	sub    $0x801137a0,%eax
80103721:	c1 f8 04             	sar    $0x4,%eax
80103724:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010372a:	c3                   	ret    
8010372b:	90                   	nop
8010372c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103730 <myproc>:
{
80103730:	55                   	push   %ebp
80103731:	89 e5                	mov    %esp,%ebp
80103733:	53                   	push   %ebx
80103734:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103737:	e8 f4 11 00 00       	call   80104930 <pushcli>
  c = mycpu();
8010373c:	e8 4f ff ff ff       	call   80103690 <mycpu>
  p = c->proc;
80103741:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103747:	e8 24 12 00 00       	call   80104970 <popcli>
}
8010374c:	83 c4 04             	add    $0x4,%esp
8010374f:	89 d8                	mov    %ebx,%eax
80103751:	5b                   	pop    %ebx
80103752:	5d                   	pop    %ebp
80103753:	c3                   	ret    
80103754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010375a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103760 <userinit>:
{
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	53                   	push   %ebx
80103764:	83 ec 14             	sub    $0x14,%esp
  p = allocproc();
80103767:	e8 74 fd ff ff       	call   801034e0 <allocproc>
8010376c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010376e:	a3 bc b5 10 80       	mov    %eax,0x8010b5bc
  if ((p->pgdir = setupkvm()) == 0)
80103773:	e8 b8 3c 00 00       	call   80107430 <setupkvm>
80103778:	85 c0                	test   %eax,%eax
8010377a:	89 43 04             	mov    %eax,0x4(%ebx)
8010377d:	0f 84 d4 00 00 00    	je     80103857 <userinit+0xf7>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103783:	89 04 24             	mov    %eax,(%esp)
80103786:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
8010378d:	00 
8010378e:	c7 44 24 04 60 b4 10 	movl   $0x8010b460,0x4(%esp)
80103795:	80 
80103796:	e8 c5 39 00 00       	call   80107160 <inituvm>
  p->sz = PGSIZE;
8010379b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801037a1:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
801037a8:	00 
801037a9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801037b0:	00 
801037b1:	8b 43 18             	mov    0x18(%ebx),%eax
801037b4:	89 04 24             	mov    %eax,(%esp)
801037b7:	e8 44 13 00 00       	call   80104b00 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037bc:	8b 43 18             	mov    0x18(%ebx),%eax
801037bf:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037c4:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037c9:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037cd:	8b 43 18             	mov    0x18(%ebx),%eax
801037d0:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801037d4:	8b 43 18             	mov    0x18(%ebx),%eax
801037d7:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037db:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801037df:	8b 43 18             	mov    0x18(%ebx),%eax
801037e2:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037e6:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801037ea:	8b 43 18             	mov    0x18(%ebx),%eax
801037ed:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801037f4:	8b 43 18             	mov    0x18(%ebx),%eax
801037f7:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0; // beginning of initcode.S
801037fe:	8b 43 18             	mov    0x18(%ebx),%eax
80103801:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103808:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010380b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103812:	00 
80103813:	c7 44 24 04 65 7c 10 	movl   $0x80107c65,0x4(%esp)
8010381a:	80 
8010381b:	89 04 24             	mov    %eax,(%esp)
8010381e:	e8 bd 14 00 00       	call   80104ce0 <safestrcpy>
  p->cwd = namei("/");
80103823:	c7 04 24 6e 7c 10 80 	movl   $0x80107c6e,(%esp)
8010382a:	e8 01 e7 ff ff       	call   80101f30 <namei>
8010382f:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103832:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103839:	e8 e2 11 00 00       	call   80104a20 <acquire>
  p->state = RUNNABLE;
8010383e:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103845:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
8010384c:	e8 4f 12 00 00       	call   80104aa0 <release>
}
80103851:	83 c4 14             	add    $0x14,%esp
80103854:	5b                   	pop    %ebx
80103855:	5d                   	pop    %ebp
80103856:	c3                   	ret    
    panic("userinit: out of memory?");
80103857:	c7 04 24 4c 7c 10 80 	movl   $0x80107c4c,(%esp)
8010385e:	e8 fd ca ff ff       	call   80100360 <panic>
80103863:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103870 <growproc>:
{
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	56                   	push   %esi
80103874:	53                   	push   %ebx
80103875:	83 ec 10             	sub    $0x10,%esp
80103878:	8b 75 08             	mov    0x8(%ebp),%esi
  struct proc *curproc = myproc();
8010387b:	e8 b0 fe ff ff       	call   80103730 <myproc>
  if (n > 0)
80103880:	83 fe 00             	cmp    $0x0,%esi
  struct proc *curproc = myproc();
80103883:	89 c3                	mov    %eax,%ebx
  sz = curproc->sz;
80103885:	8b 00                	mov    (%eax),%eax
  if (n > 0)
80103887:	7e 2f                	jle    801038b8 <growproc+0x48>
    if ((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103889:	01 c6                	add    %eax,%esi
8010388b:	89 74 24 08          	mov    %esi,0x8(%esp)
8010388f:	89 44 24 04          	mov    %eax,0x4(%esp)
80103893:	8b 43 04             	mov    0x4(%ebx),%eax
80103896:	89 04 24             	mov    %eax,(%esp)
80103899:	e8 02 3a 00 00       	call   801072a0 <allocuvm>
8010389e:	85 c0                	test   %eax,%eax
801038a0:	74 36                	je     801038d8 <growproc+0x68>
  curproc->sz = sz;
801038a2:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038a4:	89 1c 24             	mov    %ebx,(%esp)
801038a7:	e8 a4 37 00 00       	call   80107050 <switchuvm>
  return 0;
801038ac:	31 c0                	xor    %eax,%eax
}
801038ae:	83 c4 10             	add    $0x10,%esp
801038b1:	5b                   	pop    %ebx
801038b2:	5e                   	pop    %esi
801038b3:	5d                   	pop    %ebp
801038b4:	c3                   	ret    
801038b5:	8d 76 00             	lea    0x0(%esi),%esi
  else if (n < 0)
801038b8:	74 e8                	je     801038a2 <growproc+0x32>
    if ((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038ba:	01 c6                	add    %eax,%esi
801038bc:	89 74 24 08          	mov    %esi,0x8(%esp)
801038c0:	89 44 24 04          	mov    %eax,0x4(%esp)
801038c4:	8b 43 04             	mov    0x4(%ebx),%eax
801038c7:	89 04 24             	mov    %eax,(%esp)
801038ca:	e8 c1 3a 00 00       	call   80107390 <deallocuvm>
801038cf:	85 c0                	test   %eax,%eax
801038d1:	75 cf                	jne    801038a2 <growproc+0x32>
801038d3:	90                   	nop
801038d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      return -1;
801038d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801038dd:	eb cf                	jmp    801038ae <growproc+0x3e>
801038df:	90                   	nop

801038e0 <fork>:
{
801038e0:	55                   	push   %ebp
801038e1:	89 e5                	mov    %esp,%ebp
801038e3:	57                   	push   %edi
801038e4:	56                   	push   %esi
801038e5:	53                   	push   %ebx
801038e6:	83 ec 2c             	sub    $0x2c,%esp
  struct proc *curproc = myproc();
801038e9:	e8 42 fe ff ff       	call   80103730 <myproc>
801038ee:	89 c3                	mov    %eax,%ebx
  if ((np = allocproc()) == 0)
801038f0:	e8 eb fb ff ff       	call   801034e0 <allocproc>
801038f5:	85 c0                	test   %eax,%eax
801038f7:	89 c7                	mov    %eax,%edi
801038f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801038fc:	0f 84 f0 00 00 00    	je     801039f2 <fork+0x112>
  if ((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0)
80103902:	8b 03                	mov    (%ebx),%eax
80103904:	89 44 24 04          	mov    %eax,0x4(%esp)
80103908:	8b 43 04             	mov    0x4(%ebx),%eax
8010390b:	89 04 24             	mov    %eax,(%esp)
8010390e:	e8 fd 3b 00 00       	call   80107510 <copyuvm>
80103913:	85 c0                	test   %eax,%eax
80103915:	89 47 04             	mov    %eax,0x4(%edi)
80103918:	0f 84 db 00 00 00    	je     801039f9 <fork+0x119>
  np->sz = curproc->sz;
8010391e:	8b 03                	mov    (%ebx),%eax
80103920:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103923:	89 01                	mov    %eax,(%ecx)
  *np->tf = *curproc->tf;
80103925:	8b 79 18             	mov    0x18(%ecx),%edi
80103928:	89 c8                	mov    %ecx,%eax
  np->parent = curproc;
8010392a:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
8010392d:	8b 73 18             	mov    0x18(%ebx),%esi
80103930:	b9 13 00 00 00       	mov    $0x13,%ecx
80103935:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for (i = 0; i < NOFILE; i++)
80103937:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
80103939:	8b 40 18             	mov    0x18(%eax),%eax
8010393c:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103943:	90                   	nop
80103944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (curproc->ofile[i])
80103948:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
8010394c:	85 c0                	test   %eax,%eax
8010394e:	74 0f                	je     8010395f <fork+0x7f>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103950:	89 04 24             	mov    %eax,(%esp)
80103953:	e8 b8 d4 ff ff       	call   80100e10 <filedup>
80103958:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010395b:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for (i = 0; i < NOFILE; i++)
8010395f:	83 c6 01             	add    $0x1,%esi
80103962:	83 fe 10             	cmp    $0x10,%esi
80103965:	75 e1                	jne    80103948 <fork+0x68>
  np->cwd = idup(curproc->cwd);
80103967:	8b 43 68             	mov    0x68(%ebx),%eax
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
8010396a:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
8010396d:	89 04 24             	mov    %eax,(%esp)
80103970:	e8 3b dd ff ff       	call   801016b0 <idup>
80103975:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103978:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
8010397b:	8d 47 6c             	lea    0x6c(%edi),%eax
8010397e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103985:	00 
80103986:	89 5c 24 04          	mov    %ebx,0x4(%esp)
8010398a:	89 04 24             	mov    %eax,(%esp)
8010398d:	e8 4e 13 00 00       	call   80104ce0 <safestrcpy>
  if (proc_kdebug_level > 0)
80103992:	66 83 3d b8 b5 10 80 	cmpw   $0x0,0x8010b5b8
80103999:	00 
8010399a:	75 34                	jne    801039d0 <fork+0xf0>
  pid = np->pid;
8010399c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010399f:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
801039a2:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801039a9:	e8 72 10 00 00       	call   80104a20 <acquire>
  np->state = RUNNABLE;
801039ae:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
801039b5:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801039bc:	e8 df 10 00 00       	call   80104aa0 <release>
  return pid;
801039c1:	89 d8                	mov    %ebx,%eax
}
801039c3:	83 c4 2c             	add    $0x2c,%esp
801039c6:	5b                   	pop    %ebx
801039c7:	5e                   	pop    %esi
801039c8:	5f                   	pop    %edi
801039c9:	5d                   	pop    %ebp
801039ca:	c3                   	ret    
801039cb:	90                   	nop
801039cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("kdebug: %s %d: process %s forked\n", __FILE__, __LINE__, curproc->name);
801039d0:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
801039d4:	c7 44 24 08 03 01 00 	movl   $0x103,0x8(%esp)
801039db:	00 
801039dc:	c7 44 24 04 4c 81 10 	movl   $0x8010814c,0x4(%esp)
801039e3:	80 
801039e4:	c7 04 24 7c 7e 10 80 	movl   $0x80107e7c,(%esp)
801039eb:	e8 60 cc ff ff       	call   80100650 <cprintf>
801039f0:	eb aa                	jmp    8010399c <fork+0xbc>
    return -1;
801039f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039f7:	eb ca                	jmp    801039c3 <fork+0xe3>
    kfree(np->kstack);
801039f9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801039fc:	8b 47 08             	mov    0x8(%edi),%eax
801039ff:	89 04 24             	mov    %eax,(%esp)
80103a02:	e8 19 e9 ff ff       	call   80102320 <kfree>
    return -1;
80103a07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    np->kstack = 0;
80103a0c:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a13:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a1a:	eb a7                	jmp    801039c3 <fork+0xe3>
80103a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103a20 <kthread_create>:
{
80103a20:	55                   	push   %ebp
80103a21:	89 e5                	mov    %esp,%ebp
80103a23:	57                   	push   %edi
80103a24:	56                   	push   %esi
80103a25:	53                   	push   %ebx
80103a26:	83 ec 2c             	sub    $0x2c,%esp
  struct proc *curproc = myproc();
80103a29:	e8 02 fd ff ff       	call   80103730 <myproc>
  if (proc_kdebug_level)
80103a2e:	66 83 3d b8 b5 10 80 	cmpw   $0x0,0x8010b5b8
80103a35:	00 
  struct proc *curproc = myproc();
80103a36:	89 c2                	mov    %eax,%edx
  if (proc_kdebug_level)
80103a38:	0f 85 5a 01 00 00    	jne    80103b98 <kthread_create+0x178>
  if (((uint)tstack) % PGSIZE != 0)
80103a3e:	f7 45 10 ff 0f 00 00 	testl  $0xfff,0x10(%ebp)
80103a45:	0f 85 8a 01 00 00    	jne    80103bd5 <kthread_create+0x1b5>
80103a4b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  if ((np = allocproc()) == 0)
80103a4e:	e8 8d fa ff ff       	call   801034e0 <allocproc>
80103a53:	85 c0                	test   %eax,%eax
80103a55:	89 c3                	mov    %eax,%ebx
80103a57:	0f 84 8b 01 00 00    	je     80103be8 <kthread_create+0x1c8>
  np->pgdir = curproc->pgdir; // all threads in a process share a single page table
80103a5d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  np->is_thread = 1;
80103a60:	b9 01 00 00 00       	mov    $0x1,%ecx
  np->pgdir = curproc->pgdir; // all threads in a process share a single page table
80103a65:	8b 42 04             	mov    0x4(%edx),%eax
80103a68:	89 43 04             	mov    %eax,0x4(%ebx)
  np->sz = curproc->sz;       // same process as curproc, so size should be the same
80103a6b:	8b 02                	mov    (%edx),%eax
  np->is_thread = 1;
80103a6d:	66 89 8b a4 00 00 00 	mov    %cx,0xa4(%ebx)
  np->sz = curproc->sz;       // same process as curproc, so size should be the same
80103a74:	89 03                	mov    %eax,(%ebx)
  if (curproc->is_thread)
80103a76:	66 83 ba a4 00 00 00 	cmpw   $0x0,0xa4(%edx)
80103a7d:	00 
80103a7e:	0f 84 f4 00 00 00    	je     80103b78 <kthread_create+0x158>
    np->parent = curproc->parent;
80103a84:	8b 42 14             	mov    0x14(%edx),%eax
80103a87:	89 43 14             	mov    %eax,0x14(%ebx)
    np->parent->thread_count++;
80103a8a:	66 83 80 b0 00 00 00 	addw   $0x1,0xb0(%eax)
80103a91:	01 
  *np->tf = *curproc->tf;
80103a92:	8b 72 18             	mov    0x18(%edx),%esi
80103a95:	b9 13 00 00 00       	mov    $0x13,%ecx
80103a9a:	8b 7b 18             	mov    0x18(%ebx),%edi
80103a9d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  np->tf->eip = (uint)func;               // assign func to IP for new thread
80103a9f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for (i = 0; i < NOFILE; i++)
80103aa2:	31 f6                	xor    %esi,%esi
  np->tf->eip = (uint)func;               // assign func to IP for new thread
80103aa4:	8b 43 18             	mov    0x18(%ebx),%eax
80103aa7:	89 48 38             	mov    %ecx,0x38(%eax)
  np->tf->esp = ((int)tstack) + PGSIZE;   // assign stack pointer to tstack
80103aaa:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103aad:	8b 43 18             	mov    0x18(%ebx),%eax
80103ab0:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80103ab6:	89 48 44             	mov    %ecx,0x44(%eax)
  np->tf->esp -= sizeof(int);             // make space for an int to be pushed onto the stack
80103ab9:	8b 43 18             	mov    0x18(%ebx),%eax
  *((int *)(np->tf->esp)) = (int)arg_ptr; // push arg_ptr onto the stack
80103abc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  np->tf->esp -= sizeof(int);             // make space for an int to be pushed onto the stack
80103abf:	83 68 44 04          	subl   $0x4,0x44(%eax)
  *((int *)(np->tf->esp)) = (int)arg_ptr; // push arg_ptr onto the stack
80103ac3:	8b 43 18             	mov    0x18(%ebx),%eax
80103ac6:	8b 40 44             	mov    0x44(%eax),%eax
80103ac9:	89 08                	mov    %ecx,(%eax)
  tid = np->parent->next_tid;    // assign tid
80103acb:	8b 43 14             	mov    0x14(%ebx),%eax
80103ace:	0f b7 88 aa 00 00 00 	movzwl 0xaa(%eax),%ecx
  np->tid = tid;                 // assign np's unique thread ID
80103ad5:	66 89 8b a8 00 00 00 	mov    %cx,0xa8(%ebx)
  tid = np->parent->next_tid;    // assign tid
80103adc:	0f b7 f9             	movzwl %cx,%edi
  np->parent->next_tid++;        // increment parent's next_tid
80103adf:	66 83 80 aa 00 00 00 	addw   $0x1,0xaa(%eax)
80103ae6:	01 
  np->tf->esp -= sizeof(int);    // make space for an int to be pushed onto the stack
80103ae7:	8b 43 18             	mov    0x18(%ebx),%eax
  for (i = 0; i < NOFILE; i++)
80103aea:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  np->tf->esp -= sizeof(int);    // make space for an int to be pushed onto the stack
80103aed:	83 68 44 04          	subl   $0x4,0x44(%eax)
  *((int *)(np->tf->esp)) = tid; // push tid onto the stack
80103af1:	8b 43 18             	mov    0x18(%ebx),%eax
80103af4:	8b 40 44             	mov    0x44(%eax),%eax
80103af7:	89 38                	mov    %edi,(%eax)
  for (i = 0; i < NOFILE; i++)
80103af9:	89 f7                	mov    %esi,%edi
80103afb:	89 d6                	mov    %edx,%esi
80103afd:	8d 76 00             	lea    0x0(%esi),%esi
    if (curproc->ofile[i])
80103b00:	8b 44 be 28          	mov    0x28(%esi,%edi,4),%eax
80103b04:	85 c0                	test   %eax,%eax
80103b06:	74 0c                	je     80103b14 <kthread_create+0xf4>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103b08:	89 04 24             	mov    %eax,(%esp)
80103b0b:	e8 00 d3 ff ff       	call   80100e10 <filedup>
80103b10:	89 44 bb 28          	mov    %eax,0x28(%ebx,%edi,4)
  for (i = 0; i < NOFILE; i++)
80103b14:	83 c7 01             	add    $0x1,%edi
80103b17:	83 ff 10             	cmp    $0x10,%edi
80103b1a:	75 e4                	jne    80103b00 <kthread_create+0xe0>
  np->cwd = idup(curproc->cwd);
80103b1c:	8b 46 68             	mov    0x68(%esi),%eax
80103b1f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103b22:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80103b25:	89 04 24             	mov    %eax,(%esp)
80103b28:	e8 83 db ff ff       	call   801016b0 <idup>
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b2d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b30:	83 c2 6c             	add    $0x6c,%edx
  np->cwd = idup(curproc->cwd);
80103b33:	89 43 68             	mov    %eax,0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b36:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103b39:	89 54 24 04          	mov    %edx,0x4(%esp)
80103b3d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80103b44:	00 
80103b45:	89 04 24             	mov    %eax,(%esp)
80103b48:	e8 93 11 00 00       	call   80104ce0 <safestrcpy>
  acquire(&ptable.lock);
80103b4d:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103b54:	e8 c7 0e 00 00       	call   80104a20 <acquire>
  np->state = RUNNABLE;
80103b59:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103b60:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103b67:	e8 34 0f 00 00       	call   80104aa0 <release>
  return tid;
80103b6c:	89 f8                	mov    %edi,%eax
}
80103b6e:	83 c4 2c             	add    $0x2c,%esp
80103b71:	5b                   	pop    %ebx
80103b72:	5e                   	pop    %esi
80103b73:	5f                   	pop    %edi
80103b74:	5d                   	pop    %ebp
80103b75:	c3                   	ret    
80103b76:	66 90                	xchg   %ax,%ax
    curproc->is_parent = 1;
80103b78:	b8 01 00 00 00       	mov    $0x1,%eax
    np->parent = curproc;
80103b7d:	89 53 14             	mov    %edx,0x14(%ebx)
    curproc->is_parent = 1;
80103b80:	66 89 82 a6 00 00 00 	mov    %ax,0xa6(%edx)
    curproc->thread_count++;
80103b87:	66 83 82 b0 00 00 00 	addw   $0x1,0xb0(%edx)
80103b8e:	01 
80103b8f:	e9 fe fe ff ff       	jmp    80103a92 <kthread_create+0x72>
80103b94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%s %s %d: fork() called from process:  %s   pid: %d\n", __FILE__, __FUNCTION__, __LINE__, curproc->name, curproc->pid);
80103b98:	8b 40 10             	mov    0x10(%eax),%eax
80103b9b:	c7 44 24 0c 21 01 00 	movl   $0x121,0xc(%esp)
80103ba2:	00 
80103ba3:	c7 44 24 08 78 7f 10 	movl   $0x80107f78,0x8(%esp)
80103baa:	80 
80103bab:	c7 44 24 04 4c 81 10 	movl   $0x8010814c,0x4(%esp)
80103bb2:	80 
80103bb3:	89 44 24 14          	mov    %eax,0x14(%esp)
80103bb7:	8d 42 6c             	lea    0x6c(%edx),%eax
80103bba:	89 44 24 10          	mov    %eax,0x10(%esp)
80103bbe:	c7 04 24 a0 7e 10 80 	movl   $0x80107ea0,(%esp)
80103bc5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80103bc8:	e8 83 ca ff ff       	call   80100650 <cprintf>
80103bcd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103bd0:	e9 69 fe ff ff       	jmp    80103a3e <kthread_create+0x1e>
    cprintf("*** thread stack not page aligned ***\n");
80103bd5:	c7 04 24 d8 7e 10 80 	movl   $0x80107ed8,(%esp)
80103bdc:	e8 6f ca ff ff       	call   80100650 <cprintf>
    return -1; // return -1 if tstack is not page aligned
80103be1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103be6:	eb 86                	jmp    80103b6e <kthread_create+0x14e>
    return -1;
80103be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103bed:	e9 7c ff ff ff       	jmp    80103b6e <kthread_create+0x14e>
80103bf2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c00 <scheduler>:
{
80103c00:	55                   	push   %ebp
80103c01:	89 e5                	mov    %esp,%ebp
80103c03:	57                   	push   %edi
80103c04:	56                   	push   %esi
80103c05:	53                   	push   %ebx
80103c06:	83 ec 2c             	sub    $0x2c,%esp
  struct cpu *c = mycpu();
80103c09:	e8 82 fa ff ff       	call   80103690 <mycpu>
80103c0e:	89 c3                	mov    %eax,%ebx
  return mycpu() - cpus;
80103c10:	e8 7b fa ff ff       	call   80103690 <mycpu>
  c->proc = 0;
80103c15:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103c1c:	00 00 00 
  return mycpu() - cpus;
80103c1f:	2d a0 37 11 80       	sub    $0x801137a0,%eax
80103c24:	c1 f8 04             	sar    $0x4,%eax
80103c27:	69 f8 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%edi
80103c2d:	8d 43 04             	lea    0x4(%ebx),%eax
80103c30:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103c33:	90                   	nop
80103c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  asm volatile("sti");
80103c38:	fb                   	sti    
    acquire(&ptable.lock);
80103c39:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c40:	be 74 3d 11 80       	mov    $0x80113d74,%esi
    acquire(&ptable.lock);
80103c45:	e8 d6 0d 00 00       	call   80104a20 <acquire>
80103c4a:	eb 16                	jmp    80103c62 <scheduler+0x62>
80103c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c50:	81 c6 b4 00 00 00    	add    $0xb4,%esi
80103c56:	81 fe 74 6a 11 80    	cmp    $0x80116a74,%esi
80103c5c:	0f 84 88 00 00 00    	je     80103cea <scheduler+0xea>
      if (p->state != RUNNABLE)
80103c62:	83 7e 0c 03          	cmpl   $0x3,0xc(%esi)
80103c66:	75 e8                	jne    80103c50 <scheduler+0x50>
      if (proc_kdebug_level > 3)
80103c68:	66 83 3d b8 b5 10 80 	cmpw   $0x3,0x8010b5b8
80103c6f:	03 
80103c70:	0f 87 8a 00 00 00    	ja     80103d00 <scheduler+0x100>
      c->proc = p;
80103c76:	89 b3 ac 00 00 00    	mov    %esi,0xac(%ebx)
      switchuvm(p);
80103c7c:	89 34 24             	mov    %esi,(%esp)
80103c7f:	e8 cc 33 00 00       	call   80107050 <switchuvm>
      p->ticks_begin = ticks;
80103c84:	8b 15 c0 72 11 80    	mov    0x801172c0,%edx
      swtch(&(c->scheduler), p->context);
80103c8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      p->state = RUNNING;
80103c8d:	c7 46 0c 04 00 00 00 	movl   $0x4,0xc(%esi)
      p->sched_times++;
80103c94:	83 86 9c 00 00 00 01 	addl   $0x1,0x9c(%esi)
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c9b:	81 c6 b4 00 00 00    	add    $0xb4,%esi
      p->ticks_begin = ticks;
80103ca1:	89 56 e4             	mov    %edx,-0x1c(%esi)
      swtch(&(c->scheduler), p->context);
80103ca4:	8b 96 68 ff ff ff    	mov    -0x98(%esi),%edx
80103caa:	89 04 24             	mov    %eax,(%esp)
      p->oncpu = current_cpu;
80103cad:	89 7e ec             	mov    %edi,-0x14(%esi)
      swtch(&(c->scheduler), p->context);
80103cb0:	89 54 24 04          	mov    %edx,0x4(%esp)
80103cb4:	e8 82 10 00 00       	call   80104d3b <swtch>
      switchkvm();
80103cb9:	e8 72 33 00 00       	call   80107030 <switchkvm>
      p->ticks_total += ticks - p->ticks_begin;
80103cbe:	8b 56 e0             	mov    -0x20(%esi),%edx
80103cc1:	03 15 c0 72 11 80    	add    0x801172c0,%edx
80103cc7:	2b 56 e4             	sub    -0x1c(%esi),%edx
      p->oncpu = -1;
80103cca:	c7 46 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%esi)
      p->ticks_total += ticks - p->ticks_begin;
80103cd1:	89 56 e0             	mov    %edx,-0x20(%esi)
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cd4:	81 fe 74 6a 11 80    	cmp    $0x80116a74,%esi
      c->proc = 0;
80103cda:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103ce1:	00 00 00 
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ce4:	0f 85 78 ff ff ff    	jne    80103c62 <scheduler+0x62>
    release(&ptable.lock);
80103cea:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103cf1:	e8 aa 0d 00 00       	call   80104aa0 <release>
  }
80103cf6:	e9 3d ff ff ff       	jmp    80103c38 <scheduler+0x38>
80103cfb:	90                   	nop
80103cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf("\t%s %d: process selected %d\n", __FILE__, __LINE__, p->pid);
80103d00:	8b 56 10             	mov    0x10(%esi),%edx
80103d03:	c7 44 24 08 42 02 00 	movl   $0x242,0x8(%esp)
80103d0a:	00 
80103d0b:	c7 44 24 04 4c 81 10 	movl   $0x8010814c,0x4(%esp)
80103d12:	80 
80103d13:	c7 04 24 70 7c 10 80 	movl   $0x80107c70,(%esp)
80103d1a:	89 54 24 0c          	mov    %edx,0xc(%esp)
80103d1e:	e8 2d c9 ff ff       	call   80100650 <cprintf>
80103d23:	e9 4e ff ff ff       	jmp    80103c76 <scheduler+0x76>
80103d28:	90                   	nop
80103d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103d30 <sched>:
{
80103d30:	55                   	push   %ebp
80103d31:	89 e5                	mov    %esp,%ebp
80103d33:	56                   	push   %esi
80103d34:	53                   	push   %ebx
80103d35:	83 ec 10             	sub    $0x10,%esp
  struct proc *p = myproc();
80103d38:	e8 f3 f9 ff ff       	call   80103730 <myproc>
  if (!holding(&ptable.lock))
80103d3d:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
  struct proc *p = myproc();
80103d44:	89 c3                	mov    %eax,%ebx
  if (!holding(&ptable.lock))
80103d46:	e8 95 0c 00 00       	call   801049e0 <holding>
80103d4b:	85 c0                	test   %eax,%eax
80103d4d:	74 4f                	je     80103d9e <sched+0x6e>
  if (mycpu()->ncli != 1)
80103d4f:	e8 3c f9 ff ff       	call   80103690 <mycpu>
80103d54:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103d5b:	75 65                	jne    80103dc2 <sched+0x92>
  if (p->state == RUNNING)
80103d5d:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103d61:	74 53                	je     80103db6 <sched+0x86>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103d63:	9c                   	pushf  
80103d64:	58                   	pop    %eax
  if (readeflags() & FL_IF)
80103d65:	f6 c4 02             	test   $0x2,%ah
80103d68:	75 40                	jne    80103daa <sched+0x7a>
  intena = mycpu()->intena;
80103d6a:	e8 21 f9 ff ff       	call   80103690 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103d6f:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103d72:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103d78:	e8 13 f9 ff ff       	call   80103690 <mycpu>
80103d7d:	8b 40 04             	mov    0x4(%eax),%eax
80103d80:	89 1c 24             	mov    %ebx,(%esp)
80103d83:	89 44 24 04          	mov    %eax,0x4(%esp)
80103d87:	e8 af 0f 00 00       	call   80104d3b <swtch>
  mycpu()->intena = intena;
80103d8c:	e8 ff f8 ff ff       	call   80103690 <mycpu>
80103d91:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103d97:	83 c4 10             	add    $0x10,%esp
80103d9a:	5b                   	pop    %ebx
80103d9b:	5e                   	pop    %esi
80103d9c:	5d                   	pop    %ebp
80103d9d:	c3                   	ret    
    panic("sched ptable.lock");
80103d9e:	c7 04 24 8d 7c 10 80 	movl   $0x80107c8d,(%esp)
80103da5:	e8 b6 c5 ff ff       	call   80100360 <panic>
    panic("sched interruptible");
80103daa:	c7 04 24 b9 7c 10 80 	movl   $0x80107cb9,(%esp)
80103db1:	e8 aa c5 ff ff       	call   80100360 <panic>
    panic("sched running");
80103db6:	c7 04 24 ab 7c 10 80 	movl   $0x80107cab,(%esp)
80103dbd:	e8 9e c5 ff ff       	call   80100360 <panic>
    panic("sched locks");
80103dc2:	c7 04 24 9f 7c 10 80 	movl   $0x80107c9f,(%esp)
80103dc9:	e8 92 c5 ff ff       	call   80100360 <panic>
80103dce:	66 90                	xchg   %ax,%ax

80103dd0 <kthread_exit>:
{
80103dd0:	55                   	push   %ebp
80103dd1:	89 e5                	mov    %esp,%ebp
80103dd3:	56                   	push   %esi
80103dd4:	53                   	push   %ebx
  if (curproc->is_thread != TRUE)
80103dd5:	31 db                	xor    %ebx,%ebx
{
80103dd7:	83 ec 10             	sub    $0x10,%esp
  struct proc *curproc = myproc();
80103dda:	e8 51 f9 ff ff       	call   80103730 <myproc>
  if (curproc->is_thread != TRUE)
80103ddf:	66 83 b8 a4 00 00 00 	cmpw   $0x1,0xa4(%eax)
80103de6:	01 
  struct proc *curproc = myproc();
80103de7:	89 c6                	mov    %eax,%esi
  if (curproc->is_thread != TRUE)
80103de9:	74 25                	je     80103e10 <kthread_exit+0x40>
80103deb:	90                   	nop
80103dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if (curproc->ofile[fd])
80103df0:	8b 54 9e 28          	mov    0x28(%esi,%ebx,4),%edx
80103df4:	85 d2                	test   %edx,%edx
80103df6:	74 10                	je     80103e08 <kthread_exit+0x38>
        fileclose(curproc->ofile[fd]);
80103df8:	89 14 24             	mov    %edx,(%esp)
80103dfb:	e8 60 d0 ff ff       	call   80100e60 <fileclose>
        curproc->ofile[fd] = 0;
80103e00:	c7 44 9e 28 00 00 00 	movl   $0x0,0x28(%esi,%ebx,4)
80103e07:	00 
    for (fd = 0; fd < NOFILE; fd++)
80103e08:	83 c3 01             	add    $0x1,%ebx
80103e0b:	83 fb 10             	cmp    $0x10,%ebx
80103e0e:	75 e0                	jne    80103df0 <kthread_exit+0x20>
  begin_op();
80103e10:	e8 1b ed ff ff       	call   80102b30 <begin_op>
  iput(curproc->cwd);
80103e15:	8b 46 68             	mov    0x68(%esi),%eax
80103e18:	89 04 24             	mov    %eax,(%esp)
80103e1b:	e8 e0 d9 ff ff       	call   80101800 <iput>
  end_op();
80103e20:	e8 7b ed ff ff       	call   80102ba0 <end_op>
  curproc->thread_exit_value = exitValue;
80103e25:	8b 45 08             	mov    0x8(%ebp),%eax
  curproc->cwd = 0;
80103e28:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  curproc->killed = FALSE;
80103e2f:	c7 46 24 00 00 00 00 	movl   $0x0,0x24(%esi)
  curproc->oncpu = -1;
80103e36:	c7 86 a0 00 00 00 ff 	movl   $0xffffffff,0xa0(%esi)
80103e3d:	ff ff ff 
  curproc->thread_exit_value = exitValue;
80103e40:	89 86 ac 00 00 00    	mov    %eax,0xac(%esi)
  curproc->state = ZOMBIE;
80103e46:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  acquire(&ptable.lock);
80103e4d:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103e54:	e8 c7 0b 00 00       	call   80104a20 <acquire>
  sched();
80103e59:	e8 d2 fe ff ff       	call   80103d30 <sched>
  panic("kthread_exit");
80103e5e:	c7 04 24 cd 7c 10 80 	movl   $0x80107ccd,(%esp)
80103e65:	e8 f6 c4 ff ff       	call   80100360 <panic>
80103e6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103e70 <exit>:
{
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	56                   	push   %esi
80103e74:	53                   	push   %ebx
80103e75:	83 ec 10             	sub    $0x10,%esp
  struct proc *curproc = myproc();
80103e78:	e8 b3 f8 ff ff       	call   80103730 <myproc>
  if (curproc->is_thread == TRUE)
80103e7d:	66 83 b8 a4 00 00 00 	cmpw   $0x1,0xa4(%eax)
80103e84:	01 
  struct proc *curproc = myproc();
80103e85:	89 c3                	mov    %eax,%ebx
  if (curproc->is_thread == TRUE)
80103e87:	0f 84 29 01 00 00    	je     80103fb6 <exit+0x146>
  if (curproc->thread_count > 0)
80103e8d:	66 83 b8 b0 00 00 00 	cmpw   $0x0,0xb0(%eax)
80103e94:	00 
80103e95:	0f 85 0f 01 00 00    	jne    80103faa <exit+0x13a>
  if (curproc == initproc)
80103e9b:	31 f6                	xor    %esi,%esi
80103e9d:	3b 05 bc b5 10 80    	cmp    0x8010b5bc,%eax
80103ea3:	0f 84 19 01 00 00    	je     80103fc2 <exit+0x152>
80103ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (curproc->ofile[fd])
80103eb0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103eb4:	85 c0                	test   %eax,%eax
80103eb6:	74 10                	je     80103ec8 <exit+0x58>
      fileclose(curproc->ofile[fd]);
80103eb8:	89 04 24             	mov    %eax,(%esp)
80103ebb:	e8 a0 cf ff ff       	call   80100e60 <fileclose>
      curproc->ofile[fd] = 0;
80103ec0:	c7 44 b3 28 00 00 00 	movl   $0x0,0x28(%ebx,%esi,4)
80103ec7:	00 
  for (fd = 0; fd < NOFILE; fd++)
80103ec8:	83 c6 01             	add    $0x1,%esi
80103ecb:	83 fe 10             	cmp    $0x10,%esi
80103ece:	75 e0                	jne    80103eb0 <exit+0x40>
  begin_op();
80103ed0:	e8 5b ec ff ff       	call   80102b30 <begin_op>
  iput(curproc->cwd);
80103ed5:	8b 43 68             	mov    0x68(%ebx),%eax
80103ed8:	89 04 24             	mov    %eax,(%esp)
80103edb:	e8 20 d9 ff ff       	call   80101800 <iput>
  end_op();
80103ee0:	e8 bb ec ff ff       	call   80102ba0 <end_op>
  curproc->cwd = 0;
80103ee5:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
  acquire(&ptable.lock);
80103eec:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103ef3:	e8 28 0b 00 00       	call   80104a20 <acquire>
  wakeup1(curproc->parent);
80103ef8:	8b 43 14             	mov    0x14(%ebx),%eax
static void
wakeup1(void *chan)
{
  struct proc *p;

  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103efb:	ba 74 3d 11 80       	mov    $0x80113d74,%edx
80103f00:	eb 14                	jmp    80103f16 <exit+0xa6>
80103f02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103f08:	81 c2 b4 00 00 00    	add    $0xb4,%edx
80103f0e:	81 fa 74 6a 11 80    	cmp    $0x80116a74,%edx
80103f14:	74 20                	je     80103f36 <exit+0xc6>
    if (p->state == SLEEPING && p->chan == chan)
80103f16:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103f1a:	75 ec                	jne    80103f08 <exit+0x98>
80103f1c:	3b 42 20             	cmp    0x20(%edx),%eax
80103f1f:	75 e7                	jne    80103f08 <exit+0x98>
      p->state = RUNNABLE;
80103f21:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f28:	81 c2 b4 00 00 00    	add    $0xb4,%edx
80103f2e:	81 fa 74 6a 11 80    	cmp    $0x80116a74,%edx
80103f34:	75 e0                	jne    80103f16 <exit+0xa6>
      p->parent = initproc;
80103f36:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
80103f3b:	b9 74 3d 11 80       	mov    $0x80113d74,%ecx
80103f40:	eb 14                	jmp    80103f56 <exit+0xe6>
80103f42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f48:	81 c1 b4 00 00 00    	add    $0xb4,%ecx
80103f4e:	81 f9 74 6a 11 80    	cmp    $0x80116a74,%ecx
80103f54:	74 3c                	je     80103f92 <exit+0x122>
    if (p->parent == curproc)
80103f56:	39 59 14             	cmp    %ebx,0x14(%ecx)
80103f59:	75 ed                	jne    80103f48 <exit+0xd8>
      if (p->state == ZOMBIE)
80103f5b:	83 79 0c 05          	cmpl   $0x5,0xc(%ecx)
      p->parent = initproc;
80103f5f:	89 41 14             	mov    %eax,0x14(%ecx)
      if (p->state == ZOMBIE)
80103f62:	75 e4                	jne    80103f48 <exit+0xd8>
80103f64:	ba 74 3d 11 80       	mov    $0x80113d74,%edx
80103f69:	eb 13                	jmp    80103f7e <exit+0x10e>
80103f6b:	90                   	nop
80103f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f70:	81 c2 b4 00 00 00    	add    $0xb4,%edx
80103f76:	81 fa 74 6a 11 80    	cmp    $0x80116a74,%edx
80103f7c:	74 ca                	je     80103f48 <exit+0xd8>
    if (p->state == SLEEPING && p->chan == chan)
80103f7e:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103f82:	75 ec                	jne    80103f70 <exit+0x100>
80103f84:	3b 42 20             	cmp    0x20(%edx),%eax
80103f87:	75 e7                	jne    80103f70 <exit+0x100>
      p->state = RUNNABLE;
80103f89:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80103f90:	eb de                	jmp    80103f70 <exit+0x100>
  curproc->state = ZOMBIE;
80103f92:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
  sched();
80103f99:	e8 92 fd ff ff       	call   80103d30 <sched>
  panic("zombie exit");
80103f9e:	c7 04 24 fd 7c 10 80 	movl   $0x80107cfd,(%esp)
80103fa5:	e8 b6 c3 ff ff       	call   80100360 <panic>
    panic("called exit on thread0 with children");
80103faa:	c7 04 24 00 7f 10 80 	movl   $0x80107f00,(%esp)
80103fb1:	e8 aa c3 ff ff       	call   80100360 <panic>
    panic("called exit on thread");
80103fb6:	c7 04 24 da 7c 10 80 	movl   $0x80107cda,(%esp)
80103fbd:	e8 9e c3 ff ff       	call   80100360 <panic>
    panic("init exiting");
80103fc2:	c7 04 24 f0 7c 10 80 	movl   $0x80107cf0,(%esp)
80103fc9:	e8 92 c3 ff ff       	call   80100360 <panic>
80103fce:	66 90                	xchg   %ax,%ax

80103fd0 <yield>:
{
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock); //DOC: yieldlock
80103fd6:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103fdd:	e8 3e 0a 00 00       	call   80104a20 <acquire>
  myproc()->state = RUNNABLE;
80103fe2:	e8 49 f7 ff ff       	call   80103730 <myproc>
80103fe7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103fee:	e8 3d fd ff ff       	call   80103d30 <sched>
  release(&ptable.lock);
80103ff3:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80103ffa:	e8 a1 0a 00 00       	call   80104aa0 <release>
}
80103fff:	c9                   	leave  
80104000:	c3                   	ret    
80104001:	eb 0d                	jmp    80104010 <kthread_join>
80104003:	90                   	nop
80104004:	90                   	nop
80104005:	90                   	nop
80104006:	90                   	nop
80104007:	90                   	nop
80104008:	90                   	nop
80104009:	90                   	nop
8010400a:	90                   	nop
8010400b:	90                   	nop
8010400c:	90                   	nop
8010400d:	90                   	nop
8010400e:	90                   	nop
8010400f:	90                   	nop

80104010 <kthread_join>:
{
80104010:	55                   	push   %ebp
80104011:	89 e5                	mov    %esp,%ebp
80104013:	57                   	push   %edi
80104014:	56                   	push   %esi
80104015:	53                   	push   %ebx
80104016:	83 ec 1c             	sub    $0x1c,%esp
80104019:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct proc *curproc = myproc();
8010401c:	e8 0f f7 ff ff       	call   80103730 <myproc>
  if ((curproc->is_parent && curproc->thread_count == 0) || tid == 0)
80104021:	66 83 b8 a6 00 00 00 	cmpw   $0x0,0xa6(%eax)
80104028:	00 
  struct proc *curproc = myproc();
80104029:	89 c6                	mov    %eax,%esi
  if ((curproc->is_parent && curproc->thread_count == 0) || tid == 0)
8010402b:	74 0e                	je     8010403b <kthread_join+0x2b>
8010402d:	66 83 b8 b0 00 00 00 	cmpw   $0x0,0xb0(%eax)
80104034:	00 
80104035:	0f 84 bd 00 00 00    	je     801040f8 <kthread_join+0xe8>
8010403b:	85 ff                	test   %edi,%edi
8010403d:	0f 84 b5 00 00 00    	je     801040f8 <kthread_join+0xe8>
  if (curproc->is_thread)
80104043:	66 83 be a4 00 00 00 	cmpw   $0x0,0xa4(%esi)
8010404a:	00 
8010404b:	0f 85 9f 00 00 00    	jne    801040f0 <kthread_join+0xe0>
  acquire(&ptable.lock);
80104051:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104058:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
  acquire(&ptable.lock);
8010405d:	e8 be 09 00 00       	call   80104a20 <acquire>
80104062:	eb 12                	jmp    80104076 <kthread_join+0x66>
80104064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104068:	81 c3 b4 00 00 00    	add    $0xb4,%ebx
8010406e:	81 fb 74 6a 11 80    	cmp    $0x80116a74,%ebx
80104074:	74 22                	je     80104098 <kthread_join+0x88>
    if (p->parent != curproc || p->tid != tid)
80104076:	39 73 14             	cmp    %esi,0x14(%ebx)
80104079:	75 ed                	jne    80104068 <kthread_join+0x58>
8010407b:	0f b7 83 a8 00 00 00 	movzwl 0xa8(%ebx),%eax
80104082:	39 f8                	cmp    %edi,%eax
80104084:	74 37                	je     801040bd <kthread_join+0xad>
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104086:	81 c3 b4 00 00 00    	add    $0xb4,%ebx
8010408c:	81 fb 74 6a 11 80    	cmp    $0x80116a74,%ebx
80104092:	75 e2                	jne    80104076 <kthread_join+0x66>
80104094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int return_value = -1;
80104098:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010409d:	eb 38                	jmp    801040d7 <kthread_join+0xc7>
8010409f:	90                   	nop
      release(&ptable.lock);
801040a0:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801040a7:	e8 f4 09 00 00       	call   80104aa0 <release>
      yield();
801040ac:	e8 1f ff ff ff       	call   80103fd0 <yield>
      acquire(&ptable.lock);
801040b1:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801040b8:	e8 63 09 00 00       	call   80104a20 <acquire>
    while (p->state != ZOMBIE)
801040bd:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801040c1:	75 dd                	jne    801040a0 <kthread_join+0x90>
    curproc->thread_count--;
801040c3:	66 83 ae b0 00 00 00 	subw   $0x1,0xb0(%esi)
801040ca:	01 
    if (p->state == ZOMBIE)
801040cb:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
801040cf:	74 2e                	je     801040ff <kthread_join+0xef>
    return_value = p->thread_exit_value;
801040d1:	8b 9b ac 00 00 00    	mov    0xac(%ebx),%ebx
  release(&ptable.lock);
801040d7:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801040de:	e8 bd 09 00 00       	call   80104aa0 <release>
  return return_value;
801040e3:	89 d8                	mov    %ebx,%eax
}
801040e5:	83 c4 1c             	add    $0x1c,%esp
801040e8:	5b                   	pop    %ebx
801040e9:	5e                   	pop    %esi
801040ea:	5f                   	pop    %edi
801040eb:	5d                   	pop    %ebp
801040ec:	c3                   	ret    
801040ed:	8d 76 00             	lea    0x0(%esi),%esi
    curproc = curproc->parent;
801040f0:	8b 76 14             	mov    0x14(%esi),%esi
801040f3:	e9 59 ff ff ff       	jmp    80104051 <kthread_join+0x41>
    return -1;
801040f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040fd:	eb e6                	jmp    801040e5 <kthread_join+0xd5>
      kfree(p->kstack);
801040ff:	8b 43 08             	mov    0x8(%ebx),%eax
80104102:	89 04 24             	mov    %eax,(%esp)
80104105:	e8 16 e2 ff ff       	call   80102320 <kfree>
      p->kstack = 0;
8010410a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
      p->pid = -1;
80104111:	c7 43 10 ff ff ff ff 	movl   $0xffffffff,0x10(%ebx)
      p->parent = NULL;
80104118:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
      p->name[0] = NULL;
8010411f:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
      p->state = UNUSED;
80104123:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
      p->sz = 0;
8010412a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      p->killed = FALSE;
80104130:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80104137:	eb 98                	jmp    801040d1 <kthread_join+0xc1>
80104139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104140 <sleep>:
{
80104140:	55                   	push   %ebp
80104141:	89 e5                	mov    %esp,%ebp
80104143:	57                   	push   %edi
80104144:	56                   	push   %esi
80104145:	53                   	push   %ebx
80104146:	83 ec 1c             	sub    $0x1c,%esp
80104149:	8b 7d 08             	mov    0x8(%ebp),%edi
8010414c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct proc *p = myproc();
8010414f:	e8 dc f5 ff ff       	call   80103730 <myproc>
  if (p == 0)
80104154:	85 c0                	test   %eax,%eax
  struct proc *p = myproc();
80104156:	89 c3                	mov    %eax,%ebx
  if (p == 0)
80104158:	0f 84 7c 00 00 00    	je     801041da <sleep+0x9a>
  if (lk == 0)
8010415e:	85 f6                	test   %esi,%esi
80104160:	74 6c                	je     801041ce <sleep+0x8e>
  if (lk != &ptable.lock)
80104162:	81 fe 40 3d 11 80    	cmp    $0x80113d40,%esi
80104168:	74 46                	je     801041b0 <sleep+0x70>
    acquire(&ptable.lock); //DOC: sleeplock1
8010416a:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80104171:	e8 aa 08 00 00       	call   80104a20 <acquire>
    release(lk);
80104176:	89 34 24             	mov    %esi,(%esp)
80104179:	e8 22 09 00 00       	call   80104aa0 <release>
  p->chan = chan;
8010417e:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80104181:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80104188:	e8 a3 fb ff ff       	call   80103d30 <sched>
  p->chan = 0;
8010418d:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80104194:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
8010419b:	e8 00 09 00 00       	call   80104aa0 <release>
    acquire(lk);
801041a0:	89 75 08             	mov    %esi,0x8(%ebp)
}
801041a3:	83 c4 1c             	add    $0x1c,%esp
801041a6:	5b                   	pop    %ebx
801041a7:	5e                   	pop    %esi
801041a8:	5f                   	pop    %edi
801041a9:	5d                   	pop    %ebp
    acquire(lk);
801041aa:	e9 71 08 00 00       	jmp    80104a20 <acquire>
801041af:	90                   	nop
  p->chan = chan;
801041b0:	89 78 20             	mov    %edi,0x20(%eax)
  p->state = SLEEPING;
801041b3:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
801041ba:	e8 71 fb ff ff       	call   80103d30 <sched>
  p->chan = 0;
801041bf:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
801041c6:	83 c4 1c             	add    $0x1c,%esp
801041c9:	5b                   	pop    %ebx
801041ca:	5e                   	pop    %esi
801041cb:	5f                   	pop    %edi
801041cc:	5d                   	pop    %ebp
801041cd:	c3                   	ret    
    panic("sleep without lk");
801041ce:	c7 04 24 0f 7d 10 80 	movl   $0x80107d0f,(%esp)
801041d5:	e8 86 c1 ff ff       	call   80100360 <panic>
    panic("sleep");
801041da:	c7 04 24 09 7d 10 80 	movl   $0x80107d09,(%esp)
801041e1:	e8 7a c1 ff ff       	call   80100360 <panic>
801041e6:	8d 76 00             	lea    0x0(%esi),%esi
801041e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041f0 <wait>:
{
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	56                   	push   %esi
801041f4:	53                   	push   %ebx
801041f5:	83 ec 10             	sub    $0x10,%esp
  struct proc *curproc = myproc();
801041f8:	e8 33 f5 ff ff       	call   80103730 <myproc>
  if (curproc->is_thread == TRUE)
801041fd:	66 83 b8 a4 00 00 00 	cmpw   $0x1,0xa4(%eax)
80104204:	01 
  struct proc *curproc = myproc();
80104205:	89 c6                	mov    %eax,%esi
  if (curproc->is_thread == TRUE)
80104207:	0f 84 dd 00 00 00    	je     801042ea <wait+0xfa>
  if (curproc->thread_count > 0)
8010420d:	66 83 b8 b0 00 00 00 	cmpw   $0x0,0xb0(%eax)
80104214:	00 
80104215:	0f 85 db 00 00 00    	jne    801042f6 <wait+0x106>
  acquire(&ptable.lock);
8010421b:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80104222:	e8 f9 07 00 00       	call   80104a20 <acquire>
    havekids = 0;
80104227:	31 c0                	xor    %eax,%eax
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104229:	bb 74 3d 11 80       	mov    $0x80113d74,%ebx
8010422e:	eb 0e                	jmp    8010423e <wait+0x4e>
80104230:	81 c3 b4 00 00 00    	add    $0xb4,%ebx
80104236:	81 fb 74 6a 11 80    	cmp    $0x80116a74,%ebx
8010423c:	74 22                	je     80104260 <wait+0x70>
      if (p->parent != curproc)
8010423e:	39 73 14             	cmp    %esi,0x14(%ebx)
80104241:	75 ed                	jne    80104230 <wait+0x40>
      if (p->state == ZOMBIE)
80104243:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80104247:	74 34                	je     8010427d <wait+0x8d>
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104249:	81 c3 b4 00 00 00    	add    $0xb4,%ebx
      havekids = 1;
8010424f:	b8 01 00 00 00       	mov    $0x1,%eax
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104254:	81 fb 74 6a 11 80    	cmp    $0x80116a74,%ebx
8010425a:	75 e2                	jne    8010423e <wait+0x4e>
8010425c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (!havekids || curproc->killed)
80104260:	85 c0                	test   %eax,%eax
80104262:	74 6e                	je     801042d2 <wait+0xe2>
80104264:	8b 46 24             	mov    0x24(%esi),%eax
80104267:	85 c0                	test   %eax,%eax
80104269:	75 67                	jne    801042d2 <wait+0xe2>
    sleep(curproc, &ptable.lock); //DOC: wait-sleep
8010426b:	c7 44 24 04 40 3d 11 	movl   $0x80113d40,0x4(%esp)
80104272:	80 
80104273:	89 34 24             	mov    %esi,(%esp)
80104276:	e8 c5 fe ff ff       	call   80104140 <sleep>
  }
8010427b:	eb aa                	jmp    80104227 <wait+0x37>
        kfree(p->kstack);
8010427d:	8b 43 08             	mov    0x8(%ebx),%eax
        pid = p->pid;
80104280:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104283:	89 04 24             	mov    %eax,(%esp)
80104286:	e8 95 e0 ff ff       	call   80102320 <kfree>
        freevm(p->pgdir);
8010428b:	8b 43 04             	mov    0x4(%ebx),%eax
        p->kstack = 0;
8010428e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104295:	89 04 24             	mov    %eax,(%esp)
80104298:	e8 13 31 00 00       	call   801073b0 <freevm>
        release(&ptable.lock);
8010429d:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
        p->pid = 0;
801042a4:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
801042ab:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
801042b2:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
801042b6:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
801042bd:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801042c4:	e8 d7 07 00 00       	call   80104aa0 <release>
}
801042c9:	83 c4 10             	add    $0x10,%esp
        return pid;
801042cc:	89 f0                	mov    %esi,%eax
}
801042ce:	5b                   	pop    %ebx
801042cf:	5e                   	pop    %esi
801042d0:	5d                   	pop    %ebp
801042d1:	c3                   	ret    
      release(&ptable.lock);
801042d2:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801042d9:	e8 c2 07 00 00       	call   80104aa0 <release>
}
801042de:	83 c4 10             	add    $0x10,%esp
      return -1;
801042e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801042e6:	5b                   	pop    %ebx
801042e7:	5e                   	pop    %esi
801042e8:	5d                   	pop    %ebp
801042e9:	c3                   	ret    
    panic("called wait on thread");
801042ea:	c7 04 24 20 7d 10 80 	movl   $0x80107d20,(%esp)
801042f1:	e8 6a c0 ff ff       	call   80100360 <panic>
    panic("called wait on thread0 with children");
801042f6:	c7 04 24 28 7f 10 80 	movl   $0x80107f28,(%esp)
801042fd:	e8 5e c0 ff ff       	call   80100360 <panic>
80104302:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104310 <wakeup>:
}

// Wake up all processes sleeping on chan.
void wakeup(void *chan)
{
80104310:	55                   	push   %ebp
80104311:	89 e5                	mov    %esp,%ebp
80104313:	53                   	push   %ebx
80104314:	83 ec 14             	sub    $0x14,%esp
80104317:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010431a:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80104321:	e8 fa 06 00 00       	call   80104a20 <acquire>
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104326:	b8 74 3d 11 80       	mov    $0x80113d74,%eax
8010432b:	eb 0f                	jmp    8010433c <wakeup+0x2c>
8010432d:	8d 76 00             	lea    0x0(%esi),%esi
80104330:	05 b4 00 00 00       	add    $0xb4,%eax
80104335:	3d 74 6a 11 80       	cmp    $0x80116a74,%eax
8010433a:	74 24                	je     80104360 <wakeup+0x50>
    if (p->state == SLEEPING && p->chan == chan)
8010433c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104340:	75 ee                	jne    80104330 <wakeup+0x20>
80104342:	3b 58 20             	cmp    0x20(%eax),%ebx
80104345:	75 e9                	jne    80104330 <wakeup+0x20>
      p->state = RUNNABLE;
80104347:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010434e:	05 b4 00 00 00       	add    $0xb4,%eax
80104353:	3d 74 6a 11 80       	cmp    $0x80116a74,%eax
80104358:	75 e2                	jne    8010433c <wakeup+0x2c>
8010435a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  wakeup1(chan);
  release(&ptable.lock);
80104360:	c7 45 08 40 3d 11 80 	movl   $0x80113d40,0x8(%ebp)
}
80104367:	83 c4 14             	add    $0x14,%esp
8010436a:	5b                   	pop    %ebx
8010436b:	5d                   	pop    %ebp
  release(&ptable.lock);
8010436c:	e9 2f 07 00 00       	jmp    80104aa0 <release>
80104371:	eb 0d                	jmp    80104380 <kill>
80104373:	90                   	nop
80104374:	90                   	nop
80104375:	90                   	nop
80104376:	90                   	nop
80104377:	90                   	nop
80104378:	90                   	nop
80104379:	90                   	nop
8010437a:	90                   	nop
8010437b:	90                   	nop
8010437c:	90                   	nop
8010437d:	90                   	nop
8010437e:	90                   	nop
8010437f:	90                   	nop

80104380 <kill>:

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int kill(int pid)
{
80104380:	55                   	push   %ebp
80104381:	89 e5                	mov    %esp,%ebp
80104383:	53                   	push   %ebx
80104384:	83 ec 14             	sub    $0x14,%esp
80104387:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

#ifdef KTHREADS
  {
    struct proc *curproc = myproc();
8010438a:	e8 a1 f3 ff ff       	call   80103730 <myproc>

    if (curproc->is_thread == TRUE)
8010438f:	66 83 b8 a4 00 00 00 	cmpw   $0x1,0xa4(%eax)
80104396:	01 
80104397:	0f 84 8e 00 00 00    	je     8010442b <kill+0xab>
    {
      panic("called kill on thread");
    }
    if (curproc->thread_count > 0)
8010439d:	66 83 b8 b0 00 00 00 	cmpw   $0x0,0xb0(%eax)
801043a4:	00 
801043a5:	75 78                	jne    8010441f <kill+0x9f>
      panic("called kill on thread0 with children");
    }
  }
#endif // KTHREADS

  acquire(&ptable.lock);
801043a7:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801043ae:	e8 6d 06 00 00       	call   80104a20 <acquire>
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801043b3:	b8 74 3d 11 80       	mov    $0x80113d74,%eax
801043b8:	eb 12                	jmp    801043cc <kill+0x4c>
801043ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043c0:	05 b4 00 00 00       	add    $0xb4,%eax
801043c5:	3d 74 6a 11 80       	cmp    $0x80116a74,%eax
801043ca:	74 3c                	je     80104408 <kill+0x88>
  {
    if (p->pid == pid)
801043cc:	39 58 10             	cmp    %ebx,0x10(%eax)
801043cf:	75 ef                	jne    801043c0 <kill+0x40>
    {
      p->killed = 1;
      // Wake process from sleep if necessary.
      if (p->state == SLEEPING)
801043d1:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
801043d5:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if (p->state == SLEEPING)
801043dc:	74 1a                	je     801043f8 <kill+0x78>
        p->state = RUNNABLE;
      release(&ptable.lock);
801043de:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
801043e5:	e8 b6 06 00 00       	call   80104aa0 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
801043ea:	83 c4 14             	add    $0x14,%esp
      return 0;
801043ed:	31 c0                	xor    %eax,%eax
}
801043ef:	5b                   	pop    %ebx
801043f0:	5d                   	pop    %ebp
801043f1:	c3                   	ret    
801043f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        p->state = RUNNABLE;
801043f8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801043ff:	eb dd                	jmp    801043de <kill+0x5e>
80104401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  release(&ptable.lock);
80104408:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
8010440f:	e8 8c 06 00 00       	call   80104aa0 <release>
}
80104414:	83 c4 14             	add    $0x14,%esp
  return -1;
80104417:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010441c:	5b                   	pop    %ebx
8010441d:	5d                   	pop    %ebp
8010441e:	c3                   	ret    
      panic("called kill on thread0 with children");
8010441f:	c7 04 24 50 7f 10 80 	movl   $0x80107f50,(%esp)
80104426:	e8 35 bf ff ff       	call   80100360 <panic>
      panic("called kill on thread");
8010442b:	c7 04 24 36 7d 10 80 	movl   $0x80107d36,(%esp)
80104432:	e8 29 bf ff ff       	call   80100360 <panic>
80104437:	89 f6                	mov    %esi,%esi
80104439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104440 <sys_cps>:

#ifdef CPS
int sys_cps(void)
{
80104440:	55                   	push   %ebp
80104441:	89 e5                	mov    %esp,%ebp
80104443:	57                   	push   %edi
80104444:	bf fc 3d 11 80       	mov    $0x80113dfc,%edi
80104449:	56                   	push   %esi
8010444a:	53                   	push   %ebx
8010444b:	83 ec 4c             	sub    $0x4c,%esp
  // #ifdef KTHREADS
  // #error In a future assigment, we will add some more code in
  // #error here so we do not see the threads in the process list
  // #error in the default condition.
  // #endif // KTHREADS
  acquire(&ptable.lock);
8010444e:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80104455:	e8 c6 05 00 00       	call   80104a20 <acquire>

  cprintf(
8010445a:	c7 04 24 55 7d 10 80 	movl   $0x80107d55,(%esp)
80104461:	e8 ea c1 ff ff       	call   80100650 <cprintf>
      "pid\tppid\tname\tstate\tsize");
#ifdef PROC_TIMES
  cprintf("\tstart time\t\tticks\tsched");
80104466:	c7 04 24 6e 7d 10 80 	movl   $0x80107d6e,(%esp)
8010446d:	e8 de c1 ff ff       	call   80100650 <cprintf>
#endif // PROC_TIMES
#ifdef KTHREADS
  cprintf(
80104472:	c7 04 24 87 7d 10 80 	movl   $0x80107d87,(%esp)
80104479:	e8 d2 c1 ff ff       	call   80100650 <cprintf>
      "\tcpu\tthd cnt\tis thrd\tthrd #");
#endif // KTHREADS

  cprintf("\n");
8010447e:	c7 04 24 37 83 10 80 	movl   $0x80108337,(%esp)
80104485:	e8 c6 c1 ff ff       	call   80100650 <cprintf>
8010448a:	e9 4a 01 00 00       	jmp    801045d9 <sys_cps+0x199>
8010448f:	90                   	nop
      else
      {
        state = "uknown";
      }

      cprintf("%d\t%d\t%s\t%s\t%u", ptable.proc[i].pid, ptable.proc[i].parent ? ptable.proc[i].parent->pid : 1, ptable.proc[i].name, state, ptable.proc[i].sz);
80104490:	8b 40 10             	mov    0x10(%eax),%eax
80104493:	89 44 24 08          	mov    %eax,0x8(%esp)
80104497:	8b 47 88             	mov    -0x78(%edi),%eax

#ifdef PROC_TIMES
#define ZFILL(_field) \
  ptable.proc[i].begin_date._field < 10 ? "0" : "", ptable.proc[i].begin_date._field

      cprintf("\t%d-%s%d-%s%d %s%d:%s%d:%s%d", ptable.proc[i].begin_date.year, ZFILL(month), ZFILL(day), ZFILL(hour), ZFILL(minute), ZFILL(second));
8010449a:	be 53 7d 10 80       	mov    $0x80107d53,%esi
      cprintf("%d\t%d\t%s\t%s\t%u", ptable.proc[i].pid, ptable.proc[i].parent ? ptable.proc[i].parent->pid : 1, ptable.proc[i].name, state, ptable.proc[i].sz);
8010449f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
      cprintf("\t%d-%s%d-%s%d %s%d:%s%d:%s%d", ptable.proc[i].begin_date.year, ZFILL(month), ZFILL(day), ZFILL(hour), ZFILL(minute), ZFILL(second));
801044a3:	bb 53 7d 10 80       	mov    $0x80107d53,%ebx
      cprintf("%d\t%d\t%s\t%s\t%u", ptable.proc[i].pid, ptable.proc[i].parent ? ptable.proc[i].parent->pid : 1, ptable.proc[i].name, state, ptable.proc[i].sz);
801044a8:	89 54 24 10          	mov    %edx,0x10(%esp)
801044ac:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
801044b0:	89 44 24 04          	mov    %eax,0x4(%esp)
801044b4:	c7 04 24 a3 7d 10 80 	movl   $0x80107da3,(%esp)
801044bb:	e8 90 c1 ff ff       	call   80100650 <cprintf>
      cprintf("\t%d-%s%d-%s%d %s%d:%s%d:%s%d", ptable.proc[i].begin_date.year, ZFILL(month), ZFILL(day), ZFILL(hour), ZFILL(minute), ZFILL(second));
801044c0:	b8 38 83 10 80       	mov    $0x80108338,%eax
801044c5:	b9 53 7d 10 80       	mov    $0x80107d53,%ecx
801044ca:	83 7f f4 09          	cmpl   $0x9,-0xc(%edi)
801044ce:	ba 53 7d 10 80       	mov    $0x80107d53,%edx
801044d3:	c7 04 24 b2 7d 10 80 	movl   $0x80107db2,(%esp)
801044da:	0f 47 f0             	cmova  %eax,%esi
801044dd:	83 7f f8 09          	cmpl   $0x9,-0x8(%edi)
801044e1:	89 74 24 28          	mov    %esi,0x28(%esp)
801044e5:	8b 77 f8             	mov    -0x8(%edi),%esi
801044e8:	0f 47 d8             	cmova  %eax,%ebx
801044eb:	83 7f fc 09          	cmpl   $0x9,-0x4(%edi)
801044ef:	89 74 24 24          	mov    %esi,0x24(%esp)
801044f3:	8b 77 fc             	mov    -0x4(%edi),%esi
801044f6:	89 5c 24 20          	mov    %ebx,0x20(%esp)
801044fa:	8b 5f 04             	mov    0x4(%edi),%ebx
801044fd:	0f 47 c8             	cmova  %eax,%ecx
80104500:	83 3f 09             	cmpl   $0x9,(%edi)
80104503:	89 4c 24 18          	mov    %ecx,0x18(%esp)
80104507:	8b 0f                	mov    (%edi),%ecx
80104509:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
              ptable.proc[i].sched_times);

#undef ZFILL
#endif // PROC_TIMES
#ifdef KTHREADS
      cprintf(
8010450d:	bb 20 00 00 00       	mov    $0x20,%ebx
      cprintf("\t%d-%s%d-%s%d %s%d:%s%d:%s%d", ptable.proc[i].begin_date.year, ZFILL(month), ZFILL(day), ZFILL(hour), ZFILL(minute), ZFILL(second));
80104512:	0f 47 d0             	cmova  %eax,%edx
80104515:	b8 53 7d 10 80       	mov    $0x80107d53,%eax
8010451a:	83 7f 04 09          	cmpl   $0x9,0x4(%edi)
8010451e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80104521:	ba 38 83 10 80       	mov    $0x80108338,%edx
80104526:	89 4c 24 14          	mov    %ecx,0x14(%esp)
8010452a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010452d:	0f 47 c2             	cmova  %edx,%eax
80104530:	8b 57 f4             	mov    -0xc(%edi),%edx
80104533:	89 44 24 08          	mov    %eax,0x8(%esp)
80104537:	8b 47 08             	mov    0x8(%edi),%eax
8010453a:	89 74 24 1c          	mov    %esi,0x1c(%esp)
8010453e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80104542:	89 54 24 2c          	mov    %edx,0x2c(%esp)
80104546:	89 44 24 04          	mov    %eax,0x4(%esp)
8010454a:	e8 01 c1 ff ff       	call   80100650 <cprintf>
      cprintf("\t%d\t%d", ptable.proc[i].ticks_total,
8010454f:	8b 47 14             	mov    0x14(%edi),%eax
80104552:	c7 04 24 cf 7d 10 80 	movl   $0x80107dcf,(%esp)
80104559:	89 44 24 08          	mov    %eax,0x8(%esp)
8010455d:	8b 47 0c             	mov    0xc(%edi),%eax
80104560:	89 44 24 04          	mov    %eax,0x4(%esp)
80104564:	e8 e7 c0 ff ff       	call   80100650 <cprintf>
      cprintf(
80104569:	66 83 7f 28 00       	cmpw   $0x0,0x28(%edi)
8010456e:	74 07                	je     80104577 <sys_cps+0x137>
          "\t\t%c\t%c\t%c\t%c", 
          ptable.proc[i].oncpu > -1 ? ('0' + ptable.proc[i].oncpu) : ' '
          , ptable.proc[i].is_parent ? 'y' : ' '
          , ptable.proc[i].is_thread ? 'y' : ' '
          , ptable.proc[i].thread_count ? ('0' + ptable.proc[i].tid) : ' ');
80104570:	0f b7 5f 20          	movzwl 0x20(%edi),%ebx
      cprintf(
80104574:	83 c3 30             	add    $0x30,%ebx
80104577:	66 83 7f 1c 01       	cmpw   $0x1,0x1c(%edi)
8010457c:	b9 20 00 00 00       	mov    $0x20,%ecx
80104581:	8b 77 18             	mov    0x18(%edi),%esi
80104584:	89 5c 24 10          	mov    %ebx,0x10(%esp)
80104588:	19 d2                	sbb    %edx,%edx
8010458a:	83 e2 a7             	and    $0xffffffa7,%edx
8010458d:	83 c2 79             	add    $0x79,%edx
80104590:	66 83 7f 1e 01       	cmpw   $0x1,0x1e(%edi)
80104595:	89 54 24 0c          	mov    %edx,0xc(%esp)
80104599:	c7 04 24 d6 7d 10 80 	movl   $0x80107dd6,(%esp)
801045a0:	19 c0                	sbb    %eax,%eax
801045a2:	83 c6 30             	add    $0x30,%esi
801045a5:	83 e0 a7             	and    $0xffffffa7,%eax
801045a8:	83 c0 79             	add    $0x79,%eax
801045ab:	83 7f 18 00          	cmpl   $0x0,0x18(%edi)
801045af:	89 44 24 08          	mov    %eax,0x8(%esp)
801045b3:	0f 49 ce             	cmovns %esi,%ecx
801045b6:	89 4c 24 04          	mov    %ecx,0x4(%esp)
801045ba:	e8 91 c0 ff ff       	call   80100650 <cprintf>
#endif // KTHREADS
      cprintf("\n");
801045bf:	c7 04 24 37 83 10 80 	movl   $0x80108337,(%esp)
801045c6:	e8 85 c0 ff ff       	call   80100650 <cprintf>
801045cb:	81 c7 b4 00 00 00    	add    $0xb4,%edi
  for (i = 0; i < NPROC; i++)
801045d1:	81 ff fc 6a 11 80    	cmp    $0x80116afc,%edi
801045d7:	74 47                	je     80104620 <sys_cps+0x1e0>
    if (ptable.proc[i].state != UNUSED)
801045d9:	8b 47 84             	mov    -0x7c(%edi),%eax
801045dc:	85 c0                	test   %eax,%eax
801045de:	74 eb                	je     801045cb <sys_cps+0x18b>
      if (ptable.proc[i].state >= 0 && ptable.proc[i].state < NELEM(states) && states[ptable.proc[i].state])
801045e0:	83 f8 05             	cmp    $0x5,%eax
        state = "uknown";
801045e3:	ba 4c 7d 10 80       	mov    $0x80107d4c,%edx
      if (ptable.proc[i].state >= 0 && ptable.proc[i].state < NELEM(states) && states[ptable.proc[i].state])
801045e8:	77 11                	ja     801045fb <sys_cps+0x1bb>
801045ea:	8b 14 85 88 7f 10 80 	mov    -0x7fef8078(,%eax,4),%edx
        state = "uknown";
801045f1:	b8 4c 7d 10 80       	mov    $0x80107d4c,%eax
801045f6:	85 d2                	test   %edx,%edx
801045f8:	0f 44 d0             	cmove  %eax,%edx
      cprintf("%d\t%d\t%s\t%s\t%u", ptable.proc[i].pid, ptable.proc[i].parent ? ptable.proc[i].parent->pid : 1, ptable.proc[i].name, state, ptable.proc[i].sz);
801045fb:	8b 47 8c             	mov    -0x74(%edi),%eax
801045fe:	8d 4f e4             	lea    -0x1c(%edi),%ecx
80104601:	8b 9f 78 ff ff ff    	mov    -0x88(%edi),%ebx
80104607:	85 c0                	test   %eax,%eax
80104609:	0f 85 81 fe ff ff    	jne    80104490 <sys_cps+0x50>
8010460f:	b8 01 00 00 00       	mov    $0x1,%eax
80104614:	e9 7a fe ff ff       	jmp    80104493 <sys_cps+0x53>
80104619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    {
      // UNUSED process table entry is ignored
    }
  }

  release(&ptable.lock);
80104620:	c7 04 24 40 3d 11 80 	movl   $0x80113d40,(%esp)
80104627:	e8 74 04 00 00       	call   80104aa0 <release>
  return 0;
}
8010462c:	83 c4 4c             	add    $0x4c,%esp
8010462f:	31 c0                	xor    %eax,%eax
80104631:	5b                   	pop    %ebx
80104632:	5e                   	pop    %esi
80104633:	5f                   	pop    %edi
80104634:	5d                   	pop    %ebp
80104635:	c3                   	ret    
80104636:	8d 76 00             	lea    0x0(%esi),%esi
80104639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104640 <procdump>:
//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void procdump(void)
{
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
80104643:	57                   	push   %edi
80104644:	56                   	push   %esi
80104645:	53                   	push   %ebx
80104646:	bb e0 3d 11 80       	mov    $0x80113de0,%ebx
8010464b:	83 ec 4c             	sub    $0x4c,%esp
8010464e:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104651:	eb 23                	jmp    80104676 <procdump+0x36>
80104653:	90                   	nop
80104654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    {
      getcallerpcs((uint *)p->context->ebp + 2, pc);
      for (i = 0; i < 10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104658:	c7 04 24 37 83 10 80 	movl   $0x80108337,(%esp)
8010465f:	e8 ec bf ff ff       	call   80100650 <cprintf>
80104664:	81 c3 b4 00 00 00    	add    $0xb4,%ebx
  for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010466a:	81 fb e0 6a 11 80    	cmp    $0x80116ae0,%ebx
80104670:	0f 84 8a 00 00 00    	je     80104700 <procdump+0xc0>
    if (p->state == UNUSED)
80104676:	8b 43 a0             	mov    -0x60(%ebx),%eax
80104679:	85 c0                	test   %eax,%eax
8010467b:	74 e7                	je     80104664 <procdump+0x24>
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010467d:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80104680:	ba e4 7d 10 80       	mov    $0x80107de4,%edx
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104685:	77 11                	ja     80104698 <procdump+0x58>
80104687:	8b 14 85 88 7f 10 80 	mov    -0x7fef8078(,%eax,4),%edx
      state = "???";
8010468e:	b8 e4 7d 10 80       	mov    $0x80107de4,%eax
80104693:	85 d2                	test   %edx,%edx
80104695:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104698:	8b 43 a4             	mov    -0x5c(%ebx),%eax
8010469b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
8010469f:	89 54 24 08          	mov    %edx,0x8(%esp)
801046a3:	c7 04 24 e8 7d 10 80 	movl   $0x80107de8,(%esp)
801046aa:	89 44 24 04          	mov    %eax,0x4(%esp)
801046ae:	e8 9d bf ff ff       	call   80100650 <cprintf>
    if (p->state == SLEEPING)
801046b3:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801046b7:	75 9f                	jne    80104658 <procdump+0x18>
      getcallerpcs((uint *)p->context->ebp + 2, pc);
801046b9:	8d 45 c0             	lea    -0x40(%ebp),%eax
801046bc:	89 44 24 04          	mov    %eax,0x4(%esp)
801046c0:	8b 43 b0             	mov    -0x50(%ebx),%eax
801046c3:	8d 7d c0             	lea    -0x40(%ebp),%edi
801046c6:	8b 40 0c             	mov    0xc(%eax),%eax
801046c9:	83 c0 08             	add    $0x8,%eax
801046cc:	89 04 24             	mov    %eax,(%esp)
801046cf:	e8 fc 01 00 00       	call   801048d0 <getcallerpcs>
801046d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for (i = 0; i < 10 && pc[i] != 0; i++)
801046d8:	8b 17                	mov    (%edi),%edx
801046da:	85 d2                	test   %edx,%edx
801046dc:	0f 84 76 ff ff ff    	je     80104658 <procdump+0x18>
        cprintf(" %p", pc[i]);
801046e2:	89 54 24 04          	mov    %edx,0x4(%esp)
801046e6:	83 c7 04             	add    $0x4,%edi
801046e9:	c7 04 24 21 77 10 80 	movl   $0x80107721,(%esp)
801046f0:	e8 5b bf ff ff       	call   80100650 <cprintf>
      for (i = 0; i < 10 && pc[i] != 0; i++)
801046f5:	39 f7                	cmp    %esi,%edi
801046f7:	75 df                	jne    801046d8 <procdump+0x98>
801046f9:	e9 5a ff ff ff       	jmp    80104658 <procdump+0x18>
801046fe:	66 90                	xchg   %ax,%ax
  }
}
80104700:	83 c4 4c             	add    $0x4c,%esp
80104703:	5b                   	pop    %ebx
80104704:	5e                   	pop    %esi
80104705:	5f                   	pop    %edi
80104706:	5d                   	pop    %ebp
80104707:	c3                   	ret    
80104708:	90                   	nop
80104709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104710 <proc_kdebug>:

#ifdef KDEBUG
int proc_kdebug(int value)
{
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	53                   	push   %ebx
80104714:	83 ec 14             	sub    $0x14,%esp
80104717:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int ret = 0;

  cprintf("%d %s\n", __LINE__, __FILE__);
8010471a:	c7 44 24 08 4c 81 10 	movl   $0x8010814c,0x8(%esp)
80104721:	80 
80104722:	c7 44 24 04 7c 03 00 	movl   $0x37c,0x4(%esp)
80104729:	00 
8010472a:	c7 04 24 02 7e 10 80 	movl   $0x80107e02,(%esp)
80104731:	e8 1a bf ff ff       	call   80100650 <cprintf>
  if (value < 0)
80104736:	85 db                	test   %ebx,%ebx
80104738:	78 36                	js     80104770 <proc_kdebug+0x60>
    ret = 1;
  }
  else
  {
    proc_kdebug_level = value;
    cprintf("kernel diag messages: %s  %d\n", proc_kdebug_level ? "enabled" : "disabled", proc_kdebug_level);
8010473a:	66 85 db             	test   %bx,%bx
8010473d:	b9 f9 7d 10 80       	mov    $0x80107df9,%ecx
80104742:	b8 f1 7d 10 80       	mov    $0x80107df1,%eax
80104747:	0f b7 d3             	movzwl %bx,%edx
8010474a:	0f 44 c1             	cmove  %ecx,%eax
8010474d:	89 44 24 04          	mov    %eax,0x4(%esp)
80104751:	89 54 24 08          	mov    %edx,0x8(%esp)
80104755:	c7 04 24 09 7e 10 80 	movl   $0x80107e09,(%esp)
    proc_kdebug_level = value;
8010475c:	66 89 1d b8 b5 10 80 	mov    %bx,0x8010b5b8
    cprintf("kernel diag messages: %s  %d\n", proc_kdebug_level ? "enabled" : "disabled", proc_kdebug_level);
80104763:	e8 e8 be ff ff       	call   80100650 <cprintf>
  }

  return ret;
}
80104768:	83 c4 14             	add    $0x14,%esp
  int ret = 0;
8010476b:	31 c0                	xor    %eax,%eax
}
8010476d:	5b                   	pop    %ebx
8010476e:	5d                   	pop    %ebp
8010476f:	c3                   	ret    
80104770:	83 c4 14             	add    $0x14,%esp
    ret = 1;
80104773:	b8 01 00 00 00       	mov    $0x1,%eax
}
80104778:	5b                   	pop    %ebx
80104779:	5d                   	pop    %ebp
8010477a:	c3                   	ret    
8010477b:	66 90                	xchg   %ax,%ax
8010477d:	66 90                	xchg   %ax,%ax
8010477f:	90                   	nop

80104780 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	53                   	push   %ebx
80104784:	83 ec 14             	sub    $0x14,%esp
80104787:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010478a:	c7 44 24 04 a0 7f 10 	movl   $0x80107fa0,0x4(%esp)
80104791:	80 
80104792:	8d 43 04             	lea    0x4(%ebx),%eax
80104795:	89 04 24             	mov    %eax,(%esp)
80104798:	e8 13 01 00 00       	call   801048b0 <initlock>
  lk->name = name;
8010479d:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801047a0:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801047a6:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
801047ad:	89 43 38             	mov    %eax,0x38(%ebx)
}
801047b0:	83 c4 14             	add    $0x14,%esp
801047b3:	5b                   	pop    %ebx
801047b4:	5d                   	pop    %ebp
801047b5:	c3                   	ret    
801047b6:	8d 76 00             	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047c0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	56                   	push   %esi
801047c4:	53                   	push   %ebx
801047c5:	83 ec 10             	sub    $0x10,%esp
801047c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801047cb:	8d 73 04             	lea    0x4(%ebx),%esi
801047ce:	89 34 24             	mov    %esi,(%esp)
801047d1:	e8 4a 02 00 00       	call   80104a20 <acquire>
  while (lk->locked) {
801047d6:	8b 13                	mov    (%ebx),%edx
801047d8:	85 d2                	test   %edx,%edx
801047da:	74 16                	je     801047f2 <acquiresleep+0x32>
801047dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(lk, &lk->lk);
801047e0:	89 74 24 04          	mov    %esi,0x4(%esp)
801047e4:	89 1c 24             	mov    %ebx,(%esp)
801047e7:	e8 54 f9 ff ff       	call   80104140 <sleep>
  while (lk->locked) {
801047ec:	8b 03                	mov    (%ebx),%eax
801047ee:	85 c0                	test   %eax,%eax
801047f0:	75 ee                	jne    801047e0 <acquiresleep+0x20>
  }
  lk->locked = 1;
801047f2:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801047f8:	e8 33 ef ff ff       	call   80103730 <myproc>
801047fd:	8b 40 10             	mov    0x10(%eax),%eax
80104800:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104803:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104806:	83 c4 10             	add    $0x10,%esp
80104809:	5b                   	pop    %ebx
8010480a:	5e                   	pop    %esi
8010480b:	5d                   	pop    %ebp
  release(&lk->lk);
8010480c:	e9 8f 02 00 00       	jmp    80104aa0 <release>
80104811:	eb 0d                	jmp    80104820 <releasesleep>
80104813:	90                   	nop
80104814:	90                   	nop
80104815:	90                   	nop
80104816:	90                   	nop
80104817:	90                   	nop
80104818:	90                   	nop
80104819:	90                   	nop
8010481a:	90                   	nop
8010481b:	90                   	nop
8010481c:	90                   	nop
8010481d:	90                   	nop
8010481e:	90                   	nop
8010481f:	90                   	nop

80104820 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	56                   	push   %esi
80104824:	53                   	push   %ebx
80104825:	83 ec 10             	sub    $0x10,%esp
80104828:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
8010482b:	8d 73 04             	lea    0x4(%ebx),%esi
8010482e:	89 34 24             	mov    %esi,(%esp)
80104831:	e8 ea 01 00 00       	call   80104a20 <acquire>
  lk->locked = 0;
80104836:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010483c:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104843:	89 1c 24             	mov    %ebx,(%esp)
80104846:	e8 c5 fa ff ff       	call   80104310 <wakeup>
  release(&lk->lk);
8010484b:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010484e:	83 c4 10             	add    $0x10,%esp
80104851:	5b                   	pop    %ebx
80104852:	5e                   	pop    %esi
80104853:	5d                   	pop    %ebp
  release(&lk->lk);
80104854:	e9 47 02 00 00       	jmp    80104aa0 <release>
80104859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104860 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80104860:	55                   	push   %ebp
80104861:	89 e5                	mov    %esp,%ebp
80104863:	57                   	push   %edi
  int r;
  
  acquire(&lk->lk);
  r = lk->locked && (lk->pid == myproc()->pid);
80104864:	31 ff                	xor    %edi,%edi
{
80104866:	56                   	push   %esi
80104867:	53                   	push   %ebx
80104868:	83 ec 1c             	sub    $0x1c,%esp
8010486b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
8010486e:	8d 73 04             	lea    0x4(%ebx),%esi
80104871:	89 34 24             	mov    %esi,(%esp)
80104874:	e8 a7 01 00 00       	call   80104a20 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80104879:	8b 03                	mov    (%ebx),%eax
8010487b:	85 c0                	test   %eax,%eax
8010487d:	74 13                	je     80104892 <holdingsleep+0x32>
8010487f:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104882:	e8 a9 ee ff ff       	call   80103730 <myproc>
80104887:	3b 58 10             	cmp    0x10(%eax),%ebx
8010488a:	0f 94 c0             	sete   %al
8010488d:	0f b6 c0             	movzbl %al,%eax
80104890:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
80104892:	89 34 24             	mov    %esi,(%esp)
80104895:	e8 06 02 00 00       	call   80104aa0 <release>
  return r;
}
8010489a:	83 c4 1c             	add    $0x1c,%esp
8010489d:	89 f8                	mov    %edi,%eax
8010489f:	5b                   	pop    %ebx
801048a0:	5e                   	pop    %esi
801048a1:	5f                   	pop    %edi
801048a2:	5d                   	pop    %ebp
801048a3:	c3                   	ret    
801048a4:	66 90                	xchg   %ax,%ax
801048a6:	66 90                	xchg   %ax,%ax
801048a8:	66 90                	xchg   %ax,%ax
801048aa:	66 90                	xchg   %ax,%ax
801048ac:	66 90                	xchg   %ax,%ax
801048ae:	66 90                	xchg   %ax,%ax

801048b0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801048b0:	55                   	push   %ebp
801048b1:	89 e5                	mov    %esp,%ebp
801048b3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801048b6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801048b9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
801048bf:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
801048c2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801048c9:	5d                   	pop    %ebp
801048ca:	c3                   	ret    
801048cb:	90                   	nop
801048cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048d0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801048d0:	55                   	push   %ebp
801048d1:	89 e5                	mov    %esp,%ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801048d3:	8b 45 08             	mov    0x8(%ebp),%eax
{
801048d6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801048d9:	53                   	push   %ebx
  ebp = (uint*)v - 2;
801048da:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801048dd:	31 c0                	xor    %eax,%eax
801048df:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801048e0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801048e6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801048ec:	77 1a                	ja     80104908 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801048ee:	8b 5a 04             	mov    0x4(%edx),%ebx
801048f1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
801048f4:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
801048f7:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
801048f9:	83 f8 0a             	cmp    $0xa,%eax
801048fc:	75 e2                	jne    801048e0 <getcallerpcs+0x10>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801048fe:	5b                   	pop    %ebx
801048ff:	5d                   	pop    %ebp
80104900:	c3                   	ret    
80104901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    pcs[i] = 0;
80104908:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
8010490f:	83 c0 01             	add    $0x1,%eax
80104912:	83 f8 0a             	cmp    $0xa,%eax
80104915:	74 e7                	je     801048fe <getcallerpcs+0x2e>
    pcs[i] = 0;
80104917:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
  for(; i < 10; i++)
8010491e:	83 c0 01             	add    $0x1,%eax
80104921:	83 f8 0a             	cmp    $0xa,%eax
80104924:	75 e2                	jne    80104908 <getcallerpcs+0x38>
80104926:	eb d6                	jmp    801048fe <getcallerpcs+0x2e>
80104928:	90                   	nop
80104929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104930 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104930:	55                   	push   %ebp
80104931:	89 e5                	mov    %esp,%ebp
80104933:	53                   	push   %ebx
80104934:	83 ec 04             	sub    $0x4,%esp
80104937:	9c                   	pushf  
80104938:	5b                   	pop    %ebx
  asm volatile("cli");
80104939:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010493a:	e8 51 ed ff ff       	call   80103690 <mycpu>
8010493f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104945:	85 c0                	test   %eax,%eax
80104947:	75 11                	jne    8010495a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104949:	e8 42 ed ff ff       	call   80103690 <mycpu>
8010494e:	81 e3 00 02 00 00    	and    $0x200,%ebx
80104954:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010495a:	e8 31 ed ff ff       	call   80103690 <mycpu>
8010495f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104966:	83 c4 04             	add    $0x4,%esp
80104969:	5b                   	pop    %ebx
8010496a:	5d                   	pop    %ebp
8010496b:	c3                   	ret    
8010496c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104970 <popcli>:

void
popcli(void)
{
80104970:	55                   	push   %ebp
80104971:	89 e5                	mov    %esp,%ebp
80104973:	83 ec 18             	sub    $0x18,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104976:	9c                   	pushf  
80104977:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104978:	f6 c4 02             	test   $0x2,%ah
8010497b:	75 49                	jne    801049c6 <popcli+0x56>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
8010497d:	e8 0e ed ff ff       	call   80103690 <mycpu>
80104982:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104988:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010498b:	85 d2                	test   %edx,%edx
8010498d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104993:	78 25                	js     801049ba <popcli+0x4a>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104995:	e8 f6 ec ff ff       	call   80103690 <mycpu>
8010499a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801049a0:	85 d2                	test   %edx,%edx
801049a2:	74 04                	je     801049a8 <popcli+0x38>
    sti();
}
801049a4:	c9                   	leave  
801049a5:	c3                   	ret    
801049a6:	66 90                	xchg   %ax,%ax
  if(mycpu()->ncli == 0 && mycpu()->intena)
801049a8:	e8 e3 ec ff ff       	call   80103690 <mycpu>
801049ad:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801049b3:	85 c0                	test   %eax,%eax
801049b5:	74 ed                	je     801049a4 <popcli+0x34>
  asm volatile("sti");
801049b7:	fb                   	sti    
}
801049b8:	c9                   	leave  
801049b9:	c3                   	ret    
    panic("popcli");
801049ba:	c7 04 24 c2 7f 10 80 	movl   $0x80107fc2,(%esp)
801049c1:	e8 9a b9 ff ff       	call   80100360 <panic>
    panic("popcli - interruptible");
801049c6:	c7 04 24 ab 7f 10 80 	movl   $0x80107fab,(%esp)
801049cd:	e8 8e b9 ff ff       	call   80100360 <panic>
801049d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801049e0 <holding>:
{
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	56                   	push   %esi
  r = lock->locked && lock->cpu == mycpu();
801049e4:	31 f6                	xor    %esi,%esi
{
801049e6:	53                   	push   %ebx
801049e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
801049ea:	e8 41 ff ff ff       	call   80104930 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
801049ef:	8b 03                	mov    (%ebx),%eax
801049f1:	85 c0                	test   %eax,%eax
801049f3:	74 12                	je     80104a07 <holding+0x27>
801049f5:	8b 5b 08             	mov    0x8(%ebx),%ebx
801049f8:	e8 93 ec ff ff       	call   80103690 <mycpu>
801049fd:	39 c3                	cmp    %eax,%ebx
801049ff:	0f 94 c0             	sete   %al
80104a02:	0f b6 c0             	movzbl %al,%eax
80104a05:	89 c6                	mov    %eax,%esi
  popcli();
80104a07:	e8 64 ff ff ff       	call   80104970 <popcli>
}
80104a0c:	89 f0                	mov    %esi,%eax
80104a0e:	5b                   	pop    %ebx
80104a0f:	5e                   	pop    %esi
80104a10:	5d                   	pop    %ebp
80104a11:	c3                   	ret    
80104a12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a20 <acquire>:
{
80104a20:	55                   	push   %ebp
80104a21:	89 e5                	mov    %esp,%ebp
80104a23:	53                   	push   %ebx
80104a24:	83 ec 14             	sub    $0x14,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104a27:	e8 04 ff ff ff       	call   80104930 <pushcli>
  if(holding(lk)) {
80104a2c:	8b 45 08             	mov    0x8(%ebp),%eax
80104a2f:	89 04 24             	mov    %eax,(%esp)
80104a32:	e8 a9 ff ff ff       	call   801049e0 <holding>
80104a37:	85 c0                	test   %eax,%eax
80104a39:	75 3a                	jne    80104a75 <acquire+0x55>
  asm volatile("lock; xchgl %0, %1" :
80104a3b:	b9 01 00 00 00       	mov    $0x1,%ecx
  while(xchg(&lk->locked, 1) != 0)
80104a40:	8b 55 08             	mov    0x8(%ebp),%edx
80104a43:	89 c8                	mov    %ecx,%eax
80104a45:	f0 87 02             	lock xchg %eax,(%edx)
80104a48:	85 c0                	test   %eax,%eax
80104a4a:	75 f4                	jne    80104a40 <acquire+0x20>
  __sync_synchronize();
80104a4c:	0f ae f0             	mfence 
  lk->cpu = mycpu();
80104a4f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104a52:	e8 39 ec ff ff       	call   80103690 <mycpu>
80104a57:	89 43 08             	mov    %eax,0x8(%ebx)
  getcallerpcs(&lk, lk->pcs);
80104a5a:	8b 45 08             	mov    0x8(%ebp),%eax
80104a5d:	83 c0 0c             	add    $0xc,%eax
80104a60:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a64:	8d 45 08             	lea    0x8(%ebp),%eax
80104a67:	89 04 24             	mov    %eax,(%esp)
80104a6a:	e8 61 fe ff ff       	call   801048d0 <getcallerpcs>
}
80104a6f:	83 c4 14             	add    $0x14,%esp
80104a72:	5b                   	pop    %ebx
80104a73:	5d                   	pop    %ebp
80104a74:	c3                   	ret    
      cprintf("*** lock already held *** %s ***\n", lk->name);
80104a75:	8b 45 08             	mov    0x8(%ebp),%eax
80104a78:	8b 40 04             	mov    0x4(%eax),%eax
80104a7b:	c7 04 24 20 80 10 80 	movl   $0x80108020,(%esp)
80104a82:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a86:	e8 c5 bb ff ff       	call   80100650 <cprintf>
      panic("acquire in file " __FILE__);
80104a8b:	c7 04 24 c9 7f 10 80 	movl   $0x80107fc9,(%esp)
80104a92:	e8 c9 b8 ff ff       	call   80100360 <panic>
80104a97:	89 f6                	mov    %esi,%esi
80104a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104aa0 <release>:
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	53                   	push   %ebx
80104aa4:	83 ec 14             	sub    $0x14,%esp
80104aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(!holding(lk)) {
80104aaa:	89 1c 24             	mov    %ebx,(%esp)
80104aad:	e8 2e ff ff ff       	call   801049e0 <holding>
80104ab2:	85 c0                	test   %eax,%eax
80104ab4:	74 21                	je     80104ad7 <release+0x37>
  lk->pcs[0] = 0;
80104ab6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104abd:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
80104ac4:	0f ae f0             	mfence 
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104ac7:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
80104acd:	83 c4 14             	add    $0x14,%esp
80104ad0:	5b                   	pop    %ebx
80104ad1:	5d                   	pop    %ebp
  popcli();
80104ad2:	e9 99 fe ff ff       	jmp    80104970 <popcli>
        cprintf("*** lock not held *** %s ***\n", lk->name);
80104ad7:	8b 43 04             	mov    0x4(%ebx),%eax
80104ada:	c7 04 24 e4 7f 10 80 	movl   $0x80107fe4,(%esp)
80104ae1:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ae5:	e8 66 bb ff ff       	call   80100650 <cprintf>
        panic("release in file " __FILE__);
80104aea:	c7 04 24 02 80 10 80 	movl   $0x80108002,(%esp)
80104af1:	e8 6a b8 ff ff       	call   80100360 <panic>
80104af6:	66 90                	xchg   %ax,%ax
80104af8:	66 90                	xchg   %ax,%ax
80104afa:	66 90                	xchg   %ax,%ax
80104afc:	66 90                	xchg   %ax,%ax
80104afe:	66 90                	xchg   %ax,%ax

80104b00 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104b00:	55                   	push   %ebp
80104b01:	89 e5                	mov    %esp,%ebp
80104b03:	8b 55 08             	mov    0x8(%ebp),%edx
80104b06:	57                   	push   %edi
80104b07:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104b0a:	53                   	push   %ebx
  if ((int)dst%4 == 0 && n%4 == 0){
80104b0b:	f6 c2 03             	test   $0x3,%dl
80104b0e:	75 05                	jne    80104b15 <memset+0x15>
80104b10:	f6 c1 03             	test   $0x3,%cl
80104b13:	74 13                	je     80104b28 <memset+0x28>
  asm volatile("cld; rep stosb" :
80104b15:	89 d7                	mov    %edx,%edi
80104b17:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b1a:	fc                   	cld    
80104b1b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104b1d:	5b                   	pop    %ebx
80104b1e:	89 d0                	mov    %edx,%eax
80104b20:	5f                   	pop    %edi
80104b21:	5d                   	pop    %ebp
80104b22:	c3                   	ret    
80104b23:	90                   	nop
80104b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c &= 0xFF;
80104b28:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
80104b2c:	c1 e9 02             	shr    $0x2,%ecx
80104b2f:	89 f8                	mov    %edi,%eax
80104b31:	89 fb                	mov    %edi,%ebx
80104b33:	c1 e0 18             	shl    $0x18,%eax
80104b36:	c1 e3 10             	shl    $0x10,%ebx
80104b39:	09 d8                	or     %ebx,%eax
80104b3b:	09 f8                	or     %edi,%eax
80104b3d:	c1 e7 08             	shl    $0x8,%edi
80104b40:	09 f8                	or     %edi,%eax
  asm volatile("cld; rep stosl" :
80104b42:	89 d7                	mov    %edx,%edi
80104b44:	fc                   	cld    
80104b45:	f3 ab                	rep stos %eax,%es:(%edi)
}
80104b47:	5b                   	pop    %ebx
80104b48:	89 d0                	mov    %edx,%eax
80104b4a:	5f                   	pop    %edi
80104b4b:	5d                   	pop    %ebp
80104b4c:	c3                   	ret    
80104b4d:	8d 76 00             	lea    0x0(%esi),%esi

80104b50 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104b50:	55                   	push   %ebp
80104b51:	89 e5                	mov    %esp,%ebp
80104b53:	8b 45 10             	mov    0x10(%ebp),%eax
80104b56:	57                   	push   %edi
80104b57:	56                   	push   %esi
80104b58:	8b 75 0c             	mov    0xc(%ebp),%esi
80104b5b:	53                   	push   %ebx
80104b5c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
80104b5f:	85 c0                	test   %eax,%eax
80104b61:	8d 78 ff             	lea    -0x1(%eax),%edi
80104b64:	74 26                	je     80104b8c <memcmp+0x3c>
    if(*s1 != *s2)
80104b66:	0f b6 03             	movzbl (%ebx),%eax
80104b69:	31 d2                	xor    %edx,%edx
80104b6b:	0f b6 0e             	movzbl (%esi),%ecx
80104b6e:	38 c8                	cmp    %cl,%al
80104b70:	74 16                	je     80104b88 <memcmp+0x38>
80104b72:	eb 24                	jmp    80104b98 <memcmp+0x48>
80104b74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b78:	0f b6 44 13 01       	movzbl 0x1(%ebx,%edx,1),%eax
80104b7d:	83 c2 01             	add    $0x1,%edx
80104b80:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104b84:	38 c8                	cmp    %cl,%al
80104b86:	75 10                	jne    80104b98 <memcmp+0x48>
  while(n-- > 0){
80104b88:	39 fa                	cmp    %edi,%edx
80104b8a:	75 ec                	jne    80104b78 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
80104b8c:	5b                   	pop    %ebx
  return 0;
80104b8d:	31 c0                	xor    %eax,%eax
}
80104b8f:	5e                   	pop    %esi
80104b90:	5f                   	pop    %edi
80104b91:	5d                   	pop    %ebp
80104b92:	c3                   	ret    
80104b93:	90                   	nop
80104b94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b98:	5b                   	pop    %ebx
      return *s1 - *s2;
80104b99:	29 c8                	sub    %ecx,%eax
}
80104b9b:	5e                   	pop    %esi
80104b9c:	5f                   	pop    %edi
80104b9d:	5d                   	pop    %ebp
80104b9e:	c3                   	ret    
80104b9f:	90                   	nop

80104ba0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104ba0:	55                   	push   %ebp
80104ba1:	89 e5                	mov    %esp,%ebp
80104ba3:	57                   	push   %edi
80104ba4:	8b 45 08             	mov    0x8(%ebp),%eax
80104ba7:	56                   	push   %esi
80104ba8:	8b 75 0c             	mov    0xc(%ebp),%esi
80104bab:	53                   	push   %ebx
80104bac:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
80104baf:	39 c6                	cmp    %eax,%esi
80104bb1:	73 35                	jae    80104be8 <memmove+0x48>
80104bb3:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104bb6:	39 c8                	cmp    %ecx,%eax
80104bb8:	73 2e                	jae    80104be8 <memmove+0x48>
    s += n;
    d += n;
    while(n-- > 0)
80104bba:	85 db                	test   %ebx,%ebx
    d += n;
80104bbc:	8d 3c 18             	lea    (%eax,%ebx,1),%edi
    while(n-- > 0)
80104bbf:	8d 53 ff             	lea    -0x1(%ebx),%edx
80104bc2:	74 1b                	je     80104bdf <memmove+0x3f>
80104bc4:	f7 db                	neg    %ebx
80104bc6:	8d 34 19             	lea    (%ecx,%ebx,1),%esi
80104bc9:	01 fb                	add    %edi,%ebx
80104bcb:	90                   	nop
80104bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *--d = *--s;
80104bd0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104bd4:	88 0c 13             	mov    %cl,(%ebx,%edx,1)
    while(n-- > 0)
80104bd7:	83 ea 01             	sub    $0x1,%edx
80104bda:	83 fa ff             	cmp    $0xffffffff,%edx
80104bdd:	75 f1                	jne    80104bd0 <memmove+0x30>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104bdf:	5b                   	pop    %ebx
80104be0:	5e                   	pop    %esi
80104be1:	5f                   	pop    %edi
80104be2:	5d                   	pop    %ebp
80104be3:	c3                   	ret    
80104be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(n-- > 0)
80104be8:	31 d2                	xor    %edx,%edx
80104bea:	85 db                	test   %ebx,%ebx
80104bec:	74 f1                	je     80104bdf <memmove+0x3f>
80104bee:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104bf0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104bf4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104bf7:	83 c2 01             	add    $0x1,%edx
    while(n-- > 0)
80104bfa:	39 da                	cmp    %ebx,%edx
80104bfc:	75 f2                	jne    80104bf0 <memmove+0x50>
}
80104bfe:	5b                   	pop    %ebx
80104bff:	5e                   	pop    %esi
80104c00:	5f                   	pop    %edi
80104c01:	5d                   	pop    %ebp
80104c02:	c3                   	ret    
80104c03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c10 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104c10:	55                   	push   %ebp
80104c11:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104c13:	5d                   	pop    %ebp
  return memmove(dst, src, n);
80104c14:	eb 8a                	jmp    80104ba0 <memmove>
80104c16:	8d 76 00             	lea    0x0(%esi),%esi
80104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c20 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80104c20:	55                   	push   %ebp
80104c21:	89 e5                	mov    %esp,%ebp
80104c23:	56                   	push   %esi
80104c24:	8b 75 10             	mov    0x10(%ebp),%esi
80104c27:	53                   	push   %ebx
80104c28:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104c2b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(n > 0 && *p && *p == *q)
80104c2e:	85 f6                	test   %esi,%esi
80104c30:	74 30                	je     80104c62 <strncmp+0x42>
80104c32:	0f b6 01             	movzbl (%ecx),%eax
80104c35:	84 c0                	test   %al,%al
80104c37:	74 2f                	je     80104c68 <strncmp+0x48>
80104c39:	0f b6 13             	movzbl (%ebx),%edx
80104c3c:	38 d0                	cmp    %dl,%al
80104c3e:	75 46                	jne    80104c86 <strncmp+0x66>
80104c40:	8d 51 01             	lea    0x1(%ecx),%edx
80104c43:	01 ce                	add    %ecx,%esi
80104c45:	eb 14                	jmp    80104c5b <strncmp+0x3b>
80104c47:	90                   	nop
80104c48:	0f b6 02             	movzbl (%edx),%eax
80104c4b:	84 c0                	test   %al,%al
80104c4d:	74 31                	je     80104c80 <strncmp+0x60>
80104c4f:	0f b6 19             	movzbl (%ecx),%ebx
80104c52:	83 c2 01             	add    $0x1,%edx
80104c55:	38 d8                	cmp    %bl,%al
80104c57:	75 17                	jne    80104c70 <strncmp+0x50>
    n--, p++, q++;
80104c59:	89 cb                	mov    %ecx,%ebx
  while(n > 0 && *p && *p == *q)
80104c5b:	39 f2                	cmp    %esi,%edx
    n--, p++, q++;
80104c5d:	8d 4b 01             	lea    0x1(%ebx),%ecx
  while(n > 0 && *p && *p == *q)
80104c60:	75 e6                	jne    80104c48 <strncmp+0x28>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
80104c62:	5b                   	pop    %ebx
    return 0;
80104c63:	31 c0                	xor    %eax,%eax
}
80104c65:	5e                   	pop    %esi
80104c66:	5d                   	pop    %ebp
80104c67:	c3                   	ret    
80104c68:	0f b6 1b             	movzbl (%ebx),%ebx
  while(n > 0 && *p && *p == *q)
80104c6b:	31 c0                	xor    %eax,%eax
80104c6d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
80104c70:	0f b6 d3             	movzbl %bl,%edx
80104c73:	29 d0                	sub    %edx,%eax
}
80104c75:	5b                   	pop    %ebx
80104c76:	5e                   	pop    %esi
80104c77:	5d                   	pop    %ebp
80104c78:	c3                   	ret    
80104c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c80:	0f b6 5b 01          	movzbl 0x1(%ebx),%ebx
80104c84:	eb ea                	jmp    80104c70 <strncmp+0x50>
  while(n > 0 && *p && *p == *q)
80104c86:	89 d3                	mov    %edx,%ebx
80104c88:	eb e6                	jmp    80104c70 <strncmp+0x50>
80104c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104c90 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104c90:	55                   	push   %ebp
80104c91:	89 e5                	mov    %esp,%ebp
80104c93:	8b 45 08             	mov    0x8(%ebp),%eax
80104c96:	56                   	push   %esi
80104c97:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104c9a:	53                   	push   %ebx
80104c9b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
80104c9e:	89 c2                	mov    %eax,%edx
80104ca0:	eb 19                	jmp    80104cbb <strncpy+0x2b>
80104ca2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ca8:	83 c3 01             	add    $0x1,%ebx
80104cab:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
80104caf:	83 c2 01             	add    $0x1,%edx
80104cb2:	84 c9                	test   %cl,%cl
80104cb4:	88 4a ff             	mov    %cl,-0x1(%edx)
80104cb7:	74 09                	je     80104cc2 <strncpy+0x32>
80104cb9:	89 f1                	mov    %esi,%ecx
80104cbb:	85 c9                	test   %ecx,%ecx
80104cbd:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104cc0:	7f e6                	jg     80104ca8 <strncpy+0x18>
    ;
  while(n-- > 0)
80104cc2:	31 c9                	xor    %ecx,%ecx
80104cc4:	85 f6                	test   %esi,%esi
80104cc6:	7e 0f                	jle    80104cd7 <strncpy+0x47>
    *s++ = 0;
80104cc8:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104ccc:	89 f3                	mov    %esi,%ebx
80104cce:	83 c1 01             	add    $0x1,%ecx
80104cd1:	29 cb                	sub    %ecx,%ebx
  while(n-- > 0)
80104cd3:	85 db                	test   %ebx,%ebx
80104cd5:	7f f1                	jg     80104cc8 <strncpy+0x38>
  return os;
}
80104cd7:	5b                   	pop    %ebx
80104cd8:	5e                   	pop    %esi
80104cd9:	5d                   	pop    %ebp
80104cda:	c3                   	ret    
80104cdb:	90                   	nop
80104cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104ce0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104ce0:	55                   	push   %ebp
80104ce1:	89 e5                	mov    %esp,%ebp
80104ce3:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104ce6:	56                   	push   %esi
80104ce7:	8b 45 08             	mov    0x8(%ebp),%eax
80104cea:	53                   	push   %ebx
80104ceb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
80104cee:	85 c9                	test   %ecx,%ecx
80104cf0:	7e 26                	jle    80104d18 <safestrcpy+0x38>
80104cf2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104cf6:	89 c1                	mov    %eax,%ecx
80104cf8:	eb 17                	jmp    80104d11 <safestrcpy+0x31>
80104cfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104d00:	83 c2 01             	add    $0x1,%edx
80104d03:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104d07:	83 c1 01             	add    $0x1,%ecx
80104d0a:	84 db                	test   %bl,%bl
80104d0c:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104d0f:	74 04                	je     80104d15 <safestrcpy+0x35>
80104d11:	39 f2                	cmp    %esi,%edx
80104d13:	75 eb                	jne    80104d00 <safestrcpy+0x20>
    ;
  *s = 0;
80104d15:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104d18:	5b                   	pop    %ebx
80104d19:	5e                   	pop    %esi
80104d1a:	5d                   	pop    %ebp
80104d1b:	c3                   	ret    
80104d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104d20 <strlen>:

int
strlen(const char *s)
{
80104d20:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104d21:	31 c0                	xor    %eax,%eax
{
80104d23:	89 e5                	mov    %esp,%ebp
80104d25:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
80104d28:	80 3a 00             	cmpb   $0x0,(%edx)
80104d2b:	74 0c                	je     80104d39 <strlen+0x19>
80104d2d:	8d 76 00             	lea    0x0(%esi),%esi
80104d30:	83 c0 01             	add    $0x1,%eax
80104d33:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104d37:	75 f7                	jne    80104d30 <strlen+0x10>
    ;
  return n;
}
80104d39:	5d                   	pop    %ebp
80104d3a:	c3                   	ret    

80104d3b <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
80104d3b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104d3f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80104d43:	55                   	push   %ebp
  pushl %ebx
80104d44:	53                   	push   %ebx
  pushl %esi
80104d45:	56                   	push   %esi
  pushl %edi
80104d46:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104d47:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104d49:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80104d4b:	5f                   	pop    %edi
  popl %esi
80104d4c:	5e                   	pop    %esi
  popl %ebx
80104d4d:	5b                   	pop    %ebx
  popl %ebp
80104d4e:	5d                   	pop    %ebp
  ret
80104d4f:	c3                   	ret    

80104d50 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104d50:	55                   	push   %ebp
80104d51:	89 e5                	mov    %esp,%ebp
80104d53:	53                   	push   %ebx
80104d54:	83 ec 04             	sub    $0x4,%esp
80104d57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
80104d5a:	e8 d1 e9 ff ff       	call   80103730 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104d5f:	8b 00                	mov    (%eax),%eax
80104d61:	39 d8                	cmp    %ebx,%eax
80104d63:	76 1b                	jbe    80104d80 <fetchint+0x30>
80104d65:	8d 53 04             	lea    0x4(%ebx),%edx
80104d68:	39 d0                	cmp    %edx,%eax
80104d6a:	72 14                	jb     80104d80 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
80104d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104d6f:	8b 13                	mov    (%ebx),%edx
80104d71:	89 10                	mov    %edx,(%eax)
  return 0;
80104d73:	31 c0                	xor    %eax,%eax
}
80104d75:	83 c4 04             	add    $0x4,%esp
80104d78:	5b                   	pop    %ebx
80104d79:	5d                   	pop    %ebp
80104d7a:	c3                   	ret    
80104d7b:	90                   	nop
80104d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104d80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d85:	eb ee                	jmp    80104d75 <fetchint+0x25>
80104d87:	89 f6                	mov    %esi,%esi
80104d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d90 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104d90:	55                   	push   %ebp
80104d91:	89 e5                	mov    %esp,%ebp
80104d93:	53                   	push   %ebx
80104d94:	83 ec 04             	sub    $0x4,%esp
80104d97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
80104d9a:	e8 91 e9 ff ff       	call   80103730 <myproc>

  if(addr >= curproc->sz)
80104d9f:	39 18                	cmp    %ebx,(%eax)
80104da1:	76 26                	jbe    80104dc9 <fetchstr+0x39>
    return -1;
  *pp = (char*)addr;
80104da3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104da6:	89 da                	mov    %ebx,%edx
80104da8:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
80104daa:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
80104dac:	39 c3                	cmp    %eax,%ebx
80104dae:	73 19                	jae    80104dc9 <fetchstr+0x39>
    if(*s == 0)
80104db0:	80 3b 00             	cmpb   $0x0,(%ebx)
80104db3:	75 0d                	jne    80104dc2 <fetchstr+0x32>
80104db5:	eb 21                	jmp    80104dd8 <fetchstr+0x48>
80104db7:	90                   	nop
80104db8:	80 3a 00             	cmpb   $0x0,(%edx)
80104dbb:	90                   	nop
80104dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104dc0:	74 16                	je     80104dd8 <fetchstr+0x48>
  for(s = *pp; s < ep; s++){
80104dc2:	83 c2 01             	add    $0x1,%edx
80104dc5:	39 d0                	cmp    %edx,%eax
80104dc7:	77 ef                	ja     80104db8 <fetchstr+0x28>
      return s - *pp;
  }
  return -1;
}
80104dc9:	83 c4 04             	add    $0x4,%esp
    return -1;
80104dcc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104dd1:	5b                   	pop    %ebx
80104dd2:	5d                   	pop    %ebp
80104dd3:	c3                   	ret    
80104dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104dd8:	83 c4 04             	add    $0x4,%esp
      return s - *pp;
80104ddb:	89 d0                	mov    %edx,%eax
80104ddd:	29 d8                	sub    %ebx,%eax
}
80104ddf:	5b                   	pop    %ebx
80104de0:	5d                   	pop    %ebp
80104de1:	c3                   	ret    
80104de2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104df0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104df0:	55                   	push   %ebp
80104df1:	89 e5                	mov    %esp,%ebp
80104df3:	56                   	push   %esi
80104df4:	8b 75 0c             	mov    0xc(%ebp),%esi
80104df7:	53                   	push   %ebx
80104df8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104dfb:	e8 30 e9 ff ff       	call   80103730 <myproc>
80104e00:	89 75 0c             	mov    %esi,0xc(%ebp)
80104e03:	8b 40 18             	mov    0x18(%eax),%eax
80104e06:	8b 40 44             	mov    0x44(%eax),%eax
80104e09:	8d 44 98 04          	lea    0x4(%eax,%ebx,4),%eax
80104e0d:	89 45 08             	mov    %eax,0x8(%ebp)
}
80104e10:	5b                   	pop    %ebx
80104e11:	5e                   	pop    %esi
80104e12:	5d                   	pop    %ebp
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104e13:	e9 38 ff ff ff       	jmp    80104d50 <fetchint>
80104e18:	90                   	nop
80104e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104e20 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104e20:	55                   	push   %ebp
80104e21:	89 e5                	mov    %esp,%ebp
80104e23:	56                   	push   %esi
80104e24:	53                   	push   %ebx
80104e25:	83 ec 20             	sub    $0x20,%esp
80104e28:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
80104e2b:	e8 00 e9 ff ff       	call   80103730 <myproc>
80104e30:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104e32:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e35:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e39:	8b 45 08             	mov    0x8(%ebp),%eax
80104e3c:	89 04 24             	mov    %eax,(%esp)
80104e3f:	e8 ac ff ff ff       	call   80104df0 <argint>
80104e44:	85 c0                	test   %eax,%eax
80104e46:	78 28                	js     80104e70 <argptr+0x50>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104e48:	85 db                	test   %ebx,%ebx
80104e4a:	78 24                	js     80104e70 <argptr+0x50>
80104e4c:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104e4f:	8b 06                	mov    (%esi),%eax
80104e51:	39 c2                	cmp    %eax,%edx
80104e53:	73 1b                	jae    80104e70 <argptr+0x50>
80104e55:	01 d3                	add    %edx,%ebx
80104e57:	39 d8                	cmp    %ebx,%eax
80104e59:	72 15                	jb     80104e70 <argptr+0x50>
    return -1;
  *pp = (char*)i;
80104e5b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104e5e:	89 10                	mov    %edx,(%eax)
  return 0;
}
80104e60:	83 c4 20             	add    $0x20,%esp
  return 0;
80104e63:	31 c0                	xor    %eax,%eax
}
80104e65:	5b                   	pop    %ebx
80104e66:	5e                   	pop    %esi
80104e67:	5d                   	pop    %ebp
80104e68:	c3                   	ret    
80104e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e70:	83 c4 20             	add    $0x20,%esp
    return -1;
80104e73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e78:	5b                   	pop    %ebx
80104e79:	5e                   	pop    %esi
80104e7a:	5d                   	pop    %ebp
80104e7b:	c3                   	ret    
80104e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104e80 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104e80:	55                   	push   %ebp
80104e81:	89 e5                	mov    %esp,%ebp
80104e83:	83 ec 28             	sub    $0x28,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104e86:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e89:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e8d:	8b 45 08             	mov    0x8(%ebp),%eax
80104e90:	89 04 24             	mov    %eax,(%esp)
80104e93:	e8 58 ff ff ff       	call   80104df0 <argint>
80104e98:	85 c0                	test   %eax,%eax
80104e9a:	78 14                	js     80104eb0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104e9c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104e9f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104ea3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ea6:	89 04 24             	mov    %eax,(%esp)
80104ea9:	e8 e2 fe ff ff       	call   80104d90 <fetchstr>
}
80104eae:	c9                   	leave  
80104eaf:	c3                   	ret    
    return -1;
80104eb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104eb5:	c9                   	leave  
80104eb6:	c3                   	ret    
80104eb7:	89 f6                	mov    %esi,%esi
80104eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ec0 <syscall>:
#endif //BENNY MOOTEX
};

void
syscall(void)
{
80104ec0:	55                   	push   %ebp
80104ec1:	89 e5                	mov    %esp,%ebp
80104ec3:	56                   	push   %esi
80104ec4:	53                   	push   %ebx
80104ec5:	83 ec 10             	sub    $0x10,%esp
  int num;
  struct proc *curproc = myproc();
80104ec8:	e8 63 e8 ff ff       	call   80103730 <myproc>

  num = curproc->tf->eax;
80104ecd:	8b 70 18             	mov    0x18(%eax),%esi
  struct proc *curproc = myproc();
80104ed0:	89 c3                	mov    %eax,%ebx
  num = curproc->tf->eax;
80104ed2:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104ed5:	8d 50 ff             	lea    -0x1(%eax),%edx
80104ed8:	83 fa 20             	cmp    $0x20,%edx
80104edb:	77 1b                	ja     80104ef8 <syscall+0x38>
80104edd:	8b 14 85 60 80 10 80 	mov    -0x7fef7fa0(,%eax,4),%edx
80104ee4:	85 d2                	test   %edx,%edx
80104ee6:	74 10                	je     80104ef8 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
80104ee8:	ff d2                	call   *%edx
80104eea:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104eed:	83 c4 10             	add    $0x10,%esp
80104ef0:	5b                   	pop    %ebx
80104ef1:	5e                   	pop    %esi
80104ef2:	5d                   	pop    %ebp
80104ef3:	c3                   	ret    
80104ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
80104ef8:	89 44 24 0c          	mov    %eax,0xc(%esp)
            curproc->pid, curproc->name, num);
80104efc:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104eff:	89 44 24 08          	mov    %eax,0x8(%esp)
    cprintf("%d %s: unknown sys call %d\n",
80104f03:	8b 43 10             	mov    0x10(%ebx),%eax
80104f06:	c7 04 24 42 80 10 80 	movl   $0x80108042,(%esp)
80104f0d:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f11:	e8 3a b7 ff ff       	call   80100650 <cprintf>
    curproc->tf->eax = -1;
80104f16:	8b 43 18             	mov    0x18(%ebx),%eax
80104f19:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
80104f20:	83 c4 10             	add    $0x10,%esp
80104f23:	5b                   	pop    %ebx
80104f24:	5e                   	pop    %esi
80104f25:	5d                   	pop    %ebp
80104f26:	c3                   	ret    
80104f27:	66 90                	xchg   %ax,%ax
80104f29:	66 90                	xchg   %ax,%ax
80104f2b:	66 90                	xchg   %ax,%ax
80104f2d:	66 90                	xchg   %ax,%ax
80104f2f:	90                   	nop

80104f30 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
80104f30:	55                   	push   %ebp
80104f31:	89 e5                	mov    %esp,%ebp
80104f33:	53                   	push   %ebx
80104f34:	89 c3                	mov    %eax,%ebx
80104f36:	83 ec 04             	sub    $0x4,%esp
  int fd;
  struct proc *curproc = myproc();
80104f39:	e8 f2 e7 ff ff       	call   80103730 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
80104f3e:	31 d2                	xor    %edx,%edx
    if(curproc->ofile[fd] == 0){
80104f40:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80104f44:	85 c9                	test   %ecx,%ecx
80104f46:	74 18                	je     80104f60 <fdalloc+0x30>
  for(fd = 0; fd < NOFILE; fd++){
80104f48:	83 c2 01             	add    $0x1,%edx
80104f4b:	83 fa 10             	cmp    $0x10,%edx
80104f4e:	75 f0                	jne    80104f40 <fdalloc+0x10>
      curproc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}
80104f50:	83 c4 04             	add    $0x4,%esp
  return -1;
80104f53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f58:	5b                   	pop    %ebx
80104f59:	5d                   	pop    %ebp
80104f5a:	c3                   	ret    
80104f5b:	90                   	nop
80104f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      curproc->ofile[fd] = f;
80104f60:	89 5c 90 28          	mov    %ebx,0x28(%eax,%edx,4)
}
80104f64:	83 c4 04             	add    $0x4,%esp
      return fd;
80104f67:	89 d0                	mov    %edx,%eax
}
80104f69:	5b                   	pop    %ebx
80104f6a:	5d                   	pop    %ebp
80104f6b:	c3                   	ret    
80104f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f70 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104f70:	55                   	push   %ebp
80104f71:	89 e5                	mov    %esp,%ebp
80104f73:	57                   	push   %edi
80104f74:	56                   	push   %esi
80104f75:	53                   	push   %ebx
80104f76:	83 ec 3c             	sub    $0x3c,%esp
80104f79:	89 4d d0             	mov    %ecx,-0x30(%ebp)
80104f7c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104f7f:	8d 5d da             	lea    -0x26(%ebp),%ebx
80104f82:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104f86:	89 04 24             	mov    %eax,(%esp)
{
80104f89:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104f8c:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
80104f8f:	e8 bc cf ff ff       	call   80101f50 <nameiparent>
80104f94:	85 c0                	test   %eax,%eax
80104f96:	89 c7                	mov    %eax,%edi
80104f98:	0f 84 da 00 00 00    	je     80105078 <create+0x108>
    return 0;
  ilock(dp);
80104f9e:	89 04 24             	mov    %eax,(%esp)
80104fa1:	e8 3a c7 ff ff       	call   801016e0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
80104fa6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80104fad:	00 
80104fae:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104fb2:	89 3c 24             	mov    %edi,(%esp)
80104fb5:	e8 36 cc ff ff       	call   80101bf0 <dirlookup>
80104fba:	85 c0                	test   %eax,%eax
80104fbc:	89 c6                	mov    %eax,%esi
80104fbe:	74 40                	je     80105000 <create+0x90>
    iunlockput(dp);
80104fc0:	89 3c 24             	mov    %edi,(%esp)
80104fc3:	e8 78 c9 ff ff       	call   80101940 <iunlockput>
    ilock(ip);
80104fc8:	89 34 24             	mov    %esi,(%esp)
80104fcb:	e8 10 c7 ff ff       	call   801016e0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104fd0:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104fd5:	75 11                	jne    80104fe8 <create+0x78>
80104fd7:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104fdc:	89 f0                	mov    %esi,%eax
80104fde:	75 08                	jne    80104fe8 <create+0x78>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104fe0:	83 c4 3c             	add    $0x3c,%esp
80104fe3:	5b                   	pop    %ebx
80104fe4:	5e                   	pop    %esi
80104fe5:	5f                   	pop    %edi
80104fe6:	5d                   	pop    %ebp
80104fe7:	c3                   	ret    
    iunlockput(ip);
80104fe8:	89 34 24             	mov    %esi,(%esp)
80104feb:	e8 50 c9 ff ff       	call   80101940 <iunlockput>
}
80104ff0:	83 c4 3c             	add    $0x3c,%esp
    return 0;
80104ff3:	31 c0                	xor    %eax,%eax
}
80104ff5:	5b                   	pop    %ebx
80104ff6:	5e                   	pop    %esi
80104ff7:	5f                   	pop    %edi
80104ff8:	5d                   	pop    %ebp
80104ff9:	c3                   	ret    
80104ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if((ip = ialloc(dp->dev, type)) == 0)
80105000:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80105004:	89 44 24 04          	mov    %eax,0x4(%esp)
80105008:	8b 07                	mov    (%edi),%eax
8010500a:	89 04 24             	mov    %eax,(%esp)
8010500d:	e8 3e c5 ff ff       	call   80101550 <ialloc>
80105012:	85 c0                	test   %eax,%eax
80105014:	89 c6                	mov    %eax,%esi
80105016:	0f 84 bf 00 00 00    	je     801050db <create+0x16b>
  ilock(ip);
8010501c:	89 04 24             	mov    %eax,(%esp)
8010501f:	e8 bc c6 ff ff       	call   801016e0 <ilock>
  ip->major = major;
80105024:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80105028:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
8010502c:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80105030:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
80105034:	b8 01 00 00 00       	mov    $0x1,%eax
80105039:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
8010503d:	89 34 24             	mov    %esi,(%esp)
80105040:	e8 db c5 ff ff       	call   80101620 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80105045:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
8010504a:	74 34                	je     80105080 <create+0x110>
  if(dirlink(dp, name, ip->inum) < 0)
8010504c:	8b 46 04             	mov    0x4(%esi),%eax
8010504f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80105053:	89 3c 24             	mov    %edi,(%esp)
80105056:	89 44 24 08          	mov    %eax,0x8(%esp)
8010505a:	e8 f1 cd ff ff       	call   80101e50 <dirlink>
8010505f:	85 c0                	test   %eax,%eax
80105061:	78 6c                	js     801050cf <create+0x15f>
  iunlockput(dp);
80105063:	89 3c 24             	mov    %edi,(%esp)
80105066:	e8 d5 c8 ff ff       	call   80101940 <iunlockput>
}
8010506b:	83 c4 3c             	add    $0x3c,%esp
  return ip;
8010506e:	89 f0                	mov    %esi,%eax
}
80105070:	5b                   	pop    %ebx
80105071:	5e                   	pop    %esi
80105072:	5f                   	pop    %edi
80105073:	5d                   	pop    %ebp
80105074:	c3                   	ret    
80105075:	8d 76 00             	lea    0x0(%esi),%esi
    return 0;
80105078:	31 c0                	xor    %eax,%eax
8010507a:	e9 61 ff ff ff       	jmp    80104fe0 <create+0x70>
8010507f:	90                   	nop
    dp->nlink++;  // for ".."
80105080:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80105085:	89 3c 24             	mov    %edi,(%esp)
80105088:	e8 93 c5 ff ff       	call   80101620 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
8010508d:	8b 46 04             	mov    0x4(%esi),%eax
80105090:	c7 44 24 04 04 81 10 	movl   $0x80108104,0x4(%esp)
80105097:	80 
80105098:	89 34 24             	mov    %esi,(%esp)
8010509b:	89 44 24 08          	mov    %eax,0x8(%esp)
8010509f:	e8 ac cd ff ff       	call   80101e50 <dirlink>
801050a4:	85 c0                	test   %eax,%eax
801050a6:	78 1b                	js     801050c3 <create+0x153>
801050a8:	8b 47 04             	mov    0x4(%edi),%eax
801050ab:	c7 44 24 04 03 81 10 	movl   $0x80108103,0x4(%esp)
801050b2:	80 
801050b3:	89 34 24             	mov    %esi,(%esp)
801050b6:	89 44 24 08          	mov    %eax,0x8(%esp)
801050ba:	e8 91 cd ff ff       	call   80101e50 <dirlink>
801050bf:	85 c0                	test   %eax,%eax
801050c1:	79 89                	jns    8010504c <create+0xdc>
      panic("create dots");
801050c3:	c7 04 24 f7 80 10 80 	movl   $0x801080f7,(%esp)
801050ca:	e8 91 b2 ff ff       	call   80100360 <panic>
    panic("create: dirlink");
801050cf:	c7 04 24 06 81 10 80 	movl   $0x80108106,(%esp)
801050d6:	e8 85 b2 ff ff       	call   80100360 <panic>
    panic("create: ialloc");
801050db:	c7 04 24 e8 80 10 80 	movl   $0x801080e8,(%esp)
801050e2:	e8 79 b2 ff ff       	call   80100360 <panic>
801050e7:	89 f6                	mov    %esi,%esi
801050e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801050f0 <argfd.constprop.0>:
argfd(int n, int *pfd, struct file **pf)
801050f0:	55                   	push   %ebp
801050f1:	89 e5                	mov    %esp,%ebp
801050f3:	56                   	push   %esi
801050f4:	89 c6                	mov    %eax,%esi
801050f6:	53                   	push   %ebx
801050f7:	89 d3                	mov    %edx,%ebx
801050f9:	83 ec 20             	sub    $0x20,%esp
  if(argint(n, &fd) < 0)
801050fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801050ff:	89 44 24 04          	mov    %eax,0x4(%esp)
80105103:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010510a:	e8 e1 fc ff ff       	call   80104df0 <argint>
8010510f:	85 c0                	test   %eax,%eax
80105111:	78 2d                	js     80105140 <argfd.constprop.0+0x50>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80105113:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80105117:	77 27                	ja     80105140 <argfd.constprop.0+0x50>
80105119:	e8 12 e6 ff ff       	call   80103730 <myproc>
8010511e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105121:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80105125:	85 c0                	test   %eax,%eax
80105127:	74 17                	je     80105140 <argfd.constprop.0+0x50>
  if(pfd)
80105129:	85 f6                	test   %esi,%esi
8010512b:	74 02                	je     8010512f <argfd.constprop.0+0x3f>
    *pfd = fd;
8010512d:	89 16                	mov    %edx,(%esi)
  if(pf)
8010512f:	85 db                	test   %ebx,%ebx
80105131:	74 1d                	je     80105150 <argfd.constprop.0+0x60>
    *pf = f;
80105133:	89 03                	mov    %eax,(%ebx)
  return 0;
80105135:	31 c0                	xor    %eax,%eax
}
80105137:	83 c4 20             	add    $0x20,%esp
8010513a:	5b                   	pop    %ebx
8010513b:	5e                   	pop    %esi
8010513c:	5d                   	pop    %ebp
8010513d:	c3                   	ret    
8010513e:	66 90                	xchg   %ax,%ax
80105140:	83 c4 20             	add    $0x20,%esp
    return -1;
80105143:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105148:	5b                   	pop    %ebx
80105149:	5e                   	pop    %esi
8010514a:	5d                   	pop    %ebp
8010514b:	c3                   	ret    
8010514c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return 0;
80105150:	31 c0                	xor    %eax,%eax
80105152:	eb e3                	jmp    80105137 <argfd.constprop.0+0x47>
80105154:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010515a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105160 <sys_dup>:
{
80105160:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0)
80105161:	31 c0                	xor    %eax,%eax
{
80105163:	89 e5                	mov    %esp,%ebp
80105165:	53                   	push   %ebx
80105166:	83 ec 24             	sub    $0x24,%esp
  if(argfd(0, 0, &f) < 0)
80105169:	8d 55 f4             	lea    -0xc(%ebp),%edx
8010516c:	e8 7f ff ff ff       	call   801050f0 <argfd.constprop.0>
80105171:	85 c0                	test   %eax,%eax
80105173:	78 23                	js     80105198 <sys_dup+0x38>
  if((fd=fdalloc(f)) < 0)
80105175:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105178:	e8 b3 fd ff ff       	call   80104f30 <fdalloc>
8010517d:	85 c0                	test   %eax,%eax
8010517f:	89 c3                	mov    %eax,%ebx
80105181:	78 15                	js     80105198 <sys_dup+0x38>
  filedup(f);
80105183:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105186:	89 04 24             	mov    %eax,(%esp)
80105189:	e8 82 bc ff ff       	call   80100e10 <filedup>
  return fd;
8010518e:	89 d8                	mov    %ebx,%eax
}
80105190:	83 c4 24             	add    $0x24,%esp
80105193:	5b                   	pop    %ebx
80105194:	5d                   	pop    %ebp
80105195:	c3                   	ret    
80105196:	66 90                	xchg   %ax,%ax
    return -1;
80105198:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010519d:	eb f1                	jmp    80105190 <sys_dup+0x30>
8010519f:	90                   	nop

801051a0 <sys_read>:
{
801051a0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801051a1:	31 c0                	xor    %eax,%eax
{
801051a3:	89 e5                	mov    %esp,%ebp
801051a5:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801051a8:	8d 55 ec             	lea    -0x14(%ebp),%edx
801051ab:	e8 40 ff ff ff       	call   801050f0 <argfd.constprop.0>
801051b0:	85 c0                	test   %eax,%eax
801051b2:	78 54                	js     80105208 <sys_read+0x68>
801051b4:	8d 45 f0             	lea    -0x10(%ebp),%eax
801051b7:	89 44 24 04          	mov    %eax,0x4(%esp)
801051bb:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801051c2:	e8 29 fc ff ff       	call   80104df0 <argint>
801051c7:	85 c0                	test   %eax,%eax
801051c9:	78 3d                	js     80105208 <sys_read+0x68>
801051cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
801051ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801051d5:	89 44 24 08          	mov    %eax,0x8(%esp)
801051d9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051dc:	89 44 24 04          	mov    %eax,0x4(%esp)
801051e0:	e8 3b fc ff ff       	call   80104e20 <argptr>
801051e5:	85 c0                	test   %eax,%eax
801051e7:	78 1f                	js     80105208 <sys_read+0x68>
  return fileread(f, p, n);
801051e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801051ec:	89 44 24 08          	mov    %eax,0x8(%esp)
801051f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051f3:	89 44 24 04          	mov    %eax,0x4(%esp)
801051f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
801051fa:	89 04 24             	mov    %eax,(%esp)
801051fd:	e8 6e bd ff ff       	call   80100f70 <fileread>
}
80105202:	c9                   	leave  
80105203:	c3                   	ret    
80105204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105208:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010520d:	c9                   	leave  
8010520e:	c3                   	ret    
8010520f:	90                   	nop

80105210 <sys_write>:
{
80105210:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105211:	31 c0                	xor    %eax,%eax
{
80105213:	89 e5                	mov    %esp,%ebp
80105215:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105218:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010521b:	e8 d0 fe ff ff       	call   801050f0 <argfd.constprop.0>
80105220:	85 c0                	test   %eax,%eax
80105222:	78 54                	js     80105278 <sys_write+0x68>
80105224:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105227:	89 44 24 04          	mov    %eax,0x4(%esp)
8010522b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105232:	e8 b9 fb ff ff       	call   80104df0 <argint>
80105237:	85 c0                	test   %eax,%eax
80105239:	78 3d                	js     80105278 <sys_write+0x68>
8010523b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010523e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105245:	89 44 24 08          	mov    %eax,0x8(%esp)
80105249:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010524c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105250:	e8 cb fb ff ff       	call   80104e20 <argptr>
80105255:	85 c0                	test   %eax,%eax
80105257:	78 1f                	js     80105278 <sys_write+0x68>
  return filewrite(f, p, n);
80105259:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010525c:	89 44 24 08          	mov    %eax,0x8(%esp)
80105260:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105263:	89 44 24 04          	mov    %eax,0x4(%esp)
80105267:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010526a:	89 04 24             	mov    %eax,(%esp)
8010526d:	e8 9e bd ff ff       	call   80101010 <filewrite>
}
80105272:	c9                   	leave  
80105273:	c3                   	ret    
80105274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105278:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010527d:	c9                   	leave  
8010527e:	c3                   	ret    
8010527f:	90                   	nop

80105280 <sys_close>:
{
80105280:	55                   	push   %ebp
80105281:	89 e5                	mov    %esp,%ebp
80105283:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, &fd, &f) < 0)
80105286:	8d 55 f4             	lea    -0xc(%ebp),%edx
80105289:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010528c:	e8 5f fe ff ff       	call   801050f0 <argfd.constprop.0>
80105291:	85 c0                	test   %eax,%eax
80105293:	78 23                	js     801052b8 <sys_close+0x38>
  myproc()->ofile[fd] = 0;
80105295:	e8 96 e4 ff ff       	call   80103730 <myproc>
8010529a:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010529d:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
801052a4:	00 
  fileclose(f);
801052a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801052a8:	89 04 24             	mov    %eax,(%esp)
801052ab:	e8 b0 bb ff ff       	call   80100e60 <fileclose>
  return 0;
801052b0:	31 c0                	xor    %eax,%eax
}
801052b2:	c9                   	leave  
801052b3:	c3                   	ret    
801052b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801052b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801052bd:	c9                   	leave  
801052be:	c3                   	ret    
801052bf:	90                   	nop

801052c0 <sys_fstat>:
{
801052c0:	55                   	push   %ebp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801052c1:	31 c0                	xor    %eax,%eax
{
801052c3:	89 e5                	mov    %esp,%ebp
801052c5:	83 ec 28             	sub    $0x28,%esp
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801052c8:	8d 55 f0             	lea    -0x10(%ebp),%edx
801052cb:	e8 20 fe ff ff       	call   801050f0 <argfd.constprop.0>
801052d0:	85 c0                	test   %eax,%eax
801052d2:	78 34                	js     80105308 <sys_fstat+0x48>
801052d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052d7:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801052de:	00 
801052df:	89 44 24 04          	mov    %eax,0x4(%esp)
801052e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801052ea:	e8 31 fb ff ff       	call   80104e20 <argptr>
801052ef:	85 c0                	test   %eax,%eax
801052f1:	78 15                	js     80105308 <sys_fstat+0x48>
  return filestat(f, st);
801052f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801052f6:	89 44 24 04          	mov    %eax,0x4(%esp)
801052fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
801052fd:	89 04 24             	mov    %eax,(%esp)
80105300:	e8 1b bc ff ff       	call   80100f20 <filestat>
}
80105305:	c9                   	leave  
80105306:	c3                   	ret    
80105307:	90                   	nop
    return -1;
80105308:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010530d:	c9                   	leave  
8010530e:	c3                   	ret    
8010530f:	90                   	nop

80105310 <sys_link>:
{
80105310:	55                   	push   %ebp
80105311:	89 e5                	mov    %esp,%ebp
80105313:	57                   	push   %edi
80105314:	56                   	push   %esi
80105315:	53                   	push   %ebx
80105316:	83 ec 3c             	sub    $0x3c,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105319:	8d 45 d4             	lea    -0x2c(%ebp),%eax
8010531c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105320:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105327:	e8 54 fb ff ff       	call   80104e80 <argstr>
8010532c:	85 c0                	test   %eax,%eax
8010532e:	0f 88 e6 00 00 00    	js     8010541a <sys_link+0x10a>
80105334:	8d 45 d0             	lea    -0x30(%ebp),%eax
80105337:	89 44 24 04          	mov    %eax,0x4(%esp)
8010533b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105342:	e8 39 fb ff ff       	call   80104e80 <argstr>
80105347:	85 c0                	test   %eax,%eax
80105349:	0f 88 cb 00 00 00    	js     8010541a <sys_link+0x10a>
  begin_op();
8010534f:	e8 dc d7 ff ff       	call   80102b30 <begin_op>
  if((ip = namei(old)) == 0){
80105354:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80105357:	89 04 24             	mov    %eax,(%esp)
8010535a:	e8 d1 cb ff ff       	call   80101f30 <namei>
8010535f:	85 c0                	test   %eax,%eax
80105361:	89 c3                	mov    %eax,%ebx
80105363:	0f 84 ac 00 00 00    	je     80105415 <sys_link+0x105>
  ilock(ip);
80105369:	89 04 24             	mov    %eax,(%esp)
8010536c:	e8 6f c3 ff ff       	call   801016e0 <ilock>
  if(ip->type == T_DIR){
80105371:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105376:	0f 84 91 00 00 00    	je     8010540d <sys_link+0xfd>
  ip->nlink++;
8010537c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  if((dp = nameiparent(new, name)) == 0)
80105381:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
80105384:	89 1c 24             	mov    %ebx,(%esp)
80105387:	e8 94 c2 ff ff       	call   80101620 <iupdate>
  iunlock(ip);
8010538c:	89 1c 24             	mov    %ebx,(%esp)
8010538f:	e8 2c c4 ff ff       	call   801017c0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80105394:	8b 45 d0             	mov    -0x30(%ebp),%eax
80105397:	89 7c 24 04          	mov    %edi,0x4(%esp)
8010539b:	89 04 24             	mov    %eax,(%esp)
8010539e:	e8 ad cb ff ff       	call   80101f50 <nameiparent>
801053a3:	85 c0                	test   %eax,%eax
801053a5:	89 c6                	mov    %eax,%esi
801053a7:	74 4f                	je     801053f8 <sys_link+0xe8>
  ilock(dp);
801053a9:	89 04 24             	mov    %eax,(%esp)
801053ac:	e8 2f c3 ff ff       	call   801016e0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
801053b1:	8b 03                	mov    (%ebx),%eax
801053b3:	39 06                	cmp    %eax,(%esi)
801053b5:	75 39                	jne    801053f0 <sys_link+0xe0>
801053b7:	8b 43 04             	mov    0x4(%ebx),%eax
801053ba:	89 7c 24 04          	mov    %edi,0x4(%esp)
801053be:	89 34 24             	mov    %esi,(%esp)
801053c1:	89 44 24 08          	mov    %eax,0x8(%esp)
801053c5:	e8 86 ca ff ff       	call   80101e50 <dirlink>
801053ca:	85 c0                	test   %eax,%eax
801053cc:	78 22                	js     801053f0 <sys_link+0xe0>
  iunlockput(dp);
801053ce:	89 34 24             	mov    %esi,(%esp)
801053d1:	e8 6a c5 ff ff       	call   80101940 <iunlockput>
  iput(ip);
801053d6:	89 1c 24             	mov    %ebx,(%esp)
801053d9:	e8 22 c4 ff ff       	call   80101800 <iput>
  end_op();
801053de:	e8 bd d7 ff ff       	call   80102ba0 <end_op>
}
801053e3:	83 c4 3c             	add    $0x3c,%esp
  return 0;
801053e6:	31 c0                	xor    %eax,%eax
}
801053e8:	5b                   	pop    %ebx
801053e9:	5e                   	pop    %esi
801053ea:	5f                   	pop    %edi
801053eb:	5d                   	pop    %ebp
801053ec:	c3                   	ret    
801053ed:	8d 76 00             	lea    0x0(%esi),%esi
    iunlockput(dp);
801053f0:	89 34 24             	mov    %esi,(%esp)
801053f3:	e8 48 c5 ff ff       	call   80101940 <iunlockput>
  ilock(ip);
801053f8:	89 1c 24             	mov    %ebx,(%esp)
801053fb:	e8 e0 c2 ff ff       	call   801016e0 <ilock>
  ip->nlink--;
80105400:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105405:	89 1c 24             	mov    %ebx,(%esp)
80105408:	e8 13 c2 ff ff       	call   80101620 <iupdate>
  iunlockput(ip);
8010540d:	89 1c 24             	mov    %ebx,(%esp)
80105410:	e8 2b c5 ff ff       	call   80101940 <iunlockput>
  end_op();
80105415:	e8 86 d7 ff ff       	call   80102ba0 <end_op>
}
8010541a:	83 c4 3c             	add    $0x3c,%esp
  return -1;
8010541d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105422:	5b                   	pop    %ebx
80105423:	5e                   	pop    %esi
80105424:	5f                   	pop    %edi
80105425:	5d                   	pop    %ebp
80105426:	c3                   	ret    
80105427:	89 f6                	mov    %esi,%esi
80105429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105430 <sys_unlink>:
{
80105430:	55                   	push   %ebp
80105431:	89 e5                	mov    %esp,%ebp
80105433:	57                   	push   %edi
80105434:	56                   	push   %esi
80105435:	53                   	push   %ebx
80105436:	83 ec 5c             	sub    $0x5c,%esp
  if(argstr(0, &path) < 0)
80105439:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010543c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105440:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105447:	e8 34 fa ff ff       	call   80104e80 <argstr>
8010544c:	85 c0                	test   %eax,%eax
8010544e:	0f 88 76 01 00 00    	js     801055ca <sys_unlink+0x19a>
  begin_op();
80105454:	e8 d7 d6 ff ff       	call   80102b30 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105459:	8b 45 c0             	mov    -0x40(%ebp),%eax
8010545c:	8d 5d ca             	lea    -0x36(%ebp),%ebx
8010545f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80105463:	89 04 24             	mov    %eax,(%esp)
80105466:	e8 e5 ca ff ff       	call   80101f50 <nameiparent>
8010546b:	85 c0                	test   %eax,%eax
8010546d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80105470:	0f 84 4f 01 00 00    	je     801055c5 <sys_unlink+0x195>
  ilock(dp);
80105476:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105479:	89 34 24             	mov    %esi,(%esp)
8010547c:	e8 5f c2 ff ff       	call   801016e0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80105481:	c7 44 24 04 04 81 10 	movl   $0x80108104,0x4(%esp)
80105488:	80 
80105489:	89 1c 24             	mov    %ebx,(%esp)
8010548c:	e8 2f c7 ff ff       	call   80101bc0 <namecmp>
80105491:	85 c0                	test   %eax,%eax
80105493:	0f 84 21 01 00 00    	je     801055ba <sys_unlink+0x18a>
80105499:	c7 44 24 04 03 81 10 	movl   $0x80108103,0x4(%esp)
801054a0:	80 
801054a1:	89 1c 24             	mov    %ebx,(%esp)
801054a4:	e8 17 c7 ff ff       	call   80101bc0 <namecmp>
801054a9:	85 c0                	test   %eax,%eax
801054ab:	0f 84 09 01 00 00    	je     801055ba <sys_unlink+0x18a>
  if((ip = dirlookup(dp, name, &off)) == 0)
801054b1:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801054b4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801054b8:	89 44 24 08          	mov    %eax,0x8(%esp)
801054bc:	89 34 24             	mov    %esi,(%esp)
801054bf:	e8 2c c7 ff ff       	call   80101bf0 <dirlookup>
801054c4:	85 c0                	test   %eax,%eax
801054c6:	89 c3                	mov    %eax,%ebx
801054c8:	0f 84 ec 00 00 00    	je     801055ba <sys_unlink+0x18a>
  ilock(ip);
801054ce:	89 04 24             	mov    %eax,(%esp)
801054d1:	e8 0a c2 ff ff       	call   801016e0 <ilock>
  if(ip->nlink < 1)
801054d6:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801054db:	0f 8e 24 01 00 00    	jle    80105605 <sys_unlink+0x1d5>
  if(ip->type == T_DIR && !isdirempty(ip)){
801054e1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054e6:	8d 75 d8             	lea    -0x28(%ebp),%esi
801054e9:	74 7d                	je     80105568 <sys_unlink+0x138>
  memset(&de, 0, sizeof(de));
801054eb:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
801054f2:	00 
801054f3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801054fa:	00 
801054fb:	89 34 24             	mov    %esi,(%esp)
801054fe:	e8 fd f5 ff ff       	call   80104b00 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105503:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80105506:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
8010550d:	00 
8010550e:	89 74 24 04          	mov    %esi,0x4(%esp)
80105512:	89 44 24 08          	mov    %eax,0x8(%esp)
80105516:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80105519:	89 04 24             	mov    %eax,(%esp)
8010551c:	e8 6f c5 ff ff       	call   80101a90 <writei>
80105521:	83 f8 10             	cmp    $0x10,%eax
80105524:	0f 85 cf 00 00 00    	jne    801055f9 <sys_unlink+0x1c9>
  if(ip->type == T_DIR){
8010552a:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010552f:	0f 84 a3 00 00 00    	je     801055d8 <sys_unlink+0x1a8>
  iunlockput(dp);
80105535:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80105538:	89 04 24             	mov    %eax,(%esp)
8010553b:	e8 00 c4 ff ff       	call   80101940 <iunlockput>
  ip->nlink--;
80105540:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105545:	89 1c 24             	mov    %ebx,(%esp)
80105548:	e8 d3 c0 ff ff       	call   80101620 <iupdate>
  iunlockput(ip);
8010554d:	89 1c 24             	mov    %ebx,(%esp)
80105550:	e8 eb c3 ff ff       	call   80101940 <iunlockput>
  end_op();
80105555:	e8 46 d6 ff ff       	call   80102ba0 <end_op>
}
8010555a:	83 c4 5c             	add    $0x5c,%esp
  return 0;
8010555d:	31 c0                	xor    %eax,%eax
}
8010555f:	5b                   	pop    %ebx
80105560:	5e                   	pop    %esi
80105561:	5f                   	pop    %edi
80105562:	5d                   	pop    %ebp
80105563:	c3                   	ret    
80105564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105568:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
8010556c:	0f 86 79 ff ff ff    	jbe    801054eb <sys_unlink+0xbb>
80105572:	bf 20 00 00 00       	mov    $0x20,%edi
80105577:	eb 15                	jmp    8010558e <sys_unlink+0x15e>
80105579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105580:	8d 57 10             	lea    0x10(%edi),%edx
80105583:	3b 53 58             	cmp    0x58(%ebx),%edx
80105586:	0f 83 5f ff ff ff    	jae    801054eb <sys_unlink+0xbb>
8010558c:	89 d7                	mov    %edx,%edi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010558e:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80105595:	00 
80105596:	89 7c 24 08          	mov    %edi,0x8(%esp)
8010559a:	89 74 24 04          	mov    %esi,0x4(%esp)
8010559e:	89 1c 24             	mov    %ebx,(%esp)
801055a1:	e8 ea c3 ff ff       	call   80101990 <readi>
801055a6:	83 f8 10             	cmp    $0x10,%eax
801055a9:	75 42                	jne    801055ed <sys_unlink+0x1bd>
    if(de.inum != 0)
801055ab:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801055b0:	74 ce                	je     80105580 <sys_unlink+0x150>
    iunlockput(ip);
801055b2:	89 1c 24             	mov    %ebx,(%esp)
801055b5:	e8 86 c3 ff ff       	call   80101940 <iunlockput>
  iunlockput(dp);
801055ba:	8b 45 b4             	mov    -0x4c(%ebp),%eax
801055bd:	89 04 24             	mov    %eax,(%esp)
801055c0:	e8 7b c3 ff ff       	call   80101940 <iunlockput>
  end_op();
801055c5:	e8 d6 d5 ff ff       	call   80102ba0 <end_op>
}
801055ca:	83 c4 5c             	add    $0x5c,%esp
  return -1;
801055cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801055d2:	5b                   	pop    %ebx
801055d3:	5e                   	pop    %esi
801055d4:	5f                   	pop    %edi
801055d5:	5d                   	pop    %ebp
801055d6:	c3                   	ret    
801055d7:	90                   	nop
    dp->nlink--;
801055d8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
801055db:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
801055e0:	89 04 24             	mov    %eax,(%esp)
801055e3:	e8 38 c0 ff ff       	call   80101620 <iupdate>
801055e8:	e9 48 ff ff ff       	jmp    80105535 <sys_unlink+0x105>
      panic("isdirempty: readi");
801055ed:	c7 04 24 28 81 10 80 	movl   $0x80108128,(%esp)
801055f4:	e8 67 ad ff ff       	call   80100360 <panic>
    panic("unlink: writei");
801055f9:	c7 04 24 3a 81 10 80 	movl   $0x8010813a,(%esp)
80105600:	e8 5b ad ff ff       	call   80100360 <panic>
    panic("unlink: nlink < 1");
80105605:	c7 04 24 16 81 10 80 	movl   $0x80108116,(%esp)
8010560c:	e8 4f ad ff ff       	call   80100360 <panic>
80105611:	eb 0d                	jmp    80105620 <sys_open>
80105613:	90                   	nop
80105614:	90                   	nop
80105615:	90                   	nop
80105616:	90                   	nop
80105617:	90                   	nop
80105618:	90                   	nop
80105619:	90                   	nop
8010561a:	90                   	nop
8010561b:	90                   	nop
8010561c:	90                   	nop
8010561d:	90                   	nop
8010561e:	90                   	nop
8010561f:	90                   	nop

80105620 <sys_open>:

int
sys_open(void)
{
80105620:	55                   	push   %ebp
80105621:	89 e5                	mov    %esp,%ebp
80105623:	57                   	push   %edi
80105624:	56                   	push   %esi
80105625:	53                   	push   %ebx
80105626:	83 ec 2c             	sub    $0x2c,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105629:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010562c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105630:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105637:	e8 44 f8 ff ff       	call   80104e80 <argstr>
8010563c:	85 c0                	test   %eax,%eax
8010563e:	0f 88 d1 00 00 00    	js     80105715 <sys_open+0xf5>
80105644:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105647:	89 44 24 04          	mov    %eax,0x4(%esp)
8010564b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105652:	e8 99 f7 ff ff       	call   80104df0 <argint>
80105657:	85 c0                	test   %eax,%eax
80105659:	0f 88 b6 00 00 00    	js     80105715 <sys_open+0xf5>
    return -1;

  begin_op();
8010565f:	e8 cc d4 ff ff       	call   80102b30 <begin_op>

  if(omode & O_CREATE){
80105664:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105668:	0f 85 82 00 00 00    	jne    801056f0 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
8010566e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105671:	89 04 24             	mov    %eax,(%esp)
80105674:	e8 b7 c8 ff ff       	call   80101f30 <namei>
80105679:	85 c0                	test   %eax,%eax
8010567b:	89 c6                	mov    %eax,%esi
8010567d:	0f 84 8d 00 00 00    	je     80105710 <sys_open+0xf0>
      end_op();
      return -1;
    }
    ilock(ip);
80105683:	89 04 24             	mov    %eax,(%esp)
80105686:	e8 55 c0 ff ff       	call   801016e0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
8010568b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105690:	0f 84 92 00 00 00    	je     80105728 <sys_open+0x108>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105696:	e8 05 b7 ff ff       	call   80100da0 <filealloc>
8010569b:	85 c0                	test   %eax,%eax
8010569d:	89 c3                	mov    %eax,%ebx
8010569f:	0f 84 93 00 00 00    	je     80105738 <sys_open+0x118>
801056a5:	e8 86 f8 ff ff       	call   80104f30 <fdalloc>
801056aa:	85 c0                	test   %eax,%eax
801056ac:	89 c7                	mov    %eax,%edi
801056ae:	0f 88 94 00 00 00    	js     80105748 <sys_open+0x128>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801056b4:	89 34 24             	mov    %esi,(%esp)
801056b7:	e8 04 c1 ff ff       	call   801017c0 <iunlock>
  end_op();
801056bc:	e8 df d4 ff ff       	call   80102ba0 <end_op>

  f->type = FD_INODE;
801056c1:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801056c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  f->ip = ip;
801056ca:	89 73 10             	mov    %esi,0x10(%ebx)
  f->off = 0;
801056cd:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
  f->readable = !(omode & O_WRONLY);
801056d4:	89 c2                	mov    %eax,%edx
801056d6:	83 e2 01             	and    $0x1,%edx
801056d9:	83 f2 01             	xor    $0x1,%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801056dc:	a8 03                	test   $0x3,%al
  f->readable = !(omode & O_WRONLY);
801056de:	88 53 08             	mov    %dl,0x8(%ebx)
  return fd;
801056e1:	89 f8                	mov    %edi,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801056e3:	0f 95 43 09          	setne  0x9(%ebx)
}
801056e7:	83 c4 2c             	add    $0x2c,%esp
801056ea:	5b                   	pop    %ebx
801056eb:	5e                   	pop    %esi
801056ec:	5f                   	pop    %edi
801056ed:	5d                   	pop    %ebp
801056ee:	c3                   	ret    
801056ef:	90                   	nop
    ip = create(path, T_FILE, 0, 0);
801056f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
801056f3:	31 c9                	xor    %ecx,%ecx
801056f5:	ba 02 00 00 00       	mov    $0x2,%edx
801056fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105701:	e8 6a f8 ff ff       	call   80104f70 <create>
    if(ip == 0){
80105706:	85 c0                	test   %eax,%eax
    ip = create(path, T_FILE, 0, 0);
80105708:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010570a:	75 8a                	jne    80105696 <sys_open+0x76>
8010570c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    end_op();
80105710:	e8 8b d4 ff ff       	call   80102ba0 <end_op>
}
80105715:	83 c4 2c             	add    $0x2c,%esp
    return -1;
80105718:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010571d:	5b                   	pop    %ebx
8010571e:	5e                   	pop    %esi
8010571f:	5f                   	pop    %edi
80105720:	5d                   	pop    %ebp
80105721:	c3                   	ret    
80105722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80105728:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010572b:	85 c0                	test   %eax,%eax
8010572d:	0f 84 63 ff ff ff    	je     80105696 <sys_open+0x76>
80105733:	90                   	nop
80105734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    iunlockput(ip);
80105738:	89 34 24             	mov    %esi,(%esp)
8010573b:	e8 00 c2 ff ff       	call   80101940 <iunlockput>
80105740:	eb ce                	jmp    80105710 <sys_open+0xf0>
80105742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      fileclose(f);
80105748:	89 1c 24             	mov    %ebx,(%esp)
8010574b:	e8 10 b7 ff ff       	call   80100e60 <fileclose>
80105750:	eb e6                	jmp    80105738 <sys_open+0x118>
80105752:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105760 <sys_mkdir>:

int
sys_mkdir(void)
{
80105760:	55                   	push   %ebp
80105761:	89 e5                	mov    %esp,%ebp
80105763:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105766:	e8 c5 d3 ff ff       	call   80102b30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010576b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010576e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105772:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105779:	e8 02 f7 ff ff       	call   80104e80 <argstr>
8010577e:	85 c0                	test   %eax,%eax
80105780:	78 2e                	js     801057b0 <sys_mkdir+0x50>
80105782:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105785:	31 c9                	xor    %ecx,%ecx
80105787:	ba 01 00 00 00       	mov    $0x1,%edx
8010578c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105793:	e8 d8 f7 ff ff       	call   80104f70 <create>
80105798:	85 c0                	test   %eax,%eax
8010579a:	74 14                	je     801057b0 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010579c:	89 04 24             	mov    %eax,(%esp)
8010579f:	e8 9c c1 ff ff       	call   80101940 <iunlockput>
  end_op();
801057a4:	e8 f7 d3 ff ff       	call   80102ba0 <end_op>
  return 0;
801057a9:	31 c0                	xor    %eax,%eax
}
801057ab:	c9                   	leave  
801057ac:	c3                   	ret    
801057ad:	8d 76 00             	lea    0x0(%esi),%esi
    end_op();
801057b0:	e8 eb d3 ff ff       	call   80102ba0 <end_op>
    return -1;
801057b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801057ba:	c9                   	leave  
801057bb:	c3                   	ret    
801057bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801057c0 <sys_mknod>:

int
sys_mknod(void)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801057c6:	e8 65 d3 ff ff       	call   80102b30 <begin_op>
  if((argstr(0, &path)) < 0 ||
801057cb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801057ce:	89 44 24 04          	mov    %eax,0x4(%esp)
801057d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801057d9:	e8 a2 f6 ff ff       	call   80104e80 <argstr>
801057de:	85 c0                	test   %eax,%eax
801057e0:	78 5e                	js     80105840 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801057e2:	8d 45 f0             	lea    -0x10(%ebp),%eax
801057e5:	89 44 24 04          	mov    %eax,0x4(%esp)
801057e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801057f0:	e8 fb f5 ff ff       	call   80104df0 <argint>
  if((argstr(0, &path)) < 0 ||
801057f5:	85 c0                	test   %eax,%eax
801057f7:	78 47                	js     80105840 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801057f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057fc:	89 44 24 04          	mov    %eax,0x4(%esp)
80105800:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105807:	e8 e4 f5 ff ff       	call   80104df0 <argint>
     argint(1, &major) < 0 ||
8010580c:	85 c0                	test   %eax,%eax
8010580e:	78 30                	js     80105840 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
80105810:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
     argint(2, &minor) < 0 ||
80105814:	ba 03 00 00 00       	mov    $0x3,%edx
     (ip = create(path, T_DEV, major, minor)) == 0){
80105819:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
8010581d:	89 04 24             	mov    %eax,(%esp)
     argint(2, &minor) < 0 ||
80105820:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105823:	e8 48 f7 ff ff       	call   80104f70 <create>
80105828:	85 c0                	test   %eax,%eax
8010582a:	74 14                	je     80105840 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010582c:	89 04 24             	mov    %eax,(%esp)
8010582f:	e8 0c c1 ff ff       	call   80101940 <iunlockput>
  end_op();
80105834:	e8 67 d3 ff ff       	call   80102ba0 <end_op>
  return 0;
80105839:	31 c0                	xor    %eax,%eax
}
8010583b:	c9                   	leave  
8010583c:	c3                   	ret    
8010583d:	8d 76 00             	lea    0x0(%esi),%esi
    end_op();
80105840:	e8 5b d3 ff ff       	call   80102ba0 <end_op>
    return -1;
80105845:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010584a:	c9                   	leave  
8010584b:	c3                   	ret    
8010584c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105850 <sys_chdir>:

int
sys_chdir(void)
{
80105850:	55                   	push   %ebp
80105851:	89 e5                	mov    %esp,%ebp
80105853:	56                   	push   %esi
80105854:	53                   	push   %ebx
80105855:	83 ec 20             	sub    $0x20,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105858:	e8 d3 de ff ff       	call   80103730 <myproc>
8010585d:	89 c6                	mov    %eax,%esi
  
  begin_op();
8010585f:	e8 cc d2 ff ff       	call   80102b30 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105864:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105867:	89 44 24 04          	mov    %eax,0x4(%esp)
8010586b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105872:	e8 09 f6 ff ff       	call   80104e80 <argstr>
80105877:	85 c0                	test   %eax,%eax
80105879:	78 4a                	js     801058c5 <sys_chdir+0x75>
8010587b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010587e:	89 04 24             	mov    %eax,(%esp)
80105881:	e8 aa c6 ff ff       	call   80101f30 <namei>
80105886:	85 c0                	test   %eax,%eax
80105888:	89 c3                	mov    %eax,%ebx
8010588a:	74 39                	je     801058c5 <sys_chdir+0x75>
    end_op();
    return -1;
  }
  ilock(ip);
8010588c:	89 04 24             	mov    %eax,(%esp)
8010588f:	e8 4c be ff ff       	call   801016e0 <ilock>
  if(ip->type != T_DIR){
80105894:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
    iunlockput(ip);
80105899:	89 1c 24             	mov    %ebx,(%esp)
  if(ip->type != T_DIR){
8010589c:	75 22                	jne    801058c0 <sys_chdir+0x70>
    end_op();
    return -1;
  }
  iunlock(ip);
8010589e:	e8 1d bf ff ff       	call   801017c0 <iunlock>
  iput(curproc->cwd);
801058a3:	8b 46 68             	mov    0x68(%esi),%eax
801058a6:	89 04 24             	mov    %eax,(%esp)
801058a9:	e8 52 bf ff ff       	call   80101800 <iput>
  end_op();
801058ae:	e8 ed d2 ff ff       	call   80102ba0 <end_op>
  curproc->cwd = ip;
  return 0;
801058b3:	31 c0                	xor    %eax,%eax
  curproc->cwd = ip;
801058b5:	89 5e 68             	mov    %ebx,0x68(%esi)
}
801058b8:	83 c4 20             	add    $0x20,%esp
801058bb:	5b                   	pop    %ebx
801058bc:	5e                   	pop    %esi
801058bd:	5d                   	pop    %ebp
801058be:	c3                   	ret    
801058bf:	90                   	nop
    iunlockput(ip);
801058c0:	e8 7b c0 ff ff       	call   80101940 <iunlockput>
    end_op();
801058c5:	e8 d6 d2 ff ff       	call   80102ba0 <end_op>
}
801058ca:	83 c4 20             	add    $0x20,%esp
    return -1;
801058cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801058d2:	5b                   	pop    %ebx
801058d3:	5e                   	pop    %esi
801058d4:	5d                   	pop    %ebp
801058d5:	c3                   	ret    
801058d6:	8d 76 00             	lea    0x0(%esi),%esi
801058d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058e0 <sys_exec>:

int
sys_exec(void)
{
801058e0:	55                   	push   %ebp
801058e1:	89 e5                	mov    %esp,%ebp
801058e3:	57                   	push   %edi
801058e4:	56                   	push   %esi
801058e5:	53                   	push   %ebx
801058e6:	81 ec ac 00 00 00    	sub    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801058ec:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801058f2:	89 44 24 04          	mov    %eax,0x4(%esp)
801058f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801058fd:	e8 7e f5 ff ff       	call   80104e80 <argstr>
80105902:	85 c0                	test   %eax,%eax
80105904:	0f 88 84 00 00 00    	js     8010598e <sys_exec+0xae>
8010590a:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105910:	89 44 24 04          	mov    %eax,0x4(%esp)
80105914:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010591b:	e8 d0 f4 ff ff       	call   80104df0 <argint>
80105920:	85 c0                	test   %eax,%eax
80105922:	78 6a                	js     8010598e <sys_exec+0xae>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105924:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
  for(i=0;; i++){
8010592a:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
8010592c:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80105933:	00 
80105934:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
8010593a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105941:	00 
80105942:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105948:	89 04 24             	mov    %eax,(%esp)
8010594b:	e8 b0 f1 ff ff       	call   80104b00 <memset>
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105950:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105956:	89 7c 24 04          	mov    %edi,0x4(%esp)
8010595a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010595d:	89 04 24             	mov    %eax,(%esp)
80105960:	e8 eb f3 ff ff       	call   80104d50 <fetchint>
80105965:	85 c0                	test   %eax,%eax
80105967:	78 25                	js     8010598e <sys_exec+0xae>
      return -1;
    if(uarg == 0){
80105969:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
8010596f:	85 c0                	test   %eax,%eax
80105971:	74 2d                	je     801059a0 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105973:	89 74 24 04          	mov    %esi,0x4(%esp)
80105977:	89 04 24             	mov    %eax,(%esp)
8010597a:	e8 11 f4 ff ff       	call   80104d90 <fetchstr>
8010597f:	85 c0                	test   %eax,%eax
80105981:	78 0b                	js     8010598e <sys_exec+0xae>
  for(i=0;; i++){
80105983:	83 c3 01             	add    $0x1,%ebx
80105986:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
80105989:	83 fb 20             	cmp    $0x20,%ebx
8010598c:	75 c2                	jne    80105950 <sys_exec+0x70>
      return -1;
  }
  return exec(path, argv);
}
8010598e:	81 c4 ac 00 00 00    	add    $0xac,%esp
    return -1;
80105994:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105999:	5b                   	pop    %ebx
8010599a:	5e                   	pop    %esi
8010599b:	5f                   	pop    %edi
8010599c:	5d                   	pop    %ebp
8010599d:	c3                   	ret    
8010599e:	66 90                	xchg   %ax,%ax
  return exec(path, argv);
801059a0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801059a6:	89 44 24 04          	mov    %eax,0x4(%esp)
801059aa:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
      argv[i] = 0;
801059b0:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801059b7:	00 00 00 00 
  return exec(path, argv);
801059bb:	89 04 24             	mov    %eax,(%esp)
801059be:	e8 2d b0 ff ff       	call   801009f0 <exec>
}
801059c3:	81 c4 ac 00 00 00    	add    $0xac,%esp
801059c9:	5b                   	pop    %ebx
801059ca:	5e                   	pop    %esi
801059cb:	5f                   	pop    %edi
801059cc:	5d                   	pop    %ebp
801059cd:	c3                   	ret    
801059ce:	66 90                	xchg   %ax,%ax

801059d0 <sys_pipe>:

int
sys_pipe(void)
{
801059d0:	55                   	push   %ebp
801059d1:	89 e5                	mov    %esp,%ebp
801059d3:	53                   	push   %ebx
801059d4:	83 ec 24             	sub    $0x24,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801059d7:	8d 45 ec             	lea    -0x14(%ebp),%eax
801059da:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
801059e1:	00 
801059e2:	89 44 24 04          	mov    %eax,0x4(%esp)
801059e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801059ed:	e8 2e f4 ff ff       	call   80104e20 <argptr>
801059f2:	85 c0                	test   %eax,%eax
801059f4:	78 6d                	js     80105a63 <sys_pipe+0x93>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801059f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801059f9:	89 44 24 04          	mov    %eax,0x4(%esp)
801059fd:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105a00:	89 04 24             	mov    %eax,(%esp)
80105a03:	e8 88 d7 ff ff       	call   80103190 <pipealloc>
80105a08:	85 c0                	test   %eax,%eax
80105a0a:	78 57                	js     80105a63 <sys_pipe+0x93>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105a0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105a0f:	e8 1c f5 ff ff       	call   80104f30 <fdalloc>
80105a14:	85 c0                	test   %eax,%eax
80105a16:	89 c3                	mov    %eax,%ebx
80105a18:	78 33                	js     80105a4d <sys_pipe+0x7d>
80105a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a1d:	e8 0e f5 ff ff       	call   80104f30 <fdalloc>
80105a22:	85 c0                	test   %eax,%eax
80105a24:	78 1a                	js     80105a40 <sys_pipe+0x70>
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105a26:	8b 55 ec             	mov    -0x14(%ebp),%edx
80105a29:	89 1a                	mov    %ebx,(%edx)
  fd[1] = fd1;
80105a2b:	8b 55 ec             	mov    -0x14(%ebp),%edx
80105a2e:	89 42 04             	mov    %eax,0x4(%edx)
  return 0;
}
80105a31:	83 c4 24             	add    $0x24,%esp
  return 0;
80105a34:	31 c0                	xor    %eax,%eax
}
80105a36:	5b                   	pop    %ebx
80105a37:	5d                   	pop    %ebp
80105a38:	c3                   	ret    
80105a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      myproc()->ofile[fd0] = 0;
80105a40:	e8 eb dc ff ff       	call   80103730 <myproc>
80105a45:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
80105a4c:	00 
    fileclose(rf);
80105a4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105a50:	89 04 24             	mov    %eax,(%esp)
80105a53:	e8 08 b4 ff ff       	call   80100e60 <fileclose>
    fileclose(wf);
80105a58:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a5b:	89 04 24             	mov    %eax,(%esp)
80105a5e:	e8 fd b3 ff ff       	call   80100e60 <fileclose>
}
80105a63:	83 c4 24             	add    $0x24,%esp
    return -1;
80105a66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a6b:	5b                   	pop    %ebx
80105a6c:	5d                   	pop    %ebp
80105a6d:	c3                   	ret    
80105a6e:	66 90                	xchg   %ax,%ax

80105a70 <sys_halt>:
#include "proc.h"

#ifdef HALT
int
sys_halt(void)
{
80105a70:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105a71:	ba f4 00 00 00       	mov    $0xf4,%edx
80105a76:	89 e5                	mov    %esp,%ebp
80105a78:	31 c0                	xor    %eax,%eax
80105a7a:	ee                   	out    %al,(%dx)
    outb(0xf4, 0x00);
    return 0;
}
80105a7b:	31 c0                	xor    %eax,%eax
80105a7d:	5d                   	pop    %ebp
80105a7e:	c3                   	ret    
80105a7f:	90                   	nop

80105a80 <sys_fork>:
#endif // HALT

int
sys_fork(void)
{
80105a80:	55                   	push   %ebp
80105a81:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105a83:	5d                   	pop    %ebp
  return fork();
80105a84:	e9 57 de ff ff       	jmp    801038e0 <fork>
80105a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105a90 <sys_exit>:

int
sys_exit(void)
{
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	83 ec 08             	sub    $0x8,%esp
  exit();
80105a96:	e8 d5 e3 ff ff       	call   80103e70 <exit>
  return 0;  // not reached
}
80105a9b:	31 c0                	xor    %eax,%eax
80105a9d:	c9                   	leave  
80105a9e:	c3                   	ret    
80105a9f:	90                   	nop

80105aa0 <sys_wait>:

int
sys_wait(void)
{
80105aa0:	55                   	push   %ebp
80105aa1:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105aa3:	5d                   	pop    %ebp
  return wait();
80105aa4:	e9 47 e7 ff ff       	jmp    801041f0 <wait>
80105aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ab0 <sys_kill>:

int
sys_kill(void)
{
80105ab0:	55                   	push   %ebp
80105ab1:	89 e5                	mov    %esp,%ebp
80105ab3:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105ab6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105ab9:	89 44 24 04          	mov    %eax,0x4(%esp)
80105abd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105ac4:	e8 27 f3 ff ff       	call   80104df0 <argint>
80105ac9:	85 c0                	test   %eax,%eax
80105acb:	78 13                	js     80105ae0 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105ad0:	89 04 24             	mov    %eax,(%esp)
80105ad3:	e8 a8 e8 ff ff       	call   80104380 <kill>
}
80105ad8:	c9                   	leave  
80105ad9:	c3                   	ret    
80105ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105ae0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105ae5:	c9                   	leave  
80105ae6:	c3                   	ret    
80105ae7:	89 f6                	mov    %esi,%esi
80105ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105af0 <sys_getpid>:

int
sys_getpid(void)
{
80105af0:	55                   	push   %ebp
80105af1:	89 e5                	mov    %esp,%ebp
80105af3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105af6:	e8 35 dc ff ff       	call   80103730 <myproc>
80105afb:	8b 40 10             	mov    0x10(%eax),%eax
}
80105afe:	c9                   	leave  
80105aff:	c3                   	ret    

80105b00 <sys_getppid>:

#ifdef GETPPID
int
sys_getppid(void)
{
80105b00:	55                   	push   %ebp
80105b01:	89 e5                	mov    %esp,%ebp
80105b03:	83 ec 08             	sub    $0x8,%esp
    int ppid = 1;

    if (myproc()->parent) {
80105b06:	e8 25 dc ff ff       	call   80103730 <myproc>
    int ppid = 1;
80105b0b:	ba 01 00 00 00       	mov    $0x1,%edx
    if (myproc()->parent) {
80105b10:	8b 40 14             	mov    0x14(%eax),%eax
80105b13:	85 c0                	test   %eax,%eax
80105b15:	74 0b                	je     80105b22 <sys_getppid+0x22>
        ppid = myproc()->parent->pid;
80105b17:	e8 14 dc ff ff       	call   80103730 <myproc>
80105b1c:	8b 40 14             	mov    0x14(%eax),%eax
80105b1f:	8b 50 10             	mov    0x10(%eax),%edx
    }
    return ppid;
}
80105b22:	89 d0                	mov    %edx,%eax
80105b24:	c9                   	leave  
80105b25:	c3                   	ret    
80105b26:	8d 76 00             	lea    0x0(%esi),%esi
80105b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b30 <sys_sbrk>:
#endif // GETPPID

int
sys_sbrk(void)
{
80105b30:	55                   	push   %ebp
80105b31:	89 e5                	mov    %esp,%ebp
80105b33:	53                   	push   %ebx
80105b34:	83 ec 24             	sub    $0x24,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105b37:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b3a:	89 44 24 04          	mov    %eax,0x4(%esp)
80105b3e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105b45:	e8 a6 f2 ff ff       	call   80104df0 <argint>
80105b4a:	85 c0                	test   %eax,%eax
80105b4c:	78 22                	js     80105b70 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105b4e:	e8 dd db ff ff       	call   80103730 <myproc>
  if(growproc(n) < 0)
80105b53:	8b 55 f4             	mov    -0xc(%ebp),%edx
  addr = myproc()->sz;
80105b56:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105b58:	89 14 24             	mov    %edx,(%esp)
80105b5b:	e8 10 dd ff ff       	call   80103870 <growproc>
80105b60:	85 c0                	test   %eax,%eax
80105b62:	78 0c                	js     80105b70 <sys_sbrk+0x40>
    return -1;
  return addr;
80105b64:	89 d8                	mov    %ebx,%eax
}
80105b66:	83 c4 24             	add    $0x24,%esp
80105b69:	5b                   	pop    %ebx
80105b6a:	5d                   	pop    %ebp
80105b6b:	c3                   	ret    
80105b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b75:	eb ef                	jmp    80105b66 <sys_sbrk+0x36>
80105b77:	89 f6                	mov    %esi,%esi
80105b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b80 <sys_sleep>:

int
sys_sleep(void)
{
80105b80:	55                   	push   %ebp
80105b81:	89 e5                	mov    %esp,%ebp
80105b83:	53                   	push   %ebx
80105b84:	83 ec 24             	sub    $0x24,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105b87:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105b8a:	89 44 24 04          	mov    %eax,0x4(%esp)
80105b8e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105b95:	e8 56 f2 ff ff       	call   80104df0 <argint>
80105b9a:	85 c0                	test   %eax,%eax
80105b9c:	78 7e                	js     80105c1c <sys_sleep+0x9c>
    return -1;
  acquire(&tickslock);
80105b9e:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
80105ba5:	e8 76 ee ff ff       	call   80104a20 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105baa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
80105bad:	8b 1d c0 72 11 80    	mov    0x801172c0,%ebx
  while(ticks - ticks0 < n){
80105bb3:	85 d2                	test   %edx,%edx
80105bb5:	75 29                	jne    80105be0 <sys_sleep+0x60>
80105bb7:	eb 4f                	jmp    80105c08 <sys_sleep+0x88>
80105bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105bc0:	c7 44 24 04 80 6a 11 	movl   $0x80116a80,0x4(%esp)
80105bc7:	80 
80105bc8:	c7 04 24 c0 72 11 80 	movl   $0x801172c0,(%esp)
80105bcf:	e8 6c e5 ff ff       	call   80104140 <sleep>
  while(ticks - ticks0 < n){
80105bd4:	a1 c0 72 11 80       	mov    0x801172c0,%eax
80105bd9:	29 d8                	sub    %ebx,%eax
80105bdb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105bde:	73 28                	jae    80105c08 <sys_sleep+0x88>
    if(myproc()->killed){
80105be0:	e8 4b db ff ff       	call   80103730 <myproc>
80105be5:	8b 40 24             	mov    0x24(%eax),%eax
80105be8:	85 c0                	test   %eax,%eax
80105bea:	74 d4                	je     80105bc0 <sys_sleep+0x40>
      release(&tickslock);
80105bec:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
80105bf3:	e8 a8 ee ff ff       	call   80104aa0 <release>
      return -1;
80105bf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105bfd:	83 c4 24             	add    $0x24,%esp
80105c00:	5b                   	pop    %ebx
80105c01:	5d                   	pop    %ebp
80105c02:	c3                   	ret    
80105c03:	90                   	nop
80105c04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&tickslock);
80105c08:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
80105c0f:	e8 8c ee ff ff       	call   80104aa0 <release>
}
80105c14:	83 c4 24             	add    $0x24,%esp
  return 0;
80105c17:	31 c0                	xor    %eax,%eax
}
80105c19:	5b                   	pop    %ebx
80105c1a:	5d                   	pop    %ebp
80105c1b:	c3                   	ret    
    return -1;
80105c1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c21:	eb da                	jmp    80105bfd <sys_sleep+0x7d>
80105c23:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c30 <suptime>:

#ifdef PROC_TIMES
int
suptime(void)
{
80105c30:	55                   	push   %ebp
80105c31:	89 e5                	mov    %esp,%ebp
80105c33:	53                   	push   %ebx
80105c34:	83 ec 14             	sub    $0x14,%esp
    uint xticks;

    acquire(&tickslock);
80105c37:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
80105c3e:	e8 dd ed ff ff       	call   80104a20 <acquire>
    xticks = ticks;
80105c43:	8b 1d c0 72 11 80    	mov    0x801172c0,%ebx
    release(&tickslock);
80105c49:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
80105c50:	e8 4b ee ff ff       	call   80104aa0 <release>
    return xticks;
}
80105c55:	83 c4 14             	add    $0x14,%esp
80105c58:	89 d8                	mov    %ebx,%eax
80105c5a:	5b                   	pop    %ebx
80105c5b:	5d                   	pop    %ebp
80105c5c:	c3                   	ret    
80105c5d:	8d 76 00             	lea    0x0(%esi),%esi

80105c60 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105c60:	55                   	push   %ebp
80105c61:	89 e5                	mov    %esp,%ebp
80105c63:	53                   	push   %ebx
80105c64:	83 ec 14             	sub    $0x14,%esp
#ifdef PROC_TIME
    return suptime();
#else // PROC_TIMES
  uint xticks;

  acquire(&tickslock);
80105c67:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
80105c6e:	e8 ad ed ff ff       	call   80104a20 <acquire>
  xticks = ticks;
80105c73:	8b 1d c0 72 11 80    	mov    0x801172c0,%ebx
  release(&tickslock);
80105c79:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
80105c80:	e8 1b ee ff ff       	call   80104aa0 <release>
  return xticks;
#endif // PROC_TIMES
}
80105c85:	83 c4 14             	add    $0x14,%esp
80105c88:	89 d8                	mov    %ebx,%eax
80105c8a:	5b                   	pop    %ebx
80105c8b:	5d                   	pop    %ebp
80105c8c:	c3                   	ret    
80105c8d:	8d 76 00             	lea    0x0(%esi),%esi

80105c90 <sys_kdebug>:

#ifdef KDEBUG
int
sys_kdebug(void)
{
80105c90:	55                   	push   %ebp
80105c91:	89 e5                	mov    %esp,%ebp
80105c93:	83 ec 28             	sub    $0x28,%esp
    int n = 0;

    cprintf("%d %s\n", __LINE__, __FILE__);
80105c96:	c7 44 24 08 49 81 10 	movl   $0x80108149,0x8(%esp)
80105c9d:	80 
80105c9e:	c7 44 24 04 8a 00 00 	movl   $0x8a,0x4(%esp)
80105ca5:	00 
80105ca6:	c7 04 24 02 7e 10 80 	movl   $0x80107e02,(%esp)
    int n = 0;
80105cad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cprintf("%d %s\n", __LINE__, __FILE__);
80105cb4:	e8 97 a9 ff ff       	call   80100650 <cprintf>
    if (argint(0, &n) < 0) {
80105cb9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105cbc:	89 44 24 04          	mov    %eax,0x4(%esp)
80105cc0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105cc7:	e8 24 f1 ff ff       	call   80104df0 <argint>
80105ccc:	85 c0                	test   %eax,%eax
80105cce:	78 10                	js     80105ce0 <sys_kdebug+0x50>
        return -1;
    }
    return proc_kdebug(n);
80105cd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105cd3:	89 04 24             	mov    %eax,(%esp)
80105cd6:	e8 35 ea ff ff       	call   80104710 <proc_kdebug>
}
80105cdb:	c9                   	leave  
80105cdc:	c3                   	ret    
80105cdd:	8d 76 00             	lea    0x0(%esi),%esi
        return -1;
80105ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105ce5:	c9                   	leave  
80105ce6:	c3                   	ret    
80105ce7:	89 f6                	mov    %esi,%esi
80105ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105cf0 <sys_va2pa>:
#endif // KDEBUG

#ifdef VA2PA
int
sys_va2pa(void)
{
80105cf0:	55                   	push   %ebp
80105cf1:	89 e5                	mov    %esp,%ebp
80105cf3:	53                   	push   %ebx
80105cf4:	83 ec 24             	sub    $0x24,%esp
    int va = 0x0;
80105cf7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char *pa = 0x0;
    struct proc *p = myproc();
80105cfe:	e8 2d da ff ff       	call   80103730 <myproc>

    if (argint(0, &va) < 0) {
80105d03:	8d 55 f4             	lea    -0xc(%ebp),%edx
80105d06:	89 54 24 04          	mov    %edx,0x4(%esp)
80105d0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    struct proc *p = myproc();
80105d11:	89 c3                	mov    %eax,%ebx
    if (argint(0, &va) < 0) {
80105d13:	e8 d8 f0 ff ff       	call   80104df0 <argint>
80105d18:	89 c1                	mov    %eax,%ecx
        return 0x0;
80105d1a:	31 c0                	xor    %eax,%eax
    if (argint(0, &va) < 0) {
80105d1c:	85 c9                	test   %ecx,%ecx
80105d1e:	78 12                	js     80105d32 <sys_va2pa+0x42>
    }
    pa = uva2ka(p->pgdir, (char *) va);
80105d20:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d23:	89 44 24 04          	mov    %eax,0x4(%esp)
80105d27:	8b 43 04             	mov    0x4(%ebx),%eax
80105d2a:	89 04 24             	mov    %eax,(%esp)
80105d2d:	e8 ce 18 00 00       	call   80107600 <uva2ka>
    return ((int) pa);
}
80105d32:	83 c4 24             	add    $0x24,%esp
80105d35:	5b                   	pop    %ebx
80105d36:	5d                   	pop    %ebp
80105d37:	c3                   	ret    
80105d38:	90                   	nop
80105d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105d40 <sys_kthread_create>:
#endif // VA2PA

#ifdef KTHREADS
int sys_kthread_create(void)
{
80105d40:	55                   	push   %ebp
80105d41:	89 e5                	mov    %esp,%ebp
80105d43:	83 ec 28             	sub    $0x28,%esp
  int func, arg_ptr, tstack;
  if (argint(0, &func) < 0)
80105d46:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105d49:	89 44 24 04          	mov    %eax,0x4(%esp)
80105d4d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105d54:	e8 97 f0 ff ff       	call   80104df0 <argint>
80105d59:	85 c0                	test   %eax,%eax
80105d5b:	78 4b                	js     80105da8 <sys_kthread_create+0x68>
    return -1;
  if (argint(1, &arg_ptr) < 0)
80105d5d:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105d60:	89 44 24 04          	mov    %eax,0x4(%esp)
80105d64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105d6b:	e8 80 f0 ff ff       	call   80104df0 <argint>
80105d70:	85 c0                	test   %eax,%eax
80105d72:	78 34                	js     80105da8 <sys_kthread_create+0x68>
    return -1;
  if (argint(2, &tstack) < 0)
80105d74:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105d77:	89 44 24 04          	mov    %eax,0x4(%esp)
80105d7b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105d82:	e8 69 f0 ff ff       	call   80104df0 <argint>
80105d87:	85 c0                	test   %eax,%eax
80105d89:	78 1d                	js     80105da8 <sys_kthread_create+0x68>
    return -1;
  return kthread_create((void *)func, (void *)arg_ptr, (void *)tstack);
80105d8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d8e:	89 44 24 08          	mov    %eax,0x8(%esp)
80105d92:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d95:	89 44 24 04          	mov    %eax,0x4(%esp)
80105d99:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105d9c:	89 04 24             	mov    %eax,(%esp)
80105d9f:	e8 7c dc ff ff       	call   80103a20 <kthread_create>
}
80105da4:	c9                   	leave  
80105da5:	c3                   	ret    
80105da6:	66 90                	xchg   %ax,%ax
    return -1;
80105da8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105dad:	c9                   	leave  
80105dae:	c3                   	ret    
80105daf:	90                   	nop

80105db0 <sys_kthread_join>:

int sys_kthread_join(void)
{
80105db0:	55                   	push   %ebp
80105db1:	89 e5                	mov    %esp,%ebp
80105db3:	83 ec 28             	sub    $0x28,%esp
  int tid;
  if (argint(0, &tid) < 0)
80105db6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105db9:	89 44 24 04          	mov    %eax,0x4(%esp)
80105dbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105dc4:	e8 27 f0 ff ff       	call   80104df0 <argint>
80105dc9:	85 c0                	test   %eax,%eax
80105dcb:	78 13                	js     80105de0 <sys_kthread_join+0x30>
    return -1;
  return kthread_join(tid);
80105dcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105dd0:	89 04 24             	mov    %eax,(%esp)
80105dd3:	e8 38 e2 ff ff       	call   80104010 <kthread_join>
}
80105dd8:	c9                   	leave  
80105dd9:	c3                   	ret    
80105dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105de0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105de5:	c9                   	leave  
80105de6:	c3                   	ret    
80105de7:	89 f6                	mov    %esi,%esi
80105de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105df0 <sys_kthread_exit>:

int sys_kthread_exit(void)
{
80105df0:	55                   	push   %ebp
80105df1:	89 e5                	mov    %esp,%ebp
80105df3:	83 ec 28             	sub    $0x28,%esp
  int exitValue;
  if (argint(0, &exitValue) < 0)
80105df6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105df9:	89 44 24 04          	mov    %eax,0x4(%esp)
80105dfd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105e04:	e8 e7 ef ff ff       	call   80104df0 <argint>
80105e09:	85 c0                	test   %eax,%eax
80105e0b:	78 13                	js     80105e20 <sys_kthread_exit+0x30>
    return -1;
  kthread_exit(exitValue);
80105e0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e10:	89 04 24             	mov    %eax,(%esp)
80105e13:	e8 b8 df ff ff       	call   80103dd0 <kthread_exit>
  return 0;
80105e18:	31 c0                	xor    %eax,%eax
}
80105e1a:	c9                   	leave  
80105e1b:	c3                   	ret    
80105e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105e20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105e25:	c9                   	leave  
80105e26:	c3                   	ret    
80105e27:	89 f6                	mov    %esi,%esi
80105e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e30 <sys_kthread_self>:

#endif // KTHREADS

#ifdef BENNY_MOOTEX
int sys_kthread_self(void)
{
80105e30:	55                   	push   %ebp
80105e31:	89 e5                	mov    %esp,%ebp
80105e33:	83 ec 08             	sub    $0x8,%esp
  struct proc *p = myproc();
80105e36:	e8 f5 d8 ff ff       	call   80103730 <myproc>
 

  if( p->is_thread == TRUE){
    return p->tid;
  }else{
    return 0;
80105e3b:	31 d2                	xor    %edx,%edx
  if( p->is_thread == TRUE){
80105e3d:	66 83 b8 a4 00 00 00 	cmpw   $0x1,0xa4(%eax)
80105e44:	01 
80105e45:	75 07                	jne    80105e4e <sys_kthread_self+0x1e>
    return p->tid;
80105e47:	0f b7 90 a8 00 00 00 	movzwl 0xa8(%eax),%edx
  }
}
80105e4e:	89 d0                	mov    %edx,%eax
80105e50:	c9                   	leave  
80105e51:	c3                   	ret    
80105e52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e60 <sys_kthread_yield>:


int sys_kthread_yield(void){
80105e60:	55                   	push   %ebp
80105e61:	89 e5                	mov    %esp,%ebp
80105e63:	83 ec 08             	sub    $0x8,%esp
  yield();
80105e66:	e8 65 e1 ff ff       	call   80103fd0 <yield>
  return 0;
}
80105e6b:	31 c0                	xor    %eax,%eax
80105e6d:	c9                   	leave  
80105e6e:	c3                   	ret    
80105e6f:	90                   	nop

80105e70 <sys_kthread_cpu_count>:
int sys_kthread_cpu_count(void){
80105e70:	55                   	push   %ebp
  return ncpu;
}
80105e71:	a1 20 3d 11 80       	mov    0x80113d20,%eax
int sys_kthread_cpu_count(void){
80105e76:	89 e5                	mov    %esp,%ebp
}
80105e78:	5d                   	pop    %ebp
80105e79:	c3                   	ret    
80105e7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105e80 <sys_kthread_thread_count>:
int sys_kthread_thread_count(void){
80105e80:	55                   	push   %ebp
80105e81:	89 e5                	mov    %esp,%ebp
80105e83:	83 ec 08             	sub    $0x8,%esp
  struct proc *t = myproc();
80105e86:	e8 a5 d8 ff ff       	call   80103730 <myproc>
  #ifdef OLD
    if(t->is_thread == TRUE){
80105e8b:	66 83 b8 a4 00 00 00 	cmpw   $0x1,0xa4(%eax)
80105e92:	01 
80105e93:	75 03                	jne    80105e98 <sys_kthread_thread_count+0x18>
      t = t->parent;
80105e95:	8b 40 14             	mov    0x14(%eax),%eax
    }
    return t->thread_count;
80105e98:	0f b7 80 b0 00 00 00 	movzwl 0xb0(%eax),%eax
  #endif // OLD
    return t->is_thread == TRUE ? t->parent->thread_count : t->thread_count;
}
80105e9f:	c9                   	leave  
80105ea0:	c3                   	ret    

80105ea1 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105ea1:	1e                   	push   %ds
  pushl %es
80105ea2:	06                   	push   %es
  pushl %fs
80105ea3:	0f a0                	push   %fs
  pushl %gs
80105ea5:	0f a8                	push   %gs
  pushal
80105ea7:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105ea8:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105eac:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105eae:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105eb0:	54                   	push   %esp
  call trap
80105eb1:	e8 ea 00 00 00       	call   80105fa0 <trap>
  addl $4, %esp
80105eb6:	83 c4 04             	add    $0x4,%esp

80105eb9 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105eb9:	61                   	popa   
  popl %gs
80105eba:	0f a9                	pop    %gs
  popl %fs
80105ebc:	0f a1                	pop    %fs
  popl %es
80105ebe:	07                   	pop    %es
  popl %ds
80105ebf:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105ec0:	83 c4 08             	add    $0x8,%esp
  iret
80105ec3:	cf                   	iret   
80105ec4:	66 90                	xchg   %ax,%ax
80105ec6:	66 90                	xchg   %ax,%ax
80105ec8:	66 90                	xchg   %ax,%ax
80105eca:	66 90                	xchg   %ax,%ax
80105ecc:	66 90                	xchg   %ax,%ax
80105ece:	66 90                	xchg   %ax,%ax

80105ed0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105ed0:	31 c0                	xor    %eax,%eax
80105ed2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105ed8:	8b 14 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%edx
80105edf:	b9 08 00 00 00       	mov    $0x8,%ecx
80105ee4:	66 89 0c c5 c2 6a 11 	mov    %cx,-0x7fee953e(,%eax,8)
80105eeb:	80 
80105eec:	c6 04 c5 c4 6a 11 80 	movb   $0x0,-0x7fee953c(,%eax,8)
80105ef3:	00 
80105ef4:	c6 04 c5 c5 6a 11 80 	movb   $0x8e,-0x7fee953b(,%eax,8)
80105efb:	8e 
80105efc:	66 89 14 c5 c0 6a 11 	mov    %dx,-0x7fee9540(,%eax,8)
80105f03:	80 
80105f04:	c1 ea 10             	shr    $0x10,%edx
80105f07:	66 89 14 c5 c6 6a 11 	mov    %dx,-0x7fee953a(,%eax,8)
80105f0e:	80 
  for(i = 0; i < 256; i++)
80105f0f:	83 c0 01             	add    $0x1,%eax
80105f12:	3d 00 01 00 00       	cmp    $0x100,%eax
80105f17:	75 bf                	jne    80105ed8 <tvinit+0x8>
{
80105f19:	55                   	push   %ebp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105f1a:	ba 08 00 00 00       	mov    $0x8,%edx
{
80105f1f:	89 e5                	mov    %esp,%ebp
80105f21:	83 ec 18             	sub    $0x18,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105f24:	a1 08 b1 10 80       	mov    0x8010b108,%eax

  initlock(&tickslock, "time");
80105f29:	c7 44 24 04 53 81 10 	movl   $0x80108153,0x4(%esp)
80105f30:	80 
80105f31:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105f38:	66 89 15 c2 6c 11 80 	mov    %dx,0x80116cc2
80105f3f:	66 a3 c0 6c 11 80    	mov    %ax,0x80116cc0
80105f45:	c1 e8 10             	shr    $0x10,%eax
80105f48:	c6 05 c4 6c 11 80 00 	movb   $0x0,0x80116cc4
80105f4f:	c6 05 c5 6c 11 80 ef 	movb   $0xef,0x80116cc5
80105f56:	66 a3 c6 6c 11 80    	mov    %ax,0x80116cc6
  initlock(&tickslock, "time");
80105f5c:	e8 4f e9 ff ff       	call   801048b0 <initlock>
}
80105f61:	c9                   	leave  
80105f62:	c3                   	ret    
80105f63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105f70 <idtinit>:

void
idtinit(void)
{
80105f70:	55                   	push   %ebp
  pd[0] = size-1;
80105f71:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105f76:	89 e5                	mov    %esp,%ebp
80105f78:	83 ec 10             	sub    $0x10,%esp
80105f7b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105f7f:	b8 c0 6a 11 80       	mov    $0x80116ac0,%eax
80105f84:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105f88:	c1 e8 10             	shr    $0x10,%eax
80105f8b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105f8f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105f92:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105f95:	c9                   	leave  
80105f96:	c3                   	ret    
80105f97:	89 f6                	mov    %esi,%esi
80105f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105fa0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105fa0:	55                   	push   %ebp
80105fa1:	89 e5                	mov    %esp,%ebp
80105fa3:	57                   	push   %edi
80105fa4:	56                   	push   %esi
80105fa5:	53                   	push   %ebx
80105fa6:	83 ec 3c             	sub    $0x3c,%esp
80105fa9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105fac:	8b 43 30             	mov    0x30(%ebx),%eax
80105faf:	83 f8 40             	cmp    $0x40,%eax
80105fb2:	0f 84 a0 01 00 00    	je     80106158 <trap+0x1b8>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105fb8:	83 e8 20             	sub    $0x20,%eax
80105fbb:	83 f8 1f             	cmp    $0x1f,%eax
80105fbe:	77 08                	ja     80105fc8 <trap+0x28>
80105fc0:	ff 24 85 00 82 10 80 	jmp    *-0x7fef7e00(,%eax,4)
80105fc7:	90                   	nop

  //PAGEBREAK: 13
  default:
      // this means there is no process running on the current cpu - RJC
      //   or ...
    if(myproc() == 0 || (tf->cs&3) == 0){
80105fc8:	e8 63 d7 ff ff       	call   80103730 <myproc>
80105fcd:	85 c0                	test   %eax,%eax
80105fcf:	90                   	nop
80105fd0:	0f 84 fa 01 00 00    	je     801061d0 <trap+0x230>
80105fd6:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105fda:	0f 84 f0 01 00 00    	je     801061d0 <trap+0x230>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105fe0:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("kernel trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105fe3:	8b 53 38             	mov    0x38(%ebx),%edx
80105fe6:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105fe9:	89 55 dc             	mov    %edx,-0x24(%ebp)
80105fec:	e8 1f d7 ff ff       	call   80103710 <cpuid>
80105ff1:	8b 73 30             	mov    0x30(%ebx),%esi
80105ff4:	89 c7                	mov    %eax,%edi
80105ff6:	8b 43 34             	mov    0x34(%ebx),%eax
80105ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105ffc:	e8 2f d7 ff ff       	call   80103730 <myproc>
80106001:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106004:	e8 27 d7 ff ff       	call   80103730 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80106009:	8b 55 dc             	mov    -0x24(%ebp),%edx
8010600c:	89 74 24 0c          	mov    %esi,0xc(%esp)
            myproc()->pid, myproc()->name, tf->trapno,
80106010:	8b 75 e0             	mov    -0x20(%ebp),%esi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80106013:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80106016:	89 7c 24 14          	mov    %edi,0x14(%esp)
8010601a:	89 54 24 18          	mov    %edx,0x18(%esp)
8010601e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
            myproc()->pid, myproc()->name, tf->trapno,
80106021:	83 c6 6c             	add    $0x6c,%esi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80106024:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
            myproc()->pid, myproc()->name, tf->trapno,
80106028:	89 74 24 08          	mov    %esi,0x8(%esp)
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010602c:	89 54 24 10          	mov    %edx,0x10(%esp)
80106030:	8b 40 10             	mov    0x10(%eax),%eax
80106033:	c7 04 24 bc 81 10 80 	movl   $0x801081bc,(%esp)
8010603a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010603e:	e8 0d a6 ff ff       	call   80100650 <cprintf>
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80106043:	e8 e8 d6 ff ff       	call   80103730 <myproc>
80106048:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010604f:	90                   	nop
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80106050:	e8 db d6 ff ff       	call   80103730 <myproc>
80106055:	85 c0                	test   %eax,%eax
80106057:	74 0c                	je     80106065 <trap+0xc5>
80106059:	e8 d2 d6 ff ff       	call   80103730 <myproc>
8010605e:	8b 50 24             	mov    0x24(%eax),%edx
80106061:	85 d2                	test   %edx,%edx
80106063:	75 4b                	jne    801060b0 <trap+0x110>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80106065:	e8 c6 d6 ff ff       	call   80103730 <myproc>
8010606a:	85 c0                	test   %eax,%eax
8010606c:	74 0d                	je     8010607b <trap+0xdb>
8010606e:	66 90                	xchg   %ax,%ax
80106070:	e8 bb d6 ff ff       	call   80103730 <myproc>
80106075:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80106079:	74 4d                	je     801060c8 <trap+0x128>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
8010607b:	e8 b0 d6 ff ff       	call   80103730 <myproc>
80106080:	85 c0                	test   %eax,%eax
80106082:	74 1d                	je     801060a1 <trap+0x101>
80106084:	e8 a7 d6 ff ff       	call   80103730 <myproc>
80106089:	8b 40 24             	mov    0x24(%eax),%eax
8010608c:	85 c0                	test   %eax,%eax
8010608e:	74 11                	je     801060a1 <trap+0x101>
80106090:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80106094:	83 e0 03             	and    $0x3,%eax
80106097:	66 83 f8 03          	cmp    $0x3,%ax
8010609b:	0f 84 e8 00 00 00    	je     80106189 <trap+0x1e9>
    exit();
}
801060a1:	83 c4 3c             	add    $0x3c,%esp
801060a4:	5b                   	pop    %ebx
801060a5:	5e                   	pop    %esi
801060a6:	5f                   	pop    %edi
801060a7:	5d                   	pop    %ebp
801060a8:	c3                   	ret    
801060a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801060b0:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
801060b4:	83 e0 03             	and    $0x3,%eax
801060b7:	66 83 f8 03          	cmp    $0x3,%ax
801060bb:	75 a8                	jne    80106065 <trap+0xc5>
    exit();
801060bd:	e8 ae dd ff ff       	call   80103e70 <exit>
801060c2:	eb a1                	jmp    80106065 <trap+0xc5>
801060c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->state == RUNNING &&
801060c8:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
801060cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801060d0:	75 a9                	jne    8010607b <trap+0xdb>
    yield();
801060d2:	e8 f9 de ff ff       	call   80103fd0 <yield>
801060d7:	eb a2                	jmp    8010607b <trap+0xdb>
801060d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(cpuid() == 0){
801060e0:	e8 2b d6 ff ff       	call   80103710 <cpuid>
801060e5:	85 c0                	test   %eax,%eax
801060e7:	0f 84 b3 00 00 00    	je     801061a0 <trap+0x200>
801060ed:	8d 76 00             	lea    0x0(%esi),%esi
    lapiceoi();
801060f0:	e8 ab c6 ff ff       	call   801027a0 <lapiceoi>
    break;
801060f5:	e9 56 ff ff ff       	jmp    80106050 <trap+0xb0>
801060fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    kbdintr();
80106100:	e8 eb c4 ff ff       	call   801025f0 <kbdintr>
    lapiceoi();
80106105:	e8 96 c6 ff ff       	call   801027a0 <lapiceoi>
    break;
8010610a:	e9 41 ff ff ff       	jmp    80106050 <trap+0xb0>
8010610f:	90                   	nop
    uartintr();
80106110:	e8 1b 02 00 00       	call   80106330 <uartintr>
    lapiceoi();
80106115:	e8 86 c6 ff ff       	call   801027a0 <lapiceoi>
    break;
8010611a:	e9 31 ff ff ff       	jmp    80106050 <trap+0xb0>
8010611f:	90                   	nop
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80106120:	8b 7b 38             	mov    0x38(%ebx),%edi
80106123:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80106127:	e8 e4 d5 ff ff       	call   80103710 <cpuid>
8010612c:	c7 04 24 64 81 10 80 	movl   $0x80108164,(%esp)
80106133:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80106137:	89 74 24 08          	mov    %esi,0x8(%esp)
8010613b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010613f:	e8 0c a5 ff ff       	call   80100650 <cprintf>
    lapiceoi();
80106144:	e8 57 c6 ff ff       	call   801027a0 <lapiceoi>
    break;
80106149:	e9 02 ff ff ff       	jmp    80106050 <trap+0xb0>
8010614e:	66 90                	xchg   %ax,%ax
    ideintr();
80106150:	e8 5b bf ff ff       	call   801020b0 <ideintr>
80106155:	eb 96                	jmp    801060ed <trap+0x14d>
80106157:	90                   	nop
80106158:	90                   	nop
80106159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed)
80106160:	e8 cb d5 ff ff       	call   80103730 <myproc>
80106165:	8b 70 24             	mov    0x24(%eax),%esi
80106168:	85 f6                	test   %esi,%esi
8010616a:	75 2c                	jne    80106198 <trap+0x1f8>
    myproc()->tf = tf;
8010616c:	e8 bf d5 ff ff       	call   80103730 <myproc>
80106171:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80106174:	e8 47 ed ff ff       	call   80104ec0 <syscall>
    if(myproc()->killed)
80106179:	e8 b2 d5 ff ff       	call   80103730 <myproc>
8010617e:	8b 48 24             	mov    0x24(%eax),%ecx
80106181:	85 c9                	test   %ecx,%ecx
80106183:	0f 84 18 ff ff ff    	je     801060a1 <trap+0x101>
}
80106189:	83 c4 3c             	add    $0x3c,%esp
8010618c:	5b                   	pop    %ebx
8010618d:	5e                   	pop    %esi
8010618e:	5f                   	pop    %edi
8010618f:	5d                   	pop    %ebp
      exit();
80106190:	e9 db dc ff ff       	jmp    80103e70 <exit>
80106195:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
80106198:	e8 d3 dc ff ff       	call   80103e70 <exit>
8010619d:	eb cd                	jmp    8010616c <trap+0x1cc>
8010619f:	90                   	nop
      acquire(&tickslock);
801061a0:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
801061a7:	e8 74 e8 ff ff       	call   80104a20 <acquire>
      wakeup(&ticks);
801061ac:	c7 04 24 c0 72 11 80 	movl   $0x801172c0,(%esp)
      ticks++;
801061b3:	83 05 c0 72 11 80 01 	addl   $0x1,0x801172c0
      wakeup(&ticks);
801061ba:	e8 51 e1 ff ff       	call   80104310 <wakeup>
      release(&tickslock);
801061bf:	c7 04 24 80 6a 11 80 	movl   $0x80116a80,(%esp)
801061c6:	e8 d5 e8 ff ff       	call   80104aa0 <release>
801061cb:	e9 1d ff ff ff       	jmp    801060ed <trap+0x14d>
801061d0:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
801061d3:	8b 73 38             	mov    0x38(%ebx),%esi
801061d6:	e8 35 d5 ff ff       	call   80103710 <cpuid>
801061db:	89 7c 24 10          	mov    %edi,0x10(%esp)
801061df:	89 74 24 0c          	mov    %esi,0xc(%esp)
801061e3:	89 44 24 08          	mov    %eax,0x8(%esp)
801061e7:	8b 43 30             	mov    0x30(%ebx),%eax
801061ea:	c7 04 24 88 81 10 80 	movl   $0x80108188,(%esp)
801061f1:	89 44 24 04          	mov    %eax,0x4(%esp)
801061f5:	e8 56 a4 ff ff       	call   80100650 <cprintf>
      panic("kernel trap");
801061fa:	c7 04 24 58 81 10 80 	movl   $0x80108158,(%esp)
80106201:	e8 5a a1 ff ff       	call   80100360 <panic>
80106206:	66 90                	xchg   %ax,%ax
80106208:	66 90                	xchg   %ax,%ax
8010620a:	66 90                	xchg   %ax,%ax
8010620c:	66 90                	xchg   %ax,%ax
8010620e:	66 90                	xchg   %ax,%ax

80106210 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80106210:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
{
80106215:	55                   	push   %ebp
80106216:	89 e5                	mov    %esp,%ebp
  if(!uart)
80106218:	85 c0                	test   %eax,%eax
8010621a:	74 14                	je     80106230 <uartgetc+0x20>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010621c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106221:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80106222:	a8 01                	test   $0x1,%al
80106224:	74 0a                	je     80106230 <uartgetc+0x20>
80106226:	b2 f8                	mov    $0xf8,%dl
80106228:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80106229:	0f b6 c0             	movzbl %al,%eax
}
8010622c:	5d                   	pop    %ebp
8010622d:	c3                   	ret    
8010622e:	66 90                	xchg   %ax,%ax
    return -1;
80106230:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106235:	5d                   	pop    %ebp
80106236:	c3                   	ret    
80106237:	89 f6                	mov    %esi,%esi
80106239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106240 <uartputc>:
  if(!uart)
80106240:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
80106245:	85 c0                	test   %eax,%eax
80106247:	74 3f                	je     80106288 <uartputc+0x48>
{
80106249:	55                   	push   %ebp
8010624a:	89 e5                	mov    %esp,%ebp
8010624c:	56                   	push   %esi
8010624d:	be fd 03 00 00       	mov    $0x3fd,%esi
80106252:	53                   	push   %ebx
  if(!uart)
80106253:	bb 80 00 00 00       	mov    $0x80,%ebx
{
80106258:	83 ec 10             	sub    $0x10,%esp
8010625b:	eb 14                	jmp    80106271 <uartputc+0x31>
8010625d:	8d 76 00             	lea    0x0(%esi),%esi
    microdelay(10);
80106260:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80106267:	e8 54 c5 ff ff       	call   801027c0 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
8010626c:	83 eb 01             	sub    $0x1,%ebx
8010626f:	74 07                	je     80106278 <uartputc+0x38>
80106271:	89 f2                	mov    %esi,%edx
80106273:	ec                   	in     (%dx),%al
80106274:	a8 20                	test   $0x20,%al
80106276:	74 e8                	je     80106260 <uartputc+0x20>
  outb(COM1+0, c);
80106278:	0f b6 45 08          	movzbl 0x8(%ebp),%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010627c:	ba f8 03 00 00       	mov    $0x3f8,%edx
80106281:	ee                   	out    %al,(%dx)
}
80106282:	83 c4 10             	add    $0x10,%esp
80106285:	5b                   	pop    %ebx
80106286:	5e                   	pop    %esi
80106287:	5d                   	pop    %ebp
80106288:	f3 c3                	repz ret 
8010628a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106290 <uartinit>:
{
80106290:	55                   	push   %ebp
80106291:	31 c9                	xor    %ecx,%ecx
80106293:	89 e5                	mov    %esp,%ebp
80106295:	89 c8                	mov    %ecx,%eax
80106297:	57                   	push   %edi
80106298:	bf fa 03 00 00       	mov    $0x3fa,%edi
8010629d:	56                   	push   %esi
8010629e:	89 fa                	mov    %edi,%edx
801062a0:	53                   	push   %ebx
801062a1:	83 ec 1c             	sub    $0x1c,%esp
801062a4:	ee                   	out    %al,(%dx)
801062a5:	be fb 03 00 00       	mov    $0x3fb,%esi
801062aa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801062af:	89 f2                	mov    %esi,%edx
801062b1:	ee                   	out    %al,(%dx)
801062b2:	b8 0c 00 00 00       	mov    $0xc,%eax
801062b7:	b2 f8                	mov    $0xf8,%dl
801062b9:	ee                   	out    %al,(%dx)
801062ba:	bb f9 03 00 00       	mov    $0x3f9,%ebx
801062bf:	89 c8                	mov    %ecx,%eax
801062c1:	89 da                	mov    %ebx,%edx
801062c3:	ee                   	out    %al,(%dx)
801062c4:	b8 03 00 00 00       	mov    $0x3,%eax
801062c9:	89 f2                	mov    %esi,%edx
801062cb:	ee                   	out    %al,(%dx)
801062cc:	b2 fc                	mov    $0xfc,%dl
801062ce:	89 c8                	mov    %ecx,%eax
801062d0:	ee                   	out    %al,(%dx)
801062d1:	b8 01 00 00 00       	mov    $0x1,%eax
801062d6:	89 da                	mov    %ebx,%edx
801062d8:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801062d9:	b2 fd                	mov    $0xfd,%dl
801062db:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
801062dc:	3c ff                	cmp    $0xff,%al
801062de:	74 42                	je     80106322 <uartinit+0x92>
  uart = 1;
801062e0:	c7 05 c0 b5 10 80 01 	movl   $0x1,0x8010b5c0
801062e7:	00 00 00 
801062ea:	89 fa                	mov    %edi,%edx
801062ec:	ec                   	in     (%dx),%al
801062ed:	b2 f8                	mov    $0xf8,%dl
801062ef:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
801062f0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801062f7:	00 
  for(p="xv6...\n"; *p; p++)
801062f8:	bb 80 82 10 80       	mov    $0x80108280,%ebx
  ioapicenable(IRQ_COM1, 0);
801062fd:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80106304:	e8 d7 bf ff ff       	call   801022e0 <ioapicenable>
  for(p="xv6...\n"; *p; p++)
80106309:	b8 78 00 00 00       	mov    $0x78,%eax
8010630e:	66 90                	xchg   %ax,%ax
    uartputc(*p);
80106310:	89 04 24             	mov    %eax,(%esp)
  for(p="xv6...\n"; *p; p++)
80106313:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
80106316:	e8 25 ff ff ff       	call   80106240 <uartputc>
  for(p="xv6...\n"; *p; p++)
8010631b:	0f be 03             	movsbl (%ebx),%eax
8010631e:	84 c0                	test   %al,%al
80106320:	75 ee                	jne    80106310 <uartinit+0x80>
}
80106322:	83 c4 1c             	add    $0x1c,%esp
80106325:	5b                   	pop    %ebx
80106326:	5e                   	pop    %esi
80106327:	5f                   	pop    %edi
80106328:	5d                   	pop    %ebp
80106329:	c3                   	ret    
8010632a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106330 <uartintr>:

void
uartintr(void)
{
80106330:	55                   	push   %ebp
80106331:	89 e5                	mov    %esp,%ebp
80106333:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80106336:	c7 04 24 10 62 10 80 	movl   $0x80106210,(%esp)
8010633d:	e8 be a4 ff ff       	call   80100800 <consoleintr>
}
80106342:	c9                   	leave  
80106343:	c3                   	ret    

80106344 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80106344:	6a 00                	push   $0x0
  pushl $0
80106346:	6a 00                	push   $0x0
  jmp alltraps
80106348:	e9 54 fb ff ff       	jmp    80105ea1 <alltraps>

8010634d <vector1>:
.globl vector1
vector1:
  pushl $0
8010634d:	6a 00                	push   $0x0
  pushl $1
8010634f:	6a 01                	push   $0x1
  jmp alltraps
80106351:	e9 4b fb ff ff       	jmp    80105ea1 <alltraps>

80106356 <vector2>:
.globl vector2
vector2:
  pushl $0
80106356:	6a 00                	push   $0x0
  pushl $2
80106358:	6a 02                	push   $0x2
  jmp alltraps
8010635a:	e9 42 fb ff ff       	jmp    80105ea1 <alltraps>

8010635f <vector3>:
.globl vector3
vector3:
  pushl $0
8010635f:	6a 00                	push   $0x0
  pushl $3
80106361:	6a 03                	push   $0x3
  jmp alltraps
80106363:	e9 39 fb ff ff       	jmp    80105ea1 <alltraps>

80106368 <vector4>:
.globl vector4
vector4:
  pushl $0
80106368:	6a 00                	push   $0x0
  pushl $4
8010636a:	6a 04                	push   $0x4
  jmp alltraps
8010636c:	e9 30 fb ff ff       	jmp    80105ea1 <alltraps>

80106371 <vector5>:
.globl vector5
vector5:
  pushl $0
80106371:	6a 00                	push   $0x0
  pushl $5
80106373:	6a 05                	push   $0x5
  jmp alltraps
80106375:	e9 27 fb ff ff       	jmp    80105ea1 <alltraps>

8010637a <vector6>:
.globl vector6
vector6:
  pushl $0
8010637a:	6a 00                	push   $0x0
  pushl $6
8010637c:	6a 06                	push   $0x6
  jmp alltraps
8010637e:	e9 1e fb ff ff       	jmp    80105ea1 <alltraps>

80106383 <vector7>:
.globl vector7
vector7:
  pushl $0
80106383:	6a 00                	push   $0x0
  pushl $7
80106385:	6a 07                	push   $0x7
  jmp alltraps
80106387:	e9 15 fb ff ff       	jmp    80105ea1 <alltraps>

8010638c <vector8>:
.globl vector8
vector8:
  pushl $8
8010638c:	6a 08                	push   $0x8
  jmp alltraps
8010638e:	e9 0e fb ff ff       	jmp    80105ea1 <alltraps>

80106393 <vector9>:
.globl vector9
vector9:
  pushl $0
80106393:	6a 00                	push   $0x0
  pushl $9
80106395:	6a 09                	push   $0x9
  jmp alltraps
80106397:	e9 05 fb ff ff       	jmp    80105ea1 <alltraps>

8010639c <vector10>:
.globl vector10
vector10:
  pushl $10
8010639c:	6a 0a                	push   $0xa
  jmp alltraps
8010639e:	e9 fe fa ff ff       	jmp    80105ea1 <alltraps>

801063a3 <vector11>:
.globl vector11
vector11:
  pushl $11
801063a3:	6a 0b                	push   $0xb
  jmp alltraps
801063a5:	e9 f7 fa ff ff       	jmp    80105ea1 <alltraps>

801063aa <vector12>:
.globl vector12
vector12:
  pushl $12
801063aa:	6a 0c                	push   $0xc
  jmp alltraps
801063ac:	e9 f0 fa ff ff       	jmp    80105ea1 <alltraps>

801063b1 <vector13>:
.globl vector13
vector13:
  pushl $13
801063b1:	6a 0d                	push   $0xd
  jmp alltraps
801063b3:	e9 e9 fa ff ff       	jmp    80105ea1 <alltraps>

801063b8 <vector14>:
.globl vector14
vector14:
  pushl $14
801063b8:	6a 0e                	push   $0xe
  jmp alltraps
801063ba:	e9 e2 fa ff ff       	jmp    80105ea1 <alltraps>

801063bf <vector15>:
.globl vector15
vector15:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $15
801063c1:	6a 0f                	push   $0xf
  jmp alltraps
801063c3:	e9 d9 fa ff ff       	jmp    80105ea1 <alltraps>

801063c8 <vector16>:
.globl vector16
vector16:
  pushl $0
801063c8:	6a 00                	push   $0x0
  pushl $16
801063ca:	6a 10                	push   $0x10
  jmp alltraps
801063cc:	e9 d0 fa ff ff       	jmp    80105ea1 <alltraps>

801063d1 <vector17>:
.globl vector17
vector17:
  pushl $17
801063d1:	6a 11                	push   $0x11
  jmp alltraps
801063d3:	e9 c9 fa ff ff       	jmp    80105ea1 <alltraps>

801063d8 <vector18>:
.globl vector18
vector18:
  pushl $0
801063d8:	6a 00                	push   $0x0
  pushl $18
801063da:	6a 12                	push   $0x12
  jmp alltraps
801063dc:	e9 c0 fa ff ff       	jmp    80105ea1 <alltraps>

801063e1 <vector19>:
.globl vector19
vector19:
  pushl $0
801063e1:	6a 00                	push   $0x0
  pushl $19
801063e3:	6a 13                	push   $0x13
  jmp alltraps
801063e5:	e9 b7 fa ff ff       	jmp    80105ea1 <alltraps>

801063ea <vector20>:
.globl vector20
vector20:
  pushl $0
801063ea:	6a 00                	push   $0x0
  pushl $20
801063ec:	6a 14                	push   $0x14
  jmp alltraps
801063ee:	e9 ae fa ff ff       	jmp    80105ea1 <alltraps>

801063f3 <vector21>:
.globl vector21
vector21:
  pushl $0
801063f3:	6a 00                	push   $0x0
  pushl $21
801063f5:	6a 15                	push   $0x15
  jmp alltraps
801063f7:	e9 a5 fa ff ff       	jmp    80105ea1 <alltraps>

801063fc <vector22>:
.globl vector22
vector22:
  pushl $0
801063fc:	6a 00                	push   $0x0
  pushl $22
801063fe:	6a 16                	push   $0x16
  jmp alltraps
80106400:	e9 9c fa ff ff       	jmp    80105ea1 <alltraps>

80106405 <vector23>:
.globl vector23
vector23:
  pushl $0
80106405:	6a 00                	push   $0x0
  pushl $23
80106407:	6a 17                	push   $0x17
  jmp alltraps
80106409:	e9 93 fa ff ff       	jmp    80105ea1 <alltraps>

8010640e <vector24>:
.globl vector24
vector24:
  pushl $0
8010640e:	6a 00                	push   $0x0
  pushl $24
80106410:	6a 18                	push   $0x18
  jmp alltraps
80106412:	e9 8a fa ff ff       	jmp    80105ea1 <alltraps>

80106417 <vector25>:
.globl vector25
vector25:
  pushl $0
80106417:	6a 00                	push   $0x0
  pushl $25
80106419:	6a 19                	push   $0x19
  jmp alltraps
8010641b:	e9 81 fa ff ff       	jmp    80105ea1 <alltraps>

80106420 <vector26>:
.globl vector26
vector26:
  pushl $0
80106420:	6a 00                	push   $0x0
  pushl $26
80106422:	6a 1a                	push   $0x1a
  jmp alltraps
80106424:	e9 78 fa ff ff       	jmp    80105ea1 <alltraps>

80106429 <vector27>:
.globl vector27
vector27:
  pushl $0
80106429:	6a 00                	push   $0x0
  pushl $27
8010642b:	6a 1b                	push   $0x1b
  jmp alltraps
8010642d:	e9 6f fa ff ff       	jmp    80105ea1 <alltraps>

80106432 <vector28>:
.globl vector28
vector28:
  pushl $0
80106432:	6a 00                	push   $0x0
  pushl $28
80106434:	6a 1c                	push   $0x1c
  jmp alltraps
80106436:	e9 66 fa ff ff       	jmp    80105ea1 <alltraps>

8010643b <vector29>:
.globl vector29
vector29:
  pushl $0
8010643b:	6a 00                	push   $0x0
  pushl $29
8010643d:	6a 1d                	push   $0x1d
  jmp alltraps
8010643f:	e9 5d fa ff ff       	jmp    80105ea1 <alltraps>

80106444 <vector30>:
.globl vector30
vector30:
  pushl $0
80106444:	6a 00                	push   $0x0
  pushl $30
80106446:	6a 1e                	push   $0x1e
  jmp alltraps
80106448:	e9 54 fa ff ff       	jmp    80105ea1 <alltraps>

8010644d <vector31>:
.globl vector31
vector31:
  pushl $0
8010644d:	6a 00                	push   $0x0
  pushl $31
8010644f:	6a 1f                	push   $0x1f
  jmp alltraps
80106451:	e9 4b fa ff ff       	jmp    80105ea1 <alltraps>

80106456 <vector32>:
.globl vector32
vector32:
  pushl $0
80106456:	6a 00                	push   $0x0
  pushl $32
80106458:	6a 20                	push   $0x20
  jmp alltraps
8010645a:	e9 42 fa ff ff       	jmp    80105ea1 <alltraps>

8010645f <vector33>:
.globl vector33
vector33:
  pushl $0
8010645f:	6a 00                	push   $0x0
  pushl $33
80106461:	6a 21                	push   $0x21
  jmp alltraps
80106463:	e9 39 fa ff ff       	jmp    80105ea1 <alltraps>

80106468 <vector34>:
.globl vector34
vector34:
  pushl $0
80106468:	6a 00                	push   $0x0
  pushl $34
8010646a:	6a 22                	push   $0x22
  jmp alltraps
8010646c:	e9 30 fa ff ff       	jmp    80105ea1 <alltraps>

80106471 <vector35>:
.globl vector35
vector35:
  pushl $0
80106471:	6a 00                	push   $0x0
  pushl $35
80106473:	6a 23                	push   $0x23
  jmp alltraps
80106475:	e9 27 fa ff ff       	jmp    80105ea1 <alltraps>

8010647a <vector36>:
.globl vector36
vector36:
  pushl $0
8010647a:	6a 00                	push   $0x0
  pushl $36
8010647c:	6a 24                	push   $0x24
  jmp alltraps
8010647e:	e9 1e fa ff ff       	jmp    80105ea1 <alltraps>

80106483 <vector37>:
.globl vector37
vector37:
  pushl $0
80106483:	6a 00                	push   $0x0
  pushl $37
80106485:	6a 25                	push   $0x25
  jmp alltraps
80106487:	e9 15 fa ff ff       	jmp    80105ea1 <alltraps>

8010648c <vector38>:
.globl vector38
vector38:
  pushl $0
8010648c:	6a 00                	push   $0x0
  pushl $38
8010648e:	6a 26                	push   $0x26
  jmp alltraps
80106490:	e9 0c fa ff ff       	jmp    80105ea1 <alltraps>

80106495 <vector39>:
.globl vector39
vector39:
  pushl $0
80106495:	6a 00                	push   $0x0
  pushl $39
80106497:	6a 27                	push   $0x27
  jmp alltraps
80106499:	e9 03 fa ff ff       	jmp    80105ea1 <alltraps>

8010649e <vector40>:
.globl vector40
vector40:
  pushl $0
8010649e:	6a 00                	push   $0x0
  pushl $40
801064a0:	6a 28                	push   $0x28
  jmp alltraps
801064a2:	e9 fa f9 ff ff       	jmp    80105ea1 <alltraps>

801064a7 <vector41>:
.globl vector41
vector41:
  pushl $0
801064a7:	6a 00                	push   $0x0
  pushl $41
801064a9:	6a 29                	push   $0x29
  jmp alltraps
801064ab:	e9 f1 f9 ff ff       	jmp    80105ea1 <alltraps>

801064b0 <vector42>:
.globl vector42
vector42:
  pushl $0
801064b0:	6a 00                	push   $0x0
  pushl $42
801064b2:	6a 2a                	push   $0x2a
  jmp alltraps
801064b4:	e9 e8 f9 ff ff       	jmp    80105ea1 <alltraps>

801064b9 <vector43>:
.globl vector43
vector43:
  pushl $0
801064b9:	6a 00                	push   $0x0
  pushl $43
801064bb:	6a 2b                	push   $0x2b
  jmp alltraps
801064bd:	e9 df f9 ff ff       	jmp    80105ea1 <alltraps>

801064c2 <vector44>:
.globl vector44
vector44:
  pushl $0
801064c2:	6a 00                	push   $0x0
  pushl $44
801064c4:	6a 2c                	push   $0x2c
  jmp alltraps
801064c6:	e9 d6 f9 ff ff       	jmp    80105ea1 <alltraps>

801064cb <vector45>:
.globl vector45
vector45:
  pushl $0
801064cb:	6a 00                	push   $0x0
  pushl $45
801064cd:	6a 2d                	push   $0x2d
  jmp alltraps
801064cf:	e9 cd f9 ff ff       	jmp    80105ea1 <alltraps>

801064d4 <vector46>:
.globl vector46
vector46:
  pushl $0
801064d4:	6a 00                	push   $0x0
  pushl $46
801064d6:	6a 2e                	push   $0x2e
  jmp alltraps
801064d8:	e9 c4 f9 ff ff       	jmp    80105ea1 <alltraps>

801064dd <vector47>:
.globl vector47
vector47:
  pushl $0
801064dd:	6a 00                	push   $0x0
  pushl $47
801064df:	6a 2f                	push   $0x2f
  jmp alltraps
801064e1:	e9 bb f9 ff ff       	jmp    80105ea1 <alltraps>

801064e6 <vector48>:
.globl vector48
vector48:
  pushl $0
801064e6:	6a 00                	push   $0x0
  pushl $48
801064e8:	6a 30                	push   $0x30
  jmp alltraps
801064ea:	e9 b2 f9 ff ff       	jmp    80105ea1 <alltraps>

801064ef <vector49>:
.globl vector49
vector49:
  pushl $0
801064ef:	6a 00                	push   $0x0
  pushl $49
801064f1:	6a 31                	push   $0x31
  jmp alltraps
801064f3:	e9 a9 f9 ff ff       	jmp    80105ea1 <alltraps>

801064f8 <vector50>:
.globl vector50
vector50:
  pushl $0
801064f8:	6a 00                	push   $0x0
  pushl $50
801064fa:	6a 32                	push   $0x32
  jmp alltraps
801064fc:	e9 a0 f9 ff ff       	jmp    80105ea1 <alltraps>

80106501 <vector51>:
.globl vector51
vector51:
  pushl $0
80106501:	6a 00                	push   $0x0
  pushl $51
80106503:	6a 33                	push   $0x33
  jmp alltraps
80106505:	e9 97 f9 ff ff       	jmp    80105ea1 <alltraps>

8010650a <vector52>:
.globl vector52
vector52:
  pushl $0
8010650a:	6a 00                	push   $0x0
  pushl $52
8010650c:	6a 34                	push   $0x34
  jmp alltraps
8010650e:	e9 8e f9 ff ff       	jmp    80105ea1 <alltraps>

80106513 <vector53>:
.globl vector53
vector53:
  pushl $0
80106513:	6a 00                	push   $0x0
  pushl $53
80106515:	6a 35                	push   $0x35
  jmp alltraps
80106517:	e9 85 f9 ff ff       	jmp    80105ea1 <alltraps>

8010651c <vector54>:
.globl vector54
vector54:
  pushl $0
8010651c:	6a 00                	push   $0x0
  pushl $54
8010651e:	6a 36                	push   $0x36
  jmp alltraps
80106520:	e9 7c f9 ff ff       	jmp    80105ea1 <alltraps>

80106525 <vector55>:
.globl vector55
vector55:
  pushl $0
80106525:	6a 00                	push   $0x0
  pushl $55
80106527:	6a 37                	push   $0x37
  jmp alltraps
80106529:	e9 73 f9 ff ff       	jmp    80105ea1 <alltraps>

8010652e <vector56>:
.globl vector56
vector56:
  pushl $0
8010652e:	6a 00                	push   $0x0
  pushl $56
80106530:	6a 38                	push   $0x38
  jmp alltraps
80106532:	e9 6a f9 ff ff       	jmp    80105ea1 <alltraps>

80106537 <vector57>:
.globl vector57
vector57:
  pushl $0
80106537:	6a 00                	push   $0x0
  pushl $57
80106539:	6a 39                	push   $0x39
  jmp alltraps
8010653b:	e9 61 f9 ff ff       	jmp    80105ea1 <alltraps>

80106540 <vector58>:
.globl vector58
vector58:
  pushl $0
80106540:	6a 00                	push   $0x0
  pushl $58
80106542:	6a 3a                	push   $0x3a
  jmp alltraps
80106544:	e9 58 f9 ff ff       	jmp    80105ea1 <alltraps>

80106549 <vector59>:
.globl vector59
vector59:
  pushl $0
80106549:	6a 00                	push   $0x0
  pushl $59
8010654b:	6a 3b                	push   $0x3b
  jmp alltraps
8010654d:	e9 4f f9 ff ff       	jmp    80105ea1 <alltraps>

80106552 <vector60>:
.globl vector60
vector60:
  pushl $0
80106552:	6a 00                	push   $0x0
  pushl $60
80106554:	6a 3c                	push   $0x3c
  jmp alltraps
80106556:	e9 46 f9 ff ff       	jmp    80105ea1 <alltraps>

8010655b <vector61>:
.globl vector61
vector61:
  pushl $0
8010655b:	6a 00                	push   $0x0
  pushl $61
8010655d:	6a 3d                	push   $0x3d
  jmp alltraps
8010655f:	e9 3d f9 ff ff       	jmp    80105ea1 <alltraps>

80106564 <vector62>:
.globl vector62
vector62:
  pushl $0
80106564:	6a 00                	push   $0x0
  pushl $62
80106566:	6a 3e                	push   $0x3e
  jmp alltraps
80106568:	e9 34 f9 ff ff       	jmp    80105ea1 <alltraps>

8010656d <vector63>:
.globl vector63
vector63:
  pushl $0
8010656d:	6a 00                	push   $0x0
  pushl $63
8010656f:	6a 3f                	push   $0x3f
  jmp alltraps
80106571:	e9 2b f9 ff ff       	jmp    80105ea1 <alltraps>

80106576 <vector64>:
.globl vector64
vector64:
  pushl $0
80106576:	6a 00                	push   $0x0
  pushl $64
80106578:	6a 40                	push   $0x40
  jmp alltraps
8010657a:	e9 22 f9 ff ff       	jmp    80105ea1 <alltraps>

8010657f <vector65>:
.globl vector65
vector65:
  pushl $0
8010657f:	6a 00                	push   $0x0
  pushl $65
80106581:	6a 41                	push   $0x41
  jmp alltraps
80106583:	e9 19 f9 ff ff       	jmp    80105ea1 <alltraps>

80106588 <vector66>:
.globl vector66
vector66:
  pushl $0
80106588:	6a 00                	push   $0x0
  pushl $66
8010658a:	6a 42                	push   $0x42
  jmp alltraps
8010658c:	e9 10 f9 ff ff       	jmp    80105ea1 <alltraps>

80106591 <vector67>:
.globl vector67
vector67:
  pushl $0
80106591:	6a 00                	push   $0x0
  pushl $67
80106593:	6a 43                	push   $0x43
  jmp alltraps
80106595:	e9 07 f9 ff ff       	jmp    80105ea1 <alltraps>

8010659a <vector68>:
.globl vector68
vector68:
  pushl $0
8010659a:	6a 00                	push   $0x0
  pushl $68
8010659c:	6a 44                	push   $0x44
  jmp alltraps
8010659e:	e9 fe f8 ff ff       	jmp    80105ea1 <alltraps>

801065a3 <vector69>:
.globl vector69
vector69:
  pushl $0
801065a3:	6a 00                	push   $0x0
  pushl $69
801065a5:	6a 45                	push   $0x45
  jmp alltraps
801065a7:	e9 f5 f8 ff ff       	jmp    80105ea1 <alltraps>

801065ac <vector70>:
.globl vector70
vector70:
  pushl $0
801065ac:	6a 00                	push   $0x0
  pushl $70
801065ae:	6a 46                	push   $0x46
  jmp alltraps
801065b0:	e9 ec f8 ff ff       	jmp    80105ea1 <alltraps>

801065b5 <vector71>:
.globl vector71
vector71:
  pushl $0
801065b5:	6a 00                	push   $0x0
  pushl $71
801065b7:	6a 47                	push   $0x47
  jmp alltraps
801065b9:	e9 e3 f8 ff ff       	jmp    80105ea1 <alltraps>

801065be <vector72>:
.globl vector72
vector72:
  pushl $0
801065be:	6a 00                	push   $0x0
  pushl $72
801065c0:	6a 48                	push   $0x48
  jmp alltraps
801065c2:	e9 da f8 ff ff       	jmp    80105ea1 <alltraps>

801065c7 <vector73>:
.globl vector73
vector73:
  pushl $0
801065c7:	6a 00                	push   $0x0
  pushl $73
801065c9:	6a 49                	push   $0x49
  jmp alltraps
801065cb:	e9 d1 f8 ff ff       	jmp    80105ea1 <alltraps>

801065d0 <vector74>:
.globl vector74
vector74:
  pushl $0
801065d0:	6a 00                	push   $0x0
  pushl $74
801065d2:	6a 4a                	push   $0x4a
  jmp alltraps
801065d4:	e9 c8 f8 ff ff       	jmp    80105ea1 <alltraps>

801065d9 <vector75>:
.globl vector75
vector75:
  pushl $0
801065d9:	6a 00                	push   $0x0
  pushl $75
801065db:	6a 4b                	push   $0x4b
  jmp alltraps
801065dd:	e9 bf f8 ff ff       	jmp    80105ea1 <alltraps>

801065e2 <vector76>:
.globl vector76
vector76:
  pushl $0
801065e2:	6a 00                	push   $0x0
  pushl $76
801065e4:	6a 4c                	push   $0x4c
  jmp alltraps
801065e6:	e9 b6 f8 ff ff       	jmp    80105ea1 <alltraps>

801065eb <vector77>:
.globl vector77
vector77:
  pushl $0
801065eb:	6a 00                	push   $0x0
  pushl $77
801065ed:	6a 4d                	push   $0x4d
  jmp alltraps
801065ef:	e9 ad f8 ff ff       	jmp    80105ea1 <alltraps>

801065f4 <vector78>:
.globl vector78
vector78:
  pushl $0
801065f4:	6a 00                	push   $0x0
  pushl $78
801065f6:	6a 4e                	push   $0x4e
  jmp alltraps
801065f8:	e9 a4 f8 ff ff       	jmp    80105ea1 <alltraps>

801065fd <vector79>:
.globl vector79
vector79:
  pushl $0
801065fd:	6a 00                	push   $0x0
  pushl $79
801065ff:	6a 4f                	push   $0x4f
  jmp alltraps
80106601:	e9 9b f8 ff ff       	jmp    80105ea1 <alltraps>

80106606 <vector80>:
.globl vector80
vector80:
  pushl $0
80106606:	6a 00                	push   $0x0
  pushl $80
80106608:	6a 50                	push   $0x50
  jmp alltraps
8010660a:	e9 92 f8 ff ff       	jmp    80105ea1 <alltraps>

8010660f <vector81>:
.globl vector81
vector81:
  pushl $0
8010660f:	6a 00                	push   $0x0
  pushl $81
80106611:	6a 51                	push   $0x51
  jmp alltraps
80106613:	e9 89 f8 ff ff       	jmp    80105ea1 <alltraps>

80106618 <vector82>:
.globl vector82
vector82:
  pushl $0
80106618:	6a 00                	push   $0x0
  pushl $82
8010661a:	6a 52                	push   $0x52
  jmp alltraps
8010661c:	e9 80 f8 ff ff       	jmp    80105ea1 <alltraps>

80106621 <vector83>:
.globl vector83
vector83:
  pushl $0
80106621:	6a 00                	push   $0x0
  pushl $83
80106623:	6a 53                	push   $0x53
  jmp alltraps
80106625:	e9 77 f8 ff ff       	jmp    80105ea1 <alltraps>

8010662a <vector84>:
.globl vector84
vector84:
  pushl $0
8010662a:	6a 00                	push   $0x0
  pushl $84
8010662c:	6a 54                	push   $0x54
  jmp alltraps
8010662e:	e9 6e f8 ff ff       	jmp    80105ea1 <alltraps>

80106633 <vector85>:
.globl vector85
vector85:
  pushl $0
80106633:	6a 00                	push   $0x0
  pushl $85
80106635:	6a 55                	push   $0x55
  jmp alltraps
80106637:	e9 65 f8 ff ff       	jmp    80105ea1 <alltraps>

8010663c <vector86>:
.globl vector86
vector86:
  pushl $0
8010663c:	6a 00                	push   $0x0
  pushl $86
8010663e:	6a 56                	push   $0x56
  jmp alltraps
80106640:	e9 5c f8 ff ff       	jmp    80105ea1 <alltraps>

80106645 <vector87>:
.globl vector87
vector87:
  pushl $0
80106645:	6a 00                	push   $0x0
  pushl $87
80106647:	6a 57                	push   $0x57
  jmp alltraps
80106649:	e9 53 f8 ff ff       	jmp    80105ea1 <alltraps>

8010664e <vector88>:
.globl vector88
vector88:
  pushl $0
8010664e:	6a 00                	push   $0x0
  pushl $88
80106650:	6a 58                	push   $0x58
  jmp alltraps
80106652:	e9 4a f8 ff ff       	jmp    80105ea1 <alltraps>

80106657 <vector89>:
.globl vector89
vector89:
  pushl $0
80106657:	6a 00                	push   $0x0
  pushl $89
80106659:	6a 59                	push   $0x59
  jmp alltraps
8010665b:	e9 41 f8 ff ff       	jmp    80105ea1 <alltraps>

80106660 <vector90>:
.globl vector90
vector90:
  pushl $0
80106660:	6a 00                	push   $0x0
  pushl $90
80106662:	6a 5a                	push   $0x5a
  jmp alltraps
80106664:	e9 38 f8 ff ff       	jmp    80105ea1 <alltraps>

80106669 <vector91>:
.globl vector91
vector91:
  pushl $0
80106669:	6a 00                	push   $0x0
  pushl $91
8010666b:	6a 5b                	push   $0x5b
  jmp alltraps
8010666d:	e9 2f f8 ff ff       	jmp    80105ea1 <alltraps>

80106672 <vector92>:
.globl vector92
vector92:
  pushl $0
80106672:	6a 00                	push   $0x0
  pushl $92
80106674:	6a 5c                	push   $0x5c
  jmp alltraps
80106676:	e9 26 f8 ff ff       	jmp    80105ea1 <alltraps>

8010667b <vector93>:
.globl vector93
vector93:
  pushl $0
8010667b:	6a 00                	push   $0x0
  pushl $93
8010667d:	6a 5d                	push   $0x5d
  jmp alltraps
8010667f:	e9 1d f8 ff ff       	jmp    80105ea1 <alltraps>

80106684 <vector94>:
.globl vector94
vector94:
  pushl $0
80106684:	6a 00                	push   $0x0
  pushl $94
80106686:	6a 5e                	push   $0x5e
  jmp alltraps
80106688:	e9 14 f8 ff ff       	jmp    80105ea1 <alltraps>

8010668d <vector95>:
.globl vector95
vector95:
  pushl $0
8010668d:	6a 00                	push   $0x0
  pushl $95
8010668f:	6a 5f                	push   $0x5f
  jmp alltraps
80106691:	e9 0b f8 ff ff       	jmp    80105ea1 <alltraps>

80106696 <vector96>:
.globl vector96
vector96:
  pushl $0
80106696:	6a 00                	push   $0x0
  pushl $96
80106698:	6a 60                	push   $0x60
  jmp alltraps
8010669a:	e9 02 f8 ff ff       	jmp    80105ea1 <alltraps>

8010669f <vector97>:
.globl vector97
vector97:
  pushl $0
8010669f:	6a 00                	push   $0x0
  pushl $97
801066a1:	6a 61                	push   $0x61
  jmp alltraps
801066a3:	e9 f9 f7 ff ff       	jmp    80105ea1 <alltraps>

801066a8 <vector98>:
.globl vector98
vector98:
  pushl $0
801066a8:	6a 00                	push   $0x0
  pushl $98
801066aa:	6a 62                	push   $0x62
  jmp alltraps
801066ac:	e9 f0 f7 ff ff       	jmp    80105ea1 <alltraps>

801066b1 <vector99>:
.globl vector99
vector99:
  pushl $0
801066b1:	6a 00                	push   $0x0
  pushl $99
801066b3:	6a 63                	push   $0x63
  jmp alltraps
801066b5:	e9 e7 f7 ff ff       	jmp    80105ea1 <alltraps>

801066ba <vector100>:
.globl vector100
vector100:
  pushl $0
801066ba:	6a 00                	push   $0x0
  pushl $100
801066bc:	6a 64                	push   $0x64
  jmp alltraps
801066be:	e9 de f7 ff ff       	jmp    80105ea1 <alltraps>

801066c3 <vector101>:
.globl vector101
vector101:
  pushl $0
801066c3:	6a 00                	push   $0x0
  pushl $101
801066c5:	6a 65                	push   $0x65
  jmp alltraps
801066c7:	e9 d5 f7 ff ff       	jmp    80105ea1 <alltraps>

801066cc <vector102>:
.globl vector102
vector102:
  pushl $0
801066cc:	6a 00                	push   $0x0
  pushl $102
801066ce:	6a 66                	push   $0x66
  jmp alltraps
801066d0:	e9 cc f7 ff ff       	jmp    80105ea1 <alltraps>

801066d5 <vector103>:
.globl vector103
vector103:
  pushl $0
801066d5:	6a 00                	push   $0x0
  pushl $103
801066d7:	6a 67                	push   $0x67
  jmp alltraps
801066d9:	e9 c3 f7 ff ff       	jmp    80105ea1 <alltraps>

801066de <vector104>:
.globl vector104
vector104:
  pushl $0
801066de:	6a 00                	push   $0x0
  pushl $104
801066e0:	6a 68                	push   $0x68
  jmp alltraps
801066e2:	e9 ba f7 ff ff       	jmp    80105ea1 <alltraps>

801066e7 <vector105>:
.globl vector105
vector105:
  pushl $0
801066e7:	6a 00                	push   $0x0
  pushl $105
801066e9:	6a 69                	push   $0x69
  jmp alltraps
801066eb:	e9 b1 f7 ff ff       	jmp    80105ea1 <alltraps>

801066f0 <vector106>:
.globl vector106
vector106:
  pushl $0
801066f0:	6a 00                	push   $0x0
  pushl $106
801066f2:	6a 6a                	push   $0x6a
  jmp alltraps
801066f4:	e9 a8 f7 ff ff       	jmp    80105ea1 <alltraps>

801066f9 <vector107>:
.globl vector107
vector107:
  pushl $0
801066f9:	6a 00                	push   $0x0
  pushl $107
801066fb:	6a 6b                	push   $0x6b
  jmp alltraps
801066fd:	e9 9f f7 ff ff       	jmp    80105ea1 <alltraps>

80106702 <vector108>:
.globl vector108
vector108:
  pushl $0
80106702:	6a 00                	push   $0x0
  pushl $108
80106704:	6a 6c                	push   $0x6c
  jmp alltraps
80106706:	e9 96 f7 ff ff       	jmp    80105ea1 <alltraps>

8010670b <vector109>:
.globl vector109
vector109:
  pushl $0
8010670b:	6a 00                	push   $0x0
  pushl $109
8010670d:	6a 6d                	push   $0x6d
  jmp alltraps
8010670f:	e9 8d f7 ff ff       	jmp    80105ea1 <alltraps>

80106714 <vector110>:
.globl vector110
vector110:
  pushl $0
80106714:	6a 00                	push   $0x0
  pushl $110
80106716:	6a 6e                	push   $0x6e
  jmp alltraps
80106718:	e9 84 f7 ff ff       	jmp    80105ea1 <alltraps>

8010671d <vector111>:
.globl vector111
vector111:
  pushl $0
8010671d:	6a 00                	push   $0x0
  pushl $111
8010671f:	6a 6f                	push   $0x6f
  jmp alltraps
80106721:	e9 7b f7 ff ff       	jmp    80105ea1 <alltraps>

80106726 <vector112>:
.globl vector112
vector112:
  pushl $0
80106726:	6a 00                	push   $0x0
  pushl $112
80106728:	6a 70                	push   $0x70
  jmp alltraps
8010672a:	e9 72 f7 ff ff       	jmp    80105ea1 <alltraps>

8010672f <vector113>:
.globl vector113
vector113:
  pushl $0
8010672f:	6a 00                	push   $0x0
  pushl $113
80106731:	6a 71                	push   $0x71
  jmp alltraps
80106733:	e9 69 f7 ff ff       	jmp    80105ea1 <alltraps>

80106738 <vector114>:
.globl vector114
vector114:
  pushl $0
80106738:	6a 00                	push   $0x0
  pushl $114
8010673a:	6a 72                	push   $0x72
  jmp alltraps
8010673c:	e9 60 f7 ff ff       	jmp    80105ea1 <alltraps>

80106741 <vector115>:
.globl vector115
vector115:
  pushl $0
80106741:	6a 00                	push   $0x0
  pushl $115
80106743:	6a 73                	push   $0x73
  jmp alltraps
80106745:	e9 57 f7 ff ff       	jmp    80105ea1 <alltraps>

8010674a <vector116>:
.globl vector116
vector116:
  pushl $0
8010674a:	6a 00                	push   $0x0
  pushl $116
8010674c:	6a 74                	push   $0x74
  jmp alltraps
8010674e:	e9 4e f7 ff ff       	jmp    80105ea1 <alltraps>

80106753 <vector117>:
.globl vector117
vector117:
  pushl $0
80106753:	6a 00                	push   $0x0
  pushl $117
80106755:	6a 75                	push   $0x75
  jmp alltraps
80106757:	e9 45 f7 ff ff       	jmp    80105ea1 <alltraps>

8010675c <vector118>:
.globl vector118
vector118:
  pushl $0
8010675c:	6a 00                	push   $0x0
  pushl $118
8010675e:	6a 76                	push   $0x76
  jmp alltraps
80106760:	e9 3c f7 ff ff       	jmp    80105ea1 <alltraps>

80106765 <vector119>:
.globl vector119
vector119:
  pushl $0
80106765:	6a 00                	push   $0x0
  pushl $119
80106767:	6a 77                	push   $0x77
  jmp alltraps
80106769:	e9 33 f7 ff ff       	jmp    80105ea1 <alltraps>

8010676e <vector120>:
.globl vector120
vector120:
  pushl $0
8010676e:	6a 00                	push   $0x0
  pushl $120
80106770:	6a 78                	push   $0x78
  jmp alltraps
80106772:	e9 2a f7 ff ff       	jmp    80105ea1 <alltraps>

80106777 <vector121>:
.globl vector121
vector121:
  pushl $0
80106777:	6a 00                	push   $0x0
  pushl $121
80106779:	6a 79                	push   $0x79
  jmp alltraps
8010677b:	e9 21 f7 ff ff       	jmp    80105ea1 <alltraps>

80106780 <vector122>:
.globl vector122
vector122:
  pushl $0
80106780:	6a 00                	push   $0x0
  pushl $122
80106782:	6a 7a                	push   $0x7a
  jmp alltraps
80106784:	e9 18 f7 ff ff       	jmp    80105ea1 <alltraps>

80106789 <vector123>:
.globl vector123
vector123:
  pushl $0
80106789:	6a 00                	push   $0x0
  pushl $123
8010678b:	6a 7b                	push   $0x7b
  jmp alltraps
8010678d:	e9 0f f7 ff ff       	jmp    80105ea1 <alltraps>

80106792 <vector124>:
.globl vector124
vector124:
  pushl $0
80106792:	6a 00                	push   $0x0
  pushl $124
80106794:	6a 7c                	push   $0x7c
  jmp alltraps
80106796:	e9 06 f7 ff ff       	jmp    80105ea1 <alltraps>

8010679b <vector125>:
.globl vector125
vector125:
  pushl $0
8010679b:	6a 00                	push   $0x0
  pushl $125
8010679d:	6a 7d                	push   $0x7d
  jmp alltraps
8010679f:	e9 fd f6 ff ff       	jmp    80105ea1 <alltraps>

801067a4 <vector126>:
.globl vector126
vector126:
  pushl $0
801067a4:	6a 00                	push   $0x0
  pushl $126
801067a6:	6a 7e                	push   $0x7e
  jmp alltraps
801067a8:	e9 f4 f6 ff ff       	jmp    80105ea1 <alltraps>

801067ad <vector127>:
.globl vector127
vector127:
  pushl $0
801067ad:	6a 00                	push   $0x0
  pushl $127
801067af:	6a 7f                	push   $0x7f
  jmp alltraps
801067b1:	e9 eb f6 ff ff       	jmp    80105ea1 <alltraps>

801067b6 <vector128>:
.globl vector128
vector128:
  pushl $0
801067b6:	6a 00                	push   $0x0
  pushl $128
801067b8:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801067bd:	e9 df f6 ff ff       	jmp    80105ea1 <alltraps>

801067c2 <vector129>:
.globl vector129
vector129:
  pushl $0
801067c2:	6a 00                	push   $0x0
  pushl $129
801067c4:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801067c9:	e9 d3 f6 ff ff       	jmp    80105ea1 <alltraps>

801067ce <vector130>:
.globl vector130
vector130:
  pushl $0
801067ce:	6a 00                	push   $0x0
  pushl $130
801067d0:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801067d5:	e9 c7 f6 ff ff       	jmp    80105ea1 <alltraps>

801067da <vector131>:
.globl vector131
vector131:
  pushl $0
801067da:	6a 00                	push   $0x0
  pushl $131
801067dc:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801067e1:	e9 bb f6 ff ff       	jmp    80105ea1 <alltraps>

801067e6 <vector132>:
.globl vector132
vector132:
  pushl $0
801067e6:	6a 00                	push   $0x0
  pushl $132
801067e8:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801067ed:	e9 af f6 ff ff       	jmp    80105ea1 <alltraps>

801067f2 <vector133>:
.globl vector133
vector133:
  pushl $0
801067f2:	6a 00                	push   $0x0
  pushl $133
801067f4:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801067f9:	e9 a3 f6 ff ff       	jmp    80105ea1 <alltraps>

801067fe <vector134>:
.globl vector134
vector134:
  pushl $0
801067fe:	6a 00                	push   $0x0
  pushl $134
80106800:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106805:	e9 97 f6 ff ff       	jmp    80105ea1 <alltraps>

8010680a <vector135>:
.globl vector135
vector135:
  pushl $0
8010680a:	6a 00                	push   $0x0
  pushl $135
8010680c:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106811:	e9 8b f6 ff ff       	jmp    80105ea1 <alltraps>

80106816 <vector136>:
.globl vector136
vector136:
  pushl $0
80106816:	6a 00                	push   $0x0
  pushl $136
80106818:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010681d:	e9 7f f6 ff ff       	jmp    80105ea1 <alltraps>

80106822 <vector137>:
.globl vector137
vector137:
  pushl $0
80106822:	6a 00                	push   $0x0
  pushl $137
80106824:	68 89 00 00 00       	push   $0x89
  jmp alltraps
80106829:	e9 73 f6 ff ff       	jmp    80105ea1 <alltraps>

8010682e <vector138>:
.globl vector138
vector138:
  pushl $0
8010682e:	6a 00                	push   $0x0
  pushl $138
80106830:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106835:	e9 67 f6 ff ff       	jmp    80105ea1 <alltraps>

8010683a <vector139>:
.globl vector139
vector139:
  pushl $0
8010683a:	6a 00                	push   $0x0
  pushl $139
8010683c:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106841:	e9 5b f6 ff ff       	jmp    80105ea1 <alltraps>

80106846 <vector140>:
.globl vector140
vector140:
  pushl $0
80106846:	6a 00                	push   $0x0
  pushl $140
80106848:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010684d:	e9 4f f6 ff ff       	jmp    80105ea1 <alltraps>

80106852 <vector141>:
.globl vector141
vector141:
  pushl $0
80106852:	6a 00                	push   $0x0
  pushl $141
80106854:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
80106859:	e9 43 f6 ff ff       	jmp    80105ea1 <alltraps>

8010685e <vector142>:
.globl vector142
vector142:
  pushl $0
8010685e:	6a 00                	push   $0x0
  pushl $142
80106860:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106865:	e9 37 f6 ff ff       	jmp    80105ea1 <alltraps>

8010686a <vector143>:
.globl vector143
vector143:
  pushl $0
8010686a:	6a 00                	push   $0x0
  pushl $143
8010686c:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106871:	e9 2b f6 ff ff       	jmp    80105ea1 <alltraps>

80106876 <vector144>:
.globl vector144
vector144:
  pushl $0
80106876:	6a 00                	push   $0x0
  pushl $144
80106878:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010687d:	e9 1f f6 ff ff       	jmp    80105ea1 <alltraps>

80106882 <vector145>:
.globl vector145
vector145:
  pushl $0
80106882:	6a 00                	push   $0x0
  pushl $145
80106884:	68 91 00 00 00       	push   $0x91
  jmp alltraps
80106889:	e9 13 f6 ff ff       	jmp    80105ea1 <alltraps>

8010688e <vector146>:
.globl vector146
vector146:
  pushl $0
8010688e:	6a 00                	push   $0x0
  pushl $146
80106890:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106895:	e9 07 f6 ff ff       	jmp    80105ea1 <alltraps>

8010689a <vector147>:
.globl vector147
vector147:
  pushl $0
8010689a:	6a 00                	push   $0x0
  pushl $147
8010689c:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801068a1:	e9 fb f5 ff ff       	jmp    80105ea1 <alltraps>

801068a6 <vector148>:
.globl vector148
vector148:
  pushl $0
801068a6:	6a 00                	push   $0x0
  pushl $148
801068a8:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801068ad:	e9 ef f5 ff ff       	jmp    80105ea1 <alltraps>

801068b2 <vector149>:
.globl vector149
vector149:
  pushl $0
801068b2:	6a 00                	push   $0x0
  pushl $149
801068b4:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801068b9:	e9 e3 f5 ff ff       	jmp    80105ea1 <alltraps>

801068be <vector150>:
.globl vector150
vector150:
  pushl $0
801068be:	6a 00                	push   $0x0
  pushl $150
801068c0:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801068c5:	e9 d7 f5 ff ff       	jmp    80105ea1 <alltraps>

801068ca <vector151>:
.globl vector151
vector151:
  pushl $0
801068ca:	6a 00                	push   $0x0
  pushl $151
801068cc:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801068d1:	e9 cb f5 ff ff       	jmp    80105ea1 <alltraps>

801068d6 <vector152>:
.globl vector152
vector152:
  pushl $0
801068d6:	6a 00                	push   $0x0
  pushl $152
801068d8:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801068dd:	e9 bf f5 ff ff       	jmp    80105ea1 <alltraps>

801068e2 <vector153>:
.globl vector153
vector153:
  pushl $0
801068e2:	6a 00                	push   $0x0
  pushl $153
801068e4:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801068e9:	e9 b3 f5 ff ff       	jmp    80105ea1 <alltraps>

801068ee <vector154>:
.globl vector154
vector154:
  pushl $0
801068ee:	6a 00                	push   $0x0
  pushl $154
801068f0:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801068f5:	e9 a7 f5 ff ff       	jmp    80105ea1 <alltraps>

801068fa <vector155>:
.globl vector155
vector155:
  pushl $0
801068fa:	6a 00                	push   $0x0
  pushl $155
801068fc:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106901:	e9 9b f5 ff ff       	jmp    80105ea1 <alltraps>

80106906 <vector156>:
.globl vector156
vector156:
  pushl $0
80106906:	6a 00                	push   $0x0
  pushl $156
80106908:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010690d:	e9 8f f5 ff ff       	jmp    80105ea1 <alltraps>

80106912 <vector157>:
.globl vector157
vector157:
  pushl $0
80106912:	6a 00                	push   $0x0
  pushl $157
80106914:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
80106919:	e9 83 f5 ff ff       	jmp    80105ea1 <alltraps>

8010691e <vector158>:
.globl vector158
vector158:
  pushl $0
8010691e:	6a 00                	push   $0x0
  pushl $158
80106920:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106925:	e9 77 f5 ff ff       	jmp    80105ea1 <alltraps>

8010692a <vector159>:
.globl vector159
vector159:
  pushl $0
8010692a:	6a 00                	push   $0x0
  pushl $159
8010692c:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106931:	e9 6b f5 ff ff       	jmp    80105ea1 <alltraps>

80106936 <vector160>:
.globl vector160
vector160:
  pushl $0
80106936:	6a 00                	push   $0x0
  pushl $160
80106938:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010693d:	e9 5f f5 ff ff       	jmp    80105ea1 <alltraps>

80106942 <vector161>:
.globl vector161
vector161:
  pushl $0
80106942:	6a 00                	push   $0x0
  pushl $161
80106944:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
80106949:	e9 53 f5 ff ff       	jmp    80105ea1 <alltraps>

8010694e <vector162>:
.globl vector162
vector162:
  pushl $0
8010694e:	6a 00                	push   $0x0
  pushl $162
80106950:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106955:	e9 47 f5 ff ff       	jmp    80105ea1 <alltraps>

8010695a <vector163>:
.globl vector163
vector163:
  pushl $0
8010695a:	6a 00                	push   $0x0
  pushl $163
8010695c:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106961:	e9 3b f5 ff ff       	jmp    80105ea1 <alltraps>

80106966 <vector164>:
.globl vector164
vector164:
  pushl $0
80106966:	6a 00                	push   $0x0
  pushl $164
80106968:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010696d:	e9 2f f5 ff ff       	jmp    80105ea1 <alltraps>

80106972 <vector165>:
.globl vector165
vector165:
  pushl $0
80106972:	6a 00                	push   $0x0
  pushl $165
80106974:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
80106979:	e9 23 f5 ff ff       	jmp    80105ea1 <alltraps>

8010697e <vector166>:
.globl vector166
vector166:
  pushl $0
8010697e:	6a 00                	push   $0x0
  pushl $166
80106980:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106985:	e9 17 f5 ff ff       	jmp    80105ea1 <alltraps>

8010698a <vector167>:
.globl vector167
vector167:
  pushl $0
8010698a:	6a 00                	push   $0x0
  pushl $167
8010698c:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106991:	e9 0b f5 ff ff       	jmp    80105ea1 <alltraps>

80106996 <vector168>:
.globl vector168
vector168:
  pushl $0
80106996:	6a 00                	push   $0x0
  pushl $168
80106998:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010699d:	e9 ff f4 ff ff       	jmp    80105ea1 <alltraps>

801069a2 <vector169>:
.globl vector169
vector169:
  pushl $0
801069a2:	6a 00                	push   $0x0
  pushl $169
801069a4:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801069a9:	e9 f3 f4 ff ff       	jmp    80105ea1 <alltraps>

801069ae <vector170>:
.globl vector170
vector170:
  pushl $0
801069ae:	6a 00                	push   $0x0
  pushl $170
801069b0:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801069b5:	e9 e7 f4 ff ff       	jmp    80105ea1 <alltraps>

801069ba <vector171>:
.globl vector171
vector171:
  pushl $0
801069ba:	6a 00                	push   $0x0
  pushl $171
801069bc:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801069c1:	e9 db f4 ff ff       	jmp    80105ea1 <alltraps>

801069c6 <vector172>:
.globl vector172
vector172:
  pushl $0
801069c6:	6a 00                	push   $0x0
  pushl $172
801069c8:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801069cd:	e9 cf f4 ff ff       	jmp    80105ea1 <alltraps>

801069d2 <vector173>:
.globl vector173
vector173:
  pushl $0
801069d2:	6a 00                	push   $0x0
  pushl $173
801069d4:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801069d9:	e9 c3 f4 ff ff       	jmp    80105ea1 <alltraps>

801069de <vector174>:
.globl vector174
vector174:
  pushl $0
801069de:	6a 00                	push   $0x0
  pushl $174
801069e0:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801069e5:	e9 b7 f4 ff ff       	jmp    80105ea1 <alltraps>

801069ea <vector175>:
.globl vector175
vector175:
  pushl $0
801069ea:	6a 00                	push   $0x0
  pushl $175
801069ec:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801069f1:	e9 ab f4 ff ff       	jmp    80105ea1 <alltraps>

801069f6 <vector176>:
.globl vector176
vector176:
  pushl $0
801069f6:	6a 00                	push   $0x0
  pushl $176
801069f8:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801069fd:	e9 9f f4 ff ff       	jmp    80105ea1 <alltraps>

80106a02 <vector177>:
.globl vector177
vector177:
  pushl $0
80106a02:	6a 00                	push   $0x0
  pushl $177
80106a04:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
80106a09:	e9 93 f4 ff ff       	jmp    80105ea1 <alltraps>

80106a0e <vector178>:
.globl vector178
vector178:
  pushl $0
80106a0e:	6a 00                	push   $0x0
  pushl $178
80106a10:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106a15:	e9 87 f4 ff ff       	jmp    80105ea1 <alltraps>

80106a1a <vector179>:
.globl vector179
vector179:
  pushl $0
80106a1a:	6a 00                	push   $0x0
  pushl $179
80106a1c:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106a21:	e9 7b f4 ff ff       	jmp    80105ea1 <alltraps>

80106a26 <vector180>:
.globl vector180
vector180:
  pushl $0
80106a26:	6a 00                	push   $0x0
  pushl $180
80106a28:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
80106a2d:	e9 6f f4 ff ff       	jmp    80105ea1 <alltraps>

80106a32 <vector181>:
.globl vector181
vector181:
  pushl $0
80106a32:	6a 00                	push   $0x0
  pushl $181
80106a34:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
80106a39:	e9 63 f4 ff ff       	jmp    80105ea1 <alltraps>

80106a3e <vector182>:
.globl vector182
vector182:
  pushl $0
80106a3e:	6a 00                	push   $0x0
  pushl $182
80106a40:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106a45:	e9 57 f4 ff ff       	jmp    80105ea1 <alltraps>

80106a4a <vector183>:
.globl vector183
vector183:
  pushl $0
80106a4a:	6a 00                	push   $0x0
  pushl $183
80106a4c:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106a51:	e9 4b f4 ff ff       	jmp    80105ea1 <alltraps>

80106a56 <vector184>:
.globl vector184
vector184:
  pushl $0
80106a56:	6a 00                	push   $0x0
  pushl $184
80106a58:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
80106a5d:	e9 3f f4 ff ff       	jmp    80105ea1 <alltraps>

80106a62 <vector185>:
.globl vector185
vector185:
  pushl $0
80106a62:	6a 00                	push   $0x0
  pushl $185
80106a64:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
80106a69:	e9 33 f4 ff ff       	jmp    80105ea1 <alltraps>

80106a6e <vector186>:
.globl vector186
vector186:
  pushl $0
80106a6e:	6a 00                	push   $0x0
  pushl $186
80106a70:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106a75:	e9 27 f4 ff ff       	jmp    80105ea1 <alltraps>

80106a7a <vector187>:
.globl vector187
vector187:
  pushl $0
80106a7a:	6a 00                	push   $0x0
  pushl $187
80106a7c:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106a81:	e9 1b f4 ff ff       	jmp    80105ea1 <alltraps>

80106a86 <vector188>:
.globl vector188
vector188:
  pushl $0
80106a86:	6a 00                	push   $0x0
  pushl $188
80106a88:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
80106a8d:	e9 0f f4 ff ff       	jmp    80105ea1 <alltraps>

80106a92 <vector189>:
.globl vector189
vector189:
  pushl $0
80106a92:	6a 00                	push   $0x0
  pushl $189
80106a94:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
80106a99:	e9 03 f4 ff ff       	jmp    80105ea1 <alltraps>

80106a9e <vector190>:
.globl vector190
vector190:
  pushl $0
80106a9e:	6a 00                	push   $0x0
  pushl $190
80106aa0:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106aa5:	e9 f7 f3 ff ff       	jmp    80105ea1 <alltraps>

80106aaa <vector191>:
.globl vector191
vector191:
  pushl $0
80106aaa:	6a 00                	push   $0x0
  pushl $191
80106aac:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106ab1:	e9 eb f3 ff ff       	jmp    80105ea1 <alltraps>

80106ab6 <vector192>:
.globl vector192
vector192:
  pushl $0
80106ab6:	6a 00                	push   $0x0
  pushl $192
80106ab8:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
80106abd:	e9 df f3 ff ff       	jmp    80105ea1 <alltraps>

80106ac2 <vector193>:
.globl vector193
vector193:
  pushl $0
80106ac2:	6a 00                	push   $0x0
  pushl $193
80106ac4:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
80106ac9:	e9 d3 f3 ff ff       	jmp    80105ea1 <alltraps>

80106ace <vector194>:
.globl vector194
vector194:
  pushl $0
80106ace:	6a 00                	push   $0x0
  pushl $194
80106ad0:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106ad5:	e9 c7 f3 ff ff       	jmp    80105ea1 <alltraps>

80106ada <vector195>:
.globl vector195
vector195:
  pushl $0
80106ada:	6a 00                	push   $0x0
  pushl $195
80106adc:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106ae1:	e9 bb f3 ff ff       	jmp    80105ea1 <alltraps>

80106ae6 <vector196>:
.globl vector196
vector196:
  pushl $0
80106ae6:	6a 00                	push   $0x0
  pushl $196
80106ae8:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80106aed:	e9 af f3 ff ff       	jmp    80105ea1 <alltraps>

80106af2 <vector197>:
.globl vector197
vector197:
  pushl $0
80106af2:	6a 00                	push   $0x0
  pushl $197
80106af4:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
80106af9:	e9 a3 f3 ff ff       	jmp    80105ea1 <alltraps>

80106afe <vector198>:
.globl vector198
vector198:
  pushl $0
80106afe:	6a 00                	push   $0x0
  pushl $198
80106b00:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106b05:	e9 97 f3 ff ff       	jmp    80105ea1 <alltraps>

80106b0a <vector199>:
.globl vector199
vector199:
  pushl $0
80106b0a:	6a 00                	push   $0x0
  pushl $199
80106b0c:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106b11:	e9 8b f3 ff ff       	jmp    80105ea1 <alltraps>

80106b16 <vector200>:
.globl vector200
vector200:
  pushl $0
80106b16:	6a 00                	push   $0x0
  pushl $200
80106b18:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80106b1d:	e9 7f f3 ff ff       	jmp    80105ea1 <alltraps>

80106b22 <vector201>:
.globl vector201
vector201:
  pushl $0
80106b22:	6a 00                	push   $0x0
  pushl $201
80106b24:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80106b29:	e9 73 f3 ff ff       	jmp    80105ea1 <alltraps>

80106b2e <vector202>:
.globl vector202
vector202:
  pushl $0
80106b2e:	6a 00                	push   $0x0
  pushl $202
80106b30:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106b35:	e9 67 f3 ff ff       	jmp    80105ea1 <alltraps>

80106b3a <vector203>:
.globl vector203
vector203:
  pushl $0
80106b3a:	6a 00                	push   $0x0
  pushl $203
80106b3c:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106b41:	e9 5b f3 ff ff       	jmp    80105ea1 <alltraps>

80106b46 <vector204>:
.globl vector204
vector204:
  pushl $0
80106b46:	6a 00                	push   $0x0
  pushl $204
80106b48:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
80106b4d:	e9 4f f3 ff ff       	jmp    80105ea1 <alltraps>

80106b52 <vector205>:
.globl vector205
vector205:
  pushl $0
80106b52:	6a 00                	push   $0x0
  pushl $205
80106b54:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
80106b59:	e9 43 f3 ff ff       	jmp    80105ea1 <alltraps>

80106b5e <vector206>:
.globl vector206
vector206:
  pushl $0
80106b5e:	6a 00                	push   $0x0
  pushl $206
80106b60:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106b65:	e9 37 f3 ff ff       	jmp    80105ea1 <alltraps>

80106b6a <vector207>:
.globl vector207
vector207:
  pushl $0
80106b6a:	6a 00                	push   $0x0
  pushl $207
80106b6c:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106b71:	e9 2b f3 ff ff       	jmp    80105ea1 <alltraps>

80106b76 <vector208>:
.globl vector208
vector208:
  pushl $0
80106b76:	6a 00                	push   $0x0
  pushl $208
80106b78:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
80106b7d:	e9 1f f3 ff ff       	jmp    80105ea1 <alltraps>

80106b82 <vector209>:
.globl vector209
vector209:
  pushl $0
80106b82:	6a 00                	push   $0x0
  pushl $209
80106b84:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
80106b89:	e9 13 f3 ff ff       	jmp    80105ea1 <alltraps>

80106b8e <vector210>:
.globl vector210
vector210:
  pushl $0
80106b8e:	6a 00                	push   $0x0
  pushl $210
80106b90:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106b95:	e9 07 f3 ff ff       	jmp    80105ea1 <alltraps>

80106b9a <vector211>:
.globl vector211
vector211:
  pushl $0
80106b9a:	6a 00                	push   $0x0
  pushl $211
80106b9c:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106ba1:	e9 fb f2 ff ff       	jmp    80105ea1 <alltraps>

80106ba6 <vector212>:
.globl vector212
vector212:
  pushl $0
80106ba6:	6a 00                	push   $0x0
  pushl $212
80106ba8:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
80106bad:	e9 ef f2 ff ff       	jmp    80105ea1 <alltraps>

80106bb2 <vector213>:
.globl vector213
vector213:
  pushl $0
80106bb2:	6a 00                	push   $0x0
  pushl $213
80106bb4:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106bb9:	e9 e3 f2 ff ff       	jmp    80105ea1 <alltraps>

80106bbe <vector214>:
.globl vector214
vector214:
  pushl $0
80106bbe:	6a 00                	push   $0x0
  pushl $214
80106bc0:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106bc5:	e9 d7 f2 ff ff       	jmp    80105ea1 <alltraps>

80106bca <vector215>:
.globl vector215
vector215:
  pushl $0
80106bca:	6a 00                	push   $0x0
  pushl $215
80106bcc:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106bd1:	e9 cb f2 ff ff       	jmp    80105ea1 <alltraps>

80106bd6 <vector216>:
.globl vector216
vector216:
  pushl $0
80106bd6:	6a 00                	push   $0x0
  pushl $216
80106bd8:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80106bdd:	e9 bf f2 ff ff       	jmp    80105ea1 <alltraps>

80106be2 <vector217>:
.globl vector217
vector217:
  pushl $0
80106be2:	6a 00                	push   $0x0
  pushl $217
80106be4:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106be9:	e9 b3 f2 ff ff       	jmp    80105ea1 <alltraps>

80106bee <vector218>:
.globl vector218
vector218:
  pushl $0
80106bee:	6a 00                	push   $0x0
  pushl $218
80106bf0:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106bf5:	e9 a7 f2 ff ff       	jmp    80105ea1 <alltraps>

80106bfa <vector219>:
.globl vector219
vector219:
  pushl $0
80106bfa:	6a 00                	push   $0x0
  pushl $219
80106bfc:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106c01:	e9 9b f2 ff ff       	jmp    80105ea1 <alltraps>

80106c06 <vector220>:
.globl vector220
vector220:
  pushl $0
80106c06:	6a 00                	push   $0x0
  pushl $220
80106c08:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80106c0d:	e9 8f f2 ff ff       	jmp    80105ea1 <alltraps>

80106c12 <vector221>:
.globl vector221
vector221:
  pushl $0
80106c12:	6a 00                	push   $0x0
  pushl $221
80106c14:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106c19:	e9 83 f2 ff ff       	jmp    80105ea1 <alltraps>

80106c1e <vector222>:
.globl vector222
vector222:
  pushl $0
80106c1e:	6a 00                	push   $0x0
  pushl $222
80106c20:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106c25:	e9 77 f2 ff ff       	jmp    80105ea1 <alltraps>

80106c2a <vector223>:
.globl vector223
vector223:
  pushl $0
80106c2a:	6a 00                	push   $0x0
  pushl $223
80106c2c:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106c31:	e9 6b f2 ff ff       	jmp    80105ea1 <alltraps>

80106c36 <vector224>:
.globl vector224
vector224:
  pushl $0
80106c36:	6a 00                	push   $0x0
  pushl $224
80106c38:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80106c3d:	e9 5f f2 ff ff       	jmp    80105ea1 <alltraps>

80106c42 <vector225>:
.globl vector225
vector225:
  pushl $0
80106c42:	6a 00                	push   $0x0
  pushl $225
80106c44:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106c49:	e9 53 f2 ff ff       	jmp    80105ea1 <alltraps>

80106c4e <vector226>:
.globl vector226
vector226:
  pushl $0
80106c4e:	6a 00                	push   $0x0
  pushl $226
80106c50:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106c55:	e9 47 f2 ff ff       	jmp    80105ea1 <alltraps>

80106c5a <vector227>:
.globl vector227
vector227:
  pushl $0
80106c5a:	6a 00                	push   $0x0
  pushl $227
80106c5c:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106c61:	e9 3b f2 ff ff       	jmp    80105ea1 <alltraps>

80106c66 <vector228>:
.globl vector228
vector228:
  pushl $0
80106c66:	6a 00                	push   $0x0
  pushl $228
80106c68:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80106c6d:	e9 2f f2 ff ff       	jmp    80105ea1 <alltraps>

80106c72 <vector229>:
.globl vector229
vector229:
  pushl $0
80106c72:	6a 00                	push   $0x0
  pushl $229
80106c74:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80106c79:	e9 23 f2 ff ff       	jmp    80105ea1 <alltraps>

80106c7e <vector230>:
.globl vector230
vector230:
  pushl $0
80106c7e:	6a 00                	push   $0x0
  pushl $230
80106c80:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106c85:	e9 17 f2 ff ff       	jmp    80105ea1 <alltraps>

80106c8a <vector231>:
.globl vector231
vector231:
  pushl $0
80106c8a:	6a 00                	push   $0x0
  pushl $231
80106c8c:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106c91:	e9 0b f2 ff ff       	jmp    80105ea1 <alltraps>

80106c96 <vector232>:
.globl vector232
vector232:
  pushl $0
80106c96:	6a 00                	push   $0x0
  pushl $232
80106c98:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80106c9d:	e9 ff f1 ff ff       	jmp    80105ea1 <alltraps>

80106ca2 <vector233>:
.globl vector233
vector233:
  pushl $0
80106ca2:	6a 00                	push   $0x0
  pushl $233
80106ca4:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80106ca9:	e9 f3 f1 ff ff       	jmp    80105ea1 <alltraps>

80106cae <vector234>:
.globl vector234
vector234:
  pushl $0
80106cae:	6a 00                	push   $0x0
  pushl $234
80106cb0:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106cb5:	e9 e7 f1 ff ff       	jmp    80105ea1 <alltraps>

80106cba <vector235>:
.globl vector235
vector235:
  pushl $0
80106cba:	6a 00                	push   $0x0
  pushl $235
80106cbc:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106cc1:	e9 db f1 ff ff       	jmp    80105ea1 <alltraps>

80106cc6 <vector236>:
.globl vector236
vector236:
  pushl $0
80106cc6:	6a 00                	push   $0x0
  pushl $236
80106cc8:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80106ccd:	e9 cf f1 ff ff       	jmp    80105ea1 <alltraps>

80106cd2 <vector237>:
.globl vector237
vector237:
  pushl $0
80106cd2:	6a 00                	push   $0x0
  pushl $237
80106cd4:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106cd9:	e9 c3 f1 ff ff       	jmp    80105ea1 <alltraps>

80106cde <vector238>:
.globl vector238
vector238:
  pushl $0
80106cde:	6a 00                	push   $0x0
  pushl $238
80106ce0:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106ce5:	e9 b7 f1 ff ff       	jmp    80105ea1 <alltraps>

80106cea <vector239>:
.globl vector239
vector239:
  pushl $0
80106cea:	6a 00                	push   $0x0
  pushl $239
80106cec:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106cf1:	e9 ab f1 ff ff       	jmp    80105ea1 <alltraps>

80106cf6 <vector240>:
.globl vector240
vector240:
  pushl $0
80106cf6:	6a 00                	push   $0x0
  pushl $240
80106cf8:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106cfd:	e9 9f f1 ff ff       	jmp    80105ea1 <alltraps>

80106d02 <vector241>:
.globl vector241
vector241:
  pushl $0
80106d02:	6a 00                	push   $0x0
  pushl $241
80106d04:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106d09:	e9 93 f1 ff ff       	jmp    80105ea1 <alltraps>

80106d0e <vector242>:
.globl vector242
vector242:
  pushl $0
80106d0e:	6a 00                	push   $0x0
  pushl $242
80106d10:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106d15:	e9 87 f1 ff ff       	jmp    80105ea1 <alltraps>

80106d1a <vector243>:
.globl vector243
vector243:
  pushl $0
80106d1a:	6a 00                	push   $0x0
  pushl $243
80106d1c:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106d21:	e9 7b f1 ff ff       	jmp    80105ea1 <alltraps>

80106d26 <vector244>:
.globl vector244
vector244:
  pushl $0
80106d26:	6a 00                	push   $0x0
  pushl $244
80106d28:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106d2d:	e9 6f f1 ff ff       	jmp    80105ea1 <alltraps>

80106d32 <vector245>:
.globl vector245
vector245:
  pushl $0
80106d32:	6a 00                	push   $0x0
  pushl $245
80106d34:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106d39:	e9 63 f1 ff ff       	jmp    80105ea1 <alltraps>

80106d3e <vector246>:
.globl vector246
vector246:
  pushl $0
80106d3e:	6a 00                	push   $0x0
  pushl $246
80106d40:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106d45:	e9 57 f1 ff ff       	jmp    80105ea1 <alltraps>

80106d4a <vector247>:
.globl vector247
vector247:
  pushl $0
80106d4a:	6a 00                	push   $0x0
  pushl $247
80106d4c:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106d51:	e9 4b f1 ff ff       	jmp    80105ea1 <alltraps>

80106d56 <vector248>:
.globl vector248
vector248:
  pushl $0
80106d56:	6a 00                	push   $0x0
  pushl $248
80106d58:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106d5d:	e9 3f f1 ff ff       	jmp    80105ea1 <alltraps>

80106d62 <vector249>:
.globl vector249
vector249:
  pushl $0
80106d62:	6a 00                	push   $0x0
  pushl $249
80106d64:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106d69:	e9 33 f1 ff ff       	jmp    80105ea1 <alltraps>

80106d6e <vector250>:
.globl vector250
vector250:
  pushl $0
80106d6e:	6a 00                	push   $0x0
  pushl $250
80106d70:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106d75:	e9 27 f1 ff ff       	jmp    80105ea1 <alltraps>

80106d7a <vector251>:
.globl vector251
vector251:
  pushl $0
80106d7a:	6a 00                	push   $0x0
  pushl $251
80106d7c:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106d81:	e9 1b f1 ff ff       	jmp    80105ea1 <alltraps>

80106d86 <vector252>:
.globl vector252
vector252:
  pushl $0
80106d86:	6a 00                	push   $0x0
  pushl $252
80106d88:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106d8d:	e9 0f f1 ff ff       	jmp    80105ea1 <alltraps>

80106d92 <vector253>:
.globl vector253
vector253:
  pushl $0
80106d92:	6a 00                	push   $0x0
  pushl $253
80106d94:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106d99:	e9 03 f1 ff ff       	jmp    80105ea1 <alltraps>

80106d9e <vector254>:
.globl vector254
vector254:
  pushl $0
80106d9e:	6a 00                	push   $0x0
  pushl $254
80106da0:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106da5:	e9 f7 f0 ff ff       	jmp    80105ea1 <alltraps>

80106daa <vector255>:
.globl vector255
vector255:
  pushl $0
80106daa:	6a 00                	push   $0x0
  pushl $255
80106dac:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106db1:	e9 eb f0 ff ff       	jmp    80105ea1 <alltraps>
80106db6:	66 90                	xchg   %ax,%ax
80106db8:	66 90                	xchg   %ax,%ax
80106dba:	66 90                	xchg   %ax,%ax
80106dbc:	66 90                	xchg   %ax,%ax
80106dbe:	66 90                	xchg   %ax,%ax

80106dc0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106dc0:	55                   	push   %ebp
80106dc1:	89 e5                	mov    %esp,%ebp
80106dc3:	57                   	push   %edi
80106dc4:	56                   	push   %esi
80106dc5:	89 d6                	mov    %edx,%esi
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106dc7:	c1 ea 16             	shr    $0x16,%edx
{
80106dca:	53                   	push   %ebx
  pde = &pgdir[PDX(va)];
80106dcb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
{
80106dce:	83 ec 1c             	sub    $0x1c,%esp
  if(*pde & PTE_P){
80106dd1:	8b 1f                	mov    (%edi),%ebx
80106dd3:	f6 c3 01             	test   $0x1,%bl
80106dd6:	74 28                	je     80106e00 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106dd8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106dde:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106de4:	c1 ee 0a             	shr    $0xa,%esi
}
80106de7:	83 c4 1c             	add    $0x1c,%esp
  return &pgtab[PTX(va)];
80106dea:	89 f2                	mov    %esi,%edx
80106dec:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106df2:	8d 04 13             	lea    (%ebx,%edx,1),%eax
}
80106df5:	5b                   	pop    %ebx
80106df6:	5e                   	pop    %esi
80106df7:	5f                   	pop    %edi
80106df8:	5d                   	pop    %ebp
80106df9:	c3                   	ret    
80106dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106e00:	85 c9                	test   %ecx,%ecx
80106e02:	74 34                	je     80106e38 <walkpgdir+0x78>
80106e04:	e8 b7 b6 ff ff       	call   801024c0 <kalloc>
80106e09:	85 c0                	test   %eax,%eax
80106e0b:	89 c3                	mov    %eax,%ebx
80106e0d:	74 29                	je     80106e38 <walkpgdir+0x78>
    memset(pgtab, 0, PGSIZE);
80106e0f:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106e16:	00 
80106e17:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106e1e:	00 
80106e1f:	89 04 24             	mov    %eax,(%esp)
80106e22:	e8 d9 dc ff ff       	call   80104b00 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106e27:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106e2d:	83 c8 07             	or     $0x7,%eax
80106e30:	89 07                	mov    %eax,(%edi)
80106e32:	eb b0                	jmp    80106de4 <walkpgdir+0x24>
80106e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
80106e38:	83 c4 1c             	add    $0x1c,%esp
      return 0;
80106e3b:	31 c0                	xor    %eax,%eax
}
80106e3d:	5b                   	pop    %ebx
80106e3e:	5e                   	pop    %esi
80106e3f:	5f                   	pop    %edi
80106e40:	5d                   	pop    %ebp
80106e41:	c3                   	ret    
80106e42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e50 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106e50:	55                   	push   %ebp
80106e51:	89 e5                	mov    %esp,%ebp
80106e53:	57                   	push   %edi
80106e54:	56                   	push   %esi
80106e55:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106e56:	89 d3                	mov    %edx,%ebx
{
80106e58:	83 ec 1c             	sub    $0x1c,%esp
80106e5b:	8b 7d 08             	mov    0x8(%ebp),%edi
  a = (char*)PGROUNDDOWN((uint)va);
80106e5e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106e64:	89 45 e0             	mov    %eax,-0x20(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106e67:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106e6b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106e6e:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106e72:	81 65 e4 00 f0 ff ff 	andl   $0xfffff000,-0x1c(%ebp)
80106e79:	29 df                	sub    %ebx,%edi
80106e7b:	eb 18                	jmp    80106e95 <mappages+0x45>
80106e7d:	8d 76 00             	lea    0x0(%esi),%esi
    if(*pte & PTE_P)
80106e80:	f6 00 01             	testb  $0x1,(%eax)
80106e83:	75 3d                	jne    80106ec2 <mappages+0x72>
    *pte = pa | perm | PTE_P;
80106e85:	0b 75 0c             	or     0xc(%ebp),%esi
    if(a == last)
80106e88:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
    *pte = pa | perm | PTE_P;
80106e8b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106e8d:	74 29                	je     80106eb8 <mappages+0x68>
      break;
    a += PGSIZE;
80106e8f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106e95:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e98:	b9 01 00 00 00       	mov    $0x1,%ecx
80106e9d:	89 da                	mov    %ebx,%edx
80106e9f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106ea2:	e8 19 ff ff ff       	call   80106dc0 <walkpgdir>
80106ea7:	85 c0                	test   %eax,%eax
80106ea9:	75 d5                	jne    80106e80 <mappages+0x30>
    pa += PGSIZE;
  }
  return 0;
}
80106eab:	83 c4 1c             	add    $0x1c,%esp
      return -1;
80106eae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106eb3:	5b                   	pop    %ebx
80106eb4:	5e                   	pop    %esi
80106eb5:	5f                   	pop    %edi
80106eb6:	5d                   	pop    %ebp
80106eb7:	c3                   	ret    
80106eb8:	83 c4 1c             	add    $0x1c,%esp
  return 0;
80106ebb:	31 c0                	xor    %eax,%eax
}
80106ebd:	5b                   	pop    %ebx
80106ebe:	5e                   	pop    %esi
80106ebf:	5f                   	pop    %edi
80106ec0:	5d                   	pop    %ebp
80106ec1:	c3                   	ret    
      panic("remap");
80106ec2:	c7 04 24 88 82 10 80 	movl   $0x80108288,(%esp)
80106ec9:	e8 92 94 ff ff       	call   80100360 <panic>
80106ece:	66 90                	xchg   %ax,%ax

80106ed0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106ed0:	55                   	push   %ebp
80106ed1:	89 e5                	mov    %esp,%ebp
80106ed3:	57                   	push   %edi
80106ed4:	89 c7                	mov    %eax,%edi
80106ed6:	56                   	push   %esi
80106ed7:	89 d6                	mov    %edx,%esi
80106ed9:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106eda:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106ee0:	83 ec 1c             	sub    $0x1c,%esp
  a = PGROUNDUP(newsz);
80106ee3:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106ee9:	39 d3                	cmp    %edx,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106eeb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106eee:	72 3b                	jb     80106f2b <deallocuvm.part.0+0x5b>
80106ef0:	eb 5e                	jmp    80106f50 <deallocuvm.part.0+0x80>
80106ef2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106ef8:	8b 10                	mov    (%eax),%edx
80106efa:	f6 c2 01             	test   $0x1,%dl
80106efd:	74 22                	je     80106f21 <deallocuvm.part.0+0x51>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106eff:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106f05:	74 54                	je     80106f5b <deallocuvm.part.0+0x8b>
        panic("kfree");
      char *v = P2V(pa);
80106f07:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
80106f0d:	89 14 24             	mov    %edx,(%esp)
80106f10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106f13:	e8 08 b4 ff ff       	call   80102320 <kfree>
      *pte = 0;
80106f18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106f1b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; a  < oldsz; a += PGSIZE){
80106f21:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106f27:	39 f3                	cmp    %esi,%ebx
80106f29:	73 25                	jae    80106f50 <deallocuvm.part.0+0x80>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106f2b:	31 c9                	xor    %ecx,%ecx
80106f2d:	89 da                	mov    %ebx,%edx
80106f2f:	89 f8                	mov    %edi,%eax
80106f31:	e8 8a fe ff ff       	call   80106dc0 <walkpgdir>
    if(!pte)
80106f36:	85 c0                	test   %eax,%eax
80106f38:	75 be                	jne    80106ef8 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
80106f3a:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106f40:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106f46:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106f4c:	39 f3                	cmp    %esi,%ebx
80106f4e:	72 db                	jb     80106f2b <deallocuvm.part.0+0x5b>
    }
  }
  return newsz;
}
80106f50:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f53:	83 c4 1c             	add    $0x1c,%esp
80106f56:	5b                   	pop    %ebx
80106f57:	5e                   	pop    %esi
80106f58:	5f                   	pop    %edi
80106f59:	5d                   	pop    %ebp
80106f5a:	c3                   	ret    
        panic("kfree");
80106f5b:	c7 04 24 3a 79 10 80 	movl   $0x8010793a,(%esp)
80106f62:	e8 f9 93 ff ff       	call   80100360 <panic>
80106f67:	89 f6                	mov    %esi,%esi
80106f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f70 <seginit>:
{
80106f70:	55                   	push   %ebp
80106f71:	89 e5                	mov    %esp,%ebp
80106f73:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106f76:	e8 95 c7 ff ff       	call   80103710 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106f7b:	31 c9                	xor    %ecx,%ecx
80106f7d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  c = &cpus[cpuid()];
80106f82:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106f88:	05 a0 37 11 80       	add    $0x801137a0,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106f8d:	66 89 50 78          	mov    %dx,0x78(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106f91:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  lgdt(c->gdt, sizeof(c->gdt));
80106f96:	83 c0 70             	add    $0x70,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106f99:	66 89 48 0a          	mov    %cx,0xa(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106f9d:	31 c9                	xor    %ecx,%ecx
80106f9f:	66 89 50 10          	mov    %dx,0x10(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106fa3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106fa8:	66 89 48 12          	mov    %cx,0x12(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106fac:	31 c9                	xor    %ecx,%ecx
80106fae:	66 89 50 18          	mov    %dx,0x18(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106fb2:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106fb7:	66 89 48 1a          	mov    %cx,0x1a(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106fbb:	31 c9                	xor    %ecx,%ecx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106fbd:	c6 40 0d 9a          	movb   $0x9a,0xd(%eax)
80106fc1:	c6 40 0e cf          	movb   $0xcf,0xe(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106fc5:	c6 40 15 92          	movb   $0x92,0x15(%eax)
80106fc9:	c6 40 16 cf          	movb   $0xcf,0x16(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106fcd:	c6 40 1d fa          	movb   $0xfa,0x1d(%eax)
80106fd1:	c6 40 1e cf          	movb   $0xcf,0x1e(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106fd5:	c6 40 25 f2          	movb   $0xf2,0x25(%eax)
80106fd9:	c6 40 26 cf          	movb   $0xcf,0x26(%eax)
80106fdd:	66 89 50 20          	mov    %dx,0x20(%eax)
  pd[0] = size-1;
80106fe1:	ba 2f 00 00 00       	mov    $0x2f,%edx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106fe6:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
80106fea:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106fee:	c6 40 14 00          	movb   $0x0,0x14(%eax)
80106ff2:	c6 40 17 00          	movb   $0x0,0x17(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106ff6:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
80106ffa:	c6 40 1f 00          	movb   $0x0,0x1f(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106ffe:	66 89 48 22          	mov    %cx,0x22(%eax)
80107002:	c6 40 24 00          	movb   $0x0,0x24(%eax)
80107006:	c6 40 27 00          	movb   $0x0,0x27(%eax)
8010700a:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
8010700e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80107012:	c1 e8 10             	shr    $0x10,%eax
80107015:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80107019:	8d 45 f2             	lea    -0xe(%ebp),%eax
8010701c:	0f 01 10             	lgdtl  (%eax)
}
8010701f:	c9                   	leave  
80107020:	c3                   	ret    
80107021:	eb 0d                	jmp    80107030 <switchkvm>
80107023:	90                   	nop
80107024:	90                   	nop
80107025:	90                   	nop
80107026:	90                   	nop
80107027:	90                   	nop
80107028:	90                   	nop
80107029:	90                   	nop
8010702a:	90                   	nop
8010702b:	90                   	nop
8010702c:	90                   	nop
8010702d:	90                   	nop
8010702e:	90                   	nop
8010702f:	90                   	nop

80107030 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107030:	a1 c4 72 11 80       	mov    0x801172c4,%eax
{
80107035:	55                   	push   %ebp
80107036:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107038:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
8010703d:	0f 22 d8             	mov    %eax,%cr3
}
80107040:	5d                   	pop    %ebp
80107041:	c3                   	ret    
80107042:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107050 <switchuvm>:
{
80107050:	55                   	push   %ebp
80107051:	89 e5                	mov    %esp,%ebp
80107053:	57                   	push   %edi
80107054:	56                   	push   %esi
80107055:	53                   	push   %ebx
80107056:	83 ec 1c             	sub    $0x1c,%esp
80107059:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
8010705c:	85 f6                	test   %esi,%esi
8010705e:	0f 84 cd 00 00 00    	je     80107131 <switchuvm+0xe1>
  if(p->kstack == 0)
80107064:	8b 46 08             	mov    0x8(%esi),%eax
80107067:	85 c0                	test   %eax,%eax
80107069:	0f 84 da 00 00 00    	je     80107149 <switchuvm+0xf9>
  if(p->pgdir == 0)
8010706f:	8b 7e 04             	mov    0x4(%esi),%edi
80107072:	85 ff                	test   %edi,%edi
80107074:	0f 84 c3 00 00 00    	je     8010713d <switchuvm+0xed>
  pushcli();
8010707a:	e8 b1 d8 ff ff       	call   80104930 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
8010707f:	e8 0c c6 ff ff       	call   80103690 <mycpu>
80107084:	89 c3                	mov    %eax,%ebx
80107086:	e8 05 c6 ff ff       	call   80103690 <mycpu>
8010708b:	89 c7                	mov    %eax,%edi
8010708d:	e8 fe c5 ff ff       	call   80103690 <mycpu>
80107092:	83 c7 08             	add    $0x8,%edi
80107095:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107098:	e8 f3 c5 ff ff       	call   80103690 <mycpu>
8010709d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801070a0:	ba 67 00 00 00       	mov    $0x67,%edx
801070a5:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
801070ac:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
801070b3:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
801070ba:	83 c1 08             	add    $0x8,%ecx
801070bd:	c1 e9 10             	shr    $0x10,%ecx
801070c0:	83 c0 08             	add    $0x8,%eax
801070c3:	c1 e8 18             	shr    $0x18,%eax
801070c6:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
801070cc:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
801070d3:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801070d9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  mycpu()->gdt[SEG_TSS].s = 0;
801070de:	e8 ad c5 ff ff       	call   80103690 <mycpu>
801070e3:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
801070ea:	e8 a1 c5 ff ff       	call   80103690 <mycpu>
801070ef:	b9 10 00 00 00       	mov    $0x10,%ecx
801070f4:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801070f8:	e8 93 c5 ff ff       	call   80103690 <mycpu>
801070fd:	8b 56 08             	mov    0x8(%esi),%edx
80107100:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80107106:	89 48 0c             	mov    %ecx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80107109:	e8 82 c5 ff ff       	call   80103690 <mycpu>
8010710e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80107112:	b8 28 00 00 00       	mov    $0x28,%eax
80107117:	0f 00 d8             	ltr    %ax
  lcr3(V2P(p->pgdir));  // switch to process's address space
8010711a:	8b 46 04             	mov    0x4(%esi),%eax
8010711d:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80107122:	0f 22 d8             	mov    %eax,%cr3
}
80107125:	83 c4 1c             	add    $0x1c,%esp
80107128:	5b                   	pop    %ebx
80107129:	5e                   	pop    %esi
8010712a:	5f                   	pop    %edi
8010712b:	5d                   	pop    %ebp
  popcli();
8010712c:	e9 3f d8 ff ff       	jmp    80104970 <popcli>
    panic("switchuvm: no process");
80107131:	c7 04 24 8e 82 10 80 	movl   $0x8010828e,(%esp)
80107138:	e8 23 92 ff ff       	call   80100360 <panic>
    panic("switchuvm: no pgdir");
8010713d:	c7 04 24 b9 82 10 80 	movl   $0x801082b9,(%esp)
80107144:	e8 17 92 ff ff       	call   80100360 <panic>
    panic("switchuvm: no kstack");
80107149:	c7 04 24 a4 82 10 80 	movl   $0x801082a4,(%esp)
80107150:	e8 0b 92 ff ff       	call   80100360 <panic>
80107155:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107160 <inituvm>:
{
80107160:	55                   	push   %ebp
80107161:	89 e5                	mov    %esp,%ebp
80107163:	57                   	push   %edi
80107164:	56                   	push   %esi
80107165:	53                   	push   %ebx
80107166:	83 ec 1c             	sub    $0x1c,%esp
80107169:	8b 75 10             	mov    0x10(%ebp),%esi
8010716c:	8b 45 08             	mov    0x8(%ebp),%eax
8010716f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(sz >= PGSIZE)
80107172:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
{
80107178:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
8010717b:	77 54                	ja     801071d1 <inituvm+0x71>
  mem = kalloc();
8010717d:	e8 3e b3 ff ff       	call   801024c0 <kalloc>
  memset(mem, 0, PGSIZE);
80107182:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107189:	00 
8010718a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107191:	00 
  mem = kalloc();
80107192:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80107194:	89 04 24             	mov    %eax,(%esp)
80107197:	e8 64 d9 ff ff       	call   80104b00 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
8010719c:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801071a2:	b9 00 10 00 00       	mov    $0x1000,%ecx
801071a7:	89 04 24             	mov    %eax,(%esp)
801071aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801071ad:	31 d2                	xor    %edx,%edx
801071af:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
801071b6:	00 
801071b7:	e8 94 fc ff ff       	call   80106e50 <mappages>
  memmove(mem, init, sz);
801071bc:	89 75 10             	mov    %esi,0x10(%ebp)
801071bf:	89 7d 0c             	mov    %edi,0xc(%ebp)
801071c2:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801071c5:	83 c4 1c             	add    $0x1c,%esp
801071c8:	5b                   	pop    %ebx
801071c9:	5e                   	pop    %esi
801071ca:	5f                   	pop    %edi
801071cb:	5d                   	pop    %ebp
  memmove(mem, init, sz);
801071cc:	e9 cf d9 ff ff       	jmp    80104ba0 <memmove>
    panic("inituvm: more than a page");
801071d1:	c7 04 24 cd 82 10 80 	movl   $0x801082cd,(%esp)
801071d8:	e8 83 91 ff ff       	call   80100360 <panic>
801071dd:	8d 76 00             	lea    0x0(%esi),%esi

801071e0 <loaduvm>:
{
801071e0:	55                   	push   %ebp
801071e1:	89 e5                	mov    %esp,%ebp
801071e3:	57                   	push   %edi
801071e4:	56                   	push   %esi
801071e5:	53                   	push   %ebx
801071e6:	83 ec 1c             	sub    $0x1c,%esp
  if((uint) addr % PGSIZE != 0)
801071e9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
801071f0:	0f 85 98 00 00 00    	jne    8010728e <loaduvm+0xae>
  for(i = 0; i < sz; i += PGSIZE){
801071f6:	8b 75 18             	mov    0x18(%ebp),%esi
801071f9:	31 db                	xor    %ebx,%ebx
801071fb:	85 f6                	test   %esi,%esi
801071fd:	75 1a                	jne    80107219 <loaduvm+0x39>
801071ff:	eb 77                	jmp    80107278 <loaduvm+0x98>
80107201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107208:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010720e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80107214:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80107217:	76 5f                	jbe    80107278 <loaduvm+0x98>
80107219:	8b 55 0c             	mov    0xc(%ebp),%edx
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
8010721c:	31 c9                	xor    %ecx,%ecx
8010721e:	8b 45 08             	mov    0x8(%ebp),%eax
80107221:	01 da                	add    %ebx,%edx
80107223:	e8 98 fb ff ff       	call   80106dc0 <walkpgdir>
80107228:	85 c0                	test   %eax,%eax
8010722a:	74 56                	je     80107282 <loaduvm+0xa2>
    pa = PTE_ADDR(*pte);
8010722c:	8b 00                	mov    (%eax),%eax
      n = PGSIZE;
8010722e:	bf 00 10 00 00       	mov    $0x1000,%edi
80107233:	8b 4d 14             	mov    0x14(%ebp),%ecx
    pa = PTE_ADDR(*pte);
80107236:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      n = PGSIZE;
8010723b:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
80107241:	0f 42 fe             	cmovb  %esi,%edi
    if(readi(ip, P2V(pa), offset+i, n) != n)
80107244:	05 00 00 00 80       	add    $0x80000000,%eax
80107249:	89 44 24 04          	mov    %eax,0x4(%esp)
8010724d:	8b 45 10             	mov    0x10(%ebp),%eax
80107250:	01 d9                	add    %ebx,%ecx
80107252:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80107256:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010725a:	89 04 24             	mov    %eax,(%esp)
8010725d:	e8 2e a7 ff ff       	call   80101990 <readi>
80107262:	39 f8                	cmp    %edi,%eax
80107264:	74 a2                	je     80107208 <loaduvm+0x28>
}
80107266:	83 c4 1c             	add    $0x1c,%esp
      return -1;
80107269:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010726e:	5b                   	pop    %ebx
8010726f:	5e                   	pop    %esi
80107270:	5f                   	pop    %edi
80107271:	5d                   	pop    %ebp
80107272:	c3                   	ret    
80107273:	90                   	nop
80107274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107278:	83 c4 1c             	add    $0x1c,%esp
  return 0;
8010727b:	31 c0                	xor    %eax,%eax
}
8010727d:	5b                   	pop    %ebx
8010727e:	5e                   	pop    %esi
8010727f:	5f                   	pop    %edi
80107280:	5d                   	pop    %ebp
80107281:	c3                   	ret    
      panic("loaduvm: address should exist");
80107282:	c7 04 24 e7 82 10 80 	movl   $0x801082e7,(%esp)
80107289:	e8 d2 90 ff ff       	call   80100360 <panic>
    panic("loaduvm: addr must be page aligned");
8010728e:	c7 04 24 88 83 10 80 	movl   $0x80108388,(%esp)
80107295:	e8 c6 90 ff ff       	call   80100360 <panic>
8010729a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801072a0 <allocuvm>:
{
801072a0:	55                   	push   %ebp
801072a1:	89 e5                	mov    %esp,%ebp
801072a3:	57                   	push   %edi
801072a4:	56                   	push   %esi
801072a5:	53                   	push   %ebx
801072a6:	83 ec 1c             	sub    $0x1c,%esp
801072a9:	8b 7d 10             	mov    0x10(%ebp),%edi
  if(newsz >= KERNBASE)
801072ac:	85 ff                	test   %edi,%edi
801072ae:	0f 88 7e 00 00 00    	js     80107332 <allocuvm+0x92>
  if(newsz < oldsz)
801072b4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
801072b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(newsz < oldsz)
801072ba:	72 78                	jb     80107334 <allocuvm+0x94>
  a = PGROUNDUP(oldsz);
801072bc:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801072c2:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
801072c8:	39 df                	cmp    %ebx,%edi
801072ca:	77 4a                	ja     80107316 <allocuvm+0x76>
801072cc:	eb 72                	jmp    80107340 <allocuvm+0xa0>
801072ce:	66 90                	xchg   %ax,%ax
    memset(mem, 0, PGSIZE);
801072d0:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801072d7:	00 
801072d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801072df:	00 
801072e0:	89 04 24             	mov    %eax,(%esp)
801072e3:	e8 18 d8 ff ff       	call   80104b00 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
801072e8:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801072ee:	b9 00 10 00 00       	mov    $0x1000,%ecx
801072f3:	89 04 24             	mov    %eax,(%esp)
801072f6:	8b 45 08             	mov    0x8(%ebp),%eax
801072f9:	89 da                	mov    %ebx,%edx
801072fb:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80107302:	00 
80107303:	e8 48 fb ff ff       	call   80106e50 <mappages>
80107308:	85 c0                	test   %eax,%eax
8010730a:	78 44                	js     80107350 <allocuvm+0xb0>
  for(; a < newsz; a += PGSIZE){
8010730c:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107312:	39 df                	cmp    %ebx,%edi
80107314:	76 2a                	jbe    80107340 <allocuvm+0xa0>
    mem = kalloc();
80107316:	e8 a5 b1 ff ff       	call   801024c0 <kalloc>
    if(mem == 0){
8010731b:	85 c0                	test   %eax,%eax
    mem = kalloc();
8010731d:	89 c6                	mov    %eax,%esi
    if(mem == 0){
8010731f:	75 af                	jne    801072d0 <allocuvm+0x30>
      cprintf("allocuvm out of memory\n");
80107321:	c7 04 24 05 83 10 80 	movl   $0x80108305,(%esp)
80107328:	e8 23 93 ff ff       	call   80100650 <cprintf>
  if(newsz >= oldsz)
8010732d:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107330:	77 48                	ja     8010737a <allocuvm+0xda>
      return 0;
80107332:	31 c0                	xor    %eax,%eax
}
80107334:	83 c4 1c             	add    $0x1c,%esp
80107337:	5b                   	pop    %ebx
80107338:	5e                   	pop    %esi
80107339:	5f                   	pop    %edi
8010733a:	5d                   	pop    %ebp
8010733b:	c3                   	ret    
8010733c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107340:	83 c4 1c             	add    $0x1c,%esp
80107343:	89 f8                	mov    %edi,%eax
80107345:	5b                   	pop    %ebx
80107346:	5e                   	pop    %esi
80107347:	5f                   	pop    %edi
80107348:	5d                   	pop    %ebp
80107349:	c3                   	ret    
8010734a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80107350:	c7 04 24 1d 83 10 80 	movl   $0x8010831d,(%esp)
80107357:	e8 f4 92 ff ff       	call   80100650 <cprintf>
  if(newsz >= oldsz)
8010735c:	3b 7d 0c             	cmp    0xc(%ebp),%edi
8010735f:	76 0d                	jbe    8010736e <allocuvm+0xce>
80107361:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80107364:	89 fa                	mov    %edi,%edx
80107366:	8b 45 08             	mov    0x8(%ebp),%eax
80107369:	e8 62 fb ff ff       	call   80106ed0 <deallocuvm.part.0>
      kfree(mem);
8010736e:	89 34 24             	mov    %esi,(%esp)
80107371:	e8 aa af ff ff       	call   80102320 <kfree>
      return 0;
80107376:	31 c0                	xor    %eax,%eax
80107378:	eb ba                	jmp    80107334 <allocuvm+0x94>
8010737a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010737d:	89 fa                	mov    %edi,%edx
8010737f:	8b 45 08             	mov    0x8(%ebp),%eax
80107382:	e8 49 fb ff ff       	call   80106ed0 <deallocuvm.part.0>
      return 0;
80107387:	31 c0                	xor    %eax,%eax
80107389:	eb a9                	jmp    80107334 <allocuvm+0x94>
8010738b:	90                   	nop
8010738c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107390 <deallocuvm>:
{
80107390:	55                   	push   %ebp
80107391:	89 e5                	mov    %esp,%ebp
80107393:	8b 55 0c             	mov    0xc(%ebp),%edx
80107396:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107399:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
8010739c:	39 d1                	cmp    %edx,%ecx
8010739e:	73 08                	jae    801073a8 <deallocuvm+0x18>
}
801073a0:	5d                   	pop    %ebp
801073a1:	e9 2a fb ff ff       	jmp    80106ed0 <deallocuvm.part.0>
801073a6:	66 90                	xchg   %ax,%ax
801073a8:	89 d0                	mov    %edx,%eax
801073aa:	5d                   	pop    %ebp
801073ab:	c3                   	ret    
801073ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801073b0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801073b0:	55                   	push   %ebp
801073b1:	89 e5                	mov    %esp,%ebp
801073b3:	56                   	push   %esi
801073b4:	53                   	push   %ebx
801073b5:	83 ec 10             	sub    $0x10,%esp
801073b8:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
801073bb:	85 f6                	test   %esi,%esi
801073bd:	74 59                	je     80107418 <freevm+0x68>
801073bf:	31 c9                	xor    %ecx,%ecx
801073c1:	ba 00 00 00 80       	mov    $0x80000000,%edx
801073c6:	89 f0                	mov    %esi,%eax
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801073c8:	31 db                	xor    %ebx,%ebx
801073ca:	e8 01 fb ff ff       	call   80106ed0 <deallocuvm.part.0>
801073cf:	eb 12                	jmp    801073e3 <freevm+0x33>
801073d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801073d8:	83 c3 01             	add    $0x1,%ebx
801073db:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
801073e1:	74 27                	je     8010740a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
801073e3:	8b 14 9e             	mov    (%esi,%ebx,4),%edx
801073e6:	f6 c2 01             	test   $0x1,%dl
801073e9:	74 ed                	je     801073d8 <freevm+0x28>
      char * v = P2V(PTE_ADDR(pgdir[i]));
801073eb:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(i = 0; i < NPDENTRIES; i++){
801073f1:	83 c3 01             	add    $0x1,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
801073f4:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
801073fa:	89 14 24             	mov    %edx,(%esp)
801073fd:	e8 1e af ff ff       	call   80102320 <kfree>
  for(i = 0; i < NPDENTRIES; i++){
80107402:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
80107408:	75 d9                	jne    801073e3 <freevm+0x33>
    }
  }
  kfree((char*)pgdir);
8010740a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010740d:	83 c4 10             	add    $0x10,%esp
80107410:	5b                   	pop    %ebx
80107411:	5e                   	pop    %esi
80107412:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80107413:	e9 08 af ff ff       	jmp    80102320 <kfree>
    panic("freevm: no pgdir");
80107418:	c7 04 24 39 83 10 80 	movl   $0x80108339,(%esp)
8010741f:	e8 3c 8f ff ff       	call   80100360 <panic>
80107424:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010742a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107430 <setupkvm>:
{
80107430:	55                   	push   %ebp
80107431:	89 e5                	mov    %esp,%ebp
80107433:	56                   	push   %esi
80107434:	53                   	push   %ebx
80107435:	83 ec 10             	sub    $0x10,%esp
  if((pgdir = (pde_t*)kalloc()) == 0)
80107438:	e8 83 b0 ff ff       	call   801024c0 <kalloc>
8010743d:	85 c0                	test   %eax,%eax
8010743f:	89 c6                	mov    %eax,%esi
80107441:	74 6d                	je     801074b0 <setupkvm+0x80>
  memset(pgdir, 0, PGSIZE);
80107443:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010744a:	00 
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010744b:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
  memset(pgdir, 0, PGSIZE);
80107450:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107457:	00 
80107458:	89 04 24             	mov    %eax,(%esp)
8010745b:	e8 a0 d6 ff ff       	call   80104b00 <memset>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80107460:	8b 53 0c             	mov    0xc(%ebx),%edx
80107463:	8b 43 04             	mov    0x4(%ebx),%eax
80107466:	8b 4b 08             	mov    0x8(%ebx),%ecx
80107469:	89 54 24 04          	mov    %edx,0x4(%esp)
8010746d:	8b 13                	mov    (%ebx),%edx
8010746f:	89 04 24             	mov    %eax,(%esp)
80107472:	29 c1                	sub    %eax,%ecx
80107474:	89 f0                	mov    %esi,%eax
80107476:	e8 d5 f9 ff ff       	call   80106e50 <mappages>
8010747b:	85 c0                	test   %eax,%eax
8010747d:	78 19                	js     80107498 <setupkvm+0x68>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
8010747f:	83 c3 10             	add    $0x10,%ebx
80107482:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
80107488:	72 d6                	jb     80107460 <setupkvm+0x30>
8010748a:	89 f0                	mov    %esi,%eax
}
8010748c:	83 c4 10             	add    $0x10,%esp
8010748f:	5b                   	pop    %ebx
80107490:	5e                   	pop    %esi
80107491:	5d                   	pop    %ebp
80107492:	c3                   	ret    
80107493:	90                   	nop
80107494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107498:	89 34 24             	mov    %esi,(%esp)
8010749b:	e8 10 ff ff ff       	call   801073b0 <freevm>
}
801074a0:	83 c4 10             	add    $0x10,%esp
      return 0;
801074a3:	31 c0                	xor    %eax,%eax
}
801074a5:	5b                   	pop    %ebx
801074a6:	5e                   	pop    %esi
801074a7:	5d                   	pop    %ebp
801074a8:	c3                   	ret    
801074a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;
801074b0:	31 c0                	xor    %eax,%eax
801074b2:	eb d8                	jmp    8010748c <setupkvm+0x5c>
801074b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801074ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801074c0 <kvmalloc>:
{
801074c0:	55                   	push   %ebp
801074c1:	89 e5                	mov    %esp,%ebp
801074c3:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
801074c6:	e8 65 ff ff ff       	call   80107430 <setupkvm>
801074cb:	a3 c4 72 11 80       	mov    %eax,0x801172c4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
801074d0:	05 00 00 00 80       	add    $0x80000000,%eax
801074d5:	0f 22 d8             	mov    %eax,%cr3
}
801074d8:	c9                   	leave  
801074d9:	c3                   	ret    
801074da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801074e0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801074e0:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801074e1:	31 c9                	xor    %ecx,%ecx
{
801074e3:	89 e5                	mov    %esp,%ebp
801074e5:	83 ec 18             	sub    $0x18,%esp
  pte = walkpgdir(pgdir, uva, 0);
801074e8:	8b 55 0c             	mov    0xc(%ebp),%edx
801074eb:	8b 45 08             	mov    0x8(%ebp),%eax
801074ee:	e8 cd f8 ff ff       	call   80106dc0 <walkpgdir>
  if(pte == 0)
801074f3:	85 c0                	test   %eax,%eax
801074f5:	74 05                	je     801074fc <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
801074f7:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801074fa:	c9                   	leave  
801074fb:	c3                   	ret    
    panic("clearpteu");
801074fc:	c7 04 24 4a 83 10 80 	movl   $0x8010834a,(%esp)
80107503:	e8 58 8e ff ff       	call   80100360 <panic>
80107508:	90                   	nop
80107509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107510 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107510:	55                   	push   %ebp
80107511:	89 e5                	mov    %esp,%ebp
80107513:	57                   	push   %edi
80107514:	56                   	push   %esi
80107515:	53                   	push   %ebx
80107516:	83 ec 2c             	sub    $0x2c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107519:	e8 12 ff ff ff       	call   80107430 <setupkvm>
8010751e:	85 c0                	test   %eax,%eax
80107520:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107523:	0f 84 b9 00 00 00    	je     801075e2 <copyuvm+0xd2>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107529:	8b 45 0c             	mov    0xc(%ebp),%eax
8010752c:	85 c0                	test   %eax,%eax
8010752e:	0f 84 94 00 00 00    	je     801075c8 <copyuvm+0xb8>
80107534:	31 ff                	xor    %edi,%edi
80107536:	eb 48                	jmp    80107580 <copyuvm+0x70>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107538:	81 c6 00 00 00 80    	add    $0x80000000,%esi
8010753e:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107545:	00 
80107546:	89 74 24 04          	mov    %esi,0x4(%esp)
8010754a:	89 04 24             	mov    %eax,(%esp)
8010754d:	e8 4e d6 ff ff       	call   80104ba0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80107552:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80107555:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010755a:	89 fa                	mov    %edi,%edx
8010755c:	89 44 24 04          	mov    %eax,0x4(%esp)
80107560:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80107566:	89 04 24             	mov    %eax,(%esp)
80107569:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010756c:	e8 df f8 ff ff       	call   80106e50 <mappages>
80107571:	85 c0                	test   %eax,%eax
80107573:	78 63                	js     801075d8 <copyuvm+0xc8>
  for(i = 0; i < sz; i += PGSIZE){
80107575:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010757b:	39 7d 0c             	cmp    %edi,0xc(%ebp)
8010757e:	76 48                	jbe    801075c8 <copyuvm+0xb8>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107580:	8b 45 08             	mov    0x8(%ebp),%eax
80107583:	31 c9                	xor    %ecx,%ecx
80107585:	89 fa                	mov    %edi,%edx
80107587:	e8 34 f8 ff ff       	call   80106dc0 <walkpgdir>
8010758c:	85 c0                	test   %eax,%eax
8010758e:	74 62                	je     801075f2 <copyuvm+0xe2>
    if(!(*pte & PTE_P))
80107590:	8b 00                	mov    (%eax),%eax
80107592:	a8 01                	test   $0x1,%al
80107594:	74 50                	je     801075e6 <copyuvm+0xd6>
    pa = PTE_ADDR(*pte);
80107596:	89 c6                	mov    %eax,%esi
    flags = PTE_FLAGS(*pte);
80107598:	25 ff 0f 00 00       	and    $0xfff,%eax
8010759d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    pa = PTE_ADDR(*pte);
801075a0:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    if((mem = kalloc()) == 0)
801075a6:	e8 15 af ff ff       	call   801024c0 <kalloc>
801075ab:	85 c0                	test   %eax,%eax
801075ad:	89 c3                	mov    %eax,%ebx
801075af:	75 87                	jne    80107538 <copyuvm+0x28>
    }
  }
  return d;

bad:
  freevm(d);
801075b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
801075b4:	89 04 24             	mov    %eax,(%esp)
801075b7:	e8 f4 fd ff ff       	call   801073b0 <freevm>
  return 0;
801075bc:	31 c0                	xor    %eax,%eax
}
801075be:	83 c4 2c             	add    $0x2c,%esp
801075c1:	5b                   	pop    %ebx
801075c2:	5e                   	pop    %esi
801075c3:	5f                   	pop    %edi
801075c4:	5d                   	pop    %ebp
801075c5:	c3                   	ret    
801075c6:	66 90                	xchg   %ax,%ax
801075c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801075cb:	83 c4 2c             	add    $0x2c,%esp
801075ce:	5b                   	pop    %ebx
801075cf:	5e                   	pop    %esi
801075d0:	5f                   	pop    %edi
801075d1:	5d                   	pop    %ebp
801075d2:	c3                   	ret    
801075d3:	90                   	nop
801075d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
801075d8:	89 1c 24             	mov    %ebx,(%esp)
801075db:	e8 40 ad ff ff       	call   80102320 <kfree>
      goto bad;
801075e0:	eb cf                	jmp    801075b1 <copyuvm+0xa1>
    return 0;
801075e2:	31 c0                	xor    %eax,%eax
801075e4:	eb d8                	jmp    801075be <copyuvm+0xae>
      panic("copyuvm: page not present");
801075e6:	c7 04 24 6e 83 10 80 	movl   $0x8010836e,(%esp)
801075ed:	e8 6e 8d ff ff       	call   80100360 <panic>
      panic("copyuvm: pte should exist");
801075f2:	c7 04 24 54 83 10 80 	movl   $0x80108354,(%esp)
801075f9:	e8 62 8d ff ff       	call   80100360 <panic>
801075fe:	66 90                	xchg   %ax,%ax

80107600 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107600:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107601:	31 c9                	xor    %ecx,%ecx
{
80107603:	89 e5                	mov    %esp,%ebp
80107605:	83 ec 08             	sub    $0x8,%esp
  pte = walkpgdir(pgdir, uva, 0);
80107608:	8b 55 0c             	mov    0xc(%ebp),%edx
8010760b:	8b 45 08             	mov    0x8(%ebp),%eax
8010760e:	e8 ad f7 ff ff       	call   80106dc0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107613:	8b 00                	mov    (%eax),%eax
80107615:	89 c2                	mov    %eax,%edx
80107617:	83 e2 05             	and    $0x5,%edx
    return 0;
  if((*pte & PTE_U) == 0)
8010761a:	83 fa 05             	cmp    $0x5,%edx
8010761d:	75 11                	jne    80107630 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
8010761f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107624:	05 00 00 00 80       	add    $0x80000000,%eax
}
80107629:	c9                   	leave  
8010762a:	c3                   	ret    
8010762b:	90                   	nop
8010762c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
80107630:	31 c0                	xor    %eax,%eax
}
80107632:	c9                   	leave  
80107633:	c3                   	ret    
80107634:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010763a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107640 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107640:	55                   	push   %ebp
80107641:	89 e5                	mov    %esp,%ebp
80107643:	57                   	push   %edi
80107644:	56                   	push   %esi
80107645:	53                   	push   %ebx
80107646:	83 ec 1c             	sub    $0x1c,%esp
80107649:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010764c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010764f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107652:	85 db                	test   %ebx,%ebx
80107654:	75 3a                	jne    80107690 <copyout+0x50>
80107656:	eb 68                	jmp    801076c0 <copyout+0x80>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107658:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010765b:	89 f2                	mov    %esi,%edx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
8010765d:	89 7c 24 04          	mov    %edi,0x4(%esp)
    n = PGSIZE - (va - va0);
80107661:	29 ca                	sub    %ecx,%edx
80107663:	81 c2 00 10 00 00    	add    $0x1000,%edx
80107669:	39 da                	cmp    %ebx,%edx
8010766b:	0f 47 d3             	cmova  %ebx,%edx
    memmove(pa0 + (va - va0), buf, n);
8010766e:	29 f1                	sub    %esi,%ecx
80107670:	01 c8                	add    %ecx,%eax
80107672:	89 54 24 08          	mov    %edx,0x8(%esp)
80107676:	89 04 24             	mov    %eax,(%esp)
80107679:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010767c:	e8 1f d5 ff ff       	call   80104ba0 <memmove>
    len -= n;
    buf += n;
80107681:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    va = va0 + PGSIZE;
80107684:	8d 8e 00 10 00 00    	lea    0x1000(%esi),%ecx
    buf += n;
8010768a:	01 d7                	add    %edx,%edi
  while(len > 0){
8010768c:	29 d3                	sub    %edx,%ebx
8010768e:	74 30                	je     801076c0 <copyout+0x80>
    pa0 = uva2ka(pgdir, (char*)va0);
80107690:	8b 45 08             	mov    0x8(%ebp),%eax
    va0 = (uint)PGROUNDDOWN(va);
80107693:	89 ce                	mov    %ecx,%esi
80107695:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
8010769b:	89 74 24 04          	mov    %esi,0x4(%esp)
    va0 = (uint)PGROUNDDOWN(va);
8010769f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
801076a2:	89 04 24             	mov    %eax,(%esp)
801076a5:	e8 56 ff ff ff       	call   80107600 <uva2ka>
    if(pa0 == 0)
801076aa:	85 c0                	test   %eax,%eax
801076ac:	75 aa                	jne    80107658 <copyout+0x18>
  }
  return 0;
}
801076ae:	83 c4 1c             	add    $0x1c,%esp
      return -1;
801076b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801076b6:	5b                   	pop    %ebx
801076b7:	5e                   	pop    %esi
801076b8:	5f                   	pop    %edi
801076b9:	5d                   	pop    %ebp
801076ba:	c3                   	ret    
801076bb:	90                   	nop
801076bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801076c0:	83 c4 1c             	add    $0x1c,%esp
  return 0;
801076c3:	31 c0                	xor    %eax,%eax
}
801076c5:	5b                   	pop    %ebx
801076c6:	5e                   	pop    %esi
801076c7:	5f                   	pop    %edi
801076c8:	5d                   	pop    %ebp
801076c9:	c3                   	ret    
