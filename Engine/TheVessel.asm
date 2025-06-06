		fname	"TheVessel.rom"
	org		$4000
TheVessel:

; GLobals
RomSize: 									equ 8*1024*1024 ;8MB
RomBlockSize:							equ 16*1024	;16KB
RomStartAddress:					equ $4000

;
; TheVessel - ROM version

	dw		"AB",init,0,0,0,0,0,0,"ASCII16X"
;
; this is one-time only... can be overwritten with game stuff after it's done
;
memInit:	
	phase	$c000
;

initMem:	
	call	whereAmI	; Slot of this ROM
	ld		(romSlot),a
	ld		hl,$0000
	call	findRam		; Slot of RAM in page 0
	ld		(page0ram),a
	ld		hl,$4000
	call	findRam		; Slot of RAM in page 1
	ld		(page1ram),a
	ld		hl,$8000
	call	findRam		; Slot of RAM in page 2
	ld		(page2ram),a
	
	;ld	a,(page2ram)
	and		$03
	add		a,a
	add		a,a
	ld		b,a
	ld		a,(page1ram)
	and		$03
	or		b
	add		a,a
	add		a,a
	ld		b,a
	ld		a,(page0ram)
	and		$03
	or		b
	ld		b,a
	call	$138
	and		$c0
	or		b
	ld		b,a
	ld		(slot.ram),a
	
	and		$f3
	ld		c,a
	ld		a,(romSlot)
	and		$03
	add		a,a
	add		a,a
	or		c
	ld		(slot.page1rom),a
	
	ld		a,b
	and		$cf
	ld		c,a
	ld		a,(romSlot)
	and		$03
	add		a,a
	add		a,a
	add		a,a
	add		a,a
	or		c
	ld		(slot.page2rom),a
	
	ld		a,b
	and		$c3
	ld		c,a
	ld		a,(romSlot)
	and		$03
	ld		b,a
	add		a,a
	add		a,a
	or		b
	add		a,a
	add		a,a
	or		c
	ld		(slot.page12rom),a
	
	; The engine only does primary slot selection via I/O port $a8.
 	; To still support having the game ROM and/or RAM in subslots,
 	; it pre-sets the subslot for RAM and ROM in the secondary slot
 	; register by enabling them once through the BIOS, which will
 	; set up the secondary slot register appropriately.
 	; Note: The game ROM and RAM can not be in the same primary slot.
 	ld		a,(page2ram)
 	ld		h,$80  ; pre-set RAM secondary slot register in page 2
 	call	$24
 	
	ld		a,(romSlot)
	ld		h,$80
	call	$24
	
	ld		a,(page1ram)
	ld		h,$40
	call	$24
	
	ld		a,(romSlot)
	ld		h,$40
	call	$24
	
	ld		b,3
	ld		de,.enaRam
	ld		hl,$3ffd
	push	hl
.ramOn:		
	push	bc
	push	de
	push	hl
	ld		a,(de)
	ld		e,a
	ld		a,(page0ram)
	call	$14
	pop		hl
	pop		de
	pop		bc
	inc		de
	inc		hl
	djnz	.ramOn
	ld		a,(page0ram)
	push	af
	pop		iy
	pop		ix
	ld		(tempStack),sp
	jp		$1c

.done:		
	ld		sp,(tempStack)
	ret

.enaRam:	
	jp		.done

searchSlot:		db	0
searchAddress:	dw	0
tempStack:		dw	0
page0ram:		db	0
page1ram:		db	0
page2ram:		db	0
romSlot:		db	0
;
; Out: A = slot of this ROM (E000SSPP)
;
whereAmI:	
	call	$138
	rrca
	rrca
	and		$03
	ld		c,a
	ld		b,0
	ld		hl,$fcc1
	add		hl,bc
	or		(hl)
	ld		c,a
	inc		hl
	inc		hl
	inc		hl
	inc		hl
	ld		a,(hl)
	and		$0c
	or		c
	ret
;
; In: HL = Address in page to search RAM
; Out: A = RAM slot of the page
;
findRam:	
	ld		bc,4 *256+ 0
	ld		(searchAddress),hl
	ld		hl,$fcc1
.primary.loop:	
	push	bc
	push	hl
	ld		a,(hl)
	bit		7,a
	jr		nz,.secondary
	ld		a,c
	call	.check
