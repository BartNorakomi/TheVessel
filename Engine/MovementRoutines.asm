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

;BioPod1Routine
;BioPod2Routine
;BioPodBlinkingLightRoutine
;BiopodEventRoutine

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

;sleepingquartersEventRoutine
;armoryvaultEventRoutine
;holodeckEventRoutine
;medicalbayEventRoutine

;sciencelabEventRoutine

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

VesselMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
  ld    hl,(PlayerSpriteStand)
  jp    (hl)

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
  jp    nc,Set_R_stand

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
  cp    130
  jr    c,.EnterDoor

  ld    hl,TheVesselleftrunning_0          ;starting pose
  ld    b,11                                ;animation steps
  jp    AnimateObject                       ;in hl=starting pose, b=animation steps, uses: var1

  .EnterDoor:
	ld		a,062														;y
	ld		(Object1+y),a
  jp    Set_L_stand

REnterDoor:
  ld    a,(iy+2)                            ;x
  add   a,HorizontalSpeedPlayer
  ld    (iy+2),a                            ;x
  cp    $90+28
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

HorizontalSpeedPlayer:  equ 4
MoveLeft:
  ld    a,(iy+2)                            ;x
  sub   a,HorizontalSpeedPlayer
  ret   c
  ld    (iy+2),a                            ;x

  call  CheckCollisionWall                  ;out: nz=collision
  jr    nz,.Collision
  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  .Collision:
  ld    a,(iy+2)                            ;x
  add   a,HorizontalSpeedPlayer
  ld    (iy+2),a                            ;x
  ret

MoveRight:
  ld    a,(iy+2)                            ;x
  add   a,HorizontalSpeedPlayer
  ret   c
  ld    (iy+2),a                            ;x

  call  CheckCollisionWall                  ;out: nz=collision
  jr    nz,.Collision
  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  .Collision:
  ld    a,(iy+2)                            ;x
  sub   a,HorizontalSpeedPlayer
  ld    (iy+2),a                            ;x
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
  cp    176
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

  cp    064
  ret   nc
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
  xor   a
  ld    (freezecontrols?),a

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
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 
  call  PutConversationCloud
  call  CheckShowPressTrigAIconArcadeHall1
  call  PutPressTrigAIcon
  ret

  .CheckPlayerLeavingRoom:
	ld		a,(HighScoreTotalAverage)
	cp		80
  ret   c

  ld    a,(Object1+y)
  cp    $3e
  ret   nz

  ld    a,(Object1+x)
  cp    $90
  ret   c

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
  cp    255-10
  jr    nc,.biopod
  cp    10
  jr    c,.left
  ret

  .left:
  ld    a,255-20
  ld    (Object1+x),a

  ld    a,4
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .biopod:
  ld    a,20
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
  cp    255-10
  jr    nc,.sleepingquarters

  ld    a,(Object1+x)
  cp    10
  jr    c,.holodeck
  ret

  .holodeck:
  ld    a,255-20
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,9
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .sleepingquarters:
  ld    a,20
  ld    (Object1+x),a
  ld    a,$5a+16
  ld    (Object1+y),a

  ld    a,7
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

holodecky:   db 070
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
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
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
  cp    255-10
  jr    nc,.armoryvault

  ld    a,(Object1+x)
  cp    10
  jr    c,.medicalbay
  ret

  .medicalbay:
  ld    a,255-20
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,10
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .armoryvault:
  ld    a,20
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,8
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

sciencelabcomputery:   db $54 + 4
sciencelabcomputerx:   db 128 +16
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
  cp    255-10
  jr    nc,.medicalbay

  ld    a,(Object1+x)
  cp    10
  jr    c,.biopod
  ret

  .biopod:
  ld    a,255-20
  ld    (Object1+x),a
  ld    a,$5a+16
  ld    (Object1+y),a

  ld    a,2
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .medicalbay:
  ld    a,20
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

