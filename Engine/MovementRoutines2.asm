;UpgradeMenuEventRoutine
;DrillingLocationsRoutine
;RacingGameRoutine

Phase MovementRoutinesAddress



RacingGameRoutine:
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever (so we always stay on page 2 for the game, and page 0 for the hud)

  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  call  AnimateRoad
  call  .HandlePhase                        ;used to build up screen and initiate variables
  ret

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  ret   nz
  ld    (iy+ObjectPhase),1

;  ld    a,32
;  ld    (r23onVblank),a

;  ld    a,1
;  ld    (SetLineIntHeightOnVblankDrillingGame?),a
  call  SetInterruptHandlerRacingGame
  ret

AnimateRoad:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		5,a           ;trig b pressed ?
  jp    nz,.ChangePalette
	bit		4,a           ;space pressed ?
  jp    nz,.CurveEnd
	bit		3,a           ;right pressed ?
  jp    nz,.RightPressed
	bit		2,a           ;left pressed ?
  jp    nz,.LeftPressed
	bit		1,a           ;down pressed ?
  jp    nz,.DownPressed
	bit		0,a           ;up pressed ?
  jp    nz,.UpPressed
  ret

  .ChangePalette:
  ld    a,(CurrentRacingGamePalette)
  add   a,32
  cp    6*32
  jr    nz,.notzero
  xor   a
  .notzero:
  ld    (CurrentRacingGamePalette),a
  ld    e,a
  ld    d,0
  ld    hl,.PaletteOriginal
  add   hl,de
  call  SetPalette
  ret
  .PaletteOriginal:
  incbin "..\grapx\RacingGame\TrackStraightPalette.SC5",$7680+7,32
  .Palette1:
  incbin "..\grapx\RacingGame\Palette1.SC5",$7680+7,32
  .Palette2:
  incbin "..\grapx\RacingGame\Palette2.SC5",$7680+7,32
  .Palette3:
  incbin "..\grapx\RacingGame\Palette3.SC5",$7680+7,32
  .Palette4:
  incbin "..\grapx\RacingGame\Palette4.SC5",$7680+7,32
  .Palette5:
  incbin "..\grapx\RacingGame\Palette5.SC5",$7680+7,32



  .CurveEnd:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(Controls)
	bit		3,a           ;right pressed ?
  jp    nz,.CurveRightEnd
	bit		2,a           ;left pressed ?
  jp    nz,.CurveLeftEnd
	bit		1,a           ;down pressed ?
  jp    nz,.CurveDownEnd
	bit		0,a           ;up pressed ?
  jp    nz,.CurveUpEnd

  .CurveDownEnd:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveDownEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveDownEnd
	ld		(RoadAnimationIndexesBlock),a
  ret

  .CurveLeftEnd:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveLeftEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveLeftEnd
	ld		(RoadAnimationIndexesBlock),a
  ret

  .CurveRightEnd:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveRightEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveRightEnd
	ld		(RoadAnimationIndexesBlock),a
  ret

  .CurveUpEnd:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveUpEndDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveUpEnd
	ld		(RoadAnimationIndexesBlock),a
  ret

  .UpPressed:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveUpDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveUp
	ld		(RoadAnimationIndexesBlock),a
  ret

  .DownPressed:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveDownDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveDown
	ld		(RoadAnimationIndexesBlock),a
  ret

  .LeftPressed:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveLeftDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveLeft
	ld		(RoadAnimationIndexesBlock),a
  ret

  .RightPressed:
  ld    a,1
  ld    (AnimateRoad?),a
  ld    hl,CurveRightDataFiles
  ld    (RoadCurvatureAnimationPointer),hl
  ld    a,RoadAnimationIndexesBlockCurveRight
	ld		(RoadAnimationIndexesBlock),a
  ret










SetInterruptHandlerRacingGame:
  di
  ld    hl,InterruptHandlerRacingGame
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

  ld    a,1
  ld    (LineIntPartRaceGame),a
  ld    hl,StraightRoad01Part2
  ld    (PointerToSwapLines),hl
  
  xor   a
  ld    (LineIntHeightRacingGame),a
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  ei
  out   ($99),a 
  ret



DigSite1dx:  equ 152
DigSite1dy:  equ 049
DigSite2dx:  equ 183
DigSite2dy:  equ 095
DigSite3dx:  equ 039
DigSite3dy:  equ 063
DigSite4dx:  equ 099
DigSite4dy:  equ 011
DigSite5dx:  equ 013
DigSite5dy:  equ 136

DrillingLocationsRoutine:
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever (so we always stay on page 2 for the game, and page 0 for the hud)

  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  call  .HandlePhase                        ;used to build up screen and initiate variables
  call  AnimateSelectedDigSite
  call  ChooseDigSite
  ret

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  ret   nz
  ld    (iy+ObjectPhase),1

  call  SetPinPointsInPage1

  ld    a,1
  ld    (DigSiteSelected),a

  ld    a,000                               ;sx
  ld    (SetPinPoint+sx),a
  ld    a,035                               ;sy
  ld    (SetPinPoint+sy),a
  
  ld    a,(AmountOfDigSitesUnlocked)
  cp    2
  jr    z,.DigSite2
  cp    3
  jr    z,.DigSite3
  cp    4
  jr    z,.DigSite4

  .DigSite5:
  ld    a,DigSite5dx                        ;dx
  ld    (SetPinPoint+dx),a
  ld    a,DigSite5dy                        ;dy
  ld    (SetPinPoint+dy),a
  ld    hl,SetPinPoint
  call  DoCopy
  .DigSite4:
  ld    a,DigSite4dx                        ;dx
  ld    (SetPinPoint+dx),a
  ld    a,DigSite4dy                        ;dy
  ld    (SetPinPoint+dy),a
  ld    hl,SetPinPoint
  call  DoCopy
  .DigSite3:
  ld    a,DigSite3dx                        ;dx
  ld    (SetPinPoint+dx),a
  ld    a,DigSite3dy                        ;dy
  ld    (SetPinPoint+dy),a
  ld    hl,SetPinPoint
  call  DoCopy
  .DigSite2:
  ld    a,DigSite2dx                        ;dx
  ld    (SetPinPoint+dx),a
  ld    a,DigSite2dy                        ;dy
  ld    (SetPinPoint+dy),a
  ld    hl,SetPinPoint
  call  DoCopy

  ld    a,DigSite1dx                        ;dx
  ld    (SetPinPoint+dx),a
  ld    a,DigSite1dy                        ;dy
  ld    (SetPinPoint+dy),a
  ld    hl,SetPinPoint
  jp    DoCopy

AnimateSelectedDigSite:
  ld    a,(framecounter2)                   ;used as animation counter
  and   3
  ret   nz

  ld    a,(DigSiteSelected)
  dec   a
  ld    b,DigSite1dx                        ;dx
  ld    c,DigSite1dy                        ;dy
  jr    z,.DigSiteFound
  dec   a
  ld    b,DigSite2dx                        ;dx
  ld    c,DigSite2dy                        ;dy
  jr    z,.DigSiteFound
  dec   a
  ld    b,DigSite3dx                        ;dx
  ld    c,DigSite3dy                        ;dy
  jr    z,.DigSiteFound
  dec   a
  ld    b,DigSite4dx                        ;dx
  ld    c,DigSite4dy                        ;dy
  jr    z,.DigSiteFound
  ld    b,DigSite5dx                        ;dx
  ld    c,DigSite5dy                        ;dy
  .DigSiteFound:

  ld    a,b                                 ;dx
  ld    (SetPinPoint+dx),a
  ld    a,c                                 ;dy
  ld    (SetPinPoint+dy),a

