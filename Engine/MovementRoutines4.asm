;PenguinBikeRaceGameRoutine
;PenguinMovementRoutine

Phase MovementRoutinesAddress

;every second increase speed by 1
;maximum speed = 30 (every level max speed increases by 2)
;mushroom = speed -5
;fruit = boost for 3 seconds (speed + 20)
;stone = knipperen(ouch), snelheid back to 0
;star = 5 second invulnerable
;rolling monsters spawn and continue rolling in either direction
;spike sprites appear and extend and contract every second for x seconds
;clock = timefreeze (5 seconds)
;stones, rolling monsters and spikes gets announced with triangle with ! symbol


;you need to complete 10 laps to finish a level within its given time
;time is displayed in left top, laps in right top, level in the middle
;after completing a level, time gets extended, level gets increased, laps get reset
;every level max speed increases by 1 or 2

PenguinSpeed:                       equ Object2+var1 ;same spot as PutOnFrame
PenguinDistanceTravelledThisFrame:  equ Object2+var2 ;same spot as ObjectRestoreBackgroundTable
PenguinInsideOval?:                 equ Object2+var3

Stone1On?:                          equ Object3+1
Stone1Duration:                     equ Object3+2
Stone1Distance:                     equ Object3+3
Stone1InsideOval?:                  equ Object3+5

Stone2On?:                          equ Object4+1
Stone2Duration:                     equ Object4+2
Stone2Distance:                     equ Object4+3
Stone2InsideOval?:                  equ Object4+5

PenguinMovementRoutine:
  ld    a,3
  ld    (framecounter),a
  ld    (iy+PutOnFrame),3
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  call  .HandlePhase                        ;init variables, load gfx
  call  IncreasePenguinSpeed
  call  IncreaseDistanceAndSetXYPenguin
  call  HandleJumpInsideOrOutsideOval
  call  SetPenguinSprite
  call  HandlePenguinGameObjects
  call  HandlePenguinGameHud
  call  HandlePenguinGameOver
  ret

  .HandlePhase:                             ;init variables, load gfx
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ld    hl,0
  ld    (PenguinDistance),hl
  ld    a,30
  ld    (PenguinMaxSpeed),a                 ;maximum speed level 1 = 30, level 10 = 48, speed boost is + 20 speed (every level max speed increases by 2)
  xor   a
  ld    (PenguinInsideOval?),a
  ld    (PenguinDistanceTravelledThisFrame),a
  ld    (PenguinSpeed),a
  ld    (framecounter2),a
  ld    (Stone2On?),a

  ld    a,1
  ld    (Stone1On?),a
  ld    hl,0
  ld    (Stone1Distance),hl


  ld    a,1
  ld    (PenguinGameLevel),a
;ld a,10
  ld    (PenguinGameLaps),a
  ld    (PenguinGameLapsCopy),a
  ld    a,61
