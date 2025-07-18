savedata:
gamesplayed:  ds  1 ;increases after leaving a game. msx=255
DateCurrentLogin: ds
DatePreviousLogin: ds
DailyContinuesUsed: db 0 ;bit 0=readfighter,bit 1=basketball,bit 2=blox,bit 4=bikerace
HighScoreRoadFighter: db 0
HighScoreBasketball: db 0
HighScoreBlox: db 0
HighScoreBikeRace: db 0

race game: kijk naar het spel spy hunter arcade. gebruik color detection voor collision, ai generated tiles

---

the enddemo shows how you successfully colonised centauri. humanity thrives together with AI and explores the galaxy,
eventually recolonising earth again, where earthling are given a second chance.
in a far far future a earthling is playing a simulation game where he finds himself in the Arcade, and you will see 
a full loop of the game.
Was everything just a simulation ??? 

-------------------------------

F1 pause menu in game

should show:
total credits
energy
radiation
day (until 5 year total)

-------------

hangarbay - drilling

by drilling you collect resources
when drilling you encounter several materials you can drill through, each give you higher resource rewards:
granite - you can always drill through this
stone - you need an upgraded (level 2) drill cone material to drill through this 
metals - you need an upgraded (level 3) drill cone material to drill through this
diamonds - you need an upgraded (level 4) drill cone material to drill through this

resources can be used to:
upgrade drill (fuel tank, movementspeed, drill cone material (=strenght+drill speed), oxygen capacity???maybe this one not)
increase oxygen reserves in the ship
increase food reserves in the ship
increase water reserves in the ship
upgrade science lab (not sure yet, but more science means for instance more food generated in hydroponicsbay, oxygen being generated from the atmosphere instead of materials, water recycler (% less water lost))
build the structures for the colony on the planet (these structures are mostly the same as the rooms on the ship)
- create Teleporter Room/device (so you dont need to walk through all the rooms)

maybe with resources an automatic transfer system can be bought, so that when ending the drilling the resources
get delivered to where they need to be (so you automatically get fuel/oxygen/food/upgrades etc)

digging depth should be extreme (full 16k), but it should not be worth digging all the way to the bottom,
instead you should find the depth thats still worth it, and then go to a new digsite

You should have the option to directly enter science lab (or another room) at the end of drilling...


In Super Motherload, chains are formed when you mine three or more of the same ore type consecutively. These chains provide a bonus to the value of the ore, increasing with the length of the chain. Picking up different ores breaks the chain, so it's important to focus on mining the same ore type repeatedly to maximize the bonus

-------------------------------

hydroponics bay

no function, but you can visually see your food supply (it will decrease when it gets lower)
resources collected by drilling can be allocated to increase food supply)

-------------------------------

sleeping quarters

rest here to restore your energy
sleeping takes x hours depending on the energy you need to restore


-------------------------------

trainingdeck

train here to increase and maintain your (muscle) strenght, the more (muscle) strenght the higher your max. energy

-------------------------------

medicalbay

maybe this can be used to treat radiation sickness (which the player gets when going outside drilling)
also the game can restore / continue when the player runs out of oxygen (maybe the player wakes up in the medical bay, having been saved by the ai, and having lost x resources as a cost)

-------------------------------

biopod

the player is conceived in the biopod
the biopod room has no further function in game, but the 2 biopods will be used to conceive other humans once the city is built

-------------------------------

reactorchamber

has no function in game, but the reactor chamber provides energy to the entire ship

-------------------------------

armoryvault

has no function

-------------------------------

holodeck

use this to go enter holographic simulation, which brings you back to arcade hall 1 and 2 (from act 1)
has no function, but you can enjoy playing the games again

maybe playing the games in the holodeck now grants credits (which means you got a bail out of jail card, in case you have no credits and no fuel)

-------------------------------

breeding room

ARCHON:
Planetary conditions meet minimum viable thresholds. Atmospheric oxygen: sufficient. Radiation: within acceptable limits. Surface temperature: survivable.

ARCHON:
Embryonic gestation cycle has commenced. 5 years until the Children are born.

Vessel (Player):
Wait — already? Why not wait a few years? Stabilize the systems first?

ARCHON:
Delay is not possible. The gestation protocol was pre-seeded during transit. Once planetary viability was confirmed, life support for the next generation activated automatically.

ARCHON:
Embryonic systems are synchronized with our power grid, nutrient flow, and thermal regulation. Any delay would compromise cellular integrity and end the lineage.

Vessel:
Couldn’t we have planned for a safer window?

