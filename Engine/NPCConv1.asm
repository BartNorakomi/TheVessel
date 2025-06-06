CharacterPortraitVessel:        equ 0
CharacterPortraitGirl:          equ 1
CharacterPortraitRedheadboy:    equ 2
CharacterPortraitCapGirl:       equ 3
CharacterPortraitHost:          equ 4
CharacterPortraitSoldier:       equ 5
SwitchCharacter:  equ 254
EndConversation:  equ 255
NPCConv1:
  db    SwitchCharacter,CharacterPortraitSoldier,"Yoo"
  db    SwitchCharacter,CharacterPortraitHost,"Yoo"
  db    SwitchCharacter,CharacterPortraitCapGirl,"Yoo"
  db    SwitchCharacter,CharacterPortraitRedheadboy,"Yoo"
  db    SwitchCharacter,CharacterPortraitGirl,"Well, well, look who's back! Haven't seen your gears spinning in ages, mate!"
  db    SwitchCharacter,CharacterPortraitVessel,"Oh, you know, been tangled up in life's cogs and wheels!"
  db    SwitchCharacter,CharacterPortraitGirl,"Hold onto your hat. Some ginger whirlwind's been smashing your records lately, leaving a trail of sparks!"
  db    SwitchCharacter,CharacterPortraitVessel,"Seriously?!"
  db    SwitchCharacter,CharacterPortraitGirl,"Oh, absolutely! You've got a fiery challenger on your hands. Bet he'll strut in later to stir the pot!",255