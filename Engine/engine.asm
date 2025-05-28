LevelEngine:
  ld    a,(framecounter)
  inc   a
  ld    (framecounter),a

;  ld    hl,vblankintflag    ;this way we speed up the engine when not scrolling
;  ld    a,(hl)
;  ld    (PreviousVblankIntFlag),a

;  ld    a,b                ;we can store the previous vblankintflag time and cp the current with that value
;  ld    hl,vblankintflag    ;this way we speed up the engine when not scrolling
;  .checkflag:
;  cp    (hl)
;  jr    nc,.checkflag
;  ld    (hl),0

  call  PutBossRatty

  halt

  jp    LevelEngine





















PutBossRatty:
  ld    de,BossRattyAll_0
  jp    PutSf2Object4FramesNew                ;CHANGES IX - puts object in 7 frames


BossRattyAll_0:  db    BossRattyframelistblock, BossRattyspritedatablock | dw    BossRattyAll_0_0



PutSf2Object4FramesNew:
	ld    a,(RestoreBackgroundSF2Object?)
	or    a  
	call  nz,restoreBackgroundObject1
  call  MultV7Times4


  inc   hl
	ld    a,(hl)
	ld    (Player1Frame),a                    ;only on slice 1 we need to set the address of this slice
	inc   hl                                  ;all consecutive slices are set at the end of their previous slice in engine.asm (when exiting the blitloop at .exit:)
	ld    a,(hl)
	ld    (Player1Frame+1),a
	call  PutSF2Object                        ;in: b=frame list block, c=sprite data block. CHANGES IX 
	jp    switchpageSF2Engine


MultV7Times4:                               ;each frame= 4 bytes
  ex    de,hl
	ld    b,(hl)                              ;frame list block
	inc   hl
	ld    c,(hl)                              ;sprite data block
  ret




Object1RestoreBackgroundTable:
  dw    RestoreBackgroundObject1Page3,RestoreBackgroundObject1Page0,RestoreBackgroundObject1Page1,RestoreBackgroundObject1Page2
Object2RestoreBackgroundTable:
  dw    RestoreBackgroundObject2Page3,RestoreBackgroundObject2Page0,RestoreBackgroundObject2Page1,RestoreBackgroundObject2Page2

;if we are in page 0 we prepare to restore page 1 in the next frame
;if we are in page 1 we prepare to restore page 2 in the next frame
;if we are in page 2 we prepare to restore page 3 in the next frame
;if we are in page 3 we prepare to restore page 0 in the next frame
restoreBackgroundObject1:
  ld    hl,Object1RestoreBackgroundTable
  jp    GoRestoreObject
restoreBackgroundObject2:
  ld    hl,Object2RestoreBackgroundTable
  jp    GoRestoreObject

GoRestoreObject:
  ld    a,(screenpage)
  add   a,a
  ld    b,0
  ld    c,a
  add   hl,bc
  ld    a,(hl)
  inc   hl
  ld    h,(hl)
  ld    l,a
  jp    docopy



RestoreBackgroundObject1Page0:
	db    0,0,0,3
	db    0,0,0,0
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject1Page1:
	db    0,0,0,0
	db    0,0,0,1
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject1Page2:
	db    0,0,0,1
	db    0,0,0,2
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject1Page3:
	db    0,0,0,2
	db    0,0,0,3
	db    $02,0,$02,0
	db    0,0,$d0  

RestoreBackgroundObject2Page0:
	db    0,0,0,3
	db    0,0,0,0
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject2Page1:
	db    0,0,0,0
	db    0,0,0,1
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject2Page2:
	db    0,0,0,1
	db    0,0,0,2
	db    $02,0,$02,0
	db    0,0,$d0  
RestoreBackgroundObject2Page3:
	db    0,0,0,2
	db    0,0,0,3
	db    $02,0,$02,0
	db    0,0,$d0  


;SF2 global properties for current object and frame
HugeObjectFrame:	db  -1
blitpage:			db  0
screenpage:			db  2
Player1Frame:		dw  0
Object1y:			db  100
Object1x:			db  100
PutObjectInPage3?:				db  0
RestoreBackgroundSF2Object?:	db  1

;Frameinfo looks like this:
;width, height, offset x, offset y
;x offset for first line
;lenght ($1f)+increment ($80) next spriteline, source address (base+00000h etc)
;  dw 01F80h,base+00000h
ScreenLimitxRight:				equ 256-10
ScreenLimitxLeft:				equ 10
moveplayerleftinscreen:			equ 128

Object1RestoreTable:
  dw    RestoreBackgroundObject1Page1,RestoreBackgroundObject1Page2,RestoreBackgroundObject1Page3,RestoreBackgroundObject1Page0
