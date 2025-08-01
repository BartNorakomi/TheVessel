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

;Je kunt ditherpatronen gebruiken om 2 kleuren minder groot te laten verschillen
;bijvoorbeeld het gras (lichtgroen en donkergroen), je gooit in page 0 met dither 80% lichtgroen en 20% donkergroen, en in page 1 draai je dat om



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
  call  SetPlayerSprite




;&&&&&&&&&&&&&&&&&&&&&&&&&&&
;Uses 3 Divide calls
  call  SetEnemySprite
;&&&&&&&&&&&&&&&&&&&&&&&&&&&
  call  PlaceNewObject                      ;new objects may be placed if all active objects distance to player < 6247




  call  .SetHorMoveSpeedAndAnimatePlayerSprite


;  call  BackdropGreen
;we can slightly improve this with a movementtable and HorizontalMovementtablePointer
  call  MovePlayerHorizontally
;  call  BackdropBlack


  call  .HandleAccelerateAndDecelerate      ;speed up with trig A, brake with trig B
  call  .UpdateDistance
  call  .UpdateRoadLinesAnimation
  call  .ChangeLineIntHeightWhenCurvingUpOrDown
  call  HandleCurvatureRoad
  call  ChangePaletteRacingGame



;  call  .UpdateMaximumSpeedOnCurveUpOrDown

;  call  BackdropGreen
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;  call  ForceMovePlayerAgainstCurves        ;This one must be faster with a table
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
;  call  BackdropBlack

  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
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

;ld hl,50
  ld    (RacingGameSpeed),hl
  ld    hl,200
  ld    (MaximumSpeedRacingGame),hl

  ld    a,112
  ld    (RacingGamePlayerX),a
  xor   a
  ld    (RoadCurveAmountPixelsTraversed),a
  ld    (UpdateEnemySpritePattern?),a

  ld    a,RacingGamePlayerY
  ld    (RacingGameEnemyY),a

;  ld    hl,9370
;  ld    (RacingGameEnemy1DistanceFromPlayer),hl

  ld    hl,6570
  ld    (Object3+DistanceFromPlayer),hl
  ld    hl,128 
  ld    (Object3+X16bit),hl
  ld    a,1
  ld    (Object3+RacingGameObjectOn?),a
  ld    a,2                                 ;player is put on frame 0
  ld    (Object3+PutOnFrame),a
  ld    hl,spat+0+(20*4)
  ld    (Object3+SpatEntry),hl
	ld		hl,sprcharaddr+640	;sprite 0 character table in VRAM
  ld    (Object3+SpriteCharacterAddress),hl
	ld		hl,sprcoladdr+320	;sprite 0 color table in VRAM
  ld    (Object3+SpriteColorAddress),hl
  xor   a
  ld    (Object3+MiniSprite?),a

;  ret

  ld    hl,3370
  ld    (Object2+DistanceFromPlayer),hl
  ld    hl,128 
  ld    (Object2+X16bit),hl
  ld    a,1
  ld    (Object2+RacingGameObjectOn?),a
  ld    a,1                                 ;player is put on frame 0
  ld    (Object2+PutOnFrame),a
  ld    hl,spat+0+(10*4)
  ld    (Object2+SpatEntry),hl
	ld		hl,sprcharaddr+10*32	;sprite 0 character table in VRAM
  ld    (Object2+SpriteCharacterAddress),hl
	ld		hl,sprcoladdr+10*16	;sprite 0 color table in VRAM
  ld    (Object2+SpriteColorAddress),hl
  xor   a
  ld    (Object2+MiniSprite?),a


  ld    hl,9370
  ld    (Object4+DistanceFromPlayer),hl
  ld    hl,128 
  ld    (Object4+X16bit),hl
  ld    a,1
  ld    (Object4+RacingGameObjectOn?),a
  ld    a,3                                 ;player is put on frame 0
  ld    (Object4+PutOnFrame),a
  ld    hl,spat+0+(30*4)
  ld    (Object4+SpatEntry),hl
	ld		hl,sprcharaddr+30*32	;sprite 0 character table in VRAM
  ld    (Object4+SpriteCharacterAddress),hl
	ld		hl,sprcoladdr+30*16	;sprite 0 color table in VRAM
  ld    (Object4+SpriteColorAddress),hl
  ld    a,1
  ld    (Object4+MiniSprite?),a
  ret

  .UpdateMaximumSpeedOnCurveUpOrDown:
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

