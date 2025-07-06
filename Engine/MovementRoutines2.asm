;UpgradeMenuEventRoutine

Phase MovementRoutinesAddress


UpgradeMenuEventRoutine:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever (so we always stay on page 2 for the game, and page 0 for the hud)



  call  .HandlePhase                        ;used to build up screen and initiate variables
  ret

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  ret   nz
  ld    (iy+ObjectPhase),1

  ld    a,0*32 + 31                         ;page 0
	ld    (PageOnNextVblank),a

  call  SetFontUpgradeMenuThickPage1Y212    ;set font at (0,212) page 0

  ld    a,018                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ;UPGRADES
  ld    b,050                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,.TextUpgrades
  call  SetText2

  ;fuel tank
  inc   ix
  ld    b,017                               ;dx
  ld    c,022                               ;increase in dy
  call  SetText2
  ;cargo size
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2
  ;drill cone
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2
  ;miner speed
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2


  ;READY?
  ld    a,186                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    b,058                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,.TextReady?
  call  SetText2
ret

  ;LIFE SUPPORT
  inc   ix
  ld    b,023                               ;dx
  ld    c,015                               ;increase in dy
  call  SetText2

  ;oxygen
  inc   ix
  ld    b,013                               ;dx
  ld    c,015                               ;increase in dy
  call  SetText2
  ;food
  inc   ix
  ld    b,013                               ;dx
  ld    c,011                               ;increase in dy
  call  SetText2
  ;water
  inc   ix
  ld    b,013                               ;dx
  ld    c,011                               ;increase in dy
  call  SetText2

  ;PURCHASE 
  inc   ix
  ld    b,033                               ;dx
  ld    c,015                               ;increase in dy
  call  SetText2

  ;Oxygen Generator 
  inc   ix
  ld    b,013                               ;dx
  ld    c,015                               ;increase in dy
  call  SetText2
  ;Water Recycler
  inc   ix
  ld    b,013                               ;dx
  ld    c,011                               ;increase in dy
  call  SetText2
  ;Radiation Shield
  inc   ix
  ld    b,013                               ;dx
  ld    c,011                               ;increase in dy
  call  SetText2
  ;Dig Site
  inc   ix
  ld    b,013                               ;dx
  ld    c,011                               ;increase in dy
  call  SetText2
  ;Colony
  inc   ix
  ld    b,013                               ;dx
  ld    c,011                               ;increase in dy
  call  SetText2
  ret











.TextReady?:
  db    "READY?",255


.TextUpgrades:
  db    "UPGRADES",255
  db    "Fuel Tank Lvl 2",255
  db    "Cargo Size Lvl 2",255
  db    "Drill Cone Lvl 2",255
  db    "Miner Speed Lvl 2",255

  db    "LIFE SUPPORT",255
  db    "Oxygen",255
  db    "Food",255
  db    "Water",255

  db    "PURCHASE",255
  db    "Oxygen Generator",255
  db    "Water Recycler",255
  db    "Radiation Shield",255
  db    "Dig Site",255
  db    "abcdABCDColony",255


SetText2:                               ;in: ix->text
  ld    a,b                             ;dx text
  ld    (PutLetter+dx),a                ;set dx of next letter
  ld    a,(PutLetter+dy)                ;set dy of text
  add   a,c                             ;increase in dy
  ld    (PutLetter+dy),a                ;set dy of text

	ld    a,(PageOnLineInt)
  cp    1*32 + 31
  ld    a,1
  jr    z,.SetdPage
  xor   a
  .SetdPage:
  ld    (PutLetter+dPage),a             ;set page where to put text

  .NextLetter:
  ld    a,212
  ld    (PutLetter+sy),a                ;set sy of letter

  ld    a,(ix)                          ;letter
  cp    EndConversation                 ;end
  ret   z
  ld    a,(ix)                          ;letter
  sub   $20

  .FindRow:
  sub   32                              ;32 symbols per row
  jr    c,.RowFound
  push  af
  ld    a,(PutLetter+sy)                ;set sy of letter
  add   a,13                            ;height of each symbol/row
  ld    (PutLetter+sy),a                ;set sy of letter
  pop   af
  jr    .FindRow
  .RowFound:

  add   a,a                             ;*2
  add   a,a                             ;*4
  add   a,a                             ;*8
  ld    (PutLetter+sx),a                ;set sx of letter

  ;set nx
  ld    a,(ix)                          ;letter
  sub   $20
  ld    hl,NXPerSymbol2
  ld    d,0
  ld    e,a
  add   hl,de
  ld    a,(hl)
  ld    (PutLetter+nx),a

  ld    hl,PutLetter
  call  DoCopy

  ld    hl,PutLetter+nx                 ;nx of letter
  ld    a,(PutLetter+dx)                ;dx of letter we just put
  add   a,(hl)                          ;add lenght
  ld    (PutLetter+dx),a                ;set dx of next letter

  inc   ix                              ;next letter
  ld    a,(ix)
  cp    $20                             ;is the next letter a space ? in other words, are we going to our next word ?
  jp    nz,.NextLetter

  ;the next letter is a space, we now need to calculate if the next word is gonna fit in the screen, if not put the next word on the next line
  call  CalculateLenghtNextWord         ;out: b=total lenght next word

  ld    a,(PutLetter+dx)                ;set dx of next letter
  add   a,b
  jp    nc,.NextLetter                  ;put next word if it fits the line

  inc   ix                              ;skip the space, since we are going to the next row
  ld    a,dxText                        ;dx text
  ld    (PutLetter+dx),a                ;set dx of next letter

  ld    a,(PutLetter+dy)                ;dy
  add   a,14                            ;next row
  ld    (PutLetter+dy),a                ;dy
;  cp    b
;  jp    c,.NextLetter
  jp    .NextLetter

NXPerSymbol2:
;   space   !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
;  db  008,002,005,004,004,004,004,003,004,004,004,004,003,004,002,004,006,006,006,006,006,006,006,006,006,006,002,003,004,004,004,006
;           A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^
;  db  004,006,006,006,006,006,006,006,006,002,006,006,006,006,006,006,006,006,006,006,006,006,006,006,006,006,006,004,004,004,004,004
;           a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~
;  db  004,006,006,006,006,006,006,006,006,002,005,006,002,006,006,006,006,006,006,006,006,006,006,006,006,006,006,004,004,004,004,004

;   space       !     "     #     $     %     &     '     (     )     *     +     ,     -     .     /     0     1     2     3     4     5     6     7     8     9     :     ;     <     =     >     ?
  db  006+2,002+2,005+2,004+2,007+0,006+2,004+2,003+2,004+2,004+2,004+2,004+2,003+2,004+2,002+2,004+2,007+0,005+0,008+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,002+0,003+0,004+0,004+0,004+0,006+0
;               A     B     C     D     E     F     G     H     I     J     K     L     M     N     O     P     Q     R     S     T     U     V     W     X     Y     Z     [     \     ]     ^
  db  007+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,003+0,005+0,007+0,005+0,009+0,009+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,009+0,008+0,007+0,007+0,006+0,004+0,004+0,004+0,004+0
;               a     b     c     d     e     f     g     h     i     j     k     l     m     n     o     p     q     r     s     t     u     v     w     x     y     z     {     |     }     ~
  db  007+0,007+0,007+0,007+0,007+0,007+0,005+0,007+0,007+0,003+0,005+0,007+0,005+0,009+0,007+0,007+0,007+0,007+0,005+0,007+0,005+0,007+0,007+0,009+0,007+0,007+0,007+0,006+0,004+0,004+0,004+0,004+0
 















dephase