;  ld    a,000                               ;sy
;  ld    (SetPinPoint+sy),a

  ld    hl,SetPinPoint
  call  DoCopy

  ld    a,(SetPinPoint+sx)
  add   a,24
  ld    (SetPinPoint+sx),a
  cp    144
  ret   c
  xor   a
  ld    (SetPinPoint+sx),a

  ld    a,(SetPinPoint+sy)
  xor   35
  ld    (SetPinPoint+sy),a
  ret

ChooseDigSite:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;space pressed ?
  jr    nz,.SpacePressedStartDrillingGame
	bit		3,a           ;right pressed ?
  jr    nz,.RightPressed
	bit		2,a           ;left pressed ?
  jr    nz,.LeftPressed
	bit		1,a           ;down pressed ?
  jr    nz,.DownPressed
	bit		0,a           ;up pressed ?
  jr    nz,.UpPressed
  ret

  .SpacePressedStartDrillingGame:
  ld    a,12                                ;drilling game
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret    

  .UpPressed:
  ld    hl,.UpPressedDigSiteOrder
  call  .SetHLtoCurrentDigSite
  call  .SetNextDigSite
  ret

  .DownPressed:
  ld    hl,.DownPressedDigSiteOrder
  call  .SetHLtoCurrentDigSite
  call  .SetNextDigSite
  ret

  .LeftPressed:
  ld    hl,.LeftPressedDigSiteOrder
  call  .SetHLtoCurrentDigSite
  call  .SetNextDigSite
  ret

  .RightPressed:
  ld    hl,.RightPressedDigSiteOrder
  call  .SetHLtoCurrentDigSite
  call  .SetNextDigSite
  ret

  .SetNextDigSite:
  ld    a,(AmountOfDigSitesUnlocked)
  ld    b,a
  inc   b

  inc   hl
  ld    a,(hl)
  cp    255
  ret   z

  cp    b
  jr    nc,.SetNextDigSite

  ld    (DigSiteSelected),a
  ;remove white outline from previously selected digsite
  ld    a,35
  ld    (SetPinPoint+sy),a  
  ld    hl,SetPinPoint
  call  DoCopy
  ret

  .SetHLtoCurrentDigSite:
  ld    a,(DigSiteSelected)
  cp    (hl)
  ret   z
  inc   hl
  jr    .SetHLtoCurrentDigSite

  .RightPressedDigSiteOrder:
  db    5,3,4,1,2, 255
  .LeftPressedDigSiteOrder:
  db    2,1,4,3,5, 255
  .DownPressedDigSiteOrder:
  db    4,1,3,2,5, 255
  .UpPressedDigSiteOrder:
  db    5,2,3,1,4, 255

SetPinPointsInPage1:                       ;set pinpoints at (0,0) page 1
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (070*256) + (144/2)
  ld    a,PinPointIconGfxBlock         ;font graphics block
  jp    CopyRomToVram          ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

UpgradeMenuEventRoutine:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever (so we always stay on page 2 for the game, and page 0 for the hud)

  call  BuildUpUpgradesMenu
  call  BuildUpLifeSupportMenu
  call  BuildUpPurchaseMenu
  call  NavigateMenus
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
  ld    hl,ClearBarsPage3                   ;we use page 3 as our restore page, but we need to clear the bars there first
  call  DoCopy

  ld    a,1
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ld    (ScienceLabMenuItemSelected),a      ;which item in the current list is selected/highlighted ?
  ret

NavigateMenus:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;space pressed ?
  jr    nz,SpacePressedPurchaseItem
	bit		3,a           ;right pressed ?
  jr    nz,.RightPressed
	bit		2,a           ;left pressed ?
  jr    nz,.LeftPressed
	bit		1,a           ;down pressed ?
  jr    nz,.DownPressed
	bit		0,a           ;up pressed ?
  jr    nz,.UpPressed
  ret

  .UpPressed:
  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  ret   z
  ld    (ScienceLabMenuItemSelected),a      ;which item in the current list is selected/highlighted ?

  ld    a,(CurrentScienceLabMenu)           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ret

  .DownPressed:
  ld    a,(CurrentScienceLabMenu)           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  dec   a
  ld    b,4+2                               ;amount of items upgrades menu
  jr    z,.AmountOfItemsFound
  dec   a
  ld    b,3+2                               ;amount of items life support menu
  jr    z,.AmountOfItemsFound
  ld    b,5+2                               ;amount of items purchase menu
  .AmountOfItemsFound:

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  inc   a
  cp    b
  ret   z
  ld    (ScienceLabMenuItemSelected),a      ;which item in the current list is selected/highlighted ?

  ld    a,(CurrentScienceLabMenu)           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ret

  .LeftPressed:
  ld    a,1
  ld    (ScienceLabMenuItemSelected),a      ;which item in the current list is selected/highlighted ?

  ld    a,(CurrentScienceLabMenu)           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  dec   a
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ret   nz
  ld    a,3
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ret

  .RightPressed:
  ld    a,1
  ld    (ScienceLabMenuItemSelected),a      ;which item in the current list is selected/highlighted ?

  ld    a,(CurrentScienceLabMenu)           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  inc   a
  cp    4
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ret   nz
  ld    a,1
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ret

