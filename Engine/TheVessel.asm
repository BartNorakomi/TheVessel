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




RacingGameLevelProgressScreenGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\LevelProgressScreen.sc5",7,212 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameTitleScreenGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\TitleScreen.sc5",7,212 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameTrackStraightPage0GfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\TrackStraightPage0.sc5",7,211 * 128      ;98 lines
	ds	128,255
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameTrackStraightPage1GfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\TrackStraightPage1.sc5",7,211 * 128      ;98 lines
	ds	128,255
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameBackdropGfxBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
  incbin "..\grapx\RacingGame\RoadMSXSize\backdrop.sc5",7,015 * 128      ;98 lines
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameGirl1PonySpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RacingGameGirl1PonyMiniSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	Girl1PonySpritesCharacters:
	include "..\grapx\racinggame\sprites\Girl1Pony\Girl1Pony.tgs.gen"
	Girl1PonySpriteColors:	
	include "..\grapx\racinggame\sprites\Girl1Pony\Girl1Pony.tcs.gen"

	Girl1PonyMiniSpritesCharacters:
	include "..\grapx\racinggame\sprites\Girl1Pony\Girl1PonyMiniSprite.tgs.gen"
	Girl1PonyMiniSpriteColors:	
	include "..\grapx\racinggame\sprites\Girl1Pony\Girl1PonyMiniSprite.tcs.gen"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameRedHeadBoySpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RacingGameRedHeadBoyMiniSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	RedHeadBoySpritesCharacters:
	include "..\grapx\racinggame\sprites\RedHeadBoy\RedHeadBoy.tgs.gen"
	RedHeadBoySpriteColors:	
	include "..\grapx\racinggame\sprites\RedHeadBoy\RedHeadBoy.tcs.gen"

	RedHeadBoyMiniSpritesCharacters:
	include "..\grapx\racinggame\sprites\RedHeadBoy\RedHeadBoyMiniSprite.tgs.gen"
	RedHeadBoyMiniSpriteColors:	
	include "..\grapx\racinggame\sprites\RedHeadBoy\RedHeadBoyMiniSprite.tcs.gen"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameWolfSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RacingGameWolfMiniSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	WolfSpritesCharacters:
	include "..\grapx\racinggame\sprites\Wolf\Wolf.tgs.gen"
	WolfSpriteColors:	
	include "..\grapx\racinggame\sprites\Wolf\Wolf.tcs.gen"

	WolfMiniSpritesCharacters:
	include "..\grapx\racinggame\sprites\Wolf\WolfMiniSprite.tgs.gen"
	WolfMiniSpriteColors:	
	include "..\grapx\racinggame\sprites\Wolf\WolfMiniSprite.tcs.gen"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameAlienSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RacingGameAlienMiniSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	AlienSpritesCharacters:
	include "..\grapx\racinggame\sprites\Alien\Alien.tgs.gen"
	AlienSpriteColors:	
	include "..\grapx\racinggame\sprites\Alien\Alien.tcs.gen"

	AlienMiniSpritesCharacters:
	include "..\grapx\racinggame\sprites\Alien\AlienMiniSprite.tgs.gen"
	AlienMiniSpriteColors:	
	include "..\grapx\racinggame\sprites\Alien\AlienMiniSprite.tcs.gen"

;$2200 free = 

;	AlienTurnRightAndLeftCharacters:
;	include "..\grapx\racinggame\sprites\Alien\AlienTurnRightAndLeft.tgs.gen"
;	AlienTurnRightAndLeftColors:	
;	include "..\grapx\racinggame\sprites\Alien\AlienTurnRightAndLeft.tcs.gen"

	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameCapBoySpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RacingGameCapBoyMiniSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	CapBoySpritesCharacters:
	include "..\grapx\racinggame\sprites\CapBoy\CapBoy.tgs.gen"
	CapBoySpriteColors:	
	include "..\grapx\racinggame\sprites\CapBoy\CapBoy.tcs.gen"

	CapBoyMiniSpritesCharacters:
	include "..\grapx\racinggame\sprites\CapBoy\CapBoyMiniSprite.tgs.gen"
	CapBoyMiniSpriteColors:	
	include "..\grapx\racinggame\sprites\CapBoy\CapBoyMiniSprite.tcs.gen"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameYellowJacketBoySpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RacingGameYellowJacketBoyMiniSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	YellowJacketBoySpritesCharacters:
	include "..\grapx\racinggame\sprites\YellowJacketBoy\YellowJacketBoy.tgs.gen"
	YellowJacketBoySpriteColors:	
	include "..\grapx\racinggame\sprites\YellowJacketBoy\YellowJacketBoy.tcs.gen"

	YellowJacketBoyMiniSpritesCharacters:
	include "..\grapx\racinggame\sprites\YellowJacketBoy\YellowJacketBoyMiniSprite.tgs.gen"
	YellowJacketBoyMiniSpriteColors:	
	include "..\grapx\racinggame\sprites\YellowJacketBoy\YellowJacketBoyMiniSprite.tcs.gen"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameHeartSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	HeartSpritesCharacters:
	include "..\grapx\racinggame\sprites\Heart\Heart.tgs.gen"
	HeartSpriteColors:	
	include "..\grapx\racinggame\sprites\Heart\Heart.tcs.gen"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RacingGameFlag1SpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RacingGameFlag1MiniSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	Flag1SpritesCharacters:
	include "..\grapx\racinggame\sprites\Flag\Flag1.tgs.gen"
	Flag1SpriteColors:	
	include "..\grapx\racinggame\sprites\Flag\Flag1.tcs.gen"

	Flag1MiniSpritesCharacters:
;	include "..\grapx\racinggame\sprites\Flag\Flag1MiniSprite.tgs.gen"
	Flag1MiniSpriteColors:	
;	include "..\grapx\racinggame\sprites\Flag\Flag1MiniSprite.tcs.gen"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block



RacingGamePlayerSpritesBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	PlayerSpritesCharacters:
	include "..\grapx\racinggame\sprites\Player\Player.tgs.gen"
	PlayerSpriteColors:	
	include "..\grapx\racinggame\sprites\Player\Player.tcs.gen"

	PlayerPart2SpritesCharacters:
	include "..\grapx\racinggame\sprites\Player\PlayerPart2.tgs.gen"
	PlayerPart2SpriteColors:	
	include "..\grapx\racinggame\sprites\Player\PlayerPart2.tcs.gen"

	PlayerFallDownSpritesCharacters:
	include "..\grapx\racinggame\sprites\Player\PlayerFallDown.tgs.gen"
	PlayerFallDownSpriteColors:	
	include "..\grapx\racinggame\sprites\Player\PlayerFallDown.tcs.gen"

  ;offset character, color