;ld a,1
  ld    (PenguinGameTime),a

  call  SetArcadeMachine

  ;set penguin bike race page 0
  ld    hl,PenguinBikeRacePart1Address
  ld    a,PenguinBikeRaceGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (128*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,PenguinBikeRacePart2Address
  ld    a,PenguinBikeRaceGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;copy page 0 to page 1
  xor   a
  ld    (CopyPageToPage212High+sPage),a
  ld    a,1
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy

  ;copy page 0 to page 2
  ld    a,2
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy

  ;copy page 0 to page 3
  ld    a,3
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy

  ld    hl,PenguinBikeRacePalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  call  SetPenguinBikeRaceSprites

  ;set font at y=212 page 1
  ld    hl,PenguinBikeRaceFontPart1Address
  ld    a,PenguinBikeRaceFontGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (212*128) + (000/2) - 128
  ld    bc,$0000 + (009*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ld    a,1
  ld    (SetArcadeGamePalette?),a           ;action on vblank: 1=set palette, 2=set palette and write spat to vram
  ret

HandlePenguinGameOver:
  ld    a,(PenguinGameTime)
  or    a
  ret   nz
  ld    a,(PenguinSpeed)
  or    a
  ret   nz

  .GamveOver:
	ld    a,(screenpage)
  or    a
  ret   nz

  ld    hl,PenguinBikeRaceGameOverPart1Address
  ld    a,PenguinBikeRaceGameOverGfxBlock
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

;ld a,11
;  ld    (PenguinGameLevel),a
;ld a,1
;  ld    (PenguinGameLaps),a


;check if current score is new highscore
  ld    a,(PenguinGameLevel)
  dec   a
  ld    e,a
  ld    d,0
  ld    hl,10
  call  MultiplyHlWithDE      ;HL = result (level-1)*10
  ld    a,(PenguinGameLaps)
  dec   a
  ld    e,a
  ld    d,0
  add   hl,de                           ;(level-1)*10 + (laps - 1)
  ld    (PenguinBikeRaceScore),hl
  ex    de,hl

  ld    hl,(HighScoreBikeRace)
  xor   a
  sbc   hl,de
  jr    nc,.EndCheckNewHighScore
  ld    (HighScoreBikeRace),de
  ld    a,(PenguinGameLaps)
  ld    (PenguinGameLapsHighest),a
  ld    a,(PenguinGameLevel)
  ld    (PenguinGameLevelHighest),a


  .EndCheckNewHighScore:
;set completed %
  ld    hl,(HighScoreBikeRace)
  ld    a,l
  cp    101
  jr    c,.SetCompletePercentage
  ld    a,100
  .SetCompletePercentage:
  ld    (BikeRaceCompletePercentage),a

  call  .SetScore
  call  .SetBestScore
  call  .SetCompleted
  call  .SetPercentageSymbol

  ld    a,1*32 + 31
	ld    (PageOnNextVblank),a
  call  SpritesOff

  xor   a
  ld    (freezecontrols?),a  
  call  STOPWAITSPACEPRESSED

  jp    BackToTitleScreenBasketBall

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

  ret

HandlePenguinGameHud:
  ld    a,(framecounter2)
  and   15
  jp    z,.AdjustTimeAndSetLapsCopy
  cp    5
  jp    c,.SetTime
  cp    9
  jp    c,.SetLevel

  .SetLaps:
  ;erase Laps
  ld    hl,.EraseLaps
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir
	ld    a,(screenpage)
  dec   a
  and   3
  ld    (FreeToUseFastCopy0+dPage),a             ;set page where to put text
  ld    hl,FreeToUseFastCopy0
  call  DoCopy

	ld    a,(screenpage)
  dec   a
  and   3
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text

  ld    a,(PenguinGameLapsCopy)
  cp    10
  ld    a,.LapsDX
  jr    c,.SetDX
  ld    a,.LapsDX-5
  .SetDX:
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.LapsDY
  ld    (PutLetterNonTransparant+dy),a

  ld    a,(PenguinGameLapsCopy)
  ld    l,a
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  ld    a,$98
  ld    (PutLetterNonTransparant+copytype),a
  call  .PutTextLoop
  ld    a,$90
  ld    (PutLetterNonTransparant+copytype),a
  ret

  .EraseLaps:
	db		226,0,014,0
	db		226,0,008,0
	db		010,0,006,0
	db		0,0,$d0

  .LapsDX: equ 231
  .LapsDY: equ 008

  .SetLevel:
  ;erase level
  ld    hl,.EraseLevel
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir
	ld    a,(screenpage)
  dec   a
  and   3
  ld    (FreeToUseFastCopy0+dPage),a             ;set page where to put text
  ld    hl,FreeToUseFastCopy0
  call  DoCopy

	ld    a,(screenpage)
  dec   a
  and   3
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.LevelDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.LevelDY
  ld    (PutLetterNonTransparant+dy),a

  ld    a,(PenguinGameLevel)
  ld    l,a
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  ld    a,$98
  ld    (PutLetterNonTransparant+copytype),a
  call  .PutTextLoop
  ld    a,$90
  ld    (PutLetterNonTransparant+copytype),a
  ret

  .EraseLevel:
	db		018,0,129,0
	db		140,0,008,0
	db		004,0,006,0
	db		0,0,$d0

  .LevelDX: equ 140
  .LevelDY: equ 008

  .AdjustTimeAndSetLapsCopy:
  ld    a,(PenguinGameLaps)
  ld    (PenguinGameLapsCopy),a

  ld    a,(PenguinGameTimeSpeed)
  inc   a
  ld    (PenguinGameTimeSpeed),a
  and   3
  ret   nz

  ld    a,(PenguinGameTime)
  dec   a
  ret   m
  ld    (PenguinGameTime),a
  ret

  .SetTime:
  ;erase time
  ld    hl,.EraseTime
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir
	ld    a,(screenpage)
  dec   a
  and   3
  ld    (FreeToUseFastCopy0+dPage),a             ;set page where to put text
  ld    hl,FreeToUseFastCopy0
  call  DoCopy

	ld    a,(screenpage)
  dec   a
  and   3
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.TimeDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.TimeDY
  ld    (PutLetterNonTransparant+dy),a

  ld    a,(PenguinGameTime)
  ld    l,a
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  ld    a,$98
  ld    (PutLetterNonTransparant+copytype),a
  call  .PutTextLoop
  ld    a,$90
  ld    (PutLetterNonTransparant+copytype),a
  ret

  .EraseTime:
	db		006,0,014,0
	db		028,0,008,0
	db		010,0,006,0
	db		0,0,$d0

  .TimeDX: equ 029
  .TimeDY: equ 008

  .PutTextLoop:
  ld    a,4
  ld    (PutLetterNonTransparant+nx),a
  ld    a,6
  ld    (PutLetterNonTransparant+ny),a

  ld    a,(hl)
  cp    255
  ret   z
  sub   a,$30                             ;0=$30
  add   a,a                               ;*2
  add   a,a                               ;*4
  add   a,192
  ld    (PutLetterNonTransparant+sx),a
  push  hl
  ld    hl,PutLetterNonTransparant
  call  DoCopy
  pop   hl

  ld    a,(PutLetterNonTransparant+dx)
  add   a,5
  ld    (PutLetterNonTransparant+dx),a
  inc   hl
  jr    .PutTextLoop

HandlePenguinGameObjects:
  call  HandleStone1Sprite
  ret

  call  SetAlarmSprite
  call  SetStarSprite
  call  SetPizzaSprite
  call  SetClockSprite
  call  SetMushroomSprite
  ret

;Stone1On?:                          equ Object3+0
;Stone1Duration:                     equ Object3+1
;Stone1Distance:                     equ Object3+2
;Stone1InsideOval?:                  equ Object3+4

StoneSpriteYSpat:              equ spat+0+08*4
StoneSpriteXSpat:              equ spat+1+08*4
HandleStone1Sprite:
  ld    a,(Stone1On?)
  or    a
  ret   z

  ld    hl,(Stone1Distance)

  inc   hl
  ld    de,440
  xor   a
  sbc   hl,de
  jr    nc,.EndCheckLapFinished
  add   hl,de
  .EndCheckLapFinished:
  ld    (Stone1Distance),hl



  add   hl,hl                               ;*2

  ld    de,CoordinateTableSpritesInsideOval
;  ld    de,CoordinateTableSpritesOutsideOval

  add   hl,de
  ld    a,(hl)                              ;x
  ld    (StoneSpriteXSpat),a                 ;x sprite 0
  ld    (StoneSpriteXSpat+4),a                 ;x sprite 1

  inc   hl
  ld    a,(hl)                              ;y
  ld    (StoneSpriteYSpat),a                 ;y sprite 0
  ld    (StoneSpriteYSpat+4),a                 ;y sprite 1
  ret


CoordinateTableSpritesInsideOval:
.TopStraightSegment: ;130 points
db 56,42, 57,42, 58,42, 59,42, 60,42, 61,42, 62,42, 63,42, 64,42, 65,42
db 66,42, 67,42, 68,42, 69,42, 70,42, 71,42, 72,42, 73,42, 74,42, 75,42
db 76,42, 77,42, 78,42, 79,42, 80,42, 81,42, 82,42, 83,42, 84,42, 85,42
db 86,42, 87,42, 88,42, 89,42, 90,42, 91,42, 92,42, 93,42, 94,42, 95,42
db 96,42, 97,42, 98,42, 99,42, 100,42, 101,42, 102,42, 103,42, 104,42, 105,42
db 106,42, 107,42, 108,42, 109,42, 110,42, 111,42, 112,42, 113,42, 114,42, 115,42
db 116,42, 117,42, 118,42, 119,42, 120,42, 121,42, 122,42, 123,42, 124,42, 125,42
db 126,42, 127,42, 128,42, 129,42, 130,42, 131,42, 132,42, 133,42, 134,42, 135,42
db 136,42, 137,42, 138,42, 139,42, 140,42, 141,42, 142,42, 143,42, 144,42, 145,42
db 146,42, 147,42, 148,42, 149,42, 150,42, 151,42, 152,42, 153,42, 154,42, 155,42
db 156,42, 157,42, 158,42, 159,42, 160,42, 161,42, 162,42, 163,42, 164,42, 165,42
db 166,42, 167,42, 168,42, 169,42, 170,42, 171,42, 172,42, 173,42, 174,42, 175,42
db 176,42, 177,42, 178,42, 179,42, 180,42, 181,42, 182,42, 183,42, 184,42, 185,42

.RightCurve:
db 185,41, 186,43, 186,43, 187,43, 187,43, 188,43, 189,43, 189,43, 190,44, 191,44, 191,44
db 192,45, 192,45, 193,45, 194,46, 194,46, 195,47, 196,47, 196,48, 197,48, 197,49
db 198,49, 198,50, 199,50, 199,51, 200,51, 200,52, 201,53, 201,53, 201,54, 202,54
db 202,55, 202,56, 202,56, 203,57, 203,58, 203,58, 203,59, 203,60, 203,61, 203,61, 204,61
db 203,62, 203,63, 203,64, 203,64, 203,65, 203,66, 203,66, 203,67, 203,68, 203,68
db 203,69, 203,70, 203,71, 202,71, 202,72, 202,73, 202,73, 201,74, 201,75, 201,75, 201,75
db 200,76, 200,77, 199,77, 199,78, 198,78, 198,79, 197,79, 197,80, 196,80, 196,81
db 195,81, 194,81, 194,82, 193,82, 192,82, 192,82, 191,82, 191,82, 190,82, 189,83
db 189,83, 188,83, 187,83, 187,83, 186,83, 186,83, 185,83

.BottomStraightSegment: ;130 points
db 185,84, 184,84, 183,84, 182,84, 181,84, 180,84, 179,84, 178,84, 177,84, 176,84
db 175,84, 174,84, 173,84, 172,84, 171,84, 170,84, 169,84, 168,84, 167,84, 166,84
db 165,84, 164,84, 163,84, 162,84, 161,84, 160,84, 159,84, 158,84, 157,84, 156,84
db 155,84, 154,84, 153,84, 152,84, 151,84, 150,84, 149,84, 148,84, 147,84, 146,84
db 145,84, 144,84, 143,84, 142,84, 141,84, 140,84, 139,84, 138,84, 137,84, 136,84
db 135,84, 134,84, 133,84, 132,84, 131,84, 130,84, 129,84, 128,84, 127,84, 126,84
db 125,84, 124,84, 123,84, 122,84, 121,84, 120,84, 119,84, 118,84, 117,84, 116,84
db 115,84, 114,84, 113,84, 112,84, 111,84, 110,84, 109,84, 108,84, 107,84, 106,84
db 105,84, 104,84, 103,84, 102,84, 101,84, 100,84, 99,84, 98,84, 97,84, 96,84
db 95,84, 94,84, 93,84, 92,84, 91,84, 90,84, 89,84, 88,84, 87,84, 86,84
db 85,84, 84,84, 83,84, 82,84, 81,84, 80,84, 79,84, 78,84, 77,84, 76,84
db 75,84, 74,84, 73,84, 72,84, 71,84, 70,84, 69,84, 68,84, 67,84, 66,84
db 65,84, 64,84, 63,84, 62,84, 61,84, 60,84, 59,84, 58,84, 57,84, 56,84

.LeftCurve:
db 56,83, 55,82, 55,82, 54,82, 54,82, 53,82, 52,82, 52,82, 51,81, 50,81, 50,81
db 49,80, 49,80, 48,80, 47,79, 47,79, 46,78, 45,78, 45,77, 44,77, 44,76
db 43,76, 43,75, 42,75, 42,74, 41,74, 41,73, 40,72, 40,72, 40,71, 39,71
db 39,70, 39,69, 39,69, 38,68, 38,67, 38,67, 38,66, 38,65, 38,64, 38,64, 37,64
db 38,63, 38,62, 38,61, 38,61, 38,60, 38,59, 38,59, 38,58, 38,57, 38,57
db 38,56, 38,55, 38,54, 39,54, 39,53, 39,52, 39,52, 40,51, 40,50, 40,50, 40,50
db 41,49, 41,48, 42,48, 42,47, 43,47, 43,46, 44,46, 44,45, 45,45, 45,44
db 46,44, 47,44, 47,43, 48,43, 49,43, 49,43, 50,43, 50,43, 51,43, 52,42
db 52,42, 53,42, 54,42, 54,42, 55,42, 55,42, 56,42





CoordinateTableSpritesOutsideOval:
.TopStraightSegment: ;130 points
db 56,26, 57,26, 58,26, 59,26, 60,26, 61,26, 62,26, 63,26, 64,26, 65,26
db 66,26, 67,26, 68,26, 69,26, 70,26, 71,26, 72,26, 73,26, 74,26, 75,26
db 76,26, 77,26, 78,26, 79,26, 80,26, 81,26, 82,26, 83,26, 84,26, 85,26
db 86,26, 87,26, 88,26, 89,26, 90,26, 91,26, 92,26, 93,26, 94,26, 95,26
db 96,26, 97,26, 98,26, 99,26, 100,26, 101,26, 102,26, 103,26, 104,26, 105,26
db 106,26, 107,26, 108,26, 109,26, 110,26, 111,26, 112,26, 113,26, 114,26, 115,26
db 116,26, 117,26, 118,26, 119,26, 120,26, 121,26, 122,26, 123,26, 124,26, 125,26
db 126,26, 127,26, 128,26, 129,26, 130,26, 131,26, 132,26, 133,26, 134,26, 135,26
db 136,26, 137,26, 138,26, 139,26, 140,26, 141,26, 142,26, 143,26, 144,26, 145,26
db 146,26, 147,26, 148,26, 149,26, 150,26, 151,26, 152,26, 153,26, 154,26, 155,26
db 156,26, 157,26, 158,26, 159,26, 160,26, 161,26, 162,26, 163,26, 164,26, 165,26
db 166,26, 167,26, 168,26, 169,26, 170,26, 171,26, 172,26, 173,26, 174,26, 175,26
db 176,26, 177,26, 178,26, 179,26, 180,26, 181,26, 182,26, 183,26, 184,26, 185,26

.RightCurve: ;90 points (semicircle centered at 185,63; radius 37)
db 185,26, 186,26, 188,26, 189,26, 190,26, 191,27, 193,27, 194,27, 195,27, 197,28
db 198,28, 199,29, 200,29, 201,30, 203,30, 204,31, 205,32, 206,32, 207,33, 208,34
db 209,35, 210,36, 211,37, 212,38, 213,39, 214,39, 214,41, 215,42, 216,43, 217,44
db 217,45, 218,46, 218,47, 219,48, 219,50, 220,51, 220,52, 221,53, 221,55, 221,56
db 222,57, 222,58, 222,60, 222,61, 222,62, 222,64, 222,65, 222,66, 222,68, 222,69
db 221,70, 221,71, 221,73, 220,74, 220,75, 219,76, 219,78, 218,79, 218,80, 217,81
db 217,82, 216,83, 215,84, 214,85, 214,87, 213,87, 212,88, 211,89, 210,90, 209,91
db 208,92, 207,93, 206,94, 205,94, 204,95, 203,96, 201,96, 200,97, 199,97, 198,98
db 197,98, 195,99, 194,99, 193,99, 191,99, 190,100, 189,100, 188,100, 186,100, 185,100

.BottomStraightSegment: ;130 points
db 185,100, 184,100, 183,100, 182,100, 181,100, 180,100, 179,100, 178,100, 177,100, 176,100
db 175,100, 174,100, 173,100, 172,100, 171,100, 170,100, 169,100, 168,100, 167,100, 166,100
db 165,100, 164,100, 163,100, 162,100, 161,100, 160,100, 159,100, 158,100, 157,100, 156,100
db 155,100, 154,100, 153,100, 152,100, 151,100, 150,100, 149,100, 148,100, 147,100, 146,100
db 145,100, 144,100, 143,100, 142,100, 141,100, 140,100, 139,100, 138,100, 137,100, 136,100
db 135,100, 134,100, 133,100, 132,100, 131,100, 130,100, 129,100, 128,100, 127,100, 126,100
db 125,100, 124,100, 123,100, 122,100, 121,100, 120,100, 119,100, 118,100, 117,100, 116,100
db 115,100, 114,100, 113,100, 112,100, 111,100, 110,100, 109,100, 108,100, 107,100, 106,100
db 105,100, 104,100, 103,100, 102,100, 101,100, 100,100, 99,100, 98,100, 97,100, 96,100
db 95,100, 94,100, 93,100, 92,100, 91,100, 90,100, 89,100, 88,100, 87,100, 86,100
db 85,100, 84,100, 83,100, 82,100, 81,100, 80,100, 79,100, 78,100, 77,100, 76,100
db 75,100, 74,100, 73,100, 72,100, 71,100, 70,100, 69,100, 68,100, 67,100, 66,100
db 65,100, 64,100, 63,100, 62,100, 61,100, 60,100, 59,100, 58,100, 57,100, 56,100

.LeftCurve: ;90 points (mirrored semicircle from bottom-left to top-left)
db 56,100, 55,100, 53,100, 52,100, 51,100, 50,99, 48,99, 47,99, 46,99, 44,98
db 43,98, 42,97, 41,97, 40,96, 38,96, 37,95, 36,94, 35,94, 34,93, 33,92
db 32,91, 31,90, 30,89, 29,88, 28,87, 27,87, 27,85, 26,84, 25,83, 24,82
db 24,81, 23,80, 23,79, 22,78, 22,76, 21,75, 21,74, 20,73, 20,71, 20,70
db 19,69, 19,68, 19,66, 19,65, 19,64, 19,62, 19,61, 19,60, 19,58, 19,57
db 20,56, 20,55, 20,53, 21,52, 21,51, 22,50, 22,48, 23,47, 23,46, 24,45
db 24,44, 25,43, 26,42, 27,41, 27,39, 28,39, 29,38, 30,37, 31,36, 32,35
db 33,34, 34,33, 35,32, 36,32, 37,31, 38,30, 40,30, 41,29, 42,29, 43,28
db 44,28, 46,27, 47,27, 48,27, 50,27, 51,26, 52,26, 53,26, 55,26, 56,26








HandleJumpInsideOrOutsideOval:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;f1 pressed ?
  ret   z
  ld    a,(PenguinInsideOval?)
  xor   1
  ld    (PenguinInsideOval?),a
  ret

SetPenguinSprite:
  ld    a,(PenguinInsideOval?)
  or    a
  ld    de,PenguinCurvatureTableInsideOval
  jr    nz,.Go
  ld    de,PenguinCurvatureTableOutsideOval
  .Go:
  ld    hl,(PenguinDistance)          ;440 = total distance (130 pixels top straight, 90 pixels right curve, 130 bottom straight, 90 pixel left curve)
  srl   h        ; Shift high byte right, LSB -> Carry
  rr    l        ; Rotate low byte right through Carry, Carry -> MSB of L
  srl   h        ; Shift high byte right, LSB -> Carry
  rr    l        ; Rotate low byte right through Carry, Carry -> MSB of L
  ;we have distance / 4
  res   0,l
  add   hl,de

  ld    a,(hl)
  ld    (iy+SpriteData),a
  inc   hl
  ld    a,(hl)
  ld    (iy+SpriteData+1),a
  ret

IncreasePenguinSpeed:                       ;maximum speed level 1 = 30, level 10 = 48, speed boost is + 20 speed (every level max speed increases by 2)
  ld    a,(framecounter2)
  and   7
  ret   nz

  ld    a,(PenguinGameTime)
  or    a
  jr    z,.OutOfTime

  ld    a,(PenguinMaxSpeed)
  ld    b,a
  ld    a,(PenguinSpeed)
  inc   a
  cp    b
  ret   z
  ld    (PenguinSpeed),a
  ret

  .OutOfTime:
  ld    a,(PenguinSpeed)
  dec   a
  ret   m
  ld    (PenguinSpeed),a
  ret

IncreaseDistanceAndSetXYPenguin:
  ld    a,(PenguinSpeed)                    ;68 = max speed, max speed should increase distance by 4 every frame
  ld    b,a
  ld    c,0                                 ;distance increased this frame

  ld    a,(PenguinDistanceTravelledThisFrame)
  add   a,b
  .loop:
  sub   a,17
  jr    c,.GoSetNewDistance
  inc   c
  jp    .loop
  .GoSetNewDistance:
  add   a,17
  ld    (PenguinDistanceTravelledThisFrame),a

  ld    hl,(PenguinDistance)
  ld    b,0
  add   hl,bc
  ld    de,440
  xor   a
  sbc   hl,de
  jr    nc,.LapFinished
  add   hl,de
  .EndCheckLapFinished:
  ld    (PenguinDistance),hl

  add   hl,hl                               ;*2
  ld    de,CoordinateTablePenguin
  add   hl,de
  ld    a,(hl)                              ;x
  ld    (iy+x),a
  inc   hl
  ld    a,(hl)                              ;y
  ld    (iy+y),a
  ret

  .LapFinished:
  ld    a,(PenguinGameLaps)
  inc   a
  ld    (PenguinGameLaps),a
  cp    11
  jp    nz,.EndCheckLapFinished
  ;Next level
  ld    a,1
  ld    (PenguinGameLaps),a
  ld    a,(PenguinGameLevel)
  inc   a
  ld    (PenguinGameLevel),a
  ld    a,(PenguinGameTime)
  add   a,30
  ld    (PenguinGameTime),a
  ld    a,(PenguinMaxSpeed)
  add   a,2
  ld    (PenguinMaxSpeed),a
  jp    .EndCheckLapFinished

MushroomLookingLeftSpriteYSpat:              equ spat+0+12*4
MushroomLookingLeftSpriteXSpat:              equ spat+1+12*4
MushroomLookingRightSpriteYSpat:              equ spat+0+16*4
MushroomLookingRightSpriteXSpat:              equ spat+1+16*4
MushroomLookingUpSpriteYSpat:               equ spat+0+20*4
MushroomLookingUpSpriteXSpat:               equ spat+1+20*4
MushroomLookingDownSpriteYSpat:               equ spat+0+24*4
MushroomLookingDownSpriteXSpat:               equ spat+1+24*4

SetMushroomSprite:
;mushroom looking Down
  ld    a,110
  ld    (MushroomLookingDownSpriteYSpat),a                 ;y sprite 0
  ld    (MushroomLookingDownSpriteYSpat+4),a                 ;y sprite 1
  ld    a,110+16
  ld    (MushroomLookingDownSpriteYSpat+8),a                 ;y sprite 1
  ld    (MushroomLookingDownSpriteYSpat+12),a                 ;y sprite 1
  ld    a,50
  ld    (MushroomLookingDownSpriteXSpat),a                 ;x sprite 0
  ld    (MushroomLookingDownSpriteXSpat+4),a                 ;x sprite 1
  ld    (MushroomLookingDownSpriteXSpat+8),a                 ;x sprite 0
  ld    (MushroomLookingDownSpriteXSpat+12),a                 ;x sprite 1
;  ret

;mushroom looking Up
  ld    a,110
  ld    (MushroomLookingUpSpriteYSpat),a                 ;y sprite 0
  ld    (MushroomLookingUpSpriteYSpat+4),a                 ;y sprite 1
  ld    a,110+16
  ld    (MushroomLookingUpSpriteYSpat+8),a                 ;y sprite 1
  ld    (MushroomLookingUpSpriteYSpat+12),a                 ;y sprite 1
  ld    a,80
  ld    (MushroomLookingUpSpriteXSpat),a                 ;x sprite 0
  ld    (MushroomLookingUpSpriteXSpat+4),a                 ;x sprite 1
  ld    (MushroomLookingUpSpriteXSpat+8),a                 ;x sprite 0
  ld    (MushroomLookingUpSpriteXSpat+12),a                 ;x sprite 1
;  ret

;mushroom looking right
  ld    a,70
  ld    (MushroomLookingRightSpriteYSpat),a                 ;y sprite 0
  ld    (MushroomLookingRightSpriteYSpat+4),a                 ;y sprite 1
  ld    (MushroomLookingRightSpriteYSpat+8),a                 ;y sprite 1
  ld    (MushroomLookingRightSpriteYSpat+12),a                 ;y sprite 1
  ld    a,100
  ld    (MushroomLookingRightSpriteXSpat),a                 ;x sprite 0
  ld    (MushroomLookingRightSpriteXSpat+4),a                 ;x sprite 1
  ld    a,100+16
  ld    (MushroomLookingRightSpriteXSpat+8),a                 ;x sprite 0
  ld    (MushroomLookingRightSpriteXSpat+12),a                 ;x sprite 1
;  ret

;mushroom looking left
  ld    a,50
  ld    (MushroomLookingLeftSpriteYSpat),a                 ;y sprite 0
  ld    (MushroomLookingLeftSpriteYSpat+4),a                 ;y sprite 1
  ld    (MushroomLookingLeftSpriteYSpat+8),a                 ;y sprite 1
  ld    (MushroomLookingLeftSpriteYSpat+12),a                 ;y sprite 1
  ld    a,130
  ld    (MushroomLookingLeftSpriteXSpat),a                 ;x sprite 0
  ld    (MushroomLookingLeftSpriteXSpat+4),a                 ;x sprite 1
  ld    a,130+16
  ld    (MushroomLookingLeftSpriteXSpat+8),a                 ;x sprite 0
  ld    (MushroomLookingLeftSpriteXSpat+12),a                 ;x sprite 1
  ret

ClockSpriteYSpat:              equ spat+0+06*4
ClockSpriteXSpat:              equ spat+1+06*4
SetClockSprite:
  ld    a,70
  ld    (ClockSpriteYSpat),a                 ;y sprite 0
  ld    (ClockSpriteYSpat+4),a                 ;y sprite 1
  ld    a,50
  ld    (ClockSpriteXSpat),a                 ;x sprite 0
  ld    (ClockSpriteXSpat+4),a                 ;x sprite 1
  ret

PizzaSpriteYSpat:              equ spat+0+04*4
PizzaSpriteXSpat:              equ spat+1+04*4
SetPizzaSprite:
  ld    a,50
  ld    (PizzaSpriteYSpat),a                 ;y sprite 0
  ld    (PizzaSpriteYSpat+4),a                 ;y sprite 1
  ld    a,50
  ld    (PizzaSpriteXSpat),a                 ;x sprite 0
  ld    (PizzaSpriteXSpat+4),a                 ;x sprite 1
  ret

StarSpriteYSpat:              equ spat+0+02*4
StarSpriteXSpat:              equ spat+1+02*4
SetStarSprite:
  ld    a,30
  ld    (StarSpriteYSpat),a                 ;y sprite 0
  ld    (StarSpriteYSpat+4),a                 ;y sprite 1
  ld    a,50
  ld    (StarSpriteXSpat),a                 ;x sprite 0
  ld    (StarSpriteXSpat+4),a                 ;x sprite 1
  ret

AlarmSpriteYSpat:              equ spat+0+00*4
AlarmSpriteXSpat:              equ spat+1+00*4
SetAlarmSprite:
  ld    a,10
  ld    (AlarmSpriteYSpat),a                 ;y sprite 0
  ld    (AlarmSpriteYSpat+4),a                 ;y sprite 1
  ld    a,50
  ld    (AlarmSpriteXSpat),a                 ;x sprite 0
  ld    (AlarmSpriteXSpat+4),a                 ;x sprite 1
  ret

CoordinateTablePenguin:
.TopStraightSegment: ;130 points
db 64,-22, 65,-22, 66,-22, 67,-22, 68,-22, 69,-22, 70,-22, 71,-22, 72,-22, 73,-22
db 74,-22, 75,-22, 76,-22, 77,-22, 78,-22, 79,-22, 80,-22, 81,-22, 82,-22, 83,-22
db 84,-22, 85,-22, 86,-22, 87,-22, 88,-22, 89,-22, 90,-22, 91,-22, 92,-22, 93,-22
db 94,-22, 95,-22, 96,-22, 97,-22, 98,-22, 99,-22, 100,-22, 101,-22, 102,-22, 103,-22
db 104,-22, 105,-22, 106,-22, 107,-22, 108,-22, 109,-22, 110,-22, 111,-22, 112,-22, 113,-22
db 114,-22, 115,-22, 116,-22, 117,-22, 118,-22, 119,-22, 120,-22, 121,-22, 122,-22, 123,-22
db 124,-22, 125,-22, 126,-22, 127,-22, 128,-22, 129,-22, 130,-22, 131,-22, 132,-22, 133,-22
db 134,-22, 135,-22, 136,-22, 137,-22, 138,-22, 139,-22, 140,-22, 141,-22, 142,-22, 143,-22
db 144,-22, 145,-22, 146,-22, 147,-22, 148,-22, 149,-22, 150,-22, 151,-22, 152,-22, 153,-22
db 154,-22, 155,-22, 156,-22, 157,-22, 158,-22, 159,-22, 160,-22, 161,-22, 162,-22, 163,-22
db 164,-22, 165,-22, 166,-22, 167,-22, 168,-22, 169,-22, 170,-22, 171,-22, 172,-22, 173,-22
db 174,-22, 175,-22, 176,-22, 177,-22, 178,-22, 179,-22, 180,-22, 181,-22, 182,-22, 183,-22
db 184,-22, 185,-22, 186,-22, 187,-22, 188,-22, 189,-22, 190,-22, 191,-22, 192,-22, 193,-22

.RightCurve: ;90 points
db 194,-22, 195,-22, 196,-22, 197,-22, 198,-22, 199,-22, 200,-21, 201,-21, 202,-21, 203,-21
db 204,-20, 205,-20, 206,-20, 207,-19, 208,-18, 209,-18, 210,-17, 211,-17, 212,-16, 213,-16
db 213,-15, 214,-14, 215,-14, 216,-13, 216,-12, 217,-11, 218,-10, 219,-9, 219,-8, 220,-7
db 220,-6, 221,-6, 221,-5, 222,-4, 222,-3, 222,-2, 223,-1, 223,0, 223,1, 223,2
db 224,3, 224,4, 224,5, 224,6, 224,7, 224,8, 224,9, 224,10, 224,11, 224,12
db 224,13, 223,14, 223,15, 223,16, 223,17, 222,18, 222,19, 222,20, 221,20, 221,21
db 220,22, 220,23, 219,24, 219,25, 218,26, 217,27, 216,28, 216,29, 215,29, 214,30
db 214,31, 213,31, 212,32, 211,33, 210,33, 209,34, 208,35, 207,35, 206,36, 205,36
db 204,36, 203,37, 202,37, 201,37, 200,37, 199,38, 198,38, 197,38, 196,38, 195,38

.BottomStraightSegment: ;130 points
db 194,38, 193,38, 192,38, 191,38, 190,38, 189,38, 188,38, 187,38, 186,38, 185,38
db 184,38, 183,38, 182,38, 181,38, 180,38, 179,38, 178,38, 177,38, 176,38, 175,38
db 174,38, 173,38, 172,38, 171,38, 170,38, 169,38, 168,38, 167,38, 166,38, 165,38
db 164,38, 163,38, 162,38, 161,38, 160,38, 159,38, 158,38, 157,38, 156,38, 155,38
db 154,38, 153,38, 152,38, 151,38, 150,38, 149,38, 148,38, 147,38, 146,38, 145,38
db 144,38, 143,38, 142,38, 141,38, 140,38, 139,38, 138,38, 137,38, 136,38, 135,38
db 134,38, 133,38, 132,38, 131,38, 130,38, 129,38, 128,38, 127,38, 126,38, 125,38
db 124,38, 123,38, 122,38, 121,38, 120,38, 119,38, 118,38, 117,38, 116,38, 115,38
db 114,38, 113,38, 112,38, 111,38, 110,38, 109,38, 108,38, 107,38, 106,38, 105,38
db 104,38, 103,38, 102,38, 101,38, 100,38, 99,38, 98,38, 97,38, 96,38, 95,38
db 94,38, 93,38, 92,38, 91,38, 90,38, 89,38, 88,38, 87,38, 86,38, 85,38
db 84,38, 83,38, 82,38, 81,38, 80,38, 79,38, 78,38, 77,38, 76,38, 75,38
db 74,38, 73,38, 72,38, 71,38, 70,38, 69,38, 68,38, 67,38, 66,38, 65,38

.LeftCurve: ;90 points
db 64,38, 63,38, 62,38, 61,38, 60,38, 59,38, 58,37, 57,37, 56,37, 55,37
db 54,36, 53,36, 52,36, 51,35, 50,35, 49,34, 48,33, 47,33, 46,32, 45,31
db 44,31, 44,30, 43,29, 42,29, 42,28, 41,27, 40,26, 39,25, 39,24, 38,23
db 38,22, 37,21, 37,20, 36,20, 36,19, 36,18, 35,17, 35,16, 35,15, 35,14
db 34,13, 34,12, 34,11, 34,10, 34,9, 34,8, 34,7, 34,6, 34,5, 34,4
db 34,3, 35,2, 35,1, 35,0, 35,-1, 36,-2, 36,-3, 36,-4, 37,-5, 37,-6
db 38,-6, 38,-7, 39,-8, 39,-9, 40,-10, 41,-11, 42,-12, 42,-13, 43,-14, 44,-14
db 45,-15, 45,-16, 46,-16, 47,-17, 48,-17, 49,-18, 50,-18, 51,-19, 52,-20, 53,-20
db 54,-20, 55,-21, 56,-21, 57,-21, 58,-21, 59,-22, 60,-22, 61,-22, 62,-22, 63,-22

PenguinCurvatureTableOutsideOval:
  dw    PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0
  dw    PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0, PenguinBikeRace_0

  dw    PenguinBikeRace_1, PenguinBikeRace_2, PenguinBikeRace_3, PenguinBikeRace_4, PenguinBikeRace_5, PenguinBikeRace_6, PenguinBikeRace_7, PenguinBikeRace_8
  dw    PenguinBikeRace_9, PenguinBikeRace_10, PenguinBikeRace_11
  
  dw    PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12
  dw    PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12, PenguinBikeRace_12

  dw    PenguinBikeRace_13, PenguinBikeRace_14, PenguinBikeRace_15, PenguinBikeRace_16, PenguinBikeRace_17, PenguinBikeRace_18, PenguinBikeRace_19, PenguinBikeRace_20
  dw    PenguinBikeRace_21, PenguinBikeRace_22, PenguinBikeRace_23

  dw    PenguinBikeRace_0
  
PenguinCurvatureTableInsideOval:
  dw    PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24
  dw    PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24, PenguinBikeRace_24

  dw    PenguinBikeRace_25, PenguinBikeRace_26, PenguinBikeRace_27, PenguinBikeRace_28, PenguinBikeRace_29, PenguinBikeRace_30, PenguinBikeRace_31, PenguinBikeRace_32
  dw    PenguinBikeRace_33, PenguinBikeRace_34, PenguinBikeRace_35

  dw    PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36
  dw    PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36, PenguinBikeRace_36

  dw    PenguinBikeRace_37, PenguinBikeRace_38, PenguinBikeRace_39, PenguinBikeRace_40, PenguinBikeRace_41, PenguinBikeRace_42, PenguinBikeRace_43, PenguinBikeRace_44
  dw    PenguinBikeRace_45, PenguinBikeRace_46, PenguinBikeRace_47

  dw    PenguinBikeRace_24

;outside the oval
PenguinBikeRace_0:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_0_0
PenguinBikeRace_1:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_1_0
PenguinBikeRace_2:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_2_0
PenguinBikeRace_3:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_3_0
PenguinBikeRace_4:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_4_0
PenguinBikeRace_5:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_5_0
PenguinBikeRace_6:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_6_0
PenguinBikeRace_7:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_7_0
PenguinBikeRace_8:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_8_0
PenguinBikeRace_9:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_9_0
PenguinBikeRace_10:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_10_0
PenguinBikeRace_11:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_11_0
PenguinBikeRace_12:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_12_0
PenguinBikeRace_13:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_13_0
PenguinBikeRace_14:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_14_0
PenguinBikeRace_15:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_15_0
PenguinBikeRace_16:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_16_0
PenguinBikeRace_17:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_17_0
PenguinBikeRace_18:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_18_0
PenguinBikeRace_19:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_19_0
PenguinBikeRace_20:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_20_0
PenguinBikeRace_21:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_21_0
PenguinBikeRace_22:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_22_0
PenguinBikeRace_23:        db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_23_0
;inside the oval
PenguinBikeRace_24:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_24_0
PenguinBikeRace_25:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_47_0
PenguinBikeRace_26:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_46_0
PenguinBikeRace_27:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_45_0
PenguinBikeRace_28:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_44_0
PenguinBikeRace_29:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_43_0
PenguinBikeRace_30:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_42_0
PenguinBikeRace_31:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_41_0
PenguinBikeRace_32:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_40_0
PenguinBikeRace_33:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_39_0
PenguinBikeRace_34:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_38_0
PenguinBikeRace_35:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_37_0
PenguinBikeRace_36:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_36_0
PenguinBikeRace_37:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_35_0
PenguinBikeRace_38:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_34_0
PenguinBikeRace_39:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_33_0
PenguinBikeRace_40:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_32_0
PenguinBikeRace_41:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_31_0
PenguinBikeRace_42:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_30_0
PenguinBikeRace_43:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_29_0
PenguinBikeRace_44:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_28_0
PenguinBikeRace_45:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_27_0
PenguinBikeRace_46:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_26_0
PenguinBikeRace_47:       db    PenguinBikeRaceframelistblock, PenguinBikeRacespritedatablock | dw    PenguinBikeRace_25_0

PenguinBikeRaceGameRoutine:
  ret

SetPenguinBikeRaceSprites:
  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr+0*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

	ld		hl,PenguinBikeRaceCharSprites+0*32	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix128		;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+0*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

	ld		hl,PenguinBikeRaceColSprites+0*16	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix64	;write sprite color of pointer and hand to vram  
  ret

	PenguinBikeRaceCharSprites:
	include "..\grapx\PenguinBikeRace\assets.tgs.gen"
	PenguinBikeRaceColSprites:
	include "..\grapx\PenguinBikeRace\assets.tcs.gen"

PenguinBikeRacePalette:
  incbin "..\grapx\penguinbikerace\PenguinBikeRace.sc5",$7680+7,32






dephase