Object2RestoreTable:
  dw    RestoreBackgroundObject2Page1,RestoreBackgroundObject2Page2,RestoreBackgroundObject2Page3,RestoreBackgroundObject2Page0

PutSF2Object:	;section#1
  ld    hl,Object1RestoreTable
  jp    PutSF2ObjectSlice
PutSF2Object2:	;section#2
  ld    hl,Object2RestoreTable
  jp    PutSF2ObjectSlice

;if we are in page 0 we prepare to restore page 1 in the next frame
;if we are in page 1 we prepare to restore page 2 in the next frame
;if we are in page 2 we prepare to restore page 3 in the next frame
;if we are in page 3 we prepare to restore page 0 in the next frame
PutSF2ObjectSlice:
	ld    a,(screenpage)
  add   a,a
  ld    d,0
  ld    e,a
  add   hl,de
  ld    a,(hl)
  ld    ixl,a
  inc   hl
  ld    a,(hl)
  ld    ixh,a

;Put a section of a SF2 object on screen, max 5 sections.
;in b->framelistblock, c->spritedatablock
	ld		a,(slot.page12rom)		;all RAM except page 1+2
	out		($a8),a	
	ld		a,(memblocks.2)
	push	af		;store current block
	ld		a,c		;set framedata in page 1 in rom ($4000 - $7fff)  
	call	block12
	ld		a,b		;set framelist in page 2 in rom ($8000 - $bfff)
	call	block34
 
	di
	call  GoPutSF2Object
	ei

;edit: general movement pattern block is not required anymore at this point
;set the general movement pattern block at address $4000 in page 1
;	di
;	ld	a,MovementPatternsFixedPage1block
	ld	(memblocks.1),a
	ld	($6000),a
;*** LITTLE CORRECTION for PutSf2Object3Frames when using   jp    switchpageSF2Engine after putting SF2 object
;set the movement pattern block of this enemy/object at address $8000 in page 2 
	pop	af                    ;recall movement pattern block of current object
	ld	(memblocks.2),a
	ld	($7000),a
;	ei
  ret




GoPutSF2Object:
	ld    bc,(object1y)		;b=x,c=y ;bc,Object1y
	ld    hl,(Player1Frame)	;points to object width
;	ld    iy,Player1SxB1	;player collision detection blocks

;20240531;ro;removed as it didn't do anything, really
;;screen limit right
;	ld    a,(bc)                ;object x
;	cp    ScreenLimitxRight
;	jp    c,.LimitRight
;	ld    a,ScreenLimitxRight
;;	ld    (bc),a
;.LimitRight:
;;screen limit left
;	ld    a,(bc)                ;object x
;	cp    ScreenLimitxLeft
;	jp    nc,.LimitLeft
;	ld    a,ScreenLimitxLeft
;; 	ld    (bc),a
;.LimitLeft:

;Prep restore-copy for this slice. IX=copyTable
	ld    a,(hl)		;(sliceWidth)
	inc   hl
	ld    (ix+nx),a		
	ld    a,(hl)		;(sliceHeight)
	inc   hl
	ld    (ix+ny),a
;set sy,dy by adding offset y to object y
	ld    a,c ;(bc)		;object Y
	inc   hl
	add   a,(hl)		;(sliceY)
	dec   hl
	ld    d,a
	ld    (ix+sy),a
	ld    (ix+dy),a
	ld    (iy+1),a		;Player1SyB1 (set block 1 sy)
;set sx,dx by adding slice.x to object.x
	ld    e,(hl)		;(sliceX)
	inc   hl			;=sliceY
	inc   hl			;=sliceOffset
	ld    a,b ;(bc)		;object x
	or    a
	jp    p,PutSpriteleftSideOfScreen

PutSpriteRightSideOfScreen:
	sub   a,moveplayerleftinscreen
	add   a,e
	jp    c,putplayer_clipright_totallyoutofscreenright

	ld    (ix+sx),a		;set sx/dx to restore by background
	ld    (ix+dx),a

;clipping check
	ld    a,b			;(bc)		;object X
	sub   moveplayerleftinscreen
	add   a,e			;object.X+frame.X
	add   a,(ix+nx)
	jp    c,putplayer_clipright
	jp    putplayer_noclip

 
PutSpriteleftSideOfScreen:
	sub   a,moveplayerleftinscreen
	add   a,e	;e=frame.X
	jr    c,.carry
	xor   a
.carry:
	ld    (ix+sx),a             ;set sx/dx to restore by background
	ld    (ix+dx),a
