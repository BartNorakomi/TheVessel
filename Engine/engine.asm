LevelEngine:
  ld    a,(framecounter)
  inc   a
  ld    (framecounter),a

;ld a,100
;di
;  out   ($99),a
;  ld    a,23+128
;ei
;  out   ($99),a
  call  CheckLeaveRoom


;  call  BackdropGreen
;  call  BackdropBlack


  call  SetScreenonWithDelay
  call  PopulateControls
  if ConversationsOn?
  call  HandleConversations             ;handles NPC conversations
  endif
;  call  BackdropGreen
  call  HandleObjects
;  call  BackdropBlack

  ld    a,(CurrentRoom)                 ;racing game has music outside the interrupt
  cp    15
  call  z,RePlayer_Tick                 ;initialise, load samples

  ld    a,(CurrentRoom)                 ;racing game has music outside the interrupt
  cp    15
  call  nz,WriteSpatToVram



  xor   a
  ld    hl,vblankintflag
  .checkflag:
  cp    (hl)
  jr    z,.checkflag
  ld    (hl),a
  jp    LevelEngine

SetScreenonWithDelay:
	ld		a,(ScreenOnDelay)								;amount of frames until screen turns on (we need some frames to first put all objects in screen)
  dec   a
  ret   m
	ld		(ScreenOnDelay),a								;amount of frames until screen turns on (we need some frames to first put all objects in screen)
  jp    z,SetScreenon
  ret

CheckLeaveRoom:
  ld    a,(ChangeRoom?)
  or    a
  ret   z
  pop   af
;  call  SetTempisr
  jp    InitiateGame

vblankintflag:  db  0

InterruptHandlerDrillingGame:
  push  af
  
  ld    a,1               ;set s#1
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)           ;check and acknowledge line interrupt
  rrca
  jp    c,LineIntDrillingGame ;hud split
  
  xor   a                 ;set s#0
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)           ;check and acknowledge vblank interrupt
  rlca
  jp    c,vblank          ;vblank detected, so jp to that routine
 
  pop   af 
  ei
  ret

InterruptHandler:
  push  af
  
  ld    a,1               ;set s#1
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)           ;check and acknowledge line interrupt
  rrca
  jp    c,lineint         ;ScoreboardSplit/BorderMaskingSplit
  
  xor   a                 ;set s#0
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)           ;check and acknowledge vblank interrupt
  rlca
  jp    c,vblank          ;vblank detected, so jp to that routine
 
  pop   af 
  ei
  ret

;page1bank:  ds  1
;page2bank:  ds  1
vblank:
  push  bc
  push  de
  push  hl
  push  ix
  push  iy
  exx
  ex    af,af'
  push  af
  push  bc
  push  de
  push  hl


;  call  BackdropYellow



  in	  a,($a8)
  push	af					      ;store current RAM/ROM state
  ld    a,(CurrentRoom)
  cp    15                              ;racing game has music outside the interrupt
  call  nz,RePlayer_Tick                ;initialise, load samples
  pop   af
  out   ($a8),a                         ;restore ram/rom page settings     

;  out   ($a8),a

;  ld		a,1                             ;set worldmap in bank 1 at $8000
;  out   ($fe),a          	              ;$ff = page 0 ($c000-$ffff) | $fe = page 1 ($8000-$bfff) | $fd = page 2 ($4000-$7fff) | $fc = page 3 ($0000-$3fff) 

;  ld		a,2                             ;set worldmap object layer in bank 2 at $8000
;  out   ($fe),a          	              ;$ff = page 0 ($c000-$ffff) | $fe = page 1 ($8000-$bfff) | $fd = page 2 ($4000-$7fff) | $fc = page 3 ($0000-$3fff) 

;  ld    a,(page1bank)                   ;put the bank back in page 1 which was there before we ran setspritecharacter
;  out   ($fe),a          	              ;$ff = page 0 ($c000-$ffff) | $fe = page 1 ($8000-$bfff) | $fd = page 2 ($4000-$7fff) | $fc = page 3 ($0000-$3fff) 

;  pop   af
;	ld		($7000),a                       ;recall block 2 setting
 ; pop   af
;	ld		($6000),a                       ;recall block 1 setting
	
  ld    a,(PageOnNextVblank)  ;set page
  out   ($99),a
  ld    a,2+128
  out   ($99),a
  ld    (vblankintflag),a               ;set vblank flag (to any value but 0)

  ld    hl,ConvEntity
  bit   1,(hl)
  jp    z,.EndCheckCountdownDays

  ld    a,(TotalMinutesUntilLandCounter)
  dec   a
  ld    (TotalMinutesUntilLandCounter),a
  jp    nz,.EndCheckCountdownDays

  ld    hl,(TotalMinutesUntilLand)
  ld    de,1
  xor   a
  sbc   hl,de
  jr    c,.EndCheckCountdownDays
  ld    (TotalMinutesUntilLand),hl
  .EndCheckCountdownDays:

  ld    a,(r23onVblank)
  out   ($99),a
  ld    a,23+128
  out   ($99),a  

  ;adjust line int height on vblank for the drilling game
  ld    a,(SetLineIntHeightOnVblankDrillingGame?)
  or    a
  jr    z,.EndSetLineIntHeight
  ld    a,LineIntHeightDrillingGame
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  out   ($99),a

  ld    a,(VDP_8)         ;sprites off
  or    %00000010
  ld    (VDP_8),a
  out   ($99),a
  ld    a,8+128
  out   ($99),a
  .EndSetLineIntHeight:

  ld    a,(CurrentRoom)
  cp    15
  call  z,.RacingGame

;  call  BackdropBlack


  pop   hl 
  pop   de 
  pop   bc 
  pop   af 
  ex    af,af'  
  exx
  pop   iy 
  pop   ix 
  pop   hl 
  pop   de 
  pop   bc 
  pop   af 
  ei
  ret





  .RacingGame:
;  call  BackdropRandom
  call  VideoReplayer
;  call  BackdropBlack

  ld    a,(RacingGameNewLineIntToBeSetOnVblank)
  ld    (RacingGameLineIntOffset),a


  ld    a,(RoadAnimationStep)

  ld    d,0
  ld    e,a

  add   a,a                           ;*2
  add   a,a                           ;*4
  ld    l,a
  ld    h,0

  add   hl,de
  ld    de,RoadAnimationAddresses
  add   hl,de

  ld    e,(hl)
  inc   hl
  ld    d,(hl)

  ld    (LineIntRacingGame.SelfModifyingcodeStraightRoadxxPart1),de

push hl
ld hl,StartRacingGameLineInt
add hl,de
ld (LineIntRacingGame.SelfModifyingcodeStraightRoadxxPart1),hl
pop hl

  inc   hl
  ld    a,(hl)

sub StartRacingGameLineInt

  ld    (LineIntRacingGame.SelfModifyingcodeLenghtStraightRoadxxPart1),a
  inc   hl
  ld    e,(hl)
  inc   hl
  ld    d,(hl)  
  ld    (PointerToSwapLines),de

;  ld    hl,StraightRoad02Part1
;  ld    (LineIntRacingGame.SelfModifyingcodeStraightRoadxxPart1),hl
;  ld    a,(LenghtStraightRoad01Part1)
;  ld    (LineIntRacingGame.SelfModifyingcodeLenghtStraightRoadxxPart1),a
;  ld    hl,StraightRoad01Part2
;  ld    (PointerToSwapLines),hl

  ld    a,1
  ld    (LineIntPartRaceGame),a

;  xor   a

  ld    a,(RacingGameLineIntOffset)
  add   a,StartRacingGameLineInt

;ld a,StartRacingGameLineInt+RacingGameLineIntOffset

  ld    (LineIntHeightRacingGame),a
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  out   ($99),a 


;  ld    a,-50
;  out   ($99),a
;  ld    a,23+128                        ;r#23 vertical screen offset
;  out   ($99),a 

;  call  SetEnemySprite.PutEnemySpriteCharacter
  call  WriteSpatToVram
  call  SetEnemySpriteCharacterAndColorData
  ret

UpdateEnemySpritePattern?: ds  1
EnemySpriteBlock: ds  1
EnemySpriteCharacter: ds  2
EnemySpriteColor: ds  2
EnemySpriteCharacterVramAddress: ds  2
EnemySpriteColorVramAddress: ds  2
PutMiniSprite?: ds  1

SetEnemySpriteCharacterAndColorData:
  ld    a,(UpdateEnemySpritePattern?)
  dec   a
  ret   m
  ld    (UpdateEnemySpritePattern?),a

  ld    a,(EnemySpriteBlock)
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  

  ld    a,(PutMiniSprite?)
  or    a
  jr    nz,.MiniSprite

  .NormalSprite:
  ;write sprite character
	xor		a				;page 0/1
  ld    hl,(EnemySpriteCharacterVramAddress)
	call	SetVdp_Write
  ld    hl,(EnemySpriteCharacter)
	ld		c,$98
	call	outix320		;write sprite character to vram
	xor		a				;page 0/1
  ld    hl,(EnemySpriteColorVramAddress)
	call	SetVdp_Write
  ld    hl,(EnemySpriteColor)
	ld		c,$98
	call	outix160		;write sprite color of pointer and hand to vram
  ret

  .MiniSprite:
  ;write sprite character
	xor		a				;page 0/1
  ld    hl,(EnemySpriteCharacterVramAddress)
	call	SetVdp_Write
  ld    hl,(EnemySpriteCharacter)
	ld		c,$98
	call	outix64		;write sprite character to vram
	xor		a				;page 0/1
  ld    hl,(EnemySpriteColorVramAddress)
	call	SetVdp_Write
  ld    hl,(EnemySpriteColor)
	ld		c,$98
	call	outix32		;write sprite color of pointer and hand to vram
  ret

LineIntHeightStraightRoad:  equ 113
RacingGameLineIntOffset:  db LineIntHeightStraightRoad     ;113 is the standard, 083 is perfect for the road all the way curved up


RacingGameNewLineIntToBeSetOnVblank:  db  LineIntHeightStraightRoad

;The road animation starts to look good from y=15 and onwards. the animation starts at y=3, so we can skip the first 12 lines ???
StartRacingGameLineInt: equ 12


RoadAnimationStep:  db  0
RoadAnimationAddressesPointer:  dw  RoadAnimationAddresses

RoadAnimationAddresses:
dw  StraightRoad01Part1 | db StraightRoad01Part1.Lenght | dw StraightRoad01Part2
dw  StraightRoad02Part1 | db StraightRoad02Part1.Lenght | dw StraightRoad02Part2
dw  StraightRoad03Part1 | db StraightRoad03Part1.Lenght | dw StraightRoad03Part2
dw  StraightRoad04Part1 | db StraightRoad04Part1.Lenght | dw StraightRoad04Part2
dw  StraightRoad05Part1 | db StraightRoad05Part1.Lenght | dw StraightRoad05Part2
dw  StraightRoad06Part1 | db StraightRoad06Part1.Lenght | dw StraightRoad06Part2
dw  StraightRoad07Part1 | db StraightRoad07Part1.Lenght | dw StraightRoad07Part2
dw  StraightRoad08Part1 | db StraightRoad08Part1.Lenght | dw StraightRoad08Part2
dw  StraightRoad09Part1 | db StraightRoad09Part1.Lenght | dw StraightRoad09Part2
dw  StraightRoad10Part1 | db StraightRoad10Part1.Lenght | dw StraightRoad10Part2
dw  StraightRoad11Part1 | db StraightRoad11Part1.Lenght | dw StraightRoad11Part2
dw  StraightRoad12Part1 | db StraightRoad12Part1.Lenght | dw StraightRoad12Part2
dw  StraightRoad13Part1 | db StraightRoad13Part1.Lenght | dw StraightRoad13Part2
dw  StraightRoad14Part1 | db StraightRoad14Part1.Lenght | dw StraightRoad14Part2
dw  StraightRoad15Part1 | db StraightRoad15Part1.Lenght | dw StraightRoad15Part2
dw  StraightRoad16Part1 | db StraightRoad16Part1.Lenght | dw StraightRoad16Part2
dw  StraightRoad17Part1 | db StraightRoad17Part1.Lenght | dw StraightRoad17Part2
dw  StraightRoad18Part1 | db StraightRoad18Part1.Lenght | dw StraightRoad18Part2
dw  StraightRoad19Part1 | db StraightRoad19Part1.Lenght | dw StraightRoad19Part2
dw  StraightRoad20Part1 | db StraightRoad20Part1.Lenght | dw StraightRoad20Part2
dw  StraightRoad21Part1 | db StraightRoad21Part1.Lenght | dw StraightRoad21Part2
dw  StraightRoad22Part1 | db StraightRoad22Part1.Lenght | dw StraightRoad22Part2
dw  StraightRoad23Part1 | db StraightRoad23Part1.Lenght | dw StraightRoad23Part2
dw  StraightRoad24Part1 | db StraightRoad24Part1.Lenght | dw StraightRoad24Part2
dw  StraightRoad25Part1 | db StraightRoad25Part1.Lenght | dw StraightRoad25Part2
dw  StraightRoad26Part1 | db StraightRoad26Part1.Lenght | dw StraightRoad26Part2
dw  StraightRoad27Part1 | db StraightRoad27Part1.Lenght | dw StraightRoad27Part2
dw  StraightRoad28Part1 | db StraightRoad28Part1.Lenght | dw StraightRoad28Part2
dw  StraightRoad29Part1 | db StraightRoad29Part1.Lenght | dw StraightRoad29Part2
dw  StraightRoad30Part1 | db StraightRoad30Part1.Lenght | dw StraightRoad30Part2

dw  StraightRoad2ndPart01Part1 | db StraightRoad2ndPart01Part1.Lenght | dw StraightRoad2ndPart01Part2
dw  StraightRoad2ndPart02Part1 | db StraightRoad2ndPart02Part1.Lenght | dw StraightRoad2ndPart02Part2
dw  StraightRoad2ndPart03Part1 | db StraightRoad2ndPart03Part1.Lenght | dw StraightRoad2ndPart03Part2
dw  StraightRoad2ndPart04Part1 | db StraightRoad2ndPart04Part1.Lenght | dw StraightRoad2ndPart04Part2
dw  StraightRoad2ndPart05Part1 | db StraightRoad2ndPart05Part1.Lenght | dw StraightRoad2ndPart05Part2
dw  StraightRoad2ndPart06Part1 | db StraightRoad2ndPart06Part1.Lenght | dw StraightRoad2ndPart06Part2
dw  StraightRoad2ndPart07Part1 | db StraightRoad2ndPart07Part1.Lenght | dw StraightRoad2ndPart07Part2
dw  StraightRoad2ndPart08Part1 | db StraightRoad2ndPart08Part1.Lenght | dw StraightRoad2ndPart08Part2
dw  StraightRoad2ndPart09Part1 | db StraightRoad2ndPart09Part1.Lenght | dw StraightRoad2ndPart09Part2
dw  StraightRoad2ndPart10Part1 | db StraightRoad2ndPart10Part1.Lenght | dw StraightRoad2ndPart10Part2
dw  StraightRoad2ndPart11Part1 | db StraightRoad2ndPart11Part1.Lenght | dw StraightRoad2ndPart11Part2
dw  StraightRoad2ndPart12Part1 | db StraightRoad2ndPart12Part1.Lenght | dw StraightRoad2ndPart12Part2
dw  StraightRoad2ndPart13Part1 | db StraightRoad2ndPart13Part1.Lenght | dw StraightRoad2ndPart13Part2
dw  StraightRoad2ndPart14Part1 | db StraightRoad2ndPart14Part1.Lenght | dw StraightRoad2ndPart14Part2
dw  StraightRoad2ndPart15Part1 | db StraightRoad2ndPart15Part1.Lenght | dw StraightRoad2ndPart15Part2
dw  StraightRoad2ndPart16Part1 | db StraightRoad2ndPart16Part1.Lenght | dw StraightRoad2ndPart16Part2
dw  StraightRoad2ndPart17Part1 | db StraightRoad2ndPart17Part1.Lenght | dw StraightRoad2ndPart17Part2
dw  StraightRoad2ndPart18Part1 | db StraightRoad2ndPart18Part1.Lenght | dw StraightRoad2ndPart18Part2
dw  StraightRoad2ndPart19Part1 | db StraightRoad2ndPart19Part1.Lenght | dw StraightRoad2ndPart19Part2
dw  StraightRoad2ndPart20Part1 | db StraightRoad2ndPart20Part1.Lenght | dw StraightRoad2ndPart20Part2
dw  StraightRoad2ndPart21Part1 | db StraightRoad2ndPart21Part1.Lenght | dw StraightRoad2ndPart21Part2
dw  StraightRoad2ndPart22Part1 | db StraightRoad2ndPart22Part1.Lenght | dw StraightRoad2ndPart22Part2
dw  StraightRoad2ndPart23Part1 | db StraightRoad2ndPart23Part1.Lenght | dw StraightRoad2ndPart23Part2
dw  StraightRoad2ndPart24Part1 | db StraightRoad2ndPart24Part1.Lenght | dw StraightRoad2ndPart24Part2
dw  StraightRoad2ndPart25Part1 | db StraightRoad2ndPart25Part1.Lenght | dw StraightRoad2ndPart25Part2
dw  StraightRoad2ndPart26Part1 | db StraightRoad2ndPart26Part1.Lenght | dw StraightRoad2ndPart26Part2
dw  StraightRoad2ndPart27Part1 | db StraightRoad2ndPart27Part1.Lenght | dw StraightRoad2ndPart27Part2
dw  StraightRoad2ndPart28Part1 | db StraightRoad2ndPart28Part1.Lenght | dw StraightRoad2ndPart28Part2
dw  StraightRoad2ndPart29Part1 | db StraightRoad2ndPart29Part1.Lenght | dw StraightRoad2ndPart29Part2
dw  StraightRoad2ndPart30Part1 | db StraightRoad2ndPart30Part1.Lenght | dw StraightRoad2ndPart30Part2



