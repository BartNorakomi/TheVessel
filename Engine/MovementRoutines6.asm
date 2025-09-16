;JumpDownGameRoutine

Phase MovementRoutinesAddress




JumpDownGameRoutine:
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever
  ld    a,0*32 + 31                         ;force page 0 on vblank
	ld    (PageOnNextVblank),a

  call  .HandlePhase                        ;load graphics, init variables
  call  CheckBunnyInLavaNothingOrIce
  call  CheckBunnyOffScreen
  call  SetBunnySpatCoordinates
  call  CheckShouldBunnyJump
halt
halt
;  call  BackdropGreen
  call  HandleBunnyJumpAndSetSpriteCharacterAndColor
  call  HandleBunnyDied
;  call  BackdropBlack
  call  ScrollBackgroundJumpDownGame
  call  BuildUpBackgroundJumpDownGame
  call  Scroll4RowsAtStartOfGame
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

SetBunnySpatCoordinates:
  ld    a,(BunnyX)
  ld    (spat+1+00*4),a
  ld    (spat+1+01*4),a
  ld    (spat+1+04*4),a
  ld    (spat+1+05*4),a
  ld    (spat+1+08*4),a
  ld    (spat+1+09*4),a
  add   a,16
  ld    (spat+1+02*4),a
  ld    (spat+1+03*4),a
  ld    (spat+1+06*4),a
  ld    (spat+1+07*4),a
  ld    (spat+1+10*4),a
  ld    (spat+1+11*4),a

  ld    a,(BunnyY)
  cp    216
  jr    nz,.EndCheck216
  inc   a
  .EndCheck216:
  cp    216-16
  jr    nz,.EndCheck200
  inc   a
  .EndCheck200:
  cp    216-16-16
  jr    nz,.EndCheck184
  inc   a
  .EndCheck184:

  ld    (spat+0+00*4),a
  ld    (spat+0+01*4),a
  ld    (spat+0+02*4),a
  ld    (spat+0+03*4),a
  add   a,16
  ld    (spat+0+04*4),a
  ld    (spat+0+05*4),a
  ld    (spat+0+06*4),a
  ld    (spat+0+07*4),a
  add   a,16
  ld    (spat+0+08*4),a
  ld    (spat+0+09*4),a
  ld    (spat+0+10*4),a
  ld    (spat+0+11*4),a
  ret

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

HandleBunnyDied:
  ld    a,(BunnyDied?)
  or    a
  ret   z

  ld    a,(BunnyFacingRight?)
  or    a
  jp    z,.Left

  .Right:
  ld    a,(BunnyDied?)
  inc   a
  ld    (BunnyDied?),a
  sub   20
	ld		hl,BunnyCharSprites+72*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+72*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   20
	ld		hl,BunnyCharSprites+84*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+84*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   20
	ld		hl,BunnyCharSprites+72*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+72*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   20
	ld		hl,BunnyCharSprites+84*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+84*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+120*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+120*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+132*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+132*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+144*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+144*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+156*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+156*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+168*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+168*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+180*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+180*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  ret


  .Left:
  ld    a,(BunnyDied?)
  inc   a
  ld    (BunnyDied?),a
  sub   20
	ld		hl,BunnyCharSprites+96*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+96*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   20
	ld		hl,BunnyCharSprites+108*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+108*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   20
	ld		hl,BunnyCharSprites+96*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+96*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   20
	ld		hl,BunnyCharSprites+108*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+108*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+120*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+120*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+132*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+132*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+144*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+144*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+156*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+156*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+168*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+168*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  sub   6
	ld		hl,BunnyCharSprites+180*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+180*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  ret

SpiderWebJump:
  ld    a,(BunnyFacingRight?)
  or    a
  jr    z,SpiderWebJumpLeft
SpiderWebJumpRight:
  ld    a,(AnimateSpiderWebJump?)
  inc   a
  ld    (AnimateSpiderWebJump?),a

  cp    13
	ld		hl,BunnyCharSprites+12*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+12*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor

  xor   a
  ld    (AnimateSpiderWebJump?),a

	ld		hl,BunnyCharSprites+0*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+0*16	;sprite 0 character table in VRAM
  jp    SetBunnyCharacterAndColor
SpiderWebJumpLeft:
  ld    a,(AnimateSpiderWebJump?)
  inc   a
  ld    (AnimateSpiderWebJump?),a

  cp    13
	ld		hl,BunnyCharSprites+48*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+48*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor

  xor   a
  ld    (AnimateSpiderWebJump?),a

	ld		hl,BunnyCharSprites+36*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+36*16	;sprite 0 character table in VRAM
  jp    SetBunnyCharacterAndColor

