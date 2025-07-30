;UpgradeMenuEventRoutine
;DrillingLocationsRoutine
;RacingGameRoutine

Phase MovementRoutinesAddress





;IDEA maak een slalom parcours
;IDEA laat gaten in de road verschijnen waar visjes uitspringen
;1 minder animatiestap links en rechts op top speed (bij lage snelheid kan dat ook. Dus je kunt de rotaties houden, maar de scope moet kleiner naarmate je sneller rijdt)
;snelheid van de weg mag wel hoger
;groentinten omgedraaid bij het graspalette
;Mss iets qua banden wat enige beweging suggereert.

;heuvels mogen dieper/hoger
;aan de horizon, zou ik qua gfx experimenteren met een raster.
;horizon verticaal meescrollen in de up/down curves
;maak een zooi palettes die subtielere verschillen tonen (vooral met blauwtinten)
;wat als je die stroken minder breed maakt. Alsof je op zo'n grote brug rijdt met links/rechts nog een paar meter gras, maar daarna niks meer. In wat je dan weglaat kun je neem ik aan gewoon een achtergrond hebben van iets.





RacingGamePlayerY:  equ 161                 ;y never changes ?
RacingGameRoutine:
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever (so we always stay on page 2 for the game, and page 0 for the hud)

  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  call  .HandlePhase                        ;used to build up screen and initiate variables
  call  .SetPlayerSprite
  call  .SetEnemySprite
  call  .SetHorMoveSpeedAndAnimatePlayerSprite
  call  .MovePlayerHorizontally
  call  .HandleAccelerateAndDecelerate      ;speed up with trig A, brake with trig B
  call  .UpdateDistance
  call  .UpdateRoadLinesAnimation
  call  .ChangeLineIntHeightWhenCurvingUpOrDown
;  call  HandleCurvatureRoad
  call  ChangePaletteRacingGame
  call  .UpdateMaximumSpeedOnCurveOrDown
  call  ForceMovePlayerAgainstCurves
  ret

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  ret   nz
  ld    (iy+ObjectPhase),1

;  ld    a,32
;  ld    (r23onVblank),a

;  ld    a,1
;  ld    (SetLineIntHeightOnVblankDrillingGame?),a
  call  SetInterruptHandlerRacingGame

  ;set y coordinates player sprite
  ld    a,RacingGamePlayerY
  ld    (spat+0+(00*4)),a                 ;y sprite 0
  ld    (spat+0+(01*4)),a                 ;y sprite 1
  add   a,16
  ld    (spat+0+(02*4)),a                 ;y sprite 2
  ld    (spat+0+(03*4)),a                 ;y sprite 3
  ld    (spat+0+(04*4)),a                 ;y sprite 4
  ld    (spat+0+(05*4)),a                 ;y sprite 5
  add   a,16
  ld    (spat+0+(06*4)),a                 ;y sprite 6
  ld    (spat+0+(07*4)),a                 ;y sprite 7
  ld    (spat+0+(08*4)),a                 ;y sprite 8
  ld    (spat+0+(09*4)),a                 ;y sprite 9

  ld    a,21                              
  ld    (RacingGameHorMoveSpeed),a        ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  ld    hl,112*10
  ld    (RacingGameHorScreenPosition),hl  ;HorScreenPosition / 10 = Player X
  ld    hl,0
  ld    (RacingGameDistance),hl
  ld    (RacingGameDistance+2),hl

  ld    hl,0                            ;speed in m/p/h