LineInt:
  push  bc
  push  hl

  ld    a,(YCurrentLineint)
  ld    b,a
  ld    a,(YLineintOn)
  cp    b
  jr    z,.LineIntOn

  .LineIntOff:
  ld    a,(YLineintOn)      ;set y lineint on
  ld    (YCurrentLineint),a  
  out   ($99),a
  ld    a,19+128            ;set lineinterrupt height
  out   ($99),a 

  ld    c,$9a
  ld    hl,CurrentPalette
  ld    hl,CurrentPalette ;slight delay needed here
  ld    hl,CurrentPalette ;slight delay needed here

	xor		a                 ;start writing to palette value 0
	out		($99),a
	ld		a,16+128
	out		($99),a

  ld    a,0*32+31         ;set page 0
  out   ($99),a
  ld    a,2+128
  out   ($99),a

;  ld    a,2               ;Set Status register #2
;  out   ($99),a
;  ld    a,15+128          ;we are about to check for HR
;  out   ($99),a
 
;  .Waitline:                ;wait until end of HBLANK
;  in    a,($99)           ;Read Status register #2
;  and   %0010 0000        ;bit to check for HBlank detection
;  jr    z,.Waitline

;back to in game palette

  outi | outi | outi | outi | outi | outi | outi | outi
  outi | outi | outi | outi | outi | outi | outi | outi
  outi | outi | outi | outi | outi | outi | outi | outi
  outi | outi | outi | outi | outi | outi | outi | outi

;  xor   a                 ;set s#0
;  out   ($99),a
;  ld    a,15+128
;  out   ($99),a

  pop   hl
  pop   bc
  pop   af 
  ei
  ret  

  .LineIntOn:
  ld    hl,CurrentPortraitPaletteFaded
  ld    c,$9a
	xor		a                 ;start writing to palette value 0
	out		($99),a
	ld		a,16+128
	out		($99),a

  ld    a,2               ;Set Status register #2
  out   ($99),a
  ld    a,15+128          ;we are about to check for HR
  out   ($99),a
 
  .Waitline2:                ;wait until end of HBLANK
  in    a,($99)           ;Read Status register #2
  and   %0010 0000        ;bit to check for HBlank detection
  jr    z,.Waitline2

  ld    a,(PageOnLineInt)
  out   ($99),a
  ld    a,2+128
  out   ($99),a

  outi | outi | outi | outi | outi | outi | outi | outi
  outi | outi | outi | outi | outi | outi | outi | outi
  outi | outi | outi | outi | outi | outi | outi | outi
  outi | outi | outi | outi | outi | outi | outi | outi

;  xor   a                 ;set s#0
;  out   ($99),a
;  ld    a,15+128
;  out   ($99),a

  ld    a,(YLineintOff)     ;set y lineint off
  ld    (YCurrentLineint),a  
  out   ($99),a
  ld    a,19+128            ;set lineinterrupt height
  out   ($99),a 

  pop   hl
  pop   bc
  pop   af 
  ei
  ret  

LineIntHeightDrillingGame:  equ 25
LineIntDrillingGame:
  ld    a,2               ;Set Status register #2
  out   ($99),a
  ld    a,15+128          ;we are about to check for HR
  out   ($99),a
 
.Waitline2:                ;wait until end of HBLANK
  in    a,($99)           ;Read Status register #2
  and   %0010 0000        ;bit to check for HBlank detection
  jr    z,.Waitline2

  ;screen always gets turned on/off at the END of the line
  ld    a,(VDP_0+1)       ;screen off
  and   %1011 1111
  out   ($99),a
  ld    a,1+128
  out   ($99),a
 ;so after turning off the screen wait till the end of HBLANK, then perform actions

  ld    a,2               ;Set Status register #2
  out   ($99),a
  ld    a,15+128          ;we are about to check for HR
  out   ($99),a
 
.Waitline:                ;wait until end of HBLANK
  in    a,($99)           ;Read Status register #2
  and   %0010 0000        ;bit to check for HBlank detection
  jr    z,.Waitline

  ld    a,2*32 + 31         ;page 2 is our active page for the drilling game
  out   ($99),a
  ld    a,2+128
  out   ($99),a

  ld    a,(r23onLineInt)
  out   ($99),a
  ld    a,23+128
  out   ($99),a  

  ld    a,(r23onLineInt)
  add   a,LineIntHeightDrillingGame
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  out   ($99),a   

  ld    a,(VDP_8)             ;sprites on
  and   %11111101
  ld    (VDP_8),a
  out   ($99),a
  ld    a,8+128
  out   ($99),a

  ld    a,(VDP_0+1)       ;screen on
  or    %0100 0000
  out   ($99),a
  ld    a,1+128
  out   ($99),a
;  call  BackdropRandom

  pop   af 
  ei
  ret  



InterruptHandlerRacingGame:
  push  af
  
  ld    a,1               ;set s#1
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)           ;check and acknowledge line interrupt
  rrca
  jp    c,LineIntRacingGame ;palette split
  
  xor   a                 ;set s#0
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)           ;check and acknowledge vblank interrupt
  rlca
  jp    c,vblank          ;vblank detected, so jp to that routine
 
  pop   af 
  ei
  ret



LineIntHeightRacingGame: ds 1
LineIntPartRaceGame:  ds  1
CurrentPageOnLineInt: ds  1
PointerToSwapLines: ds  2

P0:  equ 0*32 + 31
P1:  equ 1*32 + 31


                ;FIRST 3 VALUES ARE SKIPPED

;    var position      = 960;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad01Part1:  db  P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad01Part1
LenghtStraightRoad01Part1: db  StraightRoad01Part1.Lenght
StraightRoad01Part2:  db  42-2, 47-2, 52-2, 59-2, 68-2, 79-2, 94-2, 117-2, 153-2, 10

;    var position      = 980;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad02Part1:  db  P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad02Part1
LenghtStraightRoad02Part1: db  StraightRoad02Part1.Lenght
StraightRoad02Part2:  db  42-2, 47-2, 52-2, 59-2, 68-2, 79-2, 95-2, 118-2, 155-2, 10

;    var position      = 1000;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad03Part1:  db  P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad03Part1
LenghtStraightRoad03Part1: db  StraightRoad03Part1.Lenght
StraightRoad03Part2:  db  47-2, 53-2, 59-2, 68-2, 80-2, 96-2, 119-2, 156-2, 10

;    var position      = 1020;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad04Part1:  db  P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P1

.Lenght: equ $-StraightRoad04Part1
LenghtStraightRoad04Part1: db  StraightRoad04Part1.Lenght
StraightRoad04Part2:  db  39-2, 43-2, 47-2, 53-2, 60-2, 69-2, 80-2, 96-2, 120-2, 158-2, 10

;    var position      = 1040;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad05Part1:  db  P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P1

.Lenght: equ $-StraightRoad05Part1
LenghtStraightRoad05Part1: db  StraightRoad05Part1.Lenght
StraightRoad05Part2:  db  39-2, 43-2, 47-2, 53-2, 60-2, 69-2, 81-2, 97-2, 121-2, 159-2, 10

;    var position      = 1060;
StraightRoad06Part1:  db P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P1, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad06Part1
LenghtStraightRoad06Part1: db  StraightRoad06Part1.Lenght
StraightRoad06Part2:  db 43-2, 47-2, 53-2, 60-2, 69-2, 81-2, 98-2, 122-2, 161-2, 10  

;    var position      = 1080;
StraightRoad07Part1:  db P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad07Part1
LenghtStraightRoad07Part1: db  StraightRoad07Part1.Lenght
StraightRoad07Part2:  db 43-2, 48-2, 53-2, 60-2, 70-2, 82-2, 98-2, 123-2, 163-2, 10

;    var position      = 1100;
StraightRoad08Part1:  db P0, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P1, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad08Part1
LenghtStraightRoad08Part1: db  StraightRoad08Part1.Lenght
StraightRoad08Part2:  db 43-2, 48-2, 54-2, 61-2, 70-2, 82-2, 99-2, 124-2, 165-2  , 10

;    var position      = 1120;
StraightRoad09Part1:  db P0, P1, P0, P1, P1, P0, P1, P1, P1, P1, P1, P0, P1, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad09Part1
LenghtStraightRoad09Part1: db  StraightRoad09Part1.Lenght
StraightRoad09Part2:  db 43-2, 48-2, 54-2, 61-2, 70-2, 83-2, 100-2, 125-2, 166-2  , 10

;    var position      = 1140;
StraightRoad10Part1:  db P0, P1, P0, P1, P1, P0, P1, P1, P1, P1, P1, P0, P1, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P1, P1, P0, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad10Part1
LenghtStraightRoad10Part1: db  StraightRoad10Part1.Lenght
StraightRoad10Part2:  db 43-2, 48-2, 54-2, 61-2, 71-2, 83-2, 100-2, 126-2, 168-2  , 10

;    var position      = 1160;
StraightRoad11Part1:  db P0, P1, P0, P1, P1, P0, P1, P1, P1, P1, P1, P0, P1, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P1, P1, P0, P0, P0, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad11Part1
LenghtStraightRoad11Part1: db  StraightRoad11Part1.Lenght
StraightRoad11Part2:  db 40-2, 44-2, 48-2, 54-2, 62-2, 71-2, 84-2, 101-2, 127-2, 170-2  , 10

;    var position      = 1180;
StraightRoad12Part1:  db P0, P1, P0, P1, P1, P0, P0, P1, P1, P1, P1, P0, P1, P1, P0, P1, P0, P0, P1, P0, P1, P1, P0, P0, P1, P0, P0, P0, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad12Part1
LenghtStraightRoad12Part1: db  StraightRoad12Part1.Lenght
StraightRoad12Part2:  db 40-2, 44-2, 49-2, 54-2, 62-2, 71-2, 84-2, 102-2, 128-2, 172-2, 10  

;    var position      = 1200;
StraightRoad13Part1:  db P0, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P1, P1, P0, P1, P0, P0, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad13Part1
LenghtStraightRoad13Part1: db  StraightRoad13Part1.Lenght
StraightRoad13Part2:  db 40-2, 44-2, 49-2, 55-2, 62-2, 72-2, 85-2, 102-2, 129-2, 174-2, 10 

;    var position      = 1220;
StraightRoad14Part1:  db P0, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P1, P0, P0, P1, P0, P0, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad14Part1
LenghtStraightRoad14Part1: db  StraightRoad14Part1.Lenght
StraightRoad14Part2:  db 40-2, 44-2, 49-2, 55-2, 62-2, 72-2, 85-2, 103-2, 130-2, 176-2, 10 

;    var position      = 1240;
StraightRoad15Part1:  db P0, P1, P0, P1, P0, P0, P0, P1, P1, P1, P0, P0, P1, P0, P0, P1, P0, P0, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad15Part1
LenghtStraightRoad15Part1: db  StraightRoad15Part1.Lenght
StraightRoad15Part2:  db 44-2, 49-2, 55-2, 63-2, 72-2, 86-2, 104-2, 132-2, 178-2, 10 

;    var position      = 1260;
StraightRoad16Part1:  db P0, P1, P0, P1, P0, P0, P0, P1, P1, P1, P0, P0, P1, P0, P0, P1, P1, P0, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad16Part1
LenghtStraightRoad16Part1: db  StraightRoad16Part1.Lenght
StraightRoad16Part2:  db 44-2, 49-2, 55-2, 63-2, 73-2, 86-2, 105-2, 133-2, 180-2, 10 

;    var position      = 1280;
StraightRoad17Part1:  db P0, P1, P0, P1, P0, P0, P0, P1, P1, P1, P0, P0, P1, P0, P1, P1, P1, P0, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad17Part1
LenghtStraightRoad17Part1: db  StraightRoad17Part1.Lenght
StraightRoad17Part2:  db 44-2, 49-2, 56-2, 63-2, 73-2, 87-2, 105-2, 134-2, 182-2, 10 

;    var position      = 1300;
StraightRoad18Part1:  db P0, P1, P0, P1, P0, P0, P0, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad18Part1
LenghtStraightRoad18Part1: db  StraightRoad18Part1.Lenght
StraightRoad18Part2:  db 45-2, 50-2, 56-2, 64-2, 74-2, 87-2, 106-2, 135-2, 185-2, 10  

;    var position      = 1320;
StraightRoad19Part1:  db P0, P1, P0, P1, P0, P0, P0, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad19Part1
LenghtStraightRoad19Part1: db  StraightRoad19Part1.Lenght
StraightRoad19Part2:  db 41-2, 45-2, 50-2, 56-2, 64-2, 74-2, 88-2, 107-2, 136-2, 187-2, 10  

;    var position      = 1340;
StraightRoad20Part1:  db P0, P1, P0, P1, P0, P1, P0, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad20Part1
LenghtStraightRoad20Part1: db  StraightRoad20Part1.Lenght
StraightRoad20Part2:  db 41-2, 45-2, 50-2, 56-2, 64-2, 74-2, 88-2, 108-2, 138-2, 189-2, 10

;    var position      = 1360;
StraightRoad21Part1:  db P0, P1, P0, P1, P0, P1, P0, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad21Part1
LenghtStraightRoad21Part1: db  StraightRoad21Part1.Lenght
StraightRoad21Part2:  db 41-2, 45-2, 50-2, 56-2, 64-2, 75-2, 89-2, 108-2, 139-2, 191-2, 10  

;    var position      = 1380;
StraightRoad22Part1:  db P0, P1, P0, P1, P0, P1, P0, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad22Part1
LenghtStraightRoad22Part1: db  StraightRoad22Part1.Lenght
StraightRoad22Part2:  db 41-2, 45-2, 50-2, 57-2, 65-2, 75-2, 89-2, 109-2, 140-2, 194-2, 10 

;    var position      = 1400;
StraightRoad23Part1:  db P0, P1, P0, P0, P0, P1, P0, P1, P1, P0, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad23Part1
LenghtStraightRoad23Part1: db  StraightRoad23Part1.Lenght
StraightRoad23Part2:  db 41-2, 45-2, 51-2, 57-2, 65-2, 76-2, 90-2, 110-2, 141-2, 196-2, 10 

;    var position      = 1420;
StraightRoad24Part1:  db P0, P1, P0, P0, P0, P1, P0, P0, P1, P0, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P0, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad24Part1
LenghtStraightRoad24Part1: db  StraightRoad24Part1.Lenght
StraightRoad24Part2:  db 46-2, 51-2, 57-2, 65-2, 76-2, 90-2, 111-2, 143-2, 199-2, 10 

