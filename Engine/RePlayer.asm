;
; Re-Play player
;
	INCLUDE "MoonSound.asm"
;	INCLUDE "RePlayerSFX.asm"

WorldSong:                          equ 15  ;this is the total of all the worldsongs
SongVictory:                        equ 1
SongDefeat:                         equ 2
SongDewA:                           equ 3
SongDewB:                           equ 4
SongGloomyA:                        equ 5
SongGloomyB:                        equ 6
SongHaze:                           equ 7
SongTitle:                          equ 8
SongSolitude:                       equ 9
SongSquareA:                        equ 10
SongSquareB:                        equ 11
SongWarzoneA:                       equ 12
SongWarzoneB:                       equ 13
SongWarzoneC:                       equ 14

CurrentSongBeingPlayed:             db  0

RePlayer_STACK_CAPACITY: equ 128
FormatOPL4_ID: equ 1

LoadSamplesAndPlaySong0:
	ld    a,(RePlayer_playing)
	and   a
	ret   nz

  ld    a,0
  ld    (CurrentSongBeingPlayed),a
  call  RePlayer_Stop
  ld    bc,0                          ;track nr
  ld    a,TheVesselrepBlock and 255             ;ahl = sound data (after format ID, so +1)
  ld    hl,$8000+1
  call  RePlayer_Play                 ;bc = track number, ahl = sound data (after format ID, so +1)
  jp    RePlayer_Tick                 ;initialise, load samples

VGMRePlay:
  ld    a,(slot.page12rom)            ;all RAM except page 1+2
  out   ($a8),a
  ei
  
  ld    a,FormatOPL4_ID
  call  RePlayer_Detect               ;detect moonsound
;  call  RePlayerSFX_Initialize
  ld a,MusicOn?	;debug function to skip sample load
  and a
  ret z
  ld    bc,0                          ;track nr 0 will alos initialize samples
  ld    a,TheVesselrepBlock and 255               ;ahl = sound data (after format ID, so +1)
  ld    hl,$8000+1
  call  RePlayer_Play                 ;bc = track number, ahl = sound data (after format ID, so +1)
  call	RePlayer_Tick
  jp    RePlayer_Stop





; a = format ID (first byte of sound data)
; f <- c: found
RePlayer_Detect:
	call RePlayer_Detect_Format
	jp c,RePlayer_SetJumpTable
	jp RePlayer_ClearJumpTable

; a = format ID (first byte of sound data)
; f <- c: found
RePlayer_Detect_Format:
;	cp FormatOPN_ID
;	jp z,FormatOPN_Detect
	cp FormatOPL4_ID
	jp z,FormatOPL4_Detect
;	cp FormatOPLLPSG_ID
;	jp z,FormatOPLLPSG_Detect
	and a
	ret

FormatOPL4_Detect:
	call MoonSound_Detect
	ld hl,MoonSound_JumpTable
	ret

; f <- c: found
; hl = jump table
RePlayer_SetJumpTable:
	ld de,RePlayer_Process
	ld bc,3 * 3
	ldir
	ret

; f <- c: found
RePlayer_ClearJumpTable:
	ld hl,RePlayer_Process
	ld de,RePlayer_Process + 1
	ld bc,3 * 3 - 1
	ld (hl),0C9H  ; ret
	ldir
	ret

; bc = track number
; ahl = sound data (after format ID, so +1)
RePlayer_Play:
	add hl,bc
	add hl,bc
	add hl,bc
	add hl,bc
	ld b,a
	xor a
	ld (RePlayer_playing),a
	ld a,b
	ld ix,RePlayer_stack
;	RePlayer_Push_M
	ld (ix + 0),l
	ld (ix + 1),h
	ld (ix + 2),a
	inc ix
	inc ix
	inc ix
	ld a,1
	ld (ix),a
	ld (RePlayer_stackPointer),ix
	ld (RePlayer_playing),a
	ret

RePlayer_Stop:
	xor a
	ld (RePlayer_playing),a
	call RePlayer_Mute
	ret

RePlayer_Resume:
	call RePlayer_Restore
	ld a,1
	ld (RePlayer_playing),a
	ret

;RePlayer_TogglePause:
;	ld a,(RePlayer_playing)
;	and a
;	jr z,RePlayer_Resume
;	jr RePlayer_Stop

RePlayer_currentBank: equ memblocks.2
RePlayer_BANK_REGISTER: equ 7000H
RePlayer_Tick:
  ld    a,(slot.page12rom)             ;all RAM except page 1+2
  out   ($a8),a