SpriteOffSetsTableSlowSpeed: 
dw  PlayerSpritesCharacters+00*320,PlayerSpriteColors+00*160
dw  PlayerSpritesCharacters+01*320,PlayerSpriteColors+01*160
dw  PlayerSpritesCharacters+02*320,PlayerSpriteColors+02*160
dw  PlayerSpritesCharacters+03*320,PlayerSpriteColors+03*160
dw  PlayerSpritesCharacters+04*320,PlayerSpriteColors+04*160
dw  PlayerSpritesCharacters+05*320,PlayerSpriteColors+05*160
dw  PlayerSpritesCharacters+06*320,PlayerSpriteColors+06*160
dw  PlayerSpritesCharacters+07*320,PlayerSpriteColors+07*160
dw  PlayerSpritesCharacters+08*320,PlayerSpriteColors+08*160
dw  PlayerSpritesCharacters+09*320,PlayerSpriteColors+09*160
dw  PlayerSpritesCharacters+10*320,PlayerSpriteColors+10*160
dw  PlayerSpritesCharacters+11*320,PlayerSpriteColors+11*160
dw  PlayerSpritesCharacters+12*320,PlayerSpriteColors+12*160
dw  PlayerSpritesCharacters+13*320,PlayerSpriteColors+13*160
dw  PlayerSpritesCharacters+14*320,PlayerSpriteColors+14*160
dw  PlayerSpritesCharacters+15*320,PlayerSpriteColors+15*160
dw  PlayerSpritesCharacters+16*320,PlayerSpriteColors+16*160
dw  PlayerSpritesCharacters+17*320,PlayerSpriteColors+17*160
dw  PlayerSpritesCharacters+18*320,PlayerSpriteColors+18*160
dw  PlayerSpritesCharacters+19*320,PlayerSpriteColors+19*160
dw  PlayerSpritesCharacters+20*320,PlayerSpriteColors+20*160

  ;offset character, color
SpriteOffSetsTableMediumSpeed: 
dw  PlayerSpritesCharacters+01*320,PlayerSpriteColors+01*160
dw  PlayerSpritesCharacters+01*320,PlayerSpriteColors+01*160
dw  PlayerSpritesCharacters+02*320,PlayerSpriteColors+02*160
dw  PlayerSpritesCharacters+03*320,PlayerSpriteColors+03*160
dw  PlayerSpritesCharacters+04*320,PlayerSpriteColors+04*160
dw  PlayerSpritesCharacters+05*320,PlayerSpriteColors+05*160
dw  PlayerSpritesCharacters+06*320,PlayerSpriteColors+06*160
dw  PlayerSpritesCharacters+07*320,PlayerSpriteColors+07*160
dw  PlayerSpritesCharacters+08*320,PlayerSpriteColors+08*160
dw  PlayerSpritesCharacters+09*320,PlayerSpriteColors+09*160
dw  PlayerSpritesCharacters+10*320,PlayerSpriteColors+10*160
dw  PlayerSpritesCharacters+11*320,PlayerSpriteColors+11*160
dw  PlayerSpritesCharacters+12*320,PlayerSpriteColors+12*160
dw  PlayerSpritesCharacters+13*320,PlayerSpriteColors+13*160
dw  PlayerSpritesCharacters+14*320,PlayerSpriteColors+14*160
dw  PlayerSpritesCharacters+15*320,PlayerSpriteColors+15*160
dw  PlayerSpritesCharacters+16*320,PlayerSpriteColors+16*160
dw  PlayerSpritesCharacters+17*320,PlayerSpriteColors+17*160
dw  PlayerSpritesCharacters+18*320,PlayerSpriteColors+18*160
dw  PlayerSpritesCharacters+19*320,PlayerSpriteColors+19*160
dw  PlayerSpritesCharacters+19*320,PlayerSpriteColors+19*160

  ;offset character, color
SpriteOffSetsTableMaxSpeed: 
dw  PlayerSpritesCharacters+02*320,PlayerSpriteColors+02*160
dw  PlayerSpritesCharacters+02*320,PlayerSpriteColors+02*160
dw  PlayerSpritesCharacters+02*320,PlayerSpriteColors+02*160
dw  PlayerSpritesCharacters+03*320,PlayerSpriteColors+03*160
dw  PlayerSpritesCharacters+04*320,PlayerSpriteColors+04*160
dw  PlayerSpritesCharacters+05*320,PlayerSpriteColors+05*160
dw  PlayerSpritesCharacters+06*320,PlayerSpriteColors+06*160
dw  PlayerSpritesCharacters+07*320,PlayerSpriteColors+07*160
dw  PlayerSpritesCharacters+08*320,PlayerSpriteColors+08*160
dw  PlayerSpritesCharacters+09*320,PlayerSpriteColors+09*160
dw  PlayerSpritesCharacters+10*320,PlayerSpriteColors+10*160
dw  PlayerSpritesCharacters+11*320,PlayerSpriteColors+11*160
dw  PlayerSpritesCharacters+12*320,PlayerSpriteColors+12*160
dw  PlayerSpritesCharacters+13*320,PlayerSpriteColors+13*160
dw  PlayerSpritesCharacters+14*320,PlayerSpriteColors+14*160
dw  PlayerSpritesCharacters+15*320,PlayerSpriteColors+15*160
dw  PlayerSpritesCharacters+16*320,PlayerSpriteColors+16*160
dw  PlayerSpritesCharacters+17*320,PlayerSpriteColors+17*160
dw  PlayerSpritesCharacters+18*320,PlayerSpriteColors+18*160
dw  PlayerSpritesCharacters+18*320,PlayerSpriteColors+18*160
dw  PlayerSpritesCharacters+18*320,PlayerSpriteColors+18*160

WheelAnimated:
  ;offset character, color
.SpriteOffSetsTableSlowSpeed:
dw  PlayerPart2SpritesCharacters+00*320,PlayerPart2SpriteColors+00*160
dw  PlayerPart2SpritesCharacters+01*320,PlayerPart2SpriteColors+01*160
dw  PlayerPart2SpritesCharacters+02*320,PlayerPart2SpriteColors+02*160
dw  PlayerSpritesCharacters+03*320,PlayerSpriteColors+03*160
dw  PlayerSpritesCharacters+04*320,PlayerSpriteColors+04*160
dw  PlayerSpritesCharacters+05*320,PlayerSpriteColors+05*160
dw  PlayerSpritesCharacters+06*320,PlayerSpriteColors+06*160
dw  PlayerSpritesCharacters+07*320,PlayerSpriteColors+07*160
dw  PlayerSpritesCharacters+08*320,PlayerSpriteColors+08*160
dw  PlayerSpritesCharacters+09*320,PlayerSpriteColors+09*160
dw  PlayerPart2SpritesCharacters+03*320,PlayerPart2SpriteColors+03*160
dw  PlayerSpritesCharacters+11*320,PlayerSpriteColors+11*160
dw  PlayerSpritesCharacters+12*320,PlayerSpriteColors+12*160
dw  PlayerSpritesCharacters+13*320,PlayerSpriteColors+13*160
dw  PlayerSpritesCharacters+14*320,PlayerSpriteColors+14*160
dw  PlayerSpritesCharacters+15*320,PlayerSpriteColors+15*160
dw  PlayerSpritesCharacters+16*320,PlayerSpriteColors+16*160
dw  PlayerSpritesCharacters+17*320,PlayerSpriteColors+17*160
dw  PlayerPart2SpritesCharacters+04*320,PlayerPart2SpriteColors+04*160
dw  PlayerPart2SpritesCharacters+05*320,PlayerPart2SpriteColors+05*160
dw  PlayerPart2SpritesCharacters+06*320,PlayerPart2SpriteColors+06*160

  ;offset character, color