;    var position      = 1440;
StraightRoad25Part1:  db P0, P1, P0, P0, P0, P1, P0, P0, P1, P0, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P1, P0, P1, P1, P0, P0, P0, P1, P1, P0, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad25Part1
LenghtStraightRoad25Part1: db  StraightRoad25Part1.Lenght
StraightRoad25Part2:  db 46-2, 51-2, 57-2, 66-2, 76-2, 91-2, 112-2, 144-2, 10  

;    var position      = 1460;
StraightRoad26Part1:  db P0, P1, P0, P0, P0, P1, P0, P0, P1, P0, P0, P0, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P1, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad26Part1
LenghtStraightRoad26Part1: db  StraightRoad26Part1.Lenght
StraightRoad26Part2:  db 46-2, 51-2, 58-2, 66-2, 77-2, 91-2, 113-2, 146-2, 204-2  

;    var position      = 1480;
StraightRoad27Part1:  db P0, P1, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P0, P0, P1, P1, P0, P1, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad27Part1
LenghtStraightRoad27Part1: db  StraightRoad27Part1.Lenght
StraightRoad27Part2:  db 42-2, 46-2, 51-2, 58-2, 66-2, 77-2, 92-2, 113-2, 147-2, 207-2, 10  

;    var position      = 1500;
StraightRoad28Part1:  db P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad28Part1
LenghtStraightRoad28Part1: db  StraightRoad28Part1.Lenght
StraightRoad28Part2:  db 42-2, 46-2, 52-2, 58-2, 67-2, 78-2, 93-2, 114-2, 148-2, 210-2, 10 

;    var position      = 1520;
StraightRoad29Part1:  db P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad29Part1
LenghtStraightRoad29Part1: db  StraightRoad29Part1.Lenght
StraightRoad29Part2:  db 42-2, 46-2, 52-2, 58-2, 67-2, 78-2, 93-2, 115-2, 150-2  , 10 

;    var position      = 1540;
StraightRoad30Part1:  db P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1


.Lenght: equ $-StraightRoad30Part1
LenghtStraightRoad30Part1: db  StraightRoad30Part1.Lenght
StraightRoad30Part2:  db 42-2, 46-2, 52-2, 59-2, 67-2, 78-2, 94-2, 116-2, 151-2, 10  




;    var position      = 960;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad2ndPart01Part1:   db  P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart01Part1
LenghtStraightRoad2ndPart01Part1: db  StraightRoad2ndPart01Part1.Lenght
StraightRoad2ndPart01Part2:  db  42-2, 47-2, 52-2, 59-2, 68-2, 79-2, 94-2, 117-2, 153-2, 10

;    var position      = 980;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad2ndPart02Part1:  db  P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart02Part1
LenghtStraightRoad2ndPart02Part1: db  StraightRoad2ndPart02Part1.Lenght
StraightRoad2ndPart02Part2:  db  42-2, 47-2, 52-2, 59-2, 68-2, 79-2, 95-2, 118-2, 155-2, 10

;    var position      = 1000;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad2ndPart03Part1:  db  P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart03Part1
LenghtStraightRoad2ndPart03Part1: db  StraightRoad2ndPart03Part1.Lenght
StraightRoad2ndPart03Part2:  db  47-2, 53-2, 59-2, 68-2, 80-2, 96-2, 119-2, 156-2, 10

;    var position      = 1020;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad2ndPart04Part1:  db  P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart04Part1
LenghtStraightRoad2ndPart04Part1: db  StraightRoad2ndPart04Part1.Lenght
StraightRoad2ndPart04Part2:  db  39-2, 43-2, 47-2, 53-2, 60-2, 69-2, 80-2, 96-2, 120-2, 158-2, 10

;    var position      = 1040;                       // current camera Z position (add playerZ to get player's absolute Z position)
StraightRoad2ndPart05Part1:  db  P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart05Part1
LenghtStraightRoad2ndPart05Part1: db  StraightRoad2ndPart05Part1.Lenght
StraightRoad2ndPart05Part2:  db  39-2, 43-2, 47-2, 53-2, 60-2, 69-2, 81-2, 97-2, 121-2, 159-2, 10

;    var position      = 1060;
StraightRoad2ndPart06Part1:  db P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P0, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart06Part1
LenghtStraightRoad2ndPart06Part1: db  StraightRoad2ndPart06Part1.Lenght
StraightRoad2ndPart06Part2:  db 43-2, 47-2, 53-2, 60-2, 69-2, 81-2, 98-2, 122-2, 161-2, 10  

;    var position      = 1080;
StraightRoad2ndPart07Part1:  db P0, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart07Part1
LenghtStraightRoad2ndPart07Part1: db  StraightRoad2ndPart07Part1.Lenght
StraightRoad2ndPart07Part2:  db 43-2, 48-2, 53-2, 60-2, 70-2, 82-2, 98-2, 123-2, 163-2, 10

;    var position      = 1100;
StraightRoad2ndPart08Part1:  db P1, P0, P0, P0, P0, P1, P0, P0, P0, P0, P0, P1, P0, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart08Part1
LenghtStraightRoad2ndPart08Part1: db  StraightRoad2ndPart08Part1.Lenght
StraightRoad2ndPart08Part2:  db 43-2, 48-2, 54-2, 61-2, 70-2, 82-2, 99-2, 124-2, 165-2  , 10

;    var position      = 1120;
StraightRoad2ndPart09Part1:  db P1, P0, P1, P0, P0, P1, P0, P0, P0, P0, P0, P1, P0, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart09Part1
LenghtStraightRoad2ndPart09Part1: db  StraightRoad2ndPart09Part1.Lenght
StraightRoad2ndPart09Part2:  db 43-2, 48-2, 54-2, 61-2, 70-2, 83-2, 100-2, 125-2, 166-2  , 10

;    var position      = 1140;
StraightRoad2ndPart10Part1:  db P1, P0, P1, P0, P0, P1, P0, P0, P0, P0, P0, P1, P0, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P0, P0, P1, P1, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart10Part1
LenghtStraightRoad2ndPart10Part1: db  StraightRoad2ndPart10Part1.Lenght
StraightRoad2ndPart10Part2:  db 43-2, 48-2, 54-2, 61-2, 71-2, 83-2, 100-2, 126-2, 168-2  , 10

;    var position      = 1160;
StraightRoad2ndPart11Part1:  db P1, P0, P1, P0, P0, P1, P0, P0, P0, P0, P0, P1, P0, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P0, P0, P1, P1, P1, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart11Part1
LenghtStraightRoad2ndPart11Part1: db  StraightRoad2ndPart11Part1.Lenght
StraightRoad2ndPart11Part2:  db 40-2, 44-2, 48-2, 54-2, 62-2, 71-2, 84-2, 101-2, 127-2, 170-2  , 10

;    var position      = 1180;
StraightRoad2ndPart12Part1:  db P1, P0, P1, P0, P0, P1, P1, P0, P0, P0, P0, P1, P0, P0, P1, P0, P1, P1, P0, P1, P0, P0, P1, P1, P0, P1, P1, P1, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart12Part1
LenghtStraightRoad2ndPart12Part1: db  StraightRoad2ndPart12Part1.Lenght
StraightRoad2ndPart12Part2:  db 40-2, 44-2, 49-2, 54-2, 62-2, 71-2, 84-2, 102-2, 128-2, 172-2, 10  

;    var position      = 1200;
StraightRoad2ndPart13Part1:  db P1, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P0, P0, P1, P0, P1, P1, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart13Part1
LenghtStraightRoad2ndPart13Part1: db  StraightRoad2ndPart13Part1.Lenght
StraightRoad2ndPart13Part2:  db 40-2, 44-2, 49-2, 55-2, 62-2, 72-2, 85-2, 102-2, 129-2, 174-2, 10 

;    var position      = 1220;
StraightRoad2ndPart14Part1:  db P1, P0, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P0, P1, P1, P0, P1, P1, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart14Part1
LenghtStraightRoad2ndPart14Part1: db  StraightRoad2ndPart14Part1.Lenght
StraightRoad2ndPart14Part2:  db 40-2, 44-2, 49-2, 55-2, 62-2, 72-2, 85-2, 103-2, 130-2, 176-2, 10 

;    var position      = 1240;
StraightRoad2ndPart15Part1:  db P1, P0, P1, P0, P1, P1, P1, P0, P0, P0, P1, P1, P0, P1, P1, P0, P1, P1, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart15Part1
LenghtStraightRoad2ndPart15Part1: db  StraightRoad2ndPart15Part1.Lenght
StraightRoad2ndPart15Part2:  db 44-2, 49-2, 55-2, 63-2, 72-2, 86-2, 104-2, 132-2, 178-2, 10 

;    var position      = 1260;
StraightRoad2ndPart16Part1:  db P1, P0, P1, P0, P1, P1, P1, P0, P0, P0, P1, P1, P0, P1, P1, P0, P0, P1, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart16Part1
LenghtStraightRoad2ndPart16Part1: db  StraightRoad2ndPart16Part1.Lenght
StraightRoad2ndPart16Part2:  db 44-2, 49-2, 55-2, 63-2, 73-2, 86-2, 105-2, 133-2, 180-2, 10 

;    var position      = 1280;
StraightRoad2ndPart17Part1:  db P1, P0, P1, P0, P1, P1, P1, P0, P0, P0, P1, P1, P0, P1, P0, P0, P0, P1, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart17Part1
LenghtStraightRoad2ndPart17Part1: db  StraightRoad2ndPart17Part1.Lenght
StraightRoad2ndPart17Part2:  db 44-2, 49-2, 56-2, 63-2, 73-2, 87-2, 105-2, 134-2, 182-2, 10 

;    var position      = 1300;
StraightRoad2ndPart18Part1:  db P1, P0, P1, P0, P1, P1, P1, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart18Part1
LenghtStraightRoad2ndPart18Part1: db  StraightRoad2ndPart18Part1.Lenght
StraightRoad2ndPart18Part2:  db 45-2, 50-2, 56-2, 64-2, 74-2, 87-2, 106-2, 135-2, 185-2, 10  

;    var position      = 1320;
StraightRoad2ndPart19Part1:  db P1, P0, P1, P0, P1, P1, P1, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart19Part1
LenghtStraightRoad2ndPart19Part1: db  StraightRoad2ndPart19Part1.Lenght
StraightRoad2ndPart19Part2:  db 41-2, 45-2, 50-2, 56-2, 64-2, 74-2, 88-2, 107-2, 136-2, 187-2, 10  

;    var position      = 1340;
StraightRoad2ndPart20Part1:  db P1, P0, P1, P0, P1, P0, P1, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart20Part1
LenghtStraightRoad2ndPart20Part1: db  StraightRoad2ndPart20Part1.Lenght
StraightRoad2ndPart20Part2:  db 41-2, 45-2, 50-2, 56-2, 64-2, 74-2, 88-2, 108-2, 138-2, 189-2, 10

;    var position      = 1360;
StraightRoad2ndPart21Part1:  db P1, P0, P1, P0, P1, P0, P1, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart21Part1
LenghtStraightRoad2ndPart21Part1: db  StraightRoad2ndPart21Part1.Lenght
StraightRoad2ndPart21Part2:  db 41-2, 45-2, 50-2, 56-2, 64-2, 75-2, 89-2, 108-2, 139-2, 191-2, 10  

;    var position      = 1380;
StraightRoad2ndPart22Part1:  db P1, P0, P1, P0, P1, P0, P1, P0, P0, P0, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart22Part1
LenghtStraightRoad2ndPart22Part1: db  StraightRoad2ndPart22Part1.Lenght
StraightRoad2ndPart22Part2:  db 41-2, 45-2, 50-2, 57-2, 65-2, 75-2, 89-2, 109-2, 140-2, 194-2, 10 

;    var position      = 1400;
StraightRoad2ndPart23Part1:  db P1, P0, P1, P1, P1, P0, P1, P0, P0, P1, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart23Part1
LenghtStraightRoad2ndPart23Part1: db  StraightRoad2ndPart23Part1.Lenght
StraightRoad2ndPart23Part2:  db 41-2, 45-2, 51-2, 57-2, 65-2, 76-2, 90-2, 110-2, 141-2, 196-2, 10 

;    var position      = 1420;
StraightRoad2ndPart24Part1:  db P1, P0, P1, P1, P1, P0, P1, P1, P0, P1, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P1, P1, P0, P0, P1, P1, P1, P0, P0, P1, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart24Part1
LenghtStraightRoad2ndPart24Part1: db  StraightRoad2ndPart24Part1.Lenght
StraightRoad2ndPart24Part2:  db 46-2, 51-2, 57-2, 65-2, 76-2, 90-2, 111-2, 143-2, 199-2, 10 

;    var position      = 1440;
StraightRoad2ndPart25Part1:  db P1, P0, P1, P1, P1, P0, P1, P1, P0, P1, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P0, P1, P0, P0, P1, P1, P1, P0, P0, P1, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart25Part1
LenghtStraightRoad2ndPart25Part1: db  StraightRoad2ndPart25Part1.Lenght
StraightRoad2ndPart25Part2:  db 46-2, 51-2, 57-2, 66-2, 76-2, 91-2, 112-2, 144-2, 10  

;    var position      = 1460;
StraightRoad2ndPart26Part1:  db P1, P0, P1, P1, P1, P0, P1, P1, P0, P1, P1, P1, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P0, P1, P0, P0, P1, P1, P1, P0, P0, P0, P1, P1, P1, P0, P0, P0, P1

.Lenght: equ $-StraightRoad2ndPart26Part1
LenghtStraightRoad2ndPart26Part1: db  StraightRoad2ndPart26Part1.Lenght
StraightRoad2ndPart26Part2:  db 46-2, 51-2, 58-2, 66-2, 77-2, 91-2, 113-2, 146-2, 204-2  

;    var position      = 1480;
StraightRoad2ndPart27Part1:  db P1, P0, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P1, P1, P0, P0, P1, P0, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart27Part1
LenghtStraightRoad2ndPart27Part1: db  StraightRoad2ndPart27Part1.Lenght
StraightRoad2ndPart27Part2:  db 42-2, 46-2, 51-2, 58-2, 66-2, 77-2, 92-2, 113-2, 147-2, 207-2, 10  

;    var position      = 1500;
StraightRoad2ndPart28Part1:  db P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart28Part1
LenghtStraightRoad2ndPart28Part1: db  StraightRoad2ndPart28Part1.Lenght
StraightRoad2ndPart28Part2:  db 42-2, 46-2, 52-2, 58-2, 67-2, 78-2, 93-2, 114-2, 148-2, 210-2, 10 

;    var position      = 1520;
StraightRoad2ndPart29Part1:  db P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart29Part1
LenghtStraightRoad2ndPart29Part1: db  StraightRoad2ndPart29Part1.Lenght
StraightRoad2ndPart29Part2:  db 42-2, 46-2, 52-2, 58-2, 67-2, 78-2, 93-2, 115-2, 150-2, 213-2  , 10 

;    var position      = 1540;
StraightRoad2ndPart30Part1:  db P1, P1, P1, P1, P1, P0, P1, P1, P1, P1, P1, P0, P0, P1, P0, P1, P0, P1, P0, P0, P1, P0, P0, P1, P1, P0, P0, P1, P1, P0, P0, P0, P1, P1, P1, P0

.Lenght: equ $-StraightRoad2ndPart30Part1
LenghtStraightRoad2ndPart30Part1: db  StraightRoad2ndPart30Part1.Lenght
StraightRoad2ndPart30Part2:  db 42-2, 46-2, 52-2, 59-2, 67-2, 78-2, 94-2, 116-2, 151-2, 216-2, 10 




;curves go from:
;198.000 - 219.000, lets take 1 frame every 7000, so
;198.000
;205.000
;212.000
;219.000




;431 - 389 = 42 car = 980
;436 - 389 = 47 var = 1000
;428 - 389 = 39 var = 1020
;428 - 389 = 39 var = 1040
;432 - 389 = 43 var = 1060
;432 - 389 = 43 var = 1080
;432 - 389 = 43 var = 1100
;432 - 389 = 43 var = 1120
;432 - 389 = 43 var = 1140
;429 - 389 = 40 var = 1160
;429 - 389 = 40 var = 1180
;429 - 389 = 40 var = 1200
;429 - 389 = 40 var = 1220
;433 - 389 = 44 var = 1240
;433 - 389 = 44 var = 1260
;433 - 389 = 44 var = 1280
;434 - 389 = 45 var = 1300
;430 - 389 = 41 var = 1320
;430 - 389 = 41 var = 1340
;430 - 389 = 41 var = 1360
;430 - 389 = 41 var = 1380
;430 - 389 = 41 var = 1400
;435 - 389 = 46 var = 1420
;435 - 389 = 46 var = 1440
;435 - 389 = 46 var = 1460
;431 - 389 = 42 var = 1480


