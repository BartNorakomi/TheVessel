Fastest:


LenghtXYData:
  ;x, y   (x/2+000 or x/2+128 (for the next line))   (y/2 + write access)
db  6+2,     050/2+000,050/2 or 64,             119,119,119,119,119,119,            3+2,     100/2+000,100/2 or 64,          119,119,119,         2 ;(2=end)

VideoReplayer2:
  xor   a
	out   ($99),a               ;write page instellen (0=page 0 from y=0 to 127, 1=page 0 from y=128 to 255, 2=page 1 from y=0 to 127 etc..)
	ld    a,14+128
	out   ($99),a

  ld    hl,LenghtXYData
  ld    d,$99                 ;port for writing to registers
  ld    e,$98                 ;port for writing data to vram

  .loop:
  ld    b,(hl)                ;amount of bytes to write +2, because the 2 outi's will decrease this value by 2 (if this amount is 2, the double outi will return zflag and end the replayer
  inc   hl
  ld    c,d                   ;port for writing to registers
  outi                        ;write x
  outi                        ;write y
  ret   z                     ;if amount of bytes to write = 2 this is a signal to end the replayer
  ld    c,e                   ;port for writing data to vram
  otir
  jp    .loop






pointertoLenghtAAndData:
  ;amount of bytes to write, data,                     amount of bytes to write, data
db  6,											119,119,119,119,119,119,    3                       , 119,119,119,      128
pointertoXY:
  ;x, y   (x/2+000 or x/2+128 (for the next line))   (y/2 + write access)
db  050/2+000,050/2 or 64,        100/2+000,100/2 or 64

VideoReplayer:
  xor   a
	out   ($99),a               ;write page instellen (0=page 0 from y=0 to 127, 1=page 0 from y=128 to 255, 2=page 1 from y=0 to 127 etc..)
	ld    a,14+128
	out   ($99),a

  ld    hl,pointertoLenghtAAndData
	ld    c,$98                 ;outport (used to write data to vram with otir)
  exx
  ld    hl,pointertoXY
	ld    c,$99                 ;outport (used to write to registers)
  .loop:
  outi                        ;write x (17)
  outi                        ;write y
  exx
  ld    b,(hl)                ;amount of bytes to write
  bit   7,b                   ;bit 7=end of file
  ret   nz                    ;6 (if not met), 12 (if met)
  inc   hl
  otir
  exx
  jp    .loop





;address bits, amount of bytes to write, data
000,000,				6,											000,000,000,000,000,000

Version1:
  ld    hl,pointertodata
	ld    c,$98
  .loop:
;27
  ld    a,(hl)                ;x (8)
	out   ($99),a               ;set x to write to (12)
  inc   hl                    ;7

;27
  ld    a,(hl)                ;y
	out   ($99),a               ;set y to write to
  inc   hl

  ld    b,(hl)                ;amount of bytes to write
  bit   7,b                   ;bit 7=end of file
  jr    nz,.end
  inc   hl
  otir
  jp    .loop
  .end:



Version2:
  ld    hl,pointertodata
  .loop:
;8
	ld    c,$99                 ;8
;17
  outi                        ;write x (17)
;17
  outi                        ;write y

  ld    b,(hl)                ;amount of bytes to write
  bit   7,b                   ;bit 7=end of file
  jr    nz,.end
;8
	ld    c,$98
  inc   hl
  otir
  jp    .loop
  .end:


pointertoLenghtAAndData:
;amount of bytes to write, data,                     amount of bytes to write, data
6,											000,000,000,000,000,000,    3                       , 000,000,000
pointertoXY:
;address bits, address bits, address bits, address bits
000,000,        000,000,      000,000,      000,000

Version3:
  ld    hl,pointertoLenghtAAndData
	ld    c,$98                 ;outport (used to write data to vram with otir)
  exx
  ld    hl,pointertoXY
	ld    c,$99                 ;outport (used to write to registers)
  .loop:
  outi                        ;write x (17)
  outi                        ;write y
  exx
  ld    b,(hl)                ;amount of bytes to write
  bit   7,b                   ;bit 7=end of file
  ret   nz                    ;6 (if not met), 12 (if met)
  inc   hl
  otir
  jp    .loop




