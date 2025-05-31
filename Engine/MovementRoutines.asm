;Rstanding

MovementRoutinesAddress:  equ $4000
Phase MovementRoutinesAddress


TheVessel_0:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_0_0
TheVessel_1:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_1_0
TheVessel_2:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_2_0
TheVessel_3:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_3_0
TheVessel_4:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_4_0
TheVessel_5:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_5_0
TheVessel_6:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_6_0
TheVessel_7:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_7_0
TheVessel_8:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_8_0
TheVessel_9:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_9_0
TheVessel_10:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_10_0
TheVessel_11:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_11_0
TheVessel_12:        db    TheVesselframelistblock, TheVesselspritedatablock | dw    Vessel_12_0

TheVesselleft_0:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_12_0
TheVesselleft_1:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_11_0
TheVesselleft_2:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_10_0
TheVesselleft_3:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_9_0
TheVesselleft_4:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_8_0
TheVesselleft_5:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_7_0
TheVesselleft_6:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_6_0
TheVesselleft_7:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_5_0
TheVesselleft_8:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_4_0
TheVesselleft_9:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_3_0
TheVesselleft_10:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_2_0
TheVesselleft_11:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_1_0
TheVesselleft_12:        db    TheVesselleftframelistblock, TheVesselleftspritedatablock | dw    Vesselleft_0_0
VesselMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz
  ld    hl,(PlayerSpriteStand)
  jp    (hl)

LStanding:
;
; bit	7	6	  5		    4		    3		    2		  1		  0
;		  0	0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		 F2	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
;  ld    a,(NewPrContr);
;	bit		4,a           ;space pressed ?
	ld		a,(Controls)
	bit		0,a           ;cursor up pressed ?
	jp		nz,Set_L_run
	bit		1,a           ;cursor down pressed ?
	jp		nz,Set_L_run
	bit		2,a           ;cursor left pressed ?
	jp		nz,Set_L_run
	bit		3,a           ;cursor right pressed ?
	jp		nz,Set_R_run
  ret

RStanding:
;
; bit	7	6	  5		    4		    3		    2		  1		  0
;		  0	0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		 F2	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
;  ld    a,(NewPrContr);
;	bit		4,a           ;space pressed ?
	ld		a,(Controls)
	bit		0,a           ;cursor up pressed ?
	jp		nz,Set_R_run
	bit		1,a           ;cursor down pressed ?
	jp		nz,Set_R_run
	bit		2,a           ;cursor left pressed ?
	jp		nz,Set_L_run
	bit		3,a           ;cursor right pressed ?
	jp		nz,Set_R_run
  ret

Lrunning:
;
; bit	7	6	  5		    4		    3		    2		  1		  0
;		  0	0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		 F2	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
  and   %0000 1111
  jp    z,Set_L_stand

  ld    a,(iy+2)                            ;x
  sub   a,2
  ld    (iy+2),a                            ;x
;  ld    a,(iy+1)                            ;y
;  add   a,c
;  ld    (iy+1),a                            ;y
  ret

Rrunning:
;
; bit	7	6	  5		    4		    3		    2		  1		  0
;		  0	0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		 F2	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
  and   %0000 1111
  jp    z,Set_R_stand

  ld    a,(iy+2)                            ;x
  add   a,2
  ld    (iy+2),a                            ;x
;  ld    a,(iy+1)                            ;y
;  add   a,c
;  ld    (iy+1),a                            ;y
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

  ld    a,(iy+2)                            ;x
  add   a,1
  ld    (iy+2),a                            ;x
  ret

GirlMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    a,(iy+2)                            ;x
  add   a,3
  ld    (iy+2),a                            ;x
  ret

CapGirlMovementRoutine:
  ld    a,(framecounter)                    ;at max 4 objects can be put in screen divided over 4 frames
  and   3
  ret   nz

  ld    a,(iy+2)                            ;x
  add   a,4
  ld    (iy+2),a                            ;x
  ret


dephase
