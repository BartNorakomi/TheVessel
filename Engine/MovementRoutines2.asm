;UpgradeMenuEventRoutine
;DrillingLocationsRoutine
;PenguinBikeRaceGameRoutine
;BlockHitGameRoutine
;JumpDownGameRoutine
;BasketMovementRoutine
;BasketBallGameRoutine
;BackToTitleScreenBasketBall

Phase MovementRoutinesAddress

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





;this routine puts basketball titlescreen in page 0, while game screen is in page 1 
BackToTitleScreenBasketBall:
  ;set buttons
  ld    hl,BasketBallButtonsPart1Address
  ld    a,BasketBallButtonsGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (221*128) + (000/2) - 128
  ld    bc,$0000 + (010*256) + (256/2)              ;10 lines for the buttons
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;set title screen
  ld    hl,BasketBallTitleScreenPart1Address
  ld    a,BasketBallTitleScreenGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128

  ld    b,12                                        ;12 * 10 lines=120 lines
  .loop:
  push  bc
  call  .Copy10lines
  ld    bc,10*128
  add   hl,bc
  ex    de,hl
  add   hl,bc
  ex    de,hl
  pop   bc
  djnz  .loop

  ld    bc,$0000 + (008*256) + (256/2)              ;8 more lines
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,BasketBallTitleScreenPart2Address
  ld    a,BasketBallTitleScreenGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)              ;7 more lines
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;set palette
  ld    hl,.BasketBallTitleScreenPalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  ld    a,0*32 + 31
	ld    (PageOnNextVblank),a
  call  screenon

  .Engine:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a
  call  PopulateControls
  call  .SelectButton
  call  .BlinkSelectedButton

  xor   a
  ld    hl,vblankintflag
  .checkflag:
  cp    (hl)
  jr    z,.checkflag
  ld    (hl),a
  jp    .Engine

  .BasketBallTitleScreenPalette:
  incbin "..\grapx\basketball\TitleScreen\TitleScreen.sc5",$7680+7,32

  .SelectButton:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		5,a           ;trig b pressed ?
  jr    nz,.TriggerBPressed
	bit		4,a           ;trig a pressed ?
  jr    nz,.TriggerAPressed
  and   %0000 1100
  cp    %0000 0100
  jr    z,.LeftPressed
  cp    %0000 1000
  ret   nz
  .RightPressed:
  ld    a,1
  ld    (basketballTitleScreenButton),a ;0=left button selected, 1=right button selected
  ret
  .LeftPressed:
  xor   a
  ld    (basketballTitleScreenButton),a ;0=left button selected, 1=right button selected
  ret
  .TriggerBPressed:
  ld    a,0                                ;back to arcade hall 1
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  pop   af
  ret

  .TriggerAPressed:
  ld    a,(basketballTitleScreenButton) ;0=left button selected, 1=right button selected
  or    a
  jp    z,.StartGame

  .StartShopMenu:
  ;set title screen
  ld    hl,BasketBallShopPart1Address
  ld    a,BasketBallShopGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (000*128) + (000/2) - 128

  ld    b,12                                        ;12 * 10 lines=120 lines
  .loop2:
  push  bc
  call  .Copy10lines
  ld    bc,10*128
  add   hl,bc
  ex    de,hl
  add   hl,bc
  ex    de,hl
  pop   bc
  djnz  .loop2

  ld    bc,$0000 + (008*256) + (256/2)              ;8 more lines
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,BasketBallShopPart2Address
  ld    a,BasketBallShopGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)              ;7 more lines
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,.CopyButtons
  call  DoCopy
  ld    hl,.EraseButtonsCurrentlyVisibleInShop
  call  DoCopy
  call  .SetAmountOfCoinsShop
  call  .EraseCostOfBallsAlreadyPurchased

  ;set palette
  ld    hl,.BasketBallShopPalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  ld    a,1*32 + 31
	ld    (PageOnNextVblank),a

  .Engine2:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a
  call  PopulateControls
  call  .SelectedShopButton
  call  .ShowSelectedShopButton