ld    hl,150                            ;speed in m/p/h


  ld    (RacingGameSpeed),hl
  ld    hl,200
  ld    (MaximumSpeedRacingGame),hl

  ld    a,112
  ld    (RacingGamePlayerX),a
  xor   a
  ld    (RoadCurveAmountPixelsTraversed),a

  ld    hl,228 
  ld    (RacingGameEnemyX),hl
  ld    a,RacingGamePlayerY
  ld    (RacingGameEnemyY),a

  ld    hl,9370
  ld    (RacingGameEnemy1DistanceFromPlayer),hl
  ret

  .UpdateMaximumSpeedOnCurveOrDown:
  ld    a,200
  ld    (MaximumSpeedRacingGame),a
  ld    a,(CurrentCurve)                ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  cp    2
  jr    z,.UpdateMaxSpeedCurveDown
  cp    4
  jr    z,.UpdateMaxSpeedCurveUp
  cp    6
  jr    z,.UpdateMaxSpeedCurveDownEnd
  cp    8
  jr    z,.UpdateMaxSpeedCurveUpEnd
  ret

  .UpdateMaxSpeedCurveDown:
  ld    a,250
  ld    (MaximumSpeedRacingGame),a
  ret

  .UpdateMaxSpeedCurveDownEnd:
  ld    a,250
  ld    (MaximumSpeedRacingGame),a
  ret

  .UpdateMaxSpeedCurveUp:
  ld    a,150
  ld    (MaximumSpeedRacingGame),a
  ret

  .UpdateMaxSpeedCurveUpEnd:
  ld    a,150
  ld    (MaximumSpeedRacingGame),a
  ret

  .HandleAccelerateAndDecelerate:
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
  and   %0010 0010                      ;check if trig b or down is pressed (brake)
  jr    nz,.Brake
	ld		a,(Controls)
  and   %0001 0001                      ;check if trig a or space is pressed (gas)
  jr    nz,.Gas

  .SlowDown:
  ld    hl,(RacingGameSpeed)
  dec   hl
  bit   7,h
  ret   nz
  ld    (RacingGameSpeed),hl
  ret

  .Gas:
  ld    hl,(RacingGameSpeed)
  inc   hl
  ld    (RacingGameSpeed),hl
  ld    de,(MaximumSpeedRacingGame)
  sbc   hl,de
  ret   c
  ld    hl,(MaximumSpeedRacingGame)
  ld    (RacingGameSpeed),hl
  ret

  .Brake:
  ld    hl,(RacingGameSpeed)
  ld    de,2
  sbc   hl,de
  ld    (RacingGameSpeed),hl
  bit   7,h
  ret   z
  ld    hl,0
  ld    (RacingGameSpeed),hl
  ret

  .ChangeLineIntHeightWhenCurvingUpOrDown:
  ld    a,(AnimateRoad?)                            ;2=up, 3=end up, 4=down, 5=end down
  cp    2
  jr    z,.CurveUp
  cp    3
  jr    z,.EndCurveUp
  cp    4
  jr    z,.CurveDown
  cp    5
  jr    z,.EndCurveDown
  ret

  .EndCurveDown:
  ld    a,(RoadCurvatureAnimationStep)
  srl   a                                 ;/2
  ld    e,a
  ld    d,0
  ld    hl,.CurveDownLineIntHeightTableEnd-1
  xor   a
  sbc   hl,de
  ld    a,(hl)
  ld    (RacingGameNewLineIntToBeSetOnVblank),a                 ;113 is the standard, 083 is perfect for the road all the way curved up
  ret

  .CurveDown:
  ld    a,(RoadCurvatureAnimationStep)
  srl   a                                 ;/2
  ld    e,a
  ld    d,0
  ld    hl,.CurveDownLineIntHeightTable
  add   hl,de
  ld    a,(hl)
  ld    (RacingGameNewLineIntToBeSetOnVblank),a                 ;113 is the standard, 083 is perfect for the road all the way curved up
  ret

  .EndCurveUp:
  ld    a,(RoadCurvatureAnimationStep)
  srl   a                                 ;/2
  ld    e,a
  ld    d,0
  ld    hl,.CurveUpLineIntHeightTableEnd-1
  xor   a
  sbc   hl,de
  ld    a,(hl)
  ld    (RacingGameNewLineIntToBeSetOnVblank),a                 ;113 is the standard, 083 is perfect for the road all the way curved up
  ret

  .CurveUp:
  ld    a,(RoadCurvatureAnimationStep)
  srl   a                                 ;/2
  ld    e,a
  ld    d,0
  ld    hl,.CurveUpLineIntHeightTable
  add   hl,de
  ld    a,(hl)
  ld    (RacingGameNewLineIntToBeSetOnVblank),a                 ;113 is the standard, 083 is perfect for the road all the way curved up
  ret

  .CurveUpLineIntHeightTable:
db    LineIntHeightStraightRoad-0
db    LineIntHeightStraightRoad-1
db    LineIntHeightStraightRoad-1
db    LineIntHeightStraightRoad-2
db    LineIntHeightStraightRoad-3
db    LineIntHeightStraightRoad-3
db    LineIntHeightStraightRoad-4
db    LineIntHeightStraightRoad-5
db    LineIntHeightStraightRoad-5
db    LineIntHeightStraightRoad-6
db    LineIntHeightStraightRoad-7
db    LineIntHeightStraightRoad-7
db    LineIntHeightStraightRoad-8
db    LineIntHeightStraightRoad-9
db    LineIntHeightStraightRoad-9
db    LineIntHeightStraightRoad-10
db    LineIntHeightStraightRoad-11
db    LineIntHeightStraightRoad-11
db    LineIntHeightStraightRoad-12
db    LineIntHeightStraightRoad-13
db    LineIntHeightStraightRoad-13
db    LineIntHeightStraightRoad-14
db    LineIntHeightStraightRoad-15
db    LineIntHeightStraightRoad-15
db    LineIntHeightStraightRoad-16
db    LineIntHeightStraightRoad-17
db    LineIntHeightStraightRoad-17
db    LineIntHeightStraightRoad-18
db    LineIntHeightStraightRoad-19
db    LineIntHeightStraightRoad-19
db    LineIntHeightStraightRoad-20
db    LineIntHeightStraightRoad-21
db    LineIntHeightStraightRoad-21
db    LineIntHeightStraightRoad-22
db    LineIntHeightStraightRoad-23
db    LineIntHeightStraightRoad-23
db    LineIntHeightStraightRoad-24
db    LineIntHeightStraightRoad-25
db    LineIntHeightStraightRoad-25
db    LineIntHeightStraightRoad-26
db    LineIntHeightStraightRoad-27
db    LineIntHeightStraightRoad-27
db    LineIntHeightStraightRoad-28
db    LineIntHeightStraightRoad-29
db    LineIntHeightStraightRoad-29
db    LineIntHeightStraightRoad-30
db    LineIntHeightStraightRoad-31
db    LineIntHeightStraightRoad-31
db    LineIntHeightStraightRoad-32
db    LineIntHeightStraightRoad-33
db    LineIntHeightStraightRoad-33
db    LineIntHeightStraightRoad-34
db    LineIntHeightStraightRoad-35
db    LineIntHeightStraightRoad-36
db    LineIntHeightStraightRoad-37
db    LineIntHeightStraightRoad-38
db    LineIntHeightStraightRoad-39
db    LineIntHeightStraightRoad-40
db    LineIntHeightStraightRoad-40
.CurveUpLineIntHeightTableEnd:

  .CurveDownLineIntHeightTable:
