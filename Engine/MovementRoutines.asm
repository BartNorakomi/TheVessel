;AnimatePlayerRunning
;CheckCollisionNPCs
;MovePlayer
;CheckStartConversation
;CheckPlayerNear

;VesselMovementRoutine
;HostMovementRoutine
;GirlMovementRoutine
;CapGirlMovementRoutine
;RedHeadBoyMovementRoutine

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
VesselMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
  ld    hl,(PlayerSpriteStand)
  jp    (hl)

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
  call  AnimatePlayerRunning
  ret

Rrunning:
  call  GetMovementInBC                     ;reads our controls and sets total xy movement in bc 
  ld    a,b
  cp    -1
  jp    z,Set_L_stand
  or    c
  jp    z,Set_R_stand

  call  MovePlayer                          ;move player and check for obstacles/screen edges
  ld    hl,TheVesselrightrunning_0          ;starting pose
  call  AnimatePlayerRunning
  ret

AnimatePlayerRunning:                       ;in hl=starting pose
	ld		a,(PlayerAniCount)
  inc   a
  cp    11
  jr    nz,.endchecklastframe
  xor   a
  .endchecklastframe:
	ld		(PlayerAniCount),a
  add   a,a                                 ;*2
  add   a,a                                 ;*4 ;each spritepose has 4 bytes
  ld    e,a
  ld    d,0
  add   hl,de
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

CheckCollisionNPCs:                         ;out ;d=0(no collision), d=1(collision)
  ld    d,0                                 ;0=no collision, 1=collision
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
  ld    a,b
  cp    -1
  call  z,MoveLeft
  cp    1
  call  z,MoveRight
  ld    a,c
  cp    -1
  call  z,MoveUp
  cp    1
  call  z,MoveDown
  ret

MoveLeft:
  ld    a,(iy+2)                            ;x
  sub   a,6
  ret   c
  ld    (iy+2),a                            ;x

  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  ld    a,(iy+2)                            ;x
  add   a,6
  ld    (iy+2),a                            ;x
  ret

MoveRight:
  ld    a,(iy+2)                            ;x
  add   a,6
  ret   c
  ld    (iy+2),a                            ;x

  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  ld    a,(iy+2)                            ;x
  sub   a,6
  ld    (iy+2),a                            ;x
  ret

MoveUp:
  ld    a,(iy+1)                            ;y
  sub   a,3
  cp    83
  ret   c
  ld    (iy+1),a                            ;y

  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  ld    a,(iy+1)                            ;y
  add   a,3
  ld    (iy+1),a                            ;y
  ret

MoveDown:
  ld    a,(iy+1)                            ;y
  add   a,3
  cp    120
  ret   nc
  ld    (iy+1),a                            ;y

  call  CheckCollisionNPCs                  ;check if player collides with npcs. out ;d=0(no collision), d=1(collision)
  bit   0,d                                 ;d=0(no collision), d=1(collision)
  ret   z
  ld    a,(iy+1)                            ;y
  sub   a,3
  ld    (iy+1),a                            ;y
  ret

Set_L_stand:
	ld		hl,LStanding
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(PlayerAniCount),a
  ret

Set_R_stand:
	ld		hl,RStanding
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(PlayerAniCount),a
  ret

Set_L_run:
	ld		hl,Lrunning
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(PlayerAniCount),a
  ret

Set_R_run:
	ld		hl,Rrunning
	ld		(PlayerSpriteStand),hl
  xor   a
	ld		(PlayerAniCount),a
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

Host_0:        db    Hostframelistblock, Hostspritedatablock | dw    host_0_0
Host_1:        db    Hostframelistblock, Hostspritedatablock | dw    host_1_0
Host_2:        db    Hostframelistblock, Hostspritedatablock | dw    host_2_0
Host_3:        db    Hostframelistblock, Hostspritedatablock | dw    host_3_0
Host_4:        db    Hostframelistblock, Hostspritedatablock | dw    host_4_0
Host_5:        db    Hostframelistblock, Hostspritedatablock | dw    host_5_0
Host_6:        db    Hostframelistblock, Hostspritedatablock | dw    host_6_0
Host_7:        db    Hostframelistblock, Hostspritedatablock | dw    host_7_0
Host_8:        db    Hostframelistblock, Hostspritedatablock | dw    host_8_0
Host_9:        db    Hostframelistblock, Hostspritedatablock | dw    host_9_0
Host_10:        db    Hostframelistblock, Hostspritedatablock | dw    host_10_0
Host_11:        db    Hostframelistblock, Hostspritedatablock | dw    host_11_0
Host_12:        db    Hostframelistblock, Hostspritedatablock | dw    host_12_0
Host_13:        db    Hostframelistblock, Hostspritedatablock | dw    host_13_0
Host_14:        db    Hostframelistblock, Hostspritedatablock | dw    host_14_0
Host_15:        db    Hostframelistblock, Hostspritedatablock | dw    host_15_0
HostMovementRoutine:
  ld    hl,Host_0
  call  PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

  call  CheckStartConversation              ;out: nz=converstaion starts
  ret   z

  ld    a,NPCConv1Block
  ld    (NPCConvBlock),a
  ld    hl,NPCConv007
  ld    (NPCConvAddress),hl
  ret

Girlidle_0:        db    npcsframelistblock, npcsspritedatablock | dw    npcs_0_0
GirlMovementRoutine:
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
  cp    (iy+2)                              ;x npc
  ret   c
  .CheckLeftSide:                           ;check collision left side
  sub   a,84
  cp    (iy+2)                              ;x npc
  ret   nc

  ld    d,1                                 ;d=0(no collision), d=1(collision)
  ret

dephase