example of writing data to an address:
  xor   a
	out   ($99),a               ;write page instellen (0=page 0 from y=0 to 127, 1=page 0 from y=128 to 255, 2=page 1 from y=0 to 127 etc..)
	ld    a,14+128
	out   ($99),a

	ld    c,$98

;100,1
  ld    a,100/2+128           ;x/2+000 or x/2+128 (for the next line)
	out   ($99),a               ;set x to write to
	ld    a,000/2 or 64         ;y/2 + write access
	out   ($99),a               ;set y to write to

;100,72
  ld    a,100/2+000           ;x/2+000 or x/2+128 (for the next line)
	out   ($99),a               ;set x to write to
	ld    a,072/2 or 64         ;y/2 + write access
	out   ($99),a               ;set y to write to

  ld    hl,holodeckEventRoutine
  ld    b,50  
  otir





set address code from usas2:
;ALERT, THIS WRITE TO R#14 IS REQUIRED IN THE SF2 ENGINE !!! 

;SetVdp_Write address for Sprite Character
		di
;THIS CAN BE REMOVED IF WE ADD THE SELFMODIFYING CALL TO PutPlayerspriteSF2Engine
		ld    a,$05
		out   ($99),a       ;set bits 15-17
		ld    a,14+128
		out   ($99),a       ;/first set register 14 (actually this only needs to be done once)
		ld    a,$80
		nop
;THIS CAN BE REMOVED IF WE ADD THE SELFMODIFYING CALL TO PutPlayerspriteSF2Engine

;Sprite Character table and it's mirror table start at  $17000 and $17800
;Sprite color table and it's mirror table start at      $16c00 and $17400

	out   ($99),a       ;set bits 0-7
SelfmodifyingCodePlayerCharAddress: equ $+1
		ld    a,$73         ;$73 / $7b (
		ld		c,$98         ;port to write to, and replace the nop wait time instruction required
		out   ($99),a       ;set bits 8-14 + write access
		call	outix128    ;4 sprites (4 * 32 = 128 bytes)
		ei



ghostwriterP code to put object:

putplayer_noclip:
	ld    a,b ;(bc)		;object.X
	add   a,(hl)		;add frameOffset for first line to destination x
	inc   hl
	sub   a,moveplayerleftinscreen
	ld    e,a

	call	SkipFrameBytes

  ;if screenpage=0 then blit in page 1
  ;if screenpage=1 then blit in page 2
  ;if screenpage=2 then blit in page 3
  ;if screenpage=3 then blit in page 0
	ld    a,(screenpage)
	inc   a
	and   3
	add   a,a
	bit   7,d
	jp    z,.setpage
	inc   a
.setpage:
	ld    (blitpage),a
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	srl   d                     ;write addres is de/2
	rr    e
	set   6,d                   ;set write access

;Transfer pixel array to screen
	ld    (spatpointer),sp  
	ld    sp,hl

	ld    a,e
	ld    c,$98
.loop:
	out   ($99),a               ;set x to write to
	ld    a,d
	out   ($99),a               ;set y to write to

	pop   hl                    ;  
	ld    b,h                   ;numPix
	ld    a,l                   ;totalLength (numpix+whitespace)
	pop   hl                    ;pop array address
	otir
	or    a						;is there more?
	jr    z,.exit

	add   a,e                   ;To next array
	ld    e,a                   ;new x
	jr    nc,.loop
	inc   d                     ;0100 0000
	jp    p,.loop

	set   6,d
	res   7,d

	ld    a,(blitpage)
	xor   1
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	ld    a,e
	jp    .loop

.exit:
  ld    (ObjectFrame),sp     ;store end of this slice (when will be the start of the next slice)
	ld    sp,(spatpointer)
	ret

example of sprite:

DW	0x067F,base+0x0000 - 06: this mean $06 bytes to write, 7F: $7f increase bytes for next array, base+0x0000: address in rom where the 6 bytes of data are found



;SF2object
host_0_0:	; Frame 0, Slice 0
DB	36,75,109,25,125 ;w,h,x,y,o
DW	0x067F,base+0x0000
DW	0x087F,base+0x0006
DW	0x0A7F,base+0x000E
DW	0x0D80,base+0x0018
DW	0x0D7F,base+0x0025
...
DW	0x0500,base+0x0000       I think the (00) here means no more data, end of object: DW	0x05(00),base+0x0000

