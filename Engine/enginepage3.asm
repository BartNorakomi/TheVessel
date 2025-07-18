phase	$c000

StartAtTitleScreen?:                equ 0
MusicOn?:                           equ 0
Promo?:                             equ 0
ConversationsOn?:                  	equ 1

InitiateGame:
;  if  StartAtTitleScreen?
;  call  TitleScreen
;  endif
;  StartGame:
	call	SetScreenOff
	call	SpriteInitialize
	call	ResetVariables
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
	call	SpritesOn
  jp    LevelEngine

ResetVariables:
	xor		a
  ld    (ChangeRoom?),a
	ld		(screenpage),a
  ld    (ShowConversationCloud?),a
  ld    (InitiateWakeUp?),a
  ld    (ShowPressTriggerAIcon?),a
  ld    (SkipNPCCollision?),a
  ld    (WaitCenterScreenTimer),a
  ld    (r23onVblank),a
  ld    (r23onLineInt),a
  ld    (BuildUpNewRow?),a
  ld    (SetLineIntHeightOnVblankDrillingGame?),a
  ld    (NPCConversationsInDrillingGame?),a
  ld    (AlreadyAskedToRefuel?),a
  ld    (AskRefuelAfterOffLoadResources?),a
  ld    hl,ConvSoldier									;conversations handled bit0=intro, bit1=low fuel, bit2=low fuel short, bit3=low energy, bit4=high radiation, bit5=storage full
  res   2,(hl)
  res   4,(hl)
  res   7,(hl)
	ld		a,8
	ld		(ScreenOnDelay),a								;amount of frames until screen turns on (we need some frames to first put all objects in screen)
	ld		a,1															;main player on (he gets turned off when playing a game)
	ld		(Object1+on?),a

	ld		hl,spat
	ld		de,4
	ld		b,32
	.ClearSpatLoop:
	ld		(hl),230
	add		hl,de
	djnz	.ClearSpatLoop
	ret

INCLUDE "RePlayer.asm"
;														on?,  y,  x,  sprite restore table,sprite data,put on frame ,movement routine block,  movement routine,							 phase,var1,var2,var3

ObjectGirl:  							db  1,110,050 | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw GirlMovementRoutine				| db 000,000 ,000, 000
ObjectCapGirl:  					db  1,071,100 | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw CapGirlMovementRoutine		| db 000,000 ,000, 000
ObjectRedHeadBoy:  				db  1,102,220 | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw RedHeadBoyMovementRoutine	| db 000,000 ,000, 000
ObjectHost:  							db  1,000,000 | dw 000,000					,Host_0     | db 255      ,MovementRoutinesBlock | dw HostMovementRoutine				| db 000,000 ,000, 000
ObjectWall:  							db  1,055,172 | dw 000,000					,Wall_0     | db 255      ,MovementRoutinesBlock | dw WallMovementRoutine				| db 000,000 ,000, 000
;ObjectWall:  							db  1,105,048 | dw 000,000					,Wall_0     | db 255      ,MovementRoutinesBlock | dw WallMovementRoutine				| db 000,000 ,000, 000

ObjectBackRoomGame:  			db  1,095,118 | dw 000,000					,BRGame_0   | db 255			,MovementRoutinesBlock | dw BackRoomGameRoutine				| db 000,000 ,000, 000
ObjectEntitya: 						db  1,028,132 | dw 000,000					,Entity_a  	| db 001			,MovementRoutinesBlock | dw EntityaRoutine						| db 000,000 ,000, 000
ObjectEntityb: 						db  1,028,132 | dw 000,000					,Entity_b  	| db 002			,MovementRoutinesBlock | dw EntitybRoutine						| db 000,000 ,000, 000
ObjectEntityc: 						db  1,028,132 | dw 000,000					,Entity_c  	| db 003			,MovementRoutinesBlock | dw EntitycRoutine						| db 000,000 ,000, 000

EventArcadeHall1:					db	1,0,0     | dw 000,000					,000   			| db 255      ,MovementRoutinesBlock | dw ArcadeHall1EventRoutine		| db 000,000 ,000, 000
EventArcadeHall2: 				db	1,0,0     | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw ArcadeHall2EventRoutine		| db 000,000 ,000, 000
EventSirens: 							db	1,0,0     | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw SirensRoutine							| db 000,000 ,000, 000

EventBiopod: 							db	1,052,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw BiopodEventRoutine				| db 000,000 ,000, 000
ObjectBiopod1: 						db  1,050,198 | dw 000,000					,Biopod_0  	| db 001			,MovementRoutinesBlock | dw BioPod1Routine						| db 000,000 ,000, 000
ObjectBiopod2: 						db  1,050,064 | dw 000,000					,Biopod_1  	| db 001			,MovementRoutinesBlock | dw BioPod2Routine						| db 000,000 ,000, 000
ObjectBiopod3: 						db  1,029,128 | dw 000,000					,Biopod_2  	| db 001			,MovementRoutinesBlock | dw BioPodBlinkingLightRoutine| db 000,000 ,000, 000