;INFO ABOUT CONVERTING THE IMAGES 
;we start at
;    var position      = 960;                       // current camera Z position (add playerZ to get player's absolute Z position)
;and end at
;    var position      = 1560;                       // current camera Z position (add playerZ to get player's absolute Z position)

;total distance is 600
;if we work with 30 steps, then each step is 20 in size







LineIntRacingGame:
  ld    a,(LineIntPartRaceGame)
  dec   a
  jp    z,.Part1

  .Part2:
  push  bc
  push  hl

  ld    a,(CurrentPageOnLineInt)
  xor   32
  ld    (CurrentPageOnLineInt),a
	out   ($99),a			
  ld    a,2+128                         ;reg 2, used to set page
	out   ($99),a			

  ld    a,(RacingGameLineIntOffset)
  ld    b,a

  ld    hl,(PointerToSwapLines)
  ld    a,(hl)
  add   a,b                             ;RacingGameLineIntOffset
  cp    210
  jr    nc,.VblankReachedPart2
  cp    40
  jr    c,.VblankReachedPart2

  inc   hl
  ld    (PointerToSwapLines),hl

  ld    (LineIntHeightRacingGame),a
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  out   ($99),a 

  .VblankReachedPart2:

  pop   hl
  pop   bc
  pop   af 
  ei
  ret  

  .Part1:
  push  bc
  push  hl

  ld    a,2               ;Set Status register #2
  out   ($99),a
  ld    a,15+128          ;we are about to check for HR
  out   ($99),a

  .Waitline1:
	in    a,($99)           ;Read Status register #2
	and   %0010 0000        ;bit to check for HBlank detection
	jr    z,.Waitline1

  .SelfModifyingcodeStraightRoadxxPart1: equ $+1
  ld    hl,StraightRoad01Part1
  .SelfModifyingcodeLenghtStraightRoadxxPart1: equ $+1
  ld    b,000
;  call  SetRaceTrackPage

  SetRaceTrackPage:
  .Waitline1:
	in    a,($99)           ;Read Status register #2
	and   %0010 0000        ;bit to check for HBlank detection
	jr    nz,.Waitline1


nop |nop |nop |nop |nop |nop |nop |nop |nop |nop |nop |			;RM:why?
nop |nop |nop |nop |nop |nop |nop |nop |nop |nop |

  ld    a,(hl)            ;page
  ld    (CurrentPageOnLineInt),a
  inc   hl
	out   ($99),a			;RM: outi perhaps? as E is always 23+128
  ld    a,2+128                         ;reg 2, used to set page
	out   ($99),a			;RM: outi perhaps? as E is always 23+128
  djnz  SetRaceTrackPage

  ld    a,2
  ld    (LineIntPartRaceGame),a

  ld    a,(RacingGameLineIntOffset)
  ld    b,a

  ld    hl,(PointerToSwapLines)
  ld    a,(hl)
  inc   hl
  ld    (PointerToSwapLines),hl


  add   a,b                             ;RacingGameLineIntOffset
  cp    210
  jr    nc,.VblankReachedPart1



  ld    (LineIntHeightRacingGame),a
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  out   ($99),a 

  .VblankReachedPart1:

  pop   hl
  pop   bc
  pop   af 
  ei
  ret  



on?:                    equ 0
y:                      equ 1
x:                      equ 2
ObjectRestoreBackgroundTable: equ 3
ObjectRestoreTable:     equ 5
PutOnFrame:             equ 9
MovementRoutineBlock:   equ 10
MovementRoutine:        equ 11
ObjectPhase:            equ 13
Var1:                   equ 14
Var2:                   equ 15
Var3:                   equ 16

RacingGameObjectOn?:    equ 1
X16bit:                 equ 2   ;2 bytes, used for racing game
DistanceFromPlayer:     equ 4   ;2 bytes, used for racing game
SpatEntry:              equ 6   ;2 bytes, used for racing game
;PutOnFrame:             equ 9
SpriteCharacterAddress: equ 10  ;2 bytes, used for racing game
SpriteColorAddress:     equ 12  ;2 bytes, used for racing game
MiniSprite?:            equ 14  ;1 bytes, used for 16x16 sprites

ObjectTable:
;           on?,  y,  x,  sprite restore table                                ,sprite data,put on frame ,movement routine block,  movement routine,							 phase,var1,var2,var3
Object1:  db  1,102,130 | dw Object1RestoreBackgroundTable,Object1RestoreTable,000        | db 000      ,MovementRoutinesBlock | dw VesselMovementRoutine			| db 000,000 ,000, 000
;Object1:  db  1,102,200 | dw Object1RestoreBackgroundTable,Object1RestoreTable,000        | db 000      ,MovementRoutinesBlock | dw VesselMovementRoutine			| db 000,000 ,000, 000
Object2:  db  1,098,040 | dw Object3RestoreBackgroundTable,Object3RestoreTable,000        | db 001      ,MovementRoutinesBlock | dw GirlMovementRoutine       | db 000,000 ,000, 000
Object3:  db  1,095,200 | dw Object4RestoreBackgroundTable,Object4RestoreTable,000        | db 002      ,MovementRoutinesBlock | dw CapGirlMovementRoutine    | db 000,000 ,000, 000
Object4:  db  1,105,150 | dw Object2RestoreBackgroundTable,Object2RestoreTable,000        | db 003      ,MovementRoutinesBlock | dw RedHeadBoyMovementRoutine | db 000,000 ,000, 000
LenghtObject: equ Object2-Object1
ObjEvent1: db  0,0,0    | dw 0,0,0                                                        | db 255      ,MovementRoutinesBlock | dw SirensRoutine             | db 000,000 ,000, 000
ObjEvent2: db  0,0,0    | dw 0,0,0                                                        | db 255      ,MovementRoutinesBlock | dw SirensRoutine             | db 000,000 ,000, 000
ObjEvent3: db  0,0,0    | dw 0,0,0                                                        | db 255      ,MovementRoutinesBlock | dw SirensRoutine             | db 000,000 ,000, 000

HandleObjects:
  ld    iy,Object1
  call  HandleObjectRoutine

;  call  BackdropRed


  ld    iy,Object2
  call  HandleObjectRoutine
  ld    iy,Object3
  call  HandleObjectRoutine
  ld    iy,Object4
  call  HandleObjectRoutine

  ld    iy,ObjEvent1
  call  HandleEventRoutine
  ld    iy,ObjEvent2
  call  HandleEventRoutine
  ld    iy,ObjEvent3
  call  HandleEventRoutine

  ld    a,(framecounter)
  and   3
  cp    3
  ret   nz

  call  AssignOrderByY                      ;sort the put on frame value from lowest (y) to highest (y) object
	jp    switchpageSF2Engine

HandleEventRoutine:
  bit   0,(iy+on?)                          ;on?
  ret   z
  jr    HandleObjectRoutine.HandleMovementRoutine

HandleObjectRoutine:
  bit   0,(iy+on?)                          ;on?
  ret   z

  call  .HandleMovementRoutine

  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  cp    (iy+PutOnFrame)                     ;put on frame
  call  z,PutObject
  ret

  .HandleMovementRoutine:
  ;we can also use only page 1 for this
  ld    a,(slot.page12rom)                  ;all RAM except page 1+2
  out   ($a8),a      

  ld    a,(iy+MovementRoutineBlock)         ;movement routine block
  ;we can also use only page 1 for this
  call  block12                             ;CARE!!! we can only switch block34 if page 1 is in rom  

  ld    l,(iy+MovementRoutine)              ;movement routine 
  ld    h,(iy+MovementRoutine+1)
  jp    (hl)

PutObject:
	call  GoRestoreObject                     ;restore sprite in previous page with (fast) vdp copy

  ld    l,(iy+7)                            ;sprite data
  ld    h,(iy+8)
	ld    b,(hl)                              ;frame list block
	inc   hl
	ld    c,(hl)                              ;sprite data block
  inc   hl
	ld    a,(hl)
	ld    (ObjectFrame),a                     ;only on slice 1 we need to set the address of this slice
	inc   hl                                  ;all consecutive slices are set at the end of their previous slice in engine.asm (when exiting the blitloop at .exit:)
	ld    a,(hl)
	ld    (ObjectFrame+1),a

  ld    a,(iy+1)                            ;y
  ld    (Objecty),a
  ld    a,(iy+2)                            ;x
  ld    (Objectx),a
	jp    PutSF2ObjectSlice                   ;in: b=frame list block, c=sprite data block. CHANGES IX 

;if we are in page 0 we prepare to restore page 1 in the next frame
;if we are in page 1 we prepare to restore page 2 in the next frame
;if we are in page 2 we prepare to restore page 3 in the next frame
;if we are in page 3 we prepare to restore page 0 in the next frame
GoRestoreObject:
  ld    l,(iy+3)                            ;Object Restore Background Table
  ld    h,(iy+4)

  ld    a,(screenpage)
  add   a,a
  ld    b,0
  ld    c,a
  add   hl,bc
  ld    a,(hl)
  inc   hl
  ld    h,(hl)
  ld    l,a
  jp    docopy

Object1RestoreBackgroundTable:
  dw    RestoreBackgroundObject1Page3,RestoreBackgroundObject1Page0,RestoreBackgroundObject1Page1,RestoreBackgroundObject1Page2
Object2RestoreBackgroundTable:
  dw    RestoreBackgroundObject2Page3,RestoreBackgroundObject2Page0,RestoreBackgroundObject2Page1,RestoreBackgroundObject2Page2
Object3RestoreBackgroundTable:
  dw    RestoreBackgroundObject3Page3,RestoreBackgroundObject3Page0,RestoreBackgroundObject3Page1,RestoreBackgroundObject3Page2
Object4RestoreBackgroundTable:
  dw    RestoreBackgroundObject4Page3,RestoreBackgroundObject4Page0,RestoreBackgroundObject4Page1,RestoreBackgroundObject4Page2

Object1RestoreTable:
  dw    RestoreBackgroundObject1Page1,RestoreBackgroundObject1Page2,RestoreBackgroundObject1Page3,RestoreBackgroundObject1Page0
Object2RestoreTable:
  dw    RestoreBackgroundObject2Page1,RestoreBackgroundObject2Page2,RestoreBackgroundObject2Page3,RestoreBackgroundObject2Page0
Object3RestoreTable:
  dw    RestoreBackgroundObject3Page1,RestoreBackgroundObject3Page2,RestoreBackgroundObject3Page3,RestoreBackgroundObject3Page0
Object4RestoreTable:
  dw    RestoreBackgroundObject4Page1,RestoreBackgroundObject4Page2,RestoreBackgroundObject4Page3,RestoreBackgroundObject4Page0

RestoreBackgroundObject1Page0:
	db    0,0,0,3
	db    0,0,0,0
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject1Page1:
	db    0,0,0,0
	db    0,0,0,1
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject1Page2:
	db    0,0,0,1
	db    0,0,0,2
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject1Page3:
	db    0,0,0,2
	db    0,0,0,3
	db    $02,0,$02,0
	db    0,0,$d0  

RestoreBackgroundObject2Page0:
	db    0,0,0,3
	db    0,0,0,0
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject2Page1:
	db    0,0,0,0
	db    0,0,0,1
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject2Page2:
	db    0,0,0,1
	db    0,0,0,2
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject2Page3:
	db    0,0,0,2
	db    0,0,0,3
	db    $02,0,$02,0
	db    0,0,$d0  

RestoreBackgroundObject3Page0:
	db    0,0,0,3
	db    0,0,0,0
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject3Page1:
	db    0,0,0,0
	db    0,0,0,1
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject3Page2:
	db    0,0,0,1
	db    0,0,0,2
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject3Page3:
	db    0,0,0,2
	db    0,0,0,3
	db    $02,0,$02,0
	db    0,0,$d0  

RestoreBackgroundObject4Page0:
	db    0,0,0,3
	db    0,0,0,0
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject4Page1:
	db    0,0,0,0
	db    0,0,0,1
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject4Page2:
	db    0,0,0,1
	db    0,0,0,2
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject4Page3:
	db    0,0,0,2
	db    0,0,0,3
	db    $02,0,$02,0
	db    0,0,$d0  

;Frameinfo looks like this:
;width, height, offset x, offset y
;x offset for first line
;lenght ($1f)+increment ($80) next spriteline, source address (base+00000h etc)
;  dw 01F80h,base+00000h
ScreenLimitxRight:				equ 256-10
ScreenLimitxLeft:				equ 10
moveplayerleftinscreen:			equ 128

;if we are in page 0 we prepare to restore page 1 in the next frame
;if we are in page 1 we prepare to restore page 2 in the next frame
;if we are in page 2 we prepare to restore page 3 in the next frame
;if we are in page 3 we prepare to restore page 0 in the next frame
PutSF2ObjectSlice:
  ld    l,(iy+5)                      ;Object Restore Table
  ld    h,(iy+6)

	ld    a,(screenpage)
  add   a,a
  ld    d,0
  ld    e,a
  add   hl,de
  ld    a,(hl)
  ld    ixl,a
  inc   hl
  ld    a,(hl)
  ld    ixh,a

;Put a (section of a) SF2 object on screen
;in b->framelistblock, c->spritedatablock
	ld		a,(slot.page12rom)		;all RAM except page 1+2
	out		($a8),a	
	ld		a,(memblocks.2)
	push	af		;store current block
	ld		a,c		;set framedata in page 1 in rom ($4000 - $7fff)  
	call	block12
	ld		a,b		;set framelist in page 2 in rom ($8000 - $bfff)
	call	block34
 
	di
	call  GoPutSF2Object
	ei

;edit: general movement pattern block is not required anymore at this point
;set the general movement pattern block at address $4000 in page 1
;	di
;	ld	a,MovementPatternsFixedPage1block
	ld	(memblocks.1),a
	ld	($6000),a
;*** LITTLE CORRECTION for PutSf2Object3Frames when using   jp    switchpageSF2Engine after putting SF2 object
;set the movement pattern block of this enemy/object at address $8000 in page 2 
	pop	af                    ;recall movement pattern block of current object
	ld	(memblocks.2),a
	ld	($7000),a
;	ei
  ret

GoPutSF2Object:
	ld    bc,(objecty)		;b=x,c=y ;bc,Object1y
	ld    hl,(ObjectFrame)	;points to object width
;	ld    iy,Player1SxB1	;player collision detection blocks

;20240531;ro;removed as it didn't do anything, really
;;screen limit right
;	ld    a,(bc)                ;object x
;	cp    ScreenLimitxRight
;	jp    c,.LimitRight
;	ld    a,ScreenLimitxRight
;;	ld    (bc),a
;.LimitRight:
;;screen limit left
;	ld    a,(bc)                ;object x
;	cp    ScreenLimitxLeft
;	jp    nc,.LimitLeft
;	ld    a,ScreenLimitxLeft
;; 	ld    (bc),a
;.LimitLeft:

;Prep restore-copy for this slice. IX=copyTable
	ld    a,(hl)		;(sliceWidth)
	inc   hl
	ld    (ix+nx),a		
	ld    a,(hl)		;(sliceHeight)
	inc   hl
	ld    (ix+ny),a
;set sy,dy by adding offset y to object y
	ld    a,c ;(bc)		;object Y
	inc   hl
	add   a,(hl)		;(sliceY)
	dec   hl

;sub (ix+ny)  ;include this if you want it's y to start at the feet instead of the head

	ld    d,a
	ld    (ix+sy),a
	ld    (ix+dy),a
;	ld    (iy+1),a		;Player1SyB1 (set block 1 sy)
;set sx,dx by adding slice.x to object.x
	ld    e,(hl)		;(sliceX)
	inc   hl			;=sliceY
	inc   hl			;=sliceOffset
	ld    a,b ;(bc)		;object x
	or    a
	jp    p,PutSpriteleftSideOfScreen