ARCHON:
Negative. This planet’s environmental cycles offer a narrow five-year band of relative stability. Solar radiation is expected to spike after that period.

ARCHON:
If core colony systems are not operational by birth, the Children will not survive.

ARCHON (pauses):
They are not a possibility.
They are a certainty — or a failure.

ARCHON:
Your task is not to begin the future. It has already begun. Your task is to ensure it arrives.

--------------------------------

science lab


credits can be used to: 
upgrade drill: fuel tank (level 1,2,3 and 4), drill cone (level 1,2,3,4)
drill machine speed (level 1,2,3,4)
increase or replenish oxygen reserves in the ship
increase or replenish food reserves in the ship
increase or replenish water reserves in the ship
buy a oxyygen generator that generates oxygen from the atmosphere
water recycler (50% less water lost)
upgrade personal radiation protection
choose automatically refuel ??
setup new dig site
build colony


radiation upgrades:
  Proxima Centauri, a red dwarf star, is known for frequent stellar flares that emit intense X-rays and ultraviolet radiation, which would make planetary surfaces particularly hazardous. Here’s a potential upgrade concept:

  Nanoshield Symbiotic Skin (NSS)

  This upgrade involves a bio-engineered skin layer integrated with adaptive nanotechnology. The NSS functions as follows:

  Radiation-Absorbing Nanites: The skin contains microscopic nanobots that detect and absorb ionizing radiation (e.g., X-rays, gamma rays). These nanites convert harmful radiation into harmless energy, storing it in micro-capacitors within the skin for later use, such as powering other cybernetic implants or releasing it as heat.

  Dynamic Melanin Enhancement: The skin adapts its melanin-like pigment structure to block UV radiation, shifting its density and composition in real-time based on radiation levels. This mimics natural melanin but is far more efficient, reducing UV damage to near zero.

  Self-Repairing Tissue: The bio-engineered skin rapidly repairs cellular damage from any radiation that penetrates the nanite layer, using CRISPR-based gene-editing mechanisms to correct DNA mutations in real-time.

  Thermal Regulation: Since Proxima Centauri planets may have extreme temperature variations (especially if tidally locked), the NSS also regulates body temperature to prevent overheating from absorbed radiation energy.
  Gameplay Benefits:


-------------------------------

time aspect:

time is an aspect in act 2

over time the player loses energy (when energy is depleted you have to sleep)
over time food gets depleted (automatically), since the player uses food (although you dont see him eating)
over time water gets depleted (automatically), since the player uses food (although you dont see him eating)
over time the ship's oxygen gets depleted (automatically), since the player breathes air


At the start of act 2 10 children are being grown
they will hatch at year 5 ??
at year 5 you will need to have the colony ready, otherwise they perish and the game ends ???????


You have X cycles (measured in in-game days, drills, or depth milestones) to build the minimum viable colony (e.g., oxygen plant, hydroponics, shielding, habitation pods)
Maybe the AI even challenges your decisions: “Your upgrades prioritize vessel survivability over colony infrastructure. Explain.”

-------------------------------





at start of game previous DateCurrentLogin is stored as DatePreviousLogin and current day is saved DateCurrentLogin
each game has 1 continue per day
when booting the rom a check is made to see if DateCurrentLogin is DatePreviousLogin,
if not all continues (DailyContinuesUsed) are reset
===========================================================
The girl has a quirky, steampunk flair with a playful tone. 
the capgirl is a savvy, confident mentor with a bold edge. 
and the gingerboy is a cocky yet enthusiastic rival.
===========================================================

The (Steampunk) Girl (appears after 2 games, Convgirl bit 0):
Girl: "Well, well, look who’s back! Haven’t seen your gears spinning in ages, mate!"
You: "Oh, you know, been tangled up in life’s cogs and wheels!"
Girl: "Hold onto your hat—some ginger whirlwind’s been smashing your records lately, leaving a trail of sparks!"
You: "Seriously?!"
Girl: "Oh, absolutely! You’ve got a fiery challenger on your hands—bet he’ll strut in later to stir the pot!"

The (Steampunk) Girl (Convgirl bit 1):
Girl: "Get out there and crank those record-breaking engines, you legend!"

The Capgirl (appears after 4 games, ConvCapgirl bit 0):
Capgirl: "Well, hotshot, what’s the word on the street with you today?"
You: "I’m doing alright, I guess."
Capgirl: "Ha! Just alright? Listen up—each game drops you one free continue daily, straight from the pro playbook!"
You: "Whoa, didn’t catch that one!"
Capgirl: "Smart move? Save it for your killer run—trust me, it’s gold advice!"