EventHydroponicsbay: 			db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw HydroponicsbayEventRoutine| db 000,000 ,000, 000
Objecthydroponicsbay1: 		db  1,094,042 | dw 000,000	,hydroponicsbay_0  	| db 001			,MovementRoutinesBlock | dw hydroponicsbay1Routine		| db 000,000 ,000, 000
Objecthydroponicsbay2: 		db  1,102,178 | dw 000,000	,hydroponicsbay_1  	| db 001			,MovementRoutinesBlock | dw hydroponicsbay2Routine		| db 000,000 ,000, 000
Objecthydroponicsbay3: 		db  1,102,178 | dw 000,000	,hydroponicsbay_2  	| db 001			,MovementRoutinesBlock | dw hydroponicsbay3Routine		| db 000,000 ,000, 000

EventHangarbay: 					db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw HangarbayEventRoutine			| db 000,000 ,000, 000
Objecthangarbay1: 				db  1,077,134 | dw 000,000	,hangarbay_0  			| db 001			,MovementRoutinesBlock | dw hangarbay1Routine					| db 000,000 ,000, 000
Objecthangarbay2: 				db  1,077,134 | dw 000,000	,hangarbay_1  			| db 001			,MovementRoutinesBlock | dw hangarbay2Routine					| db 000,000 ,000, 000
Objecthangarbay3: 				db  1,077,134 | dw 000,000	,hangarbay_2  			| db 001			,MovementRoutinesBlock | dw hangarbay3Routine					| db 000,000 ,000, 000

EventTrainingdeck: 				db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw TrainingdeckEventRoutine	| db 000,000 ,000, 000
Objecttrainingdeck1: 			db  1,099,254 | dw 000,000	,trainingdeck_0  		| db 001			,MovementRoutinesBlock | dw trainingdeck1Routine			| db 000,000 ,000, 000
Objecttrainingdeck2: 			db  1,087,000 | dw 000,000	,trainingdeck_1  		| db 001			,MovementRoutinesBlock | dw trainingdeck2Routine			| db 000,000 ,000, 000
Objecttrainingdeck3: 			db  1,104,054 | dw 000,000	,trainingdeck_2  		| db 001			,MovementRoutinesBlock | dw trainingdeck3Routine			| db 000,000 ,000, 000

Eventreactorchamber:			db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw reactorchamberEventRoutine| db 000,000 ,000, 000
;Objectreactorchamber1: 		db  1,030,128 | dw 000,000	,reactorchamber_0  	| db 001			,MovementRoutinesBlock | dw reactorchamber1Routine		| db 000,000 ,000, 000
;Objectreactorchamber2: 		db  1,030,128 | dw 000,000	,reactorchamber_1  	| db 001			,MovementRoutinesBlock | dw reactorchamber2Routine		| db 000,000 ,000, 000
;Objectreactorchamber3: 		db  1,030,128 | dw 000,000	,reactorchamber_2  	| db 001			,MovementRoutinesBlock | dw reactorchamber3Routine		| db 000,000 ,000, 000

Objectreactorchamber1: 		db  1,030,128 | dw 000,000	,reactorchamber_0  	| db 001			,MovementRoutinesBlock | dw reactorchamber1Routine		| db 000,000 ,000, 000
Objectreactorchamber2: 		db  1,066,128 | dw 000,000	,reactorchamber_1  	| db 001			,MovementRoutinesBlock | dw reactorchamber2Routine		| db 000,000 ,000, 000
Objectreactorchamber3: 		db  1,066,128 | dw 000,000	,reactorchamber_2  	| db 001			,MovementRoutinesBlock | dw reactorchamber3Routine		| db 000,000 ,000, 000


Eventarmoryvault:					db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw armoryvaultEventRoutine		| db 000,000 ,000, 000
Objectarmoryvault1: 			db  0,098,250 | dw 000,000	,armoryvault_0  		| db 001			,MovementRoutinesBlock | dw armoryvault1Routine				| db 000,000 ,000, 000


Eventsleepingquarters:		db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw sleepingquartersEventRoutine| db 000,000 ,000, 000

Eventholodeck:						db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw holodeckEventRoutine			| db 000,000 ,000, 000
Objectholodeck1: 					db  1,017,000 | dw 000,000	,holodeck_0					| db 001			,MovementRoutinesBlock | dw holodeck1Routine					| db 000,000 ,000, 000
Objectholodeck2: 					db  1,017,000 | dw 000,000	,holodeck_1					| db 001			,MovementRoutinesBlock | dw holodeck2Routine					| db 000,000 ,000, 000


Eventmedicalbay:					db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw medicalbayEventRoutine		| db 000,000 ,000, 000
Objectmedicalbay1: 				db  1,070,070 | dw 000,000	,medicalbay_0  			| db 001			,MovementRoutinesBlock | dw medicalbay1Routine				| db 000,000 ,000, 000
Objectmedicalbay2: 				db  1,070,070 | dw 000,000	,medicalbay_1  			| db 001			,MovementRoutinesBlock | dw medicalbay2Routine				| db 000,000 ,000, 000


Eventsciencelab:					db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw sciencelabEventRoutine		| db 000,000 ,000, 000

EventDrillingGame:				db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutinesBlock | dw DrillMachineEventRoutine	| db 000,000 ,000, 000

EventUpgradeMenu:					db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutines2Block| dw UpgradeMenuEventRoutine		| db 000,000 ,000, 000

EventDrillingLocations:		db	1,$28,$7e | dw 000,000					,000        | db 255      ,MovementRoutines2Block| dw DrillingLocationsRoutine	| db 000,000 ,000, 000