;set sy,dy by adding offset y to object y
;	inc   hl
;	dec   bc
;	ld    a,(bc)		;object Y
;	add   a,(hl)		;FrameY
;	ld    d,a
;	ld    (ix+sy),a		;set sy/dy to restore by background
;	ld    (ix+dy),a
;	ld    (iy+1),a		;Player1SyB1 (set block 1 sy)
;Set up restore background que player
;	inc   bc			;=object x
;clipping check
	ld    a,b		;(bc)		;object X
	sub   a,moveplayerleftinscreen
	add   a,e			;object.X+frame.X
	jp    nc,putplayer_clipleft
	jp    putplayer_noclip


;The old list files had unused bytes, skip if that version is used.
SkipFrameBytes:
	inc   hl
	ld    a,(hl)
	dec   hl
	and   A
	ret   nz
	ld    bc,7			;skip unused bytes
	add   hl,bc  
	ret

;in: HL=frameHeader.frameOffset
putplayer_noclip:
	ld    a,b ;(bc)		;object.X
	add   a,(hl)		;add frameOffset for first line to destination x
	inc   hl
	sub   a,moveplayerleftinscreen
	ld    e,a

	call	SkipFrameBytes

	ld    a,(PutObjectInPage3?)
	or    a
	jr    nz,.not3
  ;if screenpage=0 then blit in page 1
  ;if screenpage=1 then blit in page 2
  ;if screenpage=2 then blit in page 3
  ;if screenpage=3 then blit in page 0
	ld    a,(screenpage)
	inc   a

;	cp    4 ;4 would be the new way, 3 is the old way
;	jr    nz,.not3
;	xor   a
	and   3
.not3: 
	add   a,a
	bit   7,d
	jp    z,.setpage
	inc   a
.setpage:
	ld    (blitpage),a
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	srl   d                     ;write addres is de/2
	rr    e
	set   6,d                   ;set write access

;Transfer pixel array to screen
	ld    (spatpointer),sp  
	ld    sp,hl

	ld    a,e
	ld    c,$98
.loop:
	out   ($99),a               ;set x to write to
	ld    a,d
	out   ($99),a               ;set y to write to

	pop   hl                    ;  
	ld    b,h                   ;numPix
	ld    a,l                   ;totalLength (numpix+whitespace)
	pop   hl                    ;pop array address
	otir
	or    a						;is there more?
	jr    z,.exit

	add   a,e                   ;To next array
	ld    e,a                   ;new x
	jr    nc,.loop
	inc   d                     ;0100 0000
	jp    p,.loop

	set   6,d
	res   7,d

	ld    a,(blitpage)
	xor   1
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	ld    a,e
	jp    .loop

.exit:
  ld    (Player1Frame),sp     ;store end of this slice (when will be the start of the next slice)
	ld    sp,(spatpointer)
	ret
  
  
;Player1Frame: ds  2

putplayer_clipright_totallyoutofscreenright:
;20240531;ro;this does absolutely nothing...
;  inc   hl                    ;player y offset
;  inc   hl                    ;=frameOffset
;  inc   hl                    ;=...
;  inc   bc                    ;player x
;  ld    a,(bc)                ;player x
;  sub   a,moveplayerleftinscreen
;  add   a,(hl)                ;add player x offset for first line
;  ld    e,a
;;  jp    SetOffsetBlocksAndAttackpoints
	ret
  
putplayer_clipright:
	ld    a,b ;(bc)		;object.X
	add   a,(hl)		;add frameOffset for first line to destination x
	inc   hl
	sub   a,moveplayerleftinscreen
	ld    e,a

	call  SkipFrameBytes

	ld    a,(PutObjectInPage3?)
	or    a
	jr    nz,.not3
;if screenpage=0 then blit in page 1
;if screenpage=1 then blit in page 2
;if screenpage=2 then blit in page 0
	ld    a,(screenpage)
	inc   a
;	cp    4 ;4 would be the new way, 3 is the old way
;	jr    nz,.not3
;	xor   a
	and   3
.not3:  
	add   a,a
	bit   7,d
	jp    z,.setpage
	inc   a
  .setpage:
	ld    (blitpage),a
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	srl   d                     ;write addres is de/2
	rr    e
	set   6,d                   ;write access

;Transfer pixel array to screen
	ld    (spatpointer),sp  
	ld    sp,hl

	ld    a,e
	ld    c,$98
.loop:
	out   ($99),a               ;set x to write to
	ld    a,d
	out   ($99),a               ;set y to write to

	pop   hl                    ;pop lenght + increment  
	ld    b,h                   ;length

;extra code in case of clipping right
;first check if total piece is out of screen right (or x<64)
	bit   6,e                   
	jr    z,.totallyoutofscreenright