;	call RePlayerSFX_Tick

  ld    a,(ChangeSong?)
  or    a
  jr    nz,.ChangeSong
  .DontChangeSong:

	ld a,(RePlayer_playing)
	and a
	ret z
	ld ix,(RePlayer_stackPointer)
	dec (ix)
	ret nz
	ld a,(RePlayer_currentBank)
	push af
;	RePlayer_Pop_M
	dec ix
	dec ix
	dec ix
	ld l,(ix + 0)
	ld h,(ix + 1)
	ld a,(ix + 2)
	ld (RePlayer_currentBank),a
;	RePlayer_SetBank_M
;	ld (7000H),a

	ld (RePlayer_BANK_REGISTER + 100H),a


	call RePlayer_Process
	ld b,a
	ld a,(RePlayer_currentBank)
;	RePlayer_Push_M
	ld (ix + 0),l
	ld (ix + 1),h
	ld (ix + 2),a
	inc ix
	inc ix
	inc ix
	ld (ix),b
	ld (RePlayer_stackPointer),ix
	pop af
	ld (RePlayer_currentBank),a
;	RePlayer_SetBank_M
;	ld (7000H),a

	ld (RePlayer_BANK_REGISTER),a

	ret

  .ChangeSong:
  ld    hl,CurrentSongBeingPlayed
  cp    (hl)
  jr    z,.DontChangeSong

  or    a
  jp    m,.StopSong

  ;randomize worldsong
  cp    WorldSong
  jr    nz,.EndCheckRandomizeWorldSong

	ld	a,r
	cp	22
	ld	b,SongDewA
	jr	c,.WorldSongFound
	cp	44
	ld	b,SongDewB
	jr	c,.WorldSongFound
	cp	66
	ld	b,SongGloomyA
	jr	c,.WorldSongFound
	cp	88
	ld	b,SongGloomyB
	jr	c,.WorldSongFound
	cp	110
	ld	b,SongHaze
	jr	c,.WorldSongFound
;	cp	132
	ld	b,SongSolitude
;	jr	c,.WorldSongFound
	.WorldSongFound:
	ld	a,b

  .EndCheckRandomizeWorldSong:
  ;/randomize worldsong

  ld    (CurrentSongBeingPlayed),a
  ld    c,a
  ld    b,0
  push  bc
  call  RePlayer_Stop
  pop   bc                            ;track nr
;  ld    bc,3                          ;track nr
  ld    a,TheVesselrepBlock and 255               ;ahl = sound data (after format ID, so +1)
  ld    hl,$8000+1
  call  RePlayer_Play                 ;bc = track number, ahl = sound data (after format ID, so +1)
;  call  RePlayer_Tick                 ;initialise, load samples
  xor   a
  ld    (ChangeSong?),a
  ret

  .StopSong:
  call  RePlayer_Stop
  xor   a
  ld    (ChangeSong?),a
  ret
  


; hl = sound data
;RePlayer_Jump_M: MACRO
;	ld e,(hl)
;	inc hl
;	ld d,(hl)
;	inc hl
;	ld a,(RePlayer_currentBank)
;	add a,(hl)
;	inc hl
;	add hl,de
;	ld (RePlayer_currentBank),a
;	RePlayer_SetBank_M
;	ENDM

; hl = sound data
; ix = stack pointer
;RePlayer_Call_M: MACRO
;	ld e,(hl)
;	inc hl
;	ld d,(hl)
;	inc hl
;	ld b,(hl)
;	inc hl
;	ld a,(RePlayer_currentBank)
;	RePlayer_Push_M
;	add hl,de
;	add a,b
;	ld (RePlayer_currentBank),a
;	RePlayer_SetBank_M
;	ENDM

; hl = sound data
; ix = stack pointer
;RePlayer_Return_M: MACRO
;	RePlayer_Pop_M
;	ld (RePlayer_currentBank),a
;	RePlayer_SetBank_M
;	ENDM

; hl = value
; ix = stack pointer
; ix <- stack pointer
;RePlayer_Push_M: MACRO
;	ld (ix + 0),l
;	ld (ix + 1),h
;	ld (ix + 2),a
;	inc ix
;	inc ix
;	inc ix
;	ENDM

; ix = stack pointer
; hl <- value
; ix <- stack pointer
;RePlayer_Pop_M: MACRO
;	dec ix
;	dec ix
;	dec ix
;	ld l,(ix + 0)
;	ld h,(ix + 1)
;	ld a,(ix + 2)
;	ENDM

RePlayer_playing:
	db 0
RePlayer_stackPointer:
	dw RePlayer_stack
RePlayer_stack:
	ds RePlayer_STACK_CAPACITY * 3 + 1
RePlayer_Process:
	db 0C9H, 0, 0
RePlayer_Mute:
	db 0C9H, 0, 0
RePlayer_Restore:
	db 0C9H, 0, 0
