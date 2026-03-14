= 0 C.E. - Heroes
<0-ce---heroes>
#link("../nav/Home.typ") | #link("Roadmap.typ")[Previous] | Next

== 22. Heroes System #emph[(Wave 2)]
<22-heroes-system-wave-2>
=== 21.1 Design Philosophy
<211-design-philosophy>
Heroes are named historical figures --- real people from each
civilization\'s history --- who can be recruited to lead armies or
govern cities. They are not superweapons. A Hero\'s value lies in the
cumulative advantages they accumulate over time and the narrative weight
of their presence. Losing a Hero to a bad campaign is costly but not
fatal --- they recover, but the recovery window is a genuine
vulnerability.

Heroes must not trivialize combat for experienced players. Their bonuses
are meaningful but never decisive on their own --- a Hero leading a
poorly composed army still loses to a well-composed army without one.

=== 21.2 Hero Types --- Fixed at Selection
<212-hero-types--fixed-at-selection>
Each Hero is permanently either a #strong[Military Commander] or a
#strong[City Governor];. The type is determined by the historical
figure, not player choice. A player selects a Hero knowing what type
they are getting.

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Type], [Assigned To], [Bonus Domain],),
    table.hline(),
    [#strong[Military Commander];], [An army --- marches with it, fights
    in every battle], [Combat effectiveness, army speed, formation
    bonuses],
    [#strong[City Governor];], [A city --- stationed permanently until
    reassigned], [Production, construction, Favor generation, Cultural
    Points],
  )]
  , kind: table
  )

Reassigning a Hero from one army/city to another takes 12 real-time
hours (travel). During transit the Hero provides no bonus.

=== 21.3 Hero Slots --- One Per City
<213-hero-slots--one-per-city>
Each player city supports exactly #strong[one Hero slot];:

- A city without a Hero assigned has an empty slot
- A Hero assigned to an army is considered assigned to that army\'s home
  city
- #strong[Expansionists] naturally field more Heroes --- more cities,
  more slots
- #strong[Mega-base builders] field fewer Heroes but can invest heavily
  in leveling those few

Hero slots cannot be increased by technology or any other means. The
city count is the hard limit.

=== 21.4 Acquiring Heroes
<214-acquiring-heroes>
Heroes are chosen from a #strong[civ-specific roster of named historical
figures];. Each civilization has a fixed roster of recruitable Heroes. A
player may only recruit a Hero that hasn\'t already been recruited in
that world (first-come, first-served --- rivals can take figures you
wanted).

Heroes are recruited at the #strong[Academy] (or civilization
equivalent) building for a gold + time cost. Higher-level Academy
buildings unlock access to more prestigious figures on the roster.

#strong[Hero rosters by civilization:]

#strong[Greece] --- Military Commanders: Themistocles, Alcibiades,
Epaminondas, Pyrrhus. City Governors: Pericles, Solon, Lycurgus,
Aspasia.

#strong[Sumer] --- Military Commanders: Sargon of Akkad, Lugalbanda,
Ur-Nammu. City Governors: Gudea, Shulgi, En-hedu-ana.

#strong[Egypt] --- Military Commanders: Thutmose III, Ramesses II,
Ahmose I. City Governors: Imhotep, Hatshepsut, Amenhotep III.

#strong[Rome] --- Military Commanders: Scipio Africanus, Gaius Marius,
Lucius Sulla. City Governors: Cicero, Cato the Elder, Agrippa.

#strong[Maya] --- Military Commanders: Spearthrower Owl, Yax Nuun Ahiin,
K\'inich Janaab\' Pakal. City Governors: Lady Xoc, Itzamnaaj B\'alam II,
Yax K\'uk\' Mo\'.

Each figure has a brief historical flavor text on their recruitment
card. The roster is data-file defined and expandable in future patches.

=== 21.5 Hero Progression --- Linear XP
<215-hero-progression--linear-xp>
Heroes gain XP from:

