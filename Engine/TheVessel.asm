		fname	"TheVessel.rom"
	org		$4000
TheVessel:

; GLobals
RomSize: 									equ 8*1024*1024 ;8MB
RomBlockSize8kb:					equ 08*1024	;8KB
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

; Read units of seconds (Block 0, register 0)
;ld  c, 00H
;ld  ix, REDCLK
;call EXTROM
;ld  (SecondsEenheden), a

; Read tens of seconds (Block 0, register 1)
;ld  c, 01H
;ld  ix, REDCLK
;call EXTROM
;ld  (SecondsTientallen), a

; Read units of minutes (Block 0, register 2)
;ld  c, 02H
;ld  ix, REDCLK
;call EXTROM
;ld  (MinutesEenheden), a

; Read tens of minutes (Block 0, register 3)
;ld  c, 03H
;ld  ix, REDCLK
;call EXTROM
;ld  (MinutesTientallen), a

; Read units of hours (Block 0, register 4)
;ld  c, 04H
;ld  ix, REDCLK
;call EXTROM
;ld  (HoursEenheden), a

; Read tens of hours (Block 0, register 5)
;ld  c, 05H
;ld  ix, REDCLK
;call EXTROM
;ld  (HoursTientallen), a

; Read units of day of the month (Block 0, register 7)
ld  c, 07H
ld  ix, REDCLK
call EXTROM
ld  (DayOfMonthEenheden), a

; Read tens of day of the month (Block 0, register 8)
ld  c, 08H
ld  ix, REDCLK
call EXTROM
ld  (DayOfMonthTientallen), a

; Read units of month (Block 0, register 9)
ld  c, 09H
ld  ix, REDCLK
call EXTROM
ld  (MonthEenheden), a

; Read tens of month (Block 0, register 10)
ld  c, 0AH
ld  ix, REDCLK
call EXTROM
ld  (MonthTientallen), a

; Read units of year (Block 0, register 11)
ld  c, 0BH
ld  ix, REDCLK
call EXTROM
ld  (YearEenheden), a

; Read tens of year (Block 0, register 12)
ld  c, 0CH
ld  ix, REDCLK
call EXTROM
ld  (YearTientallen), a







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
; block 00 (8kb) - 01 (8kb) engine 
;	
engine:
phase	engaddr
	include	"engine.asm"	
endengine:
dephase
enlength:	Equ	$-engine
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;The first 8kb blocks can be erased using the ASCII16x sector erase function 
DrillingGameMap01Block:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
DrillingGameMap02Block:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$4000
	DrillingGameMap01Address:
  incbin "..\grapx\drillinggame\maps\map01.map"
	DrillingGameMap01Size:	equ	$-DrillingGameMap01Address
	ds	$7000-$,-1
	DrillingGameMap02Address:
  incbin "..\grapx\drillinggame\maps\map02.map"
	DrillingGameMap02Size:	equ	$-DrillingGameMap02Address
	dephase

DrillingGameMap03Block:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
DrillingGameMap04Block:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$4000
	DrillingGameMap03Address:
  incbin "..\grapx\drillinggame\maps\map03.map"
	DrillingGameMap03Size:	equ	$-DrillingGameMap03Address
	ds	$7000-$,-1
	DrillingGameMap04Address:
  incbin "..\grapx\drillinggame\maps\map04.map"
	DrillingGameMap04Size:	equ	$-DrillingGameMap04Address
	dephase

DrillingGameMap05Block:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$4000
	DrillingGameMap05Address:
  incbin "..\grapx\drillinggame\maps\map05.map"
	DrillingGameMap05Size:	equ	$-DrillingGameMap05Address
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of 16kb block

ArcadeHall1TileMapBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
ArcadeHall2TileMapBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
ArcadeHall2EntityTileMapBlock: 	equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
BiopodTileMapBlock:  						equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
ArcadeHall1TileMap:  						incbin "..\tools\tilemapArcade1.bin"
ArcadeHall2TileMap:  						incbin "..\tools\tilemapArcade2.bin"
ArcadeHall2EntityTileMap:  			incbin "..\tools\tilemapArcade2Entity.bin"
BiopodTileMap:  								incbin "..\tools\tilemapBiopod.bin"
;BiopodTileMap:  								incbin "..\tools\tilemap.bin"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