HandleBunnyJumpAndSetSpriteCharacterAndColor:
  ld    a,(AnimateSpiderWebJump?)
  or    a
  jp    nz,SpiderWebJump

  ld    a,(Scroll27LinesDown?)
  or    a
  ret   z

  ld    a,(JumpBunnyLeft?)
  or    a
  jp    nz,JumpBunnyLeft
  ld    a,(JumpBunnyRight?)
  or    a
  ret   z
JumpBunnyRight:
  ld    a,1
  ld    (BunnyFacingRight?),a

  ld    a,(BunnySlidingOnIce?)
  or    a
  jp    nz,SlideOnIceBunnyRight

  call  .MoveBunnyRight
  ld    a,(JumpBunnyRight?)
  inc   a
  ld    (JumpBunnyRight?),a

  cp    13
	ld		hl,BunnyCharSprites+12*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+12*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  cp    28
	ld		hl,BunnyCharSprites+24*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+24*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor

  xor   a
  ld    (JumpBunnyRight?),a

	ld		hl,BunnyCharSprites+0*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+0*16	;sprite 0 character table in VRAM
  jp    SetBunnyCharacterAndColor

  .MoveBunnyRight:
  ld    a,(JumpBunnyRight?)
  add   a,a
  ld    e,a
  ld    d,0
  ld    hl,.JumpRightTable-2
  add   hl,de                               ;x increase
  ld    a,(BunnyX)
  add   a,(hl)
  ld    (BunnyX),a
  inc   hl                                  ;y increase
  ld    a,(BunnyY)
  add   a,(hl)
  ld    (BunnyY),a
  ret

  .JumpRightTable:
  db    +1,-2,  +0,-2,  +1,-1,  +1,-1,  +0,-0,  +1,+0,  +1,+1,  +0,+0,  +1,+1,  +1,+1
  db    +0,+0,  +1,+1,  +1,+1,  +0,+1,  +1,+2,  +1,+1,  +0,+1,  +1,+2,  +1,+1,  +0,+2
  db    +1,+2,  +1,+2,  +0,+2,  +1,+3,  +1,+3,  +0,+3,  +1,+3

SlideOnIceBunnyRight:
  call  .MoveBunnyRight
  ld    a,(JumpBunnyRight?)
  inc   a
  ld    (JumpBunnyRight?),a

  cp    14
	ld		hl,BunnyCharSprites+0*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+0*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  cp    28
	ld		hl,BunnyCharSprites+24*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+24*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor

  xor   a
  ld    (JumpBunnyRight?),a
  ld    (BunnySlidingOnIce?),a

	ld		hl,BunnyCharSprites+0*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+0*16	;sprite 0 character table in VRAM
  jp    SetBunnyCharacterAndColor

  .MoveBunnyRight:
  ld    a,(JumpBunnyRight?)
  add   a,a
  ld    e,a
  ld    d,0
  ld    hl,.JumpRightTable-2
  add   hl,de                               ;x increase
  ld    a,(BunnyX)
  add   a,(hl)
  ld    (BunnyX),a
  inc   hl                                  ;y increase
  ld    a,(BunnyY)
  add   a,(hl)
  ld    (BunnyY),a
  ret

  .JumpRightTable:
  db    +1,+0,  +0,+0,  +1,+0,  +1,+0,  +0,+0,  +1,+0,  +1,+0,  +0,+0,  +1,+0,  +1,+0
  db    +0,+0,  +1,+0,  +1,+0,  +0,+1,  +1,+2,  +1,+1,  +0,+1,  +1,+1,  +1,+2,  +0,+1
  db    +1,+2,  +1,+2,  +0,+2,  +1,+3,  +1,+3,  +0,+3,  +1,+3