db    LineIntHeightStraightRoad+0
db    LineIntHeightStraightRoad+1
db    LineIntHeightStraightRoad+1
db    LineIntHeightStraightRoad+2
db    LineIntHeightStraightRoad+2
db    LineIntHeightStraightRoad+3
db    LineIntHeightStraightRoad+3
db    LineIntHeightStraightRoad+4
db    LineIntHeightStraightRoad+4
db    LineIntHeightStraightRoad+5
db    LineIntHeightStraightRoad+5
db    LineIntHeightStraightRoad+6
db    LineIntHeightStraightRoad+6
db    LineIntHeightStraightRoad+7
db    LineIntHeightStraightRoad+7
db    LineIntHeightStraightRoad+8
db    LineIntHeightStraightRoad+8
db    LineIntHeightStraightRoad+9
db    LineIntHeightStraightRoad+9
db    LineIntHeightStraightRoad+10
db    LineIntHeightStraightRoad+10
db    LineIntHeightStraightRoad+11
db    LineIntHeightStraightRoad+11
db    LineIntHeightStraightRoad+12
db    LineIntHeightStraightRoad+12
db    LineIntHeightStraightRoad+13
db    LineIntHeightStraightRoad+13
db    LineIntHeightStraightRoad+14
db    LineIntHeightStraightRoad+14
db    LineIntHeightStraightRoad+15
db    LineIntHeightStraightRoad+15
db    LineIntHeightStraightRoad+16
db    LineIntHeightStraightRoad+16
db    LineIntHeightStraightRoad+17
db    LineIntHeightStraightRoad+17
db    LineIntHeightStraightRoad+18
db    LineIntHeightStraightRoad+18
db    LineIntHeightStraightRoad+19
db    LineIntHeightStraightRoad+19
db    LineIntHeightStraightRoad+20
db    LineIntHeightStraightRoad+20
db    LineIntHeightStraightRoad+21
db    LineIntHeightStraightRoad+21
db    LineIntHeightStraightRoad+22
db    LineIntHeightStraightRoad+22
db    LineIntHeightStraightRoad+23
db    LineIntHeightStraightRoad+24
db    LineIntHeightStraightRoad+24
db    LineIntHeightStraightRoad+25
db    LineIntHeightStraightRoad+26
db    LineIntHeightStraightRoad+26
db    LineIntHeightStraightRoad+27
db    LineIntHeightStraightRoad+27
db    LineIntHeightStraightRoad+28
db    LineIntHeightStraightRoad+28
db    LineIntHeightStraightRoad+29
db    LineIntHeightStraightRoad+29
db    LineIntHeightStraightRoad+30
db    LineIntHeightStraightRoad+30