PlaceNewObject:                           ;new objects may be placed if all active objects distance to player < 6247
  ld    hl,(Object2+DistanceFromPlayer)
  ld    de,6247
  sbc   hl,de
  ret   nc
  ld    hl,(Object3+DistanceFromPlayer)
  ld    de,6247
  sbc   hl,de
  ret   nc
  ld    hl,(Object4+DistanceFromPlayer)
  ld    de,6247
  sbc   hl,de
  ret   nc

  ld    ix,Object2                      ;enemy 1
  bit   0,(ix+RacingGameObjectOn?)
  jr    z,.SetThisObject
  ld    ix,Object3                      ;enemy 2
  bit   0,(ix+RacingGameObjectOn?)
  jr    z,.SetThisObject
  ld    ix,Object4                      ;heart or other 16x16 sprite
  bit   0,(ix+RacingGameObjectOn?)
  jr    z,.SetThisObject
  ret

  .SetThisObject:
  ;We dont put enemy back at the horizon until enemy sprite pattern gets updated this frame as well, otherwise we might put a HUGE sprite there
  ld    a,(framecounter2)
  inc   a
  and   3
  cp    (ix+PutOnFrame)
  ret   nz

  set   0,(ix+RacingGameObjectOn?)      ;turn object on

  ld    a,r                             ;set random x for new enemy
  add   a,64
  ld    (ix+X16bit),a
  ld    hl,9370                         ;place enemy on the horizon
  ld    (ix+DistanceFromPlayer),l
  ld    (ix+DistanceFromPlayer+1),h
  ret

RemoveEnemySprite:
  ;If enemy is out of screen bot, AND there is a mini sprite enemy in play, we remove the minisprite enemy, and we place this enemy over the minisprite
  bit   0,(ix+MiniSprite?)
  jr    nz,.EndCheckEnemy1OutOfScreenBot

  ;We dont replace enemy with minisprite until enemy sprite pattern gets updated this frame as well, otherwise we might put a HUGE sprite there
  ld    a,(framecounter2)
  inc   a
  and   3
  cp    (ix+PutOnFrame)
  ret   nz

  ld    hl,(Object4+X16bit)
  ld    (ix+X16bit),l
  ld    (ix+X16bit+1),h
  ld    hl,(Object4+DistanceFromPlayer)
  ld    (ix+DistanceFromPlayer),l
  ld    (ix+DistanceFromPlayer+1),h  
  ld    ix,Object4
  .EndCheckEnemy1OutOfScreenBot:

  ld    hl,0
  ld    (ix+DistanceFromPlayer),l
  ld    (ix+DistanceFromPlayer+1),h  
  ld    (ix+RacingGameObjectOn?),0

  ld    a,213
  ld    l,(ix+SpatEntry)
  ld    h,(ix+SpatEntry+1)                ;y sprite in spat
  ld    de,4
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  bit   0,(ix+MiniSprite?)
  ret   nz
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  ret

SetEnemySprite:
;  call  BackdropGreen
  ld    ix,Object2                      ;enemy 1
  call  .HandleObject
  ld    ix,Object3                      ;enemy 2
  call  .HandleObject
  ld    ix,Object4                      ;heart or other 16x16 sprite
  call  .HandleObject
;  call  BackdropBlack
  ret

  .HandleObject:
  bit   0,(ix+RacingGameObjectOn?)
  ret   z
  ;distance from player to horizon = 9370
  ;enemy y on horizon=78 on straight road. y player=161

  ;simulate enemy driving away from player
  ld    bc,50                           ;enemy speed
  ld    de,(RacingGameSpeed)              ;player speed

  ld    l,(ix+DistanceFromPlayer)
  ld    h,(ix+DistanceFromPlayer+1)
  xor   a
  add   hl,bc                           ;add enemy speed
  sbc   hl,de                           ;subtract player speed
  jp    c,RemoveEnemySprite             ;at this point enemy is out of screen bottom
  ld    (ix+DistanceFromPlayer),l
  ld    (ix+DistanceFromPlayer+1),h

  ;check enemy out of screen top
  ld    de,9368
  sbc   hl,de
  jp    nc,RemoveEnemySprite            ;at this point enemy is out of screen top
  add   hl,de                              ;distance from player
  ;distance from player / 29 to find y using perspective table
  ld    a,Division29TableBlock   	        ;table block
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  
  ld    bc,Division29Table
  add   hl,bc
  res   0,l