.SpriteOffSetsTableMediumSpeed: 
dw  PlayerPart2SpritesCharacters+01*320,PlayerPart2SpriteColors+01*160
dw  PlayerPart2SpritesCharacters+01*320,PlayerPart2SpriteColors+01*160
dw  PlayerPart2SpritesCharacters+02*320,PlayerPart2SpriteColors+02*160
dw  PlayerSpritesCharacters+03*320,PlayerSpriteColors+03*160
dw  PlayerSpritesCharacters+04*320,PlayerSpriteColors+04*160
dw  PlayerSpritesCharacters+05*320,PlayerSpriteColors+05*160
dw  PlayerSpritesCharacters+06*320,PlayerSpriteColors+06*160
dw  PlayerSpritesCharacters+07*320,PlayerSpriteColors+07*160
dw  PlayerSpritesCharacters+08*320,PlayerSpriteColors+08*160
dw  PlayerSpritesCharacters+09*320,PlayerSpriteColors+09*160
dw  PlayerPart2SpritesCharacters+03*320,PlayerPart2SpriteColors+03*160
dw  PlayerSpritesCharacters+11*320,PlayerSpriteColors+11*160
dw  PlayerSpritesCharacters+12*320,PlayerSpriteColors+12*160
dw  PlayerSpritesCharacters+13*320,PlayerSpriteColors+13*160
dw  PlayerSpritesCharacters+14*320,PlayerSpriteColors+14*160
dw  PlayerSpritesCharacters+15*320,PlayerSpriteColors+15*160
dw  PlayerSpritesCharacters+16*320,PlayerSpriteColors+16*160
dw  PlayerSpritesCharacters+17*320,PlayerSpriteColors+17*160
dw  PlayerPart2SpritesCharacters+04*320,PlayerPart2SpriteColors+04*160
dw  PlayerPart2SpritesCharacters+05*320,PlayerPart2SpriteColors+05*160
dw  PlayerPart2SpritesCharacters+05*320,PlayerPart2SpriteColors+05*160

  ;offset character, color
.SpriteOffSetsTableMaxSpeed: 
dw  PlayerPart2SpritesCharacters+02*320,PlayerPart2SpriteColors+02*160
dw  PlayerPart2SpritesCharacters+02*320,PlayerPart2SpriteColors+02*160
dw  PlayerPart2SpritesCharacters+02*320,PlayerPart2SpriteColors+02*160
dw  PlayerSpritesCharacters+03*320,PlayerSpriteColors+03*160
dw  PlayerSpritesCharacters+04*320,PlayerSpriteColors+04*160
dw  PlayerSpritesCharacters+05*320,PlayerSpriteColors+05*160
dw  PlayerSpritesCharacters+06*320,PlayerSpriteColors+06*160
dw  PlayerSpritesCharacters+07*320,PlayerSpriteColors+07*160
dw  PlayerSpritesCharacters+08*320,PlayerSpriteColors+08*160
dw  PlayerSpritesCharacters+09*320,PlayerSpriteColors+09*160
dw  PlayerPart2SpritesCharacters+03*320,PlayerPart2SpriteColors+03*160
dw  PlayerSpritesCharacters+11*320,PlayerSpriteColors+11*160
dw  PlayerSpritesCharacters+12*320,PlayerSpriteColors+12*160
dw  PlayerSpritesCharacters+13*320,PlayerSpriteColors+13*160
dw  PlayerSpritesCharacters+14*320,PlayerSpriteColors+14*160
dw  PlayerSpritesCharacters+15*320,PlayerSpriteColors+15*160
dw  PlayerSpritesCharacters+16*320,PlayerSpriteColors+16*160
dw  PlayerSpritesCharacters+17*320,PlayerSpriteColors+17*160
dw  PlayerPart2SpritesCharacters+04*320,PlayerPart2SpriteColors+04*160
dw  PlayerPart2SpritesCharacters+04*320,PlayerPart2SpriteColors+04*160
dw  PlayerPart2SpritesCharacters+04*320,PlayerPart2SpriteColors+04*160
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveUpPerspectiveYTableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveUpPerspectiveYTablePointer:
dw CurveUpPerspectiveYTable0,CurveUpPerspectiveYTable1,CurveUpPerspectiveYTable2,CurveUpPerspectiveYTable3,CurveUpPerspectiveYTable4,CurveUpPerspectiveYTable5,CurveUpPerspectiveYTable6,CurveUpPerspectiveYTable7,CurveUpPerspectiveYTable8,CurveUpPerspectiveYTable9,CurveUpPerspectiveYTable10,CurveUpPerspectiveYTable11,CurveUpPerspectiveYTable12,CurveUpPerspectiveYTable13,CurveUpPerspectiveYTable14,CurveUpPerspectiveYTable15,CurveUpPerspectiveYTable16,CurveUpPerspectiveYTable17,CurveUpPerspectiveYTable18,CurveUpPerspectiveYTable19,CurveUpPerspectiveYTable20,CurveUpPerspectiveYTable21,CurveUpPerspectiveYTable22,CurveUpPerspectiveYTable23,CurveUpPerspectiveYTable24,CurveUpPerspectiveYTable25,CurveUpPerspectiveYTable26,CurveUpPerspectiveYTable27,CurveUpPerspectiveYTable28,CurveUpPerspectiveYTable29,CurveUpPerspectiveYTable30,CurveUpPerspectiveYTable31,CurveUpPerspectiveYTable32,CurveUpPerspectiveYTable33,CurveUpPerspectiveYTable34,CurveUpPerspectiveYTable35,CurveUpPerspectiveYTable36,CurveUpPerspectiveYTable37,CurveUpPerspectiveYTable38,CurveUpPerspectiveYTable39,CurveUpPerspectiveYTable40,CurveUpPerspectiveYTable41,CurveUpPerspectiveYTable42,CurveUpPerspectiveYTable43,CurveUpPerspectiveYTable44,CurveUpPerspectiveYTable45,CurveUpPerspectiveYTable46,CurveUpPerspectiveYTable47,CurveUpPerspectiveYTable48,CurveUpPerspectiveYTable49,CurveUpPerspectiveYTable50,CurveUpPerspectiveYTable51,CurveUpPerspectiveYTable52,CurveUpPerspectiveYTable53,CurveUpPerspectiveYTable54,CurveUpPerspectiveYTable55,CurveUpPerspectiveYTable56,CurveUpPerspectiveYTable57,CurveUpPerspectiveYTable58,CurveUpPerspectiveYTable59
  CurveUpPerspectiveYTable0:
  CurveUpPerspectiveYTable1:
  include "..\grapx\racinggame\CurveUpAnimationPage1\1.asm"
  CurveUpPerspectiveYTable2:
  CurveUpPerspectiveYTable3:
  include "..\grapx\racinggame\CurveUpAnimationPage1\3.asm"
  CurveUpPerspectiveYTable4:
  CurveUpPerspectiveYTable5:
  include "..\grapx\racinggame\CurveUpAnimationPage1\5.asm"
  CurveUpPerspectiveYTable6:
  CurveUpPerspectiveYTable7:
  include "..\grapx\racinggame\CurveUpAnimationPage1\7.asm"
  CurveUpPerspectiveYTable8:
  CurveUpPerspectiveYTable9:
  include "..\grapx\racinggame\CurveUpAnimationPage1\9.asm"
  CurveUpPerspectiveYTable10:
  CurveUpPerspectiveYTable11:
  include "..\grapx\racinggame\CurveUpAnimationPage1\11.asm"
  CurveUpPerspectiveYTable12:
  CurveUpPerspectiveYTable13:
  include "..\grapx\racinggame\CurveUpAnimationPage1\13.asm"
  CurveUpPerspectiveYTable14:
  CurveUpPerspectiveYTable15:
  include "..\grapx\racinggame\CurveUpAnimationPage1\15.asm"
  CurveUpPerspectiveYTable16:
  CurveUpPerspectiveYTable17:
  include "..\grapx\racinggame\CurveUpAnimationPage1\17.asm"
  CurveUpPerspectiveYTable18:
  CurveUpPerspectiveYTable19:
  include "..\grapx\racinggame\CurveUpAnimationPage1\19.asm"
  CurveUpPerspectiveYTable20:
  CurveUpPerspectiveYTable21:
  include "..\grapx\racinggame\CurveUpAnimationPage1\21.asm"
  CurveUpPerspectiveYTable22:
  CurveUpPerspectiveYTable23:
  include "..\grapx\racinggame\CurveUpAnimationPage1\23.asm"
  CurveUpPerspectiveYTable24:
  CurveUpPerspectiveYTable25:
  include "..\grapx\racinggame\CurveUpAnimationPage1\25.asm"
  CurveUpPerspectiveYTable26:
  CurveUpPerspectiveYTable27:
  include "..\grapx\racinggame\CurveUpAnimationPage1\27.asm"
  CurveUpPerspectiveYTable28:
  CurveUpPerspectiveYTable29:
  include "..\grapx\racinggame\CurveUpAnimationPage1\29.asm"
  CurveUpPerspectiveYTable30:
  CurveUpPerspectiveYTable31:
  include "..\grapx\racinggame\CurveUpAnimationPage1\31.asm"
  CurveUpPerspectiveYTable32:
  CurveUpPerspectiveYTable33:
  include "..\grapx\racinggame\CurveUpAnimationPage1\33.asm"
  CurveUpPerspectiveYTable34:
  CurveUpPerspectiveYTable35:
  include "..\grapx\racinggame\CurveUpAnimationPage1\35.asm"
  CurveUpPerspectiveYTable36:
  CurveUpPerspectiveYTable37:
  include "..\grapx\racinggame\CurveUpAnimationPage1\37.asm"
  CurveUpPerspectiveYTable38:
  CurveUpPerspectiveYTable39:
  include "..\grapx\racinggame\CurveUpAnimationPage1\39.asm"
  CurveUpPerspectiveYTable40:
  CurveUpPerspectiveYTable41:
  include "..\grapx\racinggame\CurveUpAnimationPage1\41.asm"
  CurveUpPerspectiveYTable42:
  CurveUpPerspectiveYTable43:
  include "..\grapx\racinggame\CurveUpAnimationPage1\43.asm"
  CurveUpPerspectiveYTable44:
  CurveUpPerspectiveYTable45:
  include "..\grapx\racinggame\CurveUpAnimationPage1\45.asm"
  CurveUpPerspectiveYTable46:
  CurveUpPerspectiveYTable47:
  include "..\grapx\racinggame\CurveUpAnimationPage1\47.asm"
  CurveUpPerspectiveYTable48:
  CurveUpPerspectiveYTable49:
  include "..\grapx\racinggame\CurveUpAnimationPage1\49.asm"
  CurveUpPerspectiveYTable50:
  CurveUpPerspectiveYTable51:
  include "..\grapx\racinggame\CurveUpAnimationPage1\51.asm"
  CurveUpPerspectiveYTable52:
  CurveUpPerspectiveYTable53:
  include "..\grapx\racinggame\CurveUpAnimationPage1\53.asm"
  CurveUpPerspectiveYTable54:
  CurveUpPerspectiveYTable55:
  include "..\grapx\racinggame\CurveUpAnimationPage1\55.asm"
  CurveUpPerspectiveYTable56:
  CurveUpPerspectiveYTable57:
  include "..\grapx\racinggame\CurveUpAnimationPage1\57.asm"
  CurveUpPerspectiveYTable58:
  CurveUpPerspectiveYTable59:
  include "..\grapx\racinggame\CurveUpAnimationPage1\59.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveDownPerspectiveYTableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveDownPerspectiveYTablePointer:
dw CurveDownPerspectiveYTable0,CurveDownPerspectiveYTable1,CurveDownPerspectiveYTable2,CurveDownPerspectiveYTable3,CurveDownPerspectiveYTable4,CurveDownPerspectiveYTable5,CurveDownPerspectiveYTable6,CurveDownPerspectiveYTable7,CurveDownPerspectiveYTable8,CurveDownPerspectiveYTable9,CurveDownPerspectiveYTable10,CurveDownPerspectiveYTable11,CurveDownPerspectiveYTable12,CurveDownPerspectiveYTable13,CurveDownPerspectiveYTable14,CurveDownPerspectiveYTable15,CurveDownPerspectiveYTable16,CurveDownPerspectiveYTable17,CurveDownPerspectiveYTable18,CurveDownPerspectiveYTable19,CurveDownPerspectiveYTable20,CurveDownPerspectiveYTable21,CurveDownPerspectiveYTable22,CurveDownPerspectiveYTable23,CurveDownPerspectiveYTable24,CurveDownPerspectiveYTable25,CurveDownPerspectiveYTable26,CurveDownPerspectiveYTable27,CurveDownPerspectiveYTable28,CurveDownPerspectiveYTable29,CurveDownPerspectiveYTable30,CurveDownPerspectiveYTable31,CurveDownPerspectiveYTable32,CurveDownPerspectiveYTable33,CurveDownPerspectiveYTable34,CurveDownPerspectiveYTable35,CurveDownPerspectiveYTable36,CurveDownPerspectiveYTable37,CurveDownPerspectiveYTable38,CurveDownPerspectiveYTable39,CurveDownPerspectiveYTable40,CurveDownPerspectiveYTable41,CurveDownPerspectiveYTable42,CurveDownPerspectiveYTable43,CurveDownPerspectiveYTable44,CurveDownPerspectiveYTable45,CurveDownPerspectiveYTable46,CurveDownPerspectiveYTable47,CurveDownPerspectiveYTable48,CurveDownPerspectiveYTable49,CurveDownPerspectiveYTable50,CurveDownPerspectiveYTable51,CurveDownPerspectiveYTable52,CurveDownPerspectiveYTable53,CurveDownPerspectiveYTable54,CurveDownPerspectiveYTable55,CurveDownPerspectiveYTable56,CurveDownPerspectiveYTable57,CurveDownPerspectiveYTable58,CurveDownPerspectiveYTable59
  CurveDownPerspectiveYTable0:
  CurveDownPerspectiveYTable1:
  include "..\grapx\racinggame\CurveDownAnimationPage1\1.asm"
  CurveDownPerspectiveYTable2:
  CurveDownPerspectiveYTable3:
  include "..\grapx\racinggame\CurveDownAnimationPage1\3.asm"
  CurveDownPerspectiveYTable4:
  CurveDownPerspectiveYTable5:
  include "..\grapx\racinggame\CurveDownAnimationPage1\5.asm"
  CurveDownPerspectiveYTable6:
  CurveDownPerspectiveYTable7:
  include "..\grapx\racinggame\CurveDownAnimationPage1\7.asm"
  CurveDownPerspectiveYTable8:
  CurveDownPerspectiveYTable9:
  include "..\grapx\racinggame\CurveDownAnimationPage1\9.asm"
  CurveDownPerspectiveYTable10:
  CurveDownPerspectiveYTable11:
  include "..\grapx\racinggame\CurveDownAnimationPage1\11.asm"
  CurveDownPerspectiveYTable12:
  CurveDownPerspectiveYTable13:
  include "..\grapx\racinggame\CurveDownAnimationPage1\13.asm"
  CurveDownPerspectiveYTable14:
  CurveDownPerspectiveYTable15:
  include "..\grapx\racinggame\CurveDownAnimationPage1\15.asm"
  CurveDownPerspectiveYTable16:
  CurveDownPerspectiveYTable17:
  include "..\grapx\racinggame\CurveDownAnimationPage1\17.asm"
  CurveDownPerspectiveYTable18:
  CurveDownPerspectiveYTable19:
  include "..\grapx\racinggame\CurveDownAnimationPage1\19.asm"
  CurveDownPerspectiveYTable20:
  CurveDownPerspectiveYTable21:
  include "..\grapx\racinggame\CurveDownAnimationPage1\21.asm"
  CurveDownPerspectiveYTable22:
  CurveDownPerspectiveYTable23:
  include "..\grapx\racinggame\CurveDownAnimationPage1\23.asm"
  CurveDownPerspectiveYTable24:
  CurveDownPerspectiveYTable25:
  include "..\grapx\racinggame\CurveDownAnimationPage1\25.asm"
  CurveDownPerspectiveYTable26:
  CurveDownPerspectiveYTable27:
  include "..\grapx\racinggame\CurveDownAnimationPage1\27.asm"
  CurveDownPerspectiveYTable28:
  CurveDownPerspectiveYTable29:
  include "..\grapx\racinggame\CurveDownAnimationPage1\29.asm"
  CurveDownPerspectiveYTable30:
  CurveDownPerspectiveYTable31:
  include "..\grapx\racinggame\CurveDownAnimationPage1\31.asm"
  CurveDownPerspectiveYTable32:
  CurveDownPerspectiveYTable33:
  include "..\grapx\racinggame\CurveDownAnimationPage1\33.asm"
  CurveDownPerspectiveYTable34:
  CurveDownPerspectiveYTable35:
  include "..\grapx\racinggame\CurveDownAnimationPage1\35.asm"
  CurveDownPerspectiveYTable36:
  CurveDownPerspectiveYTable37:
  include "..\grapx\racinggame\CurveDownAnimationPage1\37.asm"
  CurveDownPerspectiveYTable38:
  CurveDownPerspectiveYTable39:
  include "..\grapx\racinggame\CurveDownAnimationPage1\39.asm"
  CurveDownPerspectiveYTable40:
  CurveDownPerspectiveYTable41:
  include "..\grapx\racinggame\CurveDownAnimationPage1\41.asm"
  CurveDownPerspectiveYTable42:
  CurveDownPerspectiveYTable43:
  include "..\grapx\racinggame\CurveDownAnimationPage1\43.asm"
  CurveDownPerspectiveYTable44:
  CurveDownPerspectiveYTable45:
  include "..\grapx\racinggame\CurveDownAnimationPage1\45.asm"
  CurveDownPerspectiveYTable46:
  CurveDownPerspectiveYTable47:
  include "..\grapx\racinggame\CurveDownAnimationPage1\47.asm"
  CurveDownPerspectiveYTable48:
  CurveDownPerspectiveYTable49:
  include "..\grapx\racinggame\CurveDownAnimationPage1\49.asm"
  CurveDownPerspectiveYTable50:
  CurveDownPerspectiveYTable51:
  include "..\grapx\racinggame\CurveDownAnimationPage1\51.asm"
  CurveDownPerspectiveYTable52:
  CurveDownPerspectiveYTable53:
  include "..\grapx\racinggame\CurveDownAnimationPage1\53.asm"
  CurveDownPerspectiveYTable54:
  CurveDownPerspectiveYTable55:
  include "..\grapx\racinggame\CurveDownAnimationPage1\55.asm"
  CurveDownPerspectiveYTable56:
  CurveDownPerspectiveYTable57:
  include "..\grapx\racinggame\CurveDownAnimationPage1\57.asm"
  CurveDownPerspectiveYTable58:
  CurveDownPerspectiveYTable59:
  include "..\grapx\racinggame\CurveDownAnimationPage1\59.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveUpPerspectiveXTableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveUpPerspectiveXTablePointer:
dw CurveUpPerspectiveXTable0,CurveUpPerspectiveXTable1,CurveUpPerspectiveXTable2,CurveUpPerspectiveXTable3,CurveUpPerspectiveXTable4,CurveUpPerspectiveXTable5,CurveUpPerspectiveXTable6,CurveUpPerspectiveXTable7,CurveUpPerspectiveXTable8,CurveUpPerspectiveXTable9,CurveUpPerspectiveXTable10,CurveUpPerspectiveXTable11,CurveUpPerspectiveXTable12,CurveUpPerspectiveXTable13,CurveUpPerspectiveXTable14,CurveUpPerspectiveXTable15,CurveUpPerspectiveXTable16,CurveUpPerspectiveXTable17,CurveUpPerspectiveXTable18,CurveUpPerspectiveXTable19,CurveUpPerspectiveXTable20,CurveUpPerspectiveXTable21,CurveUpPerspectiveXTable22,CurveUpPerspectiveXTable23,CurveUpPerspectiveXTable24,CurveUpPerspectiveXTable25,CurveUpPerspectiveXTable26,CurveUpPerspectiveXTable27,CurveUpPerspectiveXTable28,CurveUpPerspectiveXTable29,CurveUpPerspectiveXTable30,CurveUpPerspectiveXTable31,CurveUpPerspectiveXTable32,CurveUpPerspectiveXTable33,CurveUpPerspectiveXTable34,CurveUpPerspectiveXTable35,CurveUpPerspectiveXTable36,CurveUpPerspectiveXTable37,CurveUpPerspectiveXTable38,CurveUpPerspectiveXTable39,CurveUpPerspectiveXTable40,CurveUpPerspectiveXTable41,CurveUpPerspectiveXTable42,CurveUpPerspectiveXTable43,CurveUpPerspectiveXTable44,CurveUpPerspectiveXTable45,CurveUpPerspectiveXTable46,CurveUpPerspectiveXTable47,CurveUpPerspectiveXTable48,CurveUpPerspectiveXTable49,CurveUpPerspectiveXTable50,CurveUpPerspectiveXTable51,CurveUpPerspectiveXTable52,CurveUpPerspectiveXTable53,CurveUpPerspectiveXTable54,CurveUpPerspectiveXTable55,CurveUpPerspectiveXTable56,CurveUpPerspectiveXTable57,CurveUpPerspectiveXTable58,CurveUpPerspectiveXTable59
CurveUpPerspectiveXTable0:
CurveUpPerspectiveXTable1:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\0.asm"
CurveUpPerspectiveXTable2:
CurveUpPerspectiveXTable3:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\3.asm"
CurveUpPerspectiveXTable4:
CurveUpPerspectiveXTable5:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\5.asm"
CurveUpPerspectiveXTable6:
CurveUpPerspectiveXTable7:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\7.asm"
CurveUpPerspectiveXTable8:
CurveUpPerspectiveXTable9:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\9.asm"
CurveUpPerspectiveXTable10:
CurveUpPerspectiveXTable11:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\11.asm"
CurveUpPerspectiveXTable12:
CurveUpPerspectiveXTable13:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\13.asm"
CurveUpPerspectiveXTable14:
CurveUpPerspectiveXTable15:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\15.asm"
CurveUpPerspectiveXTable16:
CurveUpPerspectiveXTable17:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\17.asm"
CurveUpPerspectiveXTable18:
CurveUpPerspectiveXTable19:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\19.asm"
CurveUpPerspectiveXTable20:
CurveUpPerspectiveXTable21:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\21.asm"
CurveUpPerspectiveXTable22:
CurveUpPerspectiveXTable23:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\23.asm"
CurveUpPerspectiveXTable24:
CurveUpPerspectiveXTable25:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\25.asm"
CurveUpPerspectiveXTable26:
CurveUpPerspectiveXTable27:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\27.asm"
CurveUpPerspectiveXTable28:
CurveUpPerspectiveXTable29:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\29.asm"
CurveUpPerspectiveXTable30:
CurveUpPerspectiveXTable31:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\31.asm"
CurveUpPerspectiveXTable32:
CurveUpPerspectiveXTable33:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\33.asm"
CurveUpPerspectiveXTable34:
CurveUpPerspectiveXTable35:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\35.asm"
CurveUpPerspectiveXTable36:
CurveUpPerspectiveXTable37:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\37.asm"
CurveUpPerspectiveXTable38:
CurveUpPerspectiveXTable39:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\39.asm"
CurveUpPerspectiveXTable40:
CurveUpPerspectiveXTable41:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\41.asm"
CurveUpPerspectiveXTable42:
CurveUpPerspectiveXTable43:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\43.asm"
CurveUpPerspectiveXTable44:
CurveUpPerspectiveXTable45:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\45.asm"
CurveUpPerspectiveXTable46:
CurveUpPerspectiveXTable47:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\47.asm"
CurveUpPerspectiveXTable48:
CurveUpPerspectiveXTable49:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\49.asm"
CurveUpPerspectiveXTable50:
CurveUpPerspectiveXTable51:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\51.asm"
CurveUpPerspectiveXTable52:
CurveUpPerspectiveXTable53:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\53.asm"
CurveUpPerspectiveXTable54:
CurveUpPerspectiveXTable55:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\55.asm"
CurveUpPerspectiveXTable56:
CurveUpPerspectiveXTable57:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\57.asm"
CurveUpPerspectiveXTable58:
CurveUpPerspectiveXTable59:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\59.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveDownPerspectiveXTableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveDownPerspectiveXTablePointer:
dw CurveDownPerspectiveXTable0,CurveDownPerspectiveXTable1,CurveDownPerspectiveXTable2,CurveDownPerspectiveXTable3,CurveDownPerspectiveXTable4,CurveDownPerspectiveXTable5,CurveDownPerspectiveXTable6,CurveDownPerspectiveXTable7,CurveDownPerspectiveXTable8,CurveDownPerspectiveXTable9,CurveDownPerspectiveXTable10,CurveDownPerspectiveXTable11,CurveDownPerspectiveXTable12,CurveDownPerspectiveXTable13,CurveDownPerspectiveXTable14,CurveDownPerspectiveXTable15,CurveDownPerspectiveXTable16,CurveDownPerspectiveXTable17,CurveDownPerspectiveXTable18,CurveDownPerspectiveXTable19,CurveDownPerspectiveXTable20,CurveDownPerspectiveXTable21,CurveDownPerspectiveXTable22,CurveDownPerspectiveXTable23,CurveDownPerspectiveXTable24,CurveDownPerspectiveXTable25,CurveDownPerspectiveXTable26,CurveDownPerspectiveXTable27,CurveDownPerspectiveXTable28,CurveDownPerspectiveXTable29,CurveDownPerspectiveXTable30,CurveDownPerspectiveXTable31,CurveDownPerspectiveXTable32,CurveDownPerspectiveXTable33,CurveDownPerspectiveXTable34,CurveDownPerspectiveXTable35,CurveDownPerspectiveXTable36,CurveDownPerspectiveXTable37,CurveDownPerspectiveXTable38,CurveDownPerspectiveXTable39,CurveDownPerspectiveXTable40,CurveDownPerspectiveXTable41,CurveDownPerspectiveXTable42,CurveDownPerspectiveXTable43,CurveDownPerspectiveXTable44,CurveDownPerspectiveXTable45,CurveDownPerspectiveXTable46,CurveDownPerspectiveXTable47,CurveDownPerspectiveXTable48,CurveDownPerspectiveXTable49,CurveDownPerspectiveXTable50,CurveDownPerspectiveXTable51,CurveDownPerspectiveXTable52,CurveDownPerspectiveXTable53,CurveDownPerspectiveXTable54,CurveDownPerspectiveXTable55,CurveDownPerspectiveXTable56,CurveDownPerspectiveXTable57,CurveDownPerspectiveXTable58,CurveDownPerspectiveXTable59
CurveDownPerspectiveXTable0:
CurveDownPerspectiveXTable1:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\0.asm"
CurveDownPerspectiveXTable2:
CurveDownPerspectiveXTable3:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\3.asm"
CurveDownPerspectiveXTable4:
CurveDownPerspectiveXTable5:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\5.asm"
CurveDownPerspectiveXTable6:
CurveDownPerspectiveXTable7:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\7.asm"
CurveDownPerspectiveXTable8:
CurveDownPerspectiveXTable9:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\9.asm"
CurveDownPerspectiveXTable10:
CurveDownPerspectiveXTable11:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\11.asm"
CurveDownPerspectiveXTable12:
CurveDownPerspectiveXTable13:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\13.asm"
CurveDownPerspectiveXTable14:
CurveDownPerspectiveXTable15:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\15.asm"
CurveDownPerspectiveXTable16:
CurveDownPerspectiveXTable17:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\17.asm"
CurveDownPerspectiveXTable18:
CurveDownPerspectiveXTable19:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\19.asm"
CurveDownPerspectiveXTable20:
CurveDownPerspectiveXTable21:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\21.asm"
CurveDownPerspectiveXTable22:
CurveDownPerspectiveXTable23:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\23.asm"
CurveDownPerspectiveXTable24:
CurveDownPerspectiveXTable25:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\25.asm"
CurveDownPerspectiveXTable26:
CurveDownPerspectiveXTable27:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\27.asm"
CurveDownPerspectiveXTable28:
CurveDownPerspectiveXTable29:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\29.asm"
CurveDownPerspectiveXTable30:
CurveDownPerspectiveXTable31:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\31.asm"
CurveDownPerspectiveXTable32:
CurveDownPerspectiveXTable33:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\33.asm"
CurveDownPerspectiveXTable34:
CurveDownPerspectiveXTable35:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\35.asm"
CurveDownPerspectiveXTable36:
CurveDownPerspectiveXTable37:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\37.asm"
CurveDownPerspectiveXTable38:
CurveDownPerspectiveXTable39:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\39.asm"
CurveDownPerspectiveXTable40:
CurveDownPerspectiveXTable41:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\41.asm"
CurveDownPerspectiveXTable42:
CurveDownPerspectiveXTable43:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\43.asm"
CurveDownPerspectiveXTable44:
CurveDownPerspectiveXTable45:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\45.asm"
CurveDownPerspectiveXTable46:
CurveDownPerspectiveXTable47:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\47.asm"
CurveDownPerspectiveXTable48:
CurveDownPerspectiveXTable49:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\49.asm"
CurveDownPerspectiveXTable50:
CurveDownPerspectiveXTable51:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\51.asm"
CurveDownPerspectiveXTable52:
CurveDownPerspectiveXTable53:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\53.asm"
CurveDownPerspectiveXTable54:
CurveDownPerspectiveXTable55:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\55.asm"
CurveDownPerspectiveXTable56:
CurveDownPerspectiveXTable57:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\57.asm"
CurveDownPerspectiveXTable58:
CurveDownPerspectiveXTable59:
  include "..\grapx\racinggame\CurveDownEndAnimationPage1\59.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveLeftPerspectiveXTableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveLeftPerspectiveXTable0:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\0.asm"