.CurveDownLineIntHeightTableEnd:

  .UpdateRoadLinesAnimation:
  ld    hl,(RoadLinesMovementAnimationPointer)
  ld    de,(RacingGameSpeed)
  add   hl,de
  ld    (RoadLinesMovementAnimationPointer),hl
  ld    de,16                             ;every 32 distance travelled the road lines shift 1 pixel
  ld    b,0                               ;amount of pixels the road lines shift
  .loop:
  sbc   hl,de
  jr    c,.AnimationStepsFound
  inc   b
  jp    .loop
  .AnimationStepsFound:

  add   hl,de
  ld    (RoadLinesMovementAnimationPointer),hl
  ld    a,(RoadAnimationStep)
  add   a,b
  cp    60
  jr    c,.SetRoadAnimationStep
  sub   a,60
  .SetRoadAnimationStep:
  ld    (RoadAnimationStep),a
  ret

  .UpdateDistance:
  ld    a,(RacingGameSpeed)
  ld    b,a
  ld    a,(RoadCurveAmountPixelsTraversed)
  sub   a,b
  jr    nc,.NotYet200PixelsTraversed

  ld    hl,RoadCurve200PixelsTraversed?
  ld    (hl),1
  add   a,200
  .NotYet200PixelsTraversed:
  ld    (RoadCurveAmountPixelsTraversed),a

  ld    hl,(RacingGameDistance)
  ld    de,(RacingGameSpeed)
  add   hl,de
  ld    (RacingGameDistance),hl
  ret   nc
  ld    hl,(RacingGameDistance+2)
  inc   hl
  ld    (RacingGameDistance+2),hl
  ret

  .MovePlayerHorizontally:
  ld    hl,(RacingGameHorScreenPosition)

  ld    d,0
  ld    a,(RacingGameHorMoveSpeed)        ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  sub   21
  ld    e,a
  jr    nc,.EndCheckHorMoveSpeedNegative
  dec   d
  .EndCheckHorMoveSpeedNegative:

  ;hl=horizontal screen position, de=horizontal movement speed
  add   hl,de
  ld    (RacingGameHorScreenPosition),hl
  bit   7,h
  jp    z,.EndCheckOutOfScreenLeft    
  ld    hl,0
  ld    (RacingGameHorScreenPosition),hl
  .EndCheckOutOfScreenLeft:
  push  hl
  ld    de,10*(256-32)
  sbc   hl,de
  jr    c,.EndCheckOutOfScreenRight
  pop   hl
  ld    hl,10*(256-32)
  ld    (RacingGameHorScreenPosition),hl
  push  hl
  .EndCheckOutOfScreenRight:
  pop   bc
  ld    de,010                            ;HorScreenPosition / 10 = Player X
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  ld    (RacingGamePlayerX),a
  ret

  .SetHorMoveSpeedAndAnimatePlayerSprite:
  ld    hl,RacingGameHorMoveSpeed         ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right

  ld    c,01                              ;left border max speed
  ld    b,41                              ;right border max speed
  ;if racinggamespeed < 42 apply limit to how far we can turn left and right
  ld    a,(RacingGameSpeed)               ;speed in m/p/h
  srl   a                                 ;/2
  cp    21
  jr    nc,.EndCheckLimitations

  ld    c,a
  ld    b,a
  ld    a,21
  sub   a,c
  ld    c,a
  ld    a,21
  add   a,b
  ld    b,a
.EndCheckLimitations:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
  and   %0000 1100                        ;left and right
  jr    z,.NotMovingLeftOrRight
  cp    %0000 1100
  jr    z,.NotMovingLeftOrRight
	bit		3,a           ;right pressed ?
  jr    nz,.MoveRight

  .MoveLeft:
  ld    a,(hl)                            ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  sub   a,2
  jp    p,.Positive
  xor   a
  .Positive:
  cp    c
  ld    (hl),a                            ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  ret   nc
  ld    (hl),c                            ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  ret

  .MoveRight:
  ld    a,(hl)                            ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  add   a,2
  cp    b
  ld    (hl),a                            ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  ret   c
  ld    (hl),b                            ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  ret

  .NotMovingLeftOrRight:
  ld    a,(RacingGameHorMoveSpeed)        ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  cp    21
  ret   z
  jr    c,.SlowDownFromMovingLeftToCenter

  .SlowDownFromMovingRightToCenter:
  dec   a
  ld    (RacingGameHorMoveSpeed),a        ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  ret

  .SlowDownFromMovingLeftToCenter:
  inc   a
  ld    (RacingGameHorMoveSpeed),a        ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  ret

  .PerspectiveYTable:
  include "..\grapx\racinggame\PerspectiveYTable.asm"

  .SetEnemySprite:
  ;distance from player to horizon = 9370
  ;enemy on horizon needs to have y=78 
  ;y player=161

  ;simulate enemy driving away from player
  ld    bc,100                           ;enemy speed
  ld    de,(RacingGameSpeed)

  ld    hl,(RacingGameEnemy1DistanceFromPlayer)
  xor   a
  add   hl,bc                           ;add enemy speed
  sbc   hl,de                           ;subtract player speed
  jr    nc,.NotCarry

  ;at this point enemy is out of screen bottom, just remove enemy instead of replacing
  ld    a,r                             ;set random x for new enemy
  add   a,64
  ld    (RacingGameEnemyX),a            ;outer limits are 28 and 228
  ld    hl,9370                         ;place enemy on the horizon
  .NotCarry:
  ld    (RacingGameEnemy1DistanceFromPlayer),hl
  push  hl                              ;distance from player

  ;check enemy out of screen top
  ld    de,9368
  sbc   hl,de
  jr    c,.Carry
  ;at this point enemy is out of screen top, just remove enemy instead of replacing
  ld    hl,9370
  ld    (RacingGameEnemy1DistanceFromPlayer),hl
  pop   de
  push  hl
  .Carry:

  pop   bc                              ;distance from player
  ;distance from player / 29 to find y using perspective table. 

  ;FINETUNE this or we get in shit with hills
  ld    de,29
  call  DivideBCbyDE                                ; Out: BC = result, HL = rest
  ld    hl,.PerspectiveYTable
  add   hl,bc
  ld    a,(hl)
  ld    (RacingGameEnemyY),a

  ;when we have the y, we can use our lookup table to find our x
  sub   82                                          ;y top at horizon is 82
  add   a,a                                         ;*2
  ld    l,a
  ld    h,0
  add   hl,hl                                       ;*4
  ld    de,.PerspectiveXTable
  add   hl,de                                       ;x left yellow line (16 bit)
  ld    e,(hl)                                      ;x left yellow line
  inc   hl
  ld    d,(hl)                                      ;x left yellow line
  push  de

