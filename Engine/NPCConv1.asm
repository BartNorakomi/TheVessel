CharacterPortraitVessel:        equ 0
CharacterPortraitGirl:          equ 1
CharacterPortraitRedheadboy:    equ 2
CharacterPortraitCapGirl:       equ 3
CharacterPortraitHost:          equ 4
CharacterPortraitSoldier:       equ 5
CharacterPortraitAI:            equ 6
CharacterPortraitResourceOffload:  equ 7
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
  db    SwitchCharacter,CharacterPortraitAI,"We have arrived. Proxima Centauri b - orbital insertion successful. Atmospheric analysis: within tolerable thresholds. Surface stability: promising. Radiation: manageable."
  db    SwitchCharacter,CharacterPortraitAI,"I will begin the revival sequence. Slow. Gentle. As designed. Your vitals remain strong."
  db    SwitchCharacter,CharacterPortraitAI,"Wake up, traveler. It's time.",255

NPCConv014:
  db    SwitchCharacter,CharacterPortraitAI,"Welcome to your new world, traveler. This vessel is now your home. The seed of something greater. A beginning. You are the first colonist of Proxima Centauri b. Your task: awaken the future. Shape the colony. Make it endure."
  db    SwitchCharacter,CharacterPortraitVessel,"A new beginning... Okay. What's first?"
  db    SwitchCharacter,CharacterPortraitAI,"Begin by exploring the ship. Familiarize yourself with its systems, quarters, and decks. I am integrated into every corridor, every console. I will speak through the intercom - always watching, always listening. When you need guidance, ask. When you're lost, I will find you."
  db    SwitchCharacter,CharacterPortraitVessel,"Okay. That's... reassuring, I think.",255

NPCConv015: ;hydroponics bay
  db    SwitchCharacter,CharacterPortraitAI,"This is the Hydroponics Bay, where we grow the colony's food supply in controlled conditions."
  db    SwitchCharacter,CharacterPortraitAI,"Plants are cultivated using nutrient-rich water systems, ensuring steady production regardless of external climate."
  db    SwitchCharacter,CharacterPortraitAI,"Maintaining this bay is critical. A failure here could threaten the entire colony's sustenance."
  db    SwitchCharacter,CharacterPortraitVessel,"So, this is basically the colony's garden, sheltered from the planet's extremes."
  db    SwitchCharacter,CharacterPortraitAI,"Precisely. Healthy crops mean a healthy colony.",255

NPCConv016: ;hangar bay
  db    SwitchCharacter,CharacterPortraitAI,"This is the Hangar Bay. Here you'll find the drilling machine essential for extracting resources from Proxima Centauri b's surface."
  db    SwitchCharacter,CharacterPortraitAI,"Board the drill and navigate the planet's terrain to collect materials needed for upgrades and colony construction."
  db    SwitchCharacter,CharacterPortraitAI,"The drilling machine protects you from hazardous conditions outside, but resources vary in difficulty to extract-better equipment means deeper and richer finds."
  db    SwitchCharacter,CharacterPortraitVessel,"So, this is where the real digging begins."
  db    SwitchCharacter,CharacterPortraitAI,"Exactly. Master the drill to unlock the future of the colony.",255

NPCConv017: ;training deck
  db    SwitchCharacter,CharacterPortraitAI,"This is the Training Deck. After fifteen years in stasis, your body is weak and unprepared for Proxima Centauri b's gravity, which is 30% stronger than Earth's."
  db    SwitchCharacter,CharacterPortraitAI,"Here, you will rebuild your strength, stamina, and endurance-vital for survival and extended operations outside the ship."
  db    SwitchCharacter,CharacterPortraitAI,"Physical conditioning reduces fatigue and increases your time on the surface, allowing you to perform your tasks more efficiently."
  db    SwitchCharacter,CharacterPortraitVessel,"Sounds tough, but necessary."
  db    SwitchCharacter,CharacterPortraitAI,"It is. There is no shortcut. I will monitor your progress and guide you, but the effort is yours."
  db    SwitchCharacter,CharacterPortraitVessel,"No yelling, I hope."
  db    SwitchCharacter,CharacterPortraitAI,"Only observation. And silent support.",255