;check if piece is fully within screen
	ld    a,e                   ;x
	or    %1000 0000
	add   a,b
	jr    nc,.endoverflowcheck1  ;nc-> piece is fully within screen
	sub   a,b
	neg
	ld    b,a
.endoverflowcheck1:
;/extra code in case of clipping right

	ld    a,l                   ;totalLength (numpix+whitespace)
	pop   hl                    ;pop array address
	otir
  .skipotir:
	or    a
	jr    z,.exit

	add   a,e                   ;add increment to x
	ld    e,a                   ;new x
	jr    nc,.loop
	inc   d                     ;0100 0000
	jp    p,.loop

	set   6,d
	res   7,d

	ld    a,(blitpage)
	xor   1
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	ld    a,e
	jp    .loop

.exit:
  ld    (Player1Frame),sp
	ld    sp,(spatpointer)
	ret

.totallyoutofscreenright:
	ld    a,l
	pop   hl
	jp    .skipotir             ;piece is totally out of screen, dont otir


putplayer_clipleft:
	ld    a,b	;X (bc)
	add   a,(hl)
	inc   hl
	sub   a,moveplayerleftinscreen
	ld    e,a
	jp    nc,.notcarry
	dec   d
.notcarry:
	call	SkipFrameBytes

	ld    a,(PutObjectInPage3?)
	or    a
	jr    nz,.not3
  ;if screenpage=0 then blit in page 1
  ;if screenpage=1 then blit in page 2
  ;if screenpage=2 then blit in page 0
	ld    a,(screenpage)
	inc   a
;	cp    4 ;4 would be the new way, 3 is the old way
;	jr    nz,.not3
;	xor   a
	and   3
.not3:  
	add   a,a
	bit   7,d
	jp    z,.setpage
	inc   a
.setpage:
	ld    (blitpage),a
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	srl   d                     ;write addres is de/2
	rr    e
	set   6,d                   ;set write access

;Transfer pixel array to screen
	ld    (spatpointer),sp  
	ld    sp,hl

	ld    a,e
	ld    c,$98
.loop:
	pop   hl                    ;pop lenght + increment  
	ld    b,h                   ;length

;check if piece is fully in screen
	bit   6,e                   ;first check if total piece is in screen left (or x<64)
	jr    z,.totallyinscreen    ;z-> piece is fully within screen left

	;look at current x, add lenght, set new lenght accordingly, and then dont output if piece is totally out of screen
	ld    a,e
	or    %1000 0000
	ld    h,a
	add   a,b
	ld    b,a                   ;set new lenght (this is the part that is in screen)
	dec   a
	jp    m,.totallyoutofscreen

	;set new write address
	ld    a,h
	neg
	ld    h,a                   ;distance from x to border of screen
	add   a,e
	out   ($99),a               ;set x to write to
	ld    a,d
	adc   a,0
	jp    p,.nopageoverflow

	set   6,a
	res   7,a
	out   ($99),a               ;set y to write to

	ld    a,(blitpage)
	xor   1
	out   ($99),a               ;write page instellen
	ld    a,14+128
.nopageoverflow:
	out   ($99),a               ;set y to write to

.gosourceaddress:
;set new source address
	ld    a,l                   ;increment
	ex    af,af'                ;store increment
	ld    a,h                   ;distance from x to border of screen

	pop   hl                    ;source address
	add   a,l                   ;add distance from x to border of screen to source address
	ld    l,a
	jr    nc,.noinch
	inc   h
.noinch:
  ex    af,af'                ;recall stored increment
	otir
	jp    .skipotir

.totallyoutofscreen:
	ld    a,l
	pop   hl
	jp    .skipotir             ;piece is totally out of screen, dont otir

.totallyinscreen:
	ld    a,e
	out   ($99),a               ;set x to write to
	ld    a,d
	out   ($99),a               ;set y to write to

	ld    a,l                   ;increment
	pop   hl                    ;pop source address

	otir
.skipotir:
	or    a                     ;check increment
	jr    z,.exit

	add   a,e                   ;add increment to x
	ld    e,a                   ;new x
	jr    nc,.loop

	inc   d                     ;01xx xxxx

	jp    p,.loop

	set   6,d
	res   7,d

	ld    a,(blitpage)
	xor   1
	out   ($99),a               ;write page instellen
	ld    a,14+128
	out   ($99),a

	ld    a,e
	jp    .loop

  .exit:
  ld    (Player1Frame),sp
	ld    sp,(spatpointer)
	ret  










;switch to next page
switchpageSF2Engine:
	ld    a,(screenpage)
	inc   a
	cp    4
	jr    nz,SetSF2DisplayPage
	xor   a
SetSF2DisplayPage:
	ld    (screenpage),a
	add   a,a                   ;x32
	add   a,a
	add   a,a
	add   a,a
	add   a,a
	add   a,31
	ld    (PageOnNextVblank),a
	ret
