CurveLeftPerspectiveXTable1:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\1.asm"
CurveLeftPerspectiveXTable2:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\2.asm"
CurveLeftPerspectiveXTable3:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\3.asm"
CurveLeftPerspectiveXTable4:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\4.asm"
CurveLeftPerspectiveXTable5:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\5.asm"
CurveLeftPerspectiveXTable6:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\6.asm"
CurveLeftPerspectiveXTable7:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\7.asm"
CurveLeftPerspectiveXTable8:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\8.asm"
CurveLeftPerspectiveXTable9:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\9.asm"
CurveLeftPerspectiveXTable10:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\10.asm"
CurveLeftPerspectiveXTable11:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\11.asm"
CurveLeftPerspectiveXTable12:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\12.asm"
CurveLeftPerspectiveXTable13:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\13.asm"
CurveLeftPerspectiveXTable14:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\14.asm"
CurveLeftPerspectiveXTable15:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\15.asm"
CurveLeftPerspectiveXTable16:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\16.asm"
CurveLeftPerspectiveXTable17:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\17.asm"
CurveLeftPerspectiveXTable18:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\18.asm"
CurveLeftPerspectiveXTable19:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\19.asm"
CurveLeftPerspectiveXTable20:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\20.asm"
CurveLeftPerspectiveXTable21:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\21.asm"
CurveLeftPerspectiveXTable22:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\22.asm"
CurveLeftPerspectiveXTable23:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\23.asm"
CurveLeftPerspectiveXTable24:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\24.asm"
CurveLeftPerspectiveXTable25:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\25.asm"
CurveLeftPerspectiveXTable26:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\26.asm"
CurveLeftPerspectiveXTable27:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\27.asm"
CurveLeftPerspectiveXTable28:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\28.asm"
CurveLeftPerspectiveXTable29:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\29.asm"
CurveLeftPerspectiveXTable30:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\30.asm"
CurveLeftPerspectiveXTable31:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\31.asm"
CurveLeftPerspectiveXTable32:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\32.asm"
CurveLeftPerspectiveXTable33:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\33.asm"
CurveLeftPerspectiveXTable34:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\34.asm"
CurveLeftPerspectiveXTable35:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\35.asm"
CurveLeftPerspectiveXTable36:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\36.asm"
CurveLeftPerspectiveXTable37:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\37.asm"
CurveLeftPerspectiveXTable38:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\38.asm"
CurveLeftPerspectiveXTable39:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\39.asm"
CurveLeftPerspectiveXTable40:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\40.asm"
CurveLeftPerspectiveXTable41:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\41.asm"
CurveLeftPerspectiveXTable42:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\42.asm"
CurveLeftPerspectiveXTable43:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\43.asm"
CurveLeftPerspectiveXTable44:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\44.asm"
CurveLeftPerspectiveXTable45:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\45.asm"
CurveLeftPerspectiveXTable46:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\46.asm"
CurveLeftPerspectiveXTable47:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\47.asm"
CurveLeftPerspectiveXTable48:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\48.asm"
CurveLeftPerspectiveXTable49:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\49.asm"
CurveLeftPerspectiveXTable50:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\50.asm"
CurveLeftPerspectiveXTable51:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\51.asm"
CurveLeftPerspectiveXTable52:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\52.asm"
CurveLeftPerspectiveXTable53:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\53.asm"
CurveLeftPerspectiveXTable54:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\54.asm"
CurveLeftPerspectiveXTable55:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\55.asm"
CurveLeftPerspectiveXTable56:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\56.asm"
CurveLeftPerspectiveXTable57:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\57.asm"
CurveLeftPerspectiveXTable58:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\58.asm"
CurveLeftPerspectiveXTable59:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\59.asm"
CurveLeftPerspectiveXTable60:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\60.asm"
CurveLeftPerspectiveXTable61:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\61.asm"
CurveLeftPerspectiveXTable62:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\62.asm"
CurveLeftPerspectiveXTable63:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\63.asm"
CurveLeftPerspectiveXTable64:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\64.asm"
CurveLeftPerspectiveXTable65:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\65.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveLeftPerspectiveXTablePart2Block:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveLeftPerspectiveXTable66:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\66.asm"
CurveLeftPerspectiveXTable67:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\67.asm"
CurveLeftPerspectiveXTable68:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\68.asm"
CurveLeftPerspectiveXTable69:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\69.asm"
CurveLeftPerspectiveXTable70:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\70.asm"
CurveLeftPerspectiveXTable71:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\71.asm"
CurveLeftPerspectiveXTable72:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\72.asm"
CurveLeftPerspectiveXTable73:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\73.asm"
CurveLeftPerspectiveXTable74:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\74.asm"
CurveLeftPerspectiveXTable75:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\75.asm"
CurveLeftPerspectiveXTable76:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\76.asm"
CurveLeftPerspectiveXTable77:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\77.asm"
CurveLeftPerspectiveXTable78:
  include "..\grapx\racinggame\CurveLeftEndAnimationPage1\78.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveRightPerspectiveXTableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveRightPerspectiveXTable0:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\0.asm"