;  sub   16                                          ;16 pixel displacement since our sprite is 32 pixels wide and we calculate from the left instead of the middle
;  push  af

  ;we are now on the left yellow line on the road
  ;to calculate where exactly on the road we are we add: x * width / 256
  inc   hl                                          ;width road in that line (16 bit)
  ld    e,(hl)                                      ;width road in that line
  inc   hl
  ld    d,(hl)                                      ;width road in that line
  ld    hl,(RacingGameEnemyX)                       ;outer limits are 28 and 228
  call  MultiplyHlWithDE                            ;HL = result
  push  hl
  pop   bc
  ld    de,256
  call  DivideBCbyDE                                ; Out: BC = result, HL = rest
  pop   hl
  add   hl,bc
  ld    a,l
  sub   16                                          ;16 pixel displacement since our sprite is 32 pixels wide and we calculate from the left instead of the middle

  ld    (spat+1+(12*4)),a                 ;x sprite 2
  ld    (spat+1+(13*4)),a                 ;x sprite 3
  add   a,16
  ld    (spat+1+(14*4)),a                 ;x sprite 4
  ld    (spat+1+(15*4)),a                 ;x sprite 5
  sub   a,16
  ld    (spat+1+(16*4)),a                 ;x sprite 6
  ld    (spat+1+(17*4)),a                 ;x sprite 7
  add   a,16
  ld    (spat+1+(18*4)),a                 ;x sprite 8
  ld    (spat+1+(19*4)),a                 ;x sprite 9
  sub   a,8
  ld    (spat+1+(10*4)),a                 ;x sprite 0
  ld    (spat+1+(11*4)),a                 ;x sprite 1

  ld    a,(RacingGameEnemyY)
  ld    (spat+0+(10*4)),a                 ;y sprite 0
  ld    (spat+0+(11*4)),a                 ;y sprite 1
  add   a,16
  ld    (spat+0+(12*4)),a                 ;y sprite 2
  ld    (spat+0+(13*4)),a                 ;y sprite 3
  ld    (spat+0+(14*4)),a                 ;y sprite 4
  ld    (spat+0+(15*4)),a                 ;y sprite 5
  add   a,16
  ld    (spat+0+(16*4)),a                 ;y sprite 6
  ld    (spat+0+(17*4)),a                 ;y sprite 7
  ld    (spat+0+(18*4)),a                 ;y sprite 8
  ld    (spat+0+(19*4)),a                 ;y sprite 9

  ld    a,(framecounter2)                 ;only update even frames
  bit   0,a
  ret   nz

  ld    a,(RacingGameEnemyY)
  sub   78
  and   %1111 1100                       ;4 fold
  cp    15*4
  jr    c,.go
  ld    a,14*4
  .go:
  ld    e,a
  ld    d,0



;ld de,14*4

  ;jump to correct sprite addresses in SpriteOffSetsTable
  ld    ix,.Girl1PonyOffSetsTable             ;21 offset * 4 bytes per offset = 84 bytes
  add   ix,de

  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a     
  ld    a,RacingGameGirl1PonySpritesBlock   	;drilling game map
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  

  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr+320	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ld    l,(ix+0)
  ld    h,(ix+1)
	ld		c,$98
	call	outix320		;write sprite character to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+160	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ld    l,(ix+2)
  ld    h,(ix+3)
	ld		c,$98
	call	outix160		;write sprite color of pointer and hand to vram
  ret

  .PerspectiveXTable: ;generated values of x yellow line and width road on that line
  include "..\grapx\racinggame\CurveLeftAnimationPage1\0.asm"