LenghtDoCopyTable:  equ	RestoreBackgroundObject1Page1-RestoreBackgroundObject1Page0
ResetRestoreBackgroundTables:
  ld    ix,RestoreBackgroundObject1Page0
  ld    de,LenghtDoCopyTable
  ld    b,16                           	;amount of tables

  .loop:
  xor   a
  ld    (ix+sx),a
  ld    (ix+sy),a
  ld    (ix+dx),a
  ld    (ix+dy),a
  ld    (ix+nx),2
  ld    (ix+ny),1
  add   ix,de                         	;next table
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

SectorErase4000hto5fffh:                          ;erases sector (in hl=pointer to romblock)
	ld		hl,$4000

  ld    a,$aa
  ld    ($4aaa),a

  ld    a,$55
  ld    ($4555),a

  ld    a,$80
  ld    ($4aaa),a

  ld    a,$aa
  ld    ($4aaa),a

  ld    a,$55
  ld    ($4555),a

  ld    a,$30
  ld    (hl),a

.CheckEraseDone:
;  ld    hl,8000H    ; adres in sector die gewist word
	ld    a,0FFH      ; als het klaar is moet het FFH zijn
  .Erase_Wait:
	cp    (hl)        ; is de erase klaar?
	ret   z          ; ja, klaar
	jr    .Erase_Wait  ; nee, nog bezig, wacht


SectorErase6000hto7fffh:           		;erases sector (in hl=pointer to romblock)
	ld		hl,$7000											;we cant use hl=$6000, cuz this changes the bank selection

  ld    a,$aa
  ld    ($7aaa),a

  ld    a,$55
  ld    ($7555),a

  ld    a,$80
  ld    ($7aaa),a

  ld    a,$aa
  ld    ($7aaa),a

  ld    a,$55
  ld    ($7555),a

  ld    a,$30
  ld    (hl),a

.CheckEraseDone:
;  ld    hl,8000H    ; adres in sector die gewist word
	ld    a,0FFH      ; als het klaar is moet het FFH zijn
  .Erase_Wait:
	cp    (hl)        ; is de erase klaar?
	ret   z          ; ja, klaar
	jr    .Erase_Wait  ; nee, nog bezig, wacht

SectorErase4000hto5fffh_or_6000hto7fffh:
	ld		hl,$4000
  call  CompareHLwithDE
	jr		z,SectorErase4000hto5fffh
	jr		SectorErase6000hto7fffh

SaveDrillingGameMap:
  ld    a,(slot.page12rom)            	;all RAM except page 1+2
  out   ($a8),a


  ld    a,(DigSiteSelected)
	dec		a
  ld    l,DrillingGameMap01Block       	;drilling game map
	ld		de,DrillingGameMap01Address			;address in rom we write to
	ld		bc,DrillingGameMap01Size
	jr		z,.MapFound
	dec		a
  ld    l,DrillingGameMap02Block       	;drilling game map
	ld		de,DrillingGameMap02Address			;address in rom we write to
	ld		bc,DrillingGameMap02Size
	jr		z,.MapFound
	dec		a
  ld    l,DrillingGameMap03Block       	;drilling game map
	ld		de,DrillingGameMap03Address			;address in rom we write to
	ld		bc,DrillingGameMap03Size
	jr		z,.MapFound
	dec		a
  ld    l,DrillingGameMap04Block       	;drilling game map
	ld		de,DrillingGameMap04Address			;address in rom we write to
	ld		bc,DrillingGameMap04Size
	jr		z,.MapFound
	dec		a
  ld    l,DrillingGameMap05Block       	;drilling game map
	ld		de,DrillingGameMap05Address			;address in rom we write to
	ld		bc,DrillingGameMap05Size
	.MapFound:

  ld    a,l											       	;drilling game map
  call  block12                       	;CARE!!! we can only switch block34 if page 1 is in rom  

  di                                  ;we keep int disabled when accessing (reading and writing) upper 4MB, because the int. revert changes made to the map switching

	call	SectorErase4000hto5fffh_or_6000hto7fffh

	;drilling game map is in ram at $8000
  ld    a,(slot.page1rom)              	;all RAM except page 1+2
  out   ($a8),a      

  ;write save data for current game to flashrom
  ld    hl,$8000
  call  FlashWrite

	ld		a,MovementRoutinesBlock
  call  block12                             ;CARE!!! we can only switch block34 if page 1 is in rom  
	ret

FlashWrite6000hto8000h:                           ;in: hl->source, de->destination, bc->amount
  ld    a,$AA                         ; magic bytes (om per ongeluk schrijven te voorkomen)
  ld    ($4AAA),a
  ld    a,$55
  ld    ($4555),a
  ld    a,$A0                         ; program commando
  ld    ($4AAA),a

  ld    a,(hl)
  ld    (de),a

  .CheckIfWritten:
  ld    a,(de)
  cp    (hl)
  jr    nz,.CheckIfWritten


  inc   hl
  inc   de
  dec   bc

  ld    a,b
  or    c
  jr    nz,FlashWrite
  ret

FlashWrite:                           ;in: hl->source, de->destination, bc->amount
  ld    a,$AA                         ; magic bytes (om per ongeluk schrijven te voorkomen)
  ld    ($4AAA),a
  ld    a,$55
  ld    ($4555),a
  ld    a,$A0                         ; program commando
  ld    ($4AAA),a

  ld    a,(hl)
  ld    (de),a

  .CheckIfWritten:
  ld    a,(de)
  cp    (hl)
  jr    nz,.CheckIfWritten

  inc   hl
  inc   de
  dec   bc

  ld    a,b
  or    c
  jr    nz,FlashWrite
  ret


