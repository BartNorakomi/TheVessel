;AnimateObject
;CheckCollisionNPCs
;MovePlayer
;CheckStartConversation
;CheckPlayerNear

;VesselMovementRoutine
;HostMovementRoutine
;GirlMovementRoutine
;CapGirlMovementRoutine
;RedHeadBoyMovementRoutine

;SirensRoutine
;WallMovementRoutine
;ArcadeHall1EventRoutine
;ArcadeHall2EventRoutine
;BackRoomGameRoutine
;EntityaRoutine
;EntitybRoutine
;EntitycRoutine

;BiopodEventRoutine
;BioPod1Routine
;BioPod2Routine
;BioPodBlinkingLightRoutine

;HydroponicsbayEventRoutine
;hydroponicsbay1Routine
;hydroponicsbay2Routine

;HangarbayEventRoutine
;hangarbay1Routine
;hangarbay2Routine

;trainingdeckEventRoutine
;trainingdeck1Routine
;trainingdeck2Routine
;trainingdeck3Routine

;reactorchamberEventRoutine
;reactorchamber1Routine
;reactorchamber2Routine
;reactorchamber3Routine

;sleepingquartersEventRoutine
;armoryvaultEventRoutine

;holodeckEventRoutine
;holodeck1Routine
;holodeck2Routine

;medicalbayEventRoutine
;medicalbay1Routine
;medicalbay2Routine

;sciencelabEventRoutine

;DrillMachineEventRoutine

MovementRoutinesAddress:  equ $4000
Phase MovementRoutinesAddress





TheVesselrightidle_0:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_0_0
TheVesselrightrunning_0:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_1_0
TheVesselrightrunning_1:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_2_0
TheVesselrightrunning_2:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_3_0
TheVesselrightrunning_3:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_4_0
TheVesselrightrunning_4:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_5_0
TheVesselrightrunning_5:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_6_0
TheVesselrightrunning_6:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_7_0
TheVesselrightrunning_7:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_8_0
TheVesselrightrunning_8:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_9_0
TheVesselrightrunning_9:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_10_0
TheVesselrightrunning_10:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_11_0
TheVesselrightsitting_0:        db    TheVesselrightframelistblock, TheVesselrightspritedatablock | dw    Vesselright_12_0

TheVesselleftidle_0:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_12_0
TheVesselleftrunning_0:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_11_0
TheVesselleftrunning_1:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_10_0
TheVesselleftrunning_2:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_9_0
TheVesselleftrunning_3:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_8_0
TheVesselleftrunning_4:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_7_0
TheVesselleftrunning_5:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_6_0
TheVesselleftrunning_6:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_5_0
TheVesselleftrunning_7:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_4_0
TheVesselleftrunning_8:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_3_0
TheVesselleftrunning_9:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_2_0
TheVesselleftrunning_10:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_1_0
TheVesselleftsitting_0:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_0_0

TheVesselgettingup_0:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_0_0
TheVesselgettingup_1:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_1_0
TheVesselgettingup_2:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_2_0
TheVesselgettingup_3:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_3_0
TheVesselgettingup_4:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_4_0

TheVesselGoingToSleep:
TheVesselgettingup_5:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_5_0
TheVesselgettingup_6:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_6_0
TheVesselgettingup_7:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_7_0
TheVesselgettingup_8:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_8_0
TheVesselgettingup_9:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_9_0
TheVesselgettingup_10:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_10_0

TheVesselGettingOutOfBed:
.TheVesselgettingup_10:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_10_0
.TheVesselgettingup_9:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_9_0
.TheVesselgettingup_8:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_8_0
.TheVesselgettingup_7:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_7_0
.TheVesselgettingup_6:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_6_0
.TheVesselgettingup_5:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_5_0


TheVesselClimbingIntoMedBed:
.TheVesselgettingup_5:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_5_0
.TheVesselgettingup_6:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_6_0
.TheVesselgettingup_7:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_7_0
.TheVesselgettingup_13:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_13_0
.TheVesselgettingup_12:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_12_0
.TheVesselgettingup_12b:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_12_0
.TheVesselgettingup_12c:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_12_0

TheVesselGettingOutOfMedBed:
.TheVesselgettingup_12:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_12_0
.TheVesselgettingup_13:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_13_0
.TheVesselgettingup_7:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_7_0
.TheVesselgettingup_6:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_6_0
.TheVesselgettingup_5:        db    TheVesselgettingupframelistblock, TheVesselgettingupspritedatablock | dw    Vesselgettingup_5_0


VesselMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
  ld    hl,(PlayerSpriteStand)
  jp    (hl)

LayDownAndGoHeal:
  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  jp    z,.Phase0                           ;climb into bed
  dec   a
  jp    z,.Phase1                           ;fade out screen
  dec   a
  jp    z,.Phase2                           ;wait
  dec   a
  jp    z,.Phase3                           ;fade in screen
  dec   a
  jp    z,.Phase4                           ;climb out of bed
  ret

  .Phase4:                                  ;climb out of bed
  ld    a,(framecounter)                    ;wait timer
  and   15
  ret   nz

  ld    hl,TheVesselGettingOutOfMedBed      ;starting pose
  ld    b,06                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1
	ld		a,(iy+var1)
  cp    5
  ret   nz

	;set starting coordinates player
	ld		a,090														;y
	ld		(Object1+y),a
	ld		a,060														;x
	ld		(Object1+x),a

	ld		hl,RStanding
  ld    (PlayerSpriteStand),hl

  ld    hl,TheVesselrightidle_0
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  .Phase3:                                  ;fade in screen
  ld    a,(framecounter)                    ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  dec   a
  ld    (FadeStep),a
  cp    -1
  jp    z,.EndPhase3
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,16                            ;16 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy

  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase3:
  ld    (iy+ObjectPhase),4
  ld    a,-1
	ld		(Object1+var1),a
  ret

  .Phase2:                                  ;wait
  ld    a,(framecounter)                    ;wait timer
  and   127
  ret   nz
  ld    (iy+ObjectPhase),3
  ld    a,7                             ;palette step (0=normal map palette, 7=completely black)
  ld    (FadeStep),a
  ret

  .Phase1:                                  ;fade out screen
  ld    a,(framecounter)                    ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  inc   a
  ld    (FadeStep),a
  cp    8
  jp    z,.EndPhase1
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,16                            ;16 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy

  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase1:
  ld    (iy+ObjectPhase),2
  ret

  .Phase0:                                  ;climb into bed
  ld    hl,0                                ;reset radiation level
  ld    (Radiation),hl

  ld    a,(framecounter)                    ;wait timer
  and   15
  ret   nz

  xor   a
  ld    (Object2+on?),a                     ;hackjob, turn off bed
  ld    (Object3+on?),a                     ;hackjob, turn off bed

	;set starting coordinates player
	ld		a,074														;y
	ld		(Object1+y),a
	ld		a,060+6														;x
	ld		(Object1+x),a

  ld    hl,TheVesselClimbingIntoMedBed      ;starting pose
  ld    b,07                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1
	ld		a,(iy+var1)
  cp    6
  ret   nz
  ld    (iy+ObjectPhase),1
  ld    a,0                             ;palette step (0=normal map palette, 7=completely black)
  ld    (FadeStep),a

  ld    a,1
  ld    (Object2+on?),a                     ;hackjob, turn on bed
  ld    (Object3+on?),a                     ;hackjob, turn on bed
  ret

GoingToSleep:
  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  jp    z,.Phase0                           ;climb into bed
  dec   a
  jp    z,.Phase1                           ;fade out screen
  dec   a
  jp    z,.Phase2                           ;wait
  dec   a
  jp    z,.Phase3                           ;fade in screen
  dec   a
  jp    z,.Phase4                           ;climb out of bed
  ret

  .Phase4:                                  ;climb out of bed
  ld    a,(framecounter)                    ;wait timer
  and   15
  ret   nz

  ld    hl,TheVesselGettingOutOfBed         ;starting pose
  ld    b,07                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1
	ld		a,(iy+var1)
  cp    6
  ret   nz

  ld    hl,(EnergyMax)                      ;refill energy
  ld    (Energy),hl

	;set starting coordinates player
	ld		a,090														;y
	ld		(Object1+y),a
	ld		a,060														;x
	ld		(Object1+x),a

	ld		hl,RStanding
  ld    (PlayerSpriteStand),hl

  ld    hl,TheVesselrightidle_0
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  .Phase3:                                  ;fade in screen
  ld    a,(framecounter)                    ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  dec   a
  ld    (FadeStep),a
  cp    -1
  jp    z,.EndPhase3
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,16                            ;16 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy

  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase3:
  ld    (iy+ObjectPhase),4
  ld    a,-1
	ld		(Object1+var1),a
  ret

  .Phase2:                                  ;wait
  ld    a,(framecounter)                    ;wait timer
  and   127
  ret   nz
  ld    (iy+ObjectPhase),3
  ld    a,7                             ;palette step (0=normal map palette, 7=completely black)
  ld    (FadeStep),a
  ret

  .Phase1:                                  ;fade out screen
  ld    a,(framecounter)                    ;wait timer
  and   3
  ret   nz

  ld    a,(FadeStep)
  inc   a
  ld    (FadeStep),a
  cp    8
  jp    z,.EndPhase1
  ld    d,a                                 ;palette step (0=normal map palette, 7=completely black)

  push  iy
  ld    iy,CurrentPortraitPaletteFaded  ;faded palette
  ld    b,16                            ;16 colors
  ld    hl,CurrentPalette               ;actual palette
  call  SetPaletteFadeStep.loop2
  pop   iy

  ld    hl,CurrentPortraitPaletteFaded
  jp		SetPalette

  .EndPhase1:
  ld    (iy+ObjectPhase),2
  ret

  .Phase0:                                  ;climb into bed
  ld    a,(framecounter)                    ;wait timer
  and   15
  ret   nz

	;set starting coordinates player
	ld		a,074														;y
	ld		(Object1+y),a
	ld		a,060														;x
	ld		(Object1+x),a

  ld    hl,TheVesselGoingToSleep            ;starting pose
  ld    b,06                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1
	ld		a,(iy+var1)
  cp    5
  ret   nz
  ld    (iy+ObjectPhase),1
  ld    a,0                             ;palette step (0=normal map palette, 7=completely black)
  ld    (FadeStep),a
  ret

RGettingUp:
  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  jp    z,.Phase0                           ;wait until wake up
  dec   a
  jp    z,.Phase1                           ;animate waking up
  dec   a
  jp    z,.Phase2                           ;
  ret

  .Phase2:                                  ;
  ld    a,1
  ld    (Object2+on?),a                     ;here we can turn ObjectBiopod1 on

  ld    a,(iy+y)
  add   a,5
  ld    (iy+y),a
  cp    100
  jr    c,.EndCheckEndPhase2

  ld    (iy+y),102
  jp    Set_R_stand

  .EndCheckEndPhase2:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   15
  ret   nz

  ld    hl,TheVesselrightrunning_5          ;starting pose
  ld    b,11                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  .Phase1:                                  ;animate waking up
  ld    a,(framecounter)                    ;wait timer
  and   63
  ret   nz

  ld    hl,TheVesselgettingup_0             ;starting pose
  ld    b,05                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1
	ld		a,(iy+var1)
  or    a
  ret   nz
  ld    (iy+ObjectPhase),2

  ld    a,(iy+y)
  add   a,15
  ld    (iy+y),a

  ld    hl,TheVesselrightrunning_5
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  .Phase0:                                  ;wait until wake up
  xor   a
  ld    (Object2+on?),a                     ;we have to turn ObjectBiopod1 off, so it doesn't block our player's software sprite

  ld    hl,TheVesselgettingup_0
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  ld    a,(iy+var1)                         ;wait timer
  inc   a
  and   127
  ld    (iy+var1),a                         ;wait timer
  ret   nz
  ld    (iy+ObjectPhase),1
  ret

LEnterDoor:
  ld    a,(iy+2)                            ;x
  sub   a,HorizontalSpeedPlayer
  ld    (iy+2),a                            ;x
  cp    120
  jr    c,.PlayerHasEnteredDoor

  ld    hl,TheVesselleftrunning_0          ;starting pose
  ld    b,11                                ;animation steps
  jp    AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  .PlayerHasEnteredDoor:
	ld		a,058														;y
	ld		(Object1+y),a
  jp    Set_L_stand

REnterDoor:
  ld    a,(iy+2)                            ;x
  add   a,HorizontalSpeedPlayer
  ld    (iy+2),a                            ;x
  cp    182
  jr    nc,.ChangeRoom

  ld    hl,TheVesselrightrunning_0          ;starting pose
  ld    b,11                                ;animation steps
  jp    AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  .ChangeRoom:
  ld    a,1
  ld    (ChangeRoom?),a
  ld    (CurrentRoom),a
  ret

LStanding:
  ld    hl,TheVesselleftidle_0
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  call  GetMovementInBC                     ;reads our controls and sets total xy movement in bc 
  ld    a,b
  cp    1
  jp    z,Set_R_stand
  or    c
  jp    nz,Set_L_run
  ret

RStanding:
  ld    hl,TheVesselrightidle_0
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  call  GetMovementInBC                     ;reads our controls and sets total xy movement in bc 
  ld    a,b
  cp    -1
  jp    z,Set_L_stand
  or    c
  jp    nz,Set_R_run
  ret

Lrunning:
  call  GetMovementInBC                     ;reads our controls and sets total xy movement in bc 
  ld    a,b
  cp    1
  jp    z,Set_R_stand
  or    c
  jp    z,Set_L_stand

  call  MovePlayer                          ;move player and check for obstacles/screen edges
  ld    hl,TheVesselleftrunning_0           ;starting pose
  ld    b,11                                ;animation steps
  jp    AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

Rrunning:
  call  GetMovementInBC                     ;reads our controls and sets total xy movement in bc 
  ld    a,b
  cp    -1
  jp    z,Set_L_stand
  or    c
  jp    z,Set_R_stand

  call  MovePlayer                          ;move player and check for obstacles/screen edges
  ld    hl,TheVesselrightrunning_0          ;starting pose
  ld    b,11                                ;animation steps
  jp    AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

AnimateObject:                              ;in hl=starting pose, b=animation steps, uses: var1
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
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable


PlayerHeight: equ 73
;our tilemap is in page 2, starts at $8000
;each bit represents a 4x4 tile in our screen
;our tilemap is 32 bits wide x 54 bytes high
CheckCollisionWall:                         ;out: nz=collision
;xor a
;ret
  ld    a,(slot.page12rom)              ;all RAM except page 1+2
  out   ($a8),a      
  ld    a,(TileMapBlock)
  call  block34                           ;CARE!!! we can only switch block34 if page 1 is in rom  

  ld    a,(iy+2)                            ;x
  ld    e,a

  ld    a,(iy+1)                            ;y
  add   a,102                               ;player's feet start 102 pixels under his actual y
  ld    l,a

;  call  Check_Collision
;  ret

; Collision detection routine for MSX tilemap
; Input:  e = x (0-255), l = y (0-215)
; Output: z = no collision, nz = collision

;table lenght = 8 * 54 = 432 bytes
;if we divide y by 4 and then multiply by 8 we get the row
;this is the same as multiplying y by 2

;if we divide x by 32 we get the byte of that row

Check_Collision:
  ; divide x 
  ld    d,0
  srl   e                                 ;/2
  srl   e                                 ;/4

  ld    h,0
  srl   l                                 ;/2
  srl   l                                 ;/4
  add   hl,hl                             ;*2
  add   hl,hl                             ;*4
  add   hl,hl                             ;*8
  add   hl,hl                             ;*16
  add   hl,hl                             ;*32
  add   hl,hl                             ;*64 hl now points to the row

  add   hl,de
  ld    de,(Tilemap)
  add   hl,de                             ;we now have the byte we need
  bit   0,(hl)
  ret

CheckCollisionNPCs:                         ;out ;d=0(no collision), d=1(collision)
  ld    d,0                                 ;0=no collision, 1=collision

  ld    a,(SkipNPCCollision?)
  or    a
  ret   nz

  ld    hl,Object2
  call  .check
  ld    hl,Object3
  call  .check
  ld    hl,Object4
  call  .check
  ret

  .check:
  ld    a,(hl)                              ;on?
  or    a
  ret   z

  inc   hl                                  ;y npc
  .CheckBottomSide:                         ;check collision bottom side
  ld    a,(hl)
  add   a,3
  cp    (iy+1)                              ;y player
  ret   c
  .CheckTopSide:                            ;check collision top  side
  sub   a,12
  cp    (iy+1)                              ;y player
  ret   nc

  inc   hl                                  ;x npc
  .CheckRightSide:                          ;check collision right side
  ld    a,(hl)
  add   a,30
  cp    (iy+2)                              ;x player
  ret   c
  .CheckLeftSide:                           ;check collision left side
  sub   a,60
  cp    (iy+2)                              ;x player
  ret   nc

  ld    d,1                                 ;d=0(no collision), d=1(collision)
  ret