JumpBunnyLeft:
  xor   a
  ld    (BunnyFacingRight?),a

  ld    a,(BunnySlidingOnIce?)
  or    a
  jp    nz,SlideOnIceBunnyLeft

  call  .MoveBunnyLeft
  ld    a,(JumpBunnyLeft?)
  inc   a
  ld    (JumpBunnyLeft?),a

  cp    13
	ld		hl,BunnyCharSprites+48*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+48*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  cp    28
	ld		hl,BunnyCharSprites+60*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+60*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor

  xor   a
  ld    (JumpBunnyLeft?),a

	ld		hl,BunnyCharSprites+36*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+36*16	;sprite 0 character table in VRAM
  jp    SetBunnyCharacterAndColor

  .MoveBunnyLeft:
  ld    a,(JumpBunnyLeft?)
  add   a,a
  ld    e,a
  ld    d,0
  ld    hl,.JumpLeftTable-2
  add   hl,de                               ;x increase
  ld    a,(BunnyX)
  add   a,(hl)
  ld    (BunnyX),a
  inc   hl                                  ;y increase
  ld    a,(BunnyY)
  add   a,(hl)
  ld    (BunnyY),a
  ret

  .JumpLeftTable:
  db    -1,-2,  -0,-2,  -1,-1,  -1,-1,  -0,-0,  -1,+0,  -1,+1,  -0,+0,  -1,+1,  -1,+1
  db    -0,+0,  -1,+1,  -1,+1,  -0,+1,  -1,+2,  -1,+1,  -0,+1,  -1,+2,  -1,+1,  -0,+2
  db    -1,+2,  -1,+2,  -0,+2,  -1,+3,  -1,+3,  -0,+3,  -1,+3

SlideOnIceBunnyLeft:
  call  .MoveBunnyLeft
  ld    a,(JumpBunnyLeft?)
  inc   a
  ld    (JumpBunnyLeft?),a

  cp    14
	ld		hl,BunnyCharSprites+36*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+36*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor
  cp    28
	ld		hl,BunnyCharSprites+60*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+60*16	;sprite 0 character table in VRAM
  jp    c,SetBunnyCharacterAndColor

  xor   a
  ld    (JumpBunnyLeft?),a
  ld    (BunnySlidingOnIce?),a

	ld		hl,BunnyCharSprites+36*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+36*16	;sprite 0 character table in VRAM
  jp    SetBunnyCharacterAndColor

  .MoveBunnyLeft:
  ld    a,(JumpBunnyLeft?)
  add   a,a
  ld    e,a
  ld    d,0
  ld    hl,.JumpLeftTable-2
  add   hl,de                               ;x increase
  ld    a,(BunnyX)
  add   a,(hl)
  ld    (BunnyX),a
  inc   hl                                  ;y increase
  ld    a,(BunnyY)
  add   a,(hl)
  ld    (BunnyY),a
  ret

  .JumpLeftTable:
  db    -1,+0,  -0,+0,  -1,+0,  -1,+0,  -0,+0,  -1,+0,  -1,+0,  -0,+0,  -1,+0,  -1,+0
  db    -0,+0,  -1,+0,  -1,+0,  -0,+1,  -1,+2,  -1,+1,  -0,+1,  -1,+1,  -1,+2,  -0,+1
  db    -1,+2,  -1,+2,  -0,+2,  -1,+3,  -1,+3,  -0,+3,  -1,+3

CheckShouldBunnyJump:
  ld    a,(Scroll4RowsAtStartOfGame?)
  dec   a
  ret   nz

  ld    a,(Scroll27LinesDown?)
  or    a
  ret   nz

  ld    a,(BunnyDied?)
  or    a
  ret   nz

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
  call  GetTileBunnyStandsOn
  cp    JumpDownSpiderWebTile
  jp    z,BunnyStandsInSpiderWeb
  cp    JumpDownReverseControlsTile
  ld    b,%0000 0100
  jp    z,.EndCheckReverseControls
  ld    b,%0000 1000
  .EndCheckReverseControls:

	ld		a,(Controls)
  and   %0000 1100
  ret   z
  cp    b
  jr    z,.JumpRight

  .JumpLeft:
  call  CheckTreeWhenJumpingLeft
  ld    a,1
  ld    (JumpBunnyLeft?),a
  ld    a,1
  ld    (BuildUpNewRowJumpDownGame?),a
  ld    a,27
  ld    (Scroll27LinesDown?),a
  ret

  .JumpRight:
  call  CheckTreeWhenJumpingRight
  ld    a,1
  ld    (JumpBunnyRight?),a
  ld    a,1
  ld    (BuildUpNewRowJumpDownGame?),a
  ld    a,27
  ld    (Scroll27LinesDown?),a
  ret

