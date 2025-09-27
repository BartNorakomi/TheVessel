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

  call  .HandlePhase
  call  PopulateControls

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
  jp    z,TreadMillGamePhase6               ;build up game
  dec   a
  jp    z,TreadMillGamePhase7               ;fade in screen (in game)
  dec   a
  jp    z,TreadMillGamePhase8               ;reset variables, load coverup and key sprites, sprites on, clear spat, set orcy starting pos
  dec   a
  jp    z,TreadMillGamePhase9               ;move orcy
  ret

TreadMillGamePhase9:
  call  AnimatePlayerRunningOnTreadmill
  call  SetOrcyInSpat
  call  HandleTeleportThroughEdgesMap
  call  BackdropGreen
  call  HandleOrcyPhase
  call  BackdropBlack
  pop   af                                  ;add this pop if we want the normal/sf2 engine to stay active
  ret

AnimatePlayerRunningOnTreadmill:
  ld    hl,LrunningOnTreadMill
  ld    (PlayerSpriteStand),hl

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
  and   %0000 1100
  jr    z,.EndRunning
  cp    %0000 1100
  jr    z,.EndRunning

  ld    a,(PlayerRunningOnTreadmillSpeed)
  inc   a
  cp    140
  jp    z,.EndCheckMaximumSpeedReached
  ld    (PlayerRunningOnTreadmillSpeed),a
  .EndCheckMaximumSpeedReached:

  .AnimateRunning:
  ld    a,(PlayerRunningOnTreadmillSpeed)
  ld    b,a

  ld    a,(TreadMillRunAnimationCounter)
  sub   a,b
  ld    (TreadMillRunAnimationCounter),a
  ret   nc
  ld    a,180
  ld    (TreadMillRunAnimationCounter),a

  ld    hl,TheVesselleftrunning_0           ;starting pose
  ld    b,11                                ;animation steps
  push  iy
  ld    iy,Object1
  call  .AnimateObject                      ;in hl=starting pose, b=animation steps, uses: var1
  pop   iy
  ret
  .EndRunning:
  ld    a,(PlayerRunningOnTreadmillSpeed)
  dec   a
  cp    20
  jp    c,.StandStill
  ld    (PlayerRunningOnTreadmillSpeed),a
  jr    .AnimateRunning
  .StandStill:
  push  iy
  ld    iy,Object1
  ld    hl,TheVesselleftidle_0
  ld    (iy+7),l
  ld    (iy+8),h
  pop   iy
  ret

  .AnimateObject:                              ;in hl=starting pose, b=animation steps, uses: var1
	ld		a,(iy+var1)
  inc   a
  cp    b                                   ;animation steps
  jr    nz,.endchecklastframe
  xor   a
  .endchecklastframe:
	ld		(iy+var1),a
  add   a,a                                 ;*2
  add   a,a                                 ;*4 ;each spritepose has 4 bytes
  ld    e,a
  ld    d,0
  add   hl,de
  ld    (iy+7),l
  ld    (iy+8),h
  ret

HandleTeleportThroughEdgesMap:
  ld    a,(OrcyX)
  cp    $1f
  jr    c,.ExitLeft
  cp    $b9+1+4
  jr    nc,.ExitRight

  ld    a,(OrcyVerticalMovementSpeed)
  or    a
  jp    p,.EndCheckJumpingUp  
  ld    a,(OrcyY)
  cp    $fa
  jr    z,.ExitTop    
  .EndCheckJumpingUp:

  ld    a,(OrcyY)
  cp    $80
  ret   c
  cp    $80+5
  jr    c,.ExitBottom
  ret

  .ExitTop:
  ld    a,$81
  ld    (OrcyY),a
  ret

  .ExitBottom:
  ld    a,-16
  ld    (OrcyY),a
  ret

  .ExitRight:
  ld    a,$1f
  ld    (OrcyX),a
  ret

  .ExitLeft:
  ld    a,$b9+4
  ld    (OrcyX),a
  ret