;  add   hl,bc                                      ;we cut the table in half, it was too big
  ld    c,(hl)
  inc   hl
  ld    b,(hl)

;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
  ;we can use a table with 9370 entries and their outcomes
;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&                   
;  ld    de,29                                       ;9370/29=323 (so 323 entries in our perspective table)
;  call  DivideBCbyDE                                ; Out: BC = result, HL = rest

  ld    hl,CurveUpPerspectiveYTable0                ;straight road
  ld    a,CurveUpPerspectiveYTableBlock   	;drilling game map
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  

  ld    a,(CurrentCurve)                           ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  cp    4                                           ;up
  jr    z,.VerticalCurveFound
  cp    8                                           ;up end
  jr    z,.CurveUpEndFound
  cp    2                                           ;down
  jr    z,.CurveDownFound
  cp    6                                           ;down end
  jr    nz,.EndCheckVerticalCurve

  .CurveDownEndFound:
  ld    a,CurveDownPerspectiveYTableBlock   	;drilling game map
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  
  ld    a,(RoadCurvatureAnimationStep)              ;59 steps
  ld    e,a
  ld    a,59*2
  sub   e
  jp    .Go2

  .CurveDownFound:
  ld    a,CurveDownPerspectiveYTableBlock   	;drilling game map
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  
  jp    .VerticalCurveFound

  .CurveUpEndFound:
  ld    a,(RoadCurvatureAnimationStep)              ;59 steps
  ld    e,a
  ld    a,59*2
  sub   e
  jp    .Go2

  .VerticalCurveFound:
  ld    a,(RoadCurvatureAnimationStep)              ;59 steps
  .Go2:
  res   0,a
  ld    e,a
  ld    d,0
  ld    hl,CurveUpPerspectiveYTablePointer
  add   hl,de
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
  push  de
  pop   hl
  .EndCheckVerticalCurve:
  
  add   hl,bc
  ld    a,(hl)
  ld    (RacingGameEnemyY),a

  ;when we have the y, we can use our lookup table to find our x
  sub   39                                          ;y top at horizon is 82
  cp    124
  jp    c,.EndCheckClippingBot
  sub   123
  ld    l,a
  ld    h,0
  add   hl,hl                                       ;*2
  add   hl,hl                                       ;*4
  ld    de,.PerspectiveXTableExtension
  add   hl,de                                       ;x left yellow line (16 bit)
  ld    e,(hl)                                      ;x left yellow line
  inc   hl
  ld    d,(hl)                                      ;x left yellow line
  push  de                                          ;x left yellow line
  ;we are now on the left yellow line on the road
  ;to calculate where exactly on the road we are we add: x * width / 256
  inc   hl                                          ;width road in that line (16 bit)
  ld    e,(hl)                                      ;width road in that line
  inc   hl
  ld    d,(hl)                                      ;width road in that line
;  ld    hl,(RacingGameEnemyX)                       ;outer limits are 28 and 228

  ld    l,(ix+X16bit)
  ld    h,(ix+X16bit+1)

  call  MultiplyHlWithDE                            ;HL = result