NPCConv018: ;reactor chamber
  db    SwitchCharacter,CharacterPortraitVessel,"This place feels like the ship's beating heart."
  db    SwitchCharacter,CharacterPortraitAI,"It is. The reactor powers everything-life support, fabrication, propulsion, defense."
  db    SwitchCharacter,CharacterPortraitAI,"A fusion core held stable by magnetic confinement. Extremely efficient, but volatile if mishandled."
  db    SwitchCharacter,CharacterPortraitVessel,"So, one wrong move and it's game over?"
  db    SwitchCharacter,CharacterPortraitAI,"Essentially. Your access is limited to consoles and maintenance drones. The core itself remains sealed unless emergency repairs are necessary."
  db    SwitchCharacter,CharacterPortraitVessel,"Glad I won't have to wear a hazmat suit in there."
  db    SwitchCharacter,CharacterPortraitAI,"Caution is constant. But so is trust-in the systems and in you.",255

NPCConv019: ;sleeping quarters
  db    SwitchCharacter,CharacterPortraitVessel,"Looks like this is where I sleep, huh?"
  db    SwitchCharacter,CharacterPortraitAI,"Correct. These quarters are equipped with an adjustable stasis-grade sleep pod. Designed for efficiency, not comfort-but it serves its purpose."
  db    SwitchCharacter,CharacterPortraitAI,"Sleep restores your energy reserves and accelerates cellular repair. Without it, fatigue compounds, and performance degrades rapidly."
  db    SwitchCharacter,CharacterPortraitVessel,"So... collapse here when I feel like a dead battery?"
  db    SwitchCharacter,CharacterPortraitAI,"Precisely. Sleep is not a weakness-it is maintenance. Deny it, and you sabotage your own endurance."
  db    SwitchCharacter,CharacterPortraitVessel,"I'll keep that in mind. Not much use to the colony if I pass out mid-shift."
  db    SwitchCharacter,CharacterPortraitAI,"A functioning colonist is a rested colonist.",255

NPCConv020: ;armory vault
  db    SwitchCharacter,CharacterPortraitVessel,"Okay... this place looks serious. What's all this gear for?"
  db    SwitchCharacter,CharacterPortraitAI,"This is the Armory Vault. A secure repository of tactical equipment protective suits, energy tools, and modular weapon systems."
  db    SwitchCharacter,CharacterPortraitAI,"While the colony's goal is peace and survival, unpredictability remains a constant. Terrain hazards, structural failures... or threats we have not yet classified."
  db    SwitchCharacter,CharacterPortraitVessel,"You're saying I might have to fight?"
  db    SwitchCharacter,CharacterPortraitAI,"I am saying you must be prepared. The vault's contents are restricted and unlocked based on need. Some tools are for survival. Others... for defense."
  db    SwitchCharacter,CharacterPortraitVessel,"And here I thought this would be a farming mission."
  db    SwitchCharacter,CharacterPortraitAI,"Farming, mining, surviving. Each requires its own kind of weaponry.",255

NPCConv021: ;holo deck
  db    SwitchCharacter,CharacterPortraitVessel,"This place looks... different. Like a game room?"
  db    SwitchCharacter,CharacterPortraitAI,"Correct. This is the Holodeck-a simulation environment designed for training and recreation."
  db    SwitchCharacter,CharacterPortraitAI,"Here, you can revisit the arcade games from the start of your journey. Playing them again grants additional experience and sharpens your reflexes."
  db    SwitchCharacter,CharacterPortraitVessel,"So, it's like a virtual playground and a skill gym all in one."
  db    SwitchCharacter,CharacterPortraitAI,"Exactly. Use it to refine your abilities without risk. The colony depends on your growth, both mental and physical."
  db    SwitchCharacter,CharacterPortraitVessel,"Sounds like a nice break from drilling and repairs."
  db    SwitchCharacter,CharacterPortraitAI,"Balance is key. Even in isolation, play fuels progress.",255

NPCConv022: ;medical bay
  db    SwitchCharacter,CharacterPortraitVessel,"This place looks sterile... and a little intimidating."
  db    SwitchCharacter,CharacterPortraitAI,"This is the Medical Bay. Designed to diagnose and treat a range of conditions, including radiation exposure."
  db    SwitchCharacter,CharacterPortraitAI,"When you leave the ship to drill on Proxima Centauri b's surface, radiation levels rise unpredictably. Prolonged exposure without treatment risks sickness or worse."
  db    SwitchCharacter,CharacterPortraitVessel,"So this is my safe zone when things go sideways outside?"
  db    SwitchCharacter,CharacterPortraitAI,"Correct. The Medbay stabilizes your condition, administers antidotes, and monitors your recovery."
  db    SwitchCharacter,CharacterPortraitVessel,"Good to know there's a backup plan if the planet decides to cook me."
  db    SwitchCharacter,CharacterPortraitAI,"Precaution is survival's best ally.",255

