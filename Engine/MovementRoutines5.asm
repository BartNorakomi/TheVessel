;BlockHitGameRoutine

Phase MovementRoutinesAddress

BlockHitGameRoutine:
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  call  CheckGameOverBlockHitGame
  call  MoveCannon
  call  AnimateBlockExplosion
  call  CheckInitiateExplosionEntireColumn
  call  MoveProjectile
  call  CheckProjectileHitsBlock
  call  CheckShootNewProjectile
  call  .HandlePhase                        ;load graphics, init variables

  ld    a,(framecounter2)
  and   3
  ret   nz
  call  PutNewBlocks
  call  MoveBlocks
  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ld    hl,BlockhitPart1Address
  ld    a,BlockhitGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (128*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,BlockhitPart2Address
  ld    a,BlockhitGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;copy page 0 to page 3
  xor   a
  ld    (CopyPageToPage212High+sPage),a
  ld    a,3
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy
  ;copy page 0 to page 1
  ld    a,1
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy

  call  SetArcadeMachine
  call  ResetVariablesBlockHitGame

  ld    a,1
  ld    (SetArcadeGamePalette?),a           ;action on vblank: 1=set palette, 2=set palette and write spat to vram
  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ret

ResetVariablesBlockHitGame:
  ld    hl,BlockhitPalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  ;set y blocks to 213
  ld    a,213
  ld    de,4
  ld    b,32
  ld    hl,spat
  .loop:
  ld    (hl),a                                ;remove sprite from screen display
  add   hl,de
  djnz  .loop

  ;set x blocks to 1
  ld    a,1
  ld    de,4
  ld    b,32
  ld    hl,spat+1
  .loop2:
  ld    (hl),a                                ;remove sprite from screen display
  add   hl,de
  djnz  .loop2

  ld    a,3
  ld    (CannonRow),a
  ld    a,1
  ld    (PutNewBlocksCounter),a
  ld    hl,BlocksColumnsTable-5
  ld    (BlocksColumnsTablePointer),hl

  call  SetBlockHitGameSprites
  ret

BlocksColumnsTable:
  db    2,1,1,1,0

  db    0,0,1,1,2
  db    1,0,1,0,2
  db    0,1,1,1,0
  db    0,1,0,1,0

  db    1,0,1,0,1
  db    0,0,1,1,1
  db    1,1,0,1,0
  db    1,0,0,0,1

  db    0,1,1,1,0
  db    0,0,1,1,1
  db    1,0,0,1,1
  db    1,1,0,0,0

  db    1,1,1,0,0
  db    0,0,1,1,1
  db    1,0,0,1,0
  db    0,1,0,1,1

  db    0,0,1,0,1
  db    1,0,0,1,1
  db    0,1,0,1,1
  db    1,0,1,0,0

  db    0,1,1,1,0
  db    1,0,0,1,1
  db    0,0,1,0,1
  db    0,1,0,1,0

  db    1,1,0,0,0
  db    0,0,1,1,1
  db    1,1,0,1,0
  db    0,1,0,0,1

  db    1,0,1,0,1
  db    0,1,0,1,0
  db    1,0,1,1,0
  db    1,0,0,1,1

  db    0,1,1,0,0
  db    1,0,0,1,1
  db    0,1,1,0,1
  db    0,0,0,1,1

  db    1,1,0,0,0
  db    0,0,1,1,1
  db    0,1,1,0,0
  db    1,0,0,1,1

  db    0,1,1,0,1
  db    1,0,0,1,1
  db    1,0,1,0,1
  db    0,0,0,1,1

  db    0,1,1,1,0
  db    1,0,0,1,1
  db    0,1,1,0,1
  db    1,0,0,0,1

  db    0,1,1,1,0
  db    1,0,0,1,1
  db    0,1,0,1,0
  db    1,0,1,0,0

  db    0,1,1,0,1
  db    0,0,1,1,1
  db    1,1,0,1,0
  db    0,0,0,1,1

  db    0,1,1,1,0
  db    1,0,0,1,1
  db    0,1,1,0,1
  db    1,0,0,0,1

  db    0,1,1,1,0
  db    1,0,0,1,1
  db    0,1,0,1,0
  db    1,0,1,0,0

  db    0,1,1,0,1
  db    0,0,1,1,1
  db    1,1,0,1,0
  db    0,0,0,1,1

CheckGameOverBlockHitGame:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;;
	ld		a,(Controls)
	bit		6,a           ;f1 pressed ?
  jr    nz,.GameOver

  ;search for a block with x value 32
  ld    hl,spat+1                     ;x block 1
  ld    de,4
  ld    b,31                          ;check first 31 sprites (last sprite is player projectile)
  ld    a,48                          ;x value block hitting wall

  .loop:
  cp    (hl)
  jr    z,.GameOver
  add   hl,de
  djnz  .loop
  ret

  .GameOver:
	ld    a,(screenpage)
  or    a
  ret   nz

  ld    hl,BlockHitGameOverPart1Address
  ld    a,BlockHitGameOverGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (012*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (020*128) + (000/2) - 128
  ld    de,$8000 + (032*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (040*128) + (000/2) - 128
  ld    de,$8000 + (052*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (060*128) + (000/2) - 128
  ld    de,$8000 + (072*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (080*128) + (000/2) - 128
  ld    de,$8000 + (092*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (100*128) + (000/2) - 128
  ld    de,$8000 + (112*128) + (064/2) - 128
  ld    bc,$0000 + (019*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

;check if current score is new highscore

  ld    hl,10
  ld    (HighScoreBlockHit),hl

  .EndCheckNewHighScore:
  ;set completed %
  ld    hl,(HighScoreBlockHit)
  ld    a,l
  cp    101
  jr    c,.SetCompletePercentage
  ld    a,100
  .SetCompletePercentage:
  ld    (BlockHitCompletePercentage),a

;  call  .SetScore
;  call  .SetBestScore
;  call  .SetCompleted
;  call  .SetPercentageSymbol

  ld    a,1*32 + 31
	ld    (PageOnNextVblank),a
  call  SpritesOff

  xor   a
  ld    (freezecontrols?),a  
  call  STOPWAITSPACEPRESSED

  jp    BackToTitleScreenBlockHit

.PercentageSymbol:                     ;freely usable anywhere
  db    163,000,060,001                 ;sx,--,sy,spage
  db    169,000,107,001                 ;dx,--,dy,dpage
  db    007,000,006,000                 ;nx,--,ny,--
  db    000,%0000 0000,$90              ;fast copy -> Copy from right to left     
  .SetPercentageSymbol:
  ld    hl,.PercentageSymbol
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir

  ld    a,(PutLetterNonTransparant+dx)
  ld    (FreeToUseFastCopy0+dx),a
  ld    hl,FreeToUseFastCopy0
  call  DoCopy
  ret

  .CompletedDX: equ 148
  .CompletedDY: equ 105
  .SetCompleted:
	ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.CompletedDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.CompletedDY
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(BikeRaceCompletePercentage)
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark
  ret

  .BestScoreDX: equ 138 - 4
  .BestScoreDY: equ 079 + 13
  .SetBestScore:
	ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.BestScoreDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.BestScoreDY
  ld    (PutLetterNonTransparant+dy),a

  ld    a,(PenguinGameLevelHighest)
  cp    10
  jr    nc,.GoSetHighestLevel
  ld    a,(PutLetterNonTransparant+dx)
  add   a,7
  ld    (PutLetterNonTransparant+dx),a
  .GoSetHighestLevel:

  ld    a,(PenguinGameLevelHighest)
  ld    l,a
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark

  ld    a,.BestScoreDX+17
  ld    (PutLetterNonTransparant+dx),a

  ld    a,(PenguinGameLapsHighest)
  ld    l,a
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark
  ret

  .ScoreDX: equ 138
  .ScoreDY: equ 079
  .SetScore:
	ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.ScoreDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.ScoreDY
  ld    (PutLetterNonTransparant+dy),a

  ld    a,(PenguinGameLevel)
  cp    10
  jr    nc,.GoSetLevel
  ld    a,(PutLetterNonTransparant+dx)
  add   a,7
  ld    (PutLetterNonTransparant+dx),a
  .GoSetLevel:

  ld    a,(PenguinGameLevel)
  ld    l,a
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark

  ld    a,.ScoreDX+17
  ld    (PutLetterNonTransparant+dx),a

  ld    a,(PenguinGameLaps)
  ld    l,a
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark
  ret

  .PutTextLoopDark:
  ld    a,6
  ld    (PutLetterNonTransparant+nx),a
  ld    a,9
  ld    (PutLetterNonTransparant+ny),a

  ld    a,(hl)
  cp    255
  ret   z
  sub   a,$30                             ;0=$30
  add   a,a                               ;*2
  add   a,a                               ;*4
  add   a,a                               ;*8
  ld    (PutLetterNonTransparant+sx),a
  push  hl
  ld    hl,PutLetterNonTransparant
  call  DoCopy
  pop   hl

  ld    a,(PutLetterNonTransparant+dx)
  add   a,7
  ld    (PutLetterNonTransparant+dx),a
  inc   hl
  jr    .PutTextLoopDark













;this routine puts blockhit titlescreen in page 0, while game screen is in page 1 
BackToTitleScreenBlockHit:
  ;set buttons
  ld    hl,BlockHitButtonsPart1Address
  ld    a,BlockHitButtonsGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (221*128) + (000/2) - 128
  ld    bc,$0000 + (015*256) + (256/2)              ;10 lines for the buttons
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (015*128) + (000/2) - 128
  ld    de,$8000 + (236*128) + (000/2) - 128
  ld    bc,$0000 + (015*256) + (256/2)              ;10 lines for the buttons
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;set title screen
  ld    hl,BlockHitTitleScreenPart1Address
  ld    a,BlockHitTitleScreenGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128

  ld    b,12                                        ;12 * 10 lines=120 lines
  .loop:
  push  bc
  call  .Copy10lines
  ld    bc,10*128
  add   hl,bc
  ex    de,hl
  add   hl,bc
  ex    de,hl
  pop   bc
  djnz  .loop

  ld    bc,$0000 + (008*256) + (256/2)              ;8 more lines
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,BlockHitTitleScreenPart2Address
  ld    a,BlockHitTitleScreenGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)              ;7 more lines
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;set palette
  ld    hl,.BlockHitTitleScreenPalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  ld    a,0*32 + 31
	ld    (PageOnNextVblank),a
  call  screenon

  .Engine:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a
  call  PopulateControls
  call  .SelectButton
  call  .BlinkPlayButton

  xor   a
  ld    hl,vblankintflag
  .checkflag:
  cp    (hl)
  jr    z,.checkflag
  ld    (hl),a
  jp    .Engine

  .SelectButton:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		5,a           ;trig b pressed ?
  jp    nz,.TriggerBPressed
	bit		4,a           ;trig a pressed ?
  jp    nz,.TriggerAPressed
  ret
  .TriggerBPressed:
  ld    a,0                                ;back to arcade hall 1
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  pop   af

  ld    hl,.spatReset
  ld    de,spat
  ld    bc,32*4
  ldir
  ret

  .spatReset:						;sprite attribute table (y,x)
	db		230,100,00,0	,230,100,04,0	,230,100,08,0	,230,116,12,0
	db		230,116,16,0	,230,116,20,0	,230,100,24,0	,230,100,28,0
	db		230,100,32,0	,230,116,36,0	,230,116,40,0	,230,116,44,0
	db		230,132,48,0	,230,132,52,0	,230,230,56,0	,230,230,60,0

	db		230,230,64,0	,230,230,68,0	,230,230,72,0	,230,230,76,0
	db		230,230,80,0	,230,230,84,0	,230,230,88,0	,230,230,92,0
	db		230,230,96,0	,230,230,100,0	,230,230,104,0	,230,230,108,0
	db		230,230,112,0	,230,230,116,0	,230,230,120,0	,230,230,124,0


  .TriggerAPressed:
  ;reset time, level and lap
;  ld    hl,PenguinBikeRacePart1Address
;  ld    a,PenguinBikeRaceGfxBlock
;  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

;  ld    a,1
;  ld    (Vdp_Write_HighPage?),a
;  ld    hl,$8000 + (008*128) + (000/2) - 128
;  ld    de,$0000 + (008*128) + (000/2) - 128
;  ld    bc,$0000 + (006*256) + (256/2)
;  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
;  xor   a
;  ld    (Vdp_Write_HighPage?),a

  ld    hl,.CopyPage3ToPage1
  call  DoCopy
  call  WaitVdpReady
  call  WaitVblank
  call  WaitVblank

  call  ResetVariablesBlockHitGame
  ld    a,1*32 + 31
	ld    (PageOnNextVblank),a
  call  WriteSpatToVram
  call  SpritesOn

  ld    hl,.CopyPage3ToPage0
  call  DoCopy

  call  WaitVdpReady
  call  WaitVblank
  call  WaitVblank

  pop   af
  xor   a
	ld		(NewPrContr),a
  ret

  .CopyPage3ToPage1:
	db		0,0,0,3
	db		0,0,0,1
	db		0,1,135,0
	db		0,0,$d0	

  .CopyPage3ToPage0:
	db		0,0,0,3
	db		0,0,0,0
	db		0,1,135,0
	db		0,0,$d0	

  .BlinkPlayButton:
  ld    a,(framecounter2)
  and   31
  cp    2
  jr    c,.Button2
  cp    4
  jr    c,.Button3
  cp    6
  jr    c,.Button4
  cp    8
  jr    c,.Button3
  cp    10
  jr    c,.Button2

  .Button1:
  ld    hl,.ShowButton1
  call  DoCopy
  ret

  .Button2:
  ld    hl,.ShowButton2
  call  DoCopy
  ret

  .Button3:
  ld    hl,.ShowButton3
  call  DoCopy
  ret

  .Button4:
  ld    hl,.ShowButton4
  call  DoCopy
  ret

  .ShowButton1:
  db    000,000,221,001                 ;sx,--,sy,spage
  db    088,000,103,000                 ;dx,--,dy,dpage
  db    058,000,030,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left     

  .ShowButton2:
  db    058,000,221,001                 ;sx,--,sy,spage
  db    088,000,103,000                 ;dx,--,dy,dpage
  db    058,000,030,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left    

  .ShowButton3:
  db    116,000,221,001                 ;sx,--,sy,spage
  db    088,000,103,000                 ;dx,--,dy,dpage
  db    058,000,030,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left   

  .ShowButton4:
  db    174,000,221,001                 ;sx,--,sy,spage
  db    088,000,103,000                 ;dx,--,dy,dpage
  db    058,000,030,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left   

  .BlockHitTitleScreenPalette:
  incbin "..\grapx\BlockHit\titlescreen\TitleScreen.sc5",$7680+7,32

  .Copy10lines:
  push  hl
  push  de
  ld    bc,$0000 + (010*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank
  pop   de
  pop   hl
  ret







PutNewBlocks:
  ld    a,(PutNewBlocksCounter)
  dec   a
  ld    (PutNewBlocksCounter),a
  ret   nz
  ld    a,26
  ld    (PutNewBlocksCounter),a

  ld    ix,(BlocksColumnsTablePointer)
  ld    de,5
  add   ix,de
  ld    (BlocksColumnsTablePointer),ix

  ;find free unused block
  ld    hl,spat+1                             ;x block 1
  ld    de,4
  ld    b,31                                  ;check first 31 sprites (last sprite is player projectile)
  ld    c,19                                  ;y first block

  .loop:
  ld    a,(hl)                                ;x block
  dec   a
  jr    z,.FreeEntryFound
  add   hl,de
  djnz  .loop
  ret

  .FreeEntryFound:
  ld    a,(ix)
  or    a
  jr    nz,.PutBlock
  ld    a,c
  add   a,22
  ld    c,a
  cp    107+22
  ret   nc
  inc   ix
  add   hl,de
  djnz  .loop

  .PutBlock:
  inc   hl
  inc   hl
  ld    (hl),a                                ;put block color in the 4th byte of spat
  dec   hl
  dec   hl

  ld    (hl),250
  dec   hl                                    ;y block
  ld    (hl),c
  inc   hl                                    ;x block
  ld    a,c
  add   a,22
  ld    c,a
  cp    107+22
  ret   nc
  inc   ix
  add   hl,de
  djnz  .loop
  ret



	xor		a				;page 0/1
	ld		hl,sprcoladdr+0*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ld    b,32
;  .loop:
  push  bc
	ld		hl,GreenBlockColor	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix16	;write sprite color of pointer and hand to vram
  pop   bc
;  djnz  .loop
  ret

;RedBlockColor:
  db 7,6,5,5,5,5,5,5,5,5,5,5,5,5,6,7
;GreenBlockColor:
  db 14,13,12,12,12,12,12,12,12,12,12,12,12,12,13,14
;YellowBlockColor:
  db 11,10,9,9,9,9,9,9,9,9,9,9,9,9,10,11









MoveBlocks:
  ld    hl,spat+1                             ;x block 1
  ld    de,4
  ld    b,31                                  ;check first 31 sprites (last sprite is player projectile)

  .loop:
  ld    a,(hl)                                ;x block
  dec   a
  jr    z,.Skip
  ld    (hl),a
  sub   249-12
  jr    c,.Skip

  add   a,a                                   ;*2
  add   a,a                                   ;*4
  inc   hl                                    ;character
  ld    (hl),a
  dec   hl

  .Skip:
  add   hl,de
  djnz  .loop
  ret

SetBlockHitGameSprites:
  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr+0*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ;there are 13 different blocks with sizes from 1 pixel to 13 pixels, we write them to character table, sprites can switch size with the 3d byte in the spat table
  ;there are 13 different explosion frames, we write them also to character table, sprites can switch size with the 3d byte in the spat table
	ld		hl,BlockCharacter13PixWide	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix64		  ;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+0*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ld    b,32
  .loop:
  push  bc
	ld		hl,GreenBlockColor	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix16	;write sprite color of pointer and hand to vram
  pop   bc
  djnz  .loop
  ret

RedBlockColor:
  db 7,6,5,5,5,5,5,5,5,5,5,5,5,5,6,7
GreenBlockColor:
  db 14,13,12,12,12,12,12,12,12,12,12,12,12,12,13,14
YellowBlockColor:
  db 11,10,9,9,9,9,9,9,9,9,9,9,9,9,10,11

CheckShootNewProjectile:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  bit   4,a                           ;space pressed ?
  ret   z

  ld    a,48
  ld    (spat+1+31*4),a               ;x projectile
  xor   a
  ld    (spat+2+31*4),a               ;character projectile

  ld    a,(CannonRow)
  dec   a
  ld    b,19
  jr    z,.SetYProjectile
  dec   a
  ld    b,19+22
  jr    z,.SetYProjectile
  dec   a
  ld    b,19+44
  jr    z,.SetYProjectile
  dec   a
  ld    b,19+66
  jr    z,.SetYProjectile
  ld    b,19+88

  .SetYProjectile:
  ld    a,b
  ld    (spat+0+31*4),a
  ret

MoveProjectile:
  ld    a,(spat+1+31*4)               ;x projectile
  dec   a
  ret   z                             ;dont move if x projectile=1 (that means projectile is not in play)
  add   a,10
  ld    (spat+1+31*4),a               ;x projectile
;  cp    240
  ret   nc
  ld    a,1
  ld    (spat+1+31*4),a               ;x projectile
  ld    a,213
  ld    (spat+0+31*4),a               ;y projectile
  ret

CheckProjectileHitsBlock:
  ld    a,(spat+1+31*4)               ;x projectile
  dec   a
  ret   z                             ;dont move if x projectile=1 (that means projectile is not in play)

  ld    a,(spat+0+31*4)               ;y projectile
  ld    c,a                           ;c = y projectile

  ld    hl,spat+0                     ;y block 1
  ld    de,4
  ld    b,31                          ;check first 31 sprites (last sprite is player projectile)

  .loop:
  ld    a,(hl)                        ;y block
  cp    c
  jr    nz,.CheckNextBlock
  inc   hl                            ;x block
  ld    a,(spat+1+31*4)               ;x projectile
  add   a,26
  jr    nc,.NotCarry
  ld    a,255
  .NotCarry:

  cp    (hl)
  dec   hl                            ;y block
  jr    c,.CheckNextBlock

  ;we hit this block, first check if this block is already exploding
  inc   hl                            ;x block
  inc   hl                            ;character block
  ld    a,(hl)
  cp    13*4                          ;starting frame explosion
  dec   hl                            ;x block
  dec   hl                            ;y block
  jr    nc,.CheckNextBlock

  ;we hit this block, remove projectile
  ld    a,1
  ld    (spat+1+31*4),a               ;x projectile
  ld    a,213
  ld    (spat+0+31*4),a               ;y projectile

;  ld    a,(RemoveBlocksThatWeHit?)    ;maybe this can be used if a certain weapon is picked up ?
;  or    a
;  jr    nz,.RemoveBlockThatWeHit

  ;add a new block to the spat in front of the block we hit
  inc   hl                            ;x block
  ld    a,(hl)                        ;x block we just hit
  push  af

  ;find free unused block
  ld    hl,spat+1                     ;x block 1
  ld    de,4
  ld    b,31                          ;check first 31 sprites (last sprite is player projectile)

  .loop2:
  ld    a,(hl)                        ;x block
  dec   a
  jr    z,.FreeEntryFound2
  add   hl,de
  djnz  .loop2
  pop   af
  ret

  .FreeEntryFound2:
  pop   af                            ;x block we just hit
  sub   a,26
  ld    (hl),a
  dec   hl                            ;y block
  ld    (hl),c
  inc   hl
  inc   hl                            ;character block
  ld    (hl),0
  inc   hl                            ;color block
  ld    (hl),1
  ret

  .RemoveBlockThatWeHit:              ;maybe this can be used if a certain weapon is picked up ?
  ld    (hl),213
  inc   hl
  ld    (hl),1
  ret

  .CheckNextBlock:
  add   hl,de
  djnz  .loop
  ret

CheckInitiateExplosionEntireColumn:
  ;first search for the lowest x value among all blocks with character nr 0 (completely normal block)
  ld    hl,spat+2                     ;character block 1
  ld    de,4
  ld    b,31                          ;check first 31 sprites (last sprite is player projectile)
  ld    c,255                         ;lowest x value among all blocks with character nr 0 (completely normal block)

  .loop3:
  ld    a,(hl)
  or    a                             ;check if this block is character nr 0 (completely normal block)
  jr    nz,.CheckNextBlock
  dec   hl                            ;x block
  ld    a,(hl)
  inc   hl                            ;character block
  cp    1
  jr    z,.CheckNextBlock
  cp    c
  jr    nc,.CheckNextBlock
  ld    c,a                           ;lowest x value among all blocks with character nr 0 (completely normal block)
  .CheckNextBlock:
  add   hl,de
  djnz  .loop3

  ;search if there are 5 blocks with this same x and none of them already exploding
  ld    a,c                           ;lowest x value among all blocks with character nr 0 (completely normal block)
  ld    hl,spat+1                     ;x block 1
  ld    de,4
  ld    b,31                          ;check first 31 sprites (last sprite is player projectile)
  ld    c,0                           ;amount of block with this x value

  .loop:
  cp    (hl)
  jr    nz,.EndCheckSameX


;check if block is already exploding, if so don't increase c (amount of block with this x value)
  inc   hl                            ;character block
  push  af
  ld    a,(hl)
  cp    13*4                          ;starting frame explosion
  jr    c,.NotExploding
  dec   c
  .NotExploding:
  dec   hl                            ;x
  pop   af




  inc   c
  .EndCheckSameX:
  add   hl,de
  djnz  .loop

  ld    b,a                           ;x block we just added
  ld    a,c
  cp    5
  ret   nz
  ld    a,b                           ;x block we just added

  ;we found 5 blocks with character nr 0 (completely normal block) with the same x, set character value to 12*4 (starting animation of explosion)
  ld    hl,spat+1                     ;x block 1
  ld    de,4
  ld    b,31                          ;check first 31 sprites (last sprite is player projectile)

  .loop2:
  cp    (hl)
  jr    nz,.CheckNextBlock2

;  ld    c,a
;  ld    a,r
;  rrca
;  ld    a,c
;  jr    c,.CheckNextBlock2



  inc   hl                            ;character block


  

;check if color is green, if so explode, otherwise reduce color value
  ld    c,a
  inc   hl                            ;color block
  ld    a,(hl)
  dec   a
  ld    (hl),a
  dec   hl
  or    a
  ld    a,c
  jr    z,.ExplodeBlock
  dec   hl                            ;x block
  jr    .CheckNextBlock2
  .ExplodeBlock:




  ld    (hl),13*4                     ;starting frame explosion
  dec   hl                            ;x block
  .CheckNextBlock2:
  add   hl,de
  djnz  .loop2
  ret

AnimateBlockExplosion:
  ;we found 5 blocks with character nr 0 (completely normal block) with the same x, set character value to 12*4 (starting animation of explosion)
  ld    hl,spat+2                     ;character block 1
  ld    de,4
  ld    b,31                          ;check first 31 sprites (last sprite is player projectile)

  .loop:
  ld    a,(hl)
  cp    13*4
  jr    c,.CheckNextBlock


;  inc   hl                            ;block color
;  ld    a,(hl)
;  dec   hl                            ;character block
;  dec   a
;  jr    nz,.CheckNextBlock
;  ld    a,(hl)



  add   a,4
  ld    (hl),a  
  cp    26*4
  jp    nz,.CheckNextBlock

  ;remove at end of animation
  dec   hl                            ;x block
  ld    (hl),1
  dec   hl                            ;y block
  ld    (hl),213
  inc   hl                            ;x block
  inc   hl                            ;character block

  .CheckNextBlock:
  add   hl,de
  djnz  .loop
  ret

MoveCannon:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  and   %0000 0011
  ret   z
  cp    %0000 0001
  jr    z,.UpPressed

  .DownPressed:
  ld    a,(CannonRow)
  inc   a
  cp    6
  ret   z
  ld    (CannonRow),a
  jp    PutCannon1RowLower

  .UpPressed:
  ld    a,(CannonRow)
  dec   a
  ret   z
  ld    (CannonRow),a
  jp    PutCannon1RowHigher

PutCannon1RowHigher:
  ld    a,(CannonRow)
  dec   a
  ld    hl,.Row1
  jp    z,DoCopy
  dec   a
  ld    hl,.Row2
  jp    z,DoCopy
  dec   a
  ld    hl,.Row3
  jp    z,DoCopy
  ld    hl,.Row4
  jp    DoCopy

.Row1:
	db		008,0,064,3
	db		008,0,020,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row2:
	db		008,0,064,3
	db		008,0,042,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row3:
	db		008,0,064,3
	db		008,0,064,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row4:
	db		008,0,064,3
	db		008,0,086,0
	db		034,0,026+22,0
	db		0,0,$d0

PutCannon1RowLower:
  ld    a,(CannonRow)
  sub   a,2
  ld    hl,.Row2
  jp    z,DoCopy
  dec   a
  ld    hl,.Row3
  jp    z,DoCopy
  dec   a
  ld    hl,.Row4
  jp    z,DoCopy
  ld    hl,.Row5
  jp    DoCopy

.Row2:
	db		008,0,064-22,3
	db		008,0,042-22,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row3:
	db		008,0,064-22,3
	db		008,0,064-22,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row4:
	db		008,0,064-22,3
	db		008,0,086-22,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row5:
	db		008,0,064-22,3
	db		008,0,108-22,0
	db		034,0,026+22,0
	db		0,0,$d0

BlockhitPalette:
  incbin "..\grapx\Blockhit\Blockhit.sc5",$7680+7,32






BlockCharacter13PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248

BlockCharacter12PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240

BlockCharacter11PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224

BlockCharacter10PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192

BlockCharacter9PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128

BlockCharacter8PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter7PixWide:
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter6PixWide:
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter5PixWide:
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter4PixWide:
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter3PixWide:
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter2PixWide:
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter1PixWide:
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0









BlockCharacterExploding01:
  db 0
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 127
  db 0
  db 0
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 0

BlockCharacterExploding02:
  db 0
  db 0
  db 63
  db 63
  db 63
  db 63
  db 63
  db 63
  db 63
  db 63
  db 63
  db 63
  db 63
  db 63
  db 0
  db 0
  db 0
  db 0
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 0
  db 0

BlockCharacterExploding03:
  db 0
  db 0
  db 0
  db 31
  db 31
  db 31
  db 31
  db 31
  db 31
  db 31
  db 31
  db 31
  db 31
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 0
  db 0
  db 0

BlockCharacterExploding04:
  db 0
  db 0
  db 0
  db 0
  db 15
  db 15
  db 15
  db 15
  db 15
  db 15
  db 15
  db 15
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 0
  db 0
  db 0
  db 0

BlockCharacterExploding05:
  db 0
  db 0
  db 0
  db 0
  db 0
  db 7
  db 7
  db 7
  db 7
  db 7
  db 7
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacterExploding06:
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 2
  db 2
  db 2
  db 2
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacterExploding07:
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 2
  db 2
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacterExploding08:
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 5
  db 0
  db 0
  db 5
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacterExploding09:
  db 0
  db 0
  db 0
  db 0
  db 0
  db 8
  db 0
  db 0
  db 0
  db 0
  db 8
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 128
  db 0
  db 0
  db 0
  db 0
  db 128
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacterExploding10:
  db 0
  db 0
  db 0
  db 0
  db 16
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 16
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 64
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 64
  db 0
  db 0
  db 0
  db 0

BlockCharacterExploding11:
  db 0
  db 0
  db 0
  db 32
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 32
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 32
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 32
  db 0
  db 0
  db 0

BlockCharacterExploding12:
  db 0
  db 0
  db 64
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 64
  db 0
  db 0
  db 0
  db 0
  db 16
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 16
  db 0
  db 0

BlockCharacterExploding13:
  db 0
  db 128
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 128
  db 0
  db 0
  db 8
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 8
  db 0











dephase