;  push  hl
;  pop   bc
;  ld    de,256
;  call  DivideBCbyDE                                ; Out: BC = result, HL = rest

  ld    l,h
  ld    h,0                                         ;/256

  pop   bc
  add   hl,bc
  ld    a,l
  sub   16                                          ;16 pixel displacement since our sprite is 32 pixels wide and we calculate from the left instead of the middle
  jp    .SetXSpat

  .EndCheckClippingBot:
  add   a,a                                         ;*2
  ld    l,a
  ld    h,0

  ld    a,CurveUpPerspectiveXTableBlock   	;drilling game map
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  
  ld    de,CurveUpPerspectiveXTable0

  push  hl

  ld    a,(CurrentCurve)                           ;1=right, 2=down, 3=left, 4=up, 5=right end, 6=down end, 7=left end, 8=up end
  cp    3                                           ;left
  jr    z,.CurveLeftFoundX
  cp    1                                           ;right
  jr    z,.CurveRightFoundX
  cp    5                                           ;left end
  jr    z,.CurveRightEndFoundX
  cp    7                                           ;left end
  jr    z,.CurveLeftEndFoundX
  cp    4                                           ;up
  jr    z,.CurveUpFoundX
  cp    8                                           ;up end
  jr    z,.CurveUpEndFoundX
  cp    2                                           ;down
  jr    z,.CurveDownFoundX
  cp    6                                           ;down end
  jr    z,.CurveDownEndFoundX
  jr    .EndCheckVerticalCurveX

  .CurveDownEndFoundX:
  ld    a,CurveDownPerspectiveXTableBlock   	;drilling game map
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  

  .CurveUpEndFoundX:
  ld    a,(RoadCurvatureAnimationStep)              ;59 steps
  ld    e,a
  ld    a,59*2
  sub   e
  jp    .Go3

  .CurveLeftEndFoundX:
  ld    a,(RoadCurvatureAnimationStep)              ;75 steps
  ld    e,a
  ld    a,150
  sub   e
  jp    .Go4

  .CurveLeftFoundX:
  ld    a,(RoadCurvatureAnimationStep)              ;0- 150
  .Go4:
  srl   a                                           ;/2
  ld    l,a
  ld    h,0
  ld    e,a
  ld    d,0
  add   hl,hl                                       ;*2
  add   hl,de                                       ;*3
  ld    de,.CurveLeftPerspectiveXTablePointer
  add   hl,de
  ld    a,(hl)                                      ;block
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  
  inc   hl
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
  jp    .EndCheckVerticalCurveX

  .CurveRightEndFoundX:
  ld    a,(RoadCurvatureAnimationStep)              ;75 steps
  ld    e,a
  ld    a,150
  sub   e
  jp    .Go5

  .CurveRightFoundX:
  ld    a,(RoadCurvatureAnimationStep)              ;0- 150
  .Go5:
  srl   a                                           ;/2
  ld    l,a
  ld    h,0
  ld    e,a
  ld    d,0
  add   hl,hl                                       ;*2
  add   hl,de                                       ;*3
  ld    de,.CurveRightPerspectiveXTablePointer
  add   hl,de
  ld    a,(hl)                                      ;block
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  
  inc   hl
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
  jp    .EndCheckVerticalCurveX

  .CurveDownFoundX:
  ld    a,CurveDownPerspectiveXTableBlock   	;drilling game map
  call  block34                       	;CARE!!! we can only switch block34 if page 1 is in rom  

  .CurveUpFoundX:
  ld    a,(RoadCurvatureAnimationStep)              ;59 steps
  .Go3:
  res   0,a
  ld    e,a
  ld    d,0
  ld    hl,CurveUpPerspectiveXTablePointer
  add   hl,de
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
;  jp    .EndCheckVerticalCurveX

  .EndCheckVerticalCurveX:
  pop   hl                                          ;y*2
  add   hl,de                                       ;add y*2 to find in our list: x left yellow line (16 bit)
  ld    e,(hl)                                      ;x left yellow line
  ld    d,0
  push  de

  ;we are now on the left yellow line on the road
  ;to calculate where exactly on the road we are we add: x * width / 256
  inc   hl                                          ;width road in that line (16 bit)
  ld    e,(hl)                                      ;width road in that line
  ld    d,0
;  ld    hl,(RacingGameEnemyX)                       ;outer limits are 28 and 228

  ld    l,(ix+X16bit)
  ld    h,(ix+X16bit+1)

  call  MultiplyHlWithDE                            ;HL = result
;  push  hl
;  pop   bc
;  ld    de,256
;  call  DivideBCbyDE                                ; Out: BC = result, HL = rest

;  push  hl
;  pop   bc
;  ld    de,256
;  call  DivideBCbyDE                                ; Out: BC = result, HL = rest

  ld    l,h
  ld    h,0                                         ;/256

  pop   bc
  add   hl,bc
  ld    a,l
  sub   16                                          ;16 pixel displacement since our sprite is 32 pixels wide and we calculate from the left instead of the middle











;ld a,112
  .SetXSpat:
  bit   0,(ix+MiniSprite?)
  jp    z,.EndCheckMiniSprite

  ld    l,(ix+SpatEntry)
  ld    h,(ix+SpatEntry+1)                ;x sprite in spat
  inc   hl
  add   a,8
  ld    (hl),a
  ld    de,4
  add   hl,de
  ld    (hl),a

  ;Set Y spat
  ld    a,(RacingGameEnemyY)
  dec   hl
  add   a,32
  ld    (hl),a
  sbc   hl,de
  ld    (hl),a

  ld    a,(framecounter2)
  and   3
  cp    (ix+PutOnFrame)
  ret   nz

  ld    a,1
  ld    (UpdateEnemySpritePattern?),a

  ;size of the enemy sprite is depending on the distance from player 9370=horizon
  ;ld    hl,9370                         ;place enemy on the horizon