PutSpriteRightSideOfScreen:
	sub   a,moveplayerleftinscreen
	add   a,e
	jp    c,putplayer_clipright_totallyoutofscreenright

	ld    (ix+sx),a		;set sx/dx to restore by background
	ld    (ix+dx),a

;clipping check
	ld    a,b			;(bc)		;object X
	sub   moveplayerleftinscreen
	add   a,e			;object.X+frame.X
	add   a,(ix+nx)
	jp    c,putplayer_clipright
	jp    putplayer_noclip

 
PutSpriteleftSideOfScreen:
	sub   a,moveplayerleftinscreen
	add   a,e	;e=frame.X
	jr    c,.carry
	xor   a
.carry:
	ld    (ix+sx),a             ;set sx/dx to restore by background
	ld    (ix+dx),a
;set sy,dy by adding offset y to object y
;	inc   hl
;	dec   bc
;	ld    a,(bc)		;object Y
;	add   a,(hl)		;FrameY
;	ld    d,a
;	ld    (ix+sy),a		;set sy/dy to restore by background
;	ld    (ix+dy),a
;	ld    (iy+1),a		;Player1SyB1 (set block 1 sy)
;Set up restore background que player
;	inc   bc			;=object x
;clipping check
	ld    a,b		;(bc)		;object X
	sub   a,moveplayerleftinscreen
	add   a,e			;object.X+frame.X
	jp    nc,putplayer_clipleft
	jp    putplayer_noclip


;The old list files had unused bytes, skip if that version is used.
SkipFrameBytes:
	inc   hl
	ld    a,(hl)
	dec   hl
	and   A
	ret   nz
	ld    bc,7			;skip unused bytes
	add   hl,bc  
	ret

;in: HL=frameHeader.frameOffset
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
  
  
;ObjectFrame: ds  2

putplayer_clipright_totallyoutofscreenright:
;20240531;ro;this does absolutely nothing...
;  inc   hl                    ;player y offset
;  inc   hl                    ;=frameOffset
;  inc   hl                    ;=...
;  inc   bc                    ;player x
;  ld    a,(bc)                ;player x
;  sub   a,moveplayerleftinscreen
;  add   a,(hl)                ;add player x offset for first line
;  ld    e,a
;;  jp    SetOffsetBlocksAndAttackpoints
	ret
  
putplayer_clipright:
	ld    a,b ;(bc)		;object.X
	add   a,(hl)		;add frameOffset for first line to destination x
	inc   hl
	sub   a,moveplayerleftinscreen
	ld    e,a

	call  SkipFrameBytes

;if screenpage=0 then blit in page 1
;if screenpage=1 then blit in page 2
;if screenpage=2 then blit in page 0
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
	set   6,d                   ;write access

;Transfer pixel array to screen
	ld    (spatpointer),sp  
	ld    sp,hl

	ld    a,e
	ld    c,$98
.loop:
	out   ($99),a               ;set x to write to
	ld    a,d
	out   ($99),a               ;set y to write to

	pop   hl                    ;pop lenght + increment  
	ld    b,h                   ;length

;extra code in case of clipping right
;first check if total piece is out of screen right (or x<64)
	bit   6,e                   
	jr    z,.totallyoutofscreenright
;check if piece is fully within screen
	ld    a,e                   ;x
	or    %1000 0000
	add   a,b
	jr    nc,.endoverflowcheck1  ;nc-> piece is fully within screen
	sub   a,b
	neg
	ld    b,a
.endoverflowcheck1:
;/extra code in case of clipping right

	ld    a,l                   ;totalLength (numpix+whitespace)
	pop   hl                    ;pop array address
	otir
  .skipotir:
	or    a
	jr    z,.exit

	add   a,e                   ;add increment to x
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
  ld    (ObjectFrame),sp
	ld    sp,(spatpointer)
	ret

.totallyoutofscreenright:
	ld    a,l
	pop   hl
	jp    .skipotir             ;piece is totally out of screen, dont otir


putplayer_clipleft:
	ld    a,b	;X (bc)
	add   a,(hl)
	inc   hl
	sub   a,moveplayerleftinscreen
	ld    e,a
	jp    nc,.notcarry
	dec   d
.notcarry:
	call	SkipFrameBytes

  ;if screenpage=0 then blit in page 1
  ;if screenpage=1 then blit in page 2
  ;if screenpage=2 then blit in page 0
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
	pop   hl                    ;pop lenght + increment  
	ld    b,h                   ;length

;check if piece is fully in screen
	bit   6,e                   ;first check if total piece is in screen left (or x<64)
	jr    z,.totallyinscreen    ;z-> piece is fully within screen left

	;look at current x, add lenght, set new lenght accordingly, and then dont output if piece is totally out of screen
	ld    a,e
	or    %1000 0000
	ld    h,a
	add   a,b
	ld    b,a                   ;set new lenght (this is the part that is in screen)
	dec   a
	jp    m,.totallyoutofscreen

	;set new write address
	ld    a,h
	neg
	ld    h,a                   ;distance from x to border of screen
	add   a,e
	out   ($99),a               ;set x to write to
	ld    a,d
	adc   a,0
	jp    p,.nopageoverflow

	set   6,a
	res   7,a
	out   ($99),a               ;set y to write to

	ld    a,(blitpage)
	xor   1
	out   ($99),a               ;write page instellen
	ld    a,14+128
.nopageoverflow:
	out   ($99),a               ;set y to write to

.gosourceaddress:
;set new source address
	ld    a,l                   ;increment
	ex    af,af'                ;store increment
	ld    a,h                   ;distance from x to border of screen

	pop   hl                    ;source address
	add   a,l                   ;add distance from x to border of screen to source address
	ld    l,a
	jr    nc,.noinch
	inc   h
.noinch:
  ex    af,af'                ;recall stored increment
	otir
	jp    .skipotir

.totallyoutofscreen:
	ld    a,l
	pop   hl
	jp    .skipotir             ;piece is totally out of screen, dont otir

.totallyinscreen:
	ld    a,e
	out   ($99),a               ;set x to write to
	ld    a,d
	out   ($99),a               ;set y to write to

	ld    a,l                   ;increment
	pop   hl                    ;pop source address

	otir
.skipotir:
	or    a                     ;check increment
	jr    z,.exit

	add   a,e                   ;add increment to x
	ld    e,a                   ;new x
	jr    nc,.loop

	inc   d                     ;01xx xxxx

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
  ld    (ObjectFrame),sp
	ld    sp,(spatpointer)
	ret  

;switch to next page
switchpageSF2Engine:
	ld    a,(screenpage)
	inc   a
	cp    4
	jr    nz,SetSF2DisplayPage
	xor   a
SetSF2DisplayPage:
	ld    (screenpage),a
	add   a,a                   ;x32
	add   a,a
	add   a,a
	add   a,a
	add   a,a
	add   a,31
	ld    (PageOnNextVblank),a
	ret

; Routine: AssignOrderByY
; Sorts objects by Y and assigns put_on_frame = 0..3 accordingly
; Constants
OBJECT_COUNT:  equ 4
UNASSIGNED:    equ 255

; Routine: AssignOrderByY
; Sorts objects by Y and assigns put_on_frame = 0..3 accordingly
AssignOrderByY:
  ld    a,(SkipAssignOrder?)						;In same cases we don't want to assign order
  or    a
  ret   nz

    ; Initialize all put_on_frame fields to UNASSIGNED (255)
    ld a, UNASSIGNED
    ld (Object1 + PutOnFrame), a
    ld (Object2 + PutOnFrame), a
    ld (Object3 + PutOnFrame), a
    ld (Object4 + PutOnFrame), a
    ld d, 0            ; Frame number to assign (0 to 3)

  .AssignLoop:
    ld hl, ObjectTable
    ld b, OBJECT_COUNT ; Number of objects to process
    ld e, 255          ; Current minimum Y found (start max)
    ld ix, 0           ; Index of object with min Y (will store address)

  .FindMin:
    push hl
    pop iy             ; Use iy to index into objects

    ld a, (iy + PutOnFrame)
    cp UNASSIGNED
    jr nz,.SkipObj     ; Skip if already assigned

    ld a, (iy + y)
;    add a, (iy + Height)

    cp e
    jr z,.SkipObj      ; Skip if Y equals current min (to handle duplicates consistently)
    jr nc,.SkipObj     ; Skip if Y >= current min

    ld e, a            ; Update min Y
    push hl
    pop ix             ; Save address of object with min Y

  .SkipObj:
    push bc            ; Save bc
    ld bc, LenghtObject
    add hl, bc         ; Move to next object
    pop bc

    djnz .FindMin

    ; Check if we found a valid object (ix != 0)
    ld a, ixh
    or ixl
    ret   z
  
    ; Store frame number (d) into PutOnFrame field of selected object
    ld a, d
    ld (ix + PutOnFrame), a

    inc d
    ld a, d
    cp OBJECT_COUNT
    jr nz,.AssignLoop
    ret
















NPCConvBlock:                 db  NPCConv1Block
NPCConvAddress:               dw  NPCConv001
dxText:                       equ 110
YConversationWindowCentre:    db  60
YLineintOn:                   ds  1
YLineintOff:                  ds  1
YCurrentLineint:              ds  1
PageOnLineInt:                ds  1
FadeStep:                     ds  1
;FadeIn?:                      ds  1
CurrentPortraitPaletteFaded:  ds  32
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CurrentPortraitPalette:       ds  32
PortraitBlock:                ds  1
PortraitEyesNXNY:             ds  2
PortraitEyesDXDY:             ds  2
PortraitEyesSXSY:             ds  6
PortraitMouthNXNY:            ds  2
PortraitMouthDXDY:            ds  2
PortraitMouthSXSY:            ds  6
LenghtCharacterData:  equ $-CurrentPortraitPalette
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HandleConversations:
  ld    a,(StartConversation?)
  dec   a
  ret   nz

  ld    a,1
  ld    (freezecontrols?),a

	ld    a,(PageOnNextVblank)            ;we only start a conversation when current page=0
  cp    0*32 + 31
  ret   nz

  ;wait 4 frames with controls off before starting a conversation, this way the player sprite can go to standing pose
  ld    a,(WaitCenterScreenTimer)
  inc   a
  and   3
  ld    (WaitCenterScreenTimer),a
  ret   nz

  xor   a
  ld    (freezecontrols?),a
  ld    (StartConversation?),a
  ld    a,(YConversationWindowCentre)
  ld    (Fill2BlackLinesGoingUp+dy),a
  ld    (Fill2BlackLinesGoingDown+dy),a
  ld    a,0*32 + 31                     ;start with page 0 at lineint
  ld    (PageOnLineInt),a
  call  SpritesOff
  call  SetFontPage1Y212                ;set font at (0,212) page 0
  call  BackupBackgroundInRam           ;make a copy of the background we are going to 'corrupt' to ram
  call  OpenBlackWindow                 ;open up black window 2 lines per int (page 0 and page 1)
  call  EnablePaletteSplit              ;set ei1 and setup palette split
  call  StartConversation               ;handles the entire text engine (puts letters, swaps characters, clears textwindow etc etc)
  call  WaitTrigABlinkEyes              ;wait for user to press trigger a. Eyes are blinking
  call  CheckRefuel                     ;refueling at hangar bay is also a conversation, handle it if thats the current conversation
  call  EnableFadeOutPortrait           ;enable fade out portrait
  call  FadeOutPortrait                 ;fade out portrait
  call  ClearNPCConversationWindow      ;clear window, swap page and clear window again
  call  DisablePaletteSplit             ;turn off lineint and set top and bot y for restore black lines
  call  CloseBlackWindow                ;close  black window 2 lines per int (page 0 and page 1)
  ld    a,(NPCConversationsInDrillingGame?)
  or    a
  call  z,SpritesOn
  halt                                  ;cleanly end of this routine at vblank (because at vblank a pageswap will occur)
  ret

AmoungOfFuelPerCredit:  equ 10
CheckRefuel:
  ld    hl,RefuelConversation
  ld    de,(NPCConvAddress)
  call  CompareHLwithDE
  ret   nz

; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		5,a                             ;trig b pressed ?
  ret   nz

  ld    hl,(FuelMax)
  ld    de,(Fuel)
  xor   a
  sbc   hl,de                           ;missing fuel in hl

  push  hl
  pop   bc
  ld    de,AmoungOfFuelPerCredit
  call  DivideBCbyDE                    ; Out: BC = result, HL = rest
  ;cost missing fuel = missing fuel/10

  ld    hl,(TotalCredits)
  xor   a
  sbc   hl,bc
  jr    c,.NotEnoughCredits
  ld    (TotalCredits),hl

  ld    hl,(FuelMax)
  ld    (Fuel),hl
  ret

  .NotEnoughCredits:
  ld    hl,(TotalCredits)
  ld    de,AmoungOfFuelPerCredit
  call  MultiplyHlWithDE                ;HL = result
  ld    de,(Fuel)
  add   hl,de
  ld    (Fuel),hl
  ld    hl,0
  ld    (TotalCredits),hl
  ret

BackupBackgroundInRam:                  ;store Vram data of page 0+1 in ram
  ld    a,(NPCConversationsInDrillingGame?)
  or    a
  ret   nz

  ld		a,(slot.ram)	                  ;back to full RAM
  out		($a8),a	

  ld    a,(YConversationWindowCentre)
  sub   a,52                            ;top of the conversation window
  ld    l,a
  ld    h,0
  add   hl,hl                           ;*2
  add   hl,hl                           ;*4
  add   hl,hl                           ;*8
  add   hl,hl                           ;*16
  add   hl,hl                           ;*32
  add   hl,hl                           ;*64
  add   hl,hl                           ;*128
  push  hl                              ;start reading at y=... (page 0)
	xor   a
	call	SetVdp_Read	
  ld    hl,$4000                        ;start writing to this address in ram
  ld    c,$98
  ld    a,106/2                         ;backup 106 lines
  ld    b,0
  .loop:
  inir
  dec   a
  jp    nz,.loop

  pop   hl
  ld    de,$8000
  add   hl,de                           ;start reading at y=... (page 1)
	xor   a
	call	SetVdp_Read	
  ld    hl,$4000 + (106/2*256)          ;start writing to this address in ram
  ld    c,$98
  ld    a,106/2                         ;backup 106 lines
  ld    b,0
  .loop2:
  inir
  dec   a
  jp    nz,.loop2

  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a
  ret

TopWindowAddressPage0Vram:  dw  $0000 + (128*008)
TopWindowAddressPage1Vram:  dw  $8000 + (128*008)
TopWindowAddressPage0Ram:   dw  $4000
TopWindowAddressPage1Ram:   dw  $4000 + (106/2*256)

BottomWindowAddressPage0Vram:  dw  $0000 + (128*112)
BottomWindowAddressPage1Vram:  dw  $8000 + (128*112)
BottomWindowAddressPage0Ram:   dw  $4000 + (104/2*256)
BottomWindowAddressPage1Ram:   dw  $4000 + (104/2*256) + (106/2*256)

SetupWindowAddresses:
  ld    a,(YConversationWindowCentre)
  sub   a,52                            ;top of the conversation window
  ld    l,a
  ld    h,0
  add   hl,hl                           ;*2
  add   hl,hl                           ;*4
  add   hl,hl                           ;*8
  add   hl,hl                           ;*16
  add   hl,hl                           ;*32
  add   hl,hl                           ;*64
  add   hl,hl                           ;*128
  ld    (TopWindowAddressPage0Vram),hl
  ld    de,104*128
  add   hl,de
  ld    (BottomWindowAddressPage0Vram),hl

  ld    hl,(TopWindowAddressPage0Vram)
  ld    de,$8000
  add   hl,de
  ld    (TopWindowAddressPage1Vram),hl

  ld    hl,(BottomWindowAddressPage0Vram)
  ld    de,$8000
  add   hl,de
  ld    (BottomWindowAddressPage1Vram),hl

  ld    hl,$4000
  ld    (TopWindowAddressPage0Ram),hl
  ld    hl,$4000 + (106/2*256)
  ld    (TopWindowAddressPage1Ram),hl
  ld    hl,$4000 + (104/2*256)
  ld    (BottomWindowAddressPage0Ram),hl
  ld    hl,$4000 + (104/2*256) + (106/2*256)
  ld    (BottomWindowAddressPage1Ram),hl
  ret

