;TrainingdeckEventRoutine

Phase MovementRoutinesAddress

;after each day of training, training will be denied the day after, player needs to rest

InitiateTreadMillGame:
  .Engine:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a
  xor   a
  ld    (freezecontrols?),a

  call  PopulateControls
  call  .HandlePhase

  xor   a
  ld    hl,vblankintflag
  .checkflag:
  cp    (hl)
  jr    z,.checkflag
  ld    (hl),a
  jp    .Engine  

  .HandlePhase:                                 
  ld    a,(TreadMillGameStep)
  dec   a
  jp    z,TreadMillGamePhase1               ;fade out screen (proxima landscape)
  dec   a
  jp    z,TreadMillGamePhase2               ;put titlescreen in page 0
  dec   a
  jp    z,TreadMillGamePhase3               ;fade in screen (title screen)
  dec   a
  jp    z,TreadMillGamePhase4               ;title screen handler
  dec   a
  jp    z,TreadMillGamePhase5               ;fade out screen (title screen)
  dec   a
  jp    z,TreadMillGamePhase6               ;put background game  in page 0
  dec   a
  jp    z,TreadMillGamePhase7               ;fade in screen (in game)
  ret

TreadMillGamePhase7:                        ;fade in screen (in game)
  ld    a,(framecounter2)                   ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  dec   a
  jp    m,.EndPhase7
  ld    (FadeStep),a
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ;fade in color 0
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,01                            ;01 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  ;fade in color 8-14
  ld    iy,CurrentPortraitPaletteFaded+8*2  ;faded palette
  ld    b,07                            ;07 colors
  ld    hl,CurrentPalette+8*2               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy
  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase7:
  ld    a,8
  ld    (TreadMillGameStep),a
  ret