;  ld    a,(RacingGameEnemy1DistanceFromPlayer+1)      ;value from 0-36
  ld    a,(ix+DistanceFromPlayer+1)

  srl   a                                 ;/2
  add   a,a
  res   0,a                               ;value from 0-18 (only even)
  ld    e,a
  ld    d,0
  ld    hl,.HeartOffSetPointer             ;21 offset * 4 bytes per offset = 84 bytes

  bit   1,(ix+MiniSprite?)                  ;heart ?
  jr    nz,.EndCheckHeart

  ld    hl,.GirlMiniSpriteOffSetPointer             ;21 offset * 4 bytes per offset = 84 bytes

  .EndCheckHeart:

  add   hl,de                             ;jump to correct sprite addresses in SpriteOffSetsTable

  ld    e,(hl)
  inc   hl
  ld    h,(hl)
  ld    l,e

  ld    a,RacingGameHeartSpritesBlock   	;drilling game map
;  ld    a,RacingGameGirl1PonyMiniSpritesBlock   	;drilling game map
  ld    (EnemySpriteBlock),a
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
  ld    (EnemySpriteCharacter),de
  inc   hl
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
  ld    (EnemySpriteColor),de

  ld    l,(ix+SpriteCharacterAddress)
  ld    h,(ix+SpriteCharacterAddress+1)

  ld    (EnemySpriteCharacterVramAddress),hl
  ld    l,(ix+SpriteColorAddress)
  ld    h,(ix+SpriteColorAddress+1)
  ld    (EnemySpriteColorVramAddress),hl
  ld    a,(ix+MiniSprite?)
  ld    (PutMiniSprite?),a
  ret


.GirlMiniSpriteOffSetPointer: dw  .MiniSpriteSize0, .MiniSpriteSize0, .MiniSpriteSize0, .MiniSpriteSize1, .MiniSpriteSize2, .MiniSpriteSize3, .MiniSpriteSize4, .MiniSpriteSize4, .MiniSpriteSize4, .MiniSpriteSize4, .MiniSpriteSize4, .MiniSpriteSize4, .MiniSpriteSize3, .MiniSpriteSize2, .MiniSpriteSize1, .MiniSpriteSize1, .MiniSpriteSize0, .MiniSpriteSize0, .MiniSpriteSize0

  ;offset character, color
.MiniSpriteSize4:  dw  Girl1PonyMiniSpritesCharacters+4*64,  Girl1PonyMiniSpriteColors+4*32
.MiniSpriteSize3:  dw  Girl1PonyMiniSpritesCharacters+3*64,  Girl1PonyMiniSpriteColors+3*32
.MiniSpriteSize2:  dw  Girl1PonyMiniSpritesCharacters+2*64,  Girl1PonyMiniSpriteColors+2*32
.MiniSpriteSize1:  dw  Girl1PonyMiniSpritesCharacters+1*64,  Girl1PonyMiniSpriteColors+1*32
.MiniSpriteSize0:  dw  Girl1PonyMiniSpritesCharacters+0*64,  Girl1PonyMiniSpriteColors+0*32





.HeartOffSetPointer: dw  .HeartSize7, .HeartSize7, .HeartSize7, .HeartSize6, .HeartSize6, .HeartSize6, .HeartSize5, .HeartSize5, .HeartSize5, .HeartSize4, .HeartSize4, .HeartSize3, .HeartSize3, .HeartSize2, .HeartSize2, .HeartSize1, .HeartSize1, .HeartSize0, .HeartSize0

  ;offset character, color