;Extension of list for when enemy is clipping out of screen bot
dw 12,233
dw 11,235
dw 10,237
dw 9,239
dw 8,241
dw 7,243
dw 6,245
dw 5,247
dw 4,249
dw 3,251
dw 2,253
dw 1,255
dw 0,257
dw -1,259
dw -2,261
dw -3,263
dw -4,265
dw -5,267
dw -6,269
dw -7,271
dw -8,273
dw -9,275
dw -10,277
dw -11,279
dw -12,281
dw -13,283
dw -14,285
dw -15,287
dw -16,289
dw -17,291
dw -18,293
dw -19,295
dw -20,297
dw -21,299
dw -22,301
dw -23,303
dw -24,305
dw -25,307
dw -26,309
dw -27,311
dw -28,313
dw -29,315
dw -30,317
dw -31,319
dw -32,321
dw -33,323
dw -34,325
dw -35,327
dw -36,329
dw -37,331

  ;offset character, color
.Girl1PonyOffSetsTable: 
dw  Girl1PonySpritesCharacters+00*320,Girl1PonySpriteColors+00*160
dw  Girl1PonySpritesCharacters+01*320,Girl1PonySpriteColors+01*160
dw  Girl1PonySpritesCharacters+02*320,Girl1PonySpriteColors+02*160
dw  Girl1PonySpritesCharacters+03*320,Girl1PonySpriteColors+03*160
dw  Girl1PonySpritesCharacters+04*320,Girl1PonySpriteColors+04*160

dw  Girl1PonySpritesCharacters+05*320,Girl1PonySpriteColors+05*160
dw  Girl1PonySpritesCharacters+06*320,Girl1PonySpriteColors+06*160
dw  Girl1PonySpritesCharacters+07*320,Girl1PonySpriteColors+07*160
dw  Girl1PonySpritesCharacters+08*320,Girl1PonySpriteColors+08*160
dw  Girl1PonySpritesCharacters+09*320,Girl1PonySpriteColors+09*160

dw  Girl1PonySpritesCharacters+10*320,Girl1PonySpriteColors+10*160
dw  Girl1PonySpritesCharacters+11*320,Girl1PonySpriteColors+11*160
dw  Girl1PonySpritesCharacters+12*320,Girl1PonySpriteColors+12*160
dw  Girl1PonySpritesCharacters+13*320,Girl1PonySpriteColors+13*160
dw  Girl1PonySpritesCharacters+14*320,Girl1PonySpriteColors+14*160

  .SetPlayerSprite:
  ;set x coordinates player sprite
  ld    a,(RacingGameHorMoveSpeed)        ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  srl   a                                 ;/2
  ld    e,a
  ld    d,0
  ld    hl,.XOffsetsHeadSprite            ;21 offset * 4 bytes per offset = 84 bytes
  add   hl,de

  ld    a,(RacingGamePlayerX)
  ld    (spat+1+(02*4)),a                 ;x sprite 2
  ld    (spat+1+(03*4)),a                 ;x sprite 3
  add   a,16
  ld    (spat+1+(04*4)),a                 ;x sprite 4
  ld    (spat+1+(05*4)),a                 ;x sprite 5
  sub   a,16
  ld    (spat+1+(06*4)),a                 ;x sprite 6
  ld    (spat+1+(07*4)),a                 ;x sprite 7
  add   a,16
  ld    (spat+1+(08*4)),a                 ;x sprite 8
  ld    (spat+1+(09*4)),a                 ;x sprite 9
  sub   a,16
  add   a,(hl)
  ld    (spat+1+(00*4)),a                 ;x sprite 0
  ld    (spat+1+(01*4)),a                 ;x sprite 1

  ld    a,(framecounter2)                 ;only update odd frames
  bit   0,a
  ret   z

  ld    a,(RacingGameSpeed)
  cp    175
  ld    ix,SpriteOffSetsTableMaxSpeed   ;21 offset * 4 bytes per offset = 84 bytes
  jr    nc,.SpeedTableFound
  cp    150
  ld    ix,SpriteOffSetsTableMediumSpeed   ;21 offset * 4 bytes per offset = 84 bytes
  jr    nc,.SpeedTableFound
  ld    ix,SpriteOffSetsTableSlowSpeed   ;21 offset * 4 bytes per offset = 84 bytes
  .SpeedTableFound:

  ld    a,(RacingGameSpeed)
  cp    10
  jr    c,.EndAnimateWheels

  ;animate wheels
  ld    a,(framecounter2)
  and   7
  cp    4
  ld    de,0
  jr    c,.AnimateWheels
  ld    de,WheelAnimated-SpriteOffSetsTableSlowSpeed
  .AnimateWheels:
  add   ix,de
  .EndAnimateWheels:  

  ;jump to correct sprite addresses in SpriteOffSetsTable
  ld    a,(RacingGameHorMoveSpeed)        ;value from 0-41 where 21 is center (not moving) 0-20 is moving left, 22-41 is moving right
  res   0,a
  add   a,a
  ld    e,a
  ld    d,0
