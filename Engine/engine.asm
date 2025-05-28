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



  jp    LevelEngine









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