TreadMillGamePhase6:                        ;put background game in page 1
  ;background to page 1
  ld    hl,TrainingDeckGameBackgroundPart1Address
  ld    a,TrainingDeckGameBackgroundGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (028/2) - 128
  ld    bc,$0000 + (128*256) + (176/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,TrainingDeckGameBackgroundPart2Address
  ld    a,TrainingDeckGameBackgroundGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (128*128) + (028/2) - 128
  ld    bc,$0000 + (020*256) + (176/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;put tilesheet y=212 page 1
  ld    hl,TrainingDeckGameForegroundTilesPart1Address
  ld    a,TrainingDeckGameForegroundTilesGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (212*128) + (000/2) - 128
  ld    bc,$0000 + (016*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  call  SetTraininDeckGameMapAt8000InRam
  call  BuildUpMapTrainingGame

  ;frame to page 3
  ld    hl,TrainingDeckGameFramePart1Address
  ld    a,TrainingDeckGameFrameGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (024/2) - 128
  ld    bc,$0000 + (128*256) + (184/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,TrainingDeckGameFramePart2Address
  ld    a,TrainingDeckGameFrameGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (128*128) + (024/2) - 128
  ld    bc,$0000 + (022*256) + (184/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a

  ld    hl,.CopyFrameOverGame
  call  DoCopy

  ld    hl,.PutPlayerHead
  call  DoCopy

  ld    hl,.CopyFrameAndGameToPage0
  call  DoCopy

  ld    a,7
  ld    (TreadMillGameStep),a
  ret

  .PutPlayerHead:
	db		000,000,212,003
	db		057,000,125,001
	db		048,000,025,000
	db		000,000,$98

  .CopyFrameAndGameToPage0:
	db		024,000,000,001
	db		024,000,000,000
	db		184,000,150,000
	db		000,000,$d0

  .CopyFrameOverGame:
	db		024,000,000,003
	db		024,000,000,001
	db		184,000,150,000
	db		000,000,$98
  
BuildUpMapTrainingGame:
  ld    ix,$8000
  ld    a,5
  ld    (TrainingGameTile+dy),a
  ld    c,19                                ;17 rows

  .RowLoop:
  ld    a,24
  ld    (TrainingGameTile+dx),a
  ld    b,23                                ;23 tiles per row
  .Tileloop:
  push  bc
  ld    hl,TrainingGameTile+sy
  ld    (hl),212+7
  ld    a,(ix)
  add   a,a                                 ;*2
  add   a,a                                 ;*4
  add   a,a                                 ;*8
  jr    nc,.EndCheck2ndRow
  ld    (hl),212+8+7

  ld    (TrainingGameTile+sx),a
  ld    hl,TrainingGameTile
  call  DoCopy
  xor   a

  .EndCheck2ndRow:
  ld    (TrainingGameTile+sx),a
  ld    hl,TrainingGameTile
  call  nz,DoCopy
  ld    a,(TrainingGameTile+dx)
  add   a,8
  ld    (TrainingGameTile+dx),a
  inc   ix
  pop   bc
  djnz  .Tileloop
  ld    a,(TrainingGameTile+dy)
  add   a,8
  ld    (TrainingGameTile+dy),a

  dec   c
  jp    nz,.RowLoop
  ret

TreadMillGameBackgroundGamePalette:
  incbin "..\grapx\ship\trainingdeck\background\background.sc5",$7680+7,32

TreadMillGamePhase5:                        ;fade out screen
  ld    a,(framecounter2)                   ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  inc   a
  cp    8
  jr    z,.EndPhase5
  ld    (FadeStep),a
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ;fade out color 0
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,01                            ;01 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  ;fade out color 8-14
  ld    iy,CurrentPortraitPaletteFaded+8*2  ;faded palette
  ld    b,07                            ;07 colors
  ld    hl,CurrentPalette+8*2               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy
  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase5:
  ld    a,6
  ld    (TreadMillGameStep),a

  ld    hl,TreadMillGameBackgroundGamePalette
  ld    de,CurrentPalette
  ld    bc,32
  ldir
  ret

TreadMillGamePhase4:                        ;title screen handler
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;trig a pressed ?
  ret   z

  ld    a,5
  ld    (TreadMillGameStep),a
  ret

TreadMillGamePhase3:                        ;fade in screen (title screen)
  ld    a,(framecounter2)                   ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  dec   a
  jp    m,.EndPhase3
  ld    (FadeStep),a
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ;fade in color 0
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,01                            ;01 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  ;fade in color 8-14
  ld    iy,CurrentPortraitPaletteFaded+8*2  ;faded palette
  ld    b,07                            ;07 colors
  ld    hl,CurrentPalette+8*2               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy
  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase3:
  ld    a,4
  ld    (TreadMillGameStep),a
  ret

TreadMillGamePhase2:                        ;put titlescreen in page 1
  ld    hl,TrainingDeckGameTitleScreenPart1Address
  ld    a,TrainingDeckGameTitleScreenGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (028/2) - 128
  ld    bc,$0000 + (128*256) + (176/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,TrainingDeckGameTitleScreenPart2Address
  ld    a,TrainingDeckGameTitleScreenGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (128*128) + (028/2) - 128
  ld    bc,$0000 + (020*256) + (176/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,.PutPlayerHead
  call  DoCopy
  ld    hl,.CopyTitleScreenAndPlayerHeadToPage0
  call  DoCopy

  ld    a,3
  ld    (TreadMillGameStep),a
  ret

  .PutPlayerHead:
	db		000,000,212,003
	db		057,000,125,001
	db		048,000,023,000
	db		000,000,$98

  .CopyTitleScreenAndPlayerHeadToPage0:
	db		024,000,000,001
	db		024,000,000,000
	db		184,000,148,000
	db		000,000,$d0

TreadMillGamePhase1:                        ;fade out screen (proxima landscape)
  ld    a,(framecounter2)                   ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  inc   a
  cp    8
  jr    z,.EndPhase1
  ld    (FadeStep),a
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ;fade out color 0
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,01                            ;01 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  ;fade out color 8-14
  ld    iy,CurrentPortraitPaletteFaded+8*2  ;faded palette
  ld    b,07                            ;07 colors
  ld    hl,CurrentPalette+8*2               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy
  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase1:
  ld    a,2
  ld    (TreadMillGameStep),a

  ld    hl,TreadMillGameTitleScreenPalette
  ld    de,CurrentPalette
  ld    bc,32
  ldir

  ;player head to page 3 (y=212)
  ld    hl,TrainingDeckGamePlayerHeadPart1Address
  ld    a,TrainingDeckGamePlayerHeadGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (212*128) + (000/2) - 128
  ld    bc,$0000 + (025*256) + (048/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a
  ret

TreadMillGameTitleScreenPalette:
  incbin "..\grapx\ship\trainingdeck\titlescreen\titlescreen.sc5",$7680+7,32



  PlayerXOnTreadmill: equ 72
  PlayerYOnTreadmill: equ 93
TrainingdeckEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
  call  CheckShowPressTrigAIcontrainingdeck
  call  .CheckStepOnTreadMill
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  call  .CheckStartGame
  ret

  .CheckStartGame:
  ld    a,(Object1+x)
  cp    PlayerXOnTreadmill
  ret   nz
  ld    a,(Object1+y)
  cp    PlayerYOnTreadmill
  ret   nz

	ld		hl,Lstanding
  ld    (PlayerSpriteStand),hl

  ;wait 13 frames to let the sf2 engine place the player on the treadmill
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a
  cp    13
  ret   c

	ld    a,(screenpage)
  or    a
  ret   nz

  xor   a                                   ;palette step (0=normal map palette, 7=completely black)
  ld    (FadeStep),a
  ld    hl,CurrentPalette
  ld    de,CurrentPortraitPaletteFaded
  ld    bc,32
  ldir

  ld    a,1
  ld    (TreadMillGameStep),a

  jp    InitiateTreadMillGame

  .CheckStepOnTreadMill:
  ld    a,(ShowPressTriggerAIcon?)
  or    a
  ret   z
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;trig a pressed ?
  ret   z

  ;we can only go to train if our energy >10% of our max energy
  ld    bc,(EnergyMax)
  ld    de,10
  call  DivideBCbyDE                    ; Out: BC = result, HL = rest
  
  ld    hl,(Energy)
  sbc   hl,bc
  jr    c,.GoStepOnTreadMill
  
jr    .GoStepOnTreadMill

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv044
  ld    (NPCConvAddress),hl
  ret

  .GoStepOnTreadMill:
  ld    a,1
  ld    (freezecontrols?),a

	ld		hl,Lstanding
  ld    (PlayerSpriteStand),hl

  call  SpritesOff
  xor   a
  ld    (Object2+On?),a
  ld    (Object3+On?),a
  ld    (Object4+On?),a
  ld    (framecounter2),a

  ld    a,PlayerXOnTreadmill    ;72
  ld    (Object1+x),a
  ld    a,PlayerYOnTreadmill    ;93
  ld    (Object1+y),a
  ret

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   2,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   2,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv017
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.hangarbay

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.reactorchamber
  ret

  .reactorchamber:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a-20
  ld    (Object1+y),a

  ld    a,6
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .hangarbay:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,4
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

trainingdecktreadmilly:   db 104
trainingdecktreadmillx:   db 060 -8
CheckShowPressTrigAIcontrainingdeck:
  ld    hl,trainingdecktreadmilly
  call  CheckPlayerNearArcadeMachine
  ret   z

  .PlayerIsNear:
  ld    a,1
  ld    (ShowPressTriggerAIcon?),a
  ld    a,(iy+y)
  ld    (TriggerAy),a
  ld    a,(iy+x)
  ld    (TriggerAx),a
  ret

;right wall
trainingdeck_0:        db    trainingdeckframelistblock, trainingdeckspritedatablock | dw    trainingdeck_0_0
trainingdeck1Routine:
  ret

;left wall
trainingdeck_1:        db    trainingdeckframelistblock, trainingdeckspritedatablock | dw    trainingdeck_1_0
trainingdeck2Routine:
  ret

;treadmill
trainingdeck_2:        db    trainingdeckframelistblock, trainingdeckspritedatablock | dw    trainingdeck_2_0
trainingdeck3Routine:
  ret





dephase