hydroponicsbayTileMapBlock:  		equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
hangarbayTileMapBlock:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
trainingdeckTileMapBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
reactorchamberTileMapBlock:  		equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
hydroponicsbayTileMap:  				incbin "..\tools\tilemaphydroponicsbay.bin"
hangarbayTileMap:  							incbin "..\tools\tilemaphangarbay.bin"
trainingdeckTileMap:  					incbin "..\tools\tilemaptrainingdeck.bin"
reactorchamberTileMap:  				incbin "..\tools\tilemapreactorchamber.bin"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

sleepingquartersTileMapBlock:  	equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
armoryvaultTileMapBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
holodeckTileMapBlock:  					equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
medicalbayTileMapBlock:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
sleepingquartersTileMap:  			incbin "..\tools\tilemapsleepingquarters.bin"
armoryvaultTileMap:  						incbin "..\tools\tilemaparmoryvault.bin"
holodeckTileMap:  							incbin "..\tools\tilemapholodeck.bin"
medicalbayTileMap:  						incbin "..\tools\tilemapmedicalbay.bin"
;medicalbayTileMap:  						incbin "..\tools\tilemap.bin"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

sciencelabTileMapBlock:  				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
sciencelabTileMap:  						incbin "..\tools\tilemapsciencelab.bin"
;sciencelabTileMap:  						incbin "..\tools\tilemap.bin"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

ArcadeHall1GfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\arcadehall1\arcade1.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;ArcadeHall1redlightsGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
;  incbin "..\grapx\arcadehall1\redlights.SC5",7,022 * 128      ;030 lines
;	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

ArcadeHall2GfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\arcadehall2\arcade2.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

BiopodGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\biopod\Biopod.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

HydroponicsbayGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\hydroponicsbay\hydroponicsbay.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

HangarbayGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\hangarbay\hangarbay.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

trainingdeckGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\trainingdeck\trainingdeck.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

reactorchamberGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\reactorchamber\reactorchamber.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

sleepingquartersGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\sleepingquarters\sleepingquarters.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

armoryvaultGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\armoryvault\armoryvault.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

holodeckGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\holodeck\holodeck.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

medicalbayGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\medicalbay\medicalbay.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

sciencelabGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\sciencelab\sciencelab.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

sciencelabIconsTotalGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\sciencelab\icons\IconsTotal.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

sciencelabIconColonyExpansionGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\sciencelab\icons\icons12.SC5",7,212 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

DrillingGameGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\drillinggame\maps\tileset.SC5",7,212 * 128      ;212 lines
  incbin "..\grapx\drillinggame\maps\tilesetLast44Lines.SC5",7,044 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

DrillingGameHudBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\drillinggame\hud.SC5",7,028 * 128      ;032 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

DrillingLocationsGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\DrillingLocations\DrillingLocations.SC5",7,212 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;  incbin "..\grapx\RacingGame\nightstriker2Prepared.SR5",7,212 * 128      ;98 lines

RacingGameTrackAGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\CurveLeftAnimation\0a.sc5",7,211 * 128      ;98 lines
	ds	128,255
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block


