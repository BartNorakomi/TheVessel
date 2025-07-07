;UpgradeMenuEventRoutine

Phase MovementRoutinesAddress


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
  call  DoCopy
  ret

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
  call  CopySelectionWindow                 ;copies selection window form page 2

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
  jp    SwapPageOnNextVblank                ;swaps between page 0 and page 1

BuildUpLifeSupportMenu:
  ld    a,(ShowScienceLabMenu)              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu
  cp    2
  ret   nz
  ld    (CurrentScienceLabMenu),a           ;1=upgrades menu, 2=life support menu, 3=purchase menu
  xor   a
  ld    (ShowScienceLabMenu),a              ;0=dont show, 1=show upgrades menu, 2=show life support menu, 3=show purchase menu

  call  ClearMirrorPageScienceLabMenu
  call  CopySelectionWindow                 ;copies selection window form page 2

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
  jp    SwapPageOnNextVblank                ;swaps between page 0 and page 1

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
  ld    a,025
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
  ld    a,025
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
  ld    a,025
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
  call  CopySelectionWindow                 ;copies selection window form page 2

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
  jp    SwapPageOnNextVblank                ;swaps between page 0 and page 1

SetCredits:                                 ;sets the current player's credits
  ld    a,172                               ;dy
  ld    (PutLetter+dy),a                    ;set dy of text

  ld    ix,TextCredits
  ld    b,027                               ;dx
  ld    c,000                               ;increase in dy
  call  SetText2

  ld    hl,(TotalCredits)
  call  NUM_TO_ASCII

  ld    a,077
  ld    (PutLetter+dx),a                    ;set dx of next letter

  ld    ix,Ascii5Byte
  ld    b,077                               ;dx
  ld    c,000                               ;increase in dy
;  call  SetText2

  .Skip0sLoop:
  ld    a,(ix)
  cp    255
  jr    z,.TotalValueIs0
  cp    "0"
  jp    nz,SetText2.NextLetter              ;in: ix->text
  inc   ix
;  ld    a,(PutLetter+dx)                    ;set dx of next letter
;  add   a,8
;  ld    (PutLetter+dx),a                    ;set dx of next letter
  jr    .Skip0sLoop

  .TotalValueIs0:
  dec   ix
;  ld    a,(PutLetter+dx)                    ;set dx of next letter
;  sub   a,8
;  ld    (PutLetter+dx),a                    ;set dx of next letter
  jp    SetText2.NextLetter                 ;in: ix->text

SetItemInfoLifeSupport:
  ret

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
  ld    ix,TextColonyExpansion
  ld    de,TextCostColonyExpansion  
  jp    SetItemInfo

  .DigSite:
  ld    ix,TextDigSite
  ld    de,TextCostDigSite  
  jp    SetItemInfo

  .RadiationShield:
  ld    ix,TextRadiationShield
  ld    de,TextCostRadiationShield  
  jp    SetItemInfo

  .WaterRecycler:
  ld    ix,TextWaterRecycler
  ld    de,TextCostWaterRecycler  
  jp    SetItemInfo

  .OxygenGenerator:
  ld    ix,TextOxygenGenerator
  ld    de,TextCostOxygenGenerator  
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

TextOxygenGenerator:
  db    "Extracts oxygen from carbon dioxide-rich atmosphere.",255
TextCostOxygenGenerator:
  db    "Cost: 250",255


TextWaterRecycler:
  db    "Recycles waste water into clean, drinkable water using filtration systems.",255
TextCostWaterRecycler:
  db    "Cost: 250",255


TextRadiationShield:
  db    "Nanoshield Skin provides active radiation shielding",255
TextCostRadiationShield:
  db    "Cost: 250",255


TextDigSite:
  db    "Unlocks an additional drilling location",255
TextCostDigSite:
  db    "Cost: 250",255


TextColonyExpansion:
  db    "Develops new colony sectors",255
TextCostColonyExpansion:
  db    "Cost: 250",255








TextMaxedOut:
  db    "Maxed Out",255
TextCostMaxedOut:
  db    " ",255

TextCredits:
  db    "Credits:",255

TextMinerSpeedLevel2:
  db    "Increases miner speed by 50% Current: Level 1",255
TextCostMinerSpeedLevel2:
  db    "Cost: 250",255

TextMinerSpeedLevel3:
  db    "Doubles miner speed Current: Level 2",255
TextCostMinerSpeedLevel3:
  db    "Cost: 750",255

TextMinerSpeedLevel4:
  db    "Drill speed keeps building up when uninterrupted Current: Lvl 3",255
TextCostMinerSpeedLevel4:
  db    "Cost: 2000",255


TextDrillConeLevel2:
  db    "Allows drilling through Ironstone Current: Level 1",255
TextCostDrillConeLevel2:
  db    "Cost: 250",255

TextDrillConeLevel3:
  db    "Allows drilling through Metallic Ore Current: Level 2",255
TextCostDrillConeLevel3:
  db    "Cost: 750",255

TextDrillConeLevel4:
  db    "Allows drilling through Xenodiamond Current: Level 3",255
TextCostDrillConeLevel4:
  db    "Cost: 2000",255


TextCargoSizeLevel2:
  db    "Doubles cargo capacity Current: Level 1",255
TextCostCargoSizeLevel2:
  db    "Cost: 250",255

TextCargoSizeLevel3:
  db    "Doubles cargo capacity Current: Level 2",255
TextCostCargoSizeLevel3:
  db    "Cost: 750",255

TextCargoSizeLevel4:
  db    "Doubles cargo capacity Current: Level 3",255
TextCostCargoSizeLevel4:
  db    "Cost: 2000",255


TextFuelTankLevel2:
  db    "Doubles fuel capacity Current: Level 1",255
TextCostFuelTankLevel2:
  db    "Cost: 250",255

TextFuelTankLevel3:
  db    "Doubles fuel capacity Current: Level 2",255
TextCostFuelTankLevel3:
  db    "Cost: 750",255

TextFuelTankLevel4:
  db    "Doubles fuel capacity Current: Level 3",255
TextCostFuelTankLevel4:
  db    "Cost: 2000",255


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
  call  CalculateLenghtNextWord         ;out: b=total lenght next word

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