LoadTileMap:
	ld		a,(CurrentRoom)									;0=arcadehall1, 1=arcadehall2
	or		a
	jp		z,.ArcadeHall1
	dec		a
	jp		z,.ArcadeHall2
	dec		a
	jp		z,.Biopod
	dec		a
	jp		z,.Hydroponicsbay
	dec		a
	jp		z,.Hangarbay
	dec		a
	jp		z,.Trainingdeck
	dec		a
	jp		z,.reactorchamber
	dec		a
	jp		z,.sleepingquarters
	dec		a
	jp		z,.armoryvault
	dec		a
	jp		z,.holodeck
	dec		a
	jp		z,.medicalbay
	dec		a
	jp		z,.sciencelab
	dec		a
	jp		z,.drillinggame
	dec		a
	jp		z,.upgrademenu
	dec		a
	jp		z,.drillinglocations
	ret

	.drillinglocations:
	ret

	.upgrademenu:
	ret

	.drillinggame:
  ld    a,(slot.page1rom)              	;all RAM except page 1+2
  out   ($a8),a      

  ld    a,(DigSiteSelected)
	dec		a
  ld    b,DrillingGameMap01Block       	;drilling game map
	ld		hl,DrillingGameMap01Address			;address in rom
	jr		z,.CopyMapToRam
	dec		a
  ld    b,DrillingGameMap02Block       	;drilling game map
	ld		hl,DrillingGameMap02Address			;address in rom
	jr		z,.CopyMapToRam
	dec		a
  ld    b,DrillingGameMap03Block       	;drilling game map
	ld		hl,DrillingGameMap03Address			;address in rom
	jr		z,.CopyMapToRam
	dec		a
  ld    b,DrillingGameMap04Block       	;drilling game map
	ld		hl,DrillingGameMap04Address			;address in rom
	jr		z,.CopyMapToRam
	dec		a
  ld    b,DrillingGameMap05Block       	;drilling game map
	ld		hl,DrillingGameMap05Address			;address in rom
	.CopyMapToRam:

  ld    a,b											       	;drilling game map
  call  block12                       	;CARE!!! we can only switch block34 if page 1 is in rom  

;	ld		hl,$4000
	ld		de,$8000
	ld		bc,$4000
	ldir																	;copy drilling game tilemap to $8000 in ram

  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
	ret

	.sciencelab:
	ld		a,sciencelabTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,sciencelabTileMap
	ld		(TileMap),hl
	ret

	.armoryvault:
	ld		a,armoryvaultTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,armoryvaultTileMap
	ld		(TileMap),hl
	ret

	.holodeck:
	ld		a,holodeckTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,holodeckTileMap
	ld		(TileMap),hl
	ret

	.medicalbay:
	ld		a,medicalbayTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,medicalbayTileMap
	ld		(TileMap),hl
	ret

	.sleepingquarters:
	ld		a,sleepingquartersTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,sleepingquartersTileMap
	ld		(TileMap),hl
	ret

	.reactorchamber:
	ld		a,reactorchamberTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,reactorchamberTileMap
	ld		(TileMap),hl
	ret

	.Trainingdeck:
	ld		a,trainingdeckTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,trainingdeckTileMap
	ld		(TileMap),hl
	ret

	.Hangarbay:
	ld		a,hangarbayTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,hangarbayTileMap
	ld		(TileMap),hl
	ret

	.Hydroponicsbay:
	ld		a,hydroponicsbayTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,hydroponicsbayTileMap
	ld		(TileMap),hl
	ret

	.Biopod:
	ld		a,BiopodTileMapBlock
	ld		(TileMapBlock),a
	ld		hl,BiopodTileMap
	ld		(TileMap),hl
	ret

	.ArcadeHall1:
	ld		a,ArcadeHall1TileMapBlock
	ld		(TileMapBlock),a
	ld		hl,ArcadeHall1TileMap
	ld		(TileMap),hl
	ret

	.ArcadeHall2:
	ld		a,ArcadeHall2TileMapBlock
	ld		(TileMapBlock),a
	ld		hl,ArcadeHall2TileMap
	ld		(TileMap),hl

	ld		a,(HighScoreBackroomGame)
	cp		100
	ret		c

	ld		a,ArcadeHall2EntityTileMapBlock
	ld		(TileMapBlock),a
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
	jp		z,PutObjectsArcadeHall1
	dec		a
	jp		z,PutObjectsArcadeHall2
	dec		a
	jp		z,PutObjectsBiopod
	dec		a
	jp		z,PutObjectsHydroponicsbay
	dec		a
	jp		z,PutObjectsHangarbay
	dec		a
	jp		z,PutObjectsTrainingdeck
	dec		a
	jp		z,PutObjectsreactorchamber
	dec		a
	jp		z,PutObjectssleepingquarters
	dec		a
	jp		z,PutObjectsarmoryvault
	dec		a
	jp		z,PutObjectsholodeck
	dec		a
	jp		z,PutObjectsmedicalbay
	dec		a
	jp		z,PutObjectssciencelab
	dec		a
	jp		z,PutObjectsDrillingGame
	dec		a
	jp		z,PutObjectsUpgradeMenu
	dec		a
	jp		z,PutObjectsDrillingLocations
	ret