SpacePressedPurchaseItem:
  ld    a,(CurrentScienceLabMenu)           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  dec   a
  jp    z,.UpgradesMenu
  dec   a
  jp    z,.LifeSupportMenu

  .PurchaseMenu:
  ld    a,3
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ld    hl,(TotalCredits)

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.OxygenGenerator
  dec   a
  jp    z,.WaterRecycler
  dec   a
  jp    z,.AntiRadiation
  dec   a
  jp    z,.DigSite
  dec   a
  jp    z,.ColonyExpansion
  dec   a
  jp    z,.ExitUpgradeMenu

  .ColonyExpansion:
  ld    a,(ColonyExpansionPurchased?)
  or    a
  ret   nz
  ld    de,CostColonyExpansion
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,1
  ld    (ColonyExpansionPurchased?),a
  ret

  .DigSite:
  ld    a,(AmountOfDigSitesUnlocked)
  cp    5
  ret   z
  ld    de,CostDigSite
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,(AmountOfDigSitesUnlocked)
  inc   a
  ld    (AmountOfDigSitesUnlocked),a
  ret

  .AntiRadiation:
  ld    a,(RadiationProtectionLevel)        ;0=no protection, 1=level 1, 2=level 2,3=level 3, 4=level 4
  cp    4
  ret   z
  ld    de,CostRadiationShieldLevel1
  or    a
  jr    z,.CostRadiationShieldFound
  ld    de,CostRadiationShieldLevel2
  dec   a
  jr    z,.CostRadiationShieldFound
  ld    de,CostRadiationShieldLevel3
  dec   a
  jr    z,.CostRadiationShieldFound
  ld    de,CostRadiationShieldLevel4
  .CostRadiationShieldFound:
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,(RadiationProtectionLevel)
  inc   a
  ld    (RadiationProtectionLevel),a
  ret

  .WaterRecycler:
  ld    a,(WaterRecyclerPurchased?)
  or    a
  ret   nz
  ld    de,CostWaterRecycler
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,1
  ld    (WaterRecyclerPurchased?),a
  ret

  .OxygenGenerator:
  ld    a,(OxygenGeneratorPurchased?)
  or    a
  ret   nz
  ld    de,CostOxygenGenerator
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,1
  ld    (OxygenGeneratorPurchased?),a
  ret

  .LifeSupportMenu:
  ld    a,2
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.Oxygen
  dec   a
  jp    z,.Food
  dec   a
  jp    z,.Water
  dec   a
  jp    z,.ExitUpgradeMenu

  .Water:
  call  CalculateCostWater                  ;out: hl total cost of refilling water supply on the ship
  push  hl
  pop   de
  ld    hl,(TotalCredits)
  ld    a,l
  or    h
  jp    z,.NotEnoughCredits
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCreditsForTotalRefillWater
  ld    (TotalCredits),hl
  ld    hl,(MaxWaterOnShip)
  ld    (WaterOnShip),hl
  ret
  .NotEnoughCreditsForTotalRefillWater:
  ld    hl,(TotalCredits)
  ld    de,(WaterOnShip)
  add   hl,de
  ld    (WaterOnShip),hl
  ld    hl,0
  ld    (TotalCredits),hl
  ret

  .Food:
  call  CalculateCostFood                   ;out: hl total cost of refilling food supply on the ship
  push  hl
  pop   de
  ld    hl,(TotalCredits)
  ld    a,l
  or    h
  jp    z,.NotEnoughCredits
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCreditsForTotalRefillFood
  ld    (TotalCredits),hl
  ld    hl,(MaxFoodOnShip)
  ld    (FoodOnShip),hl
  ret
  .NotEnoughCreditsForTotalRefillFood:
  ld    hl,(TotalCredits)
  ld    de,(FoodOnShip)
  add   hl,de
  ld    (FoodOnShip),hl
  ld    hl,0
  ld    (TotalCredits),hl
  ret

  .Oxygen:
  call  CalculateCostOxygen                 ;out: hl total cost of refilling oxygen supply on the ship
  push  hl
  pop   de
  ld    hl,(TotalCredits)
  ld    a,l
  or    h
  jp    z,.NotEnoughCredits
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCreditsForTotalRefillOxygen
  ld    (TotalCredits),hl
  ld    hl,(MaxOxygenOnShip)
  ld    (OxygenOnShip),hl
  ret
  .NotEnoughCreditsForTotalRefillOxygen:
  ld    hl,(TotalCredits)
  ld    de,(OxygenOnShip)
  add   hl,de
  ld    (OxygenOnShip),hl
  ld    hl,0
  ld    (TotalCredits),hl
  ret

  .UpgradesMenu:
  ld    a,1
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  ld    hl,(TotalCredits)

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.FuelTank
  dec   a
  jp    z,.CargoSize
  dec   a
  jp    z,.DrillCone
  dec   a
  jp    z,.MinerSpeed
  dec   a
  jp    z,.ExitUpgradeMenu

  .MinerSpeed:
  ld    a,(MinerSpeedLevel)
  dec   a
  ld    de,CostMinerSpeedLevel2
  jp    z,.MinerSpeedLevelFound
  dec   a
  ld    de,CostMinerSpeedLevel3
  jp    z,.MinerSpeedLevelFound
  dec   a
  ld    de,CostMinerSpeedLevel4
  ret   nz                                  ;maxed out
  .MinerSpeedLevelFound:
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,(MinerSpeedLevel)
  inc   a
  ld    (MinerSpeedLevel),a
  ret

  .DrillCone:
  ld    a,(ConicalDrillBit)
  or    a
  ld    de,CostDrillConeLevel2
  jp    z,.ConicalDrillBitFound
  dec   a
  ld    de,CostDrillConeLevel3
  jp    z,.ConicalDrillBitFound
  dec   a
  ld    de,CostDrillConeLevel4
  ret   nz                                  ;maxed out
  .ConicalDrillBitFound:
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,(ConicalDrillBit)
  inc   a
  ld    (ConicalDrillBit),a
  ret

  .CargoSize:
  ld    a,(CargoSizeLevel)
  dec   a
  ld    de,CostCargoSizeLevel2
  ld    bc,CargoSizeLevel2MaxStorage
  jp    z,.CargoSizeLevelFound
  dec   a
  ld    de,CostCargoSizeLevel3
  ld    bc,CargoSizeLevel3MaxStorage
  jp    z,.CargoSizeLevelFound
  dec   a
  ld    de,CostCargoSizeLevel4
  ld    bc,CargoSizeLevel4MaxStorage
  ret   nz                                  ;maxed out
  .CargoSizeLevelFound:
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,(CargoSizeLevel)
  inc   a
  ld    (CargoSizeLevel),a
  ld    (StorageMax),bc
  ret

  .FuelTank:
  ld    a,(FuelTankLevel)
  dec   a
  ld    de,CostFuelTankLevel2
  ld    bc,FuelTankLevel2MaxFuel
  jp    z,.FuelTankLevelFound
  dec   a
  ld    de,CostFuelTankLevel3
  ld    bc,FuelTankLevel3MaxFuel
  jp    z,.FuelTankLevelFound
  dec   a
  ld    de,CostFuelTankLevel4
  ld    bc,FuelTankLevel4MaxFuel
  ret   nz                                  ;maxed out
  .FuelTankLevelFound:
  xor   a
  sbc   hl,de
  jp    c,.NotEnoughCredits
  ld    (TotalCredits),hl
  ld    a,(FuelTankLevel)
  inc   a
  ld    (FuelTankLevel),a
  ld    (FuelMax),bc
  ret

  .ExitUpgradeMenu:
  ld    a,1
  ld    (ChangeRoom?),a
  ld    a,11
  ld    (CurrentRoom),a
  ret

  .NotEnoughCredits:
  ;play sfx
  ret


TextCost:
  db    "Cost:",255
TextOxygen:
  db    "Complete life support oxygen refill",255
TextFood:
  db    "Complete Food System Refill",255
TextWater:
  db    "Completely replenish the ship's water reserves",255
TextOxygenGenerator:
  db    "Extracts oxygen from carbon dioxide-rich atmosphere.",255
TextOxygenGeneratorPurchased:
  db    "Purchased",255
TextCostOxygenGenerator:
  db    "Cost: 250",255       | CostOxygenGenerator:  equ 250
TextWaterRecycler:
  db    "Recycles waste water into clean, drinkable water using filtration systems.",255
TextWaterRecyclerPurchased:
  db    "Purchased",255
TextCostWaterRecycler:
  db    "Cost: 250",255       | CostWaterRecycler:  equ 250
TextRadiationShieldLevel1:
  db    "Nanoshield Symbiotic Skin +20% active radiation shielding",255
TextRadiationShieldLevel2:
  db    "Radiation Absorbing Nanites +40% active radiation shielding",255
TextRadiationShieldLevel3:
  db    "Dynamic Melanin Enhancement +60% active radiation shielding",255
TextRadiationShieldLevel4:
  db    "Self-Repairing Tissue +80% active radiation shielding",255
TextCostRadiationShieldLevel1:
  db    "Cost: 050",255       | CostRadiationShieldLevel1:  equ 050
TextCostRadiationShieldLevel2:
  db    "Cost: 080",255       | CostRadiationShieldLevel2:  equ 080
TextCostRadiationShieldLevel3:
  db    "Cost: 110",255       | CostRadiationShieldLevel3:  equ 110
TextCostRadiationShieldLevel4:
  db    "Cost: 140",255       | CostRadiationShieldLevel4:  equ 140
TextDigSite:
  db    "Unlocks an additional drilling location",255
TextCostDigSite:
  db    "Cost: 250",255       | CostDigSite:  equ 250
