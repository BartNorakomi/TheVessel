CharacterPortraitVessel:        equ 0
CharacterPortraitGirl:          equ 1
CharacterPortraitRedheadboy:    equ 2
CharacterPortraitCapGirl:       equ 3
CharacterPortraitHost:          equ 4
CharacterPortraitSoldier:       equ 5
SwitchCharacter:  equ 254
EndConversation:  equ 255
NPCConv001:
  db    SwitchCharacter,CharacterPortraitGirl,"Well, well, look who's back! Haven't seen your gears spinning in ages, mate!"
  db    SwitchCharacter,CharacterPortraitVessel,"Oh, you know, been tangled up in life's cogs and wheels!"
  db    SwitchCharacter,CharacterPortraitGirl,"Hold onto your hat. Some ginger whirlwind's been smashing your records lately, leaving a trail of sparks!"
  db    SwitchCharacter,CharacterPortraitVessel,"Seriously?!"
  db    SwitchCharacter,CharacterPortraitGirl,"Oh, absolutely! You've got a fiery challenger on your hands. Bet he'll strut in later to stir the pot!",255

NPCConv002:
  db    SwitchCharacter,CharacterPortraitGirl,"Get out there and crank those record-breaking engines, you legend!",255

NPCConv003:
  db    SwitchCharacter,CharacterPortraitCapGirl,"Well, hotshot, what's the word on the street with you today?"
  db    SwitchCharacter,CharacterPortraitVessel,"I'm doing alright, I guess."
  db    SwitchCharacter,CharacterPortraitCapGirl,"Ha! Just alright? Listen up. Each game drops you one free continue daily, straight from the pro playbook!"
  db    SwitchCharacter,CharacterPortraitVessel,"Whoa, didn't catch that one!"
  db    SwitchCharacter,CharacterPortraitCapGirl,"Smart move? Save it for your killer run. Trust me, it's gold advice!",255

NPCConv004:
  db    SwitchCharacter,CharacterPortraitCapGirl,"You're absolutely obliterating it out there, superstar!"
  db    SwitchCharacter,CharacterPortraitVessel,"Oh, thanks, that's cool!"
  db    SwitchCharacter,CharacterPortraitCapGirl,"Hold the phone-I spotted a recruiter prowling around this morning!"
  db    SwitchCharacter,CharacterPortraitVessel,"A recruiter? What's the deal?"
  db    SwitchCharacter,CharacterPortraitCapGirl,"Yeah, some ginger guy's been shattering records, and it's drawn some big-shot attention. Watch out!",255

NPCConv005:
  db    SwitchCharacter,CharacterPortraitCapGirl,"Rumor has it there's a hidden backroom with a mind-blowing game! Nail an average score above 80% across all games, and you're in. Exclusive access, baby!",255

NPCConv006:
  db    SwitchCharacter,CharacterPortraitRedheadboy,"Check this out-my average score's a slick 75%! Pretty epic, huh?"
  db    SwitchCharacter,CharacterPortraitVessel,"Whoa, that's insane!"
  db    SwitchCharacter,CharacterPortraitRedheadboy,"You bet! Snagged a recruiter's eye, and he's hyping this backroom game-beat it, and it's a ticket to some top-secret government gig. I'm on fire!",255

NPCConv007:
  db    SwitchCharacter,CharacterPortraitHost,"Yoo",255

  db    SwitchCharacter,CharacterPortraitSoldier,"Oh, you know, been tangled up in life's cogs and wheels!"
  db    SwitchCharacter,CharacterPortraitVessel,"Oh, you know, been tangled up in life's cogs and wheels!"
  db    SwitchCharacter,CharacterPortraitVessel,"Oh, you know, been tangled up in life's cogs and wheels!"
  db    SwitchCharacter,CharacterPortraitSoldier,"Yoo"
  db    SwitchCharacter,CharacterPortraitCapGirl,"Yoo"
  db    SwitchCharacter,CharacterPortraitRedheadboy,"Yoo"
  db    SwitchCharacter,CharacterPortraitGirl,"Well, well, look who's back! Haven't seen your gears spinning in ages, mate!"
  db    SwitchCharacter,CharacterPortraitVessel,"Oh, you know, been tangled up in life's cogs and wheels!"
  db    SwitchCharacter,CharacterPortraitGirl,"Hold onto your hat. Some ginger whirlwind's been smashing your records lately, leaving a trail of sparks!"
  db    SwitchCharacter,CharacterPortraitVessel,"Seriously?!"
  db    SwitchCharacter,CharacterPortraitGirl,"Oh, absolutely! You've got a fiery challenger on your hands. Bet he'll strut in later to stir the pot!",255