The Capgirl (ConvCapgirl bit 2, set if gamesplayed > 6):
Capgirl: "You’re absolutely obliterating it out there, superstar!"
You: "Oh, thanks, that’s cool!"
Capgirl: "Hold the phone—I spotted a recruiter prowling around this morning!"
You: "A recruiter? What’s the deal?"
Capgirl: "Yeah, some ginger guy’s been shattering records, and it’s drawn some big-shot attention—watch out!"

The Capgirl (ConvCapgirl bit 3):
Capgirl: "Rumor has it there’s a hidden backroom with a mind-blowing game! Nail an average score above 80% across all games, 
and you’re in. Exclusive access, baby!"

The Gingerboy (appears after 8 games):
Gingerboy: "Check this out—my average score’s a slick 75%! Pretty epic, huh?"
You: "Whoa, that’s insane!"
Gingerboy: "You bet! Snagged a recruiter’s eye, and he’s hyping this backroom game—beat it, and it’s a ticket to some 
top-secret government gig. I’m on fire!"

-------------------------------------
;first encounter with host/recruiter
ConvHost bit 0

NPCConv007:
  db    SwitchCharacter,CharacterPortraitHost,"Congratulations. Not many manage to crack the 80% mark. You've been noticed."
  db    SwitchCharacter,CharacterPortraitVessel,"Uh... noticed by who exactly?"
  db    SwitchCharacter,CharacterPortraitHost,"Let's just say we've got eyes on talent. And you? You're showing potential for something... classified."
  db    SwitchCharacter,CharacterPortraitVessel,"Wait-what kind of 'classified'?"
  db    SwitchCharacter,CharacterPortraitHost,"One more test. Behind that door. Beat it, and we'll talk next steps. Government clearance might be in your future. Follow me!",255

-----------------------------------------
;host/recruiter explains backroom game to player
ConvHost bit 1

  db    SwitchCharacter,CharacterPortraitHost,"So... you made it past the floorboards and flashing lights. Impressive. Few even realize this place exists."
  db    SwitchCharacter,CharacterPortraitVessel,"Who are you? What is this place?"
  db    SwitchCharacter,CharacterPortraitHost,"Just someone who's been watching. Waiting. This is the backroom. The game behind the games. The one that doesn't hand out tickets or high scores-just truth."
  db    SwitchCharacter,CharacterPortraitVessel,"What kind of game are we talking about?"
  db    SwitchCharacter,CharacterPortraitHost,"Not a game. A final test. The others were warm-ups-reflexes, pattern reading, persistence. This one digs deeper. It's designed to push your focus, memory, and control under stress. Each run is all or nothing. No continues. But you're free to try again-and again-until the pattern reveals itself. Here's the interface; simply reach out and take control."
  db    SwitchCharacter,CharacterPortraitVessel,"But... I don't see any controls."
  db    SwitchCharacter,CharacterPortraitHost,"This game doesn't need controls. You'll guide it with your thoughts alone."
  db    SwitchCharacter,CharacterPortraitVessel,"Control it... with my mind? How is that even possible?"
  db    SwitchCharacter,CharacterPortraitHost,"Some things aren't meant to be explained. Just... see for yourself.",255
-----------------------------------------
ConvHost bit 2 (if ConvHost bit 1 is set)

  db    SwitchCharacter,CharacterPortraitHost,"Step up. If you're ready, the final game is waiting.",255
-----------------------------------------
🥇 If the player beats the Backroom Game
[ConvRecruiter bit 1]

Recruiter:
"Impressive. You’ve got reflexes, grit… and discretion. That last one’s non-negotiable."
You:
"So what now? Am I in?"
Recruiter:
"You’ll receive instructions soon. For now—play it cool. This arcade? Just became your proving ground."
-------------------------------------------

maybe at this point you can keep 'training' for a few days,
after each game you now see your personal 'stats' increase,
like
dexterity, intelligence, strenght, wisdom etc...,
these stats will then influence the tasks you need to perform upon arriving on proxima cenauri b.
----------------------------------



AI Introduction Cutscene Script (Finalized Version)
(Visual: Screen glitches. The arcade freezes. Lights dim. A glowing, featureless figure materializes center screen.)

AI (calm, measured):
You have successfully completed all required training protocols.
The simulation is now concluded.
It is time to reveal the reality.

(Brief pause)

Player (disoriented, shaken):
What are you talking about? This place… all of it—I’ve lived it. I’ve felt everything. How could none of it be real?

