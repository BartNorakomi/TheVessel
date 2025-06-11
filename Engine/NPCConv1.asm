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
  db    SwitchCharacter,CharacterPortraitHost,"Congratulations. Not many manage to crack the 80% mark. You've been noticed."
  db    SwitchCharacter,CharacterPortraitVessel,"Uh... noticed by who exactly?"
  db    SwitchCharacter,CharacterPortraitHost,"Let's just say we've got eyes on talent. And you? You're showing potential for something... classified."
  db    SwitchCharacter,CharacterPortraitVessel,"Wait-what kind of 'classified'?"
  db    SwitchCharacter,CharacterPortraitHost,"One more test. Behind that door. Beat it, and we'll talk next steps. Government clearance might be in your future. Follow me!",255

NPCConv008:
  db    SwitchCharacter,CharacterPortraitHost,"So... you made it past the floorboards and flashing lights. Impressive. Few even realize this place exists."
  db    SwitchCharacter,CharacterPortraitVessel,"Who are you? What is this place?"
  db    SwitchCharacter,CharacterPortraitHost,"Just someone who's been watching. Waiting. This is the backroom. The game behind the games. The one that doesn't hand out tickets or high scores-just truth."
  db    SwitchCharacter,CharacterPortraitVessel,"What kind of game are we talking about?"
  db    SwitchCharacter,CharacterPortraitHost,"Not a game. A final test. The others were warm-ups-reflexes, pattern reading, persistence. This one digs deeper. It's designed to push your focus, memory, and control under stress. Each run is all or nothing. No continues. But you're free to try again-and again-until the pattern reveals itself. Here's the interface; simply reach out and take control."
  db    SwitchCharacter,CharacterPortraitVessel,"But... I don't see any controls."
  db    SwitchCharacter,CharacterPortraitHost,"This game doesn't need controls. You'll guide it with your thoughts alone."
  db    SwitchCharacter,CharacterPortraitVessel,"Control it... with my mind? How is that even possible?"
  db    SwitchCharacter,CharacterPortraitHost,"Some things aren't meant to be explained. Just... see for yourself.",255

NPCConv009:
  db    SwitchCharacter,CharacterPortraitHost,"Step up. If you're ready, the final game is waiting.",255


  db    SwitchCharacter,CharacterPortraitSoldier,"Oh, you know, been tangled up in life's cogs and wheels!"