HandleOrcyPhase:
  ld    a,(OrcyPhase)                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  dec   a
  jp    z,OrcyStandingRight
  dec   a
  jp    z,OrcyStandingLeft
  dec   a
  jp    z,OrcyRunningRight
  dec   a
  jp    z,OrcyRunningLeft
  dec   a
  jp    z,OrcyJumpingRight
  dec   a
  jp    z,OrcyJumpingLeft
  ret

OrcyStandingRight:
  ld    ix,OrcyRunningRightAnimationTable.RightStanding
  call  SetOrcySprite
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  bit   0,a
  jp    nz,SetOrcyJumpingRight
	ld		a,(Controls)
  and   %0000 1100
  ret   z
  cp    %0000 1100
  ret   z
  cp    %0000 1000
  jp    z,SetOrcyRunningRight  
  jp    SetOrcyRunningLeft  

OrcyStandingLeft:
  ld    ix,OrcyRunningLeftAnimationTable.LeftStanding
  call  SetOrcySprite
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  bit   0,a
  jp    nz,SetOrcyJumpingLeft
	ld		a,(Controls)
  and   %0000 1100
  ret   z
  cp    %0000 1100
  ret   z
  cp    %0000 1000
  jp    z,SetOrcyRunningRight  
  jp    SetOrcyRunningLeft  

OrcyRunningRight:
  call  AnimateOrcyRunningRight
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  bit   0,a
  jp    nz,SetOrcyJumpingRight
	ld		a,(Controls)
  and   %0000 1100
  jp    z,SetOrcyStandingRight
  cp    %0000 1100
  jp    z,SetOrcyStandingRight
  cp    %0000 0100
  jp    z,SetOrcyRunningLeft
  call  MoveOrcyRightAndCheckCollision

  ;check orcy falls off platform
  ld    b,LeftOffsetOrcy+3
  ld    c,19
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  ret   nz
  ld    b,RightOffsetOrcy-3
  ld    c,19
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  jp    z,SetOrcyFallingRight
  ret

MoveOrcyRightAndCheckCollision:
  ld    a,(OrcyX)
  inc   a
  ld    (OrcyX),a

  ld    a,(OrcyY)
  cp    200
  ret   nc

  ld    b,RightOffsetOrcy
  ld    c,017
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  jr    nz,.Collision
  ld    b,RightOffsetOrcy
  ld    c,09
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  ret   z
  .Collision:
  ld    a,(OrcyX)
  and   %1111 1000
  inc   a
  ld    (OrcyX),a
  ret

OrcyRunningRightAnimationTable:
  dw  OrcyCharSprites+00*64, OrcyColSprites+00*32
  dw  OrcyCharSprites+01*64, OrcyColSprites+01*32
  dw  OrcyCharSprites+02*64, OrcyColSprites+02*32
  dw  OrcyCharSprites+03*64, OrcyColSprites+03*32
  dw  OrcyCharSprites+04*64, OrcyColSprites+04*32
  dw  OrcyCharSprites+05*64, OrcyColSprites+05*32
  dw  OrcyCharSprites+06*64, OrcyColSprites+06*32
  .RightStanding:
  dw  OrcyCharSprites+07*64, OrcyColSprites+07*32

AnimateOrcyRunningRight:
  ld    a,(framecounter2)
  and   3
  ret   nz

  ld    a,(OrcyAnimationStep)
  inc   a
  ld    (OrcyAnimationStep),a
  and   7
  add   a,a                               ;*2  
  add   a,a                               ;*4
  ld    e,a
  ld    d,0
  ld    ix,OrcyRunningRightAnimationTable
  add   ix,de
  jp    SetOrcySprite

OrcyRunningLeft:
  call  AnimateOrcyRunningLeft
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  bit   0,a
  jp    nz,SetOrcyJumpingLeft
	ld		a,(Controls)
  and   %0000 1100
  jp    z,SetOrcyStandingLeft
  cp    %0000 1100
  jp    z,SetOrcyStandingLeft
  cp    %0000 1000
  jp    z,SetOrcyRunningRight
  call  MoveOrcyLeftAndCheckCollision

  ;check orcy falls off platform
  ld    b,LeftOffsetOrcy+3
  ld    c,19
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  ret   nz
  ld    b,RightOffsetOrcy-3
  ld    c,19
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  jp    z,SetOrcyFallingLeft
  ret