.HeartSize7:  dw  HeartSpritesCharacters+7*64,  HeartSpriteColors+7*32
.HeartSize6:  dw  HeartSpritesCharacters+6*64,  HeartSpriteColors+6*32
.HeartSize5:  dw  HeartSpritesCharacters+5*64,  HeartSpriteColors+5*32
.HeartSize4:  dw  HeartSpritesCharacters+4*64,  HeartSpriteColors+4*32
.HeartSize3:  dw  HeartSpritesCharacters+3*64,  HeartSpriteColors+3*32
.HeartSize2:  dw  HeartSpritesCharacters+2*64,  HeartSpriteColors+2*32
.HeartSize1:  dw  HeartSpritesCharacters+1*64,  HeartSpriteColors+1*32
.HeartSize0:  dw  HeartSpritesCharacters+0*64,  HeartSpriteColors+0*32

  .EndCheckMiniSprite:
  ld    l,(ix+SpatEntry)
  ld    h,(ix+SpatEntry+1)                ;x sprite in spat
  inc   hl
  add   a,8
  ld    (hl),a
  ld    de,4
  add   hl,de
  ld    (hl),a
  sub   8
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   a,16
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  sub   a,16
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   a,16
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a

  ;Set Y spat
  ld    a,(RacingGameEnemyY)
  ld    l,(ix+SpatEntry)
  ld    h,(ix+SpatEntry+1)                ;y sprite in spat
;  ld    de,4
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   a,16
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   a,16
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  add   hl,de
  ld    (hl),a
  .SpatSet:

  ld    a,(framecounter2)
  and   3
  cp    (ix+PutOnFrame)
  ret   nz

  ld    a,1
  ld    (UpdateEnemySpritePattern?),a

  ;size of the enemy sprite is depending on the distance from player 9370=horizon
  ;ld    hl,9370                         ;place enemy on the horizon
;  ld    a,(RacingGameEnemy1DistanceFromPlayer+1)      ;value from 0-36
  ld    a,(ix+DistanceFromPlayer+1)

  srl   a                                 ;/2
  add   a,a
  res   0,a                               ;value from 0-18 (only even)
  ld    e,a
  ld    d,0
  ld    hl,.GirlOffSetPointer             ;21 offset * 4 bytes per offset = 84 bytes
  add   hl,de                             ;jump to correct sprite addresses in SpriteOffSetsTable

  ld    e,(hl)
  inc   hl
  ld    h,(hl)
  ld    l,e

  ld    a,RacingGameGirl1PonySpritesBlock   	;drilling game map
  ld    (EnemySpriteBlock),a
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
  ld    (EnemySpriteCharacter),de
  inc   hl
  ld    e,(hl)
  inc   hl
  ld    d,(hl)
  ld    (EnemySpriteColor),de

  ld    l,(ix+SpriteCharacterAddress)
  ld    h,(ix+SpriteCharacterAddress+1)

  ld    (EnemySpriteCharacterVramAddress),hl
  ld    l,(ix+SpriteColorAddress)
  ld    h,(ix+SpriteColorAddress+1)
  ld    (EnemySpriteColorVramAddress),hl
  ld    a,(ix+MiniSprite?)
  ld    (PutMiniSprite?),a
  ret

.GirlOffSetPointer: dw  .Size14, .Size14, .Size13, .Size12, .Size11, .Size10, .Size9, .Size8, .Size7, .Size6, .Size5, .Size4, .Size3, .Size2, .Size1, .Size1, .Size0, .Size0, .Size0

  ;offset character, color