;  call  .BlinkSelectedButton

  xor   a
  ld    hl,vblankintflag
  .checkflag2:
  cp    (hl)
  jr    z,.checkflag2
  ld    (hl),a
  jp    .Engine2

  .EraseCostOfBallsAlreadyPurchased:
  ld    hl,BallsPurchased                           ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  bit   0,(hl)
  ld    de,.EraseCostTennisBall
  call  nz,.GoEraseCostOfThisBall
  bit   1,(hl)
  ld    de,.EraseCostBilliardBall
  call  nz,.GoEraseCostOfThisBall
  bit   2,(hl)
  ld    de,.EraseCostBaseBall
  call  nz,.GoEraseCostOfThisBall
  bit   3,(hl)
  ld    de,.EraseCostSoccerBall
  call  nz,.GoEraseCostOfThisBall
  bit   4,(hl)
  ld    de,.EraseCostVolleysBall
  call  nz,.GoEraseCostOfThisBall
  bit   5,(hl)
  ld    de,.EraseCostBowlingBall
  call  nz,.GoEraseCostOfThisBall
  bit   6,(hl)
  ld    de,.EraseCostGolfBall
  call  nz,.GoEraseCostOfThisBall
  bit   7,(hl)
  ld    de,.EraseCostBeachBall
  call  nz,.GoEraseCostOfThisBall
  ret

  .GoEraseCostOfThisBall:
  push  hl
  ex    de,hl
  call  DoCopy
  pop   hl
  ret

  .EraseCostTennisBall:
	db		0,0,0,0
	db		124,0,048,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .EraseCostBilliardBall:
	db		0,0,0,0
	db		164,0,048,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .EraseCostBaseBall:
	db		0,0,0,0
	db		082,0,080,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .EraseCostSoccerBall:
	db		0,0,0,0
	db		122,0,080,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .EraseCostVolleysBall:
	db		0,0,0,0
	db		162,0,080,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .EraseCostBowlingBall:
	db		0,0,0,0
	db		082,0,112,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .EraseCostGolfBall:
	db		0,0,0,0
	db		122,0,112,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .EraseCostBeachBall:
	db		0,0,0,0
	db		162,0,112,1
	db		014,0,006,0
	db		4+ (4 * 16),0,$c0

  .SetAmountOfCoinsShop:
  ld    hl,.EraseAmountOfCoins
  call  DoCopy
  ;put amount of coins
  ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,135
  ld    (PutLetterNonTransparant+dx),a
  ld    a,14
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(TotalCoinsBasketball)
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  ld    a,$98
  ld    (PutLetterNonTransparant+copytype),a
  call  HandleBasketBallgameHud.PutTextLoop
  ld    a,$90
  ld    (PutLetterNonTransparant+copytype),a
  call  .EraseCostOfBallsAlreadyPurchased
  ret

  .EraseAmountOfCoins:
  db    000,000,000,000                 ;sx,--,sy,spage
  db    134,000,014,001                 ;dx,--,dy,dpage
  db    038,000,006,000                 ;nx,--,ny,--
	db		4+ (4 * 16),0,$80

  .SelectedShopButton:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  and   %0000 1100
  jr    z,.EndCheckLeftRight
  cp    %0000 1000
  jr    z,.RightPressed2

  .LeftPressed2:
  ld    a,(CurrentBallsSelected)
  dec   a
  ret   m
  cp    2
  ret   z
  cp    5
  ret   z
  push  af
  call  .EraseSelectedShopButton
  pop   af
  ld    (CurrentBallsSelected),a
  ret

  .RightPressed2:
  ld    a,(CurrentBallsSelected)
  inc   a
  cp    3
  ret   z
  cp    6
  ret   z
  cp    9
  ret   z
  push  af
  call  .EraseSelectedShopButton
  pop   af
  ld    (CurrentBallsSelected),a
  ret

  .EndCheckLeftRight:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
  and   %0000 0011
  jr    z,.EndCheckUpDown
  cp    %0000 0010
  jr    z,.DownPressed2

  .UpPressed2:
  ld    a,(CurrentBallsSelected)
  sub   3
  ret   m
  push  af
  call  .EraseSelectedShopButton
  pop   af
  ld    (CurrentBallsSelected),a
  ret

  .DownPressed2:
  ld    a,(CurrentBallsSelected)
  add   3
  cp    9
  ret   nc
  push  af
  call  .EraseSelectedShopButton
  pop   af
  ld    (CurrentBallsSelected),a
  ret

  .EndCheckUpDown:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;space pressed ?
  ret   z

  ld    hl,BallsPurchased               ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  ;space pressed, check if current ball is already purchased ?
  ld    a,(CurrentBallsSelected)        ;0=basketball,1=tennisball,2=billiardball,3=baseball,4=soccerball,5=volleyball,6=bowlingball,7=golfball,8=beachball
  or    a
  jp    z,.CurrentBallIsInPosession
  dec   a
  jp    z,.CheckTennisBall
  dec   a
  jp    z,.CheckBilliardBall
  dec   a
  jp    z,.CheckBaseBall
  dec   a
  jp    z,.CheckSoccerBall
  dec   a
  jp    z,.CheckVolleyBall
  dec   a
  jp    z,.CheckBowlingBall
  dec   a
  jp    z,.CheckGolfBall
  dec   a
  jp    z,.CheckBeachBall
  ret

  .CheckBeachBall:
  bit   7,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostBeachBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   7,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CheckGolfBall:
  bit   6,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostGolfBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   6,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CheckBowlingBall:
  bit   5,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostBowlingBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   5,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CheckVolleyBall:
  bit   4,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostVolleyBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   4,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CheckSoccerBall:
  bit   3,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostSoccerBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   3,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CheckBaseBall:
  bit   2,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostBaseBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   2,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CheckBilliardBall:
  bit   1,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostBilliardBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   1,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CheckTennisBall:
  bit   0,(hl)
  jp    nz,.CurrentBallIsInPosession
  ld    hl,(TotalCoinsBasketball)
  ld    de,.CostTennisBall
  xor   a
  sbc   hl,de
  ret   c
  ld    (TotalCoinsBasketball),hl
  ld    a,(BallsPurchased)            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  set   0,a
  ld    (BallsPurchased),a            ;b0=tennisball,b1=billiardball,b2=baseball,b3=soccerball,b4=volleyball,b5=bowlingball,b6=golfball,b7=beachball
  call  .SetAmountOfCoinsShop
  ret

  .CurrentBallIsInPosession:
  ;set palette
  
  ld    hl,.BasketBallTitleScreenPalette
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir

  ld    a,0*32 + 31
	ld    (PageOnNextVblank),a
  pop   af
  ret

  .CostTennisBall:    equ 010
  .CostBilliardBall:  equ 020
  .CostBaseBall:      equ 035
  .CostSoccerBall:    equ 050
  .CostVolleyBall:    equ 070
  .CostBowlingBall:   equ 095
  .CostGolfBall:      equ 120
  .CostBeachBall:     equ 150

  .EraseSelectedShopButton:
  ld    hl,.DoShowSelectedShopButton
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir

  xor   a
  ld    (FreeToUseFastCopy0+sx),a

  ld    a,(CurrentBallsSelected)
  add   a,a                             ;*2
  ld    e,a
  ld    d,0
  ld    hl,.BallCoordinateTable
  add   hl,de
  ld    a,(hl)                          ;x
  ld    (FreeToUseFastCopy0+dx),a
  inc   hl
  ld    a,(hl)                          ;y
  ld    (FreeToUseFastCopy0+dy),a

  ld    hl,FreeToUseFastCopy0
  call  DoCopy
  ret

  .ShowSelectedShopButton:
  ld    hl,.DoShowSelectedShopButton
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir
  
  ld    a,(CurrentBallsSelected)
  add   a,a                             ;*2
  ld    e,a
  ld    d,0
  ld    hl,.BallCoordinateTable
  add   hl,de
  ld    a,(hl)                          ;x
  ld    (FreeToUseFastCopy0+dx),a
  inc   hl
  ld    a,(hl)                          ;y
  ld    (FreeToUseFastCopy0+dy),a

  ld    hl,FreeToUseFastCopy0
  call  DoCopy
  ret

  .BallCoordinateTable: ;dx,dy table: 0=basketball,1=tennisball,2=billiardball,3=baseball,4=soccerball,5=volleyball,6=bowlingball,7=golfball,8=beachball
  db    079,029,  119,029,  159,029
  db    079,061,  119,061,  159,061
  db    079,093,  119,093,  159,093

  .DoShowSelectedShopButton:
  db    019,000,231,001                 ;sx,--,sy,spage
  db    000,000,000,001                 ;dx,--,dy,dpage
  db    019,000,019,000                 ;nx,--,ny,--
  db    000,%0000 0000,$98              ;fast copy -> Copy from right to left     

  .EraseButtonsCurrentlyVisibleInShop:
  db    000,000,000,000                 ;sx,--,sy,spage
  db    151,000,011,001                 ;dx,--,dy,dpage
  db    038,000,019,000                 ;nx,--,ny,--
	db		4+ (4 * 16),0,$80

  .CopyButtons:
  db    151,000,011,001                 ;sx,--,sy,spage
  db    000,000,231,001                 ;dx,--,dy,dpage
  db    038,000,019,000                 ;nx,--,ny,--
  db    000,%0000 0000,$90              ;fast copy -> Copy from right to left     
  

  .BasketBallShopPalette:
  incbin "..\grapx\basketball\shop\shop.sc5",$7680+7,32

  .StartGame:
  ;reset score and time bars
  ld    hl,CourtPart1Address
  ld    a,BasketBallCourtGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    a,1
  ld    (Vdp_Write_HighPage?),a
  ld    hl,$8000 + (007*128) + (000/2) - 128
  ld    de,$0000 + (007*128) + (000/2) - 128
  ld    bc,$0000 + (006*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  xor   a
  ld    (Vdp_Write_HighPage?),a

  call  BasketBallGameRoutine.ResetVariables
  call  WriteSpatToVram
  ld    a,2*32 + 31
	ld    (PageOnNextVblank),a

  call  SpritesOn

  ld    hl,.CopyPage2ToPage3
  call  DoCopy
  ld    hl,.CopyPage2ToPage1
  call  DoCopy
  ld    hl,.CopyPage2ToPage0
  call  DoCopy
  call  WaitVdpReady
  call  WaitVblank
  call  WaitVblank
;.q: jp .q

  pop   af
  ret

  .CopyPage2ToPage1:
	db		0,0,0,2
	db		0,0,0,1
	db		0,1,135,0
	db		0,0,$d0	
  .CopyPage2ToPage3:
	db		0,0,0,2
	db		0,0,0,3
	db		0,1,135,0
	db		0,0,$d0	
  .CopyPage2ToPage0:
	db		0,0,0,2
	db		0,0,0,0
	db		0,1,135,0
	db		0,0,$d0	


  .BlinkSelectedButton:
  ld    a,(framecounter2)
  and   31
  cp    16
  jr    c,.BothButtonsOff

  ld    a,(basketballTitleScreenButton) ;0=left button selected, 1=right button selected
  or    a
  jp    z,.BlinkLeftButton

  .BlinkRightButton:
  ld    hl,.ShowStartButtonBlinkOff
  call  DoCopy
  ld    hl,.ShowShopButtonBlinkOn
  call  DoCopy
  ret

  .BlinkLeftButton:
  ld    hl,.ShowStartButtonBlinkOn
  call  DoCopy
  ld    hl,.ShowShopButtonBlinkOff
  call  DoCopy
  ret

  .BothButtonsOff:
  ld    hl,.ShowStartButtonBlinkOff
  call  DoCopy
  ld    hl,.ShowShopButtonBlinkOff
  call  DoCopy
  ret

  .Copy10lines:
  push  hl
  push  de
  ld    bc,$0000 + (010*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank
  pop   de
  pop   hl
  ret

  .ShowStartButtonBlinkOff:
  db    000,000,221,001                 ;sx,--,sy,spage
  db    078,000,120,000                 ;dx,--,dy,dpage
  db    038,000,010,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left     

  .ShowStartButtonBlinkOn:
  db    038,000,221,001                 ;sx,--,sy,spage
  db    078,000,120,000                 ;dx,--,dy,dpage
  db    038,000,010,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left     

  .ShowShopButtonBlinkOff:
  db    076,000,221,001                 ;sx,--,sy,spage
  db    142,000,120,000                 ;dx,--,dy,dpage
  db    038,000,010,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left     
  
  .ShowShopButtonBlinkOn:
  db    114,000,221,001                 ;sx,--,sy,spage
  db    142,000,120,000                 ;dx,--,dy,dpage
  db    038,000,010,000                 ;nx,--,ny,--
  db    000,%0000 0000,$d0              ;fast copy -> Copy from right to left     
  



;basket right side
Basketball_1:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_1_0
Basketball_16:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_16_0
Basketball_17:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_17_0
Basketball_18:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_18_0
Basketball_19:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_19_0
Basketball_20:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_20_0
Basketball_21:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_21_0
Basketball_22:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_22_0
Basketball_23:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_23_0
Basketball_24:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_24_0
Basketball_25:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_25_0
Basketball_26:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_26_0
Basketball_27:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_27_0
Basketball_28:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_28_0
Basketball_29:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_29_0
Basketball_29end:

;basket left side
Basketball_0:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_0_0
Basketball_2:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_2_0
Basketball_3:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_3_0
Basketball_4:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_4_0
Basketball_5:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_5_0
Basketball_6:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_6_0
Basketball_7:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_7_0
Basketball_8:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_8_0
Basketball_9:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_9_0
Basketball_10:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_10_0
Basketball_11:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_11_0
Basketball_12:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_12_0
Basketball_13:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_13_0
Basketball_14:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_14_0
Basketball_15:        db    Basketballframelistblock, Basketballspritedatablock | dw    Basketball_15_0
Basketball_15end:

BasketMovementRoutine:
  ld    a,3
  ld    (framecounter),a
  ld    (iy+PutOnFrame),3

  .HandlePhase:
  ld    a,(iy+ObjectPhase)
  or    a
  ret   z                                   ;phase 0= do nothing left side of screen
  dec   a
  jp    z,.Phase1                           ;scroll into screen from the left side
  dec   a
  jp    z,.Phase2                           ;wait
  dec   a
  jp    z,.Phase3                           ;scroll out of screen on the left side
  dec   a
  jp    z,.Phase4                           ;scroll into screen from the right side
  dec   a                                   ;phase 5= do nothing right side of screen
  dec   a
  jp    z,.Phase6                           ;wait
  dec   a
  jp    z,.Phase7                           ;scroll out of screen on the right side
  ret

  .Phase7:                                  ;scroll out of screen on the right side
  ld    a,(iy+x)
  add   a,2
  cp    174
  jp    z,.Bigger
  ld    (iy+x),a
  ret
  .Bigger:
  ld    l,(iy+SpriteData)
  ld    h,(iy+SpriteData+1)
  ld    de,4
  add   hl,de
  xor   a
  ld    de,Basketball_29end
  sbc   hl,de
  jr    z,.GoPhase1
  add   hl,de
  ld    (iy+SpriteData),l
  ld    (iy+SpriteData+1),h
  ret
  .GoPhase1:
  ld    (iy+ObjectPhase),1
  ld    (iy+x),84
  ld    hl,Basketball_15
  ld    (iy+SpriteData),l
  ld    (iy+SpriteData+1),h
  ret

  .Phase6:                                  ;wait
  ld    a,(iy+var1)
  or    a
  call  z,IncreaseScoreAndComboDecreaseMaxTimers
  inc   a
  and   15
  ld    (iy+var1),a
  ret   nz
  ld    (iy+ObjectPhase),7
  ret

  .Phase4:                                  ;scroll into screen from the right side
  ld    l,(iy+SpriteData)
  ld    h,(iy+SpriteData+1)
  ld    de,-4
  add   hl,de
  xor   a
  ld    de,Basketball_1-4
  sbc   hl,de
  jr    z,.FullyInScreenNowMoveLeft
  add   hl,de
  ld    (iy+SpriteData),l
  ld    (iy+SpriteData+1),h
  ret

  .FullyInScreenNowMoveLeft:
  ld    a,(iy+x)
  sub   a,2
  ld    (iy+x),a
  cp    156
  ret   nz
  ld    (iy+ObjectPhase),5
  ret

  .Phase3:                                  ;scroll out of screen on the left side
  ld    a,(iy+x)
  sub   a,2
  cp    82
  jp    z,.Smaller
  ld    (iy+x),a
  ret
  .Smaller:
  ld    l,(iy+SpriteData)
  ld    h,(iy+SpriteData+1)
  ld    de,4
  add   hl,de
  xor   a
  ld    de,Basketball_15end
  sbc   hl,de
  jr    z,.GoPhase4
  add   hl,de
  ld    (iy+SpriteData),l
  ld    (iy+SpriteData+1),h
  ret
  .GoPhase4:
  ld    (iy+ObjectPhase),4
  ld    (iy+x),172
  ld    hl,Basketball_29
  ld    (iy+SpriteData),l
  ld    (iy+SpriteData+1),h
  ret

  .Phase2:                                  ;wait
  ld    a,(iy+var1)
  or    a
  call  z,IncreaseScoreAndComboDecreaseMaxTimers
  inc   a
  and   15
  ld    (iy+var1),a
  ret   nz
  ld    (iy+ObjectPhase),3
  ret

  .Phase1:                                  ;scroll into screen from the left side
  ld    l,(iy+SpriteData)
  ld    h,(iy+SpriteData+1)
  ld    de,-4
  add   hl,de
  xor   a
  ld    de,Basketball_29
  sbc   hl,de
  jr    z,.FullyInScreenNowMoveRight
  add   hl,de
  ld    (iy+SpriteData),l
  ld    (iy+SpriteData+1),h
  ret

  .FullyInScreenNowMoveRight: 
  ld    a,(iy+x)
  add   a,2
  ld    (iy+x),a
  cp    100
  ret   nz
  ld    (iy+ObjectPhase),0
  ret

IncreaseScoreAndComboDecreaseMaxTimers:
  ld    a,(basketballCombotime)
  dec   a
  jr    nz,.EndCheckComboExpired
  ld    a,0
  ld    (basketballCombo),a
  .EndCheckComboExpired:
  ld    a,(basketballCombo)
  inc   a
  ld    (basketballCombo),a

  ld    e,a
  ld    d,0

  ld    hl,(basketballScore)
;  ld    de,1
  add   hl,de
  ld    (basketballScore),hl

  ld    a,255
  ld    (basketballresettimervar),a

  ld    a,(iy+var1)

  ld    a,(basketballMaxtime)
  sub   a,2
  cp    50
  jr    nc,.EndCheckMinimumTimeReached
  ld    a,50
  .EndCheckMinimumTimeReached:
  ld    (basketballMaxtime),a

  ld    a,(basketballMaxCombotime)
  sub   a,2
  cp    50
  jr    nc,.EndCheckMinimumComboTimeReached
  ld    a,50
  .EndCheckMinimumComboTimeReached:
  ld    (basketballMaxCombotime),a

  ld    a,r
  rrca
  ret   c

  ld    a,(CoinSpriteYSpat)                   ;y coin sprite
  cp    213
  ret   nz                                    ;dont put coin if coin is already in play

  ;set x,y coin sprites
  ;y has to be between 15 and 39
  ld    a,r
  and   31
  add   a,15
  cp    40
  jr    c,.go
  ld    a,24
  .go:
  ld    (CoinSpriteYSpat),a                   ;y coin sprite
  ld    (CoinSpriteYSpat+4),a                   ;y coin sprite
  ld    a,r
  add   a,64
  ld    (CoinSpriteXSpat),a                   ;x coin sprite
  ld    (CoinSpriteXSpat+4),a                   ;x coin sprite  
  ret

SetBallShadow:
  ld    a,(BasketBallSpriteXSpat)                 ;x basketball
  ld    (ShadowSpriteXSpat),a             ;x shadow sprite
  ret

SetwallCoverUps:
  ld    a,(BasketBallSpriteYSpat)                 ;y basketball
  ld    (spat+0+(08*4)),a                 ;y sprite 0
  ld    (spat+0+(09*4)),a                 ;y sprite 1
  ld    (spat+0+(10*4)),a                 ;y sprite 2
  ld    (spat+0+(11*4)),a                 ;y sprite 3
  ret

HandleBasketBallgameHud:
  ld    a,(Object2+ObjectPhase)
  or    a                                   ;phase 0= do nothing left side of screen
  jr    z,.Go
  cp    5                                   ;phase 5= do nothing right side of screen
  jp    nz,.ResetTimers                     ;when scored, reset timers

  .Go:
  ld    a,(basketballHudHandler)
  inc   a
  ld    (basketballHudHandler),a
  jp    z,.ReduceTimeAndSetDX
  dec   a
  jp    z,.PutBarIn4Pages
  dec   a
  jp    z,.ReduceComboTimeAndSetDX
  dec   a
  jp    z,.PutBarIn4Pages
  ld    a,255
  ld    (basketballHudHandler),a
  ret

;FreeToUseFastCopy0:                     ;freely usable anywhere
.TextX:                     ;freely usable anywhere
  db    232,000,213,001                 ;sx,--,sy,spage
  db    130,000,019,000                 ;dx,--,dy,dpage
  db    004,000,004,000                 ;nx,--,ny,--
  db    000,%0000 0000,$D0              ;fast copy -> Copy from right to left     

.TextCombo:                     ;freely usable anywhere
  db    168,000,007,000                 ;sx,--,sy,spage
  db    102,000,018,000                 ;dx,--,dy,dpage
  db    026,000,006,000                 ;nx,--,ny,--
  db    000,%0000 0000,$D0              ;fast copy -> Copy from right to left     

.ClearTextCombo:                     ;freely usable anywhere
  db    032,000,012,000                 ;sx,--,sy,spage
  db    102,000,018,000                 ;dx,--,dy,dpage
  db    044,000,006,000                 ;nx,--,ny,--
  db    000,%0000 0000,$D0              ;fast copy -> Copy from right to left     

  .ClearComboText:
  ld    hl,.ClearTextCombo
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir

	ld    a,(screenpage)
  inc   a
  and   3
  ld    (FreeToUseFastCopy0+dPage),a

  ld    hl,FreeToUseFastCopy0
  call  DoCopy
  ret

  .ComboDX: equ 136
  .ComboDY: equ 018
  .SetComboText:
  ld    a,(basketballCombo)
  or    a
  ret   z
  dec   a
  ret   z

  call  .SetTextX
  call  .SetComboAmount
  call  .SetTextCombo  
  ret

  .SetTextX:
  ld    hl,.TextX
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir

	ld    a,(screenpage)
  ld    (FreeToUseFastCopy0+dPage),a

  ld    hl,FreeToUseFastCopy0
  jp    DoCopy

  .SetTextCombo:
  ld    hl,.TextCombo
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir

	ld    a,(screenpage)
  ld    (FreeToUseFastCopy0+dPage),a

  ld    hl,FreeToUseFastCopy0
  jp    DoCopy

  .SetComboAmount:
	ld    a,(screenpage)
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.ComboDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.ComboDY
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(basketballCombo)
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:

  ld    a,(basketballCombo)
  cp    10
  ld    hl,Ascii5Byte+4
  jp    c,.PutTextLoop
  ld    hl,Ascii5Byte+3
  jp    .PutTextLoop

  .ScoreDX: equ 130
  .ScoreDY: equ 007
  .Score:
	ld    a,(screenpage)
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.ScoreDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.ScoreDY
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(basketballScore)
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  ld    hl,Ascii5Byte+1
  call  .PutTextLoop
  ret

  .PutTextLoop:
  ld    a,4
  ld    (PutLetterNonTransparant+nx),a
  ld    a,6
  ld    (PutLetterNonTransparant+ny),a

  ld    a,(hl)
  cp    255
  ret   z
  sub   a,$30                             ;0=$30
  add   a,a                               ;*2
  add   a,a                               ;*4
  add   a,192
  ld    (PutLetterNonTransparant+sx),a
  push  hl
  ld    hl,PutLetterNonTransparant
  call  DoCopy
  pop   hl

  ld    a,(PutLetterNonTransparant+dx)
  add   a,5
  ld    (PutLetterNonTransparant+dx),a
  inc   hl
  jr    .PutTextLoop

  .ReduceComboTimeAndSetDX:
  ld    a,(basketballFirstPointScored?)
  or    a
  ret   z

  ld    a,(basketballCombotime)
  dec   a
  jr    z,.EndCheckSetComboTimeNX
  ld    (basketballCombotime),a
  .EndCheckSetComboTimeNX:

  ;nx = time / maxtime * 45. or time *45 / maxtime
  ld    d,0
  ld    e,a
  ld    hl,48
  call  MultiplyHlWithDE      ;HL = result

  ld    a,(basketballMaxCombotime)
  ld    e,a
  ld    d,0
  push  hl
  pop   bc
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  add   a,198
  ld    (BasketBallGameBar+dx),a

  ld    a,0 + 16*0
  ld    (BasketBallGameBar+clr),a
  ld    a,1
  ld    (BasketBallGameBar+nx),a
  xor   a
  ld    (BasketBallGameBar+dPage),a
  ret

  .ReduceTimeAndSetDX:
  ld    a,(basketballFirstPointScored?)
  or    a
  ret   z

  ld    a,(basketballtime)
  dec   a
  jr    z,.EndCheckSetTimeNX
  ld    (basketballtime),a
  .EndCheckSetTimeNX:

  ;nx = time / maxtime * 45. or time *45 / maxtime
  ld    d,0
  ld    e,a
  ld    hl,48
  call  MultiplyHlWithDE      ;HL = result

  ld    a,(basketballMaxtime)
  ld    e,a
  ld    d,0
  push  hl
  pop   bc
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  add   a,32
  ld    (BasketBallGameBar+dx),a
  ret

  .PutBarIn4Pages:
  ld    a,(basketballFirstPointScored?)
  or    a
  ret   z

  ld    a,$80
  ld    (BasketBallGameBar+copytype),a
  ld    a,0 + 16*0
  ld    (BasketBallGameBar+clr),a
  ld    a,1
  ld    (BasketBallGameBar+nx),a
  xor   a
  ld    (BasketBallGameBar+dPage),a
  ld    hl,BasketBallGameBar
  call  DoCopy
  ld    a,1
  ld    (BasketBallGameBar+dPage),a
  ld    hl,BasketBallGameBar
  call  DoCopy
  ld    a,2
  ld    (BasketBallGameBar+dPage),a
  ld    hl,BasketBallGameBar
  call  DoCopy
  ld    a,3
  ld    (BasketBallGameBar+dPage),a
  ld    hl,BasketBallGameBar
  call  DoCopy
  ret

  .ResetTimers:
  ld    a,(basketballresettimervar)
  inc   a
  ld    (basketballresettimervar),a
  cp    4
  jp    c,.FillTimerAndComboBars
  cp    8
  jp    c,.SetComboText
  cp    12
  jp    c,.Score

  cp    40
  jp    nc,.ClearComboText
  ret

  .FillTimerAndComboBars:
  ld    a,$c0
  ld    (BasketBallGameBar+copytype),a
  ld    a,255
  ld    (basketballHudHandler),a
  ld    a,(basketballMaxtime)
  ld    (basketballtime),a
  ld    a,(basketballMaxCombotime)
  ld    (basketballCombotime),a
  ld    a,48
  ld    (BasketBallGameBar+nx),a
  ld    a,8 + 16*8
  ld    (BasketBallGameBar+clr),a

	ld    a,(screenpage)
  ld    (BasketBallGameBar+dPage),a
  ld    a,32
  ld    (BasketBallGameBar+dx),a
  ld    hl,BasketBallGameBar
  call  DoCopy
  ld    a,198
  ld    (BasketBallGameBar+dx),a
  ld    hl,BasketBallGameBar
  call  DoCopy
  ret

HandleBasketBallGameOver:
  xor   a
  ld    (freezecontrols?),a
  ld    a,(basketballtime)
  dec   a
  jr    nz,.EndCheckGameOver
  ld    a,1
  ld    (freezecontrols?),a
  ;game over if time=1, basketball is lying on the ground and vertical speed=0
  ld    a,(iy+y)
  cp    255
  jr    nz,.EndCheckGameOver
  ld    a,(iy+var1)                       ;vertical speed
  or    a
  jr    nz,.EndCheckGameOver
  ld    a,1
  ld    (basketballGameOver?),a
  .EndCheckGameOver:

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;;
;	ld		a,(Controls)
;	bit		6,a           ;f1 pressed ?
;  jr    nz,.GamveOver

  ld    a,(basketballGameOver?)
  or    a
  ret   z

  .GamveOver:
	ld    a,(screenpage)
  or    a
  ret   nz

  ld    hl,BasketBallGameOverPart1Address
  ld    a,BasketBallGameOverGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  call  WaitVblank
  call  WaitVblank

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (012*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (020*128) + (000/2) - 128
  ld    de,$8000 + (032*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (040*128) + (000/2) - 128
  ld    de,$8000 + (052*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (060*128) + (000/2) - 128
  ld    de,$8000 + (072*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (080*128) + (000/2) - 128
  ld    de,$8000 + (092*128) + (064/2) - 128
  ld    bc,$0000 + (020*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  call  WaitVblank

  ld    hl,$8000 + (100*128) + (000/2) - 128
  ld    de,$8000 + (112*128) + (064/2) - 128
  ld    bc,$0000 + (019*256) + (128/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

;set total coins
  ld    hl,(basketballcoins)
  ld    h,0
  ld    de,(TotalCoinsBasketball)
  add   hl,de
  ld    (TotalCoinsBasketball),hl
;check if current score is new highscore
  ld    de,(basketballScore)
  ld    hl,(HighScoreBasketball)
  xor   a
  sbc   hl,de
  jr    nc,.EndCheckNewHighScore
  ld    (HighScoreBasketball),de
  .EndCheckNewHighScore:
;set completed % (highscore / 340 * 100) = (highscore / 34 * 10) = (highscore / 17 * 5)
  ld    hl,(HighScoreBasketball)
  ld    de,5
  call  MultiplyHlWithDE      ;HL = result
  push  hl
  pop   bc
  ld    de,17
  call  DivideBCbyDE          ; Out: BC = result, HL = rest
  ld    a,c
  cp    101
  jr    c,.SetCompletePercentage
  ld    a,100
  .SetCompletePercentage:
  ld    (BasketballCompletePercentage),a

  call  .SetCoinsCollected
  call  .SetScore
  call  .SetBestScore
  call  .SetCompleted
  call  .SetPercentageSymbol

  ld    a,1*32 + 31
	ld    (PageOnNextVblank),a
  call  SpritesOff

  xor   a
  ld    (freezecontrols?),a  
  call  STOPWAITSPACEPRESSED

  jp    BackToTitleScreenBasketBall

.PercentageSymbol:                     ;freely usable anywhere
  db    163,000,060,001                 ;sx,--,sy,spage
  db    169,000,107,001                 ;dx,--,dy,dpage
  db    007,000,006,000                 ;nx,--,ny,--
  db    000,%0000 0000,$90              ;fast copy -> Copy from right to left     
  .SetPercentageSymbol:
  ld    hl,.PercentageSymbol
  ld    de,FreeToUseFastCopy0
  ld    bc,15
  ldir

  ld    a,(PutLetterNonTransparant+dx)
  ld    (FreeToUseFastCopy0+dx),a
  ld    hl,FreeToUseFastCopy0
  call  DoCopy
  ret

  .CompletedDX: equ 148
  .CompletedDY: equ 105
  .SetCompleted:
	ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.CompletedDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.CompletedDY
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(BasketballCompletePercentage)
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark
  ret

  .BestScoreDX: equ 133
  .BestScoreDY: equ 092
  .SetBestScore:
	ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.BestScoreDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.BestScoreDY
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(HighScoreBasketball)
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark
  ret

  .ScoreDX: equ 137
  .ScoreDY: equ 079
  .SetScore:
	ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.ScoreDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.ScoreDY
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(basketballScore)
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopDark
  ret

  .CoinsDX: equ 139
  .CoinsDY: equ 038
  .SetCoinsCollected:
	ld    a,1
  ld    (PutLetterNonTransparant+dPage),a             ;set page where to put text
  ld    a,.CoinsDX
  ld    (PutLetterNonTransparant+dx),a
  ld    a,.CoinsDY
  ld    (PutLetterNonTransparant+dy),a

  ld    hl,(basketballcoins)
  ld    h,0
  call  NUM_TO_ASCII                      ;HL = 16-bit number (0-65535), Output: ASCII string stored at Ascii5Byte:
  call  SetHLToAscii5ByteSkip0
  call  .PutTextLoopBright
  ret

  .PutTextLoopDark:
  ld    a,6
  ld    (PutLetterNonTransparant+nx),a
  ld    a,9
  ld    (PutLetterNonTransparant+ny),a

  ld    a,(hl)
  cp    255
  ret   z
  sub   a,$30                             ;0=$30
  add   a,a                               ;*2
  add   a,a                               ;*4
  add   a,a                               ;*8
  ld    (PutLetterNonTransparant+sx),a
  push  hl
  ld    hl,PutLetterNonTransparant
  call  DoCopy
  pop   hl

  ld    a,(PutLetterNonTransparant+dx)
  add   a,7
  ld    (PutLetterNonTransparant+dx),a
  inc   hl
  jr    .PutTextLoopDark

  .PutTextLoopBright:
  ld    a,6
  ld    (PutLetterNonTransparant+nx),a
  ld    a,9
  ld    (PutLetterNonTransparant+ny),a

  ld    a,(hl)
  cp    255
  ret   z
  sub   a,$30                             ;0=$30
  add   a,a                               ;*2
  add   a,a                               ;*4
  add   a,a                               ;*8
  add   a,96
  ld    (PutLetterNonTransparant+sx),a
  push  hl
  ld    hl,PutLetterNonTransparant
  call  DoCopy
  pop   hl

  ld    a,(PutLetterNonTransparant+dx)
  add   a,7
  ld    (PutLetterNonTransparant+dx),a
  inc   hl
  jr    .PutTextLoopBright

HandlePickUpCoin:
  ld    a,(CoinSpriteXSpat)                   ;x coin sprite
  sub   a,14
  cp    (iy+x)
  ret   nc
  add   a,27
  cp    (iy+x)
  ret   c

  ld    a,(BasketBallSpriteYSpat)                     ;y basketball
  ld    b,a

  ld    a,(CoinSpriteYSpat)                   ;x coin sprite
  sub   a,14
  cp    b
  ret   nc
  add   a,27
  cp    b
  ret   c

  ld    a,(basketballcoins)
  inc   a
  ld    (basketballcoins),a

  ld    a,213
  ld    (CoinSpriteYSpat),a                   ;y coin sprite
  ld    (CoinSpriteYSpat+4),a                   ;y coin sprite
  ld    a,255 ;????????? if we dont do this we get coin bug
  ld    (CoinSpriteXSpat),a                   ;y coin sprite
  ld    (CoinSpriteXSpat+4),a                   ;y coin sprite
  ret

BasketBallGameRoutine:
  ld    a,(framecounter2)
  inc   a
  ld    (framecounter2),a

  call  .HandlePhase                        ;load graphics, init variables
  call  HandleBasketBallgameHud
;  call  CheckEndArcadeGameTriggerB
  call  HandleBasketBall
  call  SetwallCoverUps
  call  SetBallShadow
  call  .HandleBallShadowCoverUp
  call  HandleNet
  call  HandleBasketBallGameOver
  call  HandlePickUpCoin

;call screenon
;jp BackToTitleScreenBasketBall.StartShopMenu

  ret

.HandleBallShadowCoverUp:
  ;set x,y shadow coverup sprites
  ld    a,112
  ld    (ShadowCoverUpSpriteLeftYSpat),a                 ;y shadow coverup sprite left
  ld    (ShadowCoverUpSpriteLeftYSpat+4),a                 ;y shadow coverup sprite left
  ld    a,112
  ld    (ShadowCoverUpSpriteRightYSpat),a                 ;y shadow coverup sprite right
  ld    (ShadowCoverUpSpriteRightYSpat+4),a                 ;y shadow coverup sprite right

  ld    a,(iy+y)
  cp    253
  ret   c

  ;set x,y shadow coverup sprites
  ld    a,213
  ld    (ShadowCoverUpSpriteLeftYSpat),a                 ;y shadow coverup sprite left
  ld    (ShadowCoverUpSpriteLeftYSpat+4),a                 ;y shadow coverup sprite left
  ld    a,213
  ld    (ShadowCoverUpSpriteRightYSpat),a                 ;y shadow coverup sprite right
  ld    (ShadowCoverUpSpriteRightYSpat+4),a                 ;y shadow coverup sprite right
  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ;set court in page 0
  ld    hl,CourtPart1Address
  ld    a,BasketBallCourtGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (128*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,CourtPart2Address
  ld    a,BasketBallCourtGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;copy court to page 1
  xor   a
  ld    (CopyPageToPage212High+sPage),a
  ld    a,1
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy

  ;set font at y=212 page 1
  ld    hl,BasketBallFontPart1Address
  ld    a,BasketBallFontGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$8000 + (212*128) + (000/2) - 128
  ld    bc,$0000 + (009*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ;copy court to page 2
  ld    a,2
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy
  ;copy court to page 3
  ld    a,3
  ld    (CopyPageToPage212High+dPage),a
  ld    hl,CopyPageToPage212High
  call  DoCopy

  call  SetArcadeMachine
  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud

  ;These calls starts at titlescreen, instead of directly ingame  
  call  .ResetVariables
  call  SpritesOff
;  call  screenon
  jp    BackToTitleScreenBasketBall

  .ResetVariables:
  call  PopulateControls
  push  iy
  ld    iy,Object2
  ld    (iy+ObjectPhase),1
  ld    (iy+x),84
  ld    hl,Basketball_15
  ld    (iy+SpriteData),l
  ld    (iy+SpriteData+1),h
  pop   iy

  ld    a,1
  ld    (SetArcadeGamePalette?),a
  call  .SetBasketballGameSprites

  xor   a
  ld    (basketballGameOver?),a
  ld    (basketballFirstPointScored?),a
  ld    (basketballcoins),a
  ld    (basketballTitleScreenButton),a
  ld    hl,0
  ld    (basketballScore),hl
  ld    (basketballCombo),hl
  ld    a,150
  ld    (basketballtime),a
  ld    (basketballMaxtime),a
  ld    a,100
  ld    (basketballCombotime),a
  ld    (basketballMaxCombotime),a
  ld    a,255
  ld    (basketballHudHandler),a

  ld    a,213
  ld    (NetSpriteYSpat),a
  ld    (NetSpriteYSpat+4),a
  ld    (NetSpriteOpenYSpat),a
  ld    (NetSpriteOpenYSpat+4),a

  ;set y shadow sprite
  ld    a,111
  ld    (ShadowSpriteYSpat),a                 ;y shadow sprite
  ld    a,120                                 ;x basketball
  ld    (ShadowSpriteXSpat),a                 ;x shadow sprite

  ;set y coin sprites
  ld    a,213
  ld    (CoinSpriteYSpat),a                   ;y coin sprite
  ld    (CoinSpriteYSpat+4),a                   ;y coin sprite

  ;set x,y shadow coverup sprites
  ld    a,213
  ld    (ShadowCoverUpSpriteLeftYSpat),a                 ;y shadow coverup sprite left
  ld    (ShadowCoverUpSpriteLeftYSpat+4),a                 ;y shadow coverup sprite left
  xor   a
  ld    (ShadowCoverUpSpriteLeftXSpat),a                 ;x shadow coverup sprite left
  ld    (ShadowCoverUpSpriteLeftXSpat+4),a                 ;x shadow coverup sprite left
  ld    a,213
  ld    (ShadowCoverUpSpriteRightYSpat),a                 ;y shadow coverup sprite right
  ld    (ShadowCoverUpSpriteRightYSpat+4),a                 ;y shadow coverup sprite right
  ld    a,250
  ld    (ShadowCoverUpSpriteRightXSpat),a                 ;x shadow coverup sprite right
  ld    (ShadowCoverUpSpriteRightXSpat+4),a                 ;x shadow coverup sprite right

  ;set x,y wallcoverupsprites
  xor   a
  ld    (spat+1+(08*4)),a                 ;x sprite 0
  ld    (spat+1+(09*4)),a                 ;x sprite 1

  ld    a,256-6
  ld    (spat+1+(10*4)),a                 ;x sprite 2
  ld    (spat+1+(11*4)),a                 ;x sprite 3

  ld    a,-11
  ld    (spat+0+(00*4)),a                 ;y sprite 4
  ld    (spat+0+(01*4)),a                 ;y sprite 5
  ld    (spat+0+(02*4)),a                 ;y sprite 6
  ld    (spat+0+(03*4)),a                 ;y sprite 7
  ld    (spat+0+(04*4)),a                 ;y sprite 8
  ld    (spat+0+(05*4)),a                 ;y sprite 9
  ld    (spat+0+(06*4)),a                 ;y sprite 9
  ld    (spat+0+(07*4)),a                 ;y sprite 9
  ret

  .SetBasketballGameSprites:
  ld    (iy+x),120                      ;x basketball
  ld    (iy+y),255                       ;y basketball
  ld    a,(iy+y)
  sub   144
  ld    (BasketBallSpriteYSpat),a                 ;y sprite 0
  ld    (BasketBallSpriteYSpat+4),a                 ;y sprite 1
  ld    a,(iy+x)
  ld    (BasketBallSpriteXSpat),a                 ;x sprite 0
  ld    (BasketBallSpriteXSpat+4),a                 ;x sprite 1

;  ld    (iy+x),120-70                      ;x basketball
;  ld    (iy+y),255-200                       ;y basketball

  ;write sprite character
	xor		a				;page 0/1
	ld		hl,sprcharaddr+8*32	;sprite 0 character table in VRAM
	call	SetVdp_Write

	ld		hl,WallCoverUpsCharSprite	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix352		;write sprite color of pointer and hand to vram
	call	outix192		;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+8*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

	ld		hl,WallCoverUpsColSprite	;sprite 0 character table in VRAM
	ld		c,$98
	call	outix176	;write sprite color of pointer and hand to vram
	call	outix96	;write sprite color of pointer and hand to vram

  ;first 8 sprites are empty wall coverup sprites
	xor		a				;page 0/1
	ld		hl,sprcharaddr	;sprite 0 character table in VRAM
	call	SetVdp_Write

  ld    b,0
  xor   a
  .loop:
  out   ($98),a
  djnz  .loop

  call  LoadBallTypeAndPalette
  ret

LoadBallTypeAndPalette:
  ld    a,(CurrentBallsSelected)          ;0=basketball,1=tennisball,2=billiardball,3=baseball,4=soccerball,5=volleyball,6=bowlingball,7=golfball,8=beachball
  or    a
  jp    z,.BasketBall
  dec   a
  jp    z,.TennisBall
  dec   a
  jp    z,.BilliardBall
  dec   a
  jp    z,.BaseBall
  dec   a
  jp    z,.SoccerBall
  dec   a
  jp    z,.VolleyBall
  dec   a
  jp    z,.BowlingBall
  dec   a
  jp    z,.GolfBall
  dec   a
  jp    z,.BeachBall

  .BaseBall:
  ld    hl,BaseBallCourtPalette
  push  hl
  ld    hl,BaseballColorSprite
  push  hl
  ld    hl,BaseballCharSprite
  jp    .Go

  .BeachBall:
  ld    hl,BeachBallCourtPalette
  push  hl
  ld    hl,BeachballColorSprite
  push  hl
  ld    hl,BeachballCharSprite
  jp    .Go

  .GolfBall:
  ld    hl,GolfBallCourtPalette
  push  hl
  ld    hl,GolfballColorSprite
  push  hl
  ld    hl,GolfballCharSprite
  jp    .Go

  .BowlingBall:
  ld    hl,BowlingBallCourtPalette
  push  hl
  ld    hl,BowlingballColorSprite
  push  hl
  ld    hl,BowlingballCharSprite
  jp    .Go

  .VolleyBall:
  ld    hl,VolleyBallCourtPalette
  push  hl
  ld    hl,VolleyballColorSprite
  push  hl
  ld    hl,VolleyballCharSprite
  jp    .Go

  .SoccerBall:
  ld    hl,SoccerBallCourtPalette
  push  hl
  ld    hl,SoccerballColorSprite
  push  hl
  ld    hl,SoccerballCharSprite
  jp    .Go

  .BilliardBall:
  ld    hl,BilliardBallCourtPalette
  push  hl
  ld    hl,BilliardballColorSprite
  push  hl
  ld    hl,BilliardballCharSprite
  jp    .Go

  .BasketBall:
  ld    hl,BasketBallCourtPalette
  push  hl
  ld    hl,BasketballColorSprite
  push  hl
  ld    hl,BasketballCharSprite
  jp    .Go

  .TennisBall:
  ld    hl,TennisBallCourtPalette
  push  hl
  ld    hl,TennisballColorSprite
  push  hl
  ld    hl,TennisballCharSprite
  jp    .Go

  .Go:
  push  hl  
  ;set basketball/tennisball
	xor		a				;page 0/1
	ld		hl,sprcharaddr+16*32	;sprite 16 character table in VRAM
	call	SetVdp_Write

  pop   hl
	ld		c,$98
	call	outix64		;write sprite color of pointer and hand to vram

	xor		a				;page 0/1
	ld		hl,sprcoladdr+16*16	;sprite 0 color table in VRAM
	call	SetVdp_Write

  pop   hl
	ld		c,$98
	call	outix32	;write sprite color of pointer and hand to vram

  ;set palette
  pop   hl
  ld    de,ArcadeGamePalette
  ld    bc,32
  ldir
  ret

  BasketBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\BasketballPalette.sc5",$7680+7,32
  TennisBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\TennisballPalette.sc5",$7680+7,32
  BilliardBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\BilliardballPalette.sc5",$7680+7,32
  SoccerBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\SoccerballPalette.sc5",$7680+7,32
  VolleyBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\VolleyballPalette.sc5",$7680+7,32
  BowlingBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\BowlingballPalette.sc5",$7680+7,32
  GolfBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\GolfballPalette.sc5",$7680+7,32
  BeachBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\BeachballPalette.sc5",$7680+7,32
  BaseBallCourtPalette:
  incbin "..\grapx\BasketBall\sprites\BaseballPalette.sc5",$7680+7,32

NetSpriteYSpat:                     equ spat+0+12*4
NetSpriteXSpat:                     equ spat+1+12*4
NetSpriteOpenYSpat:                 equ spat+0+14*4
NetSpriteOpenXSpat:                 equ spat+1+14*4

BasketBallSpriteYSpat:              equ spat+0+16*4
BasketBallSpriteXSpat:              equ spat+1+16*4
ShadowCoverUpSpriteLeftYSpat:       equ spat+0+18*4
ShadowCoverUpSpriteLeftXSpat:       equ spat+1+18*4
ShadowCoverUpSpriteRightYSpat:      equ spat+0+20*4
ShadowCoverUpSpriteRightXSpat:      equ spat+1+20*4
ShadowSpriteYSpat:                  equ spat+0+22*4
ShadowSpriteXSpat:                  equ spat+1+22*4
CoinSpriteYSpat:                    equ spat+0+23*4
CoinSpriteXSpat:                    equ spat+1+23*4


	WallCoverUpsCharSprite:
	include "..\grapx\basketball\sprites\WallCoverUps.tgs.gen"
	NetCharSprite:
	include "..\grapx\basketball\sprites\net.tgs.gen"
	BasketballCharSprite:
	include "..\grapx\basketball\sprites\basketball.tgs.gen"
	WallCoverUpsCharSpriteForShadow:
	include "..\grapx\basketball\sprites\WallCoverUps.tgs.gen"
	ShadowCharSprite:
	include "..\grapx\basketball\sprites\Shadow.tgs.gen"
	CoinCharSprite:
	include "..\grapx\basketball\sprites\Coin.tgs.gen"

	WallCoverUpsColSprite:
	include "..\grapx\basketball\sprites\WallCoverUps.tcs.gen"
	NetColSprite:
	include "..\grapx\basketball\sprites\net.tcs.gen"
	BasketballColorSprite:	
	include "..\grapx\basketball\sprites\basketball.tcs.gen"
	WallCoverUpsColSpriteForShadow:
	include "..\grapx\basketball\sprites\WallCoverUps.tcs.gen"
	ShadowColorSprite:	
	include "..\grapx\basketball\sprites\Shadow.tcs.gen"
	CoinColSprite:
	include "..\grapx\basketball\sprites\Coin.tcs.gen"

	TennisballCharSprite:
	include "..\grapx\basketball\sprites\Tennisball.tgs.gen"
	TennisballColorSprite:	
	include "..\grapx\basketball\sprites\Tennisball.tcs.gen"

	BilliardballCharSprite:
	include "..\grapx\basketball\sprites\Billiardball.tgs.gen"
	BilliardballColorSprite:	
	include "..\grapx\basketball\sprites\Billiardball.tcs.gen"

	SoccerballCharSprite:
	include "..\grapx\basketball\sprites\Soccerball.tgs.gen"
	SoccerballColorSprite:	
	include "..\grapx\basketball\sprites\Soccerball.tcs.gen"

	VolleyballCharSprite:
	include "..\grapx\basketball\sprites\Volleyball.tgs.gen"
	VolleyballColorSprite:	
	include "..\grapx\basketball\sprites\Volleyball.tcs.gen"

	BowlingballCharSprite:
	include "..\grapx\basketball\sprites\Bowlingball.tgs.gen"
	BowlingballColorSprite:	
	include "..\grapx\basketball\sprites\Bowlingball.tcs.gen"

	GolfballCharSprite:
	include "..\grapx\basketball\sprites\Golfball.tgs.gen"
	GolfballColorSprite:	
	include "..\grapx\basketball\sprites\Golfball.tcs.gen"

	BeachballCharSprite:
	include "..\grapx\basketball\sprites\Beachball.tgs.gen"
	BeachballColorSprite:	
	include "..\grapx\basketball\sprites\Beachball.tcs.gen"

	BaseballCharSprite:
	include "..\grapx\basketball\sprites\Baseball.tgs.gen"
	BaseballColorSprite:	
	include "..\grapx\basketball\sprites\Baseball.tcs.gen"

HandleNet:
  call  .SetXYinSpat
  ret

  .SetXYinSpat:
  ld    a,(Object2+ObjectPhase)
  or    a                                   ;phase 0= do nothing left side of screen
  jr    z,.Left
  cp    2                                   ;wait
  jr    z,.LeftJustScored
  cp    5                                   ;phase 5= do nothing right side of screen
  jr    z,.Right
  cp    6                                   ;wait
  jr    z,.RightJustScored

  ld    a,213
  ld    (NetSpriteYSpat),a                 ;y sprite 0
  ld    (NetSpriteYSpat+4),a                 ;y sprite 1
  ld    (NetSpriteOpenYSpat),a                 ;x sprite 0
  ld    (NetSpriteOpenYSpat+4),a                 ;x sprite 1
  ret

  .RightJustScored:
  ld    a,(iy+y)                        ;y ball
  cp    215
  jr    nc,.Right

  ld    a,52
  ld    (NetSpriteOpenYSpat),a                 ;y sprite 0
  ld    (NetSpriteOpenYSpat+4),a                 ;y sprite 1
  ld    a,206
  ld    (NetSpriteOpenXSpat),a                 ;x sprite 0
  ld    (NetSpriteOpenXSpat+4),a                 ;x sprite 1

  ld    a,213
  ld    (NetSpriteYSpat),a                 ;y sprite 0
  ld    (NetSpriteYSpat+4),a                 ;y sprite 1
  ret

  .Right:
  ld    a,52
  ld    (NetSpriteYSpat),a                 ;y sprite 0
  ld    (NetSpriteYSpat+4),a                 ;y sprite 1
  ld    a,206
  ld    (NetSpriteXSpat),a                 ;x sprite 0
  ld    (NetSpriteXSpat+4),a                 ;x sprite 1

  ld    a,213
  ld    (NetSpriteOpenYSpat),a                 ;y sprite 0
  ld    (NetSpriteOpenYSpat+4),a                 ;y sprite 1
  ret

  .LeftJustScored:
  ld    a,(iy+y)                        ;y ball
  cp    215
  jr    nc,.Left

  ld    a,52
  ld    (NetSpriteOpenYSpat),a                 ;y sprite 0
  ld    (NetSpriteOpenYSpat+4),a                 ;y sprite 1
  ld    a,35
  ld    (NetSpriteOpenXSpat),a                 ;x sprite 0
  ld    (NetSpriteOpenXSpat+4),a                 ;x sprite 1

  ld    a,213
  ld    (NetSpriteYSpat),a                 ;y sprite 0
  ld    (NetSpriteYSpat+4),a                 ;y sprite 1
  ret

  .Left:
  ld    a,52
  ld    (NetSpriteYSpat),a                 ;y sprite 0
  ld    (NetSpriteYSpat+4),a                 ;y sprite 1
  ld    a,35
  ld    (NetSpriteXSpat),a                 ;x sprite 0
  ld    (NetSpriteXSpat+4),a                 ;x sprite 1

  ld    a,213
  ld    (NetSpriteOpenYSpat),a                 ;y sprite 0
  ld    (NetSpriteOpenYSpat+4),a                 ;y sprite 1
  ret

XDifferenceBaskets: equ 173
XDifferenceBackboards: equ 201
HandleBasketBall:
  call  .ApplyGravity
  call  .SetXYinSpat
  call  .MoveBallVertically
  call  .HandleTrigA
  call  .SetHorizontalSpeed
  call  .MoveBallHorizontally
  call  .CheckScore

  ld    a,(Object2+ObjectPhase)
  or    a                                   ;phase 0= do nothing left side of screen
  jr    z,.CheckBounceLeftRimAndBackboard
  cp    5                                   ;phase 5= do nothing right side of screen
  jr    z,.CheckBounceRightRimAndBackboard
  ret

  .CheckBounceRightRimAndBackboard:
  call  CheckBounceOnRightRimLeftSide
  call  CheckBounceOnRightBackboard
  call  CheckBounceOnRightRimRightSide
  ret

  .CheckBounceLeftRimAndBackboard:
  call  CheckBounceOnLeftRimLeftSide
  call  CheckBounceOnLeftBackboard
  call  CheckBounceOnLeftRimRightSide
  ret

  .CheckScore:

;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;;
;	ld		a,(NewPrContr)
;	bit		6,a           ;f1 pressed ?
;jp nz,.score
  

  ld    a,(Object2+ObjectPhase)
  or    a                                   ;phase 0= do nothing left side of screen
  jr    z,.CheckScoredLeftSide
  cp    5                                   ;phase 5= do nothing right side of screen
  jr    z,.CheckScoredRightSide
  ret

  .CheckScoredLeftSide:
  ld    a,(iy+x)
  cp    33 - 1
  ret   c
  cp    38 + 1
  ret   nc

  ld    a,(iy+y)
  cp    187
  ret   c
  cp    194 + 4
  ret   nc
  ld    a,2                                         ;wait (then phase 3:scroll basket out of screen on the left side)
	ld		(Object2+ObjectPhase),a											;start with object2
  ld    (iy+var2),0                       ;horizontal speed

  ld    (iy+x),36
  ld    a,1
  ld    (basketballFirstPointScored?),a
  ret

  .CheckScoredRightSide:
  ld    a,(iy+x)
  cp    33 + XDifferenceBaskets -1
  ret   c
  cp    38 + XDifferenceBaskets +1
  ret   nc

  ld    a,(iy+y)
  cp    187
  ret   c
  cp    194 + 4
  ret   nc

  ld    a,6                                         ;wait (then phase 7:scroll basket out of screen on the right side)
	ld		(Object2+ObjectPhase),a											;start with object2
  ld    (iy+var2),0                       ;horizontal speed

  ld    (iy+x),36 + XDifferenceBaskets - 3
  ld    a,1
  ld    (basketballFirstPointScored?),a
  ret








  .MoveBallHorizontally:
  ld    a,(iy+x)
  add   a,(iy+var2)                       ;horizontal speed
  ld    (iy+x),a
  ret

  .SetHorizontalSpeed:
  ld    a,(iy+y)
  cp    255
  ret   c

  ld    a,(Object2+ObjectPhase)
  or    a                                   ;phase 0= do nothing left side of screen
  ld    b,1                                ;if basket is on left side, our horizontal movement speed when using trigger A=-1
  jr    z,.BallDirectionFound
  cp    5                                   ;phase 5= do nothing right side of screen
  ld    b,-1
  jr    z,.BallDirectionFound
  ld    b,0
  .BallDirectionFound:

  ld    a,(iy+var2)                       ;horizontal speed
  cp    b
  jr    z,.SetHorizontalSpeedTo0

  ld    a,(iy+var1)                       ;vertical speed
  cp    2
  jr    c,.SetHorizontalSpeedTo0
  cp    256-1
  ret   c
  .SetHorizontalSpeedTo0:
  ld    (iy+var2),0                       ;horizontal speed
  ret

  .SetXYinSpat:
  ld    a,(iy+y)
  sub   144
  cp    216
  jr    nz,.EndCheck216
  ld    a,215
  .EndCheck216:
  ld    (BasketBallSpriteYSpat),a                 ;y sprite 0
  ld    (BasketBallSpriteYSpat+4),a                 ;y sprite 1
  ld    a,(iy+x)
  ld    (BasketBallSpriteXSpat),a                 ;x sprite 0
  ld    (BasketBallSpriteXSpat+4),a                 ;x sprite 1
  ret

  .HandleTrigA:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;space pressed ?
  ret   z

  ld    a,(Object2+ObjectPhase)
  cp    2
  ld    b,0
  jr    z,.SetHorizontalMovementSpeed
  ld    b,-1                                ;if basket is on left side, our horizontal movement speed when using trigger A=-1
  jr    c,.SetHorizontalMovementSpeed
  cp    6
  ld    b,0
  jr    z,.SetHorizontalMovementSpeed
  ld    b,+1
  jr    c,.SetHorizontalMovementSpeed
  ld    b,-1
  .SetHorizontalMovementSpeed:
  ld    (iy+var2),b                       ;horizontal speed

  ld    a,(iy+var1)                       ;vertical speed
  sub   a,1  
  ld    (iy+var1),a                       ;vertical speed
  jp    p,.Stillpositive
  cp    256-3
  ret   c
  ld    (iy+var1),-5                       ;vertical speed
  ret   
  .Stillpositive:
  ld    (iy+var1),-5                       ;vertical speed
  ret

  .MoveBallVertically:
  bit   7,(iy+var1)                       ;vertical speed
  jr    z,.MoveDown

  .MoveUp:
  ld    a,(iy+var1)                       ;vertical speed
  add   a,(iy+y)
  ld    (iy+y),a
  cp    103
  ret   nc
  ld    (iy+y),103
  ret

  .MoveDown:
  ld    a,(iy+var1)                       ;vertical speed
  add   a,(iy+y)
  ld    (iy+y),a
  ret   nc
  ld    (iy+y),255

  ld    a,(iy+var1)                       ;vertical speed
  dec   a
  ret   m
  neg
  ld    (iy+var1),a                       ;vertical speed
  ld    a,2
  ld    (framecounter2),a
  ret

  .ApplyGravity:
  ld    a,(framecounter2)
  and   3
  ret   nz

  ld    a,(iy+var1)                       ;vertical speed
  inc   a
  ld    (iy+var1),a                       ;vertical speed
  ret


CheckBounceOnRightRimLeftSide:
  ld    a,(iy+x)
  cp    33 + XDifferenceBaskets
  ret   nc
  cp    17 + XDifferenceBaskets
  ret   c
  ld    a,(iy+y)
  cp    180
  ret   c
  cp    200
  ret   nc

  ;at this point we have hit the rim, change horizontal and vertical speed
  call  .ChangeHorizontalSpeedRimHit2
  call  .ChangeVerticalSpeedRimHit2
  ret

  .ChangeHorizontalSpeedRimHit2:
  ;horizontally: check where we hit the rim
  ld    a,(iy+x)
  cp    33-5  + XDifferenceBaskets
  jr    nc,.MostRightPoint3
  cp    17+5  + XDifferenceBaskets
  jr    c,.MostLeftPoint3

  ld    a,(iy+var2)                      ;horizontal speed
  or    a
  ld    (iy+var2),0                      ;horizontal speed
  ret   nz
  ld    (iy+var2),1                     ;horizontal speed
  ret

  .MostLeftPoint3:
  ld    (iy+var2),-1                      ;horizontal speed
  ret

  .MostRightPoint3:
  ld    (iy+var2),1                       ;horizontal speed
  ret

  .ChangeVerticalSpeedRimHit2:
  ;vertically: check where we hit the rim
  ld    a,(iy+y)
  cp    200-5
  jr    nc,.LowestPoint3
  cp    180+5
  jr    c,.HighestPoint3
  ret

  .HighestPoint3:
  ld    a,(iy+var1)                       ;vertical speed
  dec   a
  ret   m
  neg
  ld    (iy+var1),a                       ;vertical speed
  ld    a,2
  ld    (framecounter2),a
  ret
  .LowestPoint3:
  ld    a,(iy+var1)                       ;vertical speed
  bit   7,a
  ret   z                                 ;if we hit the lowest part of the rim and our vertical speed is already positive, no need to take action
  neg
  dec   a
  ld    (iy+var1),a                       ;vertical speed
  ret





CheckBounceOnLeftRimLeftSide:
  ld    a,(iy+x)
  cp    33
  ret   nc
  cp    17
  ret   c
  ld    a,(iy+y)
  cp    180
  ret   c
  cp    200
  ret   nc

  ;at this point we have hit the rim, change horizontal and vertical speed
  call  .ChangeHorizontalSpeedRimHit2
  call  .ChangeVerticalSpeedRimHit2
  ret

  .ChangeHorizontalSpeedRimHit2:
  ;horizontally: check where we hit the rim
  ld    a,(iy+x)
  cp    33-5
  jr    nc,.MostRightPoint3
  cp    17+5
  jr    c,.MostLeftPoint3

  ld    a,(iy+var2)                      ;horizontal speed
  or    a
  ld    (iy+var2),0                      ;horizontal speed
  ret   nz
  ld    (iy+var2),1                     ;horizontal speed
  ret

  .MostLeftPoint3:
  ld    (iy+var2),-1                      ;horizontal speed
  ret

  .MostRightPoint3:
  ld    (iy+var2),1                       ;horizontal speed
  ret

  .ChangeVerticalSpeedRimHit2:
  ;vertically: check where we hit the rim
  ld    a,(iy+y)
  cp    200-5
  jr    nc,.LowestPoint3
  cp    180+5
  jr    c,.HighestPoint3
  ret

  .HighestPoint3:
  ld    a,(iy+var1)                       ;vertical speed
  dec   a
  ret   m
  neg
  ld    (iy+var1),a                       ;vertical speed
  ld    a,2
  ld    (framecounter2),a
  ret
  .LowestPoint3:
  ld    a,(iy+var1)                       ;vertical speed
  bit   7,a
  ret   z                                 ;if we hit the lowest part of the rim and our vertical speed is already positive, no need to take action
  neg
  dec   a
  ld    (iy+var1),a                       ;vertical speed
  ret









CheckBounceOnRightBackboard:
  ld    a,(iy+x)
  cp    27  + XDifferenceBackboards
  ret   nc
  cp    13  + XDifferenceBackboards
  ret   c
  ld    a,(iy+y)
  cp    159
  ret   c
  cp    205
  ret   nc  

  ;at this point we have hit the rim, change horizontal and vertical speed
  call  .ChangeHorizontalSpeedBackboardHit
  call  .ChangeVerticalSpeedBackboardHit
  ret

  .ChangeHorizontalSpeedBackboardHit:
  ;horizontally: check where we hit the rim
  ld    a,(iy+x)
  cp    27-5  + XDifferenceBackboards
  jr    nc,.MostRightPoint2
  cp    13+5  + XDifferenceBackboards
  jr    c,.MostLeftPoint2

  ld    a,(iy+var2)                      ;horizontal speed
  or    a
  ld    (iy+var2),0                      ;horizontal speed
  ret   nz
  ld    (iy+var2),-1                     ;horizontal speed
  ret

  .MostLeftPoint2:
  ld    (iy+var2),-1                      ;horizontal speed
  ret

  .MostRightPoint2:
  ld    (iy+var2),1                       ;horizontal speed
  ret

  .ChangeVerticalSpeedBackboardHit:
  ;vertically: check where we hit the rim
  ld    a,(iy+y)
  cp    205-5
  jr    nc,.LowestPoint2
  cp    159+5
  jr    c,.HighestPoint2
  ret

  .HighestPoint2:
  ld    a,(iy+var1)                       ;vertical speed
  dec   a
  ret   m
  neg
  ld    (iy+var1),a                       ;vertical speed
  ld    a,2
  ld    (framecounter2),a
  ret
  .LowestPoint2:
  ld    a,(iy+var1)                       ;vertical speed
  bit   7,a
  ret   z                                 ;if we hit the lowest part of the backboard and our vertical speed is already positive, no need to take action
  neg
  dec   a
  ld    (iy+var1),a                       ;vertical speed
  ret




CheckBounceOnLeftBackboard:
  ld    a,(iy+x)
  cp    27
  ret   nc
  cp    13
  ret   c
  ld    a,(iy+y)
  cp    159
  ret   c
  cp    205
  ret   nc  

  ;at this point we have hit the rim, change horizontal and vertical speed
  call  .ChangeHorizontalSpeedBackboardHit
  call  .ChangeVerticalSpeedBackboardHit
  ret

  .ChangeHorizontalSpeedBackboardHit:
  ;horizontally: check where we hit the rim
  ld    a,(iy+x)
  cp    27-5
  jr    nc,.MostRightPoint2
  cp    13+5
  jr    c,.MostLeftPoint2

  ld    a,(iy+var2)                      ;horizontal speed
  or    a
  ld    (iy+var2),0                      ;horizontal speed
  ret   nz
  ld    (iy+var2),1                     ;horizontal speed
  ret

  .MostLeftPoint2:
  ld    (iy+var2),-1                      ;horizontal speed
  ret

  .MostRightPoint2:
  ld    (iy+var2),1                       ;horizontal speed
  ret

  .ChangeVerticalSpeedBackboardHit:
  ;vertically: check where we hit the rim
  ld    a,(iy+y)
  cp    205-5
  jr    nc,.LowestPoint2
  cp    159+5
  jr    c,.HighestPoint2
  ret

  .HighestPoint2:
  ld    a,(iy+var1)                       ;vertical speed
  dec   a
  ret   m
  neg
  ld    (iy+var1),a                       ;vertical speed
  ld    a,2
  ld    (framecounter2),a
  ret
  .LowestPoint2:
  ld    a,(iy+var1)                       ;vertical speed
  bit   7,a
  ret   z                                 ;if we hit the lowest part of the backboard and our vertical speed is already positive, no need to take action
  neg
  dec   a
  ld    (iy+var1),a                       ;vertical speed
  ret














CheckBounceOnRightRimRightSide:
  ld    a,(iy+x)
  cp    53  + XDifferenceBaskets
  ret   nc
  cp    38  + XDifferenceBaskets
  ret   c
  ld    a,(iy+y)
  cp    180
  ret   c
  cp    200
  ret   nc

  ;at this point we have hit the rim, change horizontal and vertical speed
  call  .ChangeHorizontalSpeedRimHit
  call  .ChangeVerticalSpeedRimHit
  ret

  .ChangeHorizontalSpeedRimHit:
  ;horizontally: check where we hit the rim
  ld    a,(iy+x)
  cp    53-5  + XDifferenceBaskets
  jr    nc,.MostRightPoint
  cp    38+5  + XDifferenceBaskets
  jr    c,.MostLeftPoint

  ld    a,(iy+var2)                      ;horizontal speed
  or    a
  ld    (iy+var2),0                      ;horizontal speed
  ret   nz
  ld    (iy+var2),-1                     ;horizontal speed
  ret

  .MostLeftPoint:
  ld    (iy+var2),-1                      ;horizontal speed
  ret

  .MostRightPoint:
  ld    (iy+var2),1                       ;horizontal speed
  ret

  .ChangeVerticalSpeedRimHit:
  ;vertically: check where we hit the rim
  ld    a,(iy+y)
  cp    200-5
  jr    nc,.LowestPoint
  cp    180+5
  jr    c,.HighestPoint
  ret

  .HighestPoint:
  ld    a,(iy+var1)                       ;vertical speed
  dec   a
  ret   m
  neg
  ld    (iy+var1),a                       ;vertical speed
  ld    a,2
  ld    (framecounter2),a
  ret
  .LowestPoint:
  ld    a,(iy+var1)                       ;vertical speed
  bit   7,a
  ret   z                                 ;if we hit the lowest part of the rim and our vertical speed is already positive, no need to take action
  neg
  dec   a
  ld    (iy+var1),a                       ;vertical speed
  ret


CheckBounceOnLeftRimRightSide:
  ld    a,(iy+x)
  cp    53
  ret   nc
  cp    38
  ret   c
  ld    a,(iy+y)
  cp    180
  ret   c
  cp    200
  ret   nc

  ;at this point we have hit the rim, change horizontal and vertical speed
  call  .ChangeHorizontalSpeedRimHit
  call  .ChangeVerticalSpeedRimHit
  ret

  .ChangeHorizontalSpeedRimHit:
  ;horizontally: check where we hit the rim
  ld    a,(iy+x)
  cp    53-5
  jr    nc,.MostRightPoint
  cp    38+5
  jr    c,.MostLeftPoint

  ld    a,(iy+var2)                      ;horizontal speed
  or    a
  ld    (iy+var2),0                      ;horizontal speed
  ret   nz
  ld    (iy+var2),-1                     ;horizontal speed
  ret

  .MostLeftPoint:
  ld    (iy+var2),-1                      ;horizontal speed
  ret

  .MostRightPoint:
  ld    (iy+var2),1                       ;horizontal speed
  ret

  .ChangeVerticalSpeedRimHit:
  ;vertically: check where we hit the rim
  ld    a,(iy+y)
  cp    200-5
  jr    nc,.LowestPoint
  cp    180+5
  jr    c,.HighestPoint
  ret

  .HighestPoint:
  ld    a,(iy+var1)                       ;vertical speed
  dec   a
  ret   m
  neg
  ld    (iy+var1),a                       ;vertical speed
  ld    a,2
  ld    (framecounter2),a
  ret
  .LowestPoint:
  ld    a,(iy+var1)                       ;vertical speed
  bit   7,a
  ret   z                                 ;if we hit the lowest part of the rim and our vertical speed is already positive, no need to take action
  neg
  dec   a
  ld    (iy+var1),a                       ;vertical speed
  ret



SetInterruptHandlerArcadeMachine:
  di
  ld    hl,InterruptHandlerArcadeMachine
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

  ld    a,LineIntHeightArcadeMachine
  out   ($99),a
  ld    a,19+128                        ;set lineinterrupt height
  ei
  out   ($99),a 
  ret

SetArcadeMachine:
  ld    hl,ArcadeMachinePart1Address
  ld    a,ArcadeMachineGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (135*128) + (000/2) - 128
  ld    bc,$0000 + (077*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY
  ret


PenguinBikeRaceGameRoutine:
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a

  ld    hl,PenguinBikeRacePalette
  call	SetPalette

  call  CheckEndArcadeGameTriggerB

  call  .HandlePhase                        ;load graphics, init variables
  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ld    hl,PenguinBikeRacePart1Address
  ld    a,PenguinBikeRaceGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (128*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,PenguinBikeRacePart2Address
  ld    a,PenguinBikeRaceGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  call  SetArcadeMachine
  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ret

PenguinBikeRacePalette:
  incbin "..\grapx\penguinbikerace\PenguinBikeRace.sc5",$7680+7,32

BlockHitGameRoutine:
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a

  ld    hl,BlockhitPalette
  call	SetPalette

  call  CheckEndArcadeGameTriggerB

  call  .HandlePhase                        ;load graphics, init variables
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

  call  SetArcadeMachine
  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ret

BlockhitPalette:
  incbin "..\grapx\Blockhit\Blockhit.sc5",$7680+7,32

JumpDownGameRoutine:
  ld    a,1
  ld    (framecounter),a                    ;we force framecounter to 1 so that the sf2 object handler doesn't swap page ever
  ld    a,0*32 + 31                         ;force page 0
	ld    (PageOnNextVblank),a

  ld    hl,JumpDownPalette
  call	SetPalette

  call  CheckEndArcadeGameTriggerB

  call  .HandlePhase                        ;load graphics, init variables
  ret

  .HandlePhase:
  bit   0,(iy+ObjectPhase)
  ret   nz
  ld    (iy+ObjectPhase),1

  ld    hl,JumpDownPart1Address
  ld    a,JumpDownGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (000*128) + (000/2) - 128
  ld    bc,$0000 + (128*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  ld    hl,JumpDownPart2Address
  ld    a,JumpDownGfxBlock
  call  SetGfxAt8000InRam                             ;in: hl=adress in rom page 1, a=block, out: puts gfx in page 2 in ram at $8000

  ld    hl,$8000 + (000*128) + (000/2) - 128
  ld    de,$0000 + (128*128) + (000/2) - 128
  ld    bc,$0000 + (007*256) + (256/2)
  call  CopyRamToVram                       ;in: hl->sx,sy, de->dx, dy, bc->NXAndNY

  call  SetArcadeMachine
  call  SetInterruptHandlerArcadeMachine   	;sets Vblank and lineint for hud
  ret

JumpDownPalette:
  incbin "..\grapx\JumpDown\JumpDown.sc5",$7680+7,32

CheckEndArcadeGameTriggerB:
;
; bit	7	  6	  5		    4		    3		    2		  1		  0
;		  0	  0	  trig-b	trig-a	right	  left	down	up	(joystick)
;		  F5	F1	'M'		  space	  right	  left	down	up	(keyboard)
;
	ld		a,(NewPrContr)
	bit		4,a           ;space pressed ?
;  jr    nz,.end
	bit		5,a           ;trig b pressed ?
  ret   z

  .end:
  ld    a,0                                ;back to arcade hall 1
  ld    (CurrentRoom),a
  ld    a,1
  ld    (ChangeRoom?),a
  ret

dephase