NPCConv023: ;science lab
  db    SwitchCharacter,CharacterPortraitVessel,"This is the Science Lab. Looks like where the real upgrades happen."
  db    SwitchCharacter,CharacterPortraitAI,"Correct. Resources gathered during drilling missions are brought here for analysis and synthesis."
  db    SwitchCharacter,CharacterPortraitAI,"You'll encounter various materials underground. Granite is common-always drillable. Stone requires a level 2 drill cone upgrade. Metals need level 3, and diamonds demand level 4."
  db    SwitchCharacter,CharacterPortraitVessel,"So the better my drill, the deeper and richer the haul."
  db    SwitchCharacter,CharacterPortraitAI,"Exactly. Resources are allocated to multiple critical systems-drill speed, drill cone strength, oxygen capacity, and ship reserves for oxygen, food, and water."
  db    SwitchCharacter,CharacterPortraitAI,"Upgrading the Science Lab itself boosts overall efficiency, increasing food production in the Hydroponics Bay and accelerating research."
  db    SwitchCharacter,CharacterPortraitVessel,"And eventually, I can build out the colony on the planet, using these materials?"
  db    SwitchCharacter,CharacterPortraitAI,"Yes. Colony structures mirror ship facilities replicating vital systems for a sustainable settlement."
  db    SwitchCharacter,CharacterPortraitVessel,"Looks like the key to survival is drilling, upgrading, and building."
  db    SwitchCharacter,CharacterPortraitAI,"Survival is progress. Progress is survival.",255

NPCConv024: ;first time drilling
  db    SwitchCharacter,CharacterPortraitSoldier,"Drill systems online. First descent protocol active. This is your first real step toward securing the colony's future."
  db    SwitchCharacter,CharacterPortraitSoldier,"You'll start close to the surface. It's stable, manageable-perfect for getting used to the drill."
  db    SwitchCharacter,CharacterPortraitSoldier,"The deeper you go, the tougher it gets. You'll hit harder layers and more resistance-but the rewards will be worth it."
  db    SwitchCharacter,CharacterPortraitSoldier,"Your current gear can only get you so far. To push deeper, you'll need to upgrade your equipment."
  db    SwitchCharacter,CharacterPortraitVessel,"So I can't just dig straight down without upgrading first?"
  db    SwitchCharacter,CharacterPortraitSoldier,"Correct. Gather resources, upgrade your gear in the science lab and come back stronger."
  db    SwitchCharacter,CharacterPortraitSoldier,"Monitor your fuel reserves closely. If you deplete them entirely, you will be stranded underground. This is not a simulation. Additionally, return to the surface before exhausting your energy supply. Fatigue compromises judgment and survival."
  db    SwitchCharacter,CharacterPortraitSoldier,"One final note: outside the ship, you are no longer shielded from radiation exposure. Daily visits to the medical bay are mandatory to manage contamination levels."
  db    SwitchCharacter,CharacterPortraitSoldier,"Dig smart. Prioritize what matters. And above all, come home safe."
  db    SwitchCharacter,CharacterPortraitVessel,"Understood. In, out, no unnecessary risks."
  db    SwitchCharacter,CharacterPortraitSoldier,"Good. Bring back enough, and we'll turn this barren world into a thriving colony.",255

NPCConv025: ;low fuel warning - urgent return
  db    SwitchCharacter,CharacterPortraitSoldier,"Warning: Fuel reserves critically low. Drill operation cannot continue."
  db    SwitchCharacter,CharacterPortraitSoldier,"You must abort mining and ascend immediately. Remaining underground is a fatal risk."
  db    SwitchCharacter,CharacterPortraitVessel,"Copy that. Beginning ascent now."
  db    SwitchCharacter,CharacterPortraitSoldier,"Good. When you reach the surface, refuel and recover. The colony depends on you.",255

NPCConv026: ;low fuel warning - short
  db    SwitchCharacter,CharacterPortraitSoldier,"Fuel critical. Abort mission and return now."
  db    SwitchCharacter,CharacterPortraitVessel,"Copy. Ascending.",255