vblankintflag2: ds 1
PreviousVblankIntFlag:  db  1
page1bank:  ds  1
page2bank:  ds  1
vblank:
  push  bc
  push  de
  push  hl
  push  ix
  push  iy
  exx
  ex    af,af'
  push  af
  push  bc
  push  de
  push  hl


  call  RePlayer_Tick                 ;initialise, load samples

;  ld    a,(slot.page1rom)              ;all RAM except page 1 and 2
;  out   ($a8),a

;  ld		a,1                             ;set worldmap in bank 1 at $8000
;  out   ($fe),a          	              ;$ff = page 0 ($c000-$ffff) | $fe = page 1 ($8000-$bfff) | $fd = page 2 ($4000-$7fff) | $fc = page 3 ($0000-$3fff) 

;  ld		a,2                             ;set worldmap object layer in bank 2 at $8000
;  out   ($fe),a          	              ;$ff = page 0 ($c000-$ffff) | $fe = page 1 ($8000-$bfff) | $fd = page 2 ($4000-$7fff) | $fc = page 3 ($0000-$3fff) 

;  ld    a,(page1bank)                   ;put the bank back in page 1 which was there before we ran setspritecharacter
;  out   ($fe),a          	              ;$ff = page 0 ($c000-$ffff) | $fe = page 1 ($8000-$bfff) | $fd = page 2 ($4000-$7fff) | $fc = page 3 ($0000-$3fff) 

;  pop   af
;  out   ($a8),a                         ;restore ram/rom page settings     
;  pop   af
;	ld		($7000),a                       ;recall block 2 setting
 ; pop   af
;	ld		($6000),a                       ;recall block 1 setting
	
  ld    a,(PageOnNextVblank)  ;set page
  out   ($99),a
  ld    a,2+128
  out   ($99),a

  ld    a,(vblankintflag)
  inc   a                               ;vblank flag gets incremented
  ld    (vblankintflag),a  

  pop   hl 
  pop   de 
  pop   bc 
  pop   af 
  ex    af,af'  
  exx
  pop   iy 
  pop   ix 
  pop   hl 
  pop   de 
  pop   bc 
  pop   af 
  ei
  ret


SetPaletteOnInterrupt:
	xor		a
	out		($99),a
	ld		a,16+128
	out		($99),a
	ld    c,$9a
	outi | outi | outi | outi | outi | outi | outi | outi
	outi | outi | outi | outi | outi | outi | outi | outi
	outi | outi | outi | outi | outi | outi | outi | outi
	outi | outi | outi | outi | outi | outi | outi | outi
	ret

vblankintflag:  db  0
;lineintflag:  db  0
InterruptHandler:
  push  af

  xor   a                               ;set s#0
  out   ($99),a
  ld    a,15+128
  out   ($99),a
  in    a,($99)                         ;check and acknowledge vblank interrupt
  rlca
  jp    c,vblank                        ;vblank detected, so jp to that routine
 
  pop   af 
  ei
  ret


DivideBCbyDE:
;
; Divide 16-bit values (with 16-bit result)
; In: Divide BC by divider DE
; Out: BC = result, HL = rest
;
Div16:
    ld hl,0
    ld a,b
    ld b,8
Div16_Loop1:
    rla
    adc hl,hl
    sbc hl,de
    jr nc,Div16_NoAdd1
    add hl,de
Div16_NoAdd1:
    djnz Div16_Loop1
    rla
    cpl
    ld b,a
    ld a,c
    ld c,b
    ld b,8
Div16_Loop2:
    rla
    adc hl,hl
    sbc hl,de
    jr nc,Div16_NoAdd2
    add hl,de
Div16_NoAdd2:
    djnz Div16_Loop2
    rla
    cpl
    ld b,c
    ld c,a
    ret

MultiplyHlWithDE:
  push  hl
  pop   bc
;
; Multiply 16-bit values (with 16-bit result)
; In: Multiply BC with DE
; Out: HL = result
;
Mult16:
    ld a,b
    ld b,16
Mult16_Loop:
    add hl,hl
    sla c
    rla
    jr nc,Mult16_NoAdd
    add hl,de
Mult16_NoAdd:
    djnz Mult16_Loop
    ret


;
; Divide 8-bit values
; In: Divide E by divider C
; Out: A = result, B = rest
;
Div8:
    xor a
    ld b,8
Div8_Loop:
    rl e
    rla
    sub c
    jr nc,Div8_NoAdd
    add a,c
Div8_NoAdd:
    djnz Div8_Loop
    ld b,a
    ld a,e
    rla
    cpl
    ret