CheckShowPressTrigAIconmedicalbay:
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
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
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
  cp    255-10
  jr    nc,.holodeck

  ld    a,(Object1+x)
  cp    10
  jr    c,.sciencelab
  ret

  .sciencelab:
  ld    a,255-20
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,11
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .holodeck:
  ld    a,20
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
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
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
  cp    255-10
  jr    nc,.reactorchamber

  ld    a,(Object1+x)
  cp    10
  jr    c,.armoryvault
  ret

  .armoryvault:
  ld    a,255-20     - 10 ;?????????????????/BUG ??????????
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,8
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .reactorchamber:
  ld    a,20
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
  jp    c,.DontPutConversation

  ld    a,1
  ld    (freezecontrols?),a

  ld    a,(WaitCenterScreenTimer)
  inc   a
  and   15
  ld    (WaitCenterScreenTimer),a
  jr    nz,.DontPutConversation
  ret

  .DontPutConversation:
  pop   af
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
  cp    255-10
  jr    nc,.trainingdeck

  ld    a,(Object1+x)
  cp    10
  jr    c,.sleepingquarters
  ret

  .sleepingquarters:
  ld    a,255-20
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,7
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .trainingdeck:
  ld    a,20
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
  cp    255-10
  jr    nc,.hangarbay

  ld    a,(Object1+x)
  cp    10
  jr    c,.reactorchamber
  ret

  .reactorchamber:
  ld    a,255-20
  ld    (Object1+x),a
  ld    a,$5a-20
  ld    (Object1+y),a

  ld    a,6
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .hangarbay:
  ld    a,20
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,4
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

HangarbayEventRoutine:
  call  .CheckPlayerLeavingRoom             ;when y>116 player enters arcadehall1 

  call  PutConversationCloud
  call  CheckShowPressTrigAIconHangarBay
  call  PutPressTrigAIcon
  call  .HandleExplainerConversation
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
  cp    255-10
  jr    nc,.hydronponicsbay

  ld    a,(Object1+x)
  cp    10
  jr    c,.trainingdeck
  ret

  .trainingdeck:
  ld    a,255-20
  ld    (Object1+x),a
  ld    a,$5a
  ld    (Object1+y),a

  ld    a,5
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret


  .hydronponicsbay:
  ld    a,20
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
  cp    10
  jr    c,.hydroponicsbay

  ld    a,(Object1+x)
  cp    255-10
  jr    nc,.sciencelab
  ret

  .sciencelab:
  ld    a,20
  ld    (Object1+x),a
  ld    a,$5a+16
  ld    (Object1+y),a

  ld    a,11
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

  .hydroponicsbay:
  ld    a,255-20
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
  incbin "..\grapx\arcadehall\arcade1redlight.SC5",$7680+7,32
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
  ld    bc,$0000 + (097*256) + (056/2)
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
  ld    de,$0000 + (066*128) + (100/2) - 128
  jp    CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  .SetOpenDoorPage1:
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  ld    de,$8000 + (066*128) + (100/2) - 128
  jp    CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  .SetOpenDoorPage2:
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  ld    de,$0000 + (066*128) + (100/2) - 128
  call  CopyRomToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a
  ret

  .SetOpenDoorPage3:
  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    a,OpenDoorGfxBlock         	        ;block to copy graphics from
  ld    de,$8000 + (066*128) + (100/2) - 128
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

Entity_b:   db    entityframelistblock, entityspritedatablock | dw    Entity_0_1
            db    entityframelistblock, entityspritedatablock | dw    Entity_2_1
            db    entityframelistblock, entityspritedatablock | dw    Entity_1_1
            db    entityframelistblock, entityspritedatablock | dw    Entity_2_1

Entity_c:   db    entityframelistblock, entityspritedatablock | dw    Entity_0_2
            db    entityframelistblock, entityspritedatablock | dw    Entity_2_2
            db    entityframelistblock, entityspritedatablock | dw    Entity_1_2
            db    entityframelistblock, entityspritedatablock | dw    Entity_2_2

EntityaRoutine:
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

hangarbay_0:        db    hangarbayframelistblock, hangarbayspritedatablock | dw    hangarbay_0_0
hangarbay1Routine:
  ret

hangarbay_1:        db    hangarbayframelistblock, hangarbayspritedatablock | dw    hangarbay_1_0
hangarbay2Routine:
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

reactorchamber_0:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_0_0
reactorchamber1Routine:
  ret

reactorchamber_1:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_1_0
reactorchamber2Routine:
  ret

reactorchamber_2:        db    reactorchamberframelistblock, reactorchamberspritedatablock | dw    reactorchamber_2_0
reactorchamber3Routine:
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

dephase
