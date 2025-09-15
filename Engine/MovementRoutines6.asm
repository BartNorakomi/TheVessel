;JumpDownGameRoutine

Phase MovementRoutinesAddress




JumpDownGameRoutine:
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever
  ld    a,0*32 + 31                         ;force page 0 on vblank
	ld    (PageOnNextVblank),a



call spritesoff


  call  ScrollBackgroundJumpDownGame
  call  BuildUpBackgroundJumpDownGame
  call  CheckBuildUpNewRowJumpDownGame
  call  .HandlePhase                        ;load graphics, init variables
  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ;load top part of arcade hall in play (just 7 lines)
  ld    hl,BlockhitPart1Address
  ld    a,BlockhitGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;clear page 1 (light blue sky), then put arcade hall sides
  ld    hl,.ClearPage1
  call  DoCopy
  ld    hl,.LeftGreenBar
  call  DoCopy
  ld    hl,.LeftDarkGreenLine
  call  DoCopy
  ld    hl,.RightGreenBar
  call  DoCopy
  ld    hl,.RightDarkGreenLine
  call  DoCopy

;set tiles in page 3
  ld    hl,JumpDownTilesPart1Address
  ld    a,JumpDownTilesGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (128*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,JumpDownTilesPart2Address
  ld    a,JumpDownTilesGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (040*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a

  call  SetArcadeMachine
  call  ResetVariablesJumpDownGame
  ld    a,1
  ld    (SetArcadeGamePalette?),a           ;action on vblank: 1=set palette, 2=set palette and write spat to vram
  call  SetInterruptHandlerJumpDownGame   	;sets Vblank and lineint for hud
;  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ret

  .ClearPage1:
	db		0,0,0,0
	db		0,0,0,1
	db		0,1,0,1
	db		0+ (0 * 16),0,$c0

  .LeftGreenBar:
	db		0,0,0,0
	db		0,0,0,1
	db		6,0,0,1
	db		13+ (13 * 16),0,$c0

  .RightGreenBar:
	db		0,0,0,0
	db		250,0,0,1
	db		6,0,0,1
	db		13+ (13 * 16),0,$c0

  .LeftDarkGreenLine:
	db		0,0,0,0
	db		5,0,0,1
	db		1,0,0,1
	db		14+ (14 * 16),0,$80

  .RightDarkGreenLine:
	db		0,0,0,0
	db		250,0,0,1
	db		1,0,0,1
	db		14+ (14 * 16),0,$80

ScrollBackgroundJumpDownGame:
  ld    a,(Scroll27LinesDown?)
  or    a
  ret   z
  dec   a
  ld    (Scroll27LinesDown?),a

  ld    a,(r23onLineIntJumpDownGame)
  inc   a
  ld    (r23onLineIntJumpDownGame),a
  ret


CheckBuildUpNewRowJumpDownGame:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	ld		a,(Controls)
	bit		4,a           ;trig a pressed ?
  ret   z

  ld    a,(Scroll27LinesDown?)
  or    a
  ret   nz

  ld    a,1
  ld    (BuildUpNewRowJumpDownGame?),a
  ld    a,27
  ld    (Scroll27LinesDown?),a
  ret

EraseRowJumpDownGameStep1:
  ld    a,(JumpDownGameTilesY)
  add   a,60 ;56
  ld    (EraseRowJumpDownGameCopy+dy),a

  ld    hl,EraseRowJumpDownGameCopy
  call  DoCopy
  ret

EraseRowJumpDownGameStep2:
  ld    a,(JumpDownGameTilesY)
  add   a,60 ;56
  ld    (EraseRowJumpDownGameCopy+dy),a

  cp    256-27
  ret   c

  xor   a
  ld    (EraseRowJumpDownGameCopy+dy),a

  ld    hl,EraseRowJumpDownGameCopy
  call  DoCopy
  ret

BuildUpBackgroundJumpDownGame:
  ld    a,(BuildUpNewRowJumpDownGame?)
  or    a
  ret   z

  inc   a
  ld    (BuildUpNewRowJumpDownGame?),a
  cp    2
  jr    z,EraseRowJumpDownGameStep1
  cp    3
  jr    z,EraseRowJumpDownGameStep2

  ld    a,(PutRemainderTile?)
  or    a
  jp    nz,.PutRemainderTile

  ld    a,(JumpDownGameTilesX)
  ld    (PutTileJumpDownGame+dx),a
  ld    a,(JumpDownGameTilesY)
  ld    (PutTileJumpDownGame+dy),a

  call  .SetTileSXSY

  ld    hl,PutTileJumpDownGame
  call  DoCopy

  ld    hl,(TileRowTablePointer)
  inc   hl                              ;next tile
  ld    (TileRowTablePointer),hl

  ld    a,(JumpDownGameTilesX)
  add   a,35
  ld    (JumpDownGameTilesX),a
  cp    215
  ret   c

  ;at the end of the row, we check if all tiles were put fully in screen. if they weren't they were clipped by the screens border, and we need to put the 'rest' in the top of the screen
  ld    a,(PutTileJumpDownGame+dy)
  add   a,55
  jr    c,.TilesDidntFitCompletely

  ;next row
  ld    a,(Row6Wide?)
  xor   1
  ld    (Row6Wide?),a

  ld    a,23
  jr    nz,.SetDX
  ld    a,40
  .SetDX:
  ld    (JumpDownGameTilesX),a

  ld    a,(JumpDownGameTilesY)
  add   a,27
  ld    (JumpDownGameTilesY),a

  xor   a
  ld    (BuildUpNewRowJumpDownGame?),a
  ret

  .TilesDidntFitCompletely:
  inc   a
  ld    (PutTileJumpDownGame+ny),a    ;amount of lines we still need to put 

  ld    a,(Row6Wide?)
  or    a

  ld    a,23
  ld    de,-6                         ;width row (amount of tiles in this row)
  jr    nz,.SetDX2
  ld    a,40
  ld    de,-5                         ;width row (amount of tiles in this row)
  .SetDX2:
  ld    (JumpDownGameTilesX),a

  ld    hl,(TileRowTablePointer)
  add   hl,de                           ;back to start of this row
  ld    (TileRowTablePointer),hl

  ld    a,1
  ld    (PutRemainderTile?),a         ;we are going to put this entire row again, but then only the remaining parts of the tiles
  ret

  .PutRemainderTile:
  ld    a,(JumpDownGameTilesX)
  ld    (PutTileJumpDownGame+dx),a
  xor   a
  ld    (PutTileJumpDownGame+dy),a

  call  .SetTileSXSY

  ld    a,(PutTileJumpDownGame+ny)
  ld    b,a
  ld    a,(PutTileJumpDownGame+sy)
  add   a,56
  sub   a,b
  ld    (PutTileJumpDownGame+sy),a

  ld    hl,PutTileJumpDownGame
  call  DoCopy  

  ld    hl,(TileRowTablePointer)
  inc   hl                              ;next tile
  ld    (TileRowTablePointer),hl

  ld    a,(JumpDownGameTilesX)
  add   a,35
  ld    (JumpDownGameTilesX),a
  cp    215
  ret   c

  ;next row
  xor   a
  ld    (PutRemainderTile?),a

  ld    a,56
  ld    (PutTileJumpDownGame+ny),a
  ld    a,56
  ld    (PutTileJumpDownGame+sy),a  

  ld    a,(Row6Wide?)
  xor   1
  ld    (Row6Wide?),a

  ld    a,23
  jr    nz,.SetDX3
  ld    a,40
  .SetDX3:
  ld    (JumpDownGameTilesX),a

  ld    a,(JumpDownGameTilesY)
  add   a,27
  ld    (JumpDownGameTilesY),a

  xor   a
  ld    (BuildUpNewRowJumpDownGame?),a
  ret

  .SetTileSXSY:
  ;get sx,sy tile
  ld    hl,(TileRowTablePointer)
  ld    a,(hl)                          ;tilenumber
  add   a,a                             ;*2
  ld    e,a
  ld    d,0
  ld    hl,TileSXSYTableJumpDownGame
  add   hl,de
  ld    a,(hl)                          ;sx
  ld    (PutTileJumpDownGame+sx),a
  inc   hl
  ld    a,(hl)                          ;sy
  ld    (PutTileJumpDownGame+sy),a
  ret

ResetVariablesJumpDownGame:
  ld    hl,JumpDownPalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  ld    a,110
  ld    (r23onLineIntJumpDownGame),a
  ld    a,23
  ld    (JumpDownGameTilesX),a
  ld    a,256-30
  ld    (JumpDownGameTilesY),a
  ld    a,1
  ld    (Row6Wide?),a
  ld    (BuildUpNewRowJumpDownGame?),a

  ld    hl,TileRowTable
  ld    (TileRowTablePointer),hl

  xor   a
  ld    (PutRemainderTile?),a
  ld    (Scroll27LinesDown?),a
  ret

JumpDownPalette:
  incbin "..\grapx\JumpDown\tiles.sc5",$7680+7,32

TileSXSYTableJumpDownGame:
  db    000,000, 036,000,  072,000,  108,000,  144,000,  180,000,  216,000
  db    000,056, 036,056,  072,056,  108,056,  144,056,  180,056,  216,056
  db    000,112, 036,112,  072,112,  108,112,  144,112,  180,112,  216,112

TileRowTable:
  db  000,000,000,000,000,000
  db    000,000,001,000,000
  db  000,000,001,001,000,000
  db    000,001,001,001,000
  db  000,001,001,001,001,000
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,000,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,000,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  002,001,001,001,000,001
  db    002,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,000
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    000,001,001,001,001
  db  000,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,000,001,001,001
  db    001,001,000,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  002,001,001,001,001,001
  db    002,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,001,001
  db  001,001,001,001,001,001






dephase