Backdrop:
  ld    a,r
  .in:
  di
  out   ($99),a
  ld    a,7+128
  ei
  out   ($99),a	
  ret



SetText:                                ;in: b=dx, c=dy, hl->text
  ld    a,212
  ld    (PutLetter+sy),a                ;set dx of text
  
  ld    a,6
  ld    (PutLetter+ny),a                ;set dx of text

  ld    a,b
  ld    (PutLetter+dx),a                ;set dx of text
  ld    (TextDX),a
  ld    a,c
  ld    (PutLetter+dy),a                ;set dy of text
  ld    (TextAddresspointer),hl  
;  ld    a,6
;  ld    (PutLetter+ny),a                ;set ny of text
;  call  SetTextBuildingWhenClicked.SetText
;  ld    a,5
;  ld    (PutLetter+ny),a                ;set ny of text
;  ret
	ld		a,(activepage)                  ;we will copy to the page which was active the previous frame
.SelfModifyingCodeSetTextInCurrentPage: equ $+1
	xor		1                               ;now we switch and set our page
  ld    (PutLetter+dPage),a             ;set page where to put text

  ld    de,-1
  ld    (TextPointer),de                ;increase text pointer
  .NextLetter:
  ld    de,(TextPointer)
  inc   de
  ld    (TextPointer),de                ;increase text pointer

  ld    hl,(TextAddresspointer)

;  ld    d,0
;  ld    e,a
  add   hl,de

  ld    a,(hl)                          ;letter
  cp    255                             ;end
  ret   z
  cp    254                             ;next line
  jp    z,.NextLine




  sub   $41
  ld    hl,.TextCoordinateTable  
  add   a,a                             ;*2
  ld    d,0
  ld    e,a

  add   hl,de
  
  .GoPutLetter:
  ld    a,(hl)                          ;sx
  ld    (PutLetter+sx),a                ;set sx of letter
  inc   hl
  ld    a,(hl)                          ;nx
  ld    (PutLetter+nx),a                ;set nx of letter

  ld    hl,PutLetter
  call  DoCopy

  ld    hl,PutLetter+nx                 ;nx of letter
  ld    a,(PutLetter+dx)                ;dx of letter we just put
  add   a,(hl)                          ;add lenght
  inc   a                               ;+1
  ld    (PutLetter+dx),a                ;set dx of next letter
  
  jp    .NextLetter

  .Number:
;  sub   TextNumber0                     ;hex value of number "0"
  add   a,a                             ;*2
  ld    d,0
  ld    e,a  

  ld    hl,.TextNumberSymbolsSXNX
  add   hl,de
  jr    .GoPutLetter
  
  .TextPercentageSymbol:
  ld    hl,.TextPercentageSymbolSXNX  
  jr    .GoPutLetter

  .TextPlusSymbol:
  ld    hl,.TextPlusSymbolSXNX  
  jr    .GoPutLetter

  .TextMinusSymbol:
  ld    hl,.TextMinusSymbolSXNX  
  jr    .GoPutLetter

  .TextApostrofeSymbol:
  ld    hl,.TextApostrofeSymbolSXNX  
  jr    .GoPutLetter

  .TextColonSymbol:
  ld    hl,.TextColonSymbolSXNX  
  jr    .GoPutLetter

  .TextSlashSymbol:
  ld    hl,.TextSlashSymbolSXNX  
  jr    .GoPutLetter

  .TextQuestionMarkSymbol:
  ld    hl,.TextQuestionMarkSymbolSXNX  
  jr    .GoPutLetter

  .TextCommaSymbol:
  ld    hl,.TextCommaSymbolSXNX  
  jr    .GoPutLetter

  .TextDotSymbol:
  ld    hl,.TextDotSymbolSXNX  
  jr    .GoPutLetter

  .TextOpeningParenthesisSymbol:
  ld    hl,.TextOpeningParenthesisSymbolSXNX  
  jr    .GoPutLetter

  .TextClosingParenthesisSymbol:
  ld    hl,.TextClosingParenthesisSymbolSXNX  
  jr    .GoPutLetter

  .Space:
  ld    a,(PutLetter+dx)                ;set dx of next letter
  add   a,5
  ld    (PutLetter+dx),a                ;set dx of next letter
  jp    .NextLetter

  .NextLine:
  ld    a,(PutLetter+dy)                ;set dy of next letter
  add   a,7
  ld    (PutLetter+dy),a                ;set dy of next letter
  ld    a,(TextDX)
  ld    (PutLetter+dx),a                ;set dx of next letter
  jp    .NextLetter