PutObjectsDrillingLocations:
	xor		a																;turn off main player sprite (we don't use this at the games)
	ld		(Object1+on?),a

	ld		de,ObjEvent1										;now put events

	ld		hl,EventDrillingLocations				;put drilling locations event
	call	PutSingleObject
	ret


PutObjectsUpgradeMenu:
	xor		a																;turn off main player sprite (we don't use this at the games)
	ld		(Object1+on?),a

	ld		de,ObjEvent1										;now put events

	ld		hl,EventUpgradeMenu							;put upgrade menu game event
	call	PutSingleObject
	ret

PutObjectsDrillingGame:
	xor		a																;turn off main player sprite (we don't use this at the games)
	ld		(Object1+on?),a

	ld		de,ObjEvent1										;now put events

	ld		hl,EventDrillingGame						;put drilling game event
	call	PutSingleObject
	ret

PutObjectssciencelab:
	ld		de,ObjEvent1										;now put events

	ld		hl,Eventsciencelab							;put sciencelab event
	call	PutSingleObject
	ret

PutObjectsarmoryvault:
	ld		hl,Objectarmoryvault1						;put armoryvault 1
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,Eventarmoryvault							;put armoryvault event
	call	PutSingleObject
	ret

PutObjectsholodeck:
	ld		hl,Objectholodeck1						;put holodeck 1
	call	PutSingleObject 
	ld		hl,Objectholodeck2						;put holodeck 2
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,Eventholodeck								;put holodeck event
	call	PutSingleObject
	ret

PutObjectsmedicalbay:
	ld		hl,Objectmedicalbay1						;put medicalbay 1
	call	PutSingleObject 
	ld		hl,Objectmedicalbay2						;put medicalbay 2
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,Eventmedicalbay							;put medicalbay event
	call	PutSingleObject
	ret

PutObjectssleepingquarters:
	ld		de,ObjEvent1										;now put events

	ld		hl,Eventsleepingquarters				;put sleepingquarters event
	call	PutSingleObject
	ret

PutObjectsreactorchamber:
	ld		hl,Objectreactorchamber1				;put reactorchamber 1
	call	PutSingleObject 
	ld		hl,Objectreactorchamber2				;put reactorchamber 2
	call	PutSingleObject 
	ld		hl,Objectreactorchamber3				;put reactorchamber 3
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,Eventreactorchamber					;put reactorchamber event
	call	PutSingleObject
	ret

PutObjectsHydroponicsbay:
	ld		hl,Objecthydroponicsbay1				;put hydroponicsbay 1 (left)
	call	PutSingleObject 
	ld		hl,Objecthydroponicsbay2				;put hydroponicsbay 2 (right)
	call	PutSingleObject 
	ld		hl,Objecthydroponicsbay3				;put hydroponicsbay 3 (right)
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,EventHydroponicsbay					;put hydroponicsbay event
	call	PutSingleObject
	ret

PutObjectsHangarbay:
	ld		hl,Objecthangarbay1							;put hangarbay 1 (left)
	call	PutSingleObject 
	ld		hl,Objecthangarbay2							;put hangarbay 2 (right)
	call	PutSingleObject 
	ld		hl,Objecthangarbay3							;put hangarbay 3 (right)
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,EventHangarbay								;put hangarbay event
	call	PutSingleObject
	ret

PutObjectsTrainingdeck:
	ld		hl,Objecttrainingdeck1					;put trainingdeck 1 (right wall)
	call	PutSingleObject 
	ld		hl,Objecttrainingdeck2					;put trainingdeck 2 (left wall)
	call	PutSingleObject 
	ld		hl,Objecttrainingdeck3					;put trainingdeck 3 (treadmill)
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,EventTrainingdeck						;put trainingdeck event
	call	PutSingleObject
	ret

PutObjectsBiopod:
	ld		hl,ObjectBiopod1								;put biopod 1 (left)
	call	PutSingleObject 
	ld		hl,ObjectBiopod2								;put biopod 2 (right)
	call	PutSingleObject 
	ld		hl,ObjectBiopod3								;put blinking light
	call	PutSingleObject 

	ld		de,ObjEvent1										;now put events

	ld		hl,EventBiopod									;put biopod event
	call	PutSingleObject
	ret

PutObjectsArcadeHall2:
	;set starting coordinates player
	ld		a,118														;y
	ld		(Object1+y),a
	ld		a,206														;x
	ld		(Object1+x),a

	ld		hl,LStanding
  ld    (PlayerSpriteStand),hl

	ld		a,(HighScoreBackroomGame)
	cp		100
	jr		c,.BackRoomGameNotYetFinished

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
;	call  LoadArcadeHall1redlightsGfx 		;loads the red lights in page and

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
  incbin "..\grapx\arcadehall1\arcade1.SC5",$7680+7,32
ArcadeHall2Palette:                    	;palette file
  incbin "..\grapx\arcadehall2\arcade2.SC5",$7680+7,32
BiopodPalette:                    			;palette file
  incbin "..\grapx\ship\biopod\biopod.SC5",$7680+7,32
HydroponicsbayPalette:                    			;palette file
  incbin "..\grapx\ship\hydroponicsbay\hydroponicsbay.SC5",$7680+7,32
HangarbayPalette:                    			;palette file
  incbin "..\grapx\ship\hangarbay\hangarbay.SC5",$7680+7,32
TrainingdeckPalette:                    			;palette file
  incbin "..\grapx\ship\trainingdeck\trainingdeck.SC5",$7680+7,32
reactorchamberPalette:                    			;palette file
  incbin "..\grapx\ship\reactorchamber\reactorchamber.SC5",$7680+7,32
sleepingquartersPalette:                    			;palette file
  incbin "..\grapx\ship\sleepingquarters\sleepingquarters.SC5",$7680+7,32
armoryvaultPalette:                    			;palette file
  incbin "..\grapx\ship\armoryvault\armoryvault.SC5",$7680+7,32
holodeckPalette:                    			;palette file
  incbin "..\grapx\ship\holodeck\holodeck.SC5",$7680+7,32
medicalbayPalette:                    			;palette file
  incbin "..\grapx\ship\medicalbay\medicalbay.SC5",$7680+7,32
sciencelabPalette:                    			;palette file
  incbin "..\grapx\ship\sciencelab\sciencelab.SC5",$7680+7,32
drillinggamePalette:                    			;palette file
  incbin "..\grapx\drillinggame\maps\tileset.SC5",$7680+7,32
upgrademenuPalette:                    			;palette file
  incbin "..\grapx\ship\sciencelab\upgrademenu2.SC5",$7680+7,32
DrillingLocationsPalette:
  incbin "..\grapx\drillinglocations\drillinglocations.SC5",$7680+7,32

LoadRoomGfx:
	ld		a,(CurrentRoom)									;0=arcadehall1, 1=arcadehall2
	or		a
	jp		z,LoadArcadeHall1Gfx            ;loads the initial starting arcade room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadArcadeHall2Gfx            ;loads the 2nd arcade room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadBiopodGfx            			;loads the biopod room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadHydroponicsbayGfx      		;loads the hydroponicsbay room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadHangarbayGfx      				;loads the hangarbay room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadTrainingdeckGfx      			;loads the training deck room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadreactorchamberGfx      		;loads the reactorchamber room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadsleepingquartersGfx      	;loads the sleepingquarters room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadarmoryvaultGfx      			;loads the sleepingquarters room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadholodeckGfx      					;loads the sleepingquarters room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadmedicalbayGfx      				;loads the sleepingquarters room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadsciencelabGfx      				;loads the sleepingquarters room in all 4 pages, and sets palette
	dec		a
	jp		z,LoadDrillingGameGfx      			;loads the drilling game tiles , and sets palette
	dec		a
	jp		z,LoadUpgradeMenuGfx      			;loads the upgrade menu tiles , and sets palette
	dec		a
	jp		z,LoadDrillingLocationsGfx 			;loads the drilling locations screen and sets palette
	ret

LoadDrillingLocationsGfx:
  ld    hl,DrillingLocationsPalette
  ld    a,DrillingLocationsGfxBlock     			;block to copy graphics from
	jp		LoadGfx212High

LoadUpgradeMenuGfx:
  ld    hl,upgrademenuPalette
  ld    a,UpgradeMenuGfxBlock     			;block to copy graphics from
	jp		LoadGfx212High

LoadDrillingGameGfx:
  ld    hl,drillinggamePalette
  ld    a,DrillingGameGfxBlock     			;block to copy graphics from
	jp		LoadGfx256HighPage3

LoadsciencelabGfx:
  ld    hl,sciencelabPalette
  ld    a,sciencelabGfxBlock       			;block to copy graphics from
	jp		LoadGfx212High

LoadarmoryvaultGfx:
  ld    hl,armoryvaultPalette
  ld    a,armoryvaultGfxBlock       		;block to copy graphics from
	jp		LoadGfx212High

LoadholodeckGfx:
  ld    hl,holodeckPalette
  ld    a,holodeckGfxBlock       				;block to copy graphics from
	jp		LoadGfx212High

LoadmedicalbayGfx:
  ld    hl,medicalbayPalette
  ld    a,medicalbayGfxBlock       			;block to copy graphics from
	jp		LoadGfx212High

LoadsleepingquartersGfx:
  ld    hl,sleepingquartersPalette
  ld    a,sleepingquartersGfxBlock    	;block to copy graphics from
	jp		LoadGfx212High

LoadreactorchamberGfx:
  ld    hl,reactorchamberPalette
  ld    a,reactorchamberGfxBlock       	;block to copy graphics from
	jp		LoadGfx212High

LoadTrainingdeckGfx:
  ld    hl,TrainingdeckPalette
  ld    a,TrainingdeckGfxBlock       		;block to copy graphics from
	jp		LoadGfx212High

LoadHangarbayGfx:
  ld    hl,HangarbayPalette
  ld    a,HangarbayGfxBlock       			;block to copy graphics from
	jp		LoadGfx212High

LoadHydroponicsbayGfx:
  ld    hl,HydroponicsbayPalette
  ld    a,HydroponicsbayGfxBlock       	;block to copy graphics from
	jp		LoadGfx212High

LoadBiopodGfx:
  ld    hl,BiopodPalette
  ld    a,BiopodGfxBlock         				;block to copy graphics from
	jp		LoadGfx212High

LoadArcadeHall1Gfx:
  ld    hl,ArcadeHall1Palette
  ld    a,ArcadeHall1GfxBlock         	;block to copy graphics from
	jp		LoadGfx212High

;LoadArcadeHall1redlightsGfx:
;  ld    a,ArcadeHall1redlightsGfxBlock         	;block to copy graphics from
;  call  SetArcadeRedLightsGfxPage0
;  ld    a,ArcadeHall1redlightsGfxBlock         	;block to copy graphics from
;  jp		SetArcadeRedLightsGfxPage1

LoadArcadeHall2Gfx:
  ld    hl,ArcadeHall2Palette
  ld    a,ArcadeHall2GfxBlock         	;block to copy graphics from
	jp		LoadGfx212High

LoadGfx256HighPage3:
	push	hl															;current palette
	push	af
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
	pop		af
  call  .LoadGfx256HighPage3
  xor   a
  ld    (Vdp_Write_HighPage?),a
	pop		hl															;current palette
	ld		de,CurrentPalette
	ld		bc,16*2
	ldir
  ld    hl,CurrentPalette
  jp		SetPalette

.LoadGfx256HighPage3:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (000*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

LoadGfx212High:
	push	hl															;current palette
	push	af															;block to copy graphics from
  call  LoadGfx212HighPage0
  ;copy from page 0 to page 2
  ld    a,0
  ld    (CopyPageToPage212High+sPage),a
  ld    a,2
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy
	pop		af															;block to copy graphics from
  call  LoadGfx212HighPage1
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

LoadGfx212HighPage0:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (212*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

LoadGfx212HighPage1:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (212*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

;SetArcadeRedLightsGfxPage0:
;  ld    hl,$4000 + (000*128) + (000/2) - 128
;  ld    de,$0000 + (021*128) + (000/2) - 128
;  ld    bc,$0000 + (022*256) + (256/2)
;  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

;SetArcadeRedLightsGfxPage1:
;  ld    hl,$4000 + (000*128) + (000/2) - 128
;  ld    de,$0000 + (021*128) + (000/2) - 128
;  ld    bc,$0000 + (022*256) + (256/2)
;  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

SetFontPage1Y212:                       ;set font at (0,212) page 0
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (212*128) + (000/2) - 128
  ld    bc,$0000 + (039*256) + (256/2)
  ld    a,FontBlock         ;font graphics block
  jp    CopyRomToVram          ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

SetFontUpgradeMenuThickPage1Y212:     	;set font at (0,212) page 0
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (212*128) + (000/2) - 128
  ld    bc,$0000 + (039*256) + (256/2)
  ld    a,FontUpgradeMenuBlock         ;font graphics block
  jp    CopyRomToVram          ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

LoadOpenDoorGfx:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (072*128) + (104/2) - 128
  ld    bc,$0000 + (083*256) + (046/2)
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (072*128) + (104/2) - 128
  ld    bc,$0000 + (083*256) + (046/2)
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (072*128) + (104/2) - 128
  ld    bc,$0000 + (083*256) + (046/2)
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (072*128) + (104/2) - 128
  ld    bc,$0000 + (083*256) + (046/2)
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

CopyCurrentVisiblePage2ToPage0:
	db		0,0,30,2
	db		0,0,30,0
	db		0,1,182,0
	db		0,0,$d0	

CopyTileDrillingGame:
	db		192,0,032,3
	db		000,0,000,2
	db		032,0,032,0
	db		0,0,$d0	

FillCommand:
	db		0,0,0,0
	db		0,0,0,0
	db		0,0,7,0
	db		0,0,$80	

CloseBlackWindowDrillingGame2LinesTop:
	db		0,0,0,2
	db		0,0,0,0
	db		0,1,1,0
	db		0,0,$d0	

CloseBlackWindowDrillingGame2LinesBottom:
	db		0,0,0,2
	db		0,0,0,0
	db		0,1,1,0
	db		0,0,$d0	

CopySelectionWindowPage2:
	db		012,0,035,2
	db		012,0,035,1
	db		122,0,019,0
	db		0,0,$d0	

OxygenFoodWaterInnerBarFilled:
	db		0,0,0,0
	db		000,0,000,0
	db		000,0,007,0
	db		7+ (7 * 16),0,$80

AntiRadiationProtectionOrDigSiteBars:
	db		012,0,071,2
	db		101,0,081,1
	db		029,0,009,0
	db		0,0,$90

SetPinPoint:
	db		000,0,000,1
	db		000,0,000,0
	db		023,0,035,0
	db		0,0,$98

STOPWAITSPACEPRESSED:
  call  PopulateControls
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	halt
	ld		a,(NewPrContr)
	bit		4,a                             ;trig a pressed ?
	jr		z,STOPWAITSPACEPRESSED
	ret

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

	ld		a,%1110 1111	;reduce by value 32 = 16 lines lower, so %1110 1111 = color at 232, %1100 1111 = color at 216, %1010 1111 = color at 200 etc (spat = always color table + $200)  
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
	ld		a,%0000 1111	;every value = 16 lines, so %0000 1111 = char table at y=240, %0000 1110 = char table at y=224, %0000 1101 = char table at y=208 etc 
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

	call	WriteSpatToVram
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

RefuelConversation: 		db	SwitchCharacter,CharacterPortraitAI,"Refuel ? Total Credits: "
RefuelTotalCreditsText:	db	"xxxxx Refuel Cost: "
RefuelCostText:					db	"xxx Credits Trig-A=Yes Trig-B=No",255

NPCConv012:
  db    SwitchCharacter,CharacterPortraitVessel,"Still here. Anything new?"
  db    SwitchCharacter,CharacterPortraitAI,"No changes. Continue training. We will land in "
	TextLandinDays: 		db 	"x days "
	TextLandinHours:		db	"xx hours and "
	TextLandinMinutes:	db	"xx minutes.",255

NPCConv041: ;breeding room - embryo check followup  
  db    SwitchCharacter,CharacterPortraitVessel,"How are they doing?"
  db    SwitchCharacter,CharacterPortraitAI,"Embryonic life signs are stable. Nutrient intake and metabolic activity remain within optimal thresholds."
  db    SwitchCharacter,CharacterPortraitVessel,"How much time is left?"
  db    SwitchCharacter,CharacterPortraitAI
TextRemainingIncubationPeriod:
  db    "Four years, eleven months, thirty-seven days."
  db    SwitchCharacter,CharacterPortraitVessel,"Feels faster every time I check..."
  db    SwitchCharacter,CharacterPortraitAI,"Temporal perception under duress often accelerates. But the count remains absolute."
  db    SwitchCharacter,CharacterPortraitVessel,"Right. No margin for error."
  db    SwitchCharacter,CharacterPortraitAI,"Correct. When the timer reaches zero, survival must be sustainable-or it will not be.",255

NPCConv042: ;medbay <25% radiation  
  db    SwitchCharacter,CharacterPortraitVessel,"Medbay access. I could use a quick decon-feeling a bit fried from that last run."
  db    SwitchCharacter,CharacterPortraitAI,"Radiation exposure detected, but levels remain below the treatment threshold. Current contamination: "
TextRadiationLevel:	db		"22%."
  db    SwitchCharacter,CharacterPortraitAI,"Medbay protocols are reserved for critical exposure. Early use would divert essential power and compound system strain."
  db    SwitchCharacter,CharacterPortraitVessel,"It's not critical, just... uncomfortable. Thought I'd get ahead of it."
  db    SwitchCharacter,CharacterPortraitAI,"Authorization denied. Decontamination will activate only when exposure surpasses 25%."
  db    SwitchCharacter,CharacterPortraitVessel,"Right. Guess I'll tough it out a little longer."
  db    SwitchCharacter,CharacterPortraitAI,"Correct. Endure. Persist. Continue forward momentum.",255

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










; Convert a 16-bit value to ASCII decimal string
; Input: HL = 16-bit number (0-65535)
; Output: ASCII string stored at (DE), null-terminated
; Uses: AF, BC, DE, HL

NUM_TO_ASCII:
  ld    de,Ascii5Byte

    LD   BC, -10000     ; Start with ten-thousands place
    CALL CONVERT_DIGIT
    LD   BC, -1000      ; Thousands place
    CALL CONVERT_DIGIT
    LD   BC, -100       ; Hundreds place
    CALL CONVERT_DIGIT
    LD   BC, -10        ; Tens place
    CALL CONVERT_DIGIT
    LD   BC, -1        	; Ones place
    CALL CONVERT_DIGIT
		ret

CONVERT_DIGIT:
    LD   A,"0" - 1     ; Initialize digit counter
COUNT_LOOP:
    INC  A              ; Increment ASCII digit
    ADD  HL, BC         ; Subtract divisor (negative BC)
    JR   C, COUNT_LOOP  ; If no borrow, continue counting
    SBC  HL, BC         ; Add back last subtraction
    LD   (DE), A        ; Store ASCII digit
    INC  DE             ; Move to next position
    RET

Ascii5Byte:	db "29993",255






NPCAniCount:     									db  0,0
PlayerSpriteStand: 								dw  Rstanding
StartConversation?:								db	0
StartWakeUpEvent?:								db	1
OffloadResources?:								db	0




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
framecounter2:             	rb    1

Controls:	                  rb		1
NewPrContr:	                rb		1
oldControls: 				        rb    1

base: 											equ $4000
spatpointer:                rb		2
PageOnNextVblank:           rb    1
ChangeRoom?:         				rb    1
SkipAssignOrder?:    				rb    1
TileMapBlock:								rb		1
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
InitiateWakeUp?: 						rb	1
SkipNPCCollision?: 					rb	1
WaitCenterScreenTimer:			rb	1
r23onVblank:								rb	1
r23onLineInt:								rb	1
BuildUpNewRow?:							rb	1
SetLineIntHeightOnVblankDrillingGame?:	rb	1

DrillMachineCurrentlyMovingInDirection?:	rb	1	;0=not moving, 1=up, 2=right, 3=down, 4=left
DrillMachineSpeed:  				rb	2
DrillingGameCameraY:				rb	2
DrillMachineX:							rb	1
DrillMachineY:							rb	2
DrillMachineYRelative:			rb	1
DrillMachineFaceDirection:	rb	1		;1=up, 2=right, 3=down, 4=left
DrillMachineAnimationCounter:	rb	1
DrillingTime:								rb	1

DrillingTimeFrames:					rb	1
DrillingHigherLevelSoil?:		rb	1
NPCConversationsInDrillingGame?:		rb	1
TotalValueResources:				rb	2
ShowScienceLabMenu:					rb	1
CurrentScienceLabMenu:			rb	1
ScienceLabMenuItemSelected:	rb	1
AlreadyAskedToRefuel?:			rb	1
DigSiteSelected:						rb	1
AskRefuelAfterOffLoadResources?:	rb	1


endenginepage3variables:  equ $+enginepage3length
org variables