CloseBlackWindowDrillingGame:
	ld    a,(PageOnNextVblank)            ;we only start a conversation when current page=0
  cp    0*32 + 31
  ld    a,0
  jr    z,.PageFound
  ld    a,1
  .PageFound:
  ld    (CloseBlackWindowDrillingGame2LinesTop+dPage),a
  ld    (CloseBlackWindowDrillingGame2LinesBottom+dPage),a

  ld    a,(r23onLineInt)
  ld    b,a

  ld    a,(YConversationWindowCentre)
  sub   a,52                            ;top of the conversation window
  ld    (CloseBlackWindowDrillingGame2LinesTop+dy),a
  add   a,b
  ld    (CloseBlackWindowDrillingGame2LinesTop+sy),a

  ld    a,(YConversationWindowCentre)
  add   a,53                            ;bottom of the conversation window
  ld    (CloseBlackWindowDrillingGame2LinesBottom+dy),a
  add   a,b
  ld    (CloseBlackWindowDrillingGame2LinesBottom+sy),a

  ld    d,27                            ;amount of lines (*2) to close from top to middle
  .loop:
  halt
  call  .Restore1LineTopAndBottom
  call  .Restore1LineTopAndBottom
  dec   d
  jr    nz,.loop
  ret

  .Restore1LineTopAndBottom:
  ld    hl,CloseBlackWindowDrillingGame2LinesTop
  call  DoCopy
  ld    a,(CloseBlackWindowDrillingGame2LinesTop+dy)
  add   a,1
  ld    (CloseBlackWindowDrillingGame2LinesTop+dy),a
  ld    a,(CloseBlackWindowDrillingGame2LinesTop+sy)
  add   a,1
  ld    (CloseBlackWindowDrillingGame2LinesTop+sy),a

  ld    hl,CloseBlackWindowDrillingGame2LinesBottom
  call  DoCopy
  ld    a,(CloseBlackWindowDrillingGame2LinesBottom+dy)
  sub   a,1
  ld    (CloseBlackWindowDrillingGame2LinesBottom+dy),a
  ld    a,(CloseBlackWindowDrillingGame2LinesBottom+sy)
  sub   a,1
  ld    (CloseBlackWindowDrillingGame2LinesBottom+sy),a
  ret

CloseBlackWindow:
  ld    a,(NPCConversationsInDrillingGame?)
  or    a
  jp    nz,CloseBlackWindowDrillingGame

  ld		a,(slot.ram)	                  ;back to full RAM
  out		($a8),a	

  call  SetupWindowAddresses

  ld    d,27
  .RestoreLoop:
  halt
  call  .Restore2Lines
  dec   d
  jr    nz,.RestoreLoop

  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a
  ret

  .Restore2Lines:
  ;restore 2 lines top window page 0
  ld    hl,(TopWindowAddressPage0Vram)  ;start writing to this address in vram
	xor   a
	call	SetVdp_Write	
	ld		hl,(TopWindowAddressPage0Ram)   ;start writing from this address in ram
  ld    c,$98
  ld    b,0
  otir                                  ;write 2 lines
  ;restore 2 lines top window page 1
  ld    hl,(TopWindowAddressPage1Vram)  ;start writing to this address in vram
	xor   a
	call	SetVdp_Write	
	ld		hl,(TopWindowAddressPage1Ram)   ;start writing from this address in ram
;  ld    c,$98
;  ld    b,0
  otir                                  ;write 2 lines
  ;restore 2 lines bottom window page 0
  ld    hl,(BottomWindowAddressPage0Vram)  ;start writing to this address in vram
	xor   a
	call	SetVdp_Write	
	ld		hl,(BottomWindowAddressPage0Ram)   ;start writing from this address in ram
;  ld    c,$98
;  ld    b,0
  otir                                  ;write 2 lines
  ;restore 2 lines bottom window page 1
  ld    hl,(BottomWindowAddressPage1Vram)  ;start writing to this address in vram
	xor   a
	call	SetVdp_Write	
	ld		hl,(BottomWindowAddressPage1Ram)   ;start writing from this address in ram
;  ld    c,$98
;  ld    b,0
  otir                                  ;write 2 lines

  ld    bc,256                          ;prepare addresses for next 2 lines
  ld    hl,(TopWindowAddressPage0Vram)  ;start writing to this address in vram
  add   hl,bc
  ld    (TopWindowAddressPage0Vram),hl  ;start writing to this address in vram
	ld		hl,(TopWindowAddressPage0Ram)   ;start writing from this address in ram
  add   hl,bc
	ld    (TopWindowAddressPage0Ram),hl   ;start writing from this address in ram
  ld    hl,(TopWindowAddressPage1Vram)  ;start writing to this address in vram
  add   hl,bc
  ld    (TopWindowAddressPage1Vram),hl  ;start writing to this address in vram
	ld		hl,(TopWindowAddressPage1Ram)   ;start writing from this address in ram
  add   hl,bc
	ld		(TopWindowAddressPage1Ram),hl   ;start writing from this address in ram

  ld    hl,(BottomWindowAddressPage0Vram)  ;start writing to this address in vram
  sbc   hl,bc
  ld    (BottomWindowAddressPage0Vram),hl  ;start writing to this address in vram
	ld		hl,(BottomWindowAddressPage0Ram)   ;start writing from this address in ram
  sbc   hl,bc
	ld    (BottomWindowAddressPage0Ram),hl   ;start writing from this address in ram
  ld    hl,(BottomWindowAddressPage1Vram)  ;start writing to this address in vram
  sbc   hl,bc
  ld    (BottomWindowAddressPage1Vram),hl  ;start writing to this address in vram
	ld		hl,(BottomWindowAddressPage1Ram)   ;start writing from this address in ram
  sbc   hl,bc
	ld		(BottomWindowAddressPage1Ram),hl   ;start writing from this address in ram
  ret

DisablePaletteSplit:                    ;turn off lineint and set top and bot y for restore black lines
  call  WaitVdpReady
  call  WaitVblank                      ;wait for vblank flag to be set
  call  WaitVblank                      ;wait for vblank flag to be set
  ld    a,(VDP_0)                       ;reset ei1
  and   %1110 1111
  ld    (VDP_0),a                       ;ei0 (which is default at boot) only checks vblankint
  di
  out   ($99),a
  ld    a,128
  ei
  out   ($99),a

  ld    a,(Fill2BlackLinesGoingUp+dy)
  ld    (Restore2BlackLinesGoingUp+dy),a
  ld    (Restore2BlackLinesGoingUp+sy),a
  ld    a,(Fill2BlackLinesGoingDown+dy)
  ld    (Restore2BlackLinesGoingDown+dy),a
  ld    (Restore2BlackLinesGoingDown+sy),a
  ret

ClearNPCConversationWindow:             ;clear window, swap page and clear window again
  call  ClearConversationWindowInMirrorPage
  call  SwapPageConversation
  jr    ClearConversationWindowInMirrorPage

ClearConversationWindowInMirrorPage:
  ld    a,(YLineintOn)
  add   a,5
  ld    (ClearConversationWindow+dy),a  ;set dy of text

  ld    a,(PageOnLineInt)
  cp    0*32 + 31
  ld    a,1
  jr    z,.PageFound
  xor   a
  .PageFound:
  ld    (ClearConversationWindow+dPage),a ;set dy of text

  ld    hl,ClearConversationWindow
  jp    DoCopy

ClearConversationWindow:
	db		0,0,0,0
	db		0,0,0,0
	db		0,1,102,0
	db		%1111 1111,0,%1100 0000	

StartConversation:
  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
  ld    a,(NPCConvBlock)
  call  block1234                       ;CARE!!! we can only switch block34 if page 1 is in rom  

  ld    ix,(NPCConvAddress)
  jp    SetText                         ;in: ix->text

WaitTrigABlinkEyes:                     ;wait for user to press trigger a. Eyes are blinking
  call  WaitVblank
  call  PopulateControls
  call  BlinkEyes
  call  FinishAnimatingMouth
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a                             ;trig a pressed ?
  ret   nz
	ld		a,(NewPrContr)
	bit		5,a                             ;trig b pressed ?
  ret   nz
  jr    WaitTrigABlinkEyes

FinishAnimatingMouth:
  ld    a,(AnimateMouthStep)
  inc   a
  and   15
  jr    z,AnimateMouth.goAnimate
  ld    (AnimateMouthStep),a
  jr    AnimateMouth.goAnimate

AnimateMouthStep: db  0
AnimateMouth:
  ld    a,(AnimateMouthStep)
  inc   a
  and   15
  ld    (AnimateMouthStep),a
  .goAnimate:
  ld    hl,(PortraitMouthSXSY+0)         ;mouth closed
  cp    6
  jr    c,.StepFound
  ld    hl,(PortraitMouthSXSY+4)         ;mouth half open
  cp    12
  jr    c,.StepFound
  ld    hl,(PortraitMouthSXSY+2)         ;mouth open
  .StepFound:
  push  hl

  ;set de->dx, dy
  ld    a,(YConversationWindowCentre)
  sub   a,50
  ld    d,0
  ld    e,a
  ld    hl,128
  call  MultiplyHlWithDE      ;HL = result
  ld    de,(PortraitMouthDXDY)
  add   hl,de
  ;put portrait in page 0 if current page is 1. put portrait in page 1 if current page is 0. (add $0000 to put portrait in page 0, add $8000 to put portrait in page 1)
  ld    a,(PageOnLineInt)
  cp    0*32 + 31
  ld    de,$8000
  jr    nz,.PageFound
  ld    de,$0000
  .PageFound:
  add   hl,de
  ex    de,hl

  pop   hl
;  ld    de,$0000 + (010*128) + (002/2) - 128
  ld    bc,(PortraitMouthNXNY)
  ld    a,(PortraitBlock)               ;font graphics block
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;put conversation data back in block 1234
  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
  ld    a,(NPCConvBlock)
  call  block1234                       ;CARE!!! we can only switch block34 if page 1 is in rom  
  ret


EyesAreBlinking?: db  1
EyesBlinkingStep: db  0
BlinkEyes:
  ld    a,(EyesAreBlinking?)
  or    a
  jr    nz,.EyesAreBlinking

  ld    a,(EyesBlinkingStep)
  inc   a
  ld    (EyesBlinkingStep),a
  cp    250
  ret   c

  xor   a
  ld    (EyesBlinkingStep),a
  inc   a
  ld    (EyesAreBlinking?),a
  ret

  .EyesAreBlinking:
  ld    a,(EyesBlinkingStep)
  inc   a
  ld    (EyesBlinkingStep),a
  ld    hl,(PortraitEyesSXSY+2)         ;eyes half open
  cp    6
  jr    c,.StepFound
  ld    hl,(PortraitEyesSXSY+4)         ;eyes closed
  cp    12
  jr    c,.StepFound
  ld    hl,(PortraitEyesSXSY+0)         ;eyes open
  xor   a
  ld    (EyesAreBlinking?),a
  .StepFound:
  push  hl

  ;set de->dx, dy
  ld    a,(YConversationWindowCentre)
  sub   a,50
  ld    d,0
  ld    e,a
  ld    hl,128
  call  MultiplyHlWithDE      ;HL = result
  ld    de,(PortraitEyesDXDY)
  add   hl,de
  ;put portrait in page 0 if current page is 1. put portrait in page 1 if current page is 0. (add $0000 to put portrait in page 0, add $8000 to put portrait in page 1)
  ld    a,(PageOnLineInt)
  cp    0*32 + 31
  ld    de,$8000
  jr    nz,.PageFound
  ld    de,$0000
  .PageFound:
  add   hl,de
  ex    de,hl

  pop   hl
;  ld    de,$0000 + (010*128) + (002/2) - 128
  ld    bc,(PortraitEyesNXNY)
  ld    a,(PortraitBlock)               ;font graphics block
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;put conversation data back in block 1234
  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
  ld    a,(NPCConvBlock)
  call  block1234                       ;CARE!!! we can only switch block34 if page 1 is in rom  
  ret

EnableFadeOutPortrait:                  ;enable fade out portrait
  ld    a,0                             ;palette step (0=normal map palette, 7=completely black)
  ld    (FadeStep),a
;  ld    a,0
;  ld    (FadeIn?),a
  ret

EnableFadeInPortrait:                   ;enable fade in portrait
  ld    a,7                             ;palette step (0=normal map palette, 7=completely black)
  ld    (FadeStep),a
;  ld    a,1
;  ld    (FadeIn?),a
  ret

FadeInPortrait:                         ;fade in portrait (CurrentPortraitPalette=actual palette, CurrentPortraitPaletteFaded=faded palette)
  ld    a,(FadeStep)
  dec   a
  ld    (FadeStep),a
  cp    -1
  ret   z
  ld    d,a                             ;palette step (0=normal map palette, 7=completely black)
  call  SetPaletteFadeStep
  jr    FadeInPortrait

FadeOutPortrait:                        ;fade out portrait (CurrentPortraitPalette=actual palette, CurrentPortraitPaletteFaded=faded palette)
  ld    a,(FadeStep)
  inc   a
  ld    (FadeStep),a
  cp    8
  ret   z
  ld    d,a                             ;palette step (0=normal map palette, 7=completely black)
  call  SetPaletteFadeStep
  jr    FadeOutPortrait

SetPaletteFadeStep:                     ;in d=palette step (0=normal map palette, 7=completely black)
  call  WaitVblank
  call  WaitVblank
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,16                            ;16 colors
  ld    hl,CurrentPortraitPalette       ;actual palette
  .loop2:                               ;in d=palette step, b=amount of colors
  ;blue
  ld    a,(hl)                          ;0 R2 R1 R0 0 B2 B1 B0
  and   %0000 1111                      ;only blue
  sub   a,d                             ;extract palette step / apply darkening
  jr    nc,.EndCheckOverFlowBlue        ;overflow ?
  xor   a                               ;no green
  .EndCheckOverFlowBlue:
  ld    c,a                             ;store blue in c
  ;red
  ld    a,(hl)                          ;0 R2 R1 R0 0 B2 B1 B0
  and   %1111 0000                      ;only red
  srl   a                               ;shift all bits 1 step right
  srl   a                               ;shift all bits 1 step right
  srl   a                               ;shift all bits 1 step right
  srl   a                               ;shift all bits 1 step right
  sub   a,d                             ;extract palette step / apply darkening
  jr    nc,.EndCheckOverFlowRed         ;overflow ?
  xor   a                               ;no green
  .EndCheckOverFlowRed:
  add   a,a                             ;shift all bits 1 step left
  add   a,a                             ;shift all bits 1 step left
  add   a,a                             ;shift all bits 1 step left
  add   a,a                             ;shift all bits 1 step left
  or    a,c                             ;add blue to red
  ld    (iy),a                          ;store new blue and red in CurrentPortraitPaletteFaded
  ;green
  inc   hl
  ld    a,(hl)                          ;0 0 0 0 0 G2 G1 G0
  sub   a,d                             ;extract palette step / apply darkening
  jr    nc,.EndCheckOverFlowGreen       ;overflow ?
  xor   a                               ;no green
  .EndCheckOverFlowGreen:
  inc   iy
  ld    (iy),a                          ;store new green in CurrentPortraitPaletteFaded

  inc   hl  
  inc   iy
  djnz  .loop2
  ret

SwapPageConversation:                   ;swap page conversation window
	ld    a,(PageOnLineInt)
  xor   32
	ld    (PageOnLineInt),a
  ret

EnablePaletteSplit:                     ;enable palette split 
  ld    a,(YConversationWindowCentre)
  sub   a,55
  ld    (YLineintOn),a
  add   a,104
  ld    (YLineintOff),a

  ld    a,(VDP_0)                       ;set ei1
  or    16                              ;ei1 checks for lineint and vblankint
  ld    (VDP_0),a                       ;ei0 (which is default at boot) only checks vblankint
  di
  out   ($99),a
  ld    a,128
  out   ($99),a

  ld    a,(YLineintOn)
  ld    (YCurrentLineint),a
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  ei
  out   ($99),a 
  ret