- #strong[Military Commanders];: Each battle the army participates in
  (win or lose), scaling with casualties inflicted
- #strong[City Governors];: Construction completions, cultural event
  completions, and city tier upgrades

XP thresholds unlock abilities linearly --- no branching skill tree.
Each Hero has 4 abilities unlocked at levels 1, 3, 6, and 10. The
abilities are #strong[fixed per Hero] --- Themistocles always unlocks
the same four abilities, in the same order. Players choosing a Hero know
exactly what they\'re investing in.

#strong[Level cap];: 10. A level 10 Hero is a significant long-term
investment.

#strong[XP is lost on wounding] --- Heroes reset to 50% of their current
level\'s XP threshold on recovery. This makes protecting a high-level
Hero a real tactical priority.

=== 21.6 When a Hero Is Defeated
<216-when-a-hero-is-defeated>
Heroes are never killed permanently. When a Military Commander\'s army
loses a battle, the Hero is #strong[Wounded];:

- Removed from the army immediately
- Returns to their home city automatically (instant --- no march)
- Enters a #strong[Recovery Period];: duration scales with Hero level
  (Level 1 = 12h, Level 10 = 72h)
- During recovery: provides no bonus, cannot be reassigned, cannot be
  moved
- After recovery: fully available again, XP slightly reduced (see §21.5)

City Governors cannot be wounded --- they have no combat exposure. They
can only be lost if their city is captured, in which case they defect to
the capturing player (they stay with the city, not the player).
Recapturing your city returns your Governor.

=== 21.7 Ability Examples by Type
<217-ability-examples-by-type>
#strong[Military Commander abilities] (illustrative --- final values
tuned in playtesting):

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Level], [Ability Type], [Example Effect],),
    table.hline(),
    [1], [Passive], [Army speed +10% while this Hero commands],
    [3], [Passive], [Formation bonus of chosen formation +5%
    additional],
    [6], [Active (1/battle)], [First combat round: all units deal +20%
    damage],
    [10], [Passive], [Army suffers 20% fewer casualties in battle],
  )]
  , kind: table
  )

#strong[City Governor abilities] (illustrative):

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Level], [Ability Type], [Example Effect],),
    table.hline(),
    [1], [Passive], [Construction speed in this city +10%],
    [3], [Passive], [Favor generation in this city +15%],
    [6], [Active (1/day)], [Instantly complete lowest-tier building in
    queue],
    [10], [Passive], [Cultural event costs in this city −20%],
  )]
  , kind: table
  )

Specific Hero figures have abilities themed to their historical role ---
Pericles (Governor) boosts cultural output; Themistocles (Commander)
specializes in naval bonuses; Imhotep (Governor) amplifies construction.

=== 21.8 Hero Data Schema
<218-hero-data-schema>
```toml
# config/heroes/greece/themistocles.toml
[hero]
id        = "themistocles"
civilization       = "greece"
type      = "military_commander"
name      = "Themistocles"
flavor    = "Architect of Athenian sea power. Defeated Persia at Salamis through cunning and preparation."
academy_tier_required = 2

[[ability]]
level   = 1
type    = "passive"
effects = [{ target = "army_speed", modifier = 0.15 }]

[[ability]]
level   = 3
type    = "passive"
effects = [{ target = "naval_unit_damage", modifier = 0.20 }]

[[ability]]
level   = 6
type    = "active"
uses_per_battle = 1
effects = [{ target = "first_round_damage", modifier = 0.25, scope = "naval_only" }]

[[ability]]
level   = 10
type    = "passive"
effects = [{ target = "morale_immunity", value = true, scope = "naval_armies" }]
```

#emph[This document supersedes v0.1.0 in full. All decisions herein are
canonical until superseded by a numbered revision. Breaking design
changes require a GDD version bump and a changelog entry describing what
changed and why.]

#emph[Maintained by the 0 C.E. development team.]