.Size14: dw  Girl1PonySpritesCharacters+14*320, Girl1PonySpriteColors+14*160
.Size13: dw  Girl1PonySpritesCharacters+13*320, Girl1PonySpriteColors+13*160
.Size12: dw  Girl1PonySpritesCharacters+12*320, Girl1PonySpriteColors+12*160
.Size11: dw  Girl1PonySpritesCharacters+11*320, Girl1PonySpriteColors+11*160
.Size10: dw  Girl1PonySpritesCharacters+10*320, Girl1PonySpriteColors+10*160
.Size9:  dw  Girl1PonySpritesCharacters+9*320,  Girl1PonySpriteColors+9*160
.Size8:  dw  Girl1PonySpritesCharacters+8*320,  Girl1PonySpriteColors+8*160
.Size7:  dw  Girl1PonySpritesCharacters+7*320,  Girl1PonySpriteColors+7*160
.Size6:  dw  Girl1PonySpritesCharacters+6*320,  Girl1PonySpriteColors+6*160
.Size5:  dw  Girl1PonySpritesCharacters+5*320,  Girl1PonySpriteColors+5*160
.Size4:  dw  Girl1PonySpritesCharacters+4*320,  Girl1PonySpriteColors+4*160
.Size3:  dw  Girl1PonySpritesCharacters+3*320,  Girl1PonySpriteColors+3*160
.Size2:  dw  Girl1PonySpritesCharacters+2*320,  Girl1PonySpriteColors+2*160
.Size1:  dw  Girl1PonySpritesCharacters+1*320,  Girl1PonySpriteColors+1*160
.Size0:  dw  Girl1PonySpritesCharacters+0*320,  Girl1PonySpriteColors+0*160


  .PerspectiveXTableExtension:
  include "..\grapx\racinggame\CurveUpEndAnimationPage1\_XPerspectiveTableExtension.asm"


  .CurveLeftPerspectiveXTablePointer:
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable0
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable1
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable2
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable3
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable4
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable5
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable6
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable7
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable8
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable9
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable10
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable11
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable12
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable13
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable14
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable15
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable16
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable17
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable18
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable19
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable20
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable21
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable22
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable23
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable24
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable25
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable26
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable27
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable28
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable29
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable30
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable31
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable32
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable33
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable34
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable35
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable36
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable37
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable38
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable39
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable40
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable41
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable42
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable43
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable44
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable45
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable46
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable47
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable48
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable49
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable50
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable51
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable52
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable53
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable54
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable55
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable56
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable57
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable58
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable59
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable60
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable61
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable62
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable63
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable64
db CurveLeftPerspectiveXTableBlock | dw CurveLeftPerspectiveXTable65
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable66
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable67
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable68
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable69
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable70
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable71
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable72
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable73
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable74
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable75
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable76
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable77
db CurveLeftPerspectiveXTablePart2Block | dw CurveLeftPerspectiveXTable78


  .CurveRightPerspectiveXTablePointer:
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable0
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable1
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable2
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable3
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable4
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable5
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable6
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable7
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable8
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable9
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable10
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable11
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable12
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable13
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable14
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable15
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable16
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable17
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable18
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable19
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable20
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable21
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable22
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable23
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable24
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable25
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable26
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable27
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable28
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable29
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable30
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable31
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable32
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable33
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable34
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable35
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable36
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable37
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable38
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable39
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable40
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable41
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable42
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable43
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable44
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable45
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable46
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable47
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable48
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable49
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable50
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable51
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable52
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable53
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable54
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable55
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable56
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable57
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable58
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable59
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable60
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable61
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable62
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable63
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable64
db CurveRightPerspectiveXTableBlock | dw CurveRightPerspectiveXTable65
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable66
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable67
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable68
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable69
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable70
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable71
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable72
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable73
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable74
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable75
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable76
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable77
db CurveRightPerspectiveXTablePart2Block | dw CurveRightPerspectiveXTable78



;HorizontalMovementPointer:  db  -2,-2,-2
MovePlayerHorizontally:
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
  ld    de,8*(256-32)
  sbc   hl,de
  jr    c,.EndCheckOutOfScreenRight
  pop   hl
  ld    hl,8*(256-32)
  ld    (RacingGameHorScreenPosition),hl
  push  hl
  .EndCheckOutOfScreenRight:
  pop   bc

    srl b
    rr c                            ;bc /2
    srl b
    rr c                            ;bc /4
    srl b
    rr c                            ;bc /8

;  ld    de,008                            ;HorScreenPosition / 10 = Player X
;  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  ld    (RacingGamePlayerX),a
  ret

SetPlayerSprite:
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

  ld    a,(framecounter2)                 ;only once every 4 frames on frame 0
  and   3
  ret   nz

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
db 7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9

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
;we can use a table for this x-axis=roadcurvaturestep/2 0-75 y-axis=racinggamespeed/2 0-100. total entries 75*100=less than 2kb
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
RacingGameEvents:                db CurveLeft         | dw 00500 | db EndCurve
                      dw 00200 | db CurveLeft       | dw 00200 | db EndCurve
                      dw 00200 | db CurveLeft         | dw 00200 | db EndCurve
                      dw 00200 | db CurveLeft       | dw 00200 | db EndCurve
                      dw 00200 | db CurveLeft  | dw 00200 | db EndCurve
                      dw 00200 | db CurveLeft   | dw 00200 | db EndCurve
                      dw 00200 | db CurveLeft      | dw 00200 | db EndCurve
                      dw 00200 | db CurveLeft       | dw 00200 | db EndCurve
                      dw 60000 | db CurveUp
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