.primary.next:	
	pop		hl
	pop		bc
	ld		a,(searchSlot)
	ret		c
	inc		hl
	inc		c
	djnz	.primary.loop
	ld		a,-1			; should normally never occur
	ld		(searchSlot),a
	ret

.secondary:	
	and		$80
	or		c
	ld		b,4
.sec.loop:	
	push	bc
	call	.check
	pop		bc
	jr		c,.primary.next
	add		a,4
	djnz	.sec.loop
	jr		.primary.next

.check:		
	ld		(searchSlot),a
	call	.read
	ld		b,a
	cpl
	ld		c,a
	call	.write
	call	.read
	cp		c
	jr		nz,.noram
	cpl
	call	.write
	call	.read
	cp		b
	jr		nz,.noram
	ld		a,(searchSlot)
	scf
	ret
.noram:		
	ld		a,(searchSlot)
	or		a
	ret

.read:		
	push	bc
	push	hl
	ld		a,(searchSlot)
	ld		hl,(searchAddress)
	call	$0c
	pop		hl
	pop		bc
	ret

.write:		
	push	bc
	push	hl
	ld		e,a
	ld		a,(searchSlot)
	ld		hl,(searchAddress)
	call	$14
	pop		hl
	pop		bc
	ret

initMem.length:	equ	$-initMem
		dephase
;
; end of one-time only code...
;

;
init:
;Bootkey
  ld a,(0FBE5H + 6)
  bit 5,a
  ret z

  ld    a,15        ;set color 15 to be foreground, background and border color
	ld		($f3e9),a	  ;foreground color 
	ld		($f3ea),a	  ;background color 
	ld		($f3eb),a	  ;border color

  ld    a,15        ;start write to palette color 15
  di
	out		($99),a
	ld		a,16+128
	out		($99),a
	xor		a
	out		($9a),a
  ei
	out		($9a),a

	ld 		a,5			    ;switch to screen 5
	call 	$5f

  ld    a,($180)    ;$c3 = turbo on
  ld    (TurboOn?),a

EXTROM:	equ	0015fh
REDCLK:	equ	001f5h

	ld	c,$7		; C = block number (bits 5-4) and register (bits 3-0).
	ld	ix,REDCLK
	call	EXTROM  ;block 0, register 7 (eenheden day of month)
	ld    (DayOfMonthEenheden),a

	ld	c,$8		; C = block number (bits 5-4) and register (bits 3-0).
	ld	ix,REDCLK
	call	EXTROM  ;block 0, register 8 (tientallen day of month)
	ld    (DayOfMonthTientallen),a

	ld	c,$9		; C = block number (bits 5-4) and register (bits 3-0).
	ld	ix,REDCLK
	call	EXTROM  ;block 0, register 9 (eenheden month)
	ld    (MonthEenheden),a

	ld	c,$a		; C = block number (bits 5-4) and register (bits 3-0).
	ld	ix,REDCLK
	call	EXTROM  ;block 0, register 10 (tientallen month)
	ld    (MonthTientallen),a

	ld	c,$b		; C = block number (bits 5-4) and register (bits 3-0).
	ld	ix,REDCLK
	call	EXTROM  ;block 0, register 11 (eenheden jaar)
	ld    (YearEenheden),a

	ld	c,$c		; C = block number (bits 5-4) and register (bits 3-0).
	ld	ix,REDCLK
	call	EXTROM  ;block 0, register 12 (tientallen jaar)
	ld    (YearTientallen),a

;  ld    a,%1000 0001
;  ld		ix,$180     ;CHGCPU: A = LED 0 0 0 0 0 x x | ;%000 0000 = Z80 (ROM) mode, %0000 0001 = R800 ROM  mode, %0000 0010 = R800 DRAM mode
;  call	$15F

;  ld		ix,$183     ;GETCPU: Returns current CPU mode, Output   : A = 0 0 0 0 0 0 x x                           
;  call	$15F
;  ld		(CPUMode),a ;%000 0000 = Z80 (ROM) mode, %0000 0001 = R800 ROM  mode, %0000 0010 = R800 DRAM mode

  ld		a,($2d)			;3=turbo r, 2=msx2+, 1=msx2, 0=msx1
  ld		(ComputerID),a