MoveOrcyLeftAndCheckCollision:
  ld    a,(OrcyX)
  dec   a
  ld    (OrcyX),a

  ld    a,(OrcyY)
  cp    200
  ret   nc

  ld    b,LeftOffsetOrcy
  ld    c,017
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  jr    nz,.Collision
  ld    b,LeftOffsetOrcy
  ld    c,09
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  ret   z
  .Collision:
  ld    a,(OrcyX)
  and   %1111 1000
  add   a,7
  ld    (OrcyX),a
  ret

OrcyRunningLeftAnimationTable:
  dw  OrcyCharSprites+15*64, OrcyColSprites+15*32
  dw  OrcyCharSprites+14*64, OrcyColSprites+14*32
  dw  OrcyCharSprites+13*64, OrcyColSprites+13*32
  dw  OrcyCharSprites+12*64, OrcyColSprites+12*32
  dw  OrcyCharSprites+11*64, OrcyColSprites+11*32
  dw  OrcyCharSprites+10*64, OrcyColSprites+10*32
  dw  OrcyCharSprites+09*64, OrcyColSprites+09*32
  .LeftStanding:
  dw  OrcyCharSprites+08*64, OrcyColSprites+08*32

AnimateOrcyRunningLeft:
  ld    a,(framecounter2)
  and   3
  ret   nz

  ld    a,(OrcyAnimationStep)
  inc   a
  ld    (OrcyAnimationStep),a
  and   7
  add   a,a                               ;*2  
  add   a,a                               ;*4
  ld    e,a
  ld    d,0
  ld    ix,OrcyRunningLeftAnimationTable
  add   ix,de
  jp    SetOrcySprite

OrcyJumpingRight:
  call  AnimateOrcyJumpingRight
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
  and   %0000 1100
  jr    z,.EndCheckMoveHorizontally
  cp    %0000 1100
  jp    z,.EndCheckMoveHorizontally
  cp    %0000 1000
  jr    z,.Right
  .Left:
  ld    a,6
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  xor   a
  ld    (OrcyFacingRight?),a
  jp    .EndCheckMoveHorizontally    
  .Right:
  call  MoveOrcyRightAndCheckCollision
  .EndCheckMoveHorizontally:

  call  ApplyGravityOrcy
  call  MoveOrcyVertically

  ld    a,(OrcyVerticalMovementSpeed)
  or    a
  jp    p,CheckCollisionWhileFallingDown
  jp    CheckCollisionWhileJumpingUp

CheckCollisionWhileFallingDown:
  ld    a,(OrcyY)
  cp    200
  ret   nc

  ld    b,LeftOffsetOrcy+3
  ld    c,19
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  jr    nz,.Collision
  ld    b,RightOffsetOrcy-3
  ld    c,19
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  ret   z
  .Collision:
  ld    a,(OrcyY)
  sub   3
  and   %1111 1000                        ;snap to tile
  add   a,6
  ld    (OrcyY),a

  ld    a,(OrcyFacingRight?)
  or    a
  jp    nz,SetOrcyStandingRight
  jp    SetOrcyStandingLeft

LeftOffsetOrcy:   equ 01
RightOffsetOrcy:  equ 14
CheckCollisionWhileJumpingUp:
  ld    b,LeftOffsetOrcy+3
  ld    c,+6
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  jr    nz,.Collision
  ld    b,RightOffsetOrcy-3
  ld    c,+6
  call  CheckTileCollisionOrcy            ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  ret   z
  .Collision:
  ld    a,(OrcyVerticalMovementSpeed)
  ld    b,a  
  ld    a,(OrcyY)
  sub   a,b
  ld    (OrcyY),a
  ret

AnimateOrcyJumpingRight:
  ld    ix,OrcyRunningRightAnimationTable
  jp    SetOrcySprite