RacingGameTrack1GfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\RoadMSXSize\1a.sc5",7,211 * 128      ;98 lines
	ds	128,255
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameTrack2GfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\RoadMSXSize\1b.sc5",7,211 * 128      ;98 lines
	ds	128,255
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameBackdropGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\RoadMSXSize\backdrop.sc5",7,015 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameRoadCurveRightBlock1:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	ChangedPixels1a2a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels1a2a.bin"
	Addresses1a2a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses1a2a.bin"
	WriteInstructions1a2a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions1a2a.bin"

	ChangedPixels2a3a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels2a3a.bin"
	Addresses2a3a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses2a3a.bin"
	WriteInstructions2a3a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions2a3a.bin"

	ChangedPixels3a4a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels3a4a.bin"
	Addresses3a4a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses3a4a.bin"
	WriteInstructions3a4a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions3a4a.bin"

	ChangedPixels4a5a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels4a5a.bin"
	Addresses4a5a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses4a5a.bin"
	WriteInstructions4a5a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions4a5a.bin"

	ChangedPixels5a6a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels5a6a.bin"
	Addresses5a6a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses5a6a.bin"
	WriteInstructions5a6a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions5a6a.bin"

	ChangedPixels6a7a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels6a7a.bin"
	Addresses6a7a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses6a7a.bin"
	WriteInstructions6a7a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions6a7a.bin"

	ChangedPixels7a8a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels7a8a.bin"
	Addresses7a8a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses7a8a.bin"
	WriteInstructions7a8a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions7a8a.bin"

	ChangedPixels8a9a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels8a9a.bin"
	Addresses8a9a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses8a9a.bin"
	WriteInstructions8a9a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions8a9a.bin"

	ChangedPixels9a10a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels9a10a.bin"
	Addresses9a10a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses9a10a.bin"
	WriteInstructions9a10a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions9a10a.bin"

	ChangedPixels10a11a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels10a11a.bin"
	Addresses10a11a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses10a11a.bin"
	WriteInstructions10a11a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions10a11a.bin"

	ChangedPixels11a12a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels11a12a.bin"
	Addresses11a12a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses11a12a.bin"
	WriteInstructions11a12a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions11a12a.bin"

	ChangedPixels1b2b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels1b2b.bin"
	Addresses1b2b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses1b2b.bin"
	WriteInstructions1b2b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions1b2b.bin"

	ChangedPixels2b3b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels2b3b.bin"
	Addresses2b3b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses2b3b.bin"
	WriteInstructions2b3b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions2b3b.bin"

	ChangedPixels3b4b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels3b4b.bin"
	Addresses3b4b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses3b4b.bin"
	WriteInstructions3b4b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions3b4b.bin"

	ChangedPixels4b5b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels4b5b.bin"
	Addresses4b5b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses4b5b.bin"
	WriteInstructions4b5b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions4b5b.bin"

	ChangedPixels5b6b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels5b6b.bin"
	Addresses5b6b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses5b6b.bin"
	WriteInstructions5b6b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions5b6b.bin"

	ChangedPixels6b7b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels6b7b.bin"
	Addresses6b7b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses6b7b.bin"
	WriteInstructions6b7b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions6b7b.bin"

	ChangedPixels7b8b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels7b8b.bin"
	Addresses7b8b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses7b8b.bin"
	WriteInstructions7b8b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions7b8b.bin"

	dephase	
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameRoadCurveRightBlock2:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	ChangedPixels8b9b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels8b9b.bin"
	Addresses8b9b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses8b9b.bin"
	WriteInstructions8b9b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions8b9b.bin"

	ChangedPixels9b10b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels9b10b.bin"
	Addresses9b10b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses9b10b.bin"
	WriteInstructions9b10b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions9b10b.bin"

	ChangedPixels10b11b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels10b11b.bin"
	Addresses10b11b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses10b11b.bin"
	WriteInstructions10b11b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions10b11b.bin"

	ChangedPixels11b12b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels11b12b.bin"
	Addresses11b12b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses11b12b.bin"
	WriteInstructions11b12b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions11b12b.bin"

	ChangedPixels12a13a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels12a13a.bin"
	Addresses12a13a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses12a13a.bin"
	WriteInstructions12a13a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions12a13a.bin"

	ChangedPixels13a14a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels13a14a.bin"
	Addresses13a14a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses13a14a.bin"
	WriteInstructions13a14a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions13a14a.bin"

	ChangedPixels14a15a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels14a15a.bin"
	Addresses14a15a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses14a15a.bin"
	WriteInstructions14a15a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions14a15a.bin"

	ChangedPixels15a16a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels15a16a.bin"
	Addresses15a16a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses15a16a.bin"
	WriteInstructions15a16a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions15a16a.bin"

	ChangedPixels16a17a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels16a17a.bin"
	Addresses16a17a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses16a17a.bin"
	WriteInstructions16a17a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions16a17a.bin"

	ChangedPixels17a18a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels17a18a.bin"
	Addresses17a18a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses17a18a.bin"
	WriteInstructions17a18a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions17a18a.bin"

	ChangedPixels18a19a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels18a19a.bin"
	Addresses18a19a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses18a19a.bin"
	WriteInstructions18a19a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions18a19a.bin"

	ChangedPixels19a20a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels19a20a.bin"
	Addresses19a20a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses19a20a.bin"
	WriteInstructions19a20a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions19a20a.bin"

	dephase	
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameRoadCurveRightBlock3:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	ChangedPixels20a21a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels20a21a.bin"
	Addresses20a21a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses20a21a.bin"
	WriteInstructions20a21a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions20a21a.bin"

	ChangedPixels21a22a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels21a22a.bin"
	Addresses21a22a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses21a22a.bin"
	WriteInstructions21a22a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions21a22a.bin"

	ChangedPixels22a23a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels22a23a.bin"
	Addresses22a23a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses22a23a.bin"
	WriteInstructions22a23a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions22a23a.bin"

	ChangedPixels12b13b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels12b13b.bin"
	Addresses12b13b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses12b13b.bin"
	WriteInstructions12b13b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions12b13b.bin"

	ChangedPixels13b14b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels13b14b.bin"
	Addresses13b14b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses13b14b.bin"
	WriteInstructions13b14b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions13b14b.bin"

	ChangedPixels14b15b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels14b15b.bin"
	Addresses14b15b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses14b15b.bin"
	WriteInstructions14b15b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions14b15b.bin"

	ChangedPixels15b16b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels15b16b.bin"
	Addresses15b16b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses15b16b.bin"
	WriteInstructions15b16b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions15b16b.bin"

	ChangedPixels16b17b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels16b17b.bin"
	Addresses16b17b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses16b17b.bin"
	WriteInstructions16b17b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions16b17b.bin"

	ChangedPixels17b18b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels17b18b.bin"
	Addresses17b18b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses17b18b.bin"
	WriteInstructions17b18b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions17b18b.bin"

	ChangedPixels18b19b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels18b19b.bin"
	Addresses18b19b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses18b19b.bin"
	WriteInstructions18b19b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions18b19b.bin"

	ChangedPixels19b20b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels19b20b.bin"
	Addresses19b20b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses19b20b.bin"
	WriteInstructions19b20b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions19b20b.bin"

	ChangedPixels20b21b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels20b21b.bin"
	Addresses20b21b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses20b21b.bin"
	WriteInstructions20b21b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions20b21b.bin"

	ChangedPixels21b22b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels21b22b.bin"
	Addresses21b22b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses21b22b.bin"
	WriteInstructions21b22b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions21b22b.bin"

	ChangedPixels22b23b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels22b23b.bin"
	Addresses22b23b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses22b23b.bin"
	WriteInstructions22b23b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions22b23b.bin"

	ChangedPixels23a22a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels23a22a.bin"
	Addresses23a22a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses23a22a.bin"
	WriteInstructions23a22a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions23a22a.bin"

	dephase	
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block