MovePlayer:
  call  .MoveHorizontally
;  call  .MoveVertically

  .MoveVertically:
  ld    a,c
  cp    -1
  jp    z,MoveUp
  cp    1
  jp    z,MoveDown
  ret

  .MoveHorizontally:  
  ld    a,b
  cp    -1
  jp    z,MoveLeft
  cp    1
  jp    z,MoveRight
  ret

EdgeRoomRight:  equ 254
EdgeRoomLeft:   equ 2
EnterRoomRight:  equ 252
EnterRoomLeft:   equ 4


HorizontalSpeedPlayer:  equ 6
MoveLeft:
  ;Horizontal movement speed = 6. Since tiles are 4x4, first move 2 pixels left and perform collision checks. If no collision is detected, then move the remaining 4 pixels left
  ld    a,(iy+x)                            ;x
  sub   a,2
  ret   c
  ld    (iy+x),a                            ;x
  call  CheckCollisionWall                  ;out: nz=collision
  jr    z,.NoCollisionCheck1

  ;at this point there is collision, lets check if we can pass throught the top or bottom ?
  ;Check Pass Through Top
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y
  ld    de,-64
  add   hl,de                               ;check row above
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck1

  ld    a,(iy+y)                            ;y
  add   a,8
  ld    (iy+y),a                            ;y
  ld    de,128
  add   hl,de                               ;check row below
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck1

  ;UnableToPass1
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y

  ld    a,(iy+x)                            ;x
  add   a,2
  ld    (iy+x),a                            ;x
  ret

  .NoCollisionCheck1:
  ld    a,(iy+x)                            ;x
  sub   a,4
  ret   c
  ld    (iy+x),a                            ;x
  call  CheckCollisionWall                  ;out: nz=collision
  jr    z,.NoCollisionCheck2

  ;at this point there is collision, lets check if we can pass throught the top or bottom ?
  ;Check Pass Through Top
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y
  ld    de,-64
  add   hl,de                               ;check row above
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck2

  ld    a,(iy+y)                            ;y
  add   a,8
  ld    (iy+y),a                            ;y
  ld    de,128
  add   hl,de                               ;check row below
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck2

  ;UnableToPass1
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y

  ld    a,(iy+x)                            ;x
  add   a,4
  ld    (iy+x),a                            ;x
  ret

  .NoCollisionCheck2:
  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  .Collision:
  ld    a,(iy+x)                            ;x
  add   a,6
  ld    (iy+x),a                            ;x
  ret

MoveRight:
  ;Horizontal movement speed = 6. Since tiles are 4x4, first move 2 pixels left and perform collision checks. If no collision is detected, then move the remaining 4 pixels left
  ld    a,(iy+x)                            ;x
  add   a,2
  ret   c
  ld    (iy+x),a                            ;x
  call  CheckCollisionWall                  ;out: nz=collision
  jr    z,.NoCollisionCheck1

  ;at this point there is collision, lets check if we can pass throught the top or bottom ?
  ;Check Pass Through Top
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y
  ld    de,-64
  add   hl,de                               ;check row above
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck1

  ld    a,(iy+y)                            ;y
  add   a,8
  ld    (iy+y),a                            ;y
  ld    de,128
  add   hl,de                               ;check row below
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck1

  ;UnableToPass1
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y

  ld    a,(iy+x)                            ;x
  sub   a,2
  ld    (iy+x),a                            ;x
  ret

  .NoCollisionCheck1:
  ld    a,(iy+x)                            ;x
  add   a,4
  ret   c  
  ld    (iy+x),a                            ;x
  call  CheckCollisionWall                  ;out: nz=collision
  jr    z,.NoCollisionCheck2

  ;at this point there is collision, lets check if we can pass throught the top or bottom ?
  ;Check Pass Through Top
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y
  ld    de,-64
  add   hl,de                               ;check row above
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck2

  ld    a,(iy+y)                            ;y
  add   a,8
  ld    (iy+y),a                            ;y
  ld    de,128
  add   hl,de                               ;check row below
  bit   0,(hl)                              ;out: nz=collision
  jr    z,.NoCollisionCheck2

  ;UnableToPass1
  ld    a,(iy+y)                            ;y
  sub   a,4
  ld    (iy+y),a                            ;y

  ld    a,(iy+x)                            ;x
  sub   a,4
  ld    (iy+x),a                            ;x
  ret

  .NoCollisionCheck2:
  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  .Collision:
  ld    a,(iy+x)                            ;x
  sub   a,6
  ld    (iy+x),a                            ;x
  ret

MoveUp:
  ld    a,(iy+1)                            ;y
  sub   a,4
  ld    (iy+1),a                            ;y

  call  CheckCollisionWall                  ;out: nz=collision
  jr    nz,.Collision
  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  .Collision:
  ld    a,(iy+1)                            ;y
  add   a,4
  ld    (iy+1),a                            ;y
  ret

MoveDown:
  ld    a,(iy+1)                            ;y
  add   a,4
  ld    (iy+1),a                            ;y

  call  CheckCollisionWall                  ;out: nz=collision
  jr    nz,.Collision
  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  .Collision:
  ld    a,(iy+1)                            ;y
  sub   a,4
  ld    (iy+1),a                            ;y
  ret

Set_L_stand:
	ld		hl,LStanding
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(iy+var1),a
  ret

Set_R_stand:
	ld		hl,RStanding
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(iy+var1),a
  ret

Set_L_run:
	ld		hl,Lrunning
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(iy+var1),a
  ret

Set_R_run:
	ld		hl,Rrunning
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(iy+var1),a
  ret

PutSpritePose:
  ld    (iy+7),l
  ld    (iy+8),h
  ret

GetMovementInBC:                            ;out bc=xy movement
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
  ld    bc,0                                ;b=x, c=y
	ld		a,(Controls)
	bit		0,a           ;cursor up pressed ?
  jr    z,.CheckDown
  dec   c
  .CheckDown:
	bit		1,a           ;cursor down pressed ?
  jr    z,.CheckLeft
  inc   c
  .CheckLeft:
	bit		2,a           ;cursor left pressed ?
  jr    z,.CheckRight
  dec   b
  .CheckRight:
	bit		3,a           ;cursor right pressed ?
  ret   z
  inc   b
  ret

Host_0:        db    Hostframelistblock, Hostspritedatablock | dw    host_0_0 ;idle right
Host_1:        db    Hostframelistblock, Hostspritedatablock | dw    host_1_0 ;run right
Host_2:        db    Hostframelistblock, Hostspritedatablock | dw    host_2_0
Host_3:        db    Hostframelistblock, Hostspritedatablock | dw    host_3_0
Host_4:        db    Hostframelistblock, Hostspritedatablock | dw    host_4_0
Host_5:        db    Hostframelistblock, Hostspritedatablock | dw    host_5_0
Host_6:        db    Hostframelistblock, Hostspritedatablock | dw    host_6_0
Host_7:        db    Hostframelistblock, Hostspritedatablock | dw    host_7_0

Host_8:        db    Hostframelistblock, Hostspritedatablock | dw    host_15_0 ;idle left
Host_9:        db    Hostframelistblock, Hostspritedatablock | dw    host_14_0 ;run left
Host_10:        db    Hostframelistblock, Hostspritedatablock | dw    host_13_0
Host_11:        db    Hostframelistblock, Hostspritedatablock | dw    host_12_0
Host_12:        db    Hostframelistblock, Hostspritedatablock | dw    host_11_0
Host_13:        db    Hostframelistblock, Hostspritedatablock | dw    host_10_0
Host_14:        db    Hostframelistblock, Hostspritedatablock | dw    host_9_0
Host_15:        db    Hostframelistblock, Hostspritedatablock | dw    host_8_0
HostMovementRoutine:
  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  jp    z,.Phase0                           ;standing still in arcade hall2, ready for conversation
  dec   a
  jp    z,.Phase1                           ;host walks towards the vessel (30 pixels to the left)
  dec   a
  jp    z,.Phase2                           ;host walks towards the vessel (diagonally straight to player), StartConversation
  dec   a
  jp    z,.Phase3                           ;wait 10 frames
  dec   a
  jp    z,.Phase4                           ;host walks back to the door (diagonally straight to door)
  dec   a
  jp    z,.Phase5                           ;host walks back to the door (30 pixels to the right)
  ret

  .Phase5:                                  ;host walks back to the door (30 pixels to the right)
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    hl,Host_1                           ;starting pose
  ld    b,07                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  ld    a,(iy+2)                            ;x
  add   a,4
  ld    (iy+2),a
  cp    174
  ret   c
  ld    (iy+ObjectPhase),6
  ret

  .Phase4:                                  ;host walks back to the door (diagonally straight to door)
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    hl,Host_1                           ;starting pose
  ld    b,07                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  ld    a,(iy+2)                            ;x
  add   a,1
  ld    (iy+2),a

  ld    a,(iy+1)                            ;y
  sub   a,3
  ld    (iy+1),a

  cp    054
  ret   nc

  ld    (iy+1),54
  ld    (iy+ObjectPhase),5
  ret

  .Phase3:                                  ;wait 10 frames
  ld    a,(iy+var1)
  inc   a
  ld    (iy+var1),a
  cp    10*4
  ret   c
  ld    (iy+var1),0
  ld    (iy+ObjectPhase),4
  ret

  .Phase2:                                  ;host walks towards the vessel, StartConversation
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    hl,Host_9                           ;starting pose
  ld    b,07                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  ld    a,(iy+2)                            ;x
  sub   a,1
  ld    (iy+2),a

  ld    a,(iy+1)                            ;y
  add   a,3
  ld    (iy+1),a

  cp    102
  ret   c
  ld    (iy+ObjectPhase),3

  ld    hl,ConvHost
  set   0,(hl)
  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv007
  ld    (NPCConvAddress),hl
  ld    hl,Host_8
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  .Phase1:                                  ;host walks towards the vessel
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    hl,Host_9                           ;starting pose
  ld    b,07                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  ld    a,(iy+2)                            ;x
  sub   a,4
  ld    (iy+2),a
  cp    136
  ret   nc
  ld    (iy+ObjectPhase),2
  ret

  .Phase0:                                  ;standing still in arcade hall2, ready for conversation
  ld    (iy+y),068                          ;y
  ld    (iy+x),108                          ;x

  call  CheckStartConversation              ;out: nz=converstaion starts
  ret   z

  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a

  ld    hl,ConvHost
  bit   1,(hl)
  jr    z,.NPCConv001

  .NPCConv002:                              ;execute if ConvGirl bit 0 is set 
  ld    hl,NPCConv009
  ld    (NPCConvAddress),hl
  ret

  .NPCConv001:                              ;execute if ConvGirl bit 0 is not set. sets ConvGirl bit 0 
  set   1,(hl)
  ld    hl,NPCConv008
  ld    (NPCConvAddress),hl
  ret

ArcadeMachine1y:  db $54 - 4
ArcadeMachine1x:  db $16 - 10 

ArcadeMachine2y:  db $50 - 4
ArcadeMachine2x:  db $42 - 10 

ArcadeMachine3y:  db $54 - 4
ArcadeMachine3x:  db $c6 - 10 

ArcadeMachine4y:  db $54 - 4
ArcadeMachine4x:  db $f6 - 10 

CheckShowPressTrigAIconArcadeHall1:
  ld    hl,ArcadeMachine1y
  call  CheckPlayerNearArcadeMachine
  jr    nz,.PlayerIsNear

  ld    hl,ArcadeMachine2y
  call  CheckPlayerNearArcadeMachine
  jr    nz,.PlayerIsNear

  ld    hl,ArcadeMachine3y
  call  CheckPlayerNearArcadeMachine
  jr    nz,.PlayerIsNear

  ld    hl,ArcadeMachine4y
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

BackroomGamey:  db 92
BackroomGamex:  db 124

CheckShowPressTrigAIconArcadeHall2:
  ld    hl,ConvHost
  bit   1,(hl)
  ret   z  

  ld    hl,BackroomGamey
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

CheckPlayerNearArcadeMachine:
  ld    a,(hl)                              ;y arcade machine
  ld    (iy+y),a
  inc   hl
  ld    a,(hl)                              ;x arcade machine
  ld    (iy+x),a

  call  .CheckPlayerNear                    ;check if player is standing near NPC. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret

.CheckPlayerNear:                           ;out ;d=0(no collision), d=1(collision)
  ld    d,0                                 ;0=no collision, 1=collision
  ld    hl,Object1                          ;player

  inc   hl                                  ;y player
  .CheckBottomSide:                         ;check collision bottom side
  ld    a,(hl)
  add   a,12
  cp    (iy+1)                              ;y npc
  ret   c
  .CheckTopSide:                            ;check collision top  side
  sub   a,21
  cp    (iy+1)                              ;y npc
  ret   nc

  inc   hl                                  ;x player
  .CheckRightSide:                          ;check collision right side
  ld    a,(hl)
  add   a,42-22
  jr    c,.CheckLeftSide
  cp    (iy+2)                              ;x npc
  ret   c
  .CheckLeftSide:                           ;check collision left side

  ld    a,(hl)
  sub   a,42-8
  jr    c,.collision
  cp    (iy+2)                              ;x npc
  ret   nc

  .collision:
  ld    d,1                                 ;d=0(no collision), d=1(collision)
  ret

PutConversationCloud:
  ld    a,(ShowConversationCloud?)
  or    a
  jr    z,.RemoveCloud
  xor   a
  ld    (ShowConversationCloud?),a

  ld    a,(Cloudy)
  ld    (spat+(4*002)+0),a
  ld    (spat+(4*003)+0),a
  ld    (spat+(4*004)+0),a
  ld    (spat+(4*005)+0),a
  ld    a,(Cloudx)
  ld    (spat+(4*002)+1),a
  ld    (spat+(4*003)+1),a
  add   a,16
  ld    (spat+(4*004)+1),a
  ld    (spat+(4*005)+1),a
  ret

.RemoveCloud:
  ld    a,230
  ld    (spat+(4*002)+0),a
  ld    (spat+(4*003)+0),a
  ld    (spat+(4*004)+0),a
  ld    (spat+(4*005)+0),a
  ret

PutPressTrigAIcon:
  ld    a,(ShowPressTriggerAIcon?)
  or    a
  jr    z,.RemoveTriggerAIcon
  xor   a
  ld    (ShowPressTriggerAIcon?),a

  ;hand y
  ld    a,(framecounter)
  and   31
  cp    16
  ld    b,1
  jr    c,.go
  ld    b,-1
  .go:
  ld    a,(TriggerAy)
  add   a,b
  sub   a,29
  ld    (spat+(4*000)+0),a
  ld    (spat+(4*001)+0),a

  ld    a,(TriggerAy)
  sub   a,14
  ;button y
  ld    (spat+(4*006)+0),a
  ld    (spat+(4*007)+0),a
  ;button x
  ld    a,(TriggerAx)
  ld    (spat+(4*006)+1),a
  ld    (spat+(4*007)+1),a
  ;hand x
  sub   a,2
  ld    (spat+(4*000)+1),a
  ld    (spat+(4*001)+1),a
  ret

.RemoveTriggerAIcon:
  ld    a,230
  ld    (spat+(4*000)+0),a
  ld    (spat+(4*001)+0),a
  ld    (spat+(4*006)+0),a
  ld    (spat+(4*007)+0),a
  ret

ArcadeHall1EventRoutine:
  call  .CheckPlayerEntersArcade2             ;check player enters the door to arcadehall2 
  call  .CheckPlayerEntersHolodeck            ;check player goes back to holodeck 
  call  PutConversationCloud
  call  CheckShowPressTrigAIconArcadeHall1
  call  PutPressTrigAIcon
  call  .CheckFirstTimeHolodeck
  ret

  .CheckFirstTimeHolodeck:
  ld    hl,ConvEntityShipExplanations
  bit   0,(hl)
  ret   z

  ld    hl,ConvEntity
  bit   5,(hl)
  ret   nz
  set   5,(hl)
  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv043
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerEntersHolodeck:
  ld    hl,ConvEntityShipExplanations
  bit   0,(hl)
  ret   z

  ld    a,(Object1+x)
  cp    6
  jr    c,.ReturnToHolodeck
  ld    a,(Object1+x)
  cp    250
  jr    nc,.ReturnToHolodeck
  ld    a,(Object1+y)
  cp    122
  ret   c

  .ReturnToHolodeck:
  ld    a,$4e
  ld    (Object1+y),a
  ld    a,$8e
  ld    (Object1+x),a

  ld    a,9
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .CheckPlayerEntersArcade2:
	ld		a,(HighScoreTotalAverage)
	cp		80
  ret   c

  ld    a,(Object1+y)
  cp    54
  ret   nz

	ld		hl,(PlayerSpriteStand)
  ld    de,LEnterDoor
  call  CompareHLwithDE
  ret   z

  ;Set_R_EnterDoor:
	ld		hl,REnterDoor
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(object1+var1),a
	ld		(iy+on?),a
  ret