OrcyJumpingLeft:
  call  AnimateOrcyJumpingLeft
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
  and   %0000 1100
  jr    z,.EndCheckMoveHorizontally
  cp    %0000 1100
  jp    z,.EndCheckMoveHorizontally
  cp    %0000 1000
  jr    z,.Right
  .Left:
  call  MoveOrcyLeftAndCheckCollision
  jp    .EndCheckMoveHorizontally    
  .Right:
  ld    a,5
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  ld    a,1
  ld    (OrcyFacingRight?),a
  .EndCheckMoveHorizontally:

  call  ApplyGravityOrcy
  call  MoveOrcyVertically

  ld    a,(OrcyVerticalMovementSpeed)
  or    a
  jp    p,CheckCollisionWhileFallingDown
  jp    CheckCollisionWhileJumpingUp

AnimateOrcyJumpingLeft:
  ld    ix,OrcyRunningLeftAnimationTable
  jp    SetOrcySprite

ApplyGravityOrcy:
  ld    a,(OrcyAnimationStep)
  inc   a
  ld    (OrcyAnimationStep),a
  cp    3
  ret   nz
  xor   a
  ld    (OrcyAnimationStep),a

  ld    a,(OrcyVerticalMovementSpeed)
  inc   a
  cp    5
  ret   z
  ld    (OrcyVerticalMovementSpeed),a
  ret

MoveOrcyVertically:
  ld    a,(OrcyVerticalMovementSpeed)
  ld    b,a  
  ld    a,(OrcyY)
  add   a,b
  ld    (OrcyY),a
  ret

SetOrcyStandingRight:
  ld    a,1
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  ld    (OrcyFacingRight?),a
  xor   a
  ld    (OrcyAnimationStep),a
  ret

SetOrcyStandingLeft:
  ld    a,2
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  xor   a
  ld    (OrcyFacingRight?),a
  ld    (OrcyAnimationStep),a
  ret

SetOrcyRunningRight:
  ld    a,3
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  ld    a,1
  ld    (OrcyFacingRight?),a
  xor   a
  ld    (OrcyAnimationStep),a
  ret

SetOrcyRunningLeft:
  ld    a,4
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  xor   a
  ld    (OrcyFacingRight?),a
  ld    (OrcyAnimationStep),a
  ret

SetOrcyJumpingRight:
  ld    a,5
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  ld    a,1
  ld    (OrcyFacingRight?),a
  ld    a,2
  ld    (OrcyAnimationStep),a
  ld    a,-5
  ld    (OrcyVerticalMovementSpeed),a
  ret

SetOrcyJumpingLeft:
  ld    a,6
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  xor   a
  ld    (OrcyFacingRight?),a
  ld    a,2
  ld    (OrcyAnimationStep),a
  ld    a,-5
  ld    (OrcyVerticalMovementSpeed),a
  ret

SetOrcyFallingRight:
  ld    a,5
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  ld    a,1
  ld    (OrcyFacingRight?),a
  xor   a
  ld    (OrcyAnimationStep),a
  ld    a,1
  ld    (OrcyVerticalMovementSpeed),a
  ret

SetOrcyFallingLeft:
  ld    a,6
  ld    (OrcyPhase),a                       ;1=standing right, 2=standing left, 3=running right, 4=running left, 5=jumping right, 6=jumping left
  xor   a
  ld    (OrcyFacingRight?),a
  ld    (OrcyAnimationStep),a
  ld    a,1
  ld    (OrcyVerticalMovementSpeed),a
  ret

SetOrcySprite:
	xor		a				;page 0/1
	ld		hl,sprcharaddr+30*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ld    l,(ix+0)
  ld    h,(ix+1)
	ld		c,$98
	call	outix64		;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+30*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ld    l,(ix+2)
  ld    h,(ix+3)
	ld		c,$98
	call	outix32	;write sprite color of pointer and hand to vram
  ret

	OrcyCharSprites:
	include "..\grapx\ship\trainingdeck\sprites\Orcy.tgs.gen"
	OrcyColSprites:
	include "..\grapx\ship\trainingdeck\sprites\Orcy.tcs.gen"

OrcyYSpat:  equ spat+0+30*4
OrcyXSpat:  equ spat+1+30*4
SetOrcyInSpat:
  ld    a,(OrcyX)
  ld    (OrcyXSpat),a
  ld    (OrcyXSpat+4),a
  ld    a,(OrcyY)
  ld    (OrcyYSpat),a
  ld    (OrcyYSpat+4),a
  ret