;let's copy the copies of the vdp registers to our addresses of choice
  ld    hl,$F3DF
  ld    de,VDP_0
  ld    bc,8
  ldir

  ld    hl,$FFE7
  ld    de,VDP_8
  ld    bc,30
  ldir
;/let's copy the copies of the vdp registers to our addresses of choice
  ld    sp,$ff00
;/then we can set our stack pointer a bit higher, reserving more free space in page 3

	ld		a,(VDP_8+1)	
	and		%1111 1101	;set 60 hertz
	or		%1000 0000	;screen height 212
	ld		(VDP_8+1),a
	di
	out		($99),a
	ld		a,9+128
	ei
	out		($99),a

;screenmode transparancy (i think this is about usage of color 0 in sprites)
	ld		a,(vdp_8)
	or		32				  ;transparant mode off
;	and		223				  ;tranparant mode on
	ld		(vdp_8),a
	di
	out		($99),a
	ld		a,8+128
	ei
	out		($99),a

  xor   a
	ld		(vdp_8+15),a
	di
	out		($99),a
	ld		a,23+128
	ei
	out		($99),a

	di
	im		1
	ld		bc,initMem.length
	ld		de,initMem
	ld		hl,memInit
	ldir
	call	initMem

  xor   a     ;init blocks ascii16
	ld		(memblocks.1),a
	ld		($6000),a
	inc		a
	ld		(memblocks.2),a
	ld		($7000),a

; load BIOS / engine , load startup
	ld		hl,tempisr
	ld		de,$38
	ld		bc,6
	ldir

;SpriteInitialize:
	ld		a,(vdp_0+1)
	or		2			;sprites 16*16
	ld		(vdp_0+1),a
	di
	out		($99),a
	ld		a,1+128
	ei
	out		($99),a
;/SpriteInitialize:

	ld		hl,engine
	ld		de,engaddr
	ld		bc,enlength	        ;load engine
	ldir

	ld		hl,enginepage3 ;+ (WorldPointer-$c000)
	ld		de,enginepage3addr ;+ (WorldPointer-$c000)
	ld		bc,enginepage3length ;- (WorldPointer-$c000)	    ;load enginepage3
	ldir

if MusicOn?
  call  VGMRePlay
  call  LoadSamplesAndPlaySong0
endif

  jp    InitiateGame

		; set temp ISR
tempisr:	
	push	af
	in		a,($99)             ;check and acknowledge vblank int (ei0 is set)
	pop		af
	ei	
	ret

; 
; block 00
;	
enginepage3:
	include	"enginepage3.asm"	

; 
; block 00 - 01 engine 
;	
engine:
phase	engaddr
	include	"engine.asm"	
endengine:
dephase
enlength:	Equ	$-engine
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

ArcadeHallGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\arcadehall\arcade1.SC5",7,212 * 128      ;212 lines
;  incbin "..\grapx\arcadehall\arcade2.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

GirlPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\characters\girl\portraittotal.SC5",7,102 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

TheVesselPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\characters\thevessel\portraittotal.SC5",7,102 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

redheadboyPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\characters\redheadboy\portraittotal.SC5",7,102 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

capgirlPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\characters\capgirl\portraittotal.SC5",7,102 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

hostPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\characters\host\portraittotal.SC5",7,102 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

soldierPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\characters\soldier\portraittotal.SC5",7,102 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block


NPCConv1Block:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$4000
	include "NPCConv1.asm" 
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

FontBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\fonts\font.SC5",7,039 * 128      ;039 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;the vessel right
TheVesselrightframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\Vesselright.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
TheVesselrightspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\Vesselright.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;the vessel left
TheVesselleftframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\Vesselleft.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
TheVesselleftspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\Vesselleft.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;host
Hostframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\..\Usas2\grapx\test\host.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
Hostspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\..\Usas2\grapx\test\host.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;npcs
npcsframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\npcs.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
npcsspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\npcs.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

MovementRoutinesBlock:	equ ($-RomStartAddress) and (romsize-1) /RomBlockSize ;$04
								include "MovementRoutines.asm"  
								DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

TheVesselrepBlock:				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	incbin "msxlegends.rep"
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

endRom:
	ds		(RomSize-1) - endRom,$ff