;                          0       1       2       3       4       5       6       7       8       9
.TextNumberSymbolsSXNX: db 171,4,  175,2,  177,4,  181,3,  184,3,  187,3,  191,3,  195,4,  199,3,  203,3,  158,4  
.TextSlashSymbolSXNX: db  158+49,4  ;"/"
.TextPercentageSymbolSXNX: db  162+49,4 ;"%"
.TextPlusSymbolSXNX: db  166+49,5 ;"+"
.TextMinusSymbolSXNX: db  169+49,5 ;"-"
.TextApostrofeSymbolSXNX: db  053,1  ;"'"
.TextColonSymbolSXNX: db  008,1  ;":"
.TextQuestionMarkSymbolSXNX:  db  223,3 ;"?"
.TextCommaSymbolSXNX:  db  226,2 ;","
.TextDotSymbolSXNX:  db  207,1 ;","
.TextOpeningParenthesisSymbolSXNX:  db  133,2 ;"("
.TextClosingParenthesisSymbolSXNX:  db  134,2 ;")"

;                               A      B      C      D      E      F      G      H      I      J      K      L      M      N      O      P      Q      R      S      T      U      V      W      X      Y      Z
.TextCoordinateTable:       db  084,3, 087,3, 090,3, 093,3, 096,3, 099,3, 102,4, 107,3, 110,3, 113,3, 116,4, 120,3, 123,5, 129,4, 133,3, 136,3, 139,3, 142,3, 145,3, 148,3, 151,3, 154,3, 157,5, 162,3, 165,3, 168,3
;                               a      b      c      d      e      f      g      h      i      j      k      l      m      n      o      p      q      r      s      t      u      v      w      x      y      z     
ds 12
.TextCoordinateTableSmall:  db  000,4, 004,3, 007,3, 010,3, 013,3, 016,2, 019,3, 022,3, 025,1, 026,2, 028,3, 032,1, 033,5, 038,3, 042,3, 046,3, 050,3, 054,2, 057,3, 060,2, 062,3, 065,3, 068,5, 073,3, 076,3, 080,4

 
SetNumber16BitCastleSkipIfAmountIs0:
  ld    a,h
  cp    l
  ret   z

SetNumber16BitCastle:                   ;in hl=number (16bit)
  push  bc
  push  iy
  call  .ConvertToDecimal16bit
  pop   iy
  pop   bc

  ld    hl,TextNumber
  jp    SetText

  .ConvertToDecimal16bit:
  ld    iy,TextNumber
  ld    e,0                             ;e=has an xfold already been set prior ?

  .Check10000Folds:
  ld    d,$30                           ;10000folds in d ($30 = 0)

  .Loop10000Fold:
  or    a
  ld    bc,10000
  sbc   hl,bc                           ;check for 10000 folds
  jr    c,.Set10000Fold
  inc   d
  jr  .Loop10000Fold

  .Set10000Fold:
  ld    a,d
  cp    $30
  jr    z,.EndSet10000Fold  
  ld    e,1                             ;e=has an xfold already been set prior ?
  ld    (iy),d                          ;set 1000fold
  inc   iy
  .EndSet10000Fold:

  add   hl,bc

  .Check1000Folds:
  ld    d,$30                           ;1000folds in d ($30 = 0)

  .Loop1000Fold:
  or    a
  ld    bc,1000
  sbc   hl,bc                           ;check for 1000 folds
  jr    c,.Set1000Fold
  inc   d
  jr  .Loop1000Fold

  .Set1000Fold:
  bit   0,e
  jr    nz,.DoSet1000Fold    
  ld    a,d
  cp    $30
  jr    z,.EndSet1000Fold  
  ld    e,1                             ;e=has an xfold already been set prior ?
  .DoSet1000Fold:
  ld    (iy),d                          ;set 100fold
  inc   iy
  .EndSet1000Fold:

  add   hl,bc

  .Check100Folds:
  ld    d,$30                           ;100folds in d ($30 = 0)

  .Loop100Fold:
  or    a
  ld    bc,100
  sbc   hl,bc                           ;check for 100 folds
  jr    c,.Set100Fold
  inc   d
  jr  .Loop100Fold

  .Set100Fold:
  bit   0,e
  jr    nz,.DoSet100Fold  
  ld    a,d
  cp    $30
  jr    nz,.DoSet100Fold  

  ld    a,(PutLetter+dx)                ;set dx of text
  add   a,4
  ld    (PutLetter+dx),a                ;set dx of text


  jr    .EndSet100Fold  

  .DoSet100Fold:
  ld    e,1                             ;e=has an xfold already been set prior ?
  ld    (iy),d                          ;set 100fold
  inc   iy
  .EndSet100Fold:

  add   hl,bc

  .Check10Folds:
  ld    d,$30                           ;10folds in d ($30 = 0)

  .Loop10Fold:
  or    a
  ld    bc,10
  sbc   hl,bc                           ;check for 10 folds
  jr    c,.Set10Fold
  inc   d
  jr  .Loop10Fold

  .Set10Fold:
  bit   0,e
  jr    nz,.DoSet10Fold
  ld    a,d
  cp    $30
  jr    nz,.DoSet10Fold  

  ld    a,(PutLetter+dx)                ;set dx of text
  add   a,3
  ld    (PutLetter+dx),a                ;set dx of text

  jr    .EndSet10Fold  

  .DoSet10Fold:
  ld    e,1                             ;e=has an xfold already been set prior ?
  ld    (iy),d                          ;set 10fold
  inc   iy
  .EndSet10Fold:

  .Check1Fold:
  ld    bc,10 + $30
  add   hl,bc
  
