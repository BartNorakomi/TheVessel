;BlockHitGameRoutine

Phase MovementRoutinesAddress

BlockHitGameRoutine:
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  call  MoveCannon
  call  MoveProjectile
  call  CheckShootNewProjectile
  call  .HandlePhase                        ;load graphics, init variables

  ld    a,(framecounter2)
  and   3
  ret   nz
  call  PutNewBlocks
  call  MoveBlocks
  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ld    hl,BlockhitPart1Address
  ld    a,BlockhitGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (128*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,BlockhitPart2Address
  ld    a,BlockhitGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;copy page 0 to page 3
  xor   a
  ld    (CopyPageToPage212High+sPage),a
  ld    a,3
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy

  call  SetArcadeMachine
  call  ResetVariablesBlockHitGame

  ld    a,1
  ld    (SetArcadeGamePalette?),a           ;action on vblank: 1=set palette, 2=set palette and write spat to vram
  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ret

ResetVariablesBlockHitGame:
  ld    hl,BlockhitPalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  ;set y blocks to 213
  ld    a,213
  ld    de,4
  ld    b,32
  ld    hl,spat
  .loop:
  ld    (hl),a                                ;remove sprite from screen display
  add   hl,de
  djnz  .loop

  ;set x blocks to 1
  ld    a,1
  ld    de,4
  ld    b,32
  ld    hl,spat+1
  .loop2:
  ld    (hl),a                                ;remove sprite from screen display
  add   hl,de
  djnz  .loop2

  ld    a,3
  ld    (CannonRow),a
  ld    a,1
  ld    (PutNewBlocksCounter),a
  ld    hl,BlocksColumnsTable-5
  ld    (BlocksColumnsTablePointer),hl

  call  SetBlockHitGameSprites
  ret

BlocksColumnsTable:
  db    1,1,1,1,0
  db    0,0,1,1,1
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0
  db    1,0,1,1,1
  db    0,0,0,1,0
  db    0,1,0,1,1
  db    0,1,1,0,1
  db    0,0,1,0,1
  db    1,0,0,0,0

PutNewBlocks:
  ld    a,(PutNewBlocksCounter)
  dec   a
  ld    (PutNewBlocksCounter),a
  ret   nz
  ld    a,26
  ld    (PutNewBlocksCounter),a

  ld    ix,(BlocksColumnsTablePointer)
  ld    de,5
  add   ix,de
  ld    (BlocksColumnsTablePointer),ix

  ;find free unused block
  ld    hl,spat+1                             ;x block 1
  ld    de,4
  ld    b,31                                  ;check first 31 sprites (last sprite is player projectile)
  ld    c,19                                  ;y first block

  .loop:
  ld    a,(hl)                                ;x block
  dec   a
  jr    z,.FreeEntryFound
  add   hl,de
  djnz  .loop
  ret

  .FreeEntryFound:
  ld    a,(ix)
  or    a
  jr    nz,.PutBlock
  ld    a,c
  add   a,22
  ld    c,a
  cp    107+22
  ret   nc
  inc   ix
  add   hl,de
  djnz  .loop

  .PutBlock:
  ld    (hl),250
  dec   hl                                    ;y block
  ld    (hl),c
  inc   hl                                    ;x block
  ld    a,c
  add   a,22
  ld    c,a
  cp    107+22
  ret   nc
  inc   ix
  add   hl,de
  djnz  .loop

MoveBlocks:
  ld    hl,spat+1                             ;x block 1
  ld    de,4
  ld    b,31                                  ;check first 31 sprites (last sprite is player projectile)

  .loop:
  ld    a,(hl)                                ;x block
  dec   a
  jr    z,.Skip
  ld    (hl),a
  sub   249-12
  jr    c,.Skip

  add   a,a                                   ;*2
  add   a,a                                   ;*4
  inc   hl                                    ;character
;  ld a,10*4
  ld    (hl),8
  dec   hl

  .Skip:
  add   hl,de
  djnz  .loop
  ret

SetBlockHitGameSprites:
  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr+0*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ;there are 13 different blocks with sizes from 1 pixel to 13 pixels, we write them to character table, sprites can switch size with the 3d byte in the spat table
	ld		hl,BlockCharacter13PixWide	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix384		;write sprite color of pointer and hand to vram
	call	outix32		  ;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+0*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

  ld    b,32
  .loop:
  push  bc
	ld		hl,RedBlockColor	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix16	;write sprite color of pointer and hand to vram
  pop   bc
  djnz  .loop
  ret

RedBlockColor:
  db 7,6,5,5,5,5,5,5,5,5,5,5,5,5,6,7

CheckShootNewProjectile:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  bit   4,a                           ;space pressed ?
  ret   z

  ld    a,48
  ld    (spat+1+31*4),a               ;x projectile
  xor   a
  ld    (spat+2+31*4),a               ;character projectile

  ld    a,(CannonRow)
  dec   a
  ld    b,19
  jr    z,.SetYProjectile
  dec   a
  ld    b,19+22
  jr    z,.SetYProjectile
  dec   a
  ld    b,19+44
  jr    z,.SetYProjectile
  dec   a
  ld    b,19+66
  jr    z,.SetYProjectile
  ld    b,19+88

  .SetYProjectile:
  ld    a,b
  ld    (spat+0+31*4),a
  ret

MoveProjectile:
  ld    a,(spat+1+31*4)               ;x projectile
  dec   a
  ret   z                             ;dont move if x projectile=1 (that means projectile is not in play)
  add   a,10
  ld    (spat+1+31*4),a               ;x projectile
  cp    240
  ret   c
  ld    a,1
  ld    (spat+1+31*4),a               ;x projectile
  ld    a,213
  ld    (spat+0+31*4),a               ;y projectile
  ret

MoveCannon:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  and   %0000 0011
  ret   z
  cp    %0000 0001
  jr    z,.UpPressed

  .DownPressed:
  ld    a,(CannonRow)
  inc   a
  cp    6
  ret   z
  ld    (CannonRow),a
  jp    PutCannon1RowLower

  .UpPressed:
  ld    a,(CannonRow)
  dec   a
  ret   z
  ld    (CannonRow),a
  jp    PutCannon1RowHigher

PutCannon1RowHigher:
  ld    a,(CannonRow)
  dec   a
  ld    hl,.Row1
  jp    z,DoCopy
  dec   a
  ld    hl,.Row2
  jp    z,DoCopy
  dec   a
  ld    hl,.Row3
  jp    z,DoCopy
  ld    hl,.Row4
  jp    DoCopy

.Row1:
	db		008,0,064,3
	db		008,0,020,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row2:
	db		008,0,064,3
	db		008,0,042,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row3:
	db		008,0,064,3
	db		008,0,064,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row4:
	db		008,0,064,3
	db		008,0,086,0
	db		034,0,026+22,0
	db		0,0,$d0

PutCannon1RowLower:
  ld    a,(CannonRow)
  sub   a,2
  ld    hl,.Row2
  jp    z,DoCopy
  dec   a
  ld    hl,.Row3
  jp    z,DoCopy
  dec   a
  ld    hl,.Row4
  jp    z,DoCopy
  ld    hl,.Row5
  jp    DoCopy

.Row2:
	db		008,0,064-22,3
	db		008,0,042-22,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row3:
	db		008,0,064-22,3
	db		008,0,064-22,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row4:
	db		008,0,064-22,3
	db		008,0,086-22,0
	db		034,0,026+22,0
	db		0,0,$d0

.Row5:
	db		008,0,064-22,3
	db		008,0,108-22,0
	db		034,0,026+22,0
	db		0,0,$d0

BlockhitPalette:
  incbin "..\grapx\Blockhit\Blockhit.sc5",$7680+7,32






BlockCharacter13PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248

BlockCharacter12PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240

BlockCharacter11PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224

BlockCharacter10PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192

BlockCharacter9PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128

BlockCharacter8PixWide:
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 255
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter7PixWide:
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 254
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter6PixWide:
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 252
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter5PixWide:
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 248
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter4PixWide:
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 240
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter3PixWide:
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 224
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter2PixWide:
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 192
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0

BlockCharacter1PixWide:
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 128
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0
  db 0






dephase