OpenBlackWindow:            ;open up black window 2 lines per int (page 0 and page 1)
  call  WaitVblank          ;wait for vblank flag to be set
  xor   a
  ld    (Fill2BlackLinesGoingUp+dPage),a
  ld    hl,Fill2BlackLinesGoingUp
  call  DoCopy
  xor   a
  ld    (Fill2BlackLinesGoingDown+dPage),a
  ld    hl,Fill2BlackLinesGoingDown
  call  DoCopy

  ld    a,1
  ld    (Fill2BlackLinesGoingUp+dPage),a
  ld    hl,Fill2BlackLinesGoingUp
  call  DoCopy
  ld    a,1
  ld    (Fill2BlackLinesGoingDown+dPage),a
  ld    hl,Fill2BlackLinesGoingDown
  call  DoCopy

  ld    a,(Fill2BlackLinesGoingUp+dy)
  sub   a,2
  ld    (Fill2BlackLinesGoingUp+dy),a
  ld    a,(Fill2BlackLinesGoingDown+dy)
  add   a,2
  ld    (Fill2BlackLinesGoingDown+dy),a

  ld    b,a
  ld    a,(YConversationWindowCentre)
  add   a,54
  cp    b
  jr    nz,OpenBlackWindow  ;next 2 lines, repeat until entire window is made
  ret

PutPortraitInMirrorPage:  
  ;set de->dx, dy
  ld    a,(YConversationWindowCentre)
  sub   a,50
  ld    d,0
  ld    e,a
  ld    hl,128
  call  MultiplyHlWithDE      ;HL = result
  ld    de,$0000 + (000*128) + (002/2) - 128
  add   hl,de
  ;put portrait in page 0 if current page is 1. put portrait in page 1 if current page is 0. (add $0000 to put portrait in page 0, add $8000 to put portrait in page 1)
  ld    a,(PageOnLineInt)
  cp    0*32 + 31
  ld    de,$8000
  jr    z,.PageFound
  ld    de,$0000
  .PageFound:
  add   hl,de
  ex    de,hl

  ld    hl,$4000 + (000*128) + (000/2) - 128
;  ld    de,$0000 + (010*128) + (002/2) - 128
  ld    bc,$0000 + (102*256) + (102/2)

  ld    a,(OffloadResources?)
  or    a
  jr    nz,OffLoadResourcesConversationWindow

  ld    a,(PortraitBlock)            ;block to copy graphics from
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