;  add   a,10 + $30
  ld    (iy),l                          ;set 1 fold
  ld    (iy+1),255                      ;end text
  ret








EnterSpecificRoutineInExtraRoutines:
  ld    (.SelfModifyingCodeRoutine),hl

	ld		a,(memblocks.1)                 ;save page 1 block settings
	push  af
	ld		a,(memblocks.2)                 ;save page 2 block settings
	push  af
  in    a,($a8)      
  push  af                              ;save ram/rom page settings 

  ld    a,(slot.page12rom)              ;all RAM except page 1 and 2
  out   ($a8),a

;  ld    a,ExtraRoutinesCodeBlock       ;Map block
  call  block12                         ;CARE!!! we can only switch block34 if page 1 is in rom  

  .SelfModifyingCodeRoutine:	equ	$+1
  call  $ffff

  pop   af
  out   ($a8),a                         ;restore ram/rom page settings     
  pop   af
  call  block34                         ;CARE!!! we can only switch block34 if page 1 is in rom  
  pop   af
  call  block12                         ;CARE!!! we can only switch block34 if page 1 is in rom    

  xor   a
  ld    (vblankintflag),a
;  ld    (GameStatus),a                  ;0=in game, 1=hero overview menu, 2=castle overview, 3=battle, 4=title screen
  ld    hl,0
;  ld    (CurrentCursorSpriteCharacter),hl
;  jp    EnableScrollScreen

	
putsprite:
	xor		a				;page 0/1
	ld		hl,sprattaddr	;sprite attribute table in VRAM ($17600)
	call	SetVdp_Write
	ld		hl,spat			;sprite attribute table
	ld		c,$98
	call	outix128		;32 sprites
	ret

spat:						;sprite attribute table (y,x)
	db		100,100,00,0	,100,100,04,0	,100,100,08,0	,004,006,12,0
	db		004,006,16,0	,004,182,20,0	,004,182,24,0	,180,006,28,0
	db		180,006,32,0	,180,182,36,0	,180,182,40,0	,046,182,44,0
	db		046,182,48,0	,119,182,52,0	,119,182,56,0	,025,230,60,0

	db		230,230,64,0	,230,230,68,0	,230,230,72,0	,230,230,76,0
	db		230,230,80,0	,230,230,84,0	,230,230,88,0	,230,230,92,0
	db		230,230,00,0	,230,230,00,0	,230,230,00,0	,230,230,00,0
	db		230,230,00,0	,230,230,00,0	,230,230,00,0	,230,230,00,0

FreeToUseFastCopy0:                     ;freely usable anywhere
  db    000,000,000,000                 ;sx,--,sy,spage
  db    000,000,000,000                 ;dx,--,dy,dpage
  db    000,000,000,000                 ;nx,--,ny,--
  db    000,%0000 0000,$D0              ;fast copy -> Copy from right to left     

FreeToUseFastCopy1:                     ;freely usable anywhere
  db    000,000,000,000                 ;sx,--,sy,spage
  db    000,000,000,000                 ;dx,--,dy,dpage
  db    000,000,000,000                 ;nx,--,ny,--
  db    000,%0000 0000,$D0              ;fast copy -> Copy from right to left     

ScreenOff:
  ld    a,(VDP_0+1)                     ;screen off
  and   %1011 1111
  di
  out   ($99),a
  ld    a,1+128
  ei
  out   ($99),a
  ret

ScreenOn:
  ld    a,(VDP_0+1)                     ;screen on
  or    %0100 0000
  di
  out   ($99),a
  ld    a,1+128
  ei
  out   ($99),a
  ret

activepage:		db	0

putlettre:
	db		0,0,212,1
	db		40,0,40,0
	db		16,0,5,0
	db		0,%0000 0000,$98	

StartSaveGameData:
EndSaveGameData:
SaveGameDataLenght: equ EndSaveGameData-StartSaveGameData