BunnyStandsInSpiderWeb:
	ld		a,(NewPrContr)
  and   %0000 1100
  ret   z
  cp    %0000 1000
  jr    z,.JumpRight

  .JumpLeft:
  call  CheckTreeWhenJumpingLeft

  ld    a,(AnimateSpiderWebJump?)
  or    a
  ret   nz
  ld    a,1
  ld    (AnimateSpiderWebJump?),a
  xor   a
  ld    (BunnyFacingRight?),a

  ld    a,(SpiderWeb3TimesPressed?)
  inc   a
  ld    (SpiderWeb3TimesPressed?),a
  cp    3
  ret   nz
  xor   a
  ld    (SpiderWeb3TimesPressed?),a
  ld    (AnimateSpiderWebJump?),a

  ld    a,1
  ld    (JumpBunnyLeft?),a
  ld    a,1
  ld    (BuildUpNewRowJumpDownGame?),a
  ld    a,27
  ld    (Scroll27LinesDown?),a
  ret

  .JumpRight:
  call  CheckTreeWhenJumpingRight

  ld    a,(AnimateSpiderWebJump?)
  or    a
  ret   nz
  ld    a,1
  ld    (AnimateSpiderWebJump?),a
  ld    (BunnyFacingRight?),a

  ld    a,(SpiderWeb3TimesPressed?)
  inc   a
  ld    (SpiderWeb3TimesPressed?),a
  cp    3
  ret   nz
  xor   a
  ld    (SpiderWeb3TimesPressed?),a
  ld    (AnimateSpiderWebJump?),a

  ld    a,1
  ld    (JumpBunnyRight?),a
  ld    a,1
  ld    (BuildUpNewRowJumpDownGame?),a
  ld    a,27
  ld    (Scroll27LinesDown?),a
  ret


CheckTreeWhenJumpingLeft:
  ld    a,(BunnyX)
  cp    4+18
  ret   z                                   ;don't check if we are on the outer left tile

  call  GetTileBunnyStandsOn
  ld    de,5
  add   hl,de
  ld    a,(hl)

  cp    JumpDownTreeTile
  ret   c
  cp    JumpDownTreeTile+3
  ret   nc
  pop   af
  ret

CheckTreeWhenJumpingRight:
  ld    a,(BunnyX)
  cp    220-18
  ret   z                                   ;don't check if we are on the outer left tile

  call  GetTileBunnyStandsOn
  ld    de,6
  add   hl,de
  ld    a,(hl)

  cp    JumpDownTreeTile
  ret   c
  cp    JumpDownTreeTile+3
  ret   nc
  pop   af
  ret

Scroll4RowsAtStartOfGame:
  ld    a,(Scroll27LinesDown?)
  or    a
  ret   nz

  ld    a,(Scroll4RowsAtStartOfGame?)
  dec   a
  ret   z
  ld    (Scroll4RowsAtStartOfGame?),a
  cp    7
  ret   nc

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
  add   a,36
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

  ld    a,22-2
  jr    nz,.SetDX
  ld    a,40-2
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

  ld    a,22-2
  ld    de,-6                         ;width row (amount of tiles in this row)
  jr    nz,.SetDX2
  ld    a,40-2
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
  add   a,36
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

  ld    a,22-2
  jr    nz,.SetDX3
  ld    a,40-2
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

  ld    a,110-27-27
  ld    (r23onLineIntJumpDownGame),a
  ld    a,20
  ld    (JumpDownGameTilesX),a
  ld    a,218-2
  ld    (JumpDownGameTilesY),a
  ld    a,1
  ld    (Row6Wide?),a
  ld    (BuildUpNewRowJumpDownGame?),a

  ld    hl,TileRowTable
  ld    (TileRowTablePointer),hl

  xor   a
  ld    (PutRemainderTile?),a
  ld    (Scroll27LinesDown?),a
  ld    (JumpBunnyLeft?),a
  ld    (JumpBunnyRight?),a
  ld    (BunnyDied?),a
  ld    (BunnySlidingOnIce?),a
  ld    (SpiderWeb3TimesPressed?),a
  ld    (AnimateSpiderWebJump?),a

  ld    a,112
  ld    (BunnyX),a
  ld    a,230+2
  ld    (BunnyY),a

  ld    a,18
  ld    (Scroll4RowsAtStartOfGame?),a

  call  SetJumpDownGameSprites
  ret

SetJumpDownGameSprites:
  ;clear all sprite characters
	xor		a				;page 0/1
	ld		hl,sprcharaddr+0*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ld    c,4
  ld    b,0
  .loop:
  xor   a
  out   ($98),a
  djnz  .loop
  dec   c
  jp    nz,.loop

	ld		hl,BunnyCharSprites+0*32	;sprite 0 character table in VRAM
	ld		de,BunnyColSprites+0*16	;sprite 0 character table in VRAM
  call  SetBunnyCharacterAndColor
  ret