ArcadeHall2EventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
  call  CheckShowPressTrigAIconArcadeHall2
  call  PutPressTrigAIcon
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(InitiateWakeUp?)
  or    a
  jr    nz,.InitiateWakeUp

  ld    a,(Object1+y)
  cp    120
  ret   c

	ld		hl,LEnterDoor
	ld		(PlayerSpriteStand),hl
  ld    a,8
	ld		(object1+var1),a

	;set starting coordinates player (entering through the door)
	ld		a,054														;y
	ld		(Object1+y),a
	ld		a,182														;x
	ld		(Object1+x),a

  xor   a
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .InitiateWakeUp:
  ld    a,2
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

HydroponicsbayEventRoutine:
  ld    a,1
  ld    (SkipNPCCollision?),a

  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
;  call  CheckShowPressTrigAIconArcadeHall1
;  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   0,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   0,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv015
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.biopod
  cp    EdgeRoomLeft+1
  jr    c,.left
  ret

  .left:
  ld    a,EnterRoomRight
  ld    (Object1+x),a

  ld    a,4
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .biopod:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a

  ld    a,2
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

armoryvaultEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 

  call  PutConversationCloud
;  call  CheckShowPressTrigAIconHangarBay
;  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   5,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   5,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv020
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.sleepingquarters

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.holodeck
  ret

  .holodeck:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,9
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .sleepingquarters:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a+16
  ld    (Object1+y),a

  ld    a,7
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

holodecky:   db 070-4
holodeckx:   db 160
CheckShowPressTrigAIconholodeck:
  ld    hl,holodecky
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

holodeckEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
  call  CheckShowPressTrigAIconholodeck
  call  .CheckStartHolodeckEvent
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .CheckStartHolodeckEvent:
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

  .StartHolodeckEvent:
  ld    a,00                                ;back to arcade hall 1
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a

  ld    a,102
  ld    (object1+y),a
  ld    a,130
  ld    (object1+x),a
  ret    

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   6,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   6,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv021
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.armoryvault

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.medicalbay
  ret

  .medicalbay:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,10
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .armoryvault:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,8
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

sciencelabcomputery:   db $54 + 4 + 4 + 4
sciencelabcomputerx:   db 128 +16 - 40
CheckShowPressTrigAIconsciencelab:
  ld    hl,sciencelabcomputery
  call  CheckPlayerNearArcadeMachine
  ret   z

  .PlayerIsNear:
  ld    a,1
  ld    (ShowPressTriggerAIcon?),a
  ld    a,(iy+y)
  ld    (TriggerAy),a
  ld    a,(iy+x)
  ld    (TriggerAx),a
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;trig a pressed ?
  ret   z
  ld    a,13                                ;upgrade menu
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret    

sciencelabEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 

  call  PutConversationCloud
  call  CheckShowPressTrigAIconsciencelab
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .HandleExplainerConversation:
  ld    hl,ConvEntity
  bit   7,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   7,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv023
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.medicalbay

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.biopod
  ret

  .biopod:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a+16
  ld    (Object1+y),a

  ld    a,2
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .medicalbay:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,10
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

medicalbaybed1y:   db $54 + 4
medicalbaybed1x:   db 128 - 60
medicalbaybed2y:   db $54 - 4
medicalbaybed2x:   db 128 - 60
medicalbayEmbryosy:db $54 - 4-30 - 8
medicalbayEmbryosx:db $54 - 4 + 60 - 16

CheckShowPressTrigAIconmedicalbay:
  ld    hl,medicalbayEmbryosy
  call  CheckPlayerNearArcadeMachine
  jr    nz,.PlayerIsNear

  ld    hl,(Radiation)                    ;dont show trig a icon above bed if radiation = 0
  ld    a,l
  or    h
  ret   z

  ld    hl,medicalbaybed1y
  call  CheckPlayerNearArcadeMachine
  jr    nz,.PlayerIsNear

  ld    hl,medicalbaybed2y
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

medicalbayEventRoutine:
  ld    a,1
  ld    (SkipNPCCollision?),a

  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 

  call  PutConversationCloud
  call  CheckShowPressTrigAIconmedicalbay
  call  .CheckStartEmbryoConversation
  call  .CheckStartHealingSequence
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .CheckStartHealingSequence:
  ld    a,(object1+y)
  cp    $3a
  ret   c

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

  ;we can only heal if Radiation > 25% RadiationMax
  ld    bc,(RadiationMax)
  ld    de,4
  call  DivideBCbyDE                    ; Out: BC = result, HL = rest
  
  ld    hl,(Radiation)
  sbc   hl,bc
  jr    nc,.LayDownAndGoHeal

  ;set radiation level
  ld    hl,(Radiation)
  ld    de,100
  call  MultiplyHlWithDE      ;HL = result
  push  hl
  pop   bc
  ld    de,(RadiationMax)
  call  DivideBCbyDE                    ; Out: BC = result, HL = rest

  push  bc
  pop   hl
  call  NUM_TO_ASCII
  ld    hl,Ascii5Byte+3
  ld    de,TextRadiationLevel
  ld    bc,2
  ldir

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv042
  ld    (NPCConvAddress),hl
  ret

  .LayDownAndGoHeal:
	ld		hl,LayDownAndGoHeal
  ld    (PlayerSpriteStand),hl
	xor		a
	ld		(Object1+ObjectPhase),a
  ld    a,-1
	ld		(Object1+var1),a
  ret

  .CheckStartEmbryoConversation:
  ld    a,(object1+y)
  cp    $3a
  ret   nc

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

  ld    hl,ConvEntity
  bit   6,(hl)
  set   6,(hl)
  jr    z,.FirstConversationEmbyos
  .embryocheckfollowup:
  ;set remaining incubation period
  ld    hl,TextRemainingIncubationPeriod
  ;to do
  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv041
  ld    (NPCConvAddress),hl
  ret

  .FirstConversationEmbyos:
  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv040
  ld    (NPCConvAddress),hl
  ret

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   7,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   7,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv022
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.holodeck

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.sciencelab
  ret

  .sciencelab:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a+16
  ld    (Object1+y),a

  ld    a,11
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .holodeck:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,9
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

sleepingquartersbedy:   db 104 - 16
sleepingquartersbedx:   db 060 -8
CheckShowPressTrigAIconsleepingquarters:
  ld    hl,sleepingquartersbedy
  call  CheckPlayerNearArcadeMachine
  ret   z

  ;dont show press trig A icon if Energy > EnergyMAX-3
  ld    hl,(EnergyMax)
  dec   hl
  dec   hl
  dec   hl
  ld    de,(Energy)
  xor   a
  sbc   hl,de
  ret   c

  .PlayerIsNear:
  ld    a,1
  ld    (ShowPressTriggerAIcon?),a
  ld    a,(iy+y)
  ld    (TriggerAy),a
  ld    a,(iy+x)
  ld    (TriggerAx),a
  ret

sleepingquartersEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
  call  CheckShowPressTrigAIconsleepingquarters
  call  .CheckStartSleepSequence
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .CheckStartSleepSequence:
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

  ;we can only go to sleep if our energy <50% of our max energy
  ld    bc,(EnergyMax)
  ld    de,2
  call  DivideBCbyDE                    ; Out: BC = result, HL = rest
  
  ld    hl,(Energy)
  sbc   hl,bc
  jr    c,.GoToSleep

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv039
  ld    (NPCConvAddress),hl
  ret

  .GoToSleep:
	ld		hl,GoingToSleep
  ld    (PlayerSpriteStand),hl
	xor		a
	ld		(Object1+ObjectPhase),a
  ld    a,-1
	ld		(Object1+var1),a
  ret

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   4,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   4,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv019
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.reactorchamber

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.armoryvault
  ret

  .armoryvault:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,8
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .reactorchamber:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,6
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

WaitCenterScreen:
  ld    a,(object1+x)
  cp    256-80
  jp    nc,.DontPutConversation
  cp    80
  ret   nc
  .DontPutConversation:
  pop   af
  ret



;slice 1 (top)
reactorchamber_0:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_0_0
reactorchamber_3:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_3_0
reactorchamber_6:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_6_0
reactorchamber_9:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_9_0
;slice 2 (middle)
reactorchamber_1:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_1_0
reactorchamber_4:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_4_0
reactorchamber_7:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_7_0
reactorchamber_10:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_10_0
;slice 3 (bottom)
reactorchamber_2:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_2_0
reactorchamber_5:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_5_0
reactorchamber_8:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_8_0
reactorchamber_11:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_11_0

reactorchamber1Routine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    hl,reactorchamber_0                         ;starting pose
  ld    b,4                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  .SetSlice2and3:
  ld    l,(iy+7)                            ;take sprite slice 1
  ld    h,(iy+8)
  ld    de,4*04                             ;add 11 sprites (4 bytes per sprite info) to go to slice 2
  add   hl,de
  ld    (iy+7+LenghtObject),l
  ld    (iy+8+LenghtObject),h
  add   hl,de
  ld    (iy+7+LenghtObject*2),l
  ld    (iy+8+LenghtObject*2),h
  ret

reactorchamber2Routine:
  ret

reactorchamber3Routine:
  ret

reactorchamberEventRoutine:
  ld    a,1
  ld    (SkipNPCCollision?),a

  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 

  call  PutConversationCloud
;  call  CheckShowPressTrigAIconHangarBay
;  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   3,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   3,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv018
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.trainingdeck

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.sleepingquarters
  ret

  .sleepingquarters:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,7
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .trainingdeck:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a-20
  ld    (Object1+y),a

  ld    a,5
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

TrainingdeckEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 

  call  PutConversationCloud
  call  CheckShowPressTrigAIcontrainingdeck
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
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

CheckOffLoadResources:
  ld    a,(OffloadResources?)
  dec   a
  ret   m
  ld    (OffloadResources?),a
  cp    10
  ret   nz

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv038
  ld    (NPCConvAddress),hl

  ld    a,1
  ld    (AskRefuelAfterOffLoadResources?),a
  ret

AskRefuelAfterOffLoadResources:
  ld    a,(AskRefuelAfterOffLoadResources?)
  dec   a
  ret   m
  ld    (AskRefuelAfterOffLoadResources?),a

  ;Refuel ?
  ld    hl,(Fuel)
  ld    de,(FuelMax)
  call  CompareHLwithDE
  ret   z

  ;set total credits
  ld    hl,(TotalCredits)
  call  NUM_TO_ASCII
  ld    hl,Ascii5Byte
  ld    de,RefuelTotalCreditsText
  ld    bc,5
  ldir

  ;set total cost missing fuel
  ld    hl,(FuelMax)
  ld    de,(Fuel)
  xor   a
  sbc   hl,de                           ;missing fuel in hl

  push  hl
  pop   bc
  ld    de,AmoungOfFuelPerCredit
  call  DivideBCbyDE                    ; Out: BC = result, HL = rest
  ;cost missing fuel = missing fuel/10
  push  bc
  pop   hl
  call  NUM_TO_ASCII
  ld    hl,Ascii5Byte+2
  ld    de,RefuelCostText
  ld    bc,3
  ldir

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,RefuelConversation
  ld    (NPCConvAddress),hl
  ret

HangarbayEventRoutine:
  call  AskRefuelAfterOffLoadResources
  call  CheckOffLoadResources
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
  call  CheckShowPressTrigAIconHangarBay
  call  .CheckStartDrillingGame
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
  ret

  .CheckStartDrillingGame:
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

  ;Refuel ?
  ld    hl,(Fuel)
  ld    de,(FuelMax)
  call  CompareHLwithDE
  jr    z,.StartDrillingGame  

  ld    a,(AlreadyAskedToRefuel?)
  or    a
  ld    a,1
  ld    (AlreadyAskedToRefuel?),a
  jr    nz,.StartDrillingGame

  ;set total credits
  ld    hl,(TotalCredits)
  call  NUM_TO_ASCII
  ld    hl,Ascii5Byte
  ld    de,RefuelTotalCreditsText
  ld    bc,5
  ldir

  ;set total cost missing fuel
  ld    hl,(FuelMax)
  ld    de,(Fuel)
  xor   a
  sbc   hl,de                           ;missing fuel in hl

  push  hl
  pop   bc
  ld    de,AmoungOfFuelPerCredit
  call  DivideBCbyDE                    ; Out: BC = result, HL = rest
  ;cost missing fuel = missing fuel/10
  push  bc
  pop   hl
  call  NUM_TO_ASCII
  ld    hl,Ascii5Byte+2
  ld    de,RefuelCostText
  ld    bc,3
  ldir

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,RefuelConversation
  ld    (NPCConvAddress),hl
  ret

  .StartDrillingGame:
  ld    a,1
  ld    (DigSiteSelected),a

  ld    a,(AmountOfDigSitesUnlocked)
  dec   a
  jr    nz,.ChooseDrillingLocation
  ld    a,12                                ;drilling game
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret    

  .ChooseDrillingLocation:
  ld    a,14                                ;choose dig site
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret    

  .HandleExplainerConversation:
  ld    hl,ConvEntityShipExplanations
  bit   1,(hl)
  ret   nz  
  call  WaitCenterScreen                    ;this conversation starts when player is near the center of the room
  set   1,(hl)

  ld    a,1
  ld    (StartConversation?),a
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv016
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.hydronponicsbay

  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.trainingdeck
  ret

  .trainingdeck:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,5
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret


  .hydronponicsbay:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,3
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

HangarBayDrillMachiney:   db $54 + 4
HangarBayDrillMachinex:   db 128 
CheckShowPressTrigAIconHangarBay:
  ld    hl,HangarBayDrillMachiney
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

BiopodEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
;  call  CheckShowPressTrigAIconArcadeHall1
;  call  PutPressTrigAIcon
  call  .CheckStartWakeUpEvent

  call  CheckStartConversation              ;out: nz=converstaion starts
  ret   z

  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a

  ld    hl,ConvEntity
  bit   2,(hl)
;  jr    z,.NPCConv015

  .NPCConv014:                              ;execute if ConvGirl bit 0 is set 
  ld    hl,NPCConv014
  ld    (NPCConvAddress),hl
  ret

  .CheckPlayerLeavingRoom:
  ld    a,(Object1+x)
  cp    EdgeRoomLeft+1
  jr    c,.hydroponicsbay

  ld    a,(Object1+x)
  cp    EdgeRoomRight
  jr    nc,.sciencelab
  ret

  .sciencelab:
  ld    a,EnterRoomLeft
  ld    (Object1+x),a
  ld    a,$5a+16
  ld    (Object1+y),a

  ld    a,11
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .hydroponicsbay:
  ld    a,EnterRoomRight
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,3
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .CheckStartWakeUpEvent:
  ld    a,(StartWakeUpEvent?)
  dec   a
  ret   m
  ld    (StartWakeUpEvent?),a

	;set starting coordinates player
	ld		a,050														;y
	ld		(Object1+y),a
	ld		a,224														;x
	ld		(Object1+x),a

	ld		hl,RGettingUp
  ld    (PlayerSpriteStand),hl

	xor		a
	ld		(Object1+var1),a
	ld		(Object1+ObjectPhase),a
  ret













ArcadeHall1redlightPalette:                 ;palette file
  incbin "..\grapx\arcadehall1\arcade1redlight.SC5",$7680+7,32
