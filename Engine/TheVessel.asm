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
	phase	$8000
	Girl1PonySpritesCharacters:
	include "..\grapx\racinggame\sprites\Girl1Pony\Girl1Pony.tgs.gen"
	Girl1PonySpriteColors:	
	include "..\grapx\racinggame\sprites\Girl1Pony\Girl1Pony.tcs.gen"
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


TheVesselrepBlock:				equ   ($-RomStartAddress) and (romsize-1) /RomBlockSize
	incbin "msxlegends.rep"
	DS RomBlockSize- $ and (RomBlockSize-1),-1	;fill remainder of block

endRom:
;	ds		(RomSize-1) - endRom,$ff


	ds		$800000 - endRom + $4000,$ff