TextColonyExpansion:
  db    "Develops new colony sectors",255
TextColonyExpansionPurchased:
  db    "Purchased",255
TextCostColonyExpansion:
  db    "Cost: 250",255       | CostColonyExpansion:  equ 250
TextMaxedOut:
  db    "Maxed Out",255
TextCostMaxedOut:
  db    " ",255
TextCredits:
  db    "Credits:",255
TextMinerSpeedLevel2:
  db    "Increases miner speed by 50% Current: Level 1",255
TextCostMinerSpeedLevel2:
  db    "Cost: 025",255       | CostMinerSpeedLevel2:  equ 025
TextMinerSpeedLevel3:
  db    "Doubles miner speed Current: Level 2",255
TextCostMinerSpeedLevel3:
  db    "Cost: 050",255       | CostMinerSpeedLevel3:  equ 050
TextMinerSpeedLevel4:
  db    "Drill speed keeps building up when uninterrupted Current: Lvl 3",255
TextCostMinerSpeedLevel4:
  db    "Cost: 075",255      | CostMinerSpeedLevel4:  equ 075
TextDrillConeLevel2:
  db    "Allows drilling through Ironstone Current: Level 1",255
TextCostDrillConeLevel2:
  db    "Cost: 030",255       | CostDrillConeLevel2:  equ 030
TextDrillConeLevel3:
  db    "Allows drilling through Metallic Ore Current: Level 2",255
TextCostDrillConeLevel3:
  db    "Cost: 070",255       | CostDrillConeLevel3:  equ 070
TextDrillConeLevel4:
  db    "Allows drilling through Xenodiamond Current: Level 3",255
TextCostDrillConeLevel4:
  db    "Cost: 150",255      | CostDrillConeLevel4:  equ 150
TextCargoSizeLevel2:
  db    "Doubles cargo capacity Current: Level 1",255
TextCostCargoSizeLevel2:
  db    "Cost: 060",255       | CostCargoSizeLevel2:  equ 060
TextCargoSizeLevel3:
  db    "Doubles cargo capacity Current: Level 2",255
TextCostCargoSizeLevel3:
  db    "Cost: 100",255       | CostCargoSizeLevel3:  equ 100
TextCargoSizeLevel4:
  db    "Doubles cargo capacity Current: Level 3",255
TextCostCargoSizeLevel4:
  db    "Cost: 150",255       | CostCargoSizeLevel4:  equ 150
TextFuelTankLevel2:
  db    "Doubles fuel capacity Current: Level 1",255
TextCostFuelTankLevel2:
  db    "Cost: 050",255       | CostFuelTankLevel2:  equ 050
TextFuelTankLevel3:
  db    "Doubles fuel capacity Current: Level 2",255
TextCostFuelTankLevel3:
  db    "Cost: 100",255       | CostFuelTankLevel3:  equ 100
TextFuelTankLevel4:
  db    "Doubles fuel capacity Current: Level 3",255
TextCostFuelTankLevel4:
  db    "Cost: 250",255       | CostFuelTankLevel4:  equ 250
TextReady?:
  db    "READY?",255
TextUpgrades:
  db    "UPGRADES",255
TextFuelTankLvl2:
  db    "Fuel Tank Lvl 2",255
TextFuelTankLvl3:
  db    "Fuel Tank Lvl 3",255
TextFuelTankLvl4:
  db    "Fuel Tank Lvl 4",255
TextFuelTankMax:
  db    "Fuel Tank (Max)",255
TextCargoSizeLvl2:
  db    "Cargo Size Lvl 2",255
TextCargoSizeLvl3:
  db    "Cargo Size Lvl 3",255
TextCargoSizeLvl4:
  db    "Cargo Size Lvl 4",255
TextCargoSizeMax:
  db    "Cargo Size (Max)",255
TextDrillConeLvl2:
  db    "Drill Cone Lvl 2",255
TextDrillConeLvl3:
  db    "Drill Cone Lvl 3",255
TextDrillConeLvl4:
  db    "Drill Cone Lvl 4",255
TextDrillConeMax:
  db    "Drill Cone (Max)",255
TextMinerSpeedLvl2:
  db    "Miner Speed Lvl 2",255
TextMinerSpeedLvl3:
  db    "Miner Speed Lvl 3",255
TextMinerSpeedLvl4:
  db    "Miner Speed Lvl 4",255
TextMinerSpeedMax:
  db    "Miner Speed (Max)",255
TextLifeSupport:
  db    "LIFE SUPPORT",255
  db    "Oxygen",255
  db    "Food",255
  db    "Water",255
TextPurchase:
  db    "PURCHASE",255
  db    "Oxygen Generator",255
  db    "Water Recycler",255
  db    "Anti Radiation",255
  db    "Dig Site",255
  db    "Colony Expansion",255

ClearBarsPage3:
	db		0,0,0,0
	db		012,0,035,3
	db		122,0,146,0
;	db		15+ (15 * 16),0,$c0
	db		0+ (0 * 16),0,$c0
ClearScienceLabMenuPage0:
	db		012,0,018,3
	db		012,0,018,0
	db		122,0,180,0
	db		0,0,$d0
ClearScienceLabMenuPage1:
	db		012,0,018,3
	db		012,0,018,1
	db		122,0,180,0
	db		0,0,$d0

ClearItemInfoWindowPage0:
	db		0,0,0,0
	db		156,0,112,0
	db		086,0,085,0
	db		0+ (0 * 16),0,$c0
ClearItemInfoWindowPage1:
	db		0,0,0,0
	db		156,0,112,1
	db		086,0,085,0
	db		0+ (0 * 16),0,$c0

ClearIconWindowPage0:
	db		154,0,013,3
	db		154,0,013,0
	db		090,0,071,0
	db		0,0,$d0
ClearIconWindowPage1:
	db		154,0,013,3
	db		154,0,013,1
	db		090,0,071,0
	db		0,0,$d0

ClearMirrorPageScienceLabMenu:
  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    hl,ClearItemInfoWindowPage1
  jr    z,.ClearInfoWindow
  ld    hl,ClearItemInfoWindowPage0
  .ClearInfoWindow:
  call  DoCopy

  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    hl,ClearIconWindowPage1
  jr    z,.ClearIconWindow
  ld    hl,ClearIconWindowPage0
  .ClearIconWindow:
  call  DoCopy

  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    hl,ClearScienceLabMenuPage1
  jr    z,.ClearPage
  ld    hl,ClearScienceLabMenuPage0
  .ClearPage:
  jp    DoCopy

CopySelectionWindow:
  ld    a,(CurrentScienceLabMenu)           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  dec   a
  ld    b,4+2                               ;amount of items upgrades menu
  jr    z,.AmountOfItemsFound
  dec   a
  ld    b,3+2                               ;amount of items life support menu
  jr    z,.AmountOfItemsFound
  ld    b,5+2                               ;amount of items purchase menu
  .AmountOfItemsFound:

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  inc   a
  cp    b
  jr    z,.DisplayReadyWindow

  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    a,1
  jr    z,.PageFound
  xor   a
  .PageFound:
  ld    (CopySelectionWindowPage2+dPage),a

  ld    a,(ScienceLabMenuItemSelected)
  ld    l,a
  ld    h,0
  ld    de,20
  call  MultiplyHlWithDE      ;HL = result

  ld    a,35 - 20
  add   a,l
  ld    (CopySelectionWindowPage2+dy),a

  ld    hl,CopySelectionWindowPage2
  jp    DoCopy

  .DisplayReadyWindow:
  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    hl,DisplayReadyWindowPage1
  jr    z,.ClearPage
  ld    hl,DisplayReadyWindowPage0
  .ClearPage:
  jp    DoCopy