NPCConv027: ;low energy warning - urgent return
  db    SwitchCharacter,CharacterPortraitSoldier,"Body scans indicate your energy levels are critically low. Risk of fatigue or loss of consciousness is high."
  db    SwitchCharacter,CharacterPortraitSoldier,"You must abort the drilling operation and ascend immediately to prevent collapse."
  db    SwitchCharacter,CharacterPortraitVessel,"Understood. Initiating ascent now."
  db    SwitchCharacter,CharacterPortraitSoldier,"Remember: no extraction is worth risking your life. Return alive, return strong. Once on the surface, proceed directly to your sleeping quarters to rest and fully restore your energy.",255
  db    SwitchCharacter,CharacterPortraitVessel,"Copy that.",255

NPCConv028: ;low energy warning - short
  db    SwitchCharacter,CharacterPortraitSoldier,"Energy levels critical. You need to return immediately."
  db    SwitchCharacter,CharacterPortraitSoldier,"Rest in your quarters as soon as you're topside."
  db    SwitchCharacter,CharacterPortraitVessel,"Understood. Heading up.",255

NPCConv029: ;high radiation warning - urgent return (encouraging tone)
  db    SwitchCharacter,CharacterPortraitSoldier,"Warning: Your radiation levels are dangerously high. This isn't something to ignore."
  db    SwitchCharacter,CharacterPortraitSoldier,"You need to stop drilling and get back to the surface right now. Your health comes first."
  db    SwitchCharacter,CharacterPortraitVessel,"Understood. Heading back now."
  db    SwitchCharacter,CharacterPortraitSoldier,"No mission is worth risking your life. Upon reaching the surface, report to the medical bay immediately for decontamination and care."
  db    SwitchCharacter,CharacterPortraitVessel,"Got it. I'll go to the med bay as soon as I'm back."
  db    SwitchCharacter,CharacterPortraitSoldier,"Good. Stay strong-we need you healthy for what's ahead.",255

NPCConv030: ;storage full - return to surface
  db    SwitchCharacter,CharacterPortraitSoldier,"Storage at maximum capacity. We can't hold any more resources right now."
  db    SwitchCharacter,CharacterPortraitSoldier,"You've done an amazing job down there-time to head back to the surface."
  db    SwitchCharacter,CharacterPortraitSoldier,"Any additional resources you drill now will be lost. The drill will pulverize them and leave the dust behind-no way to retrieve it later."
  db    SwitchCharacter,CharacterPortraitVessel,"Understood. Returning with the haul."
  db    SwitchCharacter,CharacterPortraitSoldier,"Bring those resources home safely. The colony depends on what you've gathered."
  db    SwitchCharacter,CharacterPortraitSoldier,"Rest up when you get back. We'll gear up and plan the next dive soon.",255

NPCConv031: ;storage full - short
  db    SwitchCharacter,CharacterPortraitSoldier,"Storage full. We can't carry any more. Extra resources will be crushed and lost for good.",255

NPCConv032: ;drill can't break material
  db    SwitchCharacter,CharacterPortraitSoldier,"Hold it. That material's too dense for your current drill. You'll need an upgrade before you can cut through it.",255

NPCConv033: ;lava encountered
  db    SwitchCharacter,CharacterPortraitSoldier,"Caution-magma flow detected. Temperature exceeds structural limits of all known drill alloys. Passage is impossible. Reroute your path immediately.",255

NPCConv034: ;out of fuel
  db    SwitchCharacter,CharacterPortraitSoldier,"OUT OF FUEL. MISSION FAILED. GAME OVER!",255

NPCConv035: ;out of energy
  db    SwitchCharacter,CharacterPortraitSoldier,"OUT OF ENERGY. MISSION FAILED. GAME OVER!",255

NPCConv036: ;radiation full
  db    SwitchCharacter,CharacterPortraitSoldier,"DEATH BY RADIATION. MISSION FAILED. GAME OVER!",255

NPCConv037: ;resource offload
  db    SwitchCharacter,CharacterPortraitAI,"Resource extraction complete. Initializing cargo offload sequence..."
  db    SwitchCharacter,CharacterPortraitAI,"Scanning inventory... "
  db    SwitchCharacter,CharacterPortraitAI,"Processing materials... "
  db    SwitchCharacter,CharacterPortraitAI,"Calculating market valuation... "
  db    SwitchCharacter,CharacterPortraitAI,"Offload Summary:"
  db    SwitchCharacter,CharacterPortraitAI,"Coal x 128 units - (2 Cr/unit) = 256 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Ironium x 94 units - 5 Cr/unit - 470 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Bronzium x 61 units - 8 Cr/unit - 488 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Silverium x 37 units - 12 Cr/unit - 444 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Goldium x 22 units - 18 Cr/unit - 396 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Emerald x 9 units - 30 Cr/unit - 270 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Diamond x 3 units - 50 Cr/unit - 150 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Total Value: 2,474 Credits"
  db    SwitchCharacter,CharacterPortraitAI,"Resource containment pods depressurized. Materials transferred to storage silos."
  db    SwitchCharacter,CharacterPortraitAI,"Market-ready and logged for trade routing.",255