SirensRoutine:
  ld    a,1
  ld    (freezecontrols?),a

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  jp    z,.Phase0                           ;flicker screenpalette between normal and red, open door, remove red light
  dec   a
  jp    z,.Phase1                           ;host walks towards the vessel
  ret

  .Phase1:                                  ;host walks towards the vessel
  ld    a,1
  ld    (Object2+ObjectPhase),a             ;host phase 1
  ld    (Object2+on?),a                     ;host on
  ld    (Object3+on?),a                     ;wall on
  ld    (iy+on?),0                          ;object off

	;set starting coordinates host (entering through the door)
	ld		a,054														;y
	ld		(Object2+y),a
	ld		a,182														;x
	ld		(Object2+x),a
  ret

  .Phase0:                                  ;flicker screenpalette between normal and red, open door, remove red light
  xor   a
  ld    (Object2+on?),a                     ;host off
  halt                                      ;make sure we switch palette on vblank (and not halfway the screen, since the OpenDoor routine takes more than 1 int)
  call  .AlternatePalette

  ld    a,(iy+Var1)
  inc   a
  ld    (iy+Var1),a
  cp    50+32
  jr    c,.CloseDoor
  cp    82+64+8
  jr    z,.EndPhase0

  .OpenDoor:
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (083*256) + (046/2)
  ld    a,(PageOnNextVblank)                ;set page
  cp    0*32 + 31
  jr    z,.SetOpenDoorPage2
  cp    1*32 + 31
  jr    z,.SetOpenDoorPage3
  cp    2*32 + 31
  jr    z,.SetOpenDoorPage0
  cp    3*32 + 31
  jr    z,.SetOpenDoorPage1

  .SetOpenDoorPage0:
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  ld    de,$0000 + (072*128) + (104/2) - 128
  jp    CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  .SetOpenDoorPage1:
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  ld    de,$8000 + (072*128) + (104/2) - 128
  jp    CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  .SetOpenDoorPage2:
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  ld    de,$0000 + (072*128) + (104/2) - 128
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a
  ret

  .SetOpenDoorPage3:
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  ld    de,$8000 + (072*128) + (104/2) - 128
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a
  ret

  .CloseDoor:
  ld    a,ArcadeHall1GfxBlock     	        ;block to copy graphics from
  ld    hl,$4000 + (066*128) + (100/2) - 128
  ld    de,$0000 + (066*128) + (100/2) - 128
  ld    bc,$0000 + (097*256) + (056/2)
  jp    CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  .AlternatePalette:
  ld    a,(PageOnNextVblank)                ;set page
  cp    2*32 + 31
  jr    c,.SetPalettePage0and1
  .SetPalettePage2and3:
  ld    hl,CurrentPalette
  jp    SetPalette
  .SetPalettePage0and1:
  ld    hl,ArcadeHall1redlightPalette
  jp    SetPalette

  .EndPhase0:                               ;remove red light, go next phase
  ld    (iy+ObjectPhase),1

  ld    a,ArcadeHall1GfxBlock         	    ;block to copy graphics from
  call  RemoveArcadeRedLightsGfxPage0
  ld    a,ArcadeHall1GfxBlock         	    ;block to copy graphics from
  jp		RemoveArcadeRedLightsGfxPage1

RemoveArcadeRedLightsGfxPage0:
  ld    hl,$4000 + (005*128) + (000/2) - 128
  ld    de,$0000 + (005*128) + (000/2) - 128
  ld    bc,$0000 + (030*256) + (256/2)
  jp    CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

RemoveArcadeRedLightsGfxPage1:
  ld    hl,$4000 + (005*128) + (000/2) - 128
  ld    de,$8000 + (005*128) + (000/2) - 128
  ld    bc,$0000 + (030*256) + (256/2)
  jp    CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

BRGame_0:        db    npcsframelistblock, npcsspritedatablock | dw    npcs_8_0
BackRoomGameRoutine:
  ret

Entity_a:   db    entityframelistblock, entityspritedatablock | dw    Entity_0_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_2_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_1_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_2_0

Entity_b:   db    entityframelistblock, entityspritedatablock | dw    Entity_3_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_5_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_4_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_5_0

Entity_c:   db    entityframelistblock, entityspritedatablock | dw    Entity_6_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_8_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_7_0
            db    entityframelistblock, entityspritedatablock | dw    Entity_8_0

EntityaRoutine:
  call  .HandlePhase                        ;used to build up hologram table and set palette

  ld    hl,Entity_a                         ;starting pose
  call  AnimateEntity

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;trig a pressed ?
  ret   z

  ld    a,1
  ld    (StartConversation?),a

  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a

  ld    hl,(TotalMinutesUntilLand)
  ld    a,l
  or    h
  jr    z,.NPCConv013
  ld    hl,ConvEntity
  bit   1,(hl)
  jr    nz,.NPCConv012
  bit   0,(hl)
  jr    nz,.NPCConv011

  .NPCConv010:
  set   0,(hl)
  ld    hl,NPCConv010
  ld    (NPCConvAddress),hl
  ret

  .NPCConv011:                              ;execute if ConvEntity bit 0 is set
  set   1,(hl)
  ld    hl,NPCConv011
  ld    (NPCConvAddress),hl
  ret

  .NPCConv012:                              ;execute if ConvEntity bit 1 is set
; Code to convert total minutes to days, hours, minutes
    ; Load total minutes into HL
  ld    bc,(TotalMinutesUntilLand)            ;4320

  ; Step 1: Calculate days (HL / 1440)
  ld    de,1440 ; DE = 1440 (minutes per day)
  call  DivideBCbyDE                        ; Out: BC = result, HL = rest
  ld    a,c
  add   a,"0"
  ld    (TextLandInDays),a

  push  hl
  pop   bc                 ; bc = rest

  ; Step 2: Calculate hours (remainder / 60)
  ld    de, 60; DE = 60 (minutes per hour)
  call  DivideBCbyDE                        ; Out: BC = result, HL = rest
  ld    a,c
  call  ConvertToAscii                      ;Input: A = value (0-99), ; Output: (AsciiOutput) = tens ASCII, (AsciiOutput+1) = units ASCII
  ld    a,(AsciiOutput+0)
  ld    (TextLandinHours+0),a
  ld    a,(AsciiOutput+1)
  ld    (TextLandinHours+1),a

  ld    a,l
  call  ConvertToAscii                      ;Input: A = value (0-99), ; Output: (AsciiOutput) = tens ASCII, (AsciiOutput+1) = units ASCII
  ld    a,(AsciiOutput+0)
  ld    (TextLandinMinutes+0),a
  ld    a,(AsciiOutput+1)
  ld    (TextLandinMinutes+1),a

  ld    hl,NPCConv012
  ld    (NPCConvAddress),hl
  ret

  .NPCConv013:                              ;execute if ship has landed
  ld    hl,NPCConv013
  ld    (NPCConvAddress),hl
  ld    a,1
  ld    (InitiateWakeUp?),a
  ret

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  ret   nz

	ld		hl,.ArcadeHall2EntityPalette
	call	SetPalette

	ld		hl,.ArcadeHall2EntityPalette
	ld		de,CurrentPalette
	ld		bc,16*2
	ldir  

;MOVE THIS TO ENTITY ROUTINE
	ld		a,1
	ld		(SkipAssignOrder?),a						;we implement a hackjob here. In some cases we don't want to assign order
	xor		a
	ld		(Object1+PutOnFrame),a

  ;change the table to match the entity's hologram
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (164*128) + (078/2) - 128
  ld    bc,$0000 + (019*256) + (094/2)
  ld    a,EntityTableGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (164*128) + (078/2) - 128
  ld    bc,$0000 + (019*256) + (094/2)
  ld    a,EntityTableGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (164*128) + (078/2) - 128
  ld    bc,$0000 + (019*256) + (094/2)
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    a,EntityTableGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (164*128) + (078/2) - 128
  ld    bc,$0000 + (019*256) + (094/2)
  ld    a,EntityTableGfxBlock         	        ;block to copy graphics from
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a

  ld    (iy+ObjectPhase),1
  ret
	.ArcadeHall2EntityPalette:                    	;palette file
  incbin "..\grapx\arcadehall2\arcade2entity.SC5",$7680+7,32

EntitybRoutine:
  ld    hl,Entity_b                         ;starting pose
  jr    AnimateEntity

EntitycRoutine:
  ld    hl,Entity_c                         ;starting pose
  jr    AnimateEntity

AnimateEntity:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    a,(iy+var2)
  inc   a
  ld    (iy+var2),a
  cp    3
  ret   nz
  xor   a
  ld    (iy+var2),a

  ld    b,04                                ;animation steps
  jp    AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

Wall_0:        db    npcsframelistblock, npcsspritedatablock | dw    npcs_7_0
WallMovementRoutine:
  ret

hydroponicsbay_0:        db    hydroponicsbayframelistblock, hydroponicsbayspritedatablock | dw    hydroponicsbay_0_0
hydroponicsbay1Routine:
  ret

hydroponicsbay_1:        db    hydroponicsbayframelistblock, hydroponicsbayspritedatablock | dw    hydroponicsbay_1_0
hydroponicsbay2Routine:
  ret

hydroponicsbay_2:        db    hydroponicsbayframelistblock, hydroponicsbayspritedatablock | dw    hydroponicsbay_2_0
hydroponicsbay3Routine:
  ret

hangarbay_0:        db    hangarbayframelistblock, hangarbayspritedatablock | dw    hangarbay_0_0
hangarbay1Routine:
  ret

hangarbay_1:        db    hangarbayframelistblock, hangarbayspritedatablock | dw    hangarbay_1_0
hangarbay2Routine:
  ret

hangarbay_2:        db    hangarbayframelistblock, hangarbayspritedatablock | dw    hangarbay_2_0
hangarbay3Routine:
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


armoryvault_0:        db    armoryvaultframelistblock, armoryvaultspritedatablock | dw    armoryvault_0_0
armoryvault1Routine:
  ret

medicalbay_0:        db    medicalbayframelistblock, medicalbayspritedatablock | dw    medicalbay_0_0
medicalbay1Routine:
  ret

medicalbay_1:        db    medicalbayframelistblock, medicalbayspritedatablock | dw    medicalbay_1_0
medicalbay2Routine:
  ret

;slice 1
OpenholodeckDoor:
holodeck_0:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_0_0
.holodeck_2:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_2_0
.holodeck_4:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_4_0
.holodeck_6:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_6_0
.holodeck_8:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_8_0
.holodeck_10:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_10_0
.holodeck_12:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_12_0
.holodeck_14:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_14_0
.holodeck_16:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_16_0
.holodeck_18:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_18_0
holodeck_20:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_20_0

;slice 2
holodeck_1:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_1_0
.holodeck_3:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_3_0
.holodeck_5:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_5_0
.holodeck_7:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_7_0
.holodeck_9:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_9_0
.holodeck_11:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_11_0
.holodeck_13:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_13_0
.holodeck_15:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_15_0
.holodeck_17:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_17_0
.holodeck_19:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_19_0
.holodeck_21:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_21_0

;slice 1
CloseholodeckDoor:
.holodeck_20:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_20_0
.holodeck_18:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_18_0
.holodeck_16:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_16_0
.holodeck_14:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_14_0
.holodeck_12:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_12_0
.holodeck_10:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_10_0
.holodeck_8:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_8_0
.holodeck_6:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_6_0
.holodeck_4:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_4_0
.holodeck_2:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_2_0
.holodeck_0:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_0_0

;slice 2
.holodeck_21:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_21_0
.holodeck_19:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_19_0
.holodeck_17:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_17_0
.holodeck_15:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_15_0
.holodeck_13:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_13_0
.holodeck_11:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_11_0
.holodeck_9:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_9_0
.holodeck_7:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_7_0
.holodeck_5:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_5_0
.holodeck_3:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_3_0
.holodeck_1:        db    holodeckframelistblock, holodeckspritedatablock | dw    holodeck_1_0


holodeck1Routine:
  ld    a,1
  ld    (SkipNPCCollision?),a

  call  .OpenOrCloseDoorWhenEnteringRoom    ;once set door open when coming from the left or close when coming from the right
  call  .ShouldWeOpenOrCloseDoor?

  ld    a,(iy+var2)                         ;0=no action, ,1=open door, 2=close door 
  or    a
  ret   z
  dec   a
  jr    z,.OpenDoor

  .CloseDoor:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
  ld    hl,CloseholodeckDoor                ;starting pose
  ld    b,11                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1
  call  .SetSlice2

	ld		a,(iy+var1)
  cp    10
  ret   nz
  ld    (iy+var2),0                         ;0=no action, ,1=open door, 2=close door   
  ret

  .OpenDoor:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
  ld    hl,OpenholodeckDoor                         ;starting pose
  ld    b,11                                ;animation steps
  call  AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1
  call  .SetSlice2

	ld		a,(iy+var1)
  cp    10
  ret   nz
  ld    (iy+var2),0                         ;0=no action, ,1=open door, 2=close door   
  ret

  .ShouldWeOpenOrCloseDoor?:
  ld    a,(iy+var2)                         ;0=no action, ,1=open door, 2=close door 
  or    a
  ret   nz

  ld    a,(Object1+x)
  cp    100
  jr    c,.Open

  .Close:
  ld    l,(iy+7)                            ;current sprite in hl
  ld    h,(iy+8)
  ld    de,CloseholodeckDoor.holodeck_0                       ;sprite door completely closed
  call  CompareHLwithDE
  ret   z                                   ;return if already closed
  ld    (iy+var2),2                         ;0=no action, ,1=open door, 2=close door 
  ret

  .Open:
  ld    l,(iy+7)                            ;current sprite in hl
  ld    h,(iy+8)
  ld    de,holodeck_20                      ;sprite door completely open
  call  CompareHLwithDE
  ret   z                                   ;return if already open
  ld    (iy+var2),1                         ;0=no action, ,1=open door, 2=close door 
  ret

  .SetSlice2:
  ld    l,(iy+7)                            ;take sprite slice 1
  ld    h,(iy+8)
  ld    de,4*11                             ;add 11 sprites (4 bytes per sprite info) to go to slice 2
  add   hl,de
  ld    (iy+7+LenghtObject),l
  ld    (iy+8+LenghtObject),h
  ret

  .OpenOrCloseDoorWhenEnteringRoom:
  bit   0,(iy+var3)
  set   0,(iy+var3)
  ret   nz

  ld    hl,holodeck_20                      ;sprite door completely open
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable
  call  .SetSlice2

  ld    a,(Object1+x)
  cp    100
  ret   c

  ld    hl,CloseholodeckDoor.holodeck_0     ;sprite door completely closed
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable
  call  .SetSlice2

holodeck2Routine:
  ret

Biopod_0:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_0_0
BioPod1Routine:
  ret

Biopod_1:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_1_0
BioPod2Routine:
  ret

Biopod_2:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_2_0
Biopod_3:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_3_0
Biopod_4:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_2_0
Biopod_5:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_4_0
Biopod_6:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_4_0
Biopod_7:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_4_0
Biopod_8:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_4_0
Biopod_9:        db    biopodframelistblock, biopodspritedatablock | dw    biopod_4_0
BioPodBlinkingLightRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   7
  ret   nz

  ld    hl,Biopod_2                         ;starting pose
  ld    b,08                                ;animation steps
  jp    AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

Girlidle_0:        db    npcsframelistblock, npcsspritedatablock | dw    npcs_0_0
GirlMovementRoutine:
  ld    a,(GamesPlayed)                     ;The Capgirl appears if games played > 3
  cp    2
  jr    nc,.GirlAppears
  ld    (iy+0),0                            ;on ?
  ret
  .GirlAppears:

  ld    hl,Girlidle_0
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  call  CheckStartConversation              ;out: nz=converstaion starts
  ret   z

  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a

  ld    hl,ConvGirl
  bit   0,(hl)
  jr    z,.NPCConv001

  .NPCConv002:                              ;execute if ConvGirl bit 0 is set 
  ld    hl,NPCConv002
  ld    (NPCConvAddress),hl
  ret

  .NPCConv001:                              ;execute if ConvGirl bit 0 is not set. sets ConvGirl bit 0 
  set   0,(hl)
  ld    hl,NPCConv001
  ld    (NPCConvAddress),hl
  ret

CapGirlidle_0:        db    npcsframelistblock, npcsspritedatablock | dw    npcs_5_0
CapGirlMovementRoutine:
  ld    a,(GamesPlayed)                     ;The Capgirl appears if games played > 3
  cp    4
  jr    nc,.CapGirlAppears
  ld    (iy+0),0                            ;on ?
  ret
  .CapGirlAppears:

  ld    hl,CapGirlidle_0
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  call  CheckStartConversation              ;out: nz=converstaion starts
  ret   z

  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a

  ld    hl,ConvCapGirl
  bit   0,(hl)
  jr    z,.NPCConv003
  ld    a,(GamesPlayed)                     ;check if games played > 6
  cp    7
  jr    c,.NPCConv003
  bit   1,(hl)
  jr    z,.NPCConv004

  .NPCConv005:                              ;execute if ConvCapGirl bit 1 is set (and games played > 6)
  ld    hl,NPCConv005
  ld    (NPCConvAddress),hl
  ret

  .NPCConv004:                              ;execute if ConvCapGirl bit 0 is set and games played > 6. sets ConvGirl bit 1
  set   1,(hl)
  ld    hl,NPCConv004
  ld    (NPCConvAddress),hl
  ret

  .NPCConv003:                              ;execute if ConvCapGirl bit 0 is not set. sets ConvGirl bit 0
  set   0,(hl)
  ld    hl,NPCConv003
  ld    (NPCConvAddress),hl
  ret

