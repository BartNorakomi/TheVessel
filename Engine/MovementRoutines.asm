;Rstanding

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

  ld    a,(iy+2)                            ;x
  add   a,b
  add   a,b
  add   a,b
  add   a,b
  add   a,b
  add   a,b
  ld    (iy+2),a                            ;x
  ld    a,(iy+1)                            ;y
  add   a,c
  ld    (iy+1),a                            ;y

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
  ld    hl,TheVesselleftrunning_0
  add   hl,de
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable

Rrunning:
  call  GetMovementInBC                     ;reads our controls and sets total xy movement in bc 
  ld    a,b
  cp    -1
  jp    z,Set_L_stand
  or    c
  jp    z,Set_R_stand

  ld    a,(iy+2)                            ;x
  add   a,b
  add   a,b
  add   a,b
  add   a,b
  add   a,b
  add   a,b
  ld    (iy+2),a                            ;x
  ld    a,(iy+1)                            ;y
  add   a,c
  ld    (iy+1),a                            ;y

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
  ld    hl,TheVesselrightrunning_0
  add   hl,de
  jp    PutSpritePose                       ;in hl=spritepose, out writes spritepose to objecttable


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
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
ret
  ld    a,(iy+2)                            ;x
  add   a,1
  ld    (iy+2),a                            ;x
  ret

GirlMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
ret
  ld    a,(iy+2)                            ;x
  add   a,3
  ld    (iy+2),a                            ;x
  ret

CapGirlMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
ret
  ld    a,(iy+2)                            ;x
  add   a,4
  ld    (iy+2),a                            ;x
  ret


dephase