DisplayReadyWindowPage0:
	db		012,0,055,2
	db		012,0,183,0
	db		122,0,015,0
	db		0,0,$d0	
DisplayReadyWindowPage1:
	db		012,0,055,2
	db		012,0,183,1
	db		122,0,015,0
	db		0,0,$d0	

SwapPageOnNextVblank:                       ;swaps between page 0 and page 1
  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    a,1*32 + 31
  jr    z,.SwapPage
  ld    a,0*32 + 31
  .SwapPage:
  ld    (PageOnNextVblank),a
  ret

BuildUpPurchaseMenu:
  ld    a,(ShowScienceLabMenu)              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  cp    3
  ret   nz
  ld    (CurrentScienceLabMenu),a           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  xor   a
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu

  call  ClearMirrorPageScienceLabMenu
  call  CopySelectionWindow                 ;copies selection window from page 2

  ld    a,018                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ;PURCHASE
  ld    b,045                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,TextPurchase
  call  SetText2

  ;Oxygen Generator
  inc   ix
  ld    b,017                               ;dx
  ld    c,022                               ;increase in dy
  call  SetText2
  ;Water Recycler
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2
  ;Radiation Shield
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2
  ;Dig Site
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2
  ;Colony
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2

  ;READY?
  ld    a,186                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    b,058                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,TextReady?
  call  SetText2

  call  SetItemInfoPurchase                 ;sets the text about the currently selected item in the window in the right bottom
  call  SetCredits                          ;sets the current player's credits
  call  SetRadiationProtectionBars          ;Set the amount of radiation protection bars
  call  SetDigSiteBars                      ;Set the amount of digsite bars
  jp    SetSciencelabIconsPurchase          ;set the icon in the window in the top right

SetDigSiteBars:
  ld    a,094
  ld    (AntiRadiationProtectionOrDigSiteBars+dx),a
  ld    a,101
  ld    (AntiRadiationProtectionOrDigSiteBars+dy),a
  ld    a,036
  ld    (AntiRadiationProtectionOrDigSiteBars+nx),a

  ld    a,(AmountOfDigSitesUnlocked)
  dec   a
  ld    b,40                                ;sx (1 digsite)
  jr    z,.SetBars
  dec   a
  ld    b,33                                ;sx (2 digsites)
  jr    z,.SetBars
  dec   a
  ld    b,26                                ;sx (3 digsites)
  jr    z,.SetBars
  dec   a
  ld    b,19                                ;sx (4 digsites)
  jr    z,.SetBars
  ld    b,12                                ;sx (5 digsites)

  .SetBars:
  ld    a,b
  ld    (AntiRadiationProtectionOrDigSiteBars+sx),a
  ld    hl,AntiRadiationProtectionOrDigSiteBars
  call  DoCopy
  ret

SetRadiationProtectionBars:
  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    a,1
  jr    z,.PageFound
  xor   a
  .PageFound:
  ld    (AntiRadiationProtectionOrDigSiteBars+dPage),a

  ld    a,101
  ld    (AntiRadiationProtectionOrDigSiteBars+dx),a
  ld    a,080
  ld    (AntiRadiationProtectionOrDigSiteBars+dy),a
  ld    a,029
  ld    (AntiRadiationProtectionOrDigSiteBars+nx),a

  ld    a,(RadiationProtectionLevel)
  or    a
  ld    b,47                                ;sx (no protection)
  jr    z,.SetBars
  dec   a
  ld    b,40                                ;sx (level 1)
  jr    z,.SetBars
  dec   a
  ld    b,33                                ;sx (level 2)
  jr    z,.SetBars
  dec   a
  ld    b,26                                ;sx (level 3)
  jr    z,.SetBars
  ld    b,19                                ;sx (level 4)

  .SetBars:
  ld    a,b
  ld    (AntiRadiationProtectionOrDigSiteBars+sx),a
  ld    hl,AntiRadiationProtectionOrDigSiteBars
  call  DoCopy
  ret

BuildUpLifeSupportMenu:
  ld    a,(ShowScienceLabMenu)              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  cp    2
  ret   nz
  ld    (CurrentScienceLabMenu),a           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  xor   a
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu

  call  ClearMirrorPageScienceLabMenu
  call  CopySelectionWindow                 ;copies selection window from page 2

  ld    a,018                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ;LIFE SUPPORT
  ld    b,034                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,TextLifeSupport
  call  SetText2

  ;oxygen
  inc   ix
  ld    b,017                               ;dx
  ld    c,022                               ;increase in dy
  call  SetText2
  ;food
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2
  ;water
  inc   ix
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2

  ;READY?
  ld    a,186                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    b,058                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,TextReady?
  call  SetText2

  call  SetItemInfoLifeSupport              ;sets the text about the currently selected item in the window in the right bottom
  call  SetCredits                          ;sets the current player's credits
  call  SetOxygenFoodWaterBars
  jp    SetSciencelabIconsLifeSupport       ;set the icon in the window in the top right

SetOxygenFoodWaterBars:
  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    a,1
  ld    hl,OxygenOuterBarPage1
  ld    de,OxygenInnerBarEmptyPage1
  jr    z,.PageSetOxygen
  xor   a
  ld    hl,OxygenOuterBarPage0
  ld    de,OxygenInnerBarEmptyPage0
  .PageSetOxygen:
  ld    (OxygenFoodWaterInnerBarFilled+dPage),a
  call  DoCopy
  push  de
  pop   hl
  call  DoCopy

  ld    a,063
  ld    (OxygenFoodWaterInnerBarFilled+dx),a
  ld    a,042
  ld    (OxygenFoodWaterInnerBarFilled+dy),a
  ;nx= OxygenOnShip*66/MaxOxygenOnShip
  ld    hl,(OxygenOnShip)
  ld    de,66
  call  MultiplyHlWithDE      ;HL = result
  push  hl
  pop   bc
  ld    de,(MaxOxygenOnShip)
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  ld    (OxygenFoodWaterInnerBarFilled+nx),a
  ld    hl,OxygenFoodWaterInnerBarFilled
  call  DoCopy

  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    hl,FoodOuterBarPage1
  ld    de,FoodInnerBarEmptyPage1
  jr    z,.PageSetFood
  ld    hl,FoodOuterBarPage0
  ld    de,FoodInnerBarEmptyPage0
  .PageSetFood:
  call  DoCopy
  push  de
  pop   hl
  call  DoCopy

  ld    a,050
  ld    (OxygenFoodWaterInnerBarFilled+dx),a
  ld    a,061
  ld    (OxygenFoodWaterInnerBarFilled+dy),a
  ;nx= FoodOnShip*79/MaxFoodOnShip
  ld    hl,(FoodOnShip)
  ld    de,79
  call  MultiplyHlWithDE      ;HL = result
  push  hl
  pop   bc
  ld    de,(MaxFoodOnShip)
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  ld    (OxygenFoodWaterInnerBarFilled+nx),a
  ld    hl,OxygenFoodWaterInnerBarFilled
  call  DoCopy

  ld    a,(PageOnNextVblank)
  cp    0*32 + 31                           ;page 0
  ld    hl,WaterOuterBarPage1
  ld    de,WaterInnerBarEmptyPage1
  jr    z,.PageSetWater
  ld    hl,WaterOuterBarPage0
  ld    de,WaterInnerBarEmptyPage0
  .PageSetWater:
  call  DoCopy
  push  de
  pop   hl
  call  DoCopy

  ld    a,054
  ld    (OxygenFoodWaterInnerBarFilled+dx),a
  ld    a,081
  ld    (OxygenFoodWaterInnerBarFilled+dy),a
  ;nx= WaterOnShip*75/MaxWaterOnShip
  ld    hl,(WaterOnShip)
  ld    de,75
  call  MultiplyHlWithDE      ;HL = result
  push  hl
  pop   bc
  ld    de,(MaxWaterOnShip)
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  ld    (OxygenFoodWaterInnerBarFilled+nx),a
  ld    hl,OxygenFoodWaterInnerBarFilled
  call  DoCopy
  ret