CurveRightPerspectiveXTable1:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\1.asm"
CurveRightPerspectiveXTable2:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\2.asm"
CurveRightPerspectiveXTable3:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\3.asm"
CurveRightPerspectiveXTable4:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\4.asm"
CurveRightPerspectiveXTable5:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\5.asm"
CurveRightPerspectiveXTable6:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\6.asm"
CurveRightPerspectiveXTable7:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\7.asm"
CurveRightPerspectiveXTable8:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\8.asm"
CurveRightPerspectiveXTable9:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\9.asm"
CurveRightPerspectiveXTable10:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\10.asm"
CurveRightPerspectiveXTable11:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\11.asm"
CurveRightPerspectiveXTable12:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\12.asm"
CurveRightPerspectiveXTable13:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\13.asm"
CurveRightPerspectiveXTable14:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\14.asm"
CurveRightPerspectiveXTable15:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\15.asm"
CurveRightPerspectiveXTable16:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\16.asm"
CurveRightPerspectiveXTable17:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\17.asm"
CurveRightPerspectiveXTable18:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\18.asm"
CurveRightPerspectiveXTable19:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\19.asm"
CurveRightPerspectiveXTable20:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\20.asm"
CurveRightPerspectiveXTable21:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\21.asm"
CurveRightPerspectiveXTable22:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\22.asm"
CurveRightPerspectiveXTable23:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\23.asm"
CurveRightPerspectiveXTable24:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\24.asm"
CurveRightPerspectiveXTable25:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\25.asm"
CurveRightPerspectiveXTable26:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\26.asm"
CurveRightPerspectiveXTable27:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\27.asm"
CurveRightPerspectiveXTable28:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\28.asm"
CurveRightPerspectiveXTable29:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\29.asm"
CurveRightPerspectiveXTable30:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\30.asm"
CurveRightPerspectiveXTable31:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\31.asm"
CurveRightPerspectiveXTable32:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\32.asm"
CurveRightPerspectiveXTable33:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\33.asm"
CurveRightPerspectiveXTable34:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\34.asm"
CurveRightPerspectiveXTable35:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\35.asm"
CurveRightPerspectiveXTable36:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\36.asm"
CurveRightPerspectiveXTable37:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\37.asm"
CurveRightPerspectiveXTable38:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\38.asm"
CurveRightPerspectiveXTable39:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\39.asm"
CurveRightPerspectiveXTable40:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\40.asm"
CurveRightPerspectiveXTable41:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\41.asm"
CurveRightPerspectiveXTable42:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\42.asm"
CurveRightPerspectiveXTable43:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\43.asm"
CurveRightPerspectiveXTable44:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\44.asm"
CurveRightPerspectiveXTable45:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\45.asm"
CurveRightPerspectiveXTable46:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\46.asm"
CurveRightPerspectiveXTable47:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\47.asm"
CurveRightPerspectiveXTable48:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\48.asm"
CurveRightPerspectiveXTable49:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\49.asm"
CurveRightPerspectiveXTable50:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\50.asm"
CurveRightPerspectiveXTable51:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\51.asm"
CurveRightPerspectiveXTable52:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\52.asm"
CurveRightPerspectiveXTable53:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\53.asm"
CurveRightPerspectiveXTable54:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\54.asm"
CurveRightPerspectiveXTable55:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\55.asm"
CurveRightPerspectiveXTable56:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\56.asm"
CurveRightPerspectiveXTable57:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\57.asm"
CurveRightPerspectiveXTable58:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\58.asm"
CurveRightPerspectiveXTable59:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\59.asm"
CurveRightPerspectiveXTable60:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\60.asm"
CurveRightPerspectiveXTable61:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\61.asm"
CurveRightPerspectiveXTable62:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\62.asm"
CurveRightPerspectiveXTable63:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\63.asm"
CurveRightPerspectiveXTable64:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\64.asm"
CurveRightPerspectiveXTable65:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\65.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

