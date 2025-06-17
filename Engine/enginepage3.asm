phase	$c000

StartAtTitleScreen?:                equ 0
MusicOn?:                           equ 0
Promo?:                             equ 0

InitiateGame:
;  if  StartAtTitleScreen?
;  call  TitleScreen
;  endif
;  StartGame:
	call	SpriteInitialize
	call	ResetVariables
	call	SetScreenOff
	call	LoadRoomGfx											;sets room gfx and sets palette
	call	PutObjects											;put objects and events
	call	ResetRestoreTables							;all 4 objects have their own restore tables
	call	ResetRestoreBackgroundTables		;reset all restore background tables
	call	LoadTileMap											;sets tilemap (what is foreground and what is background) 
  ld    a,r
	and		7
	inc		a
  ld    (ChangeSong?),a
  call  SetInterruptHandler           	;sets Vblank
  jp    LevelEngine

ResetVariables:
	xor		a
  ld    (ChangeRoom?),a
	ld		(screenpage),a
  ld    (ShowConversationCloud?),a
  ld    (ShowPressTriggerAIcon?),a
	ld		a,8
	ld		(ScreenOnDelay),a								;amount of frames until screen turns on (we need some frames to first put all objects in screen)
	ret

INCLUDE "RePlayer.asm"
;														on?,  y,  x,  sprite restore table,sprite data,put on frame ,movement routine block,  movement routine,							 phase,var1,var2,var3

ObjectGirl:  							db  1,110,050 | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw GirlMovementRoutine				| db 000,000 ,000, 000
ObjectCapGirl:  					db  1,071,100 | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw CapGirlMovementRoutine		| db 000,000 ,000, 000
ObjectRedHeadBoy:  				db  1,102,220 | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw RedHeadBoyMovementRoutine	| db 000,000 ,000, 000
ObjectHost:  							db  1,068,108 | dw 000,000					,Host_0     | db 255      ,MovementRoutinesBlock | dw HostMovementRoutine				| db 000,000 ,000, 000
ObjectWall:  							db  1,062,178 | dw 000,000					,Wall_0     | db 255      ,MovementRoutinesBlock | dw WallMovementRoutine				| db 000,000 ,000, 000
;ObjectWall:  							db  1,105,048 | dw 000,000					,Wall_0     | db 255      ,MovementRoutinesBlock | dw WallMovementRoutine				| db 000,000 ,000, 000

ObjectBackRoomGame:  			db  1,092,128 | dw 000,000					,BRGame_0   | db 255			,MovementRoutinesBlock | dw BackRoomGameRoutine				| db 000,000 ,000, 000
ObjectEntitya: 						db  1,013,128 | dw 000,000					,Entity_a  	| db 001			,MovementRoutinesBlock | dw EntityaRoutine						| db 000,000 ,000, 000
ObjectEntityb: 						db  1,013,128 | dw 000,000					,Entity_b  	| db 002			,MovementRoutinesBlock | dw EntitybRoutine						| db 000,000 ,000, 000
ObjectEntityc: 						db  1,013,128 | dw 000,000					,Entity_c  	| db 003			,MovementRoutinesBlock | dw EntitycRoutine						| db 000,000 ,000, 000

EventArcadeHall1:					db	1,0,0     | dw 000,000					,000   			| db 255      ,MovementRoutinesBlock | dw ArcadeHall1EventRoutine		| db 000,000 ,000, 000
EventArcadeHall2: 				db	1,0,0     | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw ArcadeHall2EventRoutine		| db 000,000 ,000, 000
EventSirens: 							db	1,0,0     | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw SirensRoutine							| db 000,000 ,000, 000

LenghtDoCopyTable:  equ	RestoreBackgroundObject1Page1-RestoreBackgroundObject1Page0
ResetRestoreBackgroundTables:
  ld    ix,RestoreBackgroundObject1Page0
  ld    de,LenghtDoCopyTable
  ld    b,16                                ;amount of tables

  .loop:
  xor   a
  ld    (ix+sx),a
  ld    (ix+sy),a
  ld    (ix+dx),a
  ld    (ix+dy),a
  ld    (ix+nx),2
  ld    (ix+ny),1
  add   ix,de                               ;next table
  djnz  .loop
  ret

ResetRestoreTables:											;all 4 objects have their own restore tables
	ld		hl,Object2RestoreBackgroundTable
	ld		(Object2+ObjectRestoreBackgroundTable),hl
	ld		hl,Object3RestoreBackgroundTable
	ld		(Object3+ObjectRestoreBackgroundTable),hl
	ld		hl,Object4RestoreBackgroundTable
	ld		(Object4+ObjectRestoreBackgroundTable),hl

	ld		hl,Object2RestoreTable
	ld		(Object2+ObjectRestoreTable),hl
	ld		hl,Object3RestoreTable
	ld		(Object3+ObjectRestoreTable),hl
	ld		hl,Object4RestoreTable
	ld		(Object4+ObjectRestoreTable),hl
	ret