OxygenOuterBarPage0:
	db		0,0,0,0
	db		062,0,041,0
	db		068,0,009,0
	db		1+ (1 * 16),0,$c0
OxygenOuterBarPage1:
	db		0,0,0,0
	db		062,0,041,1
	db		068,0,009,0
	db		1+ (1 * 16),0,$c0

OxygenInnerBarEmptyPage0:
	db		0,0,0,0
	db		063,0,042,0
	db		066,0,007,0
	db		0+ (0 * 16),0,$80
OxygenInnerBarEmptyPage1:
	db		0,0,0,0
	db		063,0,042,1
	db		066,0,007,0
	db		0+ (0 * 16),0,$80


FoodOuterBarPage0:
	db		0,0,0,0
	db		049,0,060,0
	db		081,0,009,0
	db		1+ (1 * 16),0,$80
FoodOuterBarPage1:
	db		0,0,0,0
	db		049,0,060,1
	db		081,0,009,0
	db		1+ (1 * 16),0,$80

FoodInnerBarEmptyPage0:
	db		0,0,0,0
	db		050,0,061,0
	db		079,0,007,0
	db		0+ (0 * 16),0,$80
FoodInnerBarEmptyPage1:
	db		0,0,0,0
	db		050,0,061,1
	db		079,0,007,0
	db		0+ (0 * 16),0,$80


WaterOuterBarPage0:
	db		0,0,0,0
	db		053,0,080,0
	db		077,0,009,0
	db		1+ (1 * 16),0,$80
WaterOuterBarPage1:
	db		0,0,0,0
	db		053,0,080,1
	db		077,0,009,0
	db		1+ (1 * 16),0,$80

WaterInnerBarEmptyPage0:
	db		0,0,0,0
	db		054,0,081,0
	db		075,0,007,0
	db		0+ (0 * 16),0,$80
WaterInnerBarEmptyPage1:
	db		0,0,0,0
	db		054,0,081,1
	db		075,0,007,0
	db		0+ (0 * 16),0,$80


BuildUpUpgradesMenu:
  ld    a,(ShowScienceLabMenu)              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  cp    1
  ret   nz
  ld    (CurrentScienceLabMenu),a           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  xor   a
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu

  call  ClearMirrorPageScienceLabMenu
  call  CopySelectionWindow                 ;copies selection window from page 2

  ld    a,018                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ;UPGRADES
  ld    b,045                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,TextUpgrades
  call  SetText2

  ;fuel tank
  ld    a,(FuelTankLevel)
  dec   a
  ld    ix,TextFuelTankLvl2
  jr    z,.FuelTankLevelFound
  dec   a
  ld    ix,TextFuelTankLvl3
  jr    z,.FuelTankLevelFound
  dec   a
  ld    ix,TextFuelTankLvl4
  jr    z,.FuelTankLevelFound
  dec   a
  ld    ix,TextFuelTankMax
  jr    z,.FuelTankLevelFound
  .FuelTankLevelFound:
  ld    b,017                               ;dx
  ld    c,022                               ;increase in dy
  call  SetText2

  ;cargo size
  ld    a,(CargoSizeLevel)
  dec   a
  ld    ix,TextCargoSizeLvl2
  jr    z,.CargoSizeLevelFound
  dec   a
  ld    ix,TextCargoSizeLvl3
  jr    z,.CargoSizeLevelFound
  dec   a
  ld    ix,TextCargoSizeLvl4
  jr    z,.CargoSizeLevelFound
  dec   a
  ld    ix,TextCargoSizeMax
  jr    z,.CargoSizeLevelFound
  .CargoSizeLevelFound:
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2

  ;drill cone
  ld    a,(ConicalDrillBit)
  or    a
  ld    ix,TextDrillConeLvl2
  jr    z,.DrillConeLevelFound
  dec   a
  ld    ix,TextDrillConeLvl3
  jr    z,.DrillConeLevelFound
  dec   a
  ld    ix,TextDrillConeLvl4
  jr    z,.DrillConeLevelFound
  dec   a
  ld    ix,TextDrillConeMax
  jr    z,.DrillConeLevelFound
  .DrillConeLevelFound:
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2

  ;miner speed
  ld    a,(MinerSpeedLevel)
  dec   a
  ld    ix,TextMinerSpeedLvl2
  jr    z,.MinerSpeedLevelFound
  dec   a
  ld    ix,TextMinerSpeedLvl3
  jr    z,.MinerSpeedLevelFound
  dec   a
  ld    ix,TextMinerSpeedLvl4
  jr    z,.MinerSpeedLevelFound
  dec   a
  ld    ix,TextMinerSpeedMax
  jr    z,.MinerSpeedLevelFound
  .MinerSpeedLevelFound:
  ld    b,017                               ;dx
  ld    c,020                               ;increase in dy
  call  SetText2

  ;READY?
  ld    a,186                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    b,058                               ;dx
  ld    c,000                               ;increase in dy
  ld    ix,TextReady?
  call  SetText2

  call  SetItemInfoUpgrades                 ;sets the text about the currently selected item in the window in the right bottom
  call  SetCredits                          ;sets the current player's credits
  jp    SetSciencelabIconsUpgrades          ;set the icon in the window in the top right

SetSciencelabIconsPurchase:                 ;set the icon in the window in the top right
	ld    a,(PageOnNextVblank)
  cp    0*32 + 31
  ld    de,$8000 + (013*128) + (154/2) - 128
  jr    z,.PageFound
  ld    de,$0000 + (013*128) + (154/2) - 128
  .PageFound:

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.OxygenGenerator
  dec   a
  jp    z,.WaterRecycler
  dec   a
  jp    z,.RadiationShield
  dec   a
  jp    z,.DigSite
  dec   a
  jp    z,.ColonyExpansion  
  jp    SwapPageOnNextVblank                ;swaps between page 0 and page 1

  .ColonyExpansion:
;  ld    hl,024/2                              ;dx
;  add   hl,de
;  ex    de,hl

  ld    a,sciencelabIconColonyExpansionGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (071*256) + (090/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,ColonyExpansionPalette
  jp    SetPalette

  .DigSite:
  ld    hl,002/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (071*128) + (152/2) - 128
  ld    bc,$0000 + (071*256) + (086/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,DigSitePalette
  jp    SetPalette

  .RadiationShield:
  ld    hl,010/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (142*128) + (136/2) - 128
  ld    bc,$0000 + (070*256) + (070/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,AntiRadiationPalette
  jp    SetPalette

  .WaterRecycler:
  ld    hl,010/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (142*128) + (066/2) - 128
  ld    bc,$0000 + (070*256) + (070/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,WaterRecyclerPalette
  jp    SetPalette

  .OxygenGenerator:
  ld    hl,012/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (142*128) + (000/2) - 128
  ld    bc,$0000 + (070*256) + (066/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,OxygenGeneratorPalette
  jp    SetPalette

SetSciencelabIconsLifeSupport:              ;set the icon in the window in the top right
	ld    a,(PageOnNextVblank)
  cp    0*32 + 31
  ld    de,$8000 + (013*128) + (154/2) - 128
  jr    z,.PageFound
  ld    de,$0000 + (013*128) + (154/2) - 128
  .PageFound:

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.Oxygen
  dec   a
  jp    z,.Food
  dec   a
  jp    z,.Water
  jp    SwapPageOnNextVblank                ;swaps between page 0 and page 1

  .Water:
  ld    hl,024/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (142*128) + (206/2) - 128
  ld    bc,$0000 + (070*256) + (046/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,WaterPalette
  jp    SetPalette

  .Food:
  ld    hl,006/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (071*128) + (074/2) - 128
  ld    bc,$0000 + (071*256) + (078/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,FoodPalette
  jp    SetPalette

  .Oxygen:
  ld    hl,006/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (071*128) + (000/2) - 128
  ld    bc,$0000 + (071*256) + (074/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,OxygenPalette
  jp    SetPalette

SetSciencelabIconsUpgrades:                 ;set the icon in the window in the top right
	ld    a,(PageOnNextVblank)
  cp    0*32 + 31
  ld    de,$8000 + (013*128) + (154/2) - 128
  jr    z,.PageFound
  ld    de,$0000 + (013*128) + (154/2) - 128
  .PageFound:

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.FuelTank
  dec   a
  jp    z,.CargoSize
  dec   a
  jp    z,.DrillCone
  dec   a
  jp    z,.MinerSpeed
  jp    SwapPageOnNextVblank                ;swaps between page 0 and page 1

  .MinerSpeed:
  ld    hl,010/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (000*128) + (182/2) - 128
  ld    bc,$0000 + (071*256) + (070/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,MinerSpeedPalette
  jp    SetPalette

  .DrillCone:
  ld    hl,024/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (000*128) + (138/2) - 128
  ld    bc,$0000 + (071*256) + (044/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,DrillConePalette
  jp    SetPalette

  .CargoSize:
  ld    hl,014/2                              ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (000*128) + (076/2) - 128
  ld    bc,$0000 + (071*256) + (062/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,CargoSizePalette
  jp    SetPalette

  .FuelTank:
  ld    hl,008/2                            ;dx
  add   hl,de
  ex    de,hl

  ld    a,sciencelabIconsTotalGfxBlock         	;block to copy graphics from
  ld    hl,$4000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (071*256) + (076/2)
  call  CopyRomToVram                   ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  SwapPageOnNextVblank                ;swaps between page 0 and page 1
  halt
  ld    hl,FuelTankPalette
  jp    SetPalette

FuelTankPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\FuelTank.PL",0,32
CargoSizePalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\CargoSize.PL",0,32
DrillConePalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\DrillCone.PL",0,32
MinerSpeedPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\MinerSpeed.PL",0,32

OxygenPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\Oxygen.PL",0,32
FoodPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\Food.PL",0,32
WaterPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\Water.PL",0,32

OxygenGeneratorPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\OxygenGenerator.PL",0,32
WaterRecyclerPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\WaterRecycler.PL",0,32
AntiRadiationPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\AntiRadiation.PL",0,32
DigSitePalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\DigSite.PL",0,32
ColonyExpansionPalette:                    	;palette file
  incbin "..\grapx\ship\sciencelab\icons\ColonyExpansion.PL",0,32





SetCredits:                                 ;sets the current player's credits
  ld    a,170                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    ix,TextCredits
  ld    b,035                               ;dx
  ld    c,000                               ;increase in dy
  call  SetText2

  ld    hl,(TotalCredits)
  call  NUM_TO_ASCII

  ld    a,085
  ld    (PutLetter+dx),a                    ;set dx of next letter

  ld    ix,Ascii5Byte
  ld    b,085                               ;dx
  ld    c,000                               ;increase in dy
  jp    SetTextSkip0sLoop

SetTextSkip0sLoop:
  ld    a,(ix)
  cp    255
  jr    z,.TotalValueIs0
  cp    "0"
  jp    nz,SetText2.NextLetter              ;in: ix->text
  inc   ix
;  ld    a,(PutLetter+dx)                    ;set dx of next letter
;  add   a,8
;  ld    (PutLetter+dx),a                    ;set dx of next letter
  jr    SetTextSkip0sLoop

  .TotalValueIs0:
  dec   ix
;  ld    a,(PutLetter+dx)                    ;set dx of next letter
;  sub   a,8
;  ld    (PutLetter+dx),a                    ;set dx of next letter
  jp    SetText2.NextLetter                 ;in: ix->text

SetItemInfoLifeSupport:
  ld    a,112                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.Oxygen
  dec   a
  jp    z,.Food
  dec   a
  jp    z,.Water
  ret

  .Water:
  ld    ix,TextWater
  ld    de,TextCost
  call  SetItemInfo
  jp    SetCostWater

  .Food:
  ld    ix,TextFood
  ld    de,TextCost
  call  SetItemInfo
  jp    SetCostFood

  .Oxygen:
  ld    ix,TextOxygen
  ld    de,TextCost
  call  SetItemInfo
  jp    SetCostOxygen

CalculateCostWater:
  ld    hl,(MaxWaterOnShip)
  ld    de,(WaterOnShip)
  xor   a
  sbc   hl,de
  ret

CalculateCostFood:
  ld    hl,(MaxFoodOnShip)
  ld    de,(FoodOnShip)
  xor   a
  sbc   hl,de
  ret

CalculateCostOxygen:
  ld    hl,(MaxOxygenOnShip)
  ld    de,(OxygenOnShip)
  xor   a
  sbc   hl,de
  ret

SetCostWater:                               ;sets the current player's credits
  ld    a,188                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text
  ld    a,191
  ld    (PutLetter+dx),a                    ;set dx of next letter

  call  CalculateCostWater                  ;out: hl total cost of refilling water supply on the ship
  call  NUM_TO_ASCII

  ld    ix,Ascii5Byte
  ld    b,191                               ;dx
  ld    c,000                               ;increase in dy
  jp    SetTextSkip0sLoop

SetCostFood:                                ;sets the current player's credits
  ld    a,188                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text
  ld    a,191
  ld    (PutLetter+dx),a                    ;set dx of next letter

  call  CalculateCostFood                   ;out: hl total cost of refilling food supply on the ship
  call  NUM_TO_ASCII

  ld    ix,Ascii5Byte
  ld    b,191                               ;dx
  ld    c,000                               ;increase in dy
  jp    SetTextSkip0sLoop

SetCostOxygen:                              ;sets the current player's credits
  ld    a,188                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text
  ld    a,191
  ld    (PutLetter+dx),a                    ;set dx of next letter

  call  CalculateCostOxygen                 ;out: hl total cost of refilling oxygen supply on the ship
  call  NUM_TO_ASCII

  ld    ix,Ascii5Byte
  ld    b,191                               ;dx
  ld    c,000                               ;increase in dy
  jp    SetTextSkip0sLoop

SetItemInfoPurchase:
  ld    a,112                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.OxygenGenerator
  dec   a
  jp    z,.WaterRecycler
  dec   a
  jp    z,.RadiationShield
  dec   a
  jp    z,.DigSite
  dec   a
  jp    z,.ColonyExpansion  
  ret

  .ColonyExpansion:
  ld    a,(ColonyExpansionPurchased?)
  or    a
  jr    nz,.ColonyExpansionPurchased
  ld    ix,TextColonyExpansion
  ld    de,TextCostColonyExpansion  
  jp    SetItemInfo
  .ColonyExpansionPurchased:
  ld    ix,TextColonyExpansionPurchased
  ld    de,TextCostMaxedOut  
  jp    SetItemInfo

  .DigSite:
  ld    a,(AmountOfDigSitesUnlocked)
  cp    5
  ld    de,TextCostDigSite
  ld    ix,TextDigSite
  jr    nz,.AmountOfDigSitesFound
  ld    de,TextCostMaxedOut
  ld    ix,TextMaxedOut
  .AmountOfDigSitesFound:
  jp    SetItemInfo

  .RadiationShield:

  ld    a,(RadiationProtectionLevel)        ;0=no protection, 1=level 1, 2=level 2,3=level 3, 4=level 4
  or    a
  ld    ix,TextRadiationShieldLevel1
  ld    de,TextCostRadiationShieldLevel1
  jp    z,SetItemInfo
  dec   a
  ld    ix,TextRadiationShieldLevel2
  ld    de,TextCostRadiationShieldLevel2
  jp    z,SetItemInfo
  dec   a
  ld    ix,TextRadiationShieldLevel3
  ld    de,TextCostRadiationShieldLevel3
  jp    z,SetItemInfo
  dec   a
  ld    ix,TextRadiationShieldLevel4
  ld    de,TextCostRadiationShieldLevel4
  jp    z,SetItemInfo
  dec   a
  ld    ix,TextMaxedOut
  ld    de,TextCostMaxedOut
  jp    z,SetItemInfo

  .WaterRecycler:
  ld    a,(WaterRecyclerPurchased?)
  or    a
  jr    nz,.WaterRecyclerPurchased
  ld    ix,TextWaterRecycler
  ld    de,TextCostWaterRecycler  
  jp    SetItemInfo
  .WaterRecyclerPurchased:
  ld    ix,TextWaterRecyclerPurchased
  ld    de,TextCostMaxedOut  
  jp    SetItemInfo

  .OxygenGenerator:
  ld    a,(OxygenGeneratorPurchased?)
  or    a
  jr    nz,.OxygenGeneratorPurchased
  ld    ix,TextOxygenGenerator
  ld    de,TextCostOxygenGenerator  
  jp    SetItemInfo
  .OxygenGeneratorPurchased:
  ld    ix,TextOxygenGeneratorPurchased
  ld    de,TextCostMaxedOut  
  jp    SetItemInfo


dxItemInfo: equ 156
SetItemInfoUpgrades:
  ld    a,112                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    a,(ScienceLabMenuItemSelected)      ;which item in the current list is selected/highlighted ?
  dec   a
  jp    z,.FuelTank
  dec   a
  jp    z,.CargoSize
  dec   a
  jp    z,.DrillCone
  dec   a
  jp    z,.MinerSpeed
  ret

  .FuelTank:
  ld    a,(FuelTankLevel)
  dec   a
  ld    ix,TextFuelTankLevel2
  ld    de,TextCostFuelTankLevel2
  jp    z,SetItemInfo
  dec   a
  ld    ix,TextFuelTankLevel3
  ld    de,TextCostFuelTankLevel3
  jp    z,SetItemInfo
  dec   a
  ld    ix,TextFuelTankLevel4
  ld    de,TextCostFuelTankLevel4
  jp    z,SetItemInfo
  dec   a
  ld    ix,TextMaxedOut
  ld    de,TextCostMaxedOut
  jp    z,SetItemInfo

  .CargoSize:
  ld    a,(CargoSizeLevel)
  dec   a
  ld    ix,TextCargoSizeLevel2
  ld    de,TextCostCargoSizeLevel2
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextCargoSizeLevel3
  ld    de,TextCostCargoSizeLevel3
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextCargoSizeLevel4
  ld    de,TextCostCargoSizeLevel4
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextMaxedOut
  ld    de,TextCostMaxedOut
  jr    z,SetItemInfo

  .DrillCone:
  ld    a,(ConicalDrillBit)
  or    a
  ld    ix,TextDrillConeLevel2
  ld    de,TextCostDrillConeLevel2
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextDrillConeLevel3
  ld    de,TextCostDrillConeLevel3
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextDrillConeLevel4
  ld    de,TextCostDrillConeLevel4
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextMaxedOut
  ld    de,TextCostMaxedOut
  jr    z,SetItemInfo

  .MinerSpeed:
  ld    a,(MinerSpeedLevel)
  dec   a
  ld    ix,TextMinerSpeedLevel2
  ld    de,TextCostMinerSpeedLevel2
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextMinerSpeedLevel3
  ld    de,TextCostMinerSpeedLevel3
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextMinerSpeedLevel4
  ld    de,TextCostMinerSpeedLevel4
  jr    z,SetItemInfo
  dec   a
  ld    ix,TextMaxedOut
  ld    de,TextCostMaxedOut
  jr    z,SetItemInfo

SetItemInfo:
  push  de
  ld    b,dxItemInfo                        ;dx
  ld    c,000                               ;increase in dy
  call  SetText2
  pop   ix
  jp    SetText2CostItem

SetText2CostItem:
  ld    a,188                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    b,dxItemInfo                        ;dx
  ld    c,000                               ;increase in dy
  jp    SetText2

SetText2:                               ;in: ix->text
  ld    a,b                             ;dx text
  ld    (PutLetter+dx),a                ;set dx of next letter
  ld    a,(PutLetter+dy)                ;set dy of text
  add   a,c                             ;increase in dy
  ld    (PutLetter+dy),a                ;set dy of text

	ld    a,(PageOnNextVblank)
  cp    0*32 + 31
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
  push  iy
  call  CalculateLenghtNextWord         ;out: b=total lenght next word
  pop   iy

  ld    a,(PutLetter+dx)                ;set dx of next letter
  add   a,b
  jp    c,.LenghtExceeded               ;next word doesn't fits the line

  ld    a,(PutLetter+dx)                ;set dx of next letter
  add   a,b
  cp    244
  jp    c,.NextLetter                   ;put next word if it fits the line

  .LenghtExceeded:
  inc   ix                              ;skip the space, since we are going to the next row
  ld    a,dxItemInfo                    ;dx text
  ld    (PutLetter+dx),a                ;set dx of next letter

  ld    a,(PutLetter+dy)                ;dy
  add   a,11                            ;next row
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
  db  007+0,002+2,005+2,004+2,007+0,006+2,004+2,003+2,004+2,004+2,004+2,004+2,003+2,004+2,002+2,004+2,007+0,005+0,008+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,002+0,003+0,004+0,004+0,004+0,006+0
;               A     B     C     D     E     F     G     H     I     J     K     L     M     N     O     P     Q     R     S     T     U     V     W     X     Y     Z     [     \     ]     ^
  db  007+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,003+0,005+0,007+0,005+0,009+0,009+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,007+0,008+0,008+0,007+0,007+0,006+0,004+0,004+0,004+0,004+0
;               a     b     c     d     e     f     g     h     i     j     k     l     m     n     o     p     q     r     s     t     u     v     w     x     y     z     {     |     }     ~
  db  007+0,007+0,007+0,007+0,007+0,007+0,005+0,007+0,007+0,003+0,005+0,007+0,005+0,009+0,007+0,007+0,007+0,007+0,005+0,007+0,005+0,007+0,007+0,009+0,007+0,007+0,007+0,006+0,004+0,004+0,004+0,004+0
 















dephase