;  ld    ix,.SpriteOffSetsTable            ;21 offset * 4 bytes per offset = 84 bytes
  add   ix,de

  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a     
  ld    a,RacingGamePlayerSpritesBlock   	;sprites block
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  

  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ld    l,(ix+0)
  ld    h,(ix+1)
	ld		c,$98
	call	outix320		;write sprite character to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ld    l,(ix+2)
  ld    h,(ix+3)
	ld		c,$98
	call	outix160		;write sprite color of pointer and hand to vram
  ret

  ;x offsets for the head sprite
.XOffsetsHeadSprite:  
db 7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,10









ChangePaletteRacingGame:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		6,a           ;trig b pressed ?
  ret   z

  .ChangePalette:
  ld    a,(CurrentRacingGamePalette)
  add   a,32
  cp    6*32
  jr    nz,.notzero
  xor   a
  .notzero:
  ld    (CurrentRacingGamePalette),a
  ld    e,a
  ld    d,0
  ld    hl,.PaletteOriginal
  add   hl,de
  call  SetPalette
  ret
  .PaletteOriginal:
  incbin "..\grapx\RacingGame\TrackStraightPalette.SC5",$7680+7,32
  .Palette1:
  incbin "..\grapx\RacingGame\Palette1.SC5",$7680+7,32
  .Palette2:
  incbin "..\grapx\RacingGame\Palette2.SC5",$7680+7,32
  .Palette3:
  incbin "..\grapx\RacingGame\Palette3.SC5",$7680+7,32
  .Palette4:
  incbin "..\grapx\RacingGame\Palette4.SC5",$7680+7,32
  .Palette5:
  incbin "..\grapx\RacingGame\Palette5.SC5",$7680+7,32

ForceMovePlayerAgainstCurves:
  ld    a,(CurrentCurve)                           ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  cp    1
  jr    z,.Right
  cp    3
  jr    z,.Left
  cp    5
  jr    z,.RightEnd
  cp    7
  jr    z,.LeftEnd
  ret

  .LeftEnd:
  ld    a,(RoadCurvatureAnimationStep)              ;goes from 0-150  0=straight road, 150=all the way left
  ld    b,a

  ld    a,(HalfCurve?)
  or    a
  ld    a,150
  jr    z,.LeftCurveFound
  ld    a,75
  .LeftCurveFound:
  sub   b
  jp    .GoLeft

  .Left:
  ld    a,(RoadCurvatureAnimationStep)              ;goes from 0-150  0=straight road, 150=all the way left
  .GoLeft:
  ld    e,a
  ld    d,0
  ld    hl,(RacingGameSpeed)                        ;speed in m/p/h
  ;we take racing speed * animation step and throw that into a table to get the value the hor screen position should change with. maximum output value should be 18, because then we can still move a tiny bit against the curve 
  call  MultiplyHlWithDE                            ;HL = result
  ;max value = 150 * 200 = 30000
  push  hl
  pop   bc
  ld    de,1666                                     ;30000 / 1666 = 18
  call  DivideBCbyDE                                ; Out: BC = result, HL = rest

  ld    hl,(RacingGameHorScreenPosition)
  add   hl,bc
  ld    (RacingGameHorScreenPosition),hl
  ret

  .RightEnd:
  ld    a,(RoadCurvatureAnimationStep)              ;goes from 0-150  0=straight road, 150=all the way left
  ld    b,a

  ld    a,(HalfCurve?)
  or    a
  ld    a,150
  jr    z,.RightCurveFound
  ld    a,75
  .RightCurveFound:
  sub   b
  jp    .GoRight

  .Right:
  ld    a,(RoadCurvatureAnimationStep)              ;goes from 0-150  0=straight road, 150=all the way left
  .GoRight:
  ld    e,a
  ld    d,0
  ld    hl,(RacingGameSpeed)                        ;speed in m/p/h
  ;we take racing speed * animation step and throw that into a table to get the value the hor screen position should change with. maximum output value should be 18, because then we can still move a tiny bit against the curve 
  call  MultiplyHlWithDE                            ;HL = result
  ;max value = 150 * 200 = 30000
  push  hl
  pop   bc
  ld    de,1666                                     ;30000 / 1666 = 18
  call  DivideBCbyDE                                ; Out: BC = result, HL = rest

  ld    hl,(RacingGameHorScreenPosition)
  xor   a
  sbc   hl,bc
  ld    (RacingGameHorScreenPosition),hl
  ret


EndCurve: equ 0
CurveRight: equ 1
CurveDown: equ 2
CurveLeft: equ 3
CurveUp: equ 4
HalfCurveRight: equ 5
HalfCurveLeft: equ 6

                    ;next distance, curve (1=right, 2=down, 3=left, 4=up, 0=end current curve)
RacingGameEvents:                db CurveRight      | dw 00117 | db EndCurve
                      dw 00117 | db CurveLeft       | dw 00117 | db EndCurve
                      dw 00117 | db CurveUp         | dw 00100 | db EndCurve
                      dw 00100 | db CurveDown       | dw 00100 | db EndCurve
                      dw 00119 | db HalfCurveRight  | dw 00200 | db EndCurve
                      dw 00200 | db HalfCurveLeft   | dw 00200 | db EndCurve
                      dw 00200 | db CurveRight      | dw 00200 | db EndCurve
                      dw 00200 | db CurveLeft       | dw 00200 | db EndCurve
                      dw 60000 | db CurveDown