RacingGameRoadCurveRightBlock4:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000

	ChangedPixels22a21a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels22a21a.bin"
	Addresses22a21a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses22a21a.bin"
	WriteInstructions22a21a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions22a21a.bin"

	ChangedPixels21a20a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels21a20a.bin"
	Addresses21a20a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses21a20a.bin"
	WriteInstructions21a20a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions21a20a.bin"

	ChangedPixels20a19a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels20a19a.bin"
	Addresses20a19a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses20a19a.bin"
	WriteInstructions20a19a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions20a19a.bin"

	ChangedPixels19a18a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels19a18a.bin"
	Addresses19a18a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses19a18a.bin"
	WriteInstructions19a18a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions19a18a.bin"

	ChangedPixels18a17a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels18a17a.bin"
	Addresses18a17a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses18a17a.bin"
	WriteInstructions18a17a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions18a17a.bin"

	ChangedPixels17a16a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels17a16a.bin"
	Addresses17a16a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses17a16a.bin"
	WriteInstructions17a16a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions17a16a.bin"

	ChangedPixels16a15a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels16a15a.bin"
	Addresses16a15a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses16a15a.bin"
	WriteInstructions16a15a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions16a15a.bin"

	ChangedPixels15a14a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels15a14a.bin"
	Addresses15a14a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses15a14a.bin"
	WriteInstructions15a14a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions15a14a.bin"

	ChangedPixels14a13a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels14a13a.bin"
	Addresses14a13a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses14a13a.bin"
	WriteInstructions14a13a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions14a13a.bin"

	ChangedPixels13a12a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels13a12a.bin"
	Addresses13a12a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses13a12a.bin"
	WriteInstructions13a12a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions13a12a.bin"

	ChangedPixels12a11a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels12a11a.bin"
	Addresses12a11a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses12a11a.bin"
	WriteInstructions12a11a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions12a11a.bin"

	dephase	
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block