CurveRightPerspectiveXTablePart2Block:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
CurveRightPerspectiveXTable66:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\66.asm"
CurveRightPerspectiveXTable67:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\67.asm"
CurveRightPerspectiveXTable68:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\68.asm"
CurveRightPerspectiveXTable69:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\69.asm"
CurveRightPerspectiveXTable70:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\70.asm"
CurveRightPerspectiveXTable71:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\71.asm"
CurveRightPerspectiveXTable72:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\72.asm"
CurveRightPerspectiveXTable73:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\73.asm"
CurveRightPerspectiveXTable74:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\74.asm"
CurveRightPerspectiveXTable75:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\75.asm"
CurveRightPerspectiveXTable76:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\76.asm"
CurveRightPerspectiveXTable77:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\77.asm"
CurveRightPerspectiveXTable78:
  include "..\grapx\racinggame\CurveRightEndAnimationPage1\78.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

ForceMovePlayerAgainstCurvesTableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
  include "..\grapx\racinggame\ForceMovePlayerAgainstCurvesTable.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

Division29TableBlock:  			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$8000
	Division29Table:
  include "..\grapx\racinggame\Division29Table.asm"
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

	include	"..\grapx\RacingGame\CurveLeftDataFiles.asm"
	include	"..\grapx\RacingGame\CurveLeftEndDataFiles.asm"
	include	"..\grapx\RacingGame\CurveRightDataFiles.asm"
	include	"..\grapx\RacingGame\CurveRightEndDataFiles.asm"
	include	"..\grapx\RacingGame\CurveUpDataFiles.asm"
	include	"..\grapx\RacingGame\CurveUpEndDataFiles.asm"
	include	"..\grapx\RacingGame\CurveDownDataFiles.asm"
	include	"..\grapx\RacingGame\CurveDownEndDataFiles.asm"

RoadAnimationIndexesBlockCurveUp:				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RoadAnimationIndexesBlockCurveUpEnd:		equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RoadAnimationIndexesBlockCurveDown:			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RoadAnimationIndexesBlockCurveDownEnd:	equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$4000
CurveUpDataFiles:
	include	"..\grapx\RacingGame\CurveUpDataIndex.asm"
db 0,0
CurveUpEndDataFiles:
	include	"..\grapx\RacingGame\CurveUpEndDataIndex.asm"
db 0,0
CurveDownDataFiles:
	include	"..\grapx\RacingGame\CurveDownDataIndex.asm"
db 0,0
CurveDownEndDataFiles:
	include	"..\grapx\RacingGame\CurveDownEndDataIndex.asm"
db 0,0
	dephase
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

RoadAnimationIndexesBlockCurveLeft:			equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RoadAnimationIndexesBlockCurveLeftEnd:	equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RoadAnimationIndexesBlockCurveRight:		equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
RoadAnimationIndexesBlockCurveRightEnd:	equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	phase	$4000
CurveLeftDataFiles:
	include	"..\grapx\RacingGame\CurveLeftDataIndex.asm"
db 0,0
CurveLeftEndDataFiles:
	include	"..\grapx\RacingGame\CurveLeftEndDataIndex.asm"
db 0,0
CurveRightDataFiles:
	include	"..\grapx\RacingGame\CurveRightDataIndex.asm"
db 0,0
CurveRightEndDataFiles:
	include	"..\grapx\RacingGame\CurveRightEndDataIndex.asm"
db 0,0
HalfCurveLeftDataFiles:
	include	"..\grapx\RacingGame\HalfCurveLeftDataIndex.asm"
db 0,0
HalfCurveLeftEndDataFiles:
	include	"..\grapx\RacingGame\HalfCurveLeftEndDataIndex.asm"
db 0,0
HalfCurveRightDataFiles:
	include	"..\grapx\RacingGame\HalfCurveRightDataIndex.asm"
db 0,0
HalfCurveRightEndDataFiles:
	include	"..\grapx\RacingGame\HalfCurveRightEndDataIndex.asm"
db 0,0
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

;movement routines3
MovementRoutines3Block:	equ ($-RomStartAddress) and (romsize-1) /RomBlockSize ;$04
								include "MovementRoutines3.asm"  
								DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

EndBlock:				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize




EndFirst4MB:
	ds		$400000 - EndFirst4MB + $4000,$ff
TheVesselrepBlock:				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	incbin "msxlegends.rep"
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

EndRom:
	ds		$800000 - endRom + $4000,$ff