CheckTileCollisionOrcy:                     ;in: b=x offset in pixels, c=y offset in pixels, out: z=no collision
  ;map starts at (24,-2), but for ease of use, just say (24,0) 
  ;map size is 23x19 tiles
  ;take OrcyY / 8 * 24
  ld    a,(OrcyY)
  add   a,c                                 ;c= y offset in pixels
  srl   a                                   ;/2
  srl   a                                   ;/4
  srl   a                                   ;/8
  ld    l,a
  ld    h,0
  add   hl,hl                               ;*2
  add   hl,hl                               ;*4
  add   hl,hl                               ;*8
  push  hl
  pop   de
  add   hl,hl                               ;*16
  add   hl,de                               ;*24

  ld    de,$8000                            ;map address in ram
  add   hl,de                               ;row address

  ld    a,(OrcyX)
  sub   a,24
  add   a,b                                 ;b= x offset in pixels
  srl   a                                   ;/2
  srl   a                                   ;/4
  srl   a                                   ;/8
  ld    e,a
  ld    d,0
  add   hl,de                               ;add x in tiles to map

  ld    a,(slot.page1rom)            	;all RAM except page 1
  out   ($a8),a

  ld    a,(hl)
  or    a
  ret

TreadMillGamePhase8:
  ld    a,213
  ld    hl,spat
  ld    de,4
  ld    b,32
  .loop:
  ld    (hl),a
  add   hl,de
  djnz  .loop
  call  WriteSpatToVram

  call  SpritesOn

  ld    a,050                               ;x orcy
  ld    (OrcyX),a
  ld    a,120                               ;y orcy
  ld    (OrcyY),a

  ld    a,$89                               ;x orcy
  ld    (OrcyX),a
  ld    a,$7e                               ;y orcy
  ld    (OrcyY),a

  ld    a,1
  ld    (PlayerRunningOnTreadmillSpeed),a

  call  SetOrcyStandingRight
  call  SetCoverupSprites

  ld    a,9
  ld    (TreadMillGameStep),a
  ret

SetCoverupSprites:
	xor		a				;page 0/1
	ld		hl,sprcharaddr+0*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ld    hl,CoverupCharSprites
	ld		c,$98
	call	outix192		;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+0*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ld    hl,CoverupColSprites
	ld		c,$98
	call	outix96	;write sprite color of pointer and hand to vram

  ld    a,60-29                        ;x coverup sprite
  ld    (spat+1+0*4),a
  ld    (spat+1+1*4),a
  ld    (spat+1+2*4),a
  ld    (spat+1+3*4),a
  ld    (spat+1+4*4),a
  ld    (spat+1+5*4),a
  ld    a,20-30                        ;y coverup sprite
  ld    (spat+0+0*4),a
  ld    (spat+0+1*4),a
  ld    (spat+0+2*4),a
  add   a,16  
  ld    (spat+0+3*4),a
  ld    (spat+0+4*4),a
  ld    (spat+0+5*4),a  
  ret

	CoverupCharSprites:
	include "..\grapx\ship\trainingdeck\sprites\CoverupSprites.tgs.gen"
	CoverupColSprites:
	include "..\grapx\ship\trainingdeck\sprites\CoverupSprites.tcs.gen"

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

TreadMillGamePhase6:                        ;build up game
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

  call  SetTraininDeckGameMapAt8000InRam

  ld    hl,.CopyFrameAndGameToPage2
  call  DoCopy
  ld    hl,.CopyFrameAndGameToPage3
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

  .CopyFrameAndGameToPage2:
	db		024,000,000,001
	db		024,000,000,002
	db		184,000,150,000
	db		000,000,$d0

  .CopyFrameAndGameToPage3:
	db		024,000,000,001
	db		024,000,000,003
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
  ld    b,24                                ;24 tiles per row
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








  ld    a,6
  ld    (TreadMillGameStep),a

  ld    hl,TreadMillGameBackgroundGamePalette
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
  ld    a,(TreadMillGameStep)
  or    a
  jp    nz,InitiateTreadMillGame

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
  ret

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
  jr    nc,.GoStepOnTreadMill
  
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