HandleCurvatureRoad:
  ld    hl,(RacingGameDistance+1)
  ld    de,(RacingGameEventDistance)
  xor   a
  sbc   hl,de
  ret   c

  ld    hl,(RacingGameEventPointer)
  ld    a,(hl)                                    ;curve (1=right, 2=endright, 3=down, 4=enddown, 5=left, 6=endleft, 7=up, 8=endup) 
  inc   hl
  ld    e,(hl)
  inc   hl
  ld    d,(hl)                                    ;distance for next event/curve in de
  inc   hl
  ld    (RacingGameEventPointer),hl

  ld    hl,(RacingGameEventDistance)
  add   hl,de
  ld    (RacingGameEventDistance),hl

  ld    hl,HalfCurve?
  or    a
  jp    z,.CurveEnd
  ld    (hl),0
  dec   a
  jp    z,.CurveRight
  dec   a
  jp    z,.CurveDown
  dec   a
  jp    z,.CurveLeft
  dec   a
  jp    z,.CurveUp
  ld    (hl),1
  dec   a
  jp    z,.CurveRight
  jp    .CurveLeft

  .CurveEnd:
  ld    a,(CurrentCurve)                           ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  dec   a
  jp    z,.CurveRightEnd
  dec   a
  jp    z,.CurveDownEnd
  dec   a
  jp    z,.CurveLeftEnd
  jp    .CurveUpEnd

  .CurveDownEnd:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    a,1
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    a,6                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,5
  ld    (AnimateRoad?),a                            ;2=up, 3=end up, 4=down, 5=end down
  ld    hl,CurveDownEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveDownEnd
	ld		(RoadAnimationIndexesBlock),a
  ret

  .CurveLeftEnd:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    a,7                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveLeftEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveLeftEnd
	ld		(RoadAnimationIndexesBlock),a

  ld    a,(HalfCurve?)
  bit   0,a
  ret   z
  ld    hl,HalfCurveLeftEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ret

  .CurveRightEnd:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    a,5                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveRightEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveRightEnd
	ld		(RoadAnimationIndexesBlock),a

  ld    a,(HalfCurve?)
  bit   0,a
  ret   z
  ld    hl,HalfCurveRightEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ret

  .CurveUpEnd:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    a,3
  ld    (AnimateRoad?),a                            ;2=up, 3=end up, 4=down, 5=end down
  ld    a,8                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,1
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    hl,CurveUpEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveUpEnd
	ld		(RoadAnimationIndexesBlock),a
  ret

  .CurveUp:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    a,2
  ld    (AnimateRoad?),a                            ;2=up, 3=end up, 4=down, 5=end down
  ld    a,4                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,1
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    hl,CurveUpDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveUp
	ld		(RoadAnimationIndexesBlock),a
  ret

  .CurveDown:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    a,4
  ld    (AnimateRoad?),a                            ;2=up, 3=end up, 4=down, 5=end down
  ld    a,2                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,1
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    hl,CurveDownDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveDown
	ld		(RoadAnimationIndexesBlock),a
  ret

  .CurveLeft:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    a,3                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveLeftDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveLeft
	ld		(RoadAnimationIndexesBlock),a

  ld    a,(HalfCurve?)
  bit   0,a
  ret   z
  ld    hl,HalfCurveLeftDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ret

  .CurveRight:
  xor   a
  ld    (RoadCurvatureAnimationStep),a
  ld    (AnimateRoadPage0AndPage1Simultaneous?),a
  ld    a,1                                         ;set new curve as previous
  ld    (CurrentCurve),a                            ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveRightDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveRight
	ld		(RoadAnimationIndexesBlock),a

  ld    a,(HalfCurve?)
  bit   0,a
  ret   z
  ld    hl,HalfCurveRightDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ret

SetInterruptHandlerRacingGame:
  di
  ld    hl,InterruptHandlerRacingGame
  ld    ($38+1),hl          ;set new normal interrupt
  ld    a,$c3               ;jump command
  ld    ($38),a
  ;lineinterrupt on
  ld    a,(VDP_0)                       ;set ei1
  or    16                              ;ei1 checks for lineint and vblankint
  ld    (VDP_0),a                       ;ei0 (which is default at boot) only checks vblankint
  out   ($99),a
  ld    a,128
  out   ($99),a

  ld    a,1
  ld    (LineIntPartRaceGame),a
  ld    hl,StraightRoad01Part2
  ld    (PointerToSwapLines),hl
  
  xor   a
  ld    (LineIntHeightRacingGame),a
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  ei
  out   ($99),a 
  ret






dephase