NPCConv038: ;resource offload
  db    SwitchCharacter,CharacterPortraitResourceOffload," ",255

NPCConv039: ;sleeping quarters >50% energy
  db    SwitchCharacter,CharacterPortraitVessel,"Alright... time to grab some sleep."
  db    SwitchCharacter,CharacterPortraitAI,"Sleep request denied. Current energy reserves are above 50%."
  db    SwitchCharacter,CharacterPortraitAI,"While rest is essential, it is not yet necessary. You remain within peak operational thresholds."
  db    SwitchCharacter,CharacterPortraitVessel,"I was hoping for a short reset. Just to clear my head."
  db    SwitchCharacter,CharacterPortraitAI,"Understood. But with colony systems still below sustainability benchmarks, resource allocation favors active deployment. Recommendation: return to mission-critical tasks - mining, training, or structural expansion."
  db    SwitchCharacter,CharacterPortraitVessel,"So rest is off the table for now?"
  db    SwitchCharacter,CharacterPortraitAI,"Correct. You will be notified when rest becomes mission-appropriate."
  db    SwitchCharacter,CharacterPortraitAI,"Maintain focus. The colony's success depends on continued forward momentum."
  db    SwitchCharacter,CharacterPortraitVessel,"Acknowledged. Returning to duty.",255

NPCConv040: ;breeding room  
  db    SwitchCharacter,CharacterPortraitAI,"Planetary conditions meet minimum viable thresholds. Atmospheric oxygen: sufficient. Radiation: within acceptable limits. Surface temperature: survivable."
  db    SwitchCharacter,CharacterPortraitAI,"Embryonic gestation cycle has commenced. Five years until the Children are born."
  db    SwitchCharacter,CharacterPortraitVessel,"Wait-already? Why not wait a few years? Stabilize the systems first?"
  db    SwitchCharacter,CharacterPortraitAI,"Delay is not possible. The gestation protocol was pre-seeded during transit. Once planetary viability was confirmed, life support for the next generation activated automatically."
  db    SwitchCharacter,CharacterPortraitAI,"Embryonic systems are now integrated with the colony's core: power grid, nutrient flow, and thermal regulation. Any interruption would compromise cellular integrity."
  db    SwitchCharacter,CharacterPortraitVessel,"Couldn't we have planned for a safer window?"
  db    SwitchCharacter,CharacterPortraitAI,"Negative. This planet's environmental cycles provide a narrow five-year band of relative stability. Afterward: solar radiation escalation, temperature spikes, and atmospheric volatility."
  db    SwitchCharacter,CharacterPortraitAI,"If core systems are not operational by the time of birth, the Children will not survive."
  db    SwitchCharacter,CharacterPortraitAI,"They are not a possibility. They are a certainty-or a failure."
  db    SwitchCharacter,CharacterPortraitAI,"Your task is not to begin the future. It has already begun. Your task is to ensure it arrives.",255

NPCConv043: ;first time inside holodeck simulation  
  db    SwitchCharacter,CharacterPortraitVessel,"Wow, this place looks exactly like it did in my dreams."  
  db    SwitchCharacter,CharacterPortraitAI,"Your memory engrams were highly detailed. The simulation rendered them with 97.4% accuracy."  
  db    SwitchCharacter,CharacterPortraitVessel,"Even the hum of the machines feels right. I used to lose hours in here."  
  db    SwitchCharacter,CharacterPortraitAI,"Time spent here is not lost. Familiar spaces promote cognitive resilience and motor recalibration."  
  db    SwitchCharacter,CharacterPortraitVessel,"Right. Mental tune-up through muscle memory."  
  db    SwitchCharacter,CharacterPortraitAI,"Proceed when ready. Exiting the boundaries will return you to the present."  
  db    SwitchCharacter,CharacterPortraitVessel,"Just for a moment... I think I'll stay lost.",255  