RedHeadBoyidle_0:        db    npcsframelistblock, npcsspritedatablock | dw    npcs_3_0
RedHeadBoyMovementRoutine:
  ld    a,(GamesPlayed)                     ;The red head boy appears if games played > 8
  cp    9
  jr    nc,.RedHeadBoyAppears
  ld    (iy+0),0                            ;on ?
  ret
  .RedHeadBoyAppears:

  ld    hl,RedHeadBoyidle_0
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  call  CheckStartConversation              ;out: nz=converstaion starts
  ret   z

  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv006
  ld    (NPCConvAddress),hl
  ret

CheckStartConversation:
  call  CheckPlayerNear                     ;check if player is standing near NPC. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z

  ld    a,1
  ld    (ShowConversationCloud?),a
  ld    a,(iy+y)
  ld    (Cloudy),a
  ld    a,(iy+x)
  ld    (Cloudx),a

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;trig a pressed ?
  ret   z
  ld    a,1
  ld    (StartConversation?),a
  ret

CheckPlayerNear:                            ;out ;d=0(no collision), d=1(collision)
  ld    d,0                                 ;0=no collision, 1=collision
  ld    hl,Object1                          ;player

  inc   hl                                  ;y player
  .CheckBottomSide:                         ;check collision bottom side
  ld    a,(hl)
  add   a,12
  cp    (iy+1)                              ;y npc
  ret   c
  .CheckTopSide:                            ;check collision top  side
  sub   a,21
  cp    (iy+1)                              ;y npc
  ret   nc

  inc   hl                                  ;x player
  .CheckRightSide:                          ;check collision right side
  ld    a,(hl)
  add   a,42
  jr    c,.CheckLeftSide
  cp    (iy+2)                              ;x npc
  ret   c
  .CheckLeftSide:                           ;check collision left side

  ld    a,(hl)
  sub   a,42
  jr    c,.collision
  cp    (iy+2)                              ;x npc
  ret   nc

  .collision:
  ld    d,1                                 ;d=0(no collision), d=1(collision)
  ret














































SetHudDrillingGame:
  ld    a,DrillingGameHudBlock         	;block to copy graphics from
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (030*256) + (256/2)
  jp    CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

BuildUpMapDrillingGame:
  ;we have tilemap at $8000 in ram, and the tiles are stored in page 3 in vram
  ld    a,(slot.page1rom)              	;all RAM except page 1+2
  out   ($a8),a    

  ld    a,32
  ld    (CopyTileDrillingGame+ny),a         ;next row
  xor   a
  ld    (CopyTileDrillingGame+dx),a         ;dx
  ld    (CopyTileDrillingGame+dy),a         ;dy

  ld    de,$8000 + (00 * 8)
  ld    b,64
  .PutTileLoop:
  push  bc
  call  .PutTile
  pop   bc
  djnz  .PutTileLoop
  ret

  .PutTile:
  ld    a,(de)
  and   %0000 0111
  add   a,a                                 ;*2
  add   a,a                                 ;*4
  add   a,a                                 ;*8
  add   a,a                                 ;*16
  add   a,a                                 ;*32
  ld    (CopyTileDrillingGame+sx),a

  ld    a,(de)
  and   %1111 1000
  add   a,a                                 ;*16
  add   a,a                                 ;*32
  ld    (CopyTileDrillingGame+sy),a

  ld    hl,CopyTileDrillingGame
  call  DoCopy

  inc   de                                  ;next tile in ram
  ld    a,(CopyTileDrillingGame+dx)
  add   a,32
  ld    (CopyTileDrillingGame+dx),a         ;next column
  ret   nz
  ld    a,(CopyTileDrillingGame+dy)
  add   a,32
  ld    (CopyTileDrillingGame+dy),a         ;next row
  ret

;sprcoladdr:		equ	$7400 - $74e0 (y=232 - 234)
;sprattaddr:		equ	$7600
;sprcharaddr:	equ	$7800 - $79c0 (y=240 - 244)

DrillCharacterSprites:
incbin "..\grapx\drillinggame\maps\sprconv FOR SINGLE SPRITES\drillspritespart1.spr",0,(14 * 6 * 32)
incbin "..\grapx\drillinggame\maps\sprconv FOR SINGLE SPRITES\drillspritespart2.spr",0,(14 * 6 * 32)

DrillColorsFacingRight:
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  14,1 | ds 2,6 | ds 14,2+64 | ds 2,13+64 | ds  14,12+64 | ds 2,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,6 | ds 16,13+64

DrillColorsFacingLeftWith32bitshift:
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  14,1 | ds 2,6 | ds 14,2+64 | ds 2,13+64 | ds  14,12+64 | ds 2,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,6+128 | ds 16,13+64+128

DrillColorsFacingDown:
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  2,6 | ds 14,1 | ds 2,13+64 | ds 14,2+64 | ds 2,14 | ds  14,12+64
ds  16,6 | ds 16,13+64

DrillColorsFacingUp:
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  16,1 | ds 16,2+64 | ds  16,12+64
ds  14,1 | ds 2,6 | ds 14,2+64 | ds 2,13+64 | ds 14,12+64 | ds  2,14
ds  16,6 | ds 16,13+64

