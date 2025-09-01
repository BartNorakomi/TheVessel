;PenguinBikeRaceGameRoutine
;PenguinMovementRoutine

Phase MovementRoutinesAddress

;every second increase speed by 1
;maximum speed = 30 (every level max speed increases by 1 or 2)
;mushroom = speed -5
;fruit = boost for 3 seconds (speed + 20)
;stone = knipperen(ouch), snelheid back to 0
;star = 5 second invulnerable
;birds appear from edges to screen and fly in straight line
;clock = timefreeze (5 seconds)
;stones and birds gets announced with triangle with ! symbol

;you need to complete 10 laps to finish the level with the given time
;time is displayed in left top, laps in right top, level in the middle
;after completing a level, time gets extended, level gets increased, laps get reset
;every level max speed increases by 1 or 2

PenguinDistance:      equ Object2+var1  ;2 bytes
PenguinInsideOval?:   equ Object2+var3
PenguinMovementRoutine:
  ld    a,3
  ld    (framecounter),a
  ld    (iy+PutOnFrame),3

  call  IncreaseDistanceAndSetXYPenguin
  call  HandleJumpInsideOrOutsideOval
  call  SetPenguinSprite
  call  SetAlarmSprite
  call  SetStarSprite
  call  SetPizzaSprite
  call  SetClockSprite
  call  SetStoneSprite
  call  SetMushroomSprite
  ret

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
  ret

;mushroom looking Up
  ld    a,110
  ld    (MushroomLookingUpSpriteYSpat),a                 ;y sprite 0
  ld    (MushroomLookingUpSpriteYSpat+4),a                 ;y sprite 1
  ld    a,110+16
  ld    (MushroomLookingUpSpriteYSpat+8),a                 ;y sprite 1
  ld    (MushroomLookingUpSpriteYSpat+12),a                 ;y sprite 1
  ld    a,50
  ld    (MushroomLookingUpSpriteXSpat),a                 ;x sprite 0
  ld    (MushroomLookingUpSpriteXSpat+4),a                 ;x sprite 1
  ld    (MushroomLookingUpSpriteXSpat+8),a                 ;x sprite 0
  ld    (MushroomLookingUpSpriteXSpat+12),a                 ;x sprite 1
  ret

;mushroom looking right
  ld    a,110
  ld    (MushroomLookingRightSpriteYSpat),a                 ;y sprite 0
  ld    (MushroomLookingRightSpriteYSpat+4),a                 ;y sprite 1
  ld    (MushroomLookingRightSpriteYSpat+8),a                 ;y sprite 1
  ld    (MushroomLookingRightSpriteYSpat+12),a                 ;y sprite 1
  ld    a,50
  ld    (MushroomLookingRightSpriteXSpat),a                 ;x sprite 0
  ld    (MushroomLookingRightSpriteXSpat+4),a                 ;x sprite 1
  ld    a,50+16
  ld    (MushroomLookingRightSpriteXSpat+8),a                 ;x sprite 0
  ld    (MushroomLookingRightSpriteXSpat+12),a                 ;x sprite 1
  ret

;mushroom looking left
  ld    a,110
  ld    (MushroomLookingLeftSpriteYSpat),a                 ;y sprite 0
  ld    (MushroomLookingLeftSpriteYSpat+4),a                 ;y sprite 1
  ld    (MushroomLookingLeftSpriteYSpat+8),a                 ;y sprite 1
  ld    (MushroomLookingLeftSpriteYSpat+12),a                 ;y sprite 1
  ld    a,50
  ld    (MushroomLookingLeftSpriteXSpat),a                 ;x sprite 0
  ld    (MushroomLookingLeftSpriteXSpat+4),a                 ;x sprite 1
  ld    a,50+16
  ld    (MushroomLookingLeftSpriteXSpat+8),a                 ;x sprite 0
  ld    (MushroomLookingLeftSpriteXSpat+12),a                 ;x sprite 1
  ret

StoneSpriteYSpat:              equ spat+0+08*4
StoneSpriteXSpat:              equ spat+1+08*4
SetStoneSprite:
  ld    a,90
  ld    (StoneSpriteYSpat),a                 ;y sprite 0
  ld    (StoneSpriteYSpat+4),a                 ;y sprite 1
  ld    a,50
  ld    (StoneSpriteXSpat),a                 ;x sprite 0
  ld    (StoneSpriteXSpat+4),a                 ;x sprite 1
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

IncreaseDistanceAndSetXYPenguin:
  ld    hl,(PenguinDistance)
  inc   hl
  inc   hl
  ld    de,440
  xor   a
  sbc   hl,de
  jr    nc,.EndCheckOverFlow
  add   hl,de
  .EndCheckOverFlow:
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
  call  .HandlePhase                        ;load graphics, init variables
  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ld    hl,0
  ld    (PenguinDistance),hl
  xor   a
  ld    (PenguinInsideOval?),a

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
  ld    a,1
  ld    (SetArcadeGamePalette?),a

  call  .SetPenguinBikeRaceSprites

  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ret

  .SetPenguinBikeRaceSprites:
  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr+0*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

	ld		hl,PenguinBikeRaceCharSprites	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix128		;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+0*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

	ld		hl,PenguinBikeRaceColSprites	;sprite 0 character table in VRAM
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