RacingGameRoadCurveRightBlock5:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000

	ChangedPixels11a10a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels11a10a.bin"
	Addresses11a10a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses11a10a.bin"
	WriteInstructions11a10a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions11a10a.bin"

	ChangedPixels10a9a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels10a9a.bin"
	Addresses10a9a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses10a9a.bin"
	WriteInstructions10a9a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions10a9a.bin"

	ChangedPixels9a8a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels9a8a.bin"
	Addresses9a8a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses9a8a.bin"
	WriteInstructions9a8a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions9a8a.bin"

	ChangedPixels8a7a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels8a7a.bin"
	Addresses8a7a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses8a7a.bin"
	WriteInstructions8a7a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions8a7a.bin"

	ChangedPixels7a6a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels7a6a.bin"
	Addresses7a6a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses7a6a.bin"
	WriteInstructions7a6a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions7a6a.bin"

	ChangedPixels6a5a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels6a5a.bin"
	Addresses6a5a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses6a5a.bin"
	WriteInstructions6a5a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions6a5a.bin"

	ChangedPixels5a4a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels5a4a.bin"
	Addresses5a4a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses5a4a.bin"
	WriteInstructions5a4a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions5a4a.bin"

	ChangedPixels4a3a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels4a3a.bin"
	Addresses4a3a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses4a3a.bin"
	WriteInstructions4a3a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions4a3a.bin"

	ChangedPixels3a2a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels3a2a.bin"
	Addresses3a2a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses3a2a.bin"
	WriteInstructions3a2a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions3a2a.bin"

	ChangedPixels2a1a:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels2a1a.bin"
	Addresses2a1a:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses2a1a.bin"
	WriteInstructions2a1a:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions2a1a.bin"

	ChangedPixels23b22b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels23b22b.bin"
	Addresses23b22b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses23b22b.bin"
	WriteInstructions23b22b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions23b22b.bin"

	ChangedPixels22b21b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels22b21b.bin"
	Addresses22b21b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses22b21b.bin"
	WriteInstructions22b21b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions22b21b.bin"

	ChangedPixels21b20b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels21b20b.bin"
	Addresses21b20b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses21b20b.bin"
	WriteInstructions21b20b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions21b20b.bin"

	ChangedPixels20b19b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels20b19b.bin"
	Addresses20b19b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses20b19b.bin"
	WriteInstructions20b19b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions20b19b.bin"

	ChangedPixels19b18b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels19b18b.bin"
	Addresses19b18b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses19b18b.bin"
	WriteInstructions19b18b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions19b18b.bin"

	ChangedPixels18b17b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels18b17b.bin"
	Addresses18b17b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses18b17b.bin"
	WriteInstructions18b17b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions18b17b.bin"

	ChangedPixels17b16b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels17b16b.bin"
	Addresses17b16b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses17b16b.bin"
	WriteInstructions17b16b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions17b16b.bin"

	dephase	
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block