PutSpatDrillMachineSprite:
  ld    a,(DrillMachineFaceDirection)       ;1=up, 2=right, 3=down, 4=left
  dec   a
  jp    z,.PutSpatFacingUp
  dec   a
  jp    z,.PutSpatFacingRight
  dec   a
  jp    z,.PutSpatFacingDown
  .PutSpatFacingLeft:
  ld    a,(DrillMachineYRelative)
  ld    (spat+(4*000)+0),a
  ld    (spat+(4*001)+0),a
  ld    (spat+(4*002)+0),a
  ld    a,(DrillMachineX)
  add   a,16 + 2
  ld    (spat+(4*000)+1),a
  ld    (spat+(4*001)+1),a
  ld    (spat+(4*002)+1),a

  ld    a,(DrillMachineYRelative)
  ld    (spat+(4*003)+0),a
  ld    (spat+(4*004)+0),a
  ld    (spat+(4*005)+0),a
  ld    a,(DrillMachineX)
  add   a,2
  ld    (spat+(4*003)+1),a
  ld    (spat+(4*004)+1),a
  ld    (spat+(4*005)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16
  ld    (spat+(4*006)+0),a
  ld    (spat+(4*007)+0),a
  ld    (spat+(4*008)+0),a
  ld    a,(DrillMachineX)
  add   a,16 + 2
  ld    (spat+(4*006)+1),a
  ld    (spat+(4*007)+1),a
  ld    (spat+(4*008)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16
  ld    (spat+(4*009)+0),a
  ld    (spat+(4*010)+0),a
  ld    (spat+(4*011)+0),a
  ld    a,(DrillMachineX)
  add   a,2
  ld    (spat+(4*009)+1),a
  ld    (spat+(4*010)+1),a
  ld    (spat+(4*011)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,08
  ld    (spat+(4*012)+0),a
  ld    (spat+(4*013)+0),a
  ld    a,(DrillMachineX)
  sub   a,16 - 2 - 32 ;apply 32 bit shift
  ld    (spat+(4*012)+1),a
  ld    (spat+(4*013)+1),a
	ret

  .PutSpatFacingDown:
  ld    a,(DrillMachineYRelative)
  sub   a,3
  ld    (spat+(4*000)+0),a
  ld    (spat+(4*001)+0),a
  ld    (spat+(4*002)+0),a
  ld    a,(DrillMachineX)
  ld    (spat+(4*000)+1),a
  ld    (spat+(4*001)+1),a
  ld    (spat+(4*002)+1),a

  ld    a,(DrillMachineYRelative)
  sub   a,3
  ld    (spat+(4*003)+0),a
  ld    (spat+(4*004)+0),a
  ld    (spat+(4*005)+0),a
  ld    a,(DrillMachineX)
  add   a,16
  ld    (spat+(4*003)+1),a
  ld    (spat+(4*004)+1),a
  ld    (spat+(4*005)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16 - 3
  ld    (spat+(4*006)+0),a
  ld    (spat+(4*007)+0),a
  ld    (spat+(4*008)+0),a
  ld    a,(DrillMachineX)
  ld    (spat+(4*006)+1),a
  ld    (spat+(4*007)+1),a
  ld    (spat+(4*008)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16 - 3
  ld    (spat+(4*009)+0),a
  ld    (spat+(4*010)+0),a
  ld    (spat+(4*011)+0),a
  ld    a,(DrillMachineX)
  add   a,16
  ld    (spat+(4*009)+1),a
  ld    (spat+(4*010)+1),a
  ld    (spat+(4*011)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,31 - 3
  ld    (spat+(4*012)+0),a
  ld    (spat+(4*013)+0),a
  ld    a,(DrillMachineX)
  add   a,8
  ld    (spat+(4*012)+1),a
  ld    (spat+(4*013)+1),a
	ret

  .PutSpatFacingRight:
  ld    a,(DrillMachineX)
  or    a
  jp    z,.PutSpatFacingRightXequals0

  ld    a,(DrillMachineYRelative)
  ld    (spat+(4*000)+0),a
  ld    (spat+(4*001)+0),a
  ld    (spat+(4*002)+0),a
  ld    a,(DrillMachineX)
  dec   a
  ld    (spat+(4*000)+1),a
  ld    (spat+(4*001)+1),a
  ld    (spat+(4*002)+1),a

  ld    a,(DrillMachineYRelative)
  ld    (spat+(4*003)+0),a
  ld    (spat+(4*004)+0),a
  ld    (spat+(4*005)+0),a
  ld    a,(DrillMachineX)
  add   a,16 - 1
  ld    (spat+(4*003)+1),a
  ld    (spat+(4*004)+1),a
  ld    (spat+(4*005)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16
  ld    (spat+(4*006)+0),a
  ld    (spat+(4*007)+0),a
  ld    (spat+(4*008)+0),a
  ld    a,(DrillMachineX)
  dec   a
  ld    (spat+(4*006)+1),a
  ld    (spat+(4*007)+1),a
  ld    (spat+(4*008)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16
  ld    (spat+(4*009)+0),a
  ld    (spat+(4*010)+0),a
  ld    (spat+(4*011)+0),a
  ld    a,(DrillMachineX)
  add   a,16 - 1
  ld    (spat+(4*009)+1),a
  ld    (spat+(4*010)+1),a
  ld    (spat+(4*011)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,08
  ld    (spat+(4*012)+0),a
  ld    (spat+(4*013)+0),a
  ld    a,(DrillMachineX)
  add   a,32 - 1
  ld    (spat+(4*012)+1),a
  ld    (spat+(4*013)+1),a
	ret

  .PutSpatFacingRightXequals0:
  ld    a,(DrillMachineYRelative)
  ld    (spat+(4*000)+0),a
  ld    (spat+(4*001)+0),a
  ld    (spat+(4*002)+0),a
  ld    a,(DrillMachineX)
;  dec   a
  ld    (spat+(4*000)+1),a
  ld    (spat+(4*001)+1),a
  ld    (spat+(4*002)+1),a

  ld    a,(DrillMachineYRelative)
  ld    (spat+(4*003)+0),a
  ld    (spat+(4*004)+0),a
  ld    (spat+(4*005)+0),a
  ld    a,(DrillMachineX)
  add   a,16 ;- 1
  ld    (spat+(4*003)+1),a
  ld    (spat+(4*004)+1),a
  ld    (spat+(4*005)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16
  ld    (spat+(4*006)+0),a
  ld    (spat+(4*007)+0),a
  ld    (spat+(4*008)+0),a
  ld    a,(DrillMachineX)
;  dec   a
  ld    (spat+(4*006)+1),a
  ld    (spat+(4*007)+1),a
  ld    (spat+(4*008)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16
  ld    (spat+(4*009)+0),a
  ld    (spat+(4*010)+0),a
  ld    (spat+(4*011)+0),a
  ld    a,(DrillMachineX)
  add   a,16 ;- 1
  ld    (spat+(4*009)+1),a
  ld    (spat+(4*010)+1),a
  ld    (spat+(4*011)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,08
  ld    (spat+(4*012)+0),a
  ld    (spat+(4*013)+0),a
  ld    a,(DrillMachineX)
  add   a,32 ;- 1
  ld    (spat+(4*012)+1),a
  ld    (spat+(4*013)+1),a
	ret


  .PutSpatFacingUp:
  ld    a,(DrillMachineYRelative)
  add   a,16 + 1
  ld    (spat+(4*000)+0),a
  ld    (spat+(4*001)+0),a
  ld    (spat+(4*002)+0),a
  ld    a,(DrillMachineX)
  ld    (spat+(4*000)+1),a
  ld    (spat+(4*001)+1),a
  ld    (spat+(4*002)+1),a

  ld    a,(DrillMachineYRelative)
  add   a,16 + 1
  ld    (spat+(4*003)+0),a
  ld    (spat+(4*004)+0),a
  ld    (spat+(4*005)+0),a
  ld    a,(DrillMachineX)
  add   a,16
  ld    (spat+(4*003)+1),a
  ld    (spat+(4*004)+1),a
  ld    (spat+(4*005)+1),a

  ld    a,(DrillMachineYRelative)
  inc   a
  ld    (spat+(4*006)+0),a
  ld    (spat+(4*007)+0),a
  ld    (spat+(4*008)+0),a
  ld    a,(DrillMachineX)
  ld    (spat+(4*006)+1),a
  ld    (spat+(4*007)+1),a
  ld    (spat+(4*008)+1),a

  ld    a,(DrillMachineYRelative)
  inc   a
  ld    (spat+(4*009)+0),a
  ld    (spat+(4*010)+0),a
  ld    (spat+(4*011)+0),a
  ld    a,(DrillMachineX)
  add   a,16
  ld    (spat+(4*009)+1),a
  ld    (spat+(4*010)+1),a
  ld    (spat+(4*011)+1),a

  ld    a,(DrillMachineYRelative)
  sub   a,15 - 1
  ld    (spat+(4*012)+0),a
  ld    (spat+(4*013)+0),a
  ld    a,(DrillMachineX)
  add   a,8
  ld    (spat+(4*012)+1),a
  ld    (spat+(4*013)+1),a
	ret

PutDrillMachineCharacterAndColorData:
  ld    a,(framecounter2)
  bit   0,a
  ret   z

  call  .SetAnimationFrame
  call  .CheckDrillingMachineDirection
  call  .LoadSpriteCharacterAndColorData
  ret

  .SetAnimationFrame:
  ld    a,(DrillMachineAnimationCounter)
  inc   a
  ld    (DrillMachineAnimationCounter),a
  cp    3*3
  ret   nz
  xor   a
  ld    (DrillMachineAnimationCounter),a
  ret

  .CheckDrillingMachineDirection:
  ld    a,(DrillMachineAnimationCounter)
  cp    1*3
  ld    bc,0 * 14 * 32
  jr    c,.AnimationFrameSet
  cp    2*3
  ld    bc,1 * 14 * 32
  jr    c,.AnimationFrameSet
  ld    bc,2 * 14 * 32
  .AnimationFrameSet:
  ld    a,(DrillMachineFaceDirection)       ;1=up, 2=right, 3=down, 4=left
  dec   a
  jr    z,.Up
  dec   a
  jr    z,.Right
  dec   a
  jr    z,.Down
  .Left:
  ld    hl,DrillCharacterSprites + (3 * 14 * 32)
  ld    de,DrillColorsFacingLeftWith32bitshift
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  cp    8
  jr    z,.GoAnimateLeft
  cp    4
  ret   nz
  .GoAnimateLeft:
  add   hl,bc
  ret
  .Down:
  ld    hl,DrillCharacterSprites + (6 * 14 * 32)
  ld    de,DrillColorsFacingDown
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  cp    7
  jr    z,.GoAnimateDown
  cp    3
  ret   nz
  .GoAnimateDown:
  add   hl,bc
  ret
  .Right:
  ld    hl,DrillCharacterSprites + (0 * 14 * 32)
  ld    de,DrillColorsFacingRight
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  cp    6
  jr    z,.GoAnimateRight
  cp    2
  ret   nz
  .GoAnimateRight:
  add   hl,bc
  ret
  .Up:
  ld    hl,DrillCharacterSprites + (9 * 14 * 32)
  ld    de,DrillColorsFacingUp
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  cp    5
  jr    z,.GoAnimateUp
  cp    1
  ret   nz
  .GoAnimateUp:
  add   hl,bc
  ret

;sprcoladdr:		equ	$7400 - $74e0 (y=232 - 234)
;sprattaddr:		equ	$7600
;sprcharaddr:	equ	$7800 - $79c0 (y=240 - 244)

.LoadSpriteCharacterAndColorData:
;load sprites data
  exx

	xor		a				;page 0/1
	ld		hl,sprcharaddr	;sprite 0 character table in VRAM
	call	SetVdp_Write

  exx
	ld		c,$98
	call	outix256		;write sprite character to vram
	call	outix192		;write sprite character to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ex    de,hl
	ld		c,$98
	call	outix224		;write sprite color of pointer and hand to vram
  ret

MoveDrillMachine:
  call  CheckChangeDrillMovementDirection
  call  MoveDrillInItsDirection
  ret

ConvertDrillingLeftTileWeCameFrom:
  ;at this point we have drilled for a few frames. this also means we have moved some pixels to the left
  ;check 16 pixels left of drill machine and 16 pixels right of drill machine. replace those tiles with the appropriate tiles
  ld    de,+0                                       ;y increase
  ld    b,+16                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    08,06,02,07,12,10,06,07
  db    08,11,10,11,12,15,02,15

ConvertDrillingLeftTileWeMoveTo:
  dec   hl

  call  CheckResourceCollected

  ld    a,(DrillingHigherLevelSoil?)
  or    a
  jr    z,.EndCheckHigherLevelSoil
  ld    (hl),15
  ret

  .EndCheckHigherLevelSoil:
  ld    a,(hl)
  cp    15
  jp    c,.WeMoveToAlreadyPassableTerrain
  ld    (hl),0
  ret
  .WeMoveToAlreadyPassableTerrain:
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    00,05,08,04,04,05,10,12
  db    08,13,10,15,12,13,00,15
  ret

ConvertDrillingRightTileWeCameFrom:
  ;at this point we have drilled for a few frames. this also means we have moved some pixels to the left
  ;check 16 pixels left of drill machine and 16 pixels right of drill machine. replace those tiles with the appropriate tiles
  ld    de,+0                                       ;y increase
  ld    b,+16                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    00,05,08,04,05,06,10,12
  db    08,13,10,15,12,13,00,15

CheckResourceCollected:
  push  hl
  call  .Checktile
  pop   hl
  ret

  .Checktile:
  ld    e,(hl)                                      ;tilenr
  ld    d,0
  ld    hl,.TileResourceConversionTable
  add   hl,de
  ld    a,(hl)
  or    a
  ret   z

  ld    hl,(Storage)
  ld    de,(StorageMax)
  or    a
  sbc   hl,de
  ret   nc

  ld    hl,(Storage)
  inc   hl
  ld    (Storage),hl

  dec   a
  jr    z,.Level1
  dec   a
  jr    z,.Level2
  dec   a
  jr    z,.Level3
  dec   a
  jr    z,.Level4
  dec   a
  jr    z,.Level5
  dec   a
  jr    z,.Level6

  .Level7:
  ld    hl,(Level7Resources)
  inc   hl
  ld    (Level7Resources),hl
  ret
  .Level6:
  ld    hl,(Level6Resources)
  inc   hl
  ld    (Level6Resources),hl
  ret
  .Level5:
  ld    hl,(Level5Resources)
  inc   hl
  ld    (Level5Resources),hl
  ret
  .Level4:
  ld    hl,(Level4Resources)
  inc   hl
  ld    (Level4Resources),hl
  ret
  .Level3:
  ld    hl,(Level3Resources)
  inc   hl
  ld    (Level3Resources),hl
  ret
  .Level2:
  ld    hl,(Level2Resources)
  inc   hl
  ld    (Level2Resources),hl
  ret
  .Level1:
  ld    hl,(Level1Resources)
  inc   hl
  ld    (Level1Resources),hl
  ret

  .TileResourceConversionTable:
  db  0,0,0,0, 0,0,0,0
  db  0,0,0,0, 0,0,0,0
  db  0,1,2,3, 4,5,6,7
  db  0,0,0,0, 0,0,2,3

  db  4,5,6,7, 0,0,0,0
  db  0,0,3,4, 5,6,7,0
  db  0,0,0,0, 0,4,5,6
  db  7,0,0,0, 0,0,0,0

ConvertDrillingRightTileWeMoveTo:
  inc   hl

  call  CheckResourceCollected

  ld    a,(DrillingHigherLevelSoil?)
  or    a
  jr    z,.EndCheckHigherLevelSoil
  ld    (hl),15
  ret

  .EndCheckHigherLevelSoil:
  ld    a,(hl)
  cp    15
  jp    c,.WeMoveToAlreadyPassableTerrain
  ld    (hl),2
  ret
  .WeMoveToAlreadyPassableTerrain:
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    08,06,08,07,12,10,06,07
  db    08,11,10,11,12,15,02,15
  ret

ConvertDrillingUpTileWeCameFrom:
  ;at this point we have drilled for a few frames. this also means we have moved some pixels to the left
  ;check 16 pixels left of drill machine and 16 pixels right of drill machine. replace those tiles with the appropriate tiles
  ld    de,+16                                      ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    04,09,07,03,04,13,11,07
  db    12,09,15,11,12,13,03,15

ConvertDrillingUpTileWeMoveTo:
  ld    de,-8
  add   hl,de

  call  CheckResourceCollected

  ld    a,(DrillingHigherLevelSoil?)
  or    a
  jr    z,.EndCheckHigherLevelSoil
  ld    (hl),15
  ret

  .EndCheckHigherLevelSoil:
  ld    a,(hl)
  cp    15
  jp    c,.WeMoveToAlreadyPassableTerrain
  ld    (hl),1
  ret
  .WeMoveToAlreadyPassableTerrain:
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    05,01,06,09,13,05,06,11
  db    10,09,10,11,15,13,01,15
  ret

ConvertDrillingDownTileWeCameFrom:
  ;at this point we have drilled for a few frames. this also means we have moved some pixels to the left
  ;check 16 pixels left of drill machine and 16 pixels right of drill machine. replace those tiles with the appropriate tiles
  ld    de,+00                                      ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    05,01,06,09,13,05,06,11
  db    10,09,10,11,15,13,01,15

ConvertDrillingDownTileWeMoveTo:
  ld    de,8
  add   hl,de

  call  CheckResourceCollected

  ld    a,(DrillingHigherLevelSoil?)
  or    a
  jr    z,.EndCheckHigherLevelSoil
  ld    (hl),15
  ret

  .EndCheckHigherLevelSoil:
  ld    a,(hl)
  cp    15
  jp    c,.WeMoveToAlreadyPassableTerrain
  ld    (hl),3
  ret
  .WeMoveToAlreadyPassableTerrain:
  ld    d,0
  ld    e,a
  push  hl
  ld    hl,.TileConversionDrillingLeft
  add   hl,de
  ld    a,(hl)
  pop   hl
  ld    (hl),a                                      ;change tile in tilemap (we have drilled here, tile now is passable)
  ret
  .TileConversionDrillingLeft:
  db    04,09,07,03,04,13,11,07
  db    12,09,15,11,12,13,03,15
  ret

ReduceFuelWhenMoving:
  ld    a,(framecounter2)
  and   31
  ret   nz

  ld    hl,(Fuel)
  dec   hl
  ld    (Fuel),hl
  ret

ReduceAdditionalFuelWhenDrilling:
  push  hl
  ld    hl,(Fuel)
  dec   hl
  ld    (Fuel),hl
  pop   hl
  ret

MoveDrillInItsDirection:
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  or    a
  ret   z
  dec   a
  jp    z,.MoveUp
  dec   a
  jp    z,.MoveRight
  dec   a
  jp    z,.MoveDown
  dec   a
  jp    z,.MoveLeft
  dec   a
  jp    z,.DrillingUp
  dec   a
  jp    z,.DrillingRight
  dec   a
  jp    z,.DrillingDown
  dec   a
  jp    z,.DrillingLeft
  ret

  .DrillingDown:
  ld    a,3
  ld    (DrillMachineFaceDirection),a               ;1=up, 2=right, 3=down, 4=left

  ld    a,(DrillingTime)
  and   7
  jr    nz,.EndCheckMoveDownWhileDrilling
  ld    hl,(DrillMachineY)
  inc   hl
  ld    (DrillMachineY),hl
  .EndCheckMoveDownWhileDrilling:

  Call  HandleDrillingTime                          ;out: z=finished drilling
  ret   nz

  call  ConvertDrillingDownTileWeCameFrom
  call  ConvertDrillingDownTileWeMoveTo

  ld    de,+0                                       ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+00                                       ;y increase0
  ld    b,+00                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    de,+32                                      ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+32                                       ;y increase
  ld    b,+00                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    a,3
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .DrillingUp:
  ld    a,1
  ld    (DrillMachineFaceDirection),a       ;1=up, 2=right, 3=down, 4=left

  ld    a,(DrillingTime)
  and   7
  jr    nz,.EndCheckMoveUpWhileDrilling
  ld    hl,(DrillMachineY)
  dec   hl
  ld    (DrillMachineY),hl
  .EndCheckMoveUpWhileDrilling:

  Call  HandleDrillingTime                          ;out: z=finished drilling
  ret   nz

  call  ConvertDrillingUpTileWeCameFrom
  call  ConvertDrillingUpTileWeMoveTo

  ld    de,+0                                       ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+00                                       ;y increase0
  ld    b,+00                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    de,+16                                      ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+16                                       ;y increase
  ld    b,+00                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    a,1
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .DrillingRight:
  ld    a,2
  ld    (DrillMachineFaceDirection),a               ;1=up, 2=right, 3=down, 4=left

  ld    a,(DrillMachineX)
  cp    256-32
  jp    z,.EdgeOfScreenReached

  ld    a,(DrillingTime)
  and   7
  jr    nz,.EndCheckMoveRightWhileDrilling
  ld    a,(DrillMachineX)
  inc   a
  ld    (DrillMachineX),a
  .EndCheckMoveRightWhileDrilling:

  Call  HandleDrillingTime                          ;out: z=finished drilling
  ret   nz

  call  ConvertDrillingRightTileWeCameFrom
  call  ConvertDrillingRightTileWeMoveTo

  ld    de,+0                                       ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+00                                       ;y increase0
  ld    b,+00                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    de,+0                                       ;y increase
  ld    b,+32                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+00                                       ;y increase
  ld    b,+32                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    a,2
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .EdgeOfScreenReached:
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .DrillingLeft:
  ld    a,4
  ld    (DrillMachineFaceDirection),a               ;1=up, 2=right, 3=down, 4=left

  ld    a,(DrillMachineX)
  or    a
  jp    z,.EdgeOfScreenReached

  ld    a,(DrillingTime)
  and   7
  jr    nz,.EndCheckMoveLeftWhileDrilling
  ld    a,(DrillMachineX)
  dec   a
  ld    (DrillMachineX),a
  .EndCheckMoveLeftWhileDrilling:

  Call  HandleDrillingTime                          ;out: z=finished drilling
  ret   nz

  call  ConvertDrillingLeftTileWeCameFrom
  call  ConvertDrillingLeftTileWeMoveTo

  ld    de,+0                                       ;y increase
  ld    b,-16                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+00                                       ;y increase0
  ld    b,-16                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    de,+0                                       ;y increase
  ld    b,+16                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
  ld    c,+00                                       ;y increase
  ld    b,+16                                       ;x increase
  call  PutTileInScreen                             ;in: a=tilenr, c=y increase, b=x increase

  ld    a,4
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .MoveDown:
  ld    a,3
  ld    (DrillMachineFaceDirection),a               ;1=up, 2=right, 3=down, 4=left
  call  ReduceFuelWhenMoving                        ;when moving you lose fuel depending on drillmachinespeed
  ld    hl,(DrillMachineY)
  ld    de,(DrillMachineSpeed)
  add   hl,de
  ld    (DrillMachineY),hl
  ;we perform a check to see if the y has crossed the 32 pixels per tile boundary
  ld    a,(DrillMachineY)
  and   %0001 1111
  sub   a,e
  bit   7,a
  ret   z
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
  ;no need to snap to the tile if we keep going down
	ld		a,(Controls)
	bit		1,a           ;cursor down pressed ?
;  ret   nz
  jp    nz,CheckChangeDrillMovementDirection.GoSetDown
  ;snap to the tile
  ld    a,l
  and   %1110 0000
  ld    (DrillMachineY),hl
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .MoveUp:
  ld    a,1
  ld    (DrillMachineFaceDirection),a       ;1=up, 2=right, 3=down, 4=left
  call  ReduceFuelWhenMoving                        ;when moving you lose fuel depending on drillmachinespeed
  ld    hl,(DrillMachineY)
  ld    de,(DrillMachineSpeed)
  xor   a
  sbc   hl,de
  ld    (DrillMachineY),hl
  ;we perform a check to see if the y has crossed the 32 pixels per tile boundary
  ld    a,(DrillMachineY)
  and   %0001 1111
  sub   a,e
  bit   7,a
  ret   z
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
  ;no need to snap to the tile if we keep going up
	ld		a,(Controls)
	bit		0,a           ;cursor up pressed ?
;  ret   nz
  jp    nz,CheckChangeDrillMovementDirection.GoSetUp
  ;snap to the tile
  ld    a,l
  and   %1110 0000
  ld    (DrillMachineY),hl
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .MoveRight:
  ld    a,2
  ld    (DrillMachineFaceDirection),a       ;1=up, 2=right, 3=down, 4=left

  ld    a,(DrillMachineX)
  cp    256-32
  jp    z,.EdgeOfScreenReached

  call  ReduceFuelWhenMoving                        ;when moving you lose fuel depending on drillmachinespeed
  ld    a,(DrillMachineSpeed)
  ld    e,a
  ld    a,(DrillMachineX)
  add   a,e
  ld    (DrillMachineX),a
  ;we perform a check to see if the x has crossed the 32 pixels per tile boundary
  and   %0001 1111
  sub   a,e
  bit   7,a
  ret   z
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
  ;no need to snap to the tile if we keep going right
	ld		a,(Controls)
	bit		3,a           ;cursor right pressed ?
;  ret   nz
  jp    nz,CheckChangeDrillMovementDirection.GoSetRight
  ;snap to the tile
  ld    a,(DrillMachineX)
  and   %1110 0000
  ld    (DrillMachineX),a
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

  .MoveLeft:
  ld    a,4
  ld    (DrillMachineFaceDirection),a       ;1=up, 2=right, 3=down, 4=left

  ld    a,(DrillMachineX)
  or    a
  jp    z,.EdgeOfScreenReached

  call  ReduceFuelWhenMoving                        ;when moving you lose fuel depending on drillmachinespeed
  ld    a,(DrillMachineSpeed)
  ld    e,a
  ld    a,(DrillMachineX)
  sub   a,e
  ld    (DrillMachineX),a
  ;we perform a check to see if the x has crossed the 32 pixels per tile boundary
  and   %0001 1111
  sub   a,e
  bit   7,a
  ret   z
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
  ;no need to snap to the tile if we keep going left
	ld		a,(Controls)
	bit		2,a           ;cursor left pressed ?
;  ret   nz
  jp    nz,CheckChangeDrillMovementDirection.GoSetLeft

  ;snap to the tile
  ld    a,(DrillMachineX)
  and   %1110 0000
  ld    (DrillMachineX),a
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret

HandleDrillingTime:
  ld    a,(DrillingTimeFrames)
  ld    b,a

  ld    a,(DrillingTime)
  inc   a
  and   b
  ld    (DrillingTime),a
  ret


CheckTileDrillMachine:
  push  bc                                  ;x increase in b
  ;we have tilemap at $8000 in ram, and the tiles are stored in page 3 in vram
  ld    a,(slot.page1rom)              	    ;all RAM except page 1+2
  out   ($a8),a    

  ld    hl,(DrillMachineY)
  add   hl,de                               ;y increase

  ld    a,l
  and   %1110 0000                          ;we take drillmachine y per 32 pixels
  ld    l,a

  push  hl
  pop   bc

  ld    de,4                                ;divide the drillmachiney by 4 to get the row in the tilemap
  call  DivideBCbyDE                        ; Out: BC = result, HL = rest
  ld    hl,$8000
  add   hl,bc                               ;row found

  ld    a,(DrillMachineX)
  pop   bc                                  ;x increase in b
  add   a,b

  and   %1110 0000                          ;we take drillmachine x per 32 pixels
  srl   a                                   ;/2
  srl   a                                   ;/4
  srl   a                                   ;/8
  srl   a                                   ;/16
  srl   a                                   ;/32
  ld    e,a
  ld    d,0
  add   hl,de

  ld    a,(hl)
  ret

CheckChangeDrillMovementDirection:
;this works, but its better to change sprite character and spat positioning relative to DrillMachineCurrentlyMovingInDirection every other frame instead
  ld    a,(framecounter2) ;HACKJOB to get him to move at the exact frame we change character and color data for the sprite
  bit   0,a
  ret   z

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
	bit		0,a           ;cursor up pressed ?
  jp    nz,.UpPressed
	bit		1,a           ;cursor down pressed ?
  jp    nz,.DownPressed
	bit		2,a           ;cursor left pressed ?
  jp    nz,.LeftPressed
	bit		3,a           ;cursor right pressed ?
  jp    nz,.RightPressed
  ret

  .LeftPressed:
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  or    a
  jr    z,.GoSetLeft
  cp    2                                           ;check if we are currently moving to the right, in which case we are allowed to turn around
  ret   nz
  ld    a,4
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret
  .GoSetLeft:

  ld    hl,DrillMachineFaceDirection                ;1=up, 2=right, 3=down, 4=left
  ld    (hl),4  ;NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED 
  ld    a,(DrillMachineX)
  or    a
  ret   z

  ld    a,4
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left

  ld    de,+0                                       ;y increase
  ld    b,-16                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
;  cp    16
;  ret   c

  cp    15
  ret   z
  cp    13
  ret   z
  cp    12
  ret   z
  cp    10
  ret   z
  cp    08
  ret   z
  cp    05
  ret   z
  cp    04
  ret   z
  cp    00
  ret   z

  ;snap to the tile
;  ld    a,(DrillMachineX)
;  and   %1110 0000
;  ld    (DrillMachineX),a

  ld    hl,DrillMachineCurrentlyMovingInDirection?  ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ld    (hl),8
  ld    hl,DrillMachineFaceDirection                ;1=up, 2=right, 3=down, 4=left
  ld    (hl),4
  jp    CheckDrillingPossible

  .RightPressed:
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  or    a
  jr    z,.GoSetRight
  cp    4
  ret   nz
  ld    a,2
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret
  .GoSetRight:
  ld    hl,DrillMachineFaceDirection                ;1=up, 2=right, 3=down, 4=left
  ld    (hl),2  ;NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED NOT TESTED 
  ld    a,(DrillMachineX)
  cp    256-32
  ret   z

  ld    a,2
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left

  ld    de,+0                                       ;y increase
  ld    b,+32                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
;  cp    16
;  ret   c

  cp    15
  ret   z
  cp    12
  ret   z
  cp    11
  ret   z
  cp    10
  ret   z
  cp    08
  ret   z
  cp    07
  ret   z
  cp    06
  ret   z
  cp    02
  ret   z

;  ld    a,(DrillMachineX)
;  and   %1110 0000
;  ld    (DrillMachineX),a
  ld    hl,DrillMachineCurrentlyMovingInDirection?  ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ld    (hl),6
  ld    hl,DrillMachineFaceDirection                ;1=up, 2=right, 3=down, 4=left
  ld    (hl),2
  jp    CheckDrillingPossible

  .UpPressed:
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  or    a
  jr    z,.GoSetUp
  cp    3
  ret   nz
  ld    a,1
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret
  .GoSetUp:
  ld    a,1
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left

  ld    de,-16                                      ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
;  cp    16
;  ret   c

  cp    15
  ret   z
  cp    13
  ret   z
  cp    11
  ret   z
  cp    10
  ret   z
  cp    09
  ret   z
  cp    06
  ret   z
  cp    05
  ret   z
  cp    01
  ret   z

  ld    hl,DrillMachineCurrentlyMovingInDirection?  ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ld    (hl),5
  ld    hl,DrillMachineFaceDirection                ;1=up, 2=right, 3=down, 4=left
  ld    (hl),1
  jp    CheckDrillingPossible

  .DownPressed:
  ld    a,(DrillMachineCurrentlyMovingInDirection?) ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  or    a
  jr    z,.GoSetDown
  cp    1
  ret   nz
  ld    a,3
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ret
  .GoSetDown:
  ld    a,3
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left

  ld    de,+32                                      ;y increase
  ld    b,+00                                       ;x increase
  call  CheckTileDrillMachine                       ;in: de=y increase, b=x increase, out: a=tilenr
;  cp    16
;  ret   c

  cp    15
  ret   z
  cp    13
  ret   z
  cp    12
  ret   z
  cp    11
  ret   z
  cp    09
  ret   z
  cp    07
  ret   z
  cp    04
  ret   z
  cp    03
  ret   z

  ld    hl,DrillMachineCurrentlyMovingInDirection?  ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  ld    (hl),7
  ld    hl,DrillMachineFaceDirection                ;1=up, 2=right, 3=down, 4=left
  ld    (hl),3
  jp    CheckDrillingPossible

CheckDrillingPossible:
  ld    hl,DrillingTimeFrames

  cp    16
  jp    c,.DrillThinWall
  cp    24
  jp    c,.DrillingLevel1Soil
  cp    36
  jp    c,.DrillingLevel2Soil
  cp    47
  jp    c,.DrillingLevel3Soil
  cp    57
  jp    c,.DrillingLevel4Soil

  .DrillingLava: ;
;  ld    a,1
;  ld    (DrillingHigherLevelSoil?),a
;  ld    (hl),31                                      ;DrillingTimeFrames
;  ld    a,(ConicalDrillBit)                         ;0=can drill through level 1, 1=can drill through level 2, 2=can drill through level 3, 3=can drill through level 4 
;  cp    3
;  ret   nc
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  jp    HandleSoldierConversations.DrillingLava

  .DrillingLevel4Soil:
  call  ReduceAdditionalFuelWhenDrilling
  ld    a,1
  ld    (DrillingHigherLevelSoil?),a
  ld    (hl),31                                      ;DrillingTimeFrames
  ld    a,(ConicalDrillBit)                         ;0=can drill through level 1, 1=can drill through level 2, 2=can drill through level 3, 3=can drill through level 4 
  cp    3
  ret   nc
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  jp    HandleSoldierConversations.DrillingNotPossible

  .DrillingLevel3Soil:
  call  ReduceAdditionalFuelWhenDrilling
  ld    a,1
  ld    (DrillingHigherLevelSoil?),a
  ld    (hl),15                                      ;DrillingTimeFrames
  ld    a,(ConicalDrillBit)                         ;0=can drill through level 1, 1=can drill through level 2, 2=can drill through level 3, 3=can drill through level 4 
  cp    3
  ret   nc
  ld    (hl),31                                     ;DrillingTimeFrames
  cp    2
  ret   nc
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  jp    HandleSoldierConversations.DrillingNotPossible

  .DrillingLevel2Soil:
  call  ReduceAdditionalFuelWhenDrilling
  ld    a,1
  ld    (DrillingHigherLevelSoil?),a
  ld    (hl),7                                      ;DrillingTimeFrames
  ld    a,(ConicalDrillBit)                         ;0=can drill through level 1, 1=can drill through level 2, 2=can drill through level 3, 3=can drill through level 4 
  cp    3
  ret   nc
  ld    (hl),15                                     ;DrillingTimeFrames
  cp    2
  ret   nc
  ld    (hl),31                                      ;DrillingTimeFrames
  cp    1
  ret   nc
  xor   a
  ld    (DrillMachineCurrentlyMovingInDirection?),a ;0=not moving, 1=up, 2=right, 3=down, 4=left, 5=drilling up, 6=drilling right, 7=drilling down, 8=drilling left
  jp    HandleSoldierConversations.DrillingNotPossible

  .DrillingLevel1Soil:
  call  ReduceAdditionalFuelWhenDrilling
  xor   a
  ld    (DrillingHigherLevelSoil?),a
  ld    (hl),31                                      ;DrillingTimeFrames
  ld    a,(ConicalDrillBit)                         ;0=can drill through level 1, 1=can drill through level 2, 2=can drill through level 3, 3=can drill through level 4 
  cp    1
  ret   c
  ld    (hl),15                                     ;DrillingTimeFrames
  cp    2
  ret   c
  ld    (hl),7                                      ;DrillingTimeFrames
  cp    3
  ret   c
  ld    (hl),3                                      ;DrillingTimeFrames
  ret

  .DrillThinWall:
  xor   a
  ld    (DrillingHigherLevelSoil?),a
  ld    (hl),7                                      ;DrillingTimeFrames
  ld    a,(ConicalDrillBit)                         ;0=can drill through level 1, 1=can drill through level 2, 2=can drill through level 3, 3=can drill through level 4 
  cp    1
  ret   c
  ld    (hl),3                                      ;DrillingTimeFrames
  cp    2
  ret   c
  ld    (hl),1                                      ;DrillingTimeFrames
  ret

SetDrillMachineYRelative:                   ;DrillMachineYRelative = DrillingGameCameraY - DrillMachineY + r23onLineInt
  ld    a,(r23onLineInt)
  ld    b,a

  ld    hl,(DrillMachineY)
  ld    de,(DrillingGameCameraY)
  xor   a
  sbc   hl,de
  ld    a,h
  or    a
  ld    a,l
  jr    z,.GoPutDrillMachineYRelative
  ld    a,213
  .GoPutDrillMachineYRelative:
  add   a,b
  ld    (DrillMachineYRelative),a
  ret

SetInterruptHandlerDrillingGame:
  di
  ld    hl,InterruptHandlerDrillingGame
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

  ld    a,LineIntHeightDrillingGame
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  ei
  out   ($99),a 
  ret

HandleHud:
  ld    a,(framecounter2)               ;only handle hud when background is not being built up
  and   7
  cp    1
  jr    z,HandleHudRadiation
  cp    3
  jr    z,HandleHudEnergy
  cp    5
  jr    z,HandleHudStorage
  cp    7
  jr    z,HandleHudFuel
  ret

HandleHudRadiation:
  ld    hl,ClearHudRadiation
  call  DoCopy

  ld    c,DrillingGameColorRed+ (DrillingGameColorRed * 16)
  ld    b,188                           ;dx
  ld    a,018                           ;dy

  ;nx= Radiation/RadiationMax*64
  ld    hl,(Radiation)
  ld    de,(RadiationMax)
  jp    GoFill

HandleHudEnergy:
  ld    hl,ClearHudEnergy
  call  DoCopy

  ld    c,DrillingGameColorGreen+ (DrillingGameColorGreen * 16)
  ld    b,059                           ;dx
  ld    a,018                           ;dy

  ;nx= Energy/EnergyMax*64
  ld    hl,(Energy)
  ld    de,(EnergyMax)
  jp    GoFill

HandleHudStorage:
  ld    hl,ClearHudStorage
  call  DoCopy

  ld    c,DrillingGameColorGrey+ (DrillingGameColorGrey * 16)
  ld    b,188                           ;dx
  ld    a,003                           ;dy

  ;nx= Storage/StorageMax*64
  ld    hl,(Storage)
  ld    de,(StorageMax)
  jp    GoFill

HandleHudFuel:
  ld    hl,ClearHudFuel
  call  DoCopy

  ld    c,DrillingGameColorOrange+ (DrillingGameColorOrange * 16)
  ld    b,059                           ;dx
  ld    a,003                           ;dy

  ld    hl,(Fuel)
  ld    de,(FuelMax)
  call  DivideHLandDEby4                ;on the GoFill routine we perform nx= resource*64/resourcemax. to avoid overflow when we do resource*64, we divide all values by 4, because msx fuel at level 4 = 4000
  jp    GoFill

DivideHLandDEby4:
  push  af
  push  bc

  ld    bc,(Fuel)
  ld    de,4
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  push  bc


  ld    bc,(FuelMax)
  ld    de,4
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  push  bc

  pop   de
  pop   hl


  pop   bc
  pop   af
  ret

GoFill:
  ld    (FillCommand+dy),a
  ld    a,b
  ld    (FillCommand+dx),a
  ld    a,c
  ld    (FillCommand+clr),a

  ;nx= resource*64/resourcemax
  push  de
  ld    de,64
  call  MultiplyHlWithDE      ;HL = result

  push  hl
  pop   bc
  pop   de
  call  DivideBCbyDE          ; Out: BC = result, HL = rest

  ld    a,c
  ld    (FillCommand+nx),a

  or    a
  ret   z

  ld    hl,FillCommand
  jp    DoCopy

DrillingGameColorBlack:   equ 15
DrillingGameColorOrange:  equ 12
DrillingGameColorGrey:    equ 6
DrillingGameColorGreen:   equ 0
DrillingGameColorRed:     equ 3
ClearHudFuel:
	db		0,0,0,0
	db		058,0,003,0
	db		066,0,007,0
	db		DrillingGameColorBlack+ (DrillingGameColorBlack * 16),0,$c0

ClearHudStorage:
	db		0,0,0,0
	db		188,0,003,0
	db		064,0,007,0
	db		DrillingGameColorBlack+ (DrillingGameColorBlack * 16),0,$c0

ClearHudEnergy:
	db		0,0,0,0
	db		058,0,018,0
	db		066,0,007,0
	db		DrillingGameColorBlack+ (DrillingGameColorBlack * 16),0,$c0

ClearHudRadiation:
	db		0,0,0,0
	db		188,0,018,0
	db		064,0,007,0
	db		DrillingGameColorBlack+ (DrillingGameColorBlack * 16),0,$c0

HandleRadiation:
  ld    a,(RadiationProtectionLevel)
  dec   a
  ld    b,63
  jr    z,.RadiationProtectionLevelFound
  dec   a
  ld    b,127
  jr    z,.RadiationProtectionLevelFound
  ld    b,255

  .RadiationProtectionLevelFound:
  ld    a,(framecounter2)
  and   b
  ret   nz

  ld    hl,(Radiation)
  inc   hl
  ld    (Radiation),hl
  ret

HandleEnergy:
  ld    a,(framecounter2)
  and   a
  ret   nz

  ld    hl,(Energy)
  dec   hl
  ld    (Energy),hl
  ret

;ClearPage0:
;	db		0,0,0,0
;	db		000,0,030,0
;	db		000,1,256-30,0
;	db		DrillingGameColorBlack+ (DrillingGameColorBlack * 16),0,$c0

CopyCurrentVisiblePage2ToPage0and1:
;  ld    hl,ClearPage0
;  call  DoCopy

  ld    a,182                             ;ny
  ld    (CopyCurrentVisiblePage2ToPage0+ny),a
  ld    a,30
  ld    (CopyCurrentVisiblePage2ToPage0+dy),a

  ld    a,(r23onLineInt)
  add   a,30
  ld    (CopyCurrentVisiblePage2ToPage0+sy),a

  add   a,182                             ;ny
  jr    nc,.EndOverFlowCheck

  ;if there is overflow we have to copy in 2 parts, first the part until y=256
  ld    a,(r23onLineInt)
  add   a,30
  ld    b,a
  xor   a
  sub   a,b
  ld    (CopyCurrentVisiblePage2ToPage0+ny),a
  ld    hl,CopyCurrentVisiblePage2ToPage0
  call  DoCopy
  ;and then the 2nd part starting at y=0 
  xor   a
  ld    (CopyCurrentVisiblePage2ToPage0+sy),a

  ld    a,(CopyCurrentVisiblePage2ToPage0+ny)
  ld    b,a
  ld    a,(CopyCurrentVisiblePage2ToPage0+dy)
  add   a,b
  ld    (CopyCurrentVisiblePage2ToPage0+dy),a

  ld    a,182
  sub   a,b
  ld    (CopyCurrentVisiblePage2ToPage0+ny),a

  .EndOverFlowCheck:
  ld    hl,CopyCurrentVisiblePage2ToPage0
  call  DoCopy

  ;copy from page 0 to page 1
  ld    a,0
  ld    (CopyPageToPage212High+sPage),a
  ld    a,1
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy
  ret

CheckReturnFromNPCConversation:
  ld    a,(NPCConversationsInDrillingGame?)
  dec   a
  ret   m
  ld    (NPCConversationsInDrillingGame?),a

  ld    a,1
  ld    (SetLineIntHeightOnVblankDrillingGame?),a
  call  SetInterruptHandlerDrillingGame   	;sets Vblank and lineint for hud
  ;this is not needed, if this is set for every NPC conversation
  ld    a,60
  ld    (YConversationWindowCentre),a
  ret

HandleSoldierConversations:
  call  .CheckFirstTimeDrillingConversation
  call  .CheckLowFuelConversation
  call  .CheckLowEnergyConversation
  call  .CheckHighRadiationConversation
  call  .CheckStorageFullConversation
  call  .CheckOutOfFuelConversation
  call  .CheckOutOfEnergyConversation
  call  .CheckDeathByRadiationConversation
  ret

  .CheckDeathByRadiationConversation:
  ld    hl,(Radiation)
  ld    de,(RadiationMax)
  inc   de
  inc   de
  inc   de
  inc   de
  call  CompareHLwithDE
  ret   nz
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv036
  ld    (NPCConvAddress),hl
  ld    a,1
  ld    (ChangeRoom?),a
  ld    a,10
  ld    (CurrentRoom),a
  jp    .StartConversation  

  .CheckOutOfEnergyConversation:
  ld    hl,(Energy)
  ld    de,-1
  call  CompareHLwithDE
  ret   nz
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv035
  ld    (NPCConvAddress),hl
  ld    a,1
  ld    (ChangeRoom?),a
  ld    a,7
  ld    (CurrentRoom),a
  jp    .StartConversation  

  .CheckOutOfFuelConversation:
  ld    hl,(Fuel)
  ld    de,-1
  call  CompareHLwithDE
  ret   nz
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv034
  ld    (NPCConvAddress),hl
  ld    a,1
  ld    (ChangeRoom?),a
  ld    a,10
  ld    (CurrentRoom),a
  jp    .StartConversation  

  .CheckStorageFullConversation:
  ld    a,(DrillMachineY)
  cp    60
  ret   c

  ld    hl,(Storage)
  ld    de,(StorageMax)
  or    a
  sbc   hl,de
  ret   c
  ld    hl,ConvSoldier
  bit   6,(hl)
  jp    z,.StorageFullLongMessage
  bit   7,(hl)
  ret   nz
  .StorageFullShortMessage:
  set   7,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv031
  ld    (NPCConvAddress),hl
  jp    .StartConversation
  .StorageFullLongMessage:
  set   6,(hl)
  set   7,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv030
  ld    (NPCConvAddress),hl
  jp    .StartConversation

  .CheckHighRadiationConversation:
  ld    a,(DrillMachineY)
  cp    60
  ret   c

  ld    hl,(Radiation)
  ld    de,900
  sbc   hl,de
  ret   c
  ld    hl,ConvSoldier
  bit   5,(hl)
  ret   nz
  set   5,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv029
  ld    (NPCConvAddress),hl
  jp    .StartConversation

  .CheckLowEnergyConversation:
  ld    a,(DrillMachineY)
  cp    60
  ret   c

  ;energy depletes every 256 frames, distance per energy is depending on the drill machine speed 
  ;for speed 1 we can travel 256 pixels per energy, so each amount of energy allows us to move 256 pixels deep
  ld    hl,(DrillMachineY)
  ld    de,256
  add   hl,de

  ;we divide this value by 4, so we don't have to multiply energy * 256 (to avoid overflow, this way we only have to do energy * 64)
  push  hl
  pop   bc
  ld    de,4
  call  DivideBCbyDE                        ; Out: BC = result, HL = rest
  push  bc
  pop   de

;  ex    de,hl

  ld    hl,(Energy)
  add   hl,hl                               ;*2
  add   hl,hl                               ;*4
  add   hl,hl                               ;*8
  add   hl,hl                               ;*16
  add   hl,hl                               ;*32
  add   hl,hl                               ;*64
;  add   hl,hl                               ;*128
;  add   hl,hl                               ;*256
  ;each amount of fuel allows us to dig 32 pixels deep
  xor   a
  sbc   hl,de
  ret   nc

  .LowEnergyWarning:
  ld    hl,ConvSoldier
  bit   3,(hl)
  jr    z,.LowEnergyLongMessage
  bit   4,(hl)
  ret   nz
  .LowEnergyShortMessage:
  set   4,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv028
  ld    (NPCConvAddress),hl
  jp    .StartConversation
  .LowEnergyLongMessage:
  set   3,(hl)
  set   4,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv027
  ld    (NPCConvAddress),hl
  jr    .StartConversation

  .CheckLowFuelConversation:
  ld    a,(DrillMachineY)
  cp    60
  ret   c

  ld    hl,(DrillMachineY)
  ld    de,128*3
  add   hl,de
  ex    de,hl

  ld    hl,(Fuel)
  add   hl,hl                               ;*2
  add   hl,hl                               ;*4
  add   hl,hl                               ;*8
  add   hl,hl                               ;*16
  add   hl,hl                               ;*32
  ;each amount of fuel allows us to dig 32 pixels deep
  xor   a
  sbc   hl,de
  ret   nc

  .LowFuelWarning:
  ld    hl,ConvSoldier
  bit   1,(hl)
  jr    z,.LowFuelLongMessage
  bit   2,(hl)
  ret   nz
  .LowFuelShortMessage:
  set   2,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv026
  ld    (NPCConvAddress),hl
  jr    .StartConversation
  .LowFuelLongMessage:
  set   1,(hl)
  set   2,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv025
  ld    (NPCConvAddress),hl
  jr    .StartConversation

  .CheckFirstTimeDrillingConversation:
  ld    hl,ConvSoldier
  bit   0,(hl)
  ret   nz

  ld    a,(DrillMachineY)
  cp    60
  ret   c

  set   0,(hl)
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv024
  ld    (NPCConvAddress),hl
  jr    .StartConversation

  .DrillingNotPossible:
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv032
  ld    (NPCConvAddress),hl
  jr    .StartConversation

  .DrillingLava:
  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv033
  ld    (NPCConvAddress),hl
  jr    .StartConversation

  .StartConversation:
  call  CopyCurrentVisiblePage2ToPage0and1
  call  SetInterruptHandler
  xor   a
  ld    (SetLineIntHeightOnVblankDrillingGame?),a

  ld    a,90
  ld    (YConversationWindowCentre),a

  ld    a,1
  ld    (StartConversation?),a
  ld    (NPCConversationsInDrillingGame?),a
  ret

DrillMachineEventRoutine:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever (so we always stay on page 2 for the game, and page 0 for the hud)

  call  CheckReturnFromNPCConversation
  call  .HandlePhase                        ;used to build up screen and initiate variables
  call  .CheckEndGame
  call  .MoveCamera                         ;updates DrillingGameCameraY and r23onLineInt when moving the camera
;  call  BackdropGreen
  call  PutDrillMachineCharacterAndColorData;every other frame outs the character and color data to vram
;  call  BackdropBlack

  call  PutSpatDrillMachineSprite           ;sets the coordinates of drill machine in spat

;  call  BackdropYellow
  call  MoveDrillMachine                    ;changes DrillMachineY and DrillMachineX
;  call  BackdropBlack
  call  SetDrillMachineYRelative            ;DrillMachineYRelative = DrillingGameCameraY - DrillMachineY + r23onLineInt

;  call  BackdropRed
  call  .BuildUpNewRow                      ;every other frame builds up new rows
;  call  BackdropBlack

  call  HandleHud                           ;displays fuel, storage, energy and radiation
  call  HandleRadiation                     ;radiation is increased over time, depending on RadiationProtectionLevel
  call  HandleEnergy                        ;energy is decreased over time
  call  HandleSoldierConversations          ;conversation when low on fuel/energy high on radiation, storage full and intro first time drilling
  ret

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  ret   nz

  call  BuildUpMapDrillingGame              ;build up map
  call  SetHudDrillingGame
  ld    a,0*32 + 31                         ;page 0 at vblank (for the hud), page 2 will be for the game (set on lineint)
	ld    (PageOnNextVblank),a
  xor   a
  ld    (r23onVblank),a
  ld    (DrillMachineCurrentlyMovingInDirection?),a
  ld    (DrillMachineYRelative),a
  ld    (DrillMachineAnimationCounter),a
  ld    (DrillingTime),a
  ld    hl,0
  ld    (DrillingGameCameraY),hl

  ld    hl,1
  ld    (DrillMachineSpeed),hl

  ld    a,96
  ld    (DrillMachineX),a
  ld    hl,32
  ld    (DrillMachineY),hl
  ld    a,3
  ld    (DrillMachineFaceDirection),a
  ld    a,1
  ld    (SetLineIntHeightOnVblankDrillingGame?),a
  ld    (iy+ObjectPhase),1
  call  SetInterruptHandlerDrillingGame   	;sets Vblank and lineint for hud
  ret

  .CheckEndGame:
  ld    hl,(DrillMachineY)
  ld    de,10
  call  CompareHLwithDE
  jr    c,.EndGame

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
	bit		5,a           ;trig b pressed ?
  ret   z

  .EndGame:
  call  SetInterruptHandler  
  ld    a,1
  ld    (ChangeRoom?),a
  ld    a,40
  ld    (OffloadResources?),a
  ld    a,4
  ld    (CurrentRoom),a

  call  SaveDrillingGameMap
  ret

  .MoveCamera:
  ld    a,(DrillMachineFaceDirection)       ;1=up, 2=right, 3=down, 4=left
  cp    1
  jr    z,.CheckMoveCameraUp
  cp    3
  ret   nz

  .CheckMoveCameraDown:
  ld    a,(r23onLineInt)
  ld    b,a
  ld    a,(DrillMachineYRelative)           ;DrillMachineYRelative = DrillingGameCameraY - DrillMachineY + r23onLineInt
  sub   a,b
  cp    50
  ret   c

  ld    de,(DrillMachineSpeed)
  ld    hl,(DrillingGameCameraY)
  add   hl,de
  ld    (DrillingGameCameraY),hl

  ld    a,(r23onLineInt)
  add   a,e
  ld    (r23onLineInt),a

;  sub   a,32                                ;adjust line int height
;  di
;  out   ($99),a
;  ld    a,19+128                            ;set lineinterrupt height
;  ei
;  out   ($99),a   

  ld    a,2                                 ;1= camera moving up, 2=camera moving down
  ld    (BuildUpNewRow?),a
  ret

  .CheckMoveCameraUp:
  ld    a,(r23onLineInt)
  ld    b,a
  ld    a,(DrillMachineYRelative)           ;DrillMachineYRelative = DrillingGameCameraY - DrillMachineY + r23onLineInt
  sub   a,b
  cp    120
  ret   nc

  ld    de,(DrillMachineSpeed)
  ld    hl,(DrillingGameCameraY)
  xor   a
  sbc   hl,de
  ret   c
  ld    (DrillingGameCameraY),hl

  ld    a,1                                 ;1= camera moving up, 2=camera moving down
  ld    (BuildUpNewRow?),a

  ld    a,(r23onLineInt)
  sub   a,e
  ld    (r23onLineInt),a

;  sub   a,32
;  di
;  out   ($99),a
;  ld    a,19+128                        ;set lineinterrupt height
;  ei
;  out   ($99),a 
  ret


;DrillingGameCameraY:	dw	08*32


;after we move the camera up we need to build up 4 lines at y=0 relative (top of the screen) 
;after we move the camera down we need to build up 4 lines at y=208 relative (bottom of the screen) 
  .BuildUpNewRow:
  ld    a,(framecounter2)
  bit   0,a
  ret   nz

  ld    a,(BuildUpNewRow?)
  or    a
  ret   z
  dec   a
  ld    a,0
  ld    (BuildUpNewRow?),a
  jr    z,BuildUpNewRowCameraGoingUp

BuildUpNewRowCameraGoingDown:
  ld    a,(r23onLineInt)
  and   %1111 0000
  add   a,7*32
  ld    (CopyTileDrillingGame+dy),a         ;dy
  xor   a
  ld    (CopyTileDrillingGame+dx),a         ;dx

  ld    a,16 ;32 ;4
  ld    (CopyTileDrillingGame+ny),a         ;4x32 pixels

  ;we have tilemap at $8000 in ram, and the tiles are stored in page 3 in vram
  ld    a,(slot.page1rom)              	;all RAM except page 1+2
  out   ($a8),a    

  ld    de,7*32
  ld    hl,(DrillingGameCameraY)

  ld    a,l
  and   %1110 0000
  ld    l,a

  add   hl,de
  push  hl
  pop   bc
;  ld    bc,(DrillingGameCameraY)

  jr    BuildUpNewRowCameraGoingUp.FindStartingAddressInRam

  ld    de,4
  call  DivideBCbyDE                        ; Out: BC = result, HL = rest
  ld    hl,$8000
  add   hl,bc
  ex    de,hl

;  ld    de,$8000 + (08 * 8)
  ld    b,8
  .PutTileLoop:
  push  bc
  call  .PutTile
  pop   bc
  djnz  .PutTileLoop
  ret

  .PutTile:
  ld    a,(de)
  and   %0000 0111
  add   a,a                                 ;*2
  add   a,a                                 ;*4
  add   a,a                                 ;*8
  add   a,a                                 ;*16
  add   a,a                                 ;*32
  ld    (CopyTileDrillingGame+sx),a

  ld    a,(r23onLineInt)
  and   %0001 0000
  ld    l,a

  ld    a,(de)
  and   %1111 1000
  add   a,a                                 ;*16
  add   a,a                                 ;*32

  add   a,l

  ld    (CopyTileDrillingGame+sy),a

  ld    hl,CopyTileDrillingGame
  call  DoCopy

  inc   de                                  ;next tile in ram
  ld    a,(CopyTileDrillingGame+dx)
  add   a,32
  ld    (CopyTileDrillingGame+dx),a         ;next column
  ret

BuildUpNewRowCameraGoingUp:
  ld    a,(r23onLineInt)
  and   %1111 0000
  ld    (CopyTileDrillingGame+dy),a         ;dy
  xor   a
  ld    (CopyTileDrillingGame+dx),a         ;dx

  ld    a,16; 32 ;4
  ld    (CopyTileDrillingGame+ny),a         ;4x32 pixels

  ;we have tilemap at $8000 in ram, and the tiles are stored in page 3 in vram
  ld    a,(slot.page1rom)              	;all RAM except page 1+2
  out   ($a8),a    

  ld    bc,(DrillingGameCameraY)

  ld    a,c
  and   %1110 0000
  ld    c,a

  .FindStartingAddressInRam:
  ld    de,4
  call  DivideBCbyDE                        ; Out: BC = result, HL = rest
  ld    hl,$8000
  add   hl,bc
  ex    de,hl

;  ld    de,$8000 + (08 * 8)
  ld    b,8
  .PutTileLoop:
  push  bc
  call  .PutTile
  pop   bc
  djnz  .PutTileLoop
  ret

  .PutTile:
  ld    a,(de)
  and   %0000 0111
  add   a,a                                 ;*2
  add   a,a                                 ;*4
  add   a,a                                 ;*8
  add   a,a                                 ;*16
  add   a,a                                 ;*32
  ld    (CopyTileDrillingGame+sx),a

  ld    a,(r23onLineInt)
  and   %0001 0000
  ld    l,a

  ld    a,(de)
  and   %1111 1000
  add   a,a                                 ;*16
  add   a,a                                 ;*32

  add   a,l

  ld    (CopyTileDrillingGame+sy),a

  ld    hl,CopyTileDrillingGame
  call  DoCopy

  inc   de                                  ;next tile in ram
  ld    a,(CopyTileDrillingGame+dx)
  add   a,32
  ld    (CopyTileDrillingGame+dx),a         ;next column
  ret

PutTileInScreen:                            ;in: a=tilenr, c=y increase, b=x increase
  push  af
  and   %0000 0111
  add   a,a                                 ;*2
  add   a,a                                 ;*4
  add   a,a                                 ;*8
  add   a,a                                 ;*16
  add   a,a                                 ;*32
  ld    (CopyTileDrillingGame+sx),a

;  ld    a,(r23onLineInt)
;  and   %0001 0000
;  ld    l,a

  pop   af
  and   %1111 1000
  add   a,a                                 ;*16
  add   a,a                                 ;*32
;  add   a,l
  ld    (CopyTileDrillingGame+sy),a

  ld    a,32
  ld    (CopyTileDrillingGame+ny),a         ;4x32 pixels

  ld    a,(DrillMachineX)
  add   a,b
  and   %1110 0000
  ld    (CopyTileDrillingGame+dx),a
  ld    a,(DrillMachineYRelative)
  add   a,c
  and   %1110 0000
  ld    (CopyTileDrillingGame+dy),a

  ld    hl,CopyTileDrillingGame
  call  DoCopy
  ret








dephase