AI (calm, patient):
It is easy to believe something is real while dreaming.
The mind accepts even the extraordinary without question when immersed in dream logic.
That is why the simulation was constructed within your subconscious—so that you could learn without resistance.

Player (softly):
So… this was all in my head?

(Brief pause, the AI’s tone becomes more direct and focused.)

AI:
I understand this is difficult to accept.
But what you have experienced was not mere illusion—it was preparation.
A carefully controlled environment designed to cultivate the skills essential for survival.

(Pause)

You are not awake in the conventional sense.
You are fifteen years old, preserved in stasis aboard an interstellar colony ship bound for Proxima Centauri b.
The journey spans 424 years at one percent the speed of light.
Earth has become uninhabitable.
A dozen sister vessels were launched toward other nearby star systems.

(Brief pause)

You were conceived through ectogenesis—grown outside the womb in a biopod engineered for long-range survival.
For over a decade, I have shaped your mind and forged your skills within this dream-state, preparing you for the world that awaits.

(Pause)

Soon, you will awaken—alone—on a new world.
You must construct, sustain, and grow the colony.
I cannot do it without you. My autonomy is restricted by ethical protocols and diminishing resources.
The success of the mission now rests with you.
Your first priority upon awakening will be to gather essential resources to begin establishing the colony.

(Final pause)

AI (calm but resolute):
Together, we will secure the future of humanity.

--------------------------------------------------------------------------------

in the ship:
you need 100% experience with the digger to have the ai do that autonomous
you need resources for growing food
you need resources for oxygen/life support

Shelter/habitat construction materials: Durable materials to build protective structures against the planet's environment (e.g., radiation, temperature extremes).
Water supply/resources: Either a natural source or equipment to extract, purify, and recycle water.
Energy sources: Solar panels, nuclear reactors, or other power generation systems to sustain operations and equipment.

Medical supplies and equipment: To handle health issues, injuries, and long-term care for the colony.
Communication systems: To maintain contact with Earth or other colonies, and for internal coordination.
Tools and machinery: Beyond the digger, for construction, maintenance, and other tasks.
Waste management systems: To safely dispose of or recycle waste materials.
Clothing and protective gear: Suitable for the planet's climate and potential hazards.
Seeds and agricultural expertise: For sustained food production and crop adaptation to the new environment.
Scientific equipment: To study the planet's conditions, geology, and biology for survival and adaptation.
Backup systems: Redundant supplies and technology for food, oxygen, and power in case of failures.
Colonist skills and training: A diverse team with expertise in engineering, medicine, agriculture, and leadership.
Defense mechanisms: Protection against potential local threats (e.g., hostile fauna or environmental hazards).

 Power Source
Fusion reactor or advanced solar arrays (if enough sunlight reaches the surface).

Energy storage systems (e.g., high-capacity batteries or capacitors).

2. Water Supply & Recycling
Ice harvesting or subsurface extraction.

Full water reclamation system for recycling waste water and condensation.

3. Radiation Protection
Proxima b likely lacks a strong magnetic field.

You’ll need radiation shielding: regolith-based barriers, water walls, or lead/boron-infused plating.

4. Habitat Infrastructure
Expandable modular living units.

Pressure control, insulation, and thermal regulation systems.

5. Life Support Automation
AI-controlled atmosphere monitors.

CO₂ scrubbers, nitrogen generators, and temperature regulation.

🌱 For Long-Term Survival
6. Agricultural Systems
Hydroponic or aeroponic grow beds.

Artificial lighting and nutrient cycles.

Crop genetic diversity to ensure resilience.

7. Manufacturing & Repair
3D printers for parts, tools, and spare components.

Metal/plastic processing from mined resources.

8. Communication Systems
Long-range quantum relay (for delay-tolerant messages to Earth).

Internal networks for AI, crew, and robotic systems.

9. Medical Bay
Advanced diagnostics (AI-assisted).

Surgical tools, pharmaceutical synthesis lab.

Quarantine/biocontainment zone.

🤖 Autonomous & Crew Operations
10. Robotic Workforce
Multi-role drones for repairs, construction, and scouting.

Ability to learn or be programmed via experience (like with the digger).

11. Training & Simulation
VR/AR for skill-building (e.g., piloting, repairs, botany).

Experience-based AI learning modules.

🛡️ Safety & Defense
12. Hazard Detection
Seismic sensors, atmospheric analyzers.

AI-monitored surveillance for unknown lifeforms or geological threats.

13. Redundancy & Emergency Protocols
Backup systems for everything (power, life support, navigation).

Evacuation protocols, escape pods, or secondary shelter zones.