SetBunnyCharacterAndColor:
  push  de
  push  hl
  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr+0*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

  pop   hl
	ld		c,$98
	call	outix384		;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+0*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

  pop   hl
	ld		c,$98
	call	outix192		;write sprite color of pointer and hand to vram
  ret

	BunnyCharSprites:
	include "..\grapx\JumpDown\sprites\Bunny.tgs.gen"
	BunnyColSprites:
	include "..\grapx\JumpDown\sprites\Bunny.tcs.gen"

JumpDownPalette:
  incbin "..\grapx\JumpDown\tiles.sc5",$7680+7,32

CheckBunnyOffScreen:
  ld    a,(BunnyX)
  cp    4
  jp    z,BunnyDied
  cp    220
  jp    z,BunnyDied
  ret

BunnyDied:
  ld    a,(BunnyDied?)
  or    a
  ret   nz
  ld    a,1
  ld    (BunnyDied?),a
  ret


CheckBunnyInLavaNothingOrIce:
  call  GetTileBunnyStandsOn
  cp    JumpDownLavaTile
  jp    z,BunnyDied
  cp    JumpDownNothingTile
  jp    z,BunnyDied
  cp    JumpDownIceTile
  jr    z,.JumpedOnIce
  ret

  .JumpedOnIce:
  ld    a,(BunnyFacingRight?)
  or    a
  jr    nz,.JumpRight

  .JumpLeft:
  call  CheckTreeWhenJumpingLeft
  ld    a,1
  ld    (JumpBunnyLeft?),a
  ld    (BunnySlidingOnIce?),a
  ld    a,1
  ld    (BuildUpNewRowJumpDownGame?),a
  ld    a,27
  ld    (Scroll27LinesDown?),a
  ret

  .JumpRight:
  call  CheckTreeWhenJumpingRight
  ld    a,1
  ld    (JumpBunnyRight?),a
  ld    (BunnySlidingOnIce?),a
  ld    a,1
  ld    (BuildUpNewRowJumpDownGame?),a
  ld    a,27
  ld    (Scroll27LinesDown?),a
  ret
  ret

JumpDownTreeTile: equ 2
JumpDownLavaTile: equ 5
JumpDownNothingTile: equ 0
JumpDownIceTile: equ 8
JumpDownReverseControlsTile: equ 9
JumpDownSpiderWebTile: equ 7

GetTileBunnyStandsOn:
  ld    a,(Scroll4RowsAtStartOfGame?)
  dec   a
  ld    a,1
  ret   nz

  ld    a,(Scroll4RowsAtStartOfGame?)
  dec   a
  ld    a,1
  ret   nz

  ld    a,(BuildUpNewRowJumpDownGame?)
  or    a
  ld    a,1
  ret   nz

  ld    hl,(TileRowTablePointer)

  ld    a,(Row6Wide?)
  or    a
  ld    de,27                                ;4 rows above the last row put in play
  jr    nz,.WidthFound
  ld    de,28                                ;4 rows above the last row put in play
  .WidthFound:

  xor    a
  sbc   hl,de                                 ;we are now on the row the bunny is sitting

  ld    a,(BunnyX)

  ;this row is 5 tiles wide
  ld    e,0                                   ;first tile of this row
  cp    112-36-36
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    112-36
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    112
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    112+36
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    112+36+36
  jr    z,.TileFound

  ;this row is 6 tiles wide
  ld    e,0                                   ;first tile of this row
  cp    94-36-36
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    94-36
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    94
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    94+36
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    94+36+36
  jr    z,.TileFound

  inc   e                                     ;next tile
  cp    94+36+36+36
  jr    z,.TileFound

  ld    a,1                                   ;if no tile is found, bunny is still jumping, just take tile=1, this is normal tile
  ret

  .TileFound:
  add   hl,de
  ld    a,(hl)
  ret

TileSXSYTableJumpDownGame:
  db    000,000, 036,000,  072,000,  108,000,  144,000,  180,000,  216,000
  db    000,056, 036,056,  072,056,  108,056,  144,056,  180,056,  216,056
  db    000,112, 036,112,  072,112,  108,112,  144,112,  180,112,  216,112

TileRowTable:
  db  000,000,000,000,000,000
  db    000,000,001,000,000
  db  000,000,007,007,000,000
  db    000,007,007,007,000
  db  000,007,001,008,003,000
  db    001,007,001,003,001
  db  001,008,008,007,001,001
  db    002,001,008,001,001
  db  001,002,008,008,005,001
  db    001,004,008,002,001
  db  001,000,001,008,001,001
  db    001,002,001,001,001
  db  001,001,001,001,001,001
  db    001,001,001,008,001
  db  002,001,001,008,001,001
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