OffLoadResourcesConversationWindow:
  xor   a
  ld    (OffloadResources?),a

  dec   de
  ld    bc,$0000 + (102*256) + (256/2)
  ld    a,(PortraitBlock)            ;block to copy graphics from
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  push  ix
  call  .SetResourceRewardValues

  ld    hl,(TotalCredits)
  ld    de,(TotalValueResources)
  add   hl,de
  ld    (TotalCredits),hl
  ld    hl,0
  ld    (Level1Resources),hl
  ld    (Level2Resources),hl
  ld    (Level3Resources),hl
  ld    (Level4Resources),hl
  ld    (Level5Resources),hl
  ld    (Level6Resources),hl
  ld    (Level7Resources),hl
  ld    (Storage),hl
  pop   ix
  ret

  .SetResourceRewardValues:
  ld    a,1
  ld    (PutLetter+dPage),a             ;set page where to put text
  ;amounts
  ld    hl,(Level1Resources)            ;coal
  ld    b,092                           ;dx
  ld    c,007+(0*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+2
  call  .Setvalue

  ld    hl,(Level2Resources)            ;iron
  ld    b,092                           ;dx
  ld    c,007+(1*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+2
  call  .Setvalue

  ld    hl,(Level3Resources)            ;bronze
  ld    b,092                           ;dx
  ld    c,007+(2*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+2
  call  .Setvalue

  ld    hl,(Level4Resources)            ;silver
  ld    b,092                           ;dx
  ld    c,007+(3*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+2
  call  .Setvalue

  ld    hl,(Level5Resources)            ;gold
  ld    b,092                           ;dx
  ld    c,007+(4*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+2
  call  .Setvalue

  ld    hl,(Level6Resources)            ;emerald
  ld    b,092                           ;dx
  ld    c,007+(5*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+2
  call  .Setvalue

  ld    hl,(Level7Resources)            ;diamond
  ld    b,092                           ;dx
  ld    c,007+(6*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+2
  call  .Setvalue

  ;credit value
  ld    hl,0
  ld    (TotalValueResources),hl
  ld    hl,(Level1Resources)            ;coal
  ld    de,valueLevel1Resources
  call  MultiplyHlWithDE
  call  AddToTotalValueResources
  ld    b,207                           ;dx
  ld    c,007+(0*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
  call  .Setvalue

  ld    hl,(Level2Resources)            ;iron
  ld    de,valueLevel2Resources
  call  MultiplyHlWithDE
  call  AddToTotalValueResources
  ld    b,207                           ;dx
  ld    c,007+(1*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
  call  .Setvalue

  ld    hl,(Level3Resources)            ;bronze
  ld    de,valueLevel3Resources
  call  MultiplyHlWithDE
  call  AddToTotalValueResources
  ld    b,207                           ;dx
  ld    c,007+(2*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
  call  .Setvalue

  ld    hl,(Level4Resources)            ;silver
  ld    de,valueLevel4Resources
  call  MultiplyHlWithDE
  call  AddToTotalValueResources
  ld    b,207                           ;dx
  ld    c,007+(3*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
  call  .Setvalue

  ld    hl,(Level5Resources)            ;gold
  ld    de,valueLevel5Resources
  call  MultiplyHlWithDE
  call  AddToTotalValueResources
  ld    b,207                           ;dx
  ld    c,007+(4*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
  call  .Setvalue

  ld    hl,(Level6Resources)            ;emerald
  ld    de,valueLevel6Resources
  call  MultiplyHlWithDE
  call  AddToTotalValueResources
  ld    b,207                           ;dx
  ld    c,007+(5*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
  call  .Setvalue

  ld    hl,(Level7Resources)            ;diamond
  ld    de,valueLevel7Resources
  call  MultiplyHlWithDE
  call  AddToTotalValueResources
  ld    b,207                           ;dx
  ld    c,007+(6*12)                    ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
  call  .Setvalue

  ;total value
  ld    hl,(TotalValueResources)
  ld    b,135                           ;dx
  ld    c,007+(7*12)+4                  ;dy + YLineintOn
  ld    ix,Ascii5Byte+1
;  call  .Setvalue
;  ret

  .Setvalue:
  ld    a,b                             ;dx text
  ld    (PutLetter+dx),a                ;set dx of next letter
  ld    a,(YLineintOn)
  add   a,c
  ld    (PutLetter+dy),a                ;set dy of text
  call  NUM_TO_ASCII

  .Skip0sLoop:
  ld    a,(ix)
  cp    255
  jr    z,.TotalValueIs0
  cp    "0"
  jp    nz,SetText.NextLetter           ;in: ix->text
  inc   ix
  ld    a,(PutLetter+dx)                ;set dx of next letter
  add   a,8
  ld    (PutLetter+dx),a                ;set dx of next letter
  jr    .Skip0sLoop

  .TotalValueIs0:
  dec   ix
  ld    a,(PutLetter+dx)                ;set dx of next letter
  sub   a,8
  ld    (PutLetter+dx),a                ;set dx of next letter
  jp    SetText.NextLetter              ;in: ix->text

AddToTotalValueResources:
  push  hl
  ld    bc,(TotalValueResources)
  add   hl,bc
  ld    (TotalValueResources),hl
  pop   hl
  ret


;Level1Resources:            dw  21
;Level2Resources:            dw  13
;Level3Resources:            dw  4
;Level4Resources:            dw  15
;Level5Resources:            dw  6
;Level6Resources:            dw  4
;Level7Resources:            dw  7


Fill2BlackLinesGoingUp:
	db		0,0,0,0
	db		0,0,100,0
	db		0,1,2,0
	db		%1111 1111,0,%1100 0000
Fill2BlackLinesGoingDown:
	db		0,0,0,0
	db		0,0,100,0
	db		0,1,2,0
	db		%1111 1111,0,%1100 0000
Restore2BlackLinesGoingUp:
	db		0,0,0,2
	db		0,0,100,0
	db		0,1,2,0
	db		0,0,$d0
Restore2BlackLinesGoingDown:
	db		0,0,0,2
	db		0,0,100,0
	db		0,1,2,0
	db		0,0,$d0

;SetPaletteOnInterrupt:
;	xor		a
;	out		($99),a
;	ld		a,16+128
;	out		($99),a
;	ld    c,$9a
;	outi | outi | outi | outi | outi | outi | outi | outi
;	outi | outi | outi | outi | outi | outi | outi | outi
;	outi | outi | outi | outi | outi | outi | outi | outi
;	outi | outi | outi | outi | outi | outi | outi | outi
;	ret










DivideBCbyDE:         ; Out: BC = result, HL = rest
;
; Divide 16-bit values (with 16-bit result)
; In: Divide BC by divider DE
; Out: BC = result, HL = rest
;
Div16:
    ld hl,0
    ld a,b
    ld b,8
Div16_Loop1:
    rla
    adc hl,hl
    sbc hl,de
    jr nc,Div16_NoAdd1
    add hl,de
Div16_NoAdd1:
    djnz Div16_Loop1
    rla
    cpl
    ld b,a
    ld a,c
    ld c,b
    ld b,8
Div16_Loop2:
    rla
    adc hl,hl
    sbc hl,de
    jr nc,Div16_NoAdd2
    add hl,de
Div16_NoAdd2:
    djnz Div16_Loop2
    rla
    cpl
    ld b,c
    ld c,a
    ret

MultiplyHlWithDE:
  push  hl
  pop   bc
;
; Multiply 16-bit values (with 16-bit result)
; In: Multiply BC with DE
; Out: HL = result
;
Mult16:
    ld a,b
    ld b,16
Mult16_Loop:
    add hl,hl
    sla c
    rla
    jr nc,Mult16_NoAdd
    add hl,de
Mult16_NoAdd:
    djnz Mult16_Loop
    ret


;
; Divide 8-bit values
; In: Divide E by divider C
; Out: A = result, B = rest
;
Div8:
    xor a
    ld b,8
Div8_Loop:
    rl e
    rla
    sub c
    jr nc,Div8_NoAdd
    add a,c
Div8_NoAdd:
    djnz Div8_Loop
    ld b,a
    ld a,e
    rla
    cpl
    ret

Backdrop:
  ld    a,r
  .in:
  di
  out   ($99),a
  ld    a,7+128
  ei
  out   ($99),a	
  ret

WaitVblank:                             ;wait for vblank flag to be set
  xor   a
  ld    hl,vblankintflag
  .checkflag:
  cp    (hl)
  jr    z,.checkflag
  ld    (hl),a
  ret



LetterSpeed:  db  0,0                   ;0=slow, 1=fast
SetText:                                ;in: ix->text
  xor   a
  ld    (LetterSpeed),a                 ;back to normal speed

  ld    a,dxText                        ;dx text
  ld    (PutLetter+dx),a                ;set dx of next letter
  ld    a,(YLineintOn)
  add   a,7
  ld    (PutLetter+dy),a                ;set dy of text

	ld    a,(PageOnLineInt)
  cp    1*32 + 31
  ld    a,1
  jr    z,.SetdPage
  xor   a
  .SetdPage:
  ld    (PutLetter+dPage),a             ;set page where to put text

  .NextLetter:
  ;handle letter speed
  ld    a,(LetterSpeed)
  or    a
  jr    z,.HandleWaitVblank
  ld    a,(LetterSpeed+1)
  inc   a
  and   3
  ld    (LetterSpeed+1),a
  jr    nz,.SkipWaitVblank
  .HandleWaitVblank:
  call  WaitVblank                      ;put 1 letter per interrupt
  call  PopulateControls
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a                             ;trig a pressed ?
  jr    z,.SkipWaitVblank
  ld    a,1
  ld    (LetterSpeed),a                 ;back to normal speed
  .SkipWaitVblank:

  ld    a,212
  ld    (PutLetter+sy),a                ;set sy of letter

  ld    a,(ix)                          ;letter
  cp    EndConversation                 ;end
  ret   z
  cp    SwitchCharacter                 ;switch character
  jp    z,GoSwitchCharacter

  call  BlinkEyes
  call  AnimateMouth
  ld    a,(ix)                          ;letter
  sub   $20

  .FindRow:
  sub   32                              ;32 symbols per row
  jr    c,.RowFound
  push  af
  ld    a,(PutLetter+sy)                ;set sy of letter
  add   a,13                            ;height of each symbol/row
  ld    (PutLetter+sy),a                ;set sy of letter
  pop   af
  jr    .FindRow
  .RowFound:

  add   a,a                             ;*2
  add   a,a                             ;*4
  add   a,a                             ;*8
  ld    (PutLetter+sx),a                ;set sx of letter

  ;set nx
  ld    a,(ix)                          ;letter
  sub   $20
  ld    hl,NXPerSymbol
  ld    d,0
  ld    e,a
  add   hl,de
  ld    a,(hl)
  ld    (PutLetter+nx),a

  ld    hl,PutLetter
  call  DoCopy

  ld    hl,PutLetter+nx                 ;nx of letter
  ld    a,(PutLetter+dx)                ;dx of letter we just put
  add   a,(hl)                          ;add lenght
  ld    (PutLetter+dx),a                ;set dx of next letter

  inc   ix                              ;next letter
  ld    a,(ix)
  cp    $20                             ;is the next letter a space ? in other words, are we going to our next word ?
  jp    nz,.NextLetter

  ;the next letter is a space, we now need to calculate if the next word is gonna fit in the screen, if not put the next word on the next line
  call  CalculateLenghtNextWord         ;out: b=total lenght next word

  ld    a,(PutLetter+dx)                ;set dx of next letter
  add   a,b
  jp    nc,.NextLetter                  ;put next word if it fits the line

  inc   ix                              ;skip the space, since we are going to the next row
  ld    a,dxText                        ;dx text
  ld    (PutLetter+dx),a                ;set dx of next letter

  ld    a,(YLineintOff)
  sub   a,6
  ld    b,a
  ld    a,(PutLetter+dy)                ;dy
  add   a,14                            ;next row
  ld    (PutLetter+dy),a                ;dy
  cp    b
  jp    c,.NextLetter

  ;at this point the total text doesn't fit the box anymore, put character portrait in mirror page, clear text mirror page, wait for trig-a, swap page, and continue
  call  ClearTextInMirrorPage
  call  PutPortraitInMirrorPage
  ;put conversation data back in block 1234
  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
  ld    a,(NPCConvBlock)
  call  block1234                       ;CARE!!! we can only switch block34 if page 1 is in rom  
  call  WaitTrigABlinkEyes              ;wait until user presses trig-a. Eyes are blinking
  call  SwapPageConversation            ;swap page conversation window
  jp    SetText

GoSwitchCharacter:
  inc   ix                              ;which character ?
  ld    hl,(NPCConvAddress)
  push  ix
  pop   de
  dec   de
  call  CompareHLwithDE
  call  nz,WaitTrigABlinkEyes           ;wait until user presses trig-a. Eyes are blinking
  call  EnableFadeOutPortrait           ;enable fade out portrait
  call  FadeOutPortrait                 ;fade out portrait
  call  SetCharacter                    ;sets palette and gfx block and address
  call  ClearTextInMirrorPage
  call  PutPortraitInMirrorPage
  ;put conversation data back in block 1234
  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
  ld    a,(NPCConvBlock)
  call  block1234                       ;CARE!!! we can only switch block34 if page 1 is in rom  
  call  SwapPageConversation            ;swap page conversation window
  call  EnableFadeInPortrait            ;enable fade in portrait
  call  FadeInPortrait                  ;fade in portrait
  inc   ix                              ;next letter
  jp    SetText

;CharacterPortraitVessel:  equ 1
;CharacterPortraitGirl:    equ 2
SetCharacter:
  ld    d,0
  ld    e,(ix)                          ;character (number)
  ld    hl,LenghtCharacterData
  call  MultiplyHlWithDE                ;HL = result
  ld    de,TheVesselPortraitPalette
  add   hl,de
  ld    de,CurrentPortraitPalette
  ld    bc,LenghtCharacterData
  ldir
  ret

TheVesselPortraitPalette:         incbin "..\grapx\characters\thevessel\portraittotal.SC5",$7680+7,32
TheVesselPortraitBlock:           db  TheVesselPortraitGfxBlock
.Eyes:  dw  $0000 + (011*256) + (032/2) ;nx,ny
        dw  $0000 + (037*128) + ((046+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (102/2) - 128 | dw  $4000 + (012*128) + (102/2) - 128 | dw  $4000 + (024*128) + (102/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (016*256) + (022/2) ;nx,ny
        dw  $0000 + (052*128) + ((050+2)/2) - 128 ;dx,dy
        dw  $4000 + (036*128) + (102/2) - 128 | dw  $4000 + (053*128) + (102/2) - 128 | dw  $4000 + (070*128) + (102/2) - 128 ;sx,sy
GirlPortraitPalette:              incbin "..\grapx\characters\girl\portraittotal.SC5",$7680+7,32
GirlPortraitBlock:                db  GirlPortraitGfxBlock
.Eyes:  dw  $0000 + (012*256) + (032/2) ;nx,ny
        dw  $0000 + (036*128) + ((038+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (102/2) - 128 | dw  $4000 + (013*128) + (102/2) - 128 | dw  $4000 + (026*128) + (102/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (013*256) + (020/2) ;nx,ny
        dw  $0000 + (050*128) + ((046+2)/2) - 128 ;dx,dy
        dw  $4000 + (039*128) + (102/2) - 128 | dw  $4000 + (053*128) + (102/2) - 128 | dw  $4000 + (067*128) + (102/2) - 128 ;sx,sy
RedheadboyPortraitPalette:        incbin "..\grapx\characters\Redheadboy\portraittotal.SC5",$7680+7,32
RedheadboyPortraitBlock:          db  RedheadboyPortraitGfxBlock
.Eyes:  dw  $0000 + (010*256) + (030/2) ;nx,ny
        dw  $0000 + (047*128) + ((046+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (102/2) - 128 | dw  $4000 + (011*128) + (102/2) - 128 | dw  $4000 + (022*128) + (102/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (013*256) + (022/2) ;nx,ny
        dw  $0000 + (064*128) + ((050+2)/2) - 128 ;dx,dy
        dw  $4000 + (033*128) + (102/2) - 128 | dw  $4000 + (047*128) + (102/2) - 128 | dw  $4000 + (061*128) + (102/2) - 128 ;sx,sy
capgirlPortraitPalette:           incbin "..\grapx\characters\capgirl\portraittotal.SC5",$7680+7,32
capgirlPortraitBlock:             db  capgirlPortraitGfxBlock
.Eyes:  dw  $0000 + (012*256) + (038/2) ;nx,ny
        dw  $0000 + (030*128) + ((040+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (102/2) - 128 | dw  $4000 + (013*128) + (102/2) - 128 | dw  $4000 + (026*128) + (102/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (012*256) + (022/2) ;nx,ny
        dw  $0000 + (048*128) + ((050+2)/2) - 128 ;dx,dy
        dw  $4000 + (039*128) + (102/2) - 128 | dw  $4000 + (052*128) + (102/2) - 128 | dw  $4000 + (065*128) + (102/2) - 128 ;sx,sy
hostPortraitPalette:              incbin "..\grapx\characters\host\portraittotal.SC5",$7680+7,32
hostPortraitBlock:                db  hostPortraitGfxBlock
.Eyes:  dw  $0000 + (011*256) + (032/2) ;nx,ny
        dw  $0000 + (034*128) + ((042+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (102/2) - 128 | dw  $4000 + (012*128) + (102/2) - 128 | dw  $4000 + (024*128) + (102/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (013*256) + (022/2) ;nx,ny
        dw  $0000 + (051*128) + ((048+2)/2) - 128 ;dx,dy
        dw  $4000 + (036*128) + (102/2) - 128 | dw  $4000 + (050*128) + (102/2) - 128 | dw  $4000 + (064*128) + (102/2) - 128 ;sx,sy
soldierPortraitPalette:           incbin "..\grapx\characters\soldier\portraittotal.SC5",$7680+7,32
soldierPortraitBlock:             db  soldierPortraitGfxBlock
.Eyes:  dw  $0000 + (015*256) + (034/2) ;nx,ny
        dw  $0000 + (028*128) + ((042+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (102/2) - 128 | dw  $4000 + (016*128) + (102/2) - 128 | dw  $4000 + (032*128) + (102/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (014*256) + (028/2) ;nx,ny
        dw  $0000 + (050*128) + ((048+2)/2) - 128 ;dx,dy
        dw  $4000 + (048*128) + (102/2) - 128 | dw  $4000 + (063*128) + (102/2) - 128 | dw  $4000 + (078*128) + (102/2) - 128 ;sx,sy
AIPortraitPalette:                incbin "..\grapx\characters\AI\portraittotal.SC5",$7680+7,32
AIPortraitBlock:                  db  AIPortraitGfxBlock
.Eyes:  dw  $0000 + (011*256) + (044/2) ;nx,ny
        dw  $0000 + (038*128) + ((028+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (102/2) - 128 | dw  $4000 + (012*128) + (102/2) - 128 | dw  $4000 + (024*128) + (102/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (001*256) + (002/2) ;nx,ny
        dw  $0000 + (010*128) + ((000+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (010/2) - 128 | dw  $4000 + (000*128) + (010/2) - 128 | dw  $4000 + (000*128) + (010/2) - 128 ;sx,sy
ResourceOffloadPortraitPalette:                incbin "..\grapx\ship\hangarbay\resourceoffload.SC5",$7680+7,32
ResourceOffloadPortraitBlock:                  db  ResourceOffloadPortraitGfxBlock
.Eyes:  dw  $0000 + (001*256) + (002/2) ;nx,ny
        dw  $0000 + (000*128) + ((000+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (000/2) - 128 | dw  $4000 + (000*128) + (000/2) - 128 | dw  $4000 + (000*128) + (000/2) - 128 ;sx,sy
.Mouth: dw  $0000 + (001*256) + (002/2) ;nx,ny
        dw  $0000 + (000*128) + ((000+2)/2) - 128 ;dx,dy
        dw  $4000 + (000*128) + (000/2) - 128 | dw  $4000 + (000*128) + (000/2) - 128 | dw  $4000 + (000*128) + (000/2) - 128 ;sx,sy

ClearTextInMirrorPage:
  ld    a,(YLineintOn)
  add   a,7
  ld    (ClearText+dy),a                ;set dy of text

  ld    a,(PageOnLineInt)
  cp    0*32 + 31
  ld    a,1
  jr    z,.PageFound
  xor   a
  .PageFound:
  ld    (ClearText+dPage),a                ;set dy of text

  ld    hl,ClearText
  call  DoCopy
  ret

ClearText:
	db		0,0,0,0
	db		dxText,0,0,0
	db		146,0,97,0
	db		%1111 1111,0,%1100 0000	

CalculateLenghtNextWord:                ;out: b=total lenght next word
  ld    b,8                             ;total lenght next word (lenght space=8 pixels)
  push  ix
  pop   iy
  .NextLetter:
  inc   iy                              ;next letter
  ld    a,(iy)
  cp    SwitchCharacter
  ret   z                               ;end when last word is found and we need to switch character
  cp    EndConversation
  ret   z                               ;end when last word is found
  sub   $20
  ret   z                               ;end when next space is found
  ld    hl,NXPerSymbol
  ld    d,0
  ld    e,a
  add   hl,de
  ld    a,(hl)                          ;lenght letter
  add   a,b                             ;add lenght current letter to total lenght word
  ld    b,a                             ;new total lenght word
  jr    .NextLetter

NXPerSymbol:
;   space   !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
;  db  008,002,005,004,004,004,004,003,004,004,004,004,003,004,002,004,006,006,006,006,006,006,006,006,006,006,002,003,004,004,004,006
;           A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^
;  db  004,006,006,006,006,006,006,006,006,002,006,006,006,006,006,006,006,006,006,006,006,006,006,006,006,006,006,004,004,004,004,004
;           a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~
;  db  004,006,006,006,006,006,006,006,006,002,005,006,002,006,006,006,006,006,006,006,006,006,006,006,006,006,006,004,004,004,004,004

;   space   !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
  db  006+2,002+2,005+2,004+2,004+2,006+2,004+2,003+2,004+2,004+2,004+2,004+2,003+2,004+2,002+2,004+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,002+2,003+2,004+2,004+2,004+2,006+2
;           A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^
  db  004+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,002+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,004+2,004+2,004+2,004+2,004+2
;           a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~
  db  004+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,002+2,005+2,006+2,002+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,006+2,004+2,004+2,004+2,004+2,004+2
 
WriteSpatToVram:
	xor		a				;page 0/1
	ld		hl,sprattaddr	;sprite attribute table in VRAM ($17600)
	call	SetVdp_Write
	ld		hl,spat			;sprite attribute table
	ld		c,$98
	call	outix128		;32 sprites
	ret

spat:						;sprite attribute table (y,x)
	db		100,100,00,0	,100,100,04,0	,100,100,08,0	,100,116,12,0
	db		100,116,16,0	,100,116,20,0	,116,100,24,0	,116,100,28,0
	db		116,100,32,0	,116,116,36,0	,116,116,40,0	,116,116,44,0
	db		108,132,48,0	,108,132,52,0	,230,230,56,0	,230,230,60,0

	db		230,230,64,0	,230,230,68,0	,230,230,72,0	,230,230,76,0
	db		230,230,80,0	,230,230,84,0	,230,230,88,0	,230,230,92,0
	db		230,230,96,0	,230,230,100,0	,230,230,104,0	,230,230,108,0
	db		230,230,112,0	,230,230,116,0	,230,230,120,0	,230,230,124,0
;ds 8*4


FreeToUseFastCopy0:                     ;freely usable anywhere
  db    000,000,000,000                 ;sx,--,sy,spage
  db    000,000,000,000                 ;dx,--,dy,dpage
  db    000,000,000,000                 ;nx,--,ny,--
  db    000,%0000 0000,$D0              ;fast copy -> Copy from right to left     

FreeToUseFastCopy1:                     ;freely usable anywhere
  db    000,000,000,000                 ;sx,--,sy,spage
  db    000,000,000,000                 ;dx,--,dy,dpage
  db    000,000,000,000                 ;nx,--,ny,--
  db    000,%0000 0000,$D0              ;fast copy -> Copy from right to left     

ScreenOff:
  ld    a,(VDP_0+1)                     ;screen off
  and   %1011 1111
  di
  out   ($99),a
  ld    a,1+128
  ei
  out   ($99),a
  ret

ScreenOn:
  ld    a,(VDP_0+1)                     ;screen on
  or    %0100 0000
  di
  out   ($99),a
  ld    a,1+128
  ei
  out   ($99),a
  ret

SpritesOn:
  ld    a,(VDP_8)             ;sprites on
  and   %11111101
  ld    (VDP_8),a
  di
  out   ($99),a
  ld    a,8+128
  ei
  out   ($99),a
  ret

SpritesOff:
  ld    a,(VDP_8)         ;sprites off
  or    %00000010
  ld    (VDP_8),a
  di
  out   ($99),a
  ld    a,8+128
  ei
  out   ($99),a
  ret

activepage:		db	0

putlettre:
	db		0,0,212,1
	db		40,0,40,0
	db		16,0,5,0
	db		0,%0000 0000,$98	

BackdropOrange:
  ld    a,7
  jp    SetBackDrop
BackdropRandom:
  ld    a,r
  jp    SetBackDrop
BackdropRed:
  ld    a,5
  jp    SetBackDrop
BackdropYellow:
  ld    a,9
  jp    SetBackDrop
BackdropGreen:
  ld    a,0
  jp    SetBackDrop
BackdropBlack:
  ld    a,15
  jp    SetBackDrop
SetBackDrop:
	di
	out   ($99),a
	ld    a,7+128
	ei
	out   ($99),a	
	ret

CompareHLwithDE:
  or    a
  sbc   hl,de
  ret

StartSaveGameData:
CurrentRoom:  db  15                    ;0=arcadehall1, 1=arcadehall2, 2=biopod, 3=hydroponicsbay, 4=hangarbay, 5=trainingdeck, 6=reactorchamber, 7=sleepingquarters, 8=armoryvault, 9=holodeck, 10=medicalbay
                                        ;11=sciencelab, 12=drillinggame, 13=upgrademenu, 14=drillinglocations, 15=racinggame
GamesPlayed:  db 0                      ;increases after leaving a game. max=255
HighScoreTotalAverage: db 80            ;recruiter appears when 80 (%) is reached
HighScoreBackroomGame:  db  100

HighScoreRoadFighter: db 0
HighScoreBasketball: db 0
HighScoreBlox: db 0
HighScoreBikeRace: db 0
ConvGirl: db %0000 0000                 ;conversations handled
ConvCapGirl: db %0000 0000              ;conversations handled
ConvGingerBoy: db %0000 0000            ;conversations handled
ConvHost: db %0000 0001                 ;conversations handled bit0=80% achieved 
ConvEntity: db %1000 0000               ;conversations handled bit 6=embryo check followup, bit 5=holodeck explainer,bit 0+1+2=conversation arcade2
ConvEntityShipExplanations: db %1111 1111               ;conversations handled
;ConvEntityShipExplanations: db %0000 0000               ;conversations handled

DateCurrentLogin: ds 6 
DatePreviousLogin: ds 6
DailyContinuesUsed: db 0                ;bit 0=roadfighter,bit 1=basketball,bit 2=blox,bit 4=bikerace

TotalMinutesUntilLand:      dw  4320

OxygenGeneratorPurchased?:  db  0
WaterRecyclerPurchased?:    db  0
ColonyExpansionPurchased?:  db  0

OxygenOnShip:               dw  100
MaxOxygenOnShip:            dw  400
FoodOnShip:                 dw  100
MaxFoodOnShip:              dw  500
WaterOnShip:                dw  100
MaxWaterOnShip:             dw  300
AmountOfDigSitesUnlocked:   db  5

TotalCredits:               dw  0000    ;total credits collected from drilled resources converted into credits
valueLevel1Resources:       equ 02      ;credit per unit collected
valueLevel2Resources:       equ 05      ;credit per unit collected
valueLevel3Resources:       equ 08      ;credit per unit collected
valueLevel4Resources:       equ 12      ;credit per unit collected
valueLevel5Resources:       equ 18      ;credit per unit collected
valueLevel6Resources:       equ 30      ;credit per unit collected
valueLevel7Resources:       equ 50      ;credit per unit collected
;Drilling Game:

ConicalDrillBit:            db  0       ;0=can drill through Basalt, 1=can drill through Ironstone, 2=can drill through metallic ore, 3=can drill through xenodiamond
MinerSpeedLevel:            db  1       ;1=level 1, 2=level 2, 3=level 3, 4=level 4
FuelTankLevel:              db  1       ;1=level 1, 2=level 2, 3=level 3, 4=level 4
CargoSizeLevel:             db  1       ;1=level 1, 2=level 2, 3=level 3, 4=level 4

Level1Resources:            dw  0
Level2Resources:            dw  0
Level3Resources:            dw  0
Level4Resources:            dw  0
Level5Resources:            dw  0
Level6Resources:            dw  0
Level7Resources:            dw  0
Fuel:                       dw  FuelTankLevel1MaxFuel
FuelMax:                    dw  FuelTankLevel1MaxFuel
Storage:                    dw  000
StorageMax:                 dw  CargoSizeLevel1MaxStorage
Energy:                     dw  124
EnergyMax:                  dw  250
EnergyXP:                   db  0
Radiation:                  dw  100
RadiationMax:               dw  400
RadiationProtectionLevel:   db  0       ;0=no protection, 1=level 1, 2=level 2,3=level 3, 4=level 4
ConvSoldier: db %0000 0001              ;conversations handled bit0=intro, bit1=low fuel, bit2=low fuel short, bit3=low energy, bit4=low energy short, bit5=high radiation, bit6=storage full, bit7=storage full short

FuelTankLevel1MaxFuel:      equ 500
FuelTankLevel2MaxFuel:      equ FuelTankLevel1MaxFuel * 2
FuelTankLevel3MaxFuel:      equ FuelTankLevel2MaxFuel * 2
FuelTankLevel4MaxFuel:      equ FuelTankLevel3MaxFuel * 2
CargoSizeLevel1MaxStorage:  equ 032
CargoSizeLevel2MaxStorage:  equ CargoSizeLevel1MaxStorage * 2
CargoSizeLevel3MaxStorage:  equ CargoSizeLevel2MaxStorage * 2
CargoSizeLevel4MaxStorage:  equ CargoSizeLevel3MaxStorage * 2




EndSaveGameData:
SaveGameDataLenght: equ EndSaveGameData-StartSaveGameData