RacingGameRoadCurveRightBlock6:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000

	ChangedPixels16b15b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels16b15b.bin"
	Addresses16b15b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses16b15b.bin"
	WriteInstructions16b15b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions16b15b.bin"

	ChangedPixels15b14b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels15b14b.bin"
	Addresses15b14b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses15b14b.bin"
	WriteInstructions15b14b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions15b14b.bin"

	ChangedPixels14b13b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels14b13b.bin"
	Addresses14b13b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses14b13b.bin"
	WriteInstructions14b13b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions14b13b.bin"

	ChangedPixels13b12b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels13b12b.bin"
	Addresses13b12b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses13b12b.bin"
	WriteInstructions13b12b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions13b12b.bin"

	ChangedPixels12b11b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels12b11b.bin"
	Addresses12b11b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses12b11b.bin"
	WriteInstructions12b11b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions12b11b.bin"

	ChangedPixels11b10b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels11b10b.bin"
	Addresses11b10b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses11b10b.bin"
	WriteInstructions11b10b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions11b10b.bin"

	ChangedPixels10b9b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels10b9b.bin"
	Addresses10b9b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses10b9b.bin"
	WriteInstructions10b9b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions10b9b.bin"

	ChangedPixels9b8b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels9b8b.bin"
	Addresses9b8b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses9b8b.bin"
	WriteInstructions9b8b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions9b8b.bin"

	ChangedPixels8b7b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels8b7b.bin"
	Addresses8b7b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses8b7b.bin"
	WriteInstructions8b7b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions8b7b.bin"

	ChangedPixels7b6b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels7b6b.bin"
	Addresses7b6b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses7b6b.bin"
	WriteInstructions7b6b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions7b6b.bin"

	ChangedPixels6b5b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels6b5b.bin"
	Addresses6b5b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses6b5b.bin"
	WriteInstructions6b5b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions6b5b.bin"

	ChangedPixels5b4b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels5b4b.bin"
	Addresses5b4b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses5b4b.bin"
	WriteInstructions5b4b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions5b4b.bin"

	ChangedPixels4b3b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels4b3b.bin"
	Addresses4b3b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses4b3b.bin"
	WriteInstructions4b3b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions4b3b.bin"

	ChangedPixels3b2b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels3b2b.bin"
	Addresses3b2b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses3b2b.bin"
	WriteInstructions3b2b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions3b2b.bin"

	ChangedPixels2b1b:
	incbin "..\grapx\RacingGame\RoadMsxSize\changedpixels2b1b.bin"
	Addresses2b1b:
	incbin "..\grapx\RacingGame\RoadMsxSize\addresses2b1b.bin"
	WriteInstructions2b1b:
	incbin "..\grapx\RacingGame\RoadMsxSize\writeinstructions2b1b.bin"

	dephase	
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block













PinPointIconGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\DrillingLocations\PinPointIcon.SC5",7,070 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

ResourceOffloadPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\hangarbay\resourceoffload.SC5",7,099 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

UpgradeMenuGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\ship\sciencelab\UpgradeMenu2.SC5",7,212 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

OpenDoorGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\arcadehall1\opendoor.SC5",7,083 * 128      ;097 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

EntityTableGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\arcadehall2\EntityTable.SC5",7,019 * 128      ;097 lines
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

AIPortraitGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\characters\AI\portraittotal.SC5",7,102 * 128      ;212 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

NPCConv1Block:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$4000
	include "NPCConv1.asm" 
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

FontBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\fonts\font.SC5",7,039 * 128      ;039 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

FontUpgradeMenuBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\fonts\fontUpgradeMenuThick.SC5",7,039 * 128      ;039 lines
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

;the vessel gettingup
TheVesselgettingupframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\Vesselgettingup.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
TheVesselgettingupspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\Vesselgettingup.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;host
Hostframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\host.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
Hostspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\host.dat"
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

;entity
entityframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\entity.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
entityspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\entity.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;biopod
biopodframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\biopod.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
biopodspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\biopod.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;hydroponicsbay
hydroponicsbayframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\hydroponicsbay.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
hydroponicsbayspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\hydroponicsbay.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;hangarbay
hangarbayframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\hangarbay.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
hangarbayspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\hangarbay.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;trainingdeck
trainingdeckframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\trainingdeck.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
trainingdeckspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\trainingdeck.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;reactorchamber
reactorchamberframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\reactorchamber.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
reactorchamberspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\reactorchamber.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;armoryvault
armoryvaultframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\armoryvault.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
armoryvaultspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\armoryvault.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;medicalbay
medicalbayframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\medicalbay.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
medicalbayspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\medicalbay.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;holodeck
holodeckframelistblock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									phase	$8000
									include "..\tools\holodeck.asm" 
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block
									dephase
holodeckspritedatablock:			equ ($-RomStartAddress) and (romsize-1) /RomBlockSize
									incbin "..\tools\holodeck.dat"
									DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;movement routines
MovementRoutinesBlock:	equ ($-RomStartAddress) and (romsize-1) /RomBlockSize ;$04
								include "MovementRoutines.asm"  
								DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

;movement routines2
MovementRoutines2Block:	equ ($-RomStartAddress) and (romsize-1) /RomBlockSize ;$04
								include "MovementRoutines2.asm"  
								DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block


TheVesselrepBlock:				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	incbin "msxlegends.rep"
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

endRom:
	ds		(RomSize-1) - endRom,$ff
