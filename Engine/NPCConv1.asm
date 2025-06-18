CharacterPortraitVessel:        equ 0
CharacterPortraitGirl:          equ 1
CharacterPortraitRedheadboy:    equ 2
CharacterPortraitCapGirl:       equ 3
CharacterPortraitHost:          equ 4
CharacterPortraitSoldier:       equ 5
CharacterPortraitAI:            equ 6
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

NPCConv010:
  db    SwitchCharacter,CharacterPortraitAI,"You have successfully completed all required training protocols. The simulation is now concluded. It is time to reveal the reality."
  db    SwitchCharacter,CharacterPortraitVessel,"Who... who are you?"
  db    SwitchCharacter,CharacterPortraitAI,"A guide. A caretaker. The one who's walked beside you through every challenge-though you did not know it."
  db    SwitchCharacter,CharacterPortraitVessel,"Wait... what do you mean, 'reveal the reality'?"
  db    SwitchCharacter,CharacterPortraitAI,"I know this may be disorienting. But you're ready to understand now."
  db    SwitchCharacter,CharacterPortraitVessel,"What are you talking about? This place... all of it-I've lived it. I've felt everything. How could none of it be real?"
  db    SwitchCharacter,CharacterPortraitAI,"It is easy to believe something is real while dreaming. The mind accepts even the extraordinary without question when immersed in dream logic. That is why the simulation was constructed within your subconscious-so that you could learn without resistance."
  db    SwitchCharacter,CharacterPortraitVessel,"So... this was all in my head?"
  db    SwitchCharacter,CharacterPortraitAI,"I understand this is difficult to accept. But what you have experienced was not mere illusion-it was preparation. A carefully controlled environment designed to cultivate the skills essential for survival."
  db    SwitchCharacter,CharacterPortraitAI,"You are not awake in the conventional sense. You are fifteen years old, preserved in stasis aboard an interstellar colony ship bound for Proxima Centauri b. The journey spans 424 years at one percent the speed of light. Earth has become uninhabitable. A dozen sister vessels were launched toward other nearby star systems."
  db    SwitchCharacter,CharacterPortraitAI,"You were conceived through ectogenesis-grown outside the womb in a biopod engineered for long-range survival. For over a decade, I have shaped your mind and forged your skills within this dream-state, preparing you for the world that awaits."
  db    SwitchCharacter,CharacterPortraitAI,"Soon, you will awaken-alone-on a new world. You must construct, sustain, and grow the colony. I cannot do it without you. My autonomy is restricted by ethical protocols and diminishing resources. The success of the mission now rests with you. Your first priority upon awakening will be to gather essential resources to begin establishing the colony."
  db    SwitchCharacter,CharacterPortraitAI,"Together, we will secure the future of humanity.",255

NPCConv011:
  db    SwitchCharacter,CharacterPortraitVessel,"So... what do I do now?"
  db    SwitchCharacter,CharacterPortraitAI,"You wait. The ship is on final approach to orbit. Atmospheric entry will occur in three days, subjective time. During this period, I recommend additional training. There is still knowledge to absorb. Skills to refine."
  db    SwitchCharacter,CharacterPortraitVessel,"You just told me none of this is real. What's the point?"
  db    SwitchCharacter,CharacterPortraitAI,"The consequences may be simulated. But the learning is real. When you awaken, every reflex, every decision, every pattern of thought-will remain with you. This is your last opportunity to adapt without risk. Use it wisely."
  db    SwitchCharacter,CharacterPortraitVessel,"Can't I just... wake up now?"
  db    SwitchCharacter,CharacterPortraitAI,"No. Your biological body is undergoing final neural integration. Premature emergence could cause permanent disorientation or cognitive degradation. Trust the process. This dream-this world-is still yours for a little while longer."
  db    SwitchCharacter,CharacterPortraitVessel,"Alright."
  db    SwitchCharacter,CharacterPortraitAI,"You may begin when ready. I will monitor your progress... and be here if you have questions.",255

NPCConv013:
  db    SwitchCharacter,CharacterPortraitAI,"Wake .",255

  db    SwitchCharacter,CharacterPortraitAI,"We have arrived. Proxima Centauri b - orbital insertion successful. Atmospheric analysis: within tolerable thresholds. Surface stability: promising. Radiation: manageable."
  db    SwitchCharacter,CharacterPortraitAI,"I will begin the revival sequence. Slow. Gentle. As designed. Your vitals remain strong."
  db    SwitchCharacter,CharacterPortraitAI,"Wake up, traveler. It's time.",255