LoadTileMap:
	ld		a,(CurrentRoom)									;0=arcadehall1, 1=arcadehall2
	or		a
	jr		z,.ArcadeHall1
	dec		a
	jr		z,.ArcadeHall2
	ret

	.ArcadeHall1:
	ld		hl,ArcadeHall1TileMap
	ld		(TileMap),hl
	ret

	.ArcadeHall2:
	ld		hl,ArcadeHall2TileMap
	ld		(TileMap),hl

	ld		a,(HighScoreBackroomGame)
	cp		100
	ret		c

	ld		hl,ArcadeHall2EntityTileMap
	ld		(TileMap),hl
	ret

PutSingleObject:
	ld		bc,LenghtObject
	ldir
	ret

PutObjects:															;put objects and events
	xor		a																;turn off all objects and events
	ld		(Object2+on?),a
	ld		(Object3+on?),a
	ld		(Object4+on?),a
	ld		(ObjEvent1+on?),a
	ld		(ObjEvent2+on?),a
	ld		(ObjEvent3+on?),a
	ld		(SkipAssignOrder?),a						;reset hackjob. (In same cases we don't want to assign order)

	ld		de,Object2											;start with object2

	ld		a,(CurrentRoom)									;1=arcadehall1, 2=arcadehall2
	or		a
	jr		z,PutObjectsArcadeHall1
	dec		a
	jr		z,PutObjectsArcadeHall2
	ret

PutObjectsArcadeHall2:
	;set starting coordinates player
	ld		a,116														;y
	ld		(Object1+y),a
	ld		a,194														;x
	ld		(Object1+x),a

	ld		hl,LStanding
  ld    (PlayerSpriteStand),hl

	ld		a,(HighScoreBackroomGame)
	cp		100
	jr		c,.BackRoomGameNotYetFinished

	ld		a,1
	ld		(SkipAssignOrder?),a						;we implement a hackjob here. In same cases we don't want to assign order
	xor		a
	ld		(Object1+PutOnFrame),a

	ld		hl,ObjectEntitya								;put entity
	call	PutSingleObject 
	ld		hl,ObjectEntityb								;put entity
	call	PutSingleObject 
	ld		hl,ObjectEntityc								;put entity
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,EventArcadeHall2							;put arcade hall 2 event
	call	PutSingleObject
	ret

	.BackRoomGameNotYetFinished:
	ld		hl,ObjectHost										;put host
	call	PutSingleObject 
	ld		hl,ObjectBackRoomGame						;put backroom game
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,EventArcadeHall2							;put arcade hall 2 event
	call	PutSingleObject
	ret

PutObjectsArcadeHall1:
	ld		a,(HighScoreTotalAverage)
	cp		80
	jp		c,.HighScoreNot80Yet

	ld		a,(ConvHost)										;check if we have met the host already
	bit		0,a
	jr		z,.HostAppears

	.HostHasAlreadyAppeared:
	ld		hl,ObjectWall										;put wall
	call	PutSingleObject

	ld		de,ObjEvent1										;now put events

	ld		hl,EventArcadeHall1							;put arcade hall 1 event
	call	PutSingleObject
	call  LoadOpenDoorGfx 								;opens the door in all pages

	ld		hl,(PlayerSpriteStand)
  ld    de,LEnterDoor
  call  CompareHLwithDE
  ret   nz

	;set starting coordinates player (entering through the door)
	ld		a,061														;y
	ld		(Object1+y),a
	ld		a,172														;x
	ld		(Object1+x),a
	ret

	.HostAppears:
	ld		hl,ObjectHost										;put host
	call	PutSingleObject 

	ld		hl,ObjectWall										;put wall
	call	PutSingleObject 
	xor		a
  ld    (Object3+on?),a                 ;wall on (wall gets turned on at the end of the sirens routine)
	ld		de,ObjEvent1										;now put events

	ld		hl,EventSirens									;put sirens event
	call	PutSingleObject 
	ld		hl,EventArcadeHall1							;put arcade hall 1 event
	call	PutSingleObject 
	call  LoadArcadeHall1redlightsGfx 		;loads the red lights in page and

	;set starting coordinates player
	ld		a,102														;y
	ld		(Object1+y),a
	ld		a,074														;x
	ld		(Object1+x),a

	ld		hl,RStanding
  ld    (PlayerSpriteStand),hl

	;set starting coordinates host
	ld		a,061														;y
	ld		(Object2+y),a
	ld		a,176														;x
	ld		(Object2+x),a
	ret

	.HighScoreNot80Yet:
	ld		hl,ObjectGirl										;put girl
	call	PutSingleObject 
	ld		hl,ObjectCapGirl								;put capgirl
	call	PutSingleObject 
	ld		hl,ObjectRedHeadBoy							;put redheadboy
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events
	ld		hl,EventArcadeHall1							;put arcade hall 1 event
	call	PutSingleObject 
	ret

ArcadeHall1Palette:                    	;palette file
  incbin "..\grapx\arcadehall\arcade1.SC5",$7680+7,32
ArcadeHall2Palette:                    	;palette file
  incbin "..\grapx\arcadehall\arcade2.SC5",$7680+7,32

LoadRoomGfx:
	ld		a,(CurrentRoom)									;0=arcadehall1, 1=arcadehall2
	or		a
	jr		z,LoadArcadeHall1Gfx            ;loads the initial starting arcade room in all 4 pages, and sets palette
	dec		a
	jr		z,LoadArcadeHall2Gfx            ;loads the 2nd arcade room in all 4 pages, and sets palette
	ret

LoadArcadeHall1Gfx:
  ld    hl,ArcadeHall1Palette
  ld    a,ArcadeHall1GfxBlock         	;block to copy graphics from
	jp		LoadArcadeHallGfx

LoadArcadeHall1redlightsGfx:
  ld    a,ArcadeHall1redlightsGfxBlock         	;block to copy graphics from
  call  SetArcadeRedLightsGfxPage0
  ld    a,ArcadeHall1redlightsGfxBlock         	;block to copy graphics from
  jp		SetArcadeRedLightsGfxPage1

LoadArcadeHall2Gfx:
  ld    hl,ArcadeHall2Palette
  ld    a,ArcadeHall2GfxBlock         	;block to copy graphics from
	jp		LoadArcadeHallGfx

LoadArcadeHallGfx:
	push	hl															;current palette
	push	af															;block to copy graphics from
  call  SetArcadeGfxPage0
  ;copy from page 0 to page 2
  ld    a,0
  ld    (CopyPageToPage212High+sPage),a
  ld    a,2
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy
	pop		af															;block to copy graphics from
  call  SetArcadeGfxPage1
  ;copy from page 1 to page 3
  ld    a,1
  ld    (CopyPageToPage212High+sPage),a
  ld    a,3
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy
	pop		hl															;current palette
	ld		de,CurrentPalette
	ld		bc,16*2
	ldir
  ld    hl,CurrentPalette
  jp		SetPalette

CurrentPalette:	ds	16*2

SetArcadeGfxPage0:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (212*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

SetArcadeGfxPage1:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (212*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

SetArcadeRedLightsGfxPage0:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (005*128) + (000/2) - 128
  ld    bc,$0000 + (030*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

SetArcadeRedLightsGfxPage1:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (005*128) + (000/2) - 128
  ld    bc,$0000 + (030*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

SetFontPage1Y212:                       ;set font at (0,212) page 0
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (212*128) + (000/2) - 128
  ld    bc,$0000 + (039*256) + (256/2)
  ld    a,FontBlock         ;font graphics block
  jp    CopyRomToVram          ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

LoadOpenDoorGfx:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (066*128) + (100/2) - 128
  ld    bc,$0000 + (097*256) + (056/2)
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (066*128) + (100/2) - 128
  ld    bc,$0000 + (097*256) + (056/2)
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (066*128) + (100/2) - 128
  ld    bc,$0000 + (097*256) + (056/2)
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (066*128) + (100/2) - 128
  ld    bc,$0000 + (097*256) + (056/2)
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a
  ret

Vdp_Write_HighPage?:	db	0							;page 0/1 for low page, 2/3 for high page
CopyRomToVram:
  ex    af,af'                          ;store rom block

  in    a,($a8)                         ;store current rom/ram settings of page 1+2
  push  af
  ld		a,(memblocks.1)
  push  af
  ld		a,(memblocks.2)
  push  af

  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
  ex    af,af'
  call  block1234                       ;CARE!!! we can only switch block34 if page 1 is in rom  

  ld    (AddressToWriteFrom),hl
  ld    (AddressToWriteTo),de
  ld    (NXAndNY),bc
  call  .AddressesSet

  pop   af
  call  block34
  pop   af
  call  block12
  pop   af
  out   ($a8),a                         ;reset rom/ram settings of page 1+2
  ret

  .AddressesSet:
  ld    c,$98                           ;out port
  ld    de,128                          ;increase 128 bytes to go to the next line

  .loop:
  call  .CopyOneLine
  ld    a,(NXAndNY+1)
  dec   a
  ld    (NXAndNY+1),a
  jp    nz,.loop
  ret

  .CopyOneLine:
  ld    hl,(AddressToWriteTo)           ;set next line to start writing to
  add   hl,de                           ;increase 128 bytes to go to the next line
  ld    (AddressToWriteTo),hl

  ;  ld    a,1
  ;  ld    (AreWeWritingToVram?),a

	ld		a,(Vdp_Write_HighPage?)					;page 0/1 for low page, 2/3 for high page
  call	SetVdp_Write                    ;start writing to address bhl

  ld    hl,(AddressToWriteFrom)         ;set next line to start writing from
  add   hl,de                           ;increase 128 bytes to go to the next line
  ld    (AddressToWriteFrom),hl
  ld    a,(NXAndNY)
  cp    128
  jp    z,outix128

  ld    b,a
  otir

  ;  xor   a
  ;  ld    (AreWeWritingToVram?),a

  ret













;TitleScreen:
;  ld    a,(slot.page12rom)            ;all RAM except page 1
;  out   ($a8),a      
;  ld    a,TitleScreenCodeblock        ;Map block
;  call  block34                       ;CARE!!! we can only switch block34 if page 1 is in rom
;  jp    HandleTitleScreenCode

;ExecuteLoaderRoutine:
;  ld    a,(slot.page1rom)             ;all RAM except page 1
;  out   ($a8),a      
;  ld    a,Loaderblock                 ;Map block
;  call  block12                       ;CARE!!! we can only switch block34 if page 1 is in rom
;  jp    (hl)



;CopyRamToVram:                          ;in: hl->AddressToWriteTo, bc->AddressToWriteFrom, de->NXAndNY
;  ld    (AddressToWriteFrom),bc
;  ld    (NXAndNY),de

;	ld		a,(activepage)                  ;alternate between page 0 and 1
;  or    a
;  jp    nz,CopyRamToVramCorrectedCastleOverview.SetAddress2
;  ld    de,$8000
;  add   hl,de                           ;page 1
;  jp    CopyRamToVramCorrectedCastleOverview.SetAddress2

;CopyRamToVramCorrectedWithoutActivePageSetting:
;  ex    af,af'                          ;store rom block

;  in    a,($a8)                         ;store current rom/ram settings of page 1+2
;  push  af
;	ld		a,(memblocks.1)
;  push  af
;	ld		a,(memblocks.2)
;  push  af

;  ld    a,(slot.page12rom)              ;all RAM except page 1+2
;  out   ($a8),a      
;  ex    af,af'
;  call  block1234                       ;CARE!!! we can only switch block34 if page 1 is in rom  

;  ld    (AddressToWriteFrom),hl
;  ld    (NXAndNY),bc
;  ld    (AddressToWriteTo),de
;  call  CopyRamToVramCorrectedCastleOverview.AddressesSet

;  pop   af
;  call  block34
;  pop   af
;  call  block12
;  pop   af
;  out   ($a8),a                         ;reset rom/ram settings of page 1+2
;  ret

;AreWeWritingToVram?: db  0


BlockToReadFrom:            ds  1
AddressToWriteTo:           ds  2
AddressToWriteFrom:         ds  2
NXAndNY:                    ds  2

CopyPageToPage212High:
	db		0,0,0,0
	db		0,0,0,0
	db		0,1,212,0
	db		0,0,$d0	
CopyPage0To1:
	db		0,0,0,0
	db		0,0,0,1
	db		0,1,0,1
	db		0,0,$d0	
CopyPage1To0:
	db		0,0,0,1
	db		0,0,0,0
	db		0,1,212,0
	db		0,0,$d0	
PutLetter:
  db    000,000,000,001                 ;sx,--,sy,spage
  db    000,000,000,000                 ;dx,--,dy,dpage
  db    008,000,013,000                 ;nx,--,ny,--
  db    000,000,$98              				;transparant copy

ChangeSong?:  db 0


SetInterruptHandler:
  di
  ld    hl,InterruptHandler 
  ld    ($38+1),hl          ;set new normal interrupt
  ld    a,$c3               ;jump command
  ld    ($38),a
  ;lineinterrupt OFF
  ld    a,(VDP_0)           ;reset ei1
  and   %1110 1111
;  or    16                  ;ei1 checks for lineint and vblankint
  ld    (VDP_0),a           ;ei0 (which is default at boot) only checks vblankint
  out   ($99),a
  ld    a,128
  ei
  out   ($99),a
  ret

		; set temp ISR
SetTempisr:	
; load BIOS / engine , load startup
  di
	ld		hl,.tempisr
	ld		de,$38
	ld		bc,6
	ldir
  ei
  ret

.tempisr:
	push	af
	in		a,($99)             ;check and acknowledge vblank int (ei0 is set)
	pop		af
	ei	
	ret

sprcoladdr:		equ	$7400
sprattaddr:		equ	$7600
sprcharaddr:	equ	$7800
SpriteInitialize:
	ld		a,(vdp_0+1)
	or		2			;sprites 16*16
	di
	out		($99),a
	ld		a,1+128
	ei
	out		($99),a

	ld		a,%1110 1111
	ld		(vdp_0+5),a
	di
;	out		($99),a		                      ;spr att table to $17600
	out		($99),a		                      ;spr att table to $7600
	ld		a,5+128
	out		($99),a
;	ld		a,%0000 0010                    ;spr att table to $17600
	ld		a,%0000 0000                    ;spr att table to $7600
	ld		(vdp_8+3),a
	out		($99),a
	ld		a,11+128
	out		($99),a
	
;	ld		a,%0010 1111
	ld		a,%0000 1111
	ld		(vdp_0+6),a
;	out		($99),a		                      ;spr chr table to $17800
	out		($99),a		                      ;spr chr table to $7800
	ld		a,6+128
	ei
	out		($99),a

;load sprites data
	xor		a				;page 0/1
	ld		hl,sprcharaddr	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ld    hl,SpriteCharacters
	ld		c,$98
;	call	outix64			;write sprite character to vram
;	call	outix64			;write sprite character to vram
;	call	outix64			;write sprite character to vram
;	call	outix64			;write sprite character to vram
	call	outix256		;write sprite character to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr	;sprite 0 color table in VRAM
	call	SetVdp_Write

	ld		hl,SpriteColors
	ld		c,$98
;	call	outix32			;write sprite color of pointer and hand to vram
;	call	outix32			;write sprite color of pointer and hand to vram
;	call	outix32			;write sprite color of pointer and hand to vram
;	call	outix32			;write sprite color of pointer and hand to vram
	call	outix128		;write sprite color of pointer and hand to vram

	call	putsprite
	ret

SpriteCharacters:	
include "..\sprites\sprites.tgs.gen"
SpriteColors:	
include "..\sprites\sprites.tcs.gen"

SetPage:                                ;in a->x*32+31 (x=page)
  di
  out   ($99),a
  ld    a,2+128
  ei
  out   ($99),a
  ret




;ASCII16-EX:
;----------------------------------------
;Bank #1 low: 6000h - 67FFh (6000h used)
;Bank #1 high: 8000h - 87FFh (should recommend to use 6000h)
;----------------------------------------
;Bank #2 low: 7000h - 77FFh (7000h and 77FFh used)
;Bank #2 high: 9000h - 97FFh (should recommend to use 9000h)

;Feature set:

;  * Flash ROM memory with commands for per-sector erasing and programming.
;  * Extended addressable capacity up to 64 MB (design provided for 8 MB).
;  * Two 16K mapper pages, mirrored to the full address range.
;  * Two bank selection registers accessible in all pages.
;  * Backwards compatible with ASCII16.

;The two 16K pages are available at 4000H and 8000H, and mirrored to C000H and
;0000H respectively. The two bank select registers exist at 6000H and 7000H just
;like in ASCII16, but are also accessible at A000H, E000H and 2000H. The bank
;number is passed as the data, and for ROM sizes > 4 MB the MSB of the bank
;number is passed in address bits 8-11. Unused bits are ignored.

;Initial banks after power on / reset are 0, however note that the BIOS selects
;a different bank in the 2nd page during boot-up, due to slot expander detection
;writing to mirrored bank select registers if the mapper is in a primary slot.
;So it is recommended to boot from 4000H and manually initialise the banks.

;Below is some example code, assuming the correct cartridge slot is already
;selected at the addresses written to.

;    ld a,47H
;    ld (6000H),a  ; select bank 47H in 1st page (4000-7FFF, C000-FFFF)
;    ld a,47H
;    ld (7000H),a  ; select bank 47H in 2nd page (8000-BFFF, 0000-3FFF)
;    ld a,47H
;    ld (0E000H),a ; select bank 47H in 1st page (4000-7FFF, C000-FFFF)
;    ld a,47H
;    ld (3000H),a  ; select bank 47H in 2nd page (8000-BFFF, 0000-3FFF)
;    ld a,47H
;    ld (6100H),a  ; select bank 147H in 1st page (4000-7FFF, C000-FFFF)
;    ld hl,6147H
;    ld (hl),l     ; select bank 147H in 1st page (4000-7FFF, C000-FFFF)

block12High:
  di
	ld		(memblocks.1),a
	ld		($6100),a
	ei
	ret

;block34High:	
 ; di
;	ld		(memblocks.2),a
;	ld		($7100),a
;	ei
;	ret

;block1234High:	 
 ; di
;	ld		(memblocks.1),a
;	ld		($6100),a
;	inc   a
;	ld		(memblocks.2),a
;	ld		($7100),a
;	ei
;	ret


block12:	
  di
	ld		(memblocks.1),a
	ld		($6000),a
	ei
	ret

block34:	
  di
	ld		(memblocks.2),a
	ld		($7000),a
	ei
	ret

block1234:	 
  di
	ld		(memblocks.1),a
	ld		($6000),a
	inc   a
	ld		(memblocks.2),a
	ld		($7000),a
	ei
	ret

DoCopy:
  ld    a,32
  di
  out   ($99),a
  ld    a,17+128
  ei
  out   ($99),a
  ld    c,$9b
.vdpready:
  ld    a,2
  di
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)
  rra
  ld    a,0
  out   ($99),a
  ld    a,15+128
  ei
  out   ($99),a
  jr    c,.vdpready

	dw    $a3ed,$a3ed,$a3ed,$a3ed
	dw    $a3ed,$a3ed,$a3ed,$a3ed
	dw    $a3ed,$a3ed,$a3ed,$a3ed
	dw    $a3ed,$a3ed,$a3ed
  ret

WaitVdpReady:
  ld    a,32
  di
  out   ($99),a
  ld    a,17+128
  ei
  out   ($99),a
  ld    c,$9b
.vdpready:
  ld    a,2
  di
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)
  rra
  ld    a,0
  out   ($99),a
  ld    a,15+128
  ei
  out   ($99),a
  jr    c,.vdpready
  ret

currentpage:                ds  1
sprcoltableaddress:         ds  2
spratttableaddress:         ds  2
sprchatableaddress:         ds  2
invissprcoltableaddress:    ds  2
invisspratttableaddress:    ds  2
invissprchatableaddress:    ds  2

SetPalette:
	xor		a
	di
	out		($99),a
	ld		a,16+128
	out		($99),a
	ld		bc,$209A
	otir
	ei
	ret

;
;Set VDP port #98 to start reading at address AHL (17-bit)
;
SetVdp_Read:  rlc     h
              rla
              rlc     h
              rla
              srl     h
              srl     h
              di
              out     ($99),a           ;set bits 15-17
              ld      a,14+128
              out     ($99),a
              ld      a,l               ;set bits 0-7
;              nop
              out     ($99),a
              ld      a,h               ;set bits 8-14
              ei                        ; + read access
              out     ($99),a
              ret
              
;
;Set VDP port #98 to start writing at address AHL (17-bit)
;
SetVdp_Write: 
;first set register 14 (actually this only needs to be done once
	rlc     h
	rla
	rlc     h
	rla
	srl     h
	srl     h
	di
	out     ($99),a                       ;set bits 15-17
	ld      a,14+128
	out     ($99),a
;/first set register 14 (actually this only needs to be done once

	ld      a,l                           ;set bits 0-7
;	nop
	out     ($99),a
	ld      a,h                           ;set bits 8-14
	or      64                            ; + write access
	ei
	out     ($99),a       
	ret

Depack:                                 ;In: HL: source, DE: destination
	inc	hl		                            ;skip original file length
	inc	hl		                            ;which is stored in 4 bytes
	inc	hl
	inc	hl

	ld	a,128
	
	exx
	ld	de,1
	exx
	
.depack_loop:
	call .getbits
	jr	c,.output_compressed	            ;if set, we got lz77 compression
	ldi				                            ;copy byte from compressed data to destination (literal byte)

	jr	.depack_loop
	
;handle compressed data
.output_compressed:
	ld	c,(hl)		                        ;get lowest 7 bits of offset, plus offset extension bit
	inc	hl		                            ;to next byte in compressed data

.output_match:
	ld	b,0
	bit	7,c
	jr	z,.output_match1	                ;no need to get extra bits if carry not set

	call .getbits
	call .rlbgetbits
	call .rlbgetbits
	call .rlbgetbits

	jr	c,.output_match1	                ;since extension mark already makes bit 7 set 
	res	7,c		                            ;only clear it if the bit should be cleared
.output_match1:
	inc	bc
	
;return a gamma-encoded value
;length returned in HL
	exx			                              ;to second register set!
	ld	h,d
	ld	l,e                               ;initial length to 1
	ld	b,e		                            ;bitcount to 1

;determine number of bits used to encode value
.get_gamma_value_size:
	exx
	call .getbits
	exx
	jr	nc,.get_gamma_value_size_end	    ;if bit not set, bitlength of remaining is known
	inc	b				                          ;increase bitcount
	jr	.get_gamma_value_size		          ;repeat...

.get_gamma_value_bits:
	exx
	call .getbits
	exx
	
	adc	hl,hl				                      ;insert new bit in HL
.get_gamma_value_size_end:
	djnz	.get_gamma_value_bits		        ;repeat if more bits to go

.get_gamma_value_end:
	inc	hl		                            ;length was stored as length-2 so correct this
	exx			                              ;back to normal register set
	
	ret	c
;HL' = length

	push	hl		                          ;address compressed data on stack

	exx
	push	hl		                          ;match length on stack
	exx

	ld	h,d
	ld	l,e		                            ;destination address in HL...
	sbc	hl,bc		                          ;calculate source address

	pop	bc		                            ;match length from stack

	ldir			                            ;transfer data

	pop	hl		                            ;address compressed data back from stack

	jr	.depack_loop

.rlbgetbits:
	rl b
.getbits:
	add	a,a
	ret	nz
	ld	a,(hl)
	inc	hl
	rla
	ret    

;DoubleTapCounter:         db  1
freezecontrols?:          db  0
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
PopulateControls:
  ld    a,(freezecontrols?)
  or    a
  jp    nz,.freezecontrols
	
	ld		a,15		                        ; select joystick port 1
	di
	out		($a0),a
	ld		a,$8f
	out		($a1),a
	ld		a,14		                        ; read joystick data
	out		($a0),a
	ei
	in		a,($a2)
	cpl
	and		$3f			                        ; 00BARLDU
	ld		c,a

	ld		de,$04F0
	
	in		a,($aa)
	and		e
	or		6
	out		($aa),a
	in		a,($a9)
	cpl
	and		$20			                        ; 'F1' key
	rlca				                          ; 01000000
	or		c
	ld		c,a			                        ; 01BARLDU
	
	in		a,($aa)	                        ; M = B-trigger
	and		e
	or		d
	out		($aa),a
	in		a,($a9)
	cpl
	and		d			                          ; xxxxxBxx
	ld		b,a
	in		a,($aa)
	and		e
	or		8
	out		($aa),a
	in		a,($a9)
	cpl					                          ; RDULxxxA
	and		$F1		                          ; RDUL000A
	rlca				                          ; DUL000AR
	or		b			                          ; DUL00BAR
	rla					                          ; UL00BAR0
	rla					                          ; L00BAR0D
	rla					                          ; 00BAR0DU
	ld		b,a
	rla					                          ; 0BAR0DUL
	rla					                          ; BAR0DUL0
	rla					                          ; AR0DUL00
	and		d			                          ; 00000L00
	or		b			                          ; 00BARLDU
	or		c			                          ; 51BARLDU
	
	ld		b,a
	ld		hl,Controls
	ld		a,(hl)
	xor		b
	and		b
	ld		(NewPrContr),a
	ld		(hl),b
	ret

.freezecontrols:
  xor   a
	ld		(Controls),a
	ld		(NewPrContr),a
  ret

SetScreenOff:
  ld    a,(vdp_0+1)   ;screen off
  and   %1011 1111
  jr    SetScreenon.go

SetScreenon:
  ld    a,(vdp_0+1)   ;screen on
  or    %0100 0000
  .go:
  ld    (vdp_0+1),a
  di
  out   ($99),a
  ld    a,1+128
  ei
  out   ($99),a
  ret

outix384:
  call  outix256
  jp    outix128
outix352:
  call  outix256
  jp    outix96
outix320:
  call  outix256
  jp    outix64
outix288:
  call  outix256
  jp    outix32
outix256:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix250:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix224:
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix208:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix192:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi
outix176:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix160:
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix144:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix128:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix112:
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix96:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix80:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi
outix64:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix48:
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix32:	
	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	outi	
outix16:	
	outi	outi	outi	outi	outi	outi	outi	outi
outix8:	
	outi	outi	outi	outi	outi	outi	outi	outi	
	ret	

NPCAniCount:     		db  0,0
PlayerSpriteStand: 	dw  Rstanding
StartConversation?:	db	0

NPCConv012:
  db    SwitchCharacter,CharacterPortraitVessel,"Still here. Anything new?"
  db    SwitchCharacter,CharacterPortraitAI,"No changes. Continue training. We will land in "
	TextLandinDays: 		db 	"x days "
	TextLandinHours:		db	"xx hours and "
	TextLandinMinutes:	db	"xx minutes.",255

AsciiOutput:    ds 2          ; Output: 2-byte ASCII (tens, units)
; Subroutine: Convert value <100 to 2-byte ASCII
; Input: A = value (0-99)
; Output: (AsciiOutput) = tens ASCII, (AsciiOutput+1) = units ASCII
ConvertToAscii:
    ; Save registers
    push bc
    push de

    ; Divide by 10 to get tens and units
    ld  b, 10             ; Divisor = 10
    ld  c, 0              ; Quotient (tens)
    ld  d, a              ; Save original value
DIV_LOOP:
    sub b                 ; A -= 10
    jr  c, DIV_DONE       ; If negative, done
    inc c                 ; Increment quotient
    jr  DIV_LOOP
DIV_DONE:
    add a, b              ; Restore remainder (units)
    ld  e, a              ; E = units
    ld  a, c              ; A = tens

    ; Convert tens to ASCII
    add a, 0x30           ; A = tens + '0'
    ld  (AsciiOutput), a  ; Store tens ASCII

    ; Convert units to ASCII
    ld  a, e              ; A = units
    add a, 0x30           ; A = units + '0'
    ld  (AsciiOutput+1), a ; Store units ASCII

    ; Restore registers
    pop de
    pop bc
    ret

endenginepage3:
dephase
enginepage3length:	Equ	$-enginepage3

variables: org $c000+enginepage3length
slot:						
;.ram:		                    equ	  $e000
;.page1rom:	                equ	  slot.ram+1
;.page2rom:	                equ	  slot.ram+2
;.page12rom:	                equ	  slot.ram+3
;memblocks:
;.1:			                    equ	  slot.ram+4
;.2:			                    equ	  slot.ram+5
;.3:			                    equ	  slot.ram+6
;.4:			                    equ	  slot.ram+7

.ram:		                    rb    1
.page1rom:	                rb    1
.page2rom:	                rb    1
.page12rom:	                rb    1

memblocks:
.1:			                    rb    1
.2:			                    rb    1

Replayer_Currentbank: equ $-1

;.3:			                    rb    1
;.4:			                    rb    1

;VDP_0:		                  equ   $F3DF
;VDP_8:		                  equ   $FFE7

VDP_0:		                  rb    8
VDP_8:		                  rb    30

;SecondsEenheden:   					rb		1  ; Units of day (0-9)
;SecondsTientallen: 					rb		1  ; Tens of day (0-3)
;MinutesEenheden:        		rb		1  ; Units of month (0-9)
;MinutesTientallen:      		rb		1  ; Tens of month (0-1)
;HoursEenheden:         			rb		1  ; Units of year (0-9) (you still need to add +1980 to the year)
;HoursTientallen:       			rb		1  ; Tens of year (0-9)
DayOfMonthEenheden:   			rb		1  ; Units of day (0-9)
DayOfMonthTientallen: 			rb		1  ; Tens of day (0-3)
MonthEenheden:        			rb		1  ; Units of month (0-9)
MonthTientallen:      			rb		1  ; Tens of month (0-1)
YearEenheden:         			rb		1  ; Units of year (0-9) (you still need to add +1980 to the year)
YearTientallen:       			rb		1  ; Tens of year (0-9)

ComputerID:                 rb    1       ;3=turbo r, 2=msx2+, 1=msx2, 0=msx1
;CPUMode:                    rb    1       ;%000 0000 = Z80 (ROM) mode, %0000 0001 = R800 ROM  mode, %0000 0010 = R800 DRAM mode
TurboOn?:                   rb    1       ;0=no, $c3=yes

engaddr:	                  equ	  $03e
loader.address:             equ   $8000
enginepage3addr:            equ   $c000

sx:                         equ   0
sy:                         equ   2
spage:                      equ   3
dx:                         equ   4
dy:                         equ   6
dpage:                      equ   7 
nx:                         equ   8
ny:                         equ   10
clr:                        equ   12
copydirection:              equ   13
copytype:                   equ   14

framecounter:               rb    1

Controls:	                  rb		1
NewPrContr:	                rb		1
oldControls: 				        rb    1

base: 											equ $4000
spatpointer:                rb		2
PageOnNextVblank:           rb    1
ChangeRoom?:         				rb    1
SkipAssignOrder?:    				rb    1
TileMap:  									rb		2

;SF2 global properties for current object and frame
screenpage:									rb		1
blitpage:										rb		1
ObjectFrame:								rb		2
Objecty:										rb		1
Objectx:										rb		1
ScreenOnDelay:							rb		1				;amount of frames until screen turns on (we need some frames to first put all objects in screen)
ShowConversationCloud?:			rb		1
Cloudy:											rb		1
Cloudx:											rb		1
ShowPressTriggerAIcon?:			rb		1
TriggerAy:									rb		1
TriggerAx:									rb		1
TotalMinutesUntilLandCounter: rb	1


endenginepage3variables:  equ $+enginepage3length
org variables

