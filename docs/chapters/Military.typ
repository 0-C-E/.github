= 0 C.E. - Military
<0-ce---military>
#link("../nav/Home.pdf") | #link("Cultural-Events.pdf")[Previous] |
#link("Espionage.pdf")[Next]

== 10. Military & Combat
<10-military--combat>
=== 10.1 Combat Philosophy
<101-combat-philosophy>
Combat in 0 C.E. rewards #strong[preparation and intelligence over
  reaction time];. The outcome of a battle is largely determined before
the first unit moves:

- Army composition (unit mix)
- Formation choice (attacker declares before combat resolves)
- Tech level (era of units)
- Intelligence gathered (espionage revealing defender\'s formation and
  garrison)
- Timing (when to attack relative to enemy online status and
  reinforcement windows)

Real-time refers to the #emph[continuous world] --- armies march in real
time, battles resolve as armies meet --- not to twitch mechanics. An
offline player\'s city is defensible by their pre-set garrison and city
walls.

=== 10.2 Unit Types
<102-unit-types>
==== 10.2.1 Land Units (Barracks)
<1021-land-units-barracks>
Trained at the #strong[Barracks];. All units can be dispatched on
attack, including defense-specialist types --- see §10.2.7.

#strong[Unit access];: The Spearman is available by default from a T1
Barracks with no research required. Every other unit type must be
unlocked individually through the Military research category (§12.3)
before it can be trained. Barracks tier affects training capacity and
speed, not unit availability.

#figure(
  align(center)[#table(
    columns: 7,
    align: (auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [Unit],
      [Type],
      [Role],
      [Hard Counter],
      [Soft
        Counter],
      [Hard Countered By],
      [Soft Countered By],
    ),
    table.hline(),
    [#strong[Sword Infantry];],
    [⛏️ Attack],
    [Core melee
      attacker],
    [#strong[Archer];],
    [#strong[Slinger];],
    [#strong[War
      Chariot];],
    [#strong[Heavy Infantryman];],
    [#strong[Light Cavalry];],
    [⛏️ Attack],
    [Fast raider and
      flanker],
    [#strong[Slinger];],
    [#strong[Archer];],
    [#strong[Spearman];],
    [#strong[Pikeman];],
    [#strong[War Chariot];],
    [⛏️ Attack],
    [Shock impact
      attacker],
    [#strong[Sword Infantry];],
    [#strong[Light
      Cavalry];],
    [#strong[Heavy Infantryman];],
    [#strong[Spearman];],
    [#strong[Spearman];],
    [⚖️ Mixed],
    [Balanced line
      fighter],
    [#strong[Light Cavalry];],
    [#strong[War
      Chariot];],
    [#strong[Pikeman];],
    [#strong[Peltast];],
    [#strong[Archer];],
    [⚖️ Mixed],
    [Ranged
      pressure],
    [#strong[Pikeman];],
    [#strong[Heavy
      Infantryman];],
    [#strong[Sword Infantry];],
    [#strong[Light
      Cavalry];],
    [#strong[Slinger];],
    [⚖️ Mixed],
    [Light ranged
      support],
    [#strong[Peltast];],
    [#strong[Archer];],
    [#strong[Light
      Cavalry];],
    [#strong[War Chariot];],
    [#strong[Heavy Infantryman];],
    [🛡️ Defense],
    [Garrison
      tank],
    [#strong[War Chariot];],
    [#strong[Sword
      Infantry];],
    [#strong[Peltast];],
    [#strong[Archer];],
    [#strong[Pikeman];],
    [🛡️ Defense],
    [Anti-cavalry
      phalanx],
    [#strong[Spearman];],
    [#strong[War
      Chariot];],
    [#strong[Archer];],
    [#strong[Slinger];],
    [#strong[Peltast];],
    [🛡️ Defense],
    [Anti-ranged
      skirmisher],
    [#strong[Heavy
      Infantryman];],
    [#strong[Spearman];],
    [#strong[Slinger];],
    [#strong[Light
      Cavalry];],
  )],
  kind: table,
)

==== 10.2.2 Siege Units
<1022-siege-units>
#figure(
  align(center)[#table(
    columns: 6,
    align: (auto, auto, auto, auto, auto, auto),
    table.header(
      [Unit],
      [Role],
      [Hard Counter (heavy advantage)],
      [Soft
        Counter (light advantage)],
      [Hard Countered By],
      [Soft Countered
        By],
    ),
    table.hline(),
    [#strong[Catapult];],
    [Ranged siege and structure
      damage],
    [#strong[Walls / Defensive Structures];],
    [#strong[Dense
      garrisons];],
    [#strong[Light Cavalry];],
    [#strong[Archer];],
    [#strong[Battering Ram];],
    [Close siege breaching],
    [#strong[Gates /
      Wall Segments];],
    [#strong[Fortified structures];],
    [#strong[Sword
      Infantry];],
    [#strong[Archer];],
  )],
  kind: table,
)

==== 10.2.3 Naval Units (Harbor)
<1023-naval-units-harbor>
Trained at the #strong[Harbor];. Utility ships (Transport Boat, Fast
Transport Ship, Colony Ship) have no combat stats and are not included
in the counter tables.

#strong[Combat Ships:]

#figure(
  align(center)[#table(
    columns: 7,
    align: (auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [Unit],
      [Type],
      [Role],
      [Hard Counter],
      [Soft
        Counter],
      [Hard Countered By],
      [Soft Countered By],
    ),
    table.hline(),
    [#strong[Fire Ship];],
    [⛏️ Attack],
    [Sacrificial area
      denial],
    [#strong[Tower
      Ship];],
    [#strong[Quinquereme];],
    [#strong[Cataphract];],
    [#strong[Liburnian];],
    [#strong[Bireme];],
    [⛏️ Attack],
    [Fast strike
      galley],
    [#strong[Liburnian];],
    [#strong[Dromon];],
    [#strong[Tower
      Ship];],
    [#strong[Trireme];],
    [#strong[Quinquereme];],
    [⛏️ Attack],
    [Heavy assault
      galley],
    [#strong[Trireme];],
    [#strong[Dromon];],
    [#strong[War
      Barge];],
    [#strong[Fire Ship];],
    [#strong[Trireme];],
    [⚖️ Mixed],
    [Balanced core
      warship],
    [#strong[Dromon];],
    [#strong[Bireme];],
    [#strong[Quinquereme];],
    [#strong[War
      Barge];],
    [#strong[Dromon];],
    [⚖️ Mixed],
    [Fire-armed war
      galley],
    [#strong[Cataphract];],
    [#strong[Quinquereme];],
    [#strong[Trireme];],
    [#strong[Tower
      Ship];],
    [#strong[Liburnian];],
    [⚖️ Mixed],
    [Fast patrol
      galley],
    [#strong[War
      Barge];],
    [#strong[Dromon];],
    [#strong[Bireme];],
    [#strong[Fire
      Ship];],
    [#strong[Tower Ship];],
    [🛡️ Defense],
    [Elevated archer
      platform],
    [#strong[Bireme];],
    [#strong[Trireme];],
    [#strong[Fire
      Ship];],
    [#strong[Quinquereme];],
    [#strong[Cataphract];],
    [🛡️ Defense],
    [Armored escort
      galley],
    [#strong[Fire Ship];],
    [#strong[Tower
      Ship];],
    [#strong[Dromon];],
    [#strong[War Barge];],
    [#strong[War Barge];],
    [🛡️ Defense],
    [Hull-bulk harbor
      guardian],
    [#strong[Quinquereme];],
    [#strong[Dromon];],
    [#strong[Liburnian];],
    [#strong[Trireme];],
  )],
  kind: table,
)

#strong[Utility Ships] #emph[(no combat stats; never appear in counter
  tables)];:

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Ship], [Role]),
    table.hline(),
    [#strong[Transport Boat];], [Basic troop transport],
    [#strong[Fast Transport Ship];],
    [Rapid reinforcement and timing
      plays],
    [#strong[Colony Ship];],
    [City acquisition and expansion (see
      §10.8)],
  )],
  kind: table,
)

==== 10.2.4 Counter Rules (Hard vs Soft)
<1024-counter-rules-hard-vs-soft>
All matchups use a two-tier counter model:

- #strong[Hard Counter];: dominant matchup with large combat efficiency
  advantage.
- #strong[Soft Counter];: favorable matchup with moderate combat
  efficiency advantage.

Recommended baseline multipliers (tunable in balance files):

- #strong[Hard Counter];: +40% damage dealt, -25% damage taken
- #strong[Soft Counter];: +15% damage dealt, -10% damage taken
- #strong[Neutral];: no modifier

Combat resolution is primarily numbers-driven (unit counts + unit
quality + matchup multipliers). Only attackers choose formations;
defenders do not receive formation modifiers.

==== 10.2.5 Land Unit Stat System
<1025-land-unit-stat-system>
Each land unit has six combat stats covering weapon output and armour
profile, plus two operational stats:

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Stat], [Description]),
    table.hline(),
    [#strong[Blunt Dmg];],
    [Melee blunt damage (clubs, maces,
      chariot/cavalry impact, shield bashes)],
    [#strong[Distance Dmg];],
    [Ranged projectile damage (bows, slings,
      javelins, thrown weapons)],
    [#strong[Sharp Dmg];],
    [Melee sharp damage (swords, spears, axes,
      lances, pikes)],
    [#strong[Def vs Blunt];],
    [Damage reduction against incoming blunt
      attacks],
    [#strong[Def vs Distance];],
    [Damage reduction against incoming
      ranged attacks],
    [#strong[Def vs Sharp];],
    [Damage reduction against incoming sharp
      attacks],
    [#strong[Speed];], [March speed multiplier on open terrain],
    [#strong[Booty Capacity];],
    [Max resources this unit carries back
      from a successful raid],
  )],
  kind: table,
)

#strong[Damage resolution per unit matchup:]

```
effective_damage = attacker.weapon_dmg × counter_multiplier − defender.def_vs_[weapon_type]
```

Each unit deals damage of one or two weapon types (the non-`—` columns).
The target\'s corresponding defense stat is subtracted. Counter
multipliers from §10.2.4 apply on top as balance levers. The hard/soft
counter relationships in §10.2.1 should emerge naturally from the stat
differentials (e.g., Pikeman has low Def vs Distance and cannot close
the gap; Archer has high Distance Dmg → Archer hard counters Pikeman).

#strong[Base Combat Stats] #emph[(placeholder --- fill during balance
  pass; `—` = weapon type not used by this unit)];:

#figure(
  align(center)[#table(
    columns: 9,
    align: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [Unit],
      [Blunt Dmg],
      [Distance Dmg],
      [Sharp Dmg],
      [Def
        vs Blunt],
      [Def vs Distance],
      [Def vs Sharp],
      [Speed],
      [Booty],
    ),
    table.hline(),
    [#strong[Sword
      Infantry];],
    [---],
    [---],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [#strong[Light
      Cavalry];],
    [---],
    [---],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [#strong[War
      Chariot];],
    [TBD],
    [---],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [#strong[Spearman];], [TBD], [---], [TBD], [TBD], [TBD], [TBD], [TBD], [TBD],
    [#strong[Archer];], [---], [TBD], [---], [TBD], [TBD], [TBD], [TBD], [TBD],
    [#strong[Slinger];], [---], [TBD], [---], [TBD], [TBD], [TBD], [TBD], [TBD],
    [#strong[Heavy
      Infantryman];],
    [---],
    [---],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [TBD],
    [#strong[Pikeman];], [---], [---], [TBD], [TBD], [TBD], [TBD], [TBD], [TBD],
    [#strong[Peltast];], [---], [TBD], [---], [TBD], [TBD], [TBD], [TBD], [TBD],
  )],
  kind: table,
)

==== 10.2.6 Land Unit Recruitment Costs
<1026-land-unit-recruitment-costs>
Units can draw on any combination of resources. `—` means not required.
All units consume at least 1 free population slot. Building time is
always required.

#figure(
  align(center)[#table(
    columns: 9,
    align: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [Unit],
      [Type],
      [🪵 Wood],
      [🪨 Stone],
      [⛏️ Metal],
      [🌾
        Food],
      [✨ Favor],
      [👥 Pop],
      [⏱️ Build Time],
    ),
    table.hline(),
    [#strong[Sword Infantry];],
    [⛏️
      Attack],
    [---],
    [---],
    [TBD],
    [TBD],
    [---],
    [1],
    [TBD],
    [#strong[Light Cavalry];],
    [⛏️
      Attack],
    [TBD],
    [---],
    [TBD],
    [TBD],
    [---],
    [2],
    [TBD],
    [#strong[War Chariot];],
    [⛏️
      Attack],
    [TBD],
    [---],
    [TBD],
    [TBD],
    [---],
    [2],
    [TBD],
    [#strong[Spearman];],
    [⚖️
      Mixed],
    [---],
    [---],
    [TBD],
    [TBD],
    [---],
    [1],
    [TBD],
    [#strong[Archer];],
    [⚖️
      Mixed],
    [TBD],
    [---],
    [TBD],
    [TBD],
    [---],
    [1],
    [TBD],
    [#strong[Slinger];],
    [⚖️
      Mixed],
    [TBD],
    [---],
    [---],
    [TBD],
    [---],
    [1],
    [TBD],
    [#strong[Heavy Infantryman];],
    [🛡️
      Defense],
    [---],
    [---],
    [TBD],
    [TBD],
    [---],
    [1],
    [TBD],
    [#strong[Pikeman];],
    [🛡️
      Defense],
    [---],
    [---],
    [TBD],
    [TBD],
    [---],
    [1],
    [TBD],
    [#strong[Peltast];],
    [🛡️
      Defense],
    [TBD],
    [---],
    [---],
    [TBD],
    [---],
    [1],
    [TBD],
  )],
  kind: table,
)

==== 10.2.7 Attack, Mixed, and Defense Specialization
<1027-attack-mixed-and-defense-specialization>
All barracks units --- including 🛡️ Defense-specialist types --- can be
dispatched on attack. Defense units sent offensively will underperform:
their low weapon damage, slow speed, and near-zero booty capacity make
them poor raiders. There is no hard unlock or march restriction; the
stat system penalises misuse organically.

This design serves three goals:

- New players discover the difference through experimentation, not
  tutorial pop-ups
- Experienced players retain access to niche strategies (a Heavy
  Infantryman blob that outlasts the enemy through pure attrition is a
  legitimate surprise play)
- City specialisation emerges from unit composition choices, not a
  hard-coded city-type label

#strong[What role types mean in practice:]

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto, auto, auto, auto),
    table.header(
      [Garrison Composition],
      [Offensive
        Strength],
      [Defensive Strength],
      [Raiding Efficiency],
    ),
    table.hline(),
    [Mostly ⛏️ Attack], [High], [Low], [High booty per run],
    [Mostly ⚖️ Mixed], [Moderate], [Moderate], [Moderate],
    [Mostly 🛡️ Defense], [Poor], [Very High], [Near zero],
  )],
  kind: table,
)

The role labels define the #strong[expected optimal use];, not a hard
restriction.

#strong[Defense unit design principles:]

- High Def vs two or more damage types; low to moderate weapon damage
  output
- Below-average Speed --- they cannot pursue fleeing enemies or race to
  an objective
- Cost favours armour resources (Metal) over mobility resources (Favor,
  Wood)
- Near-zero Booty Capacity --- sending them to raid is always a net loss

=== 10.3 Army System
<103-army-system>
- Players organize units into named #strong[Armies] (persistent
  groupings)
- Armies are assigned #strong[march orders] on the continuous map: move
  to coordinate, attack target city, patrol zone, garrison city
- #strong[March Time];:
  `distance / (army_speed × terrain_modifier × road_bonus)`
- #strong[Formation];: Attacker sets formation #emph[before] dispatching
  the army (not at contact). Formation is hidden from defender unless
  revealed by espionage.
- #strong[Recall];: At any time before contact; return march at same
  speed

=== 10.4 Formations
<104-formations>
Attacker chooses one formation when dispatching:

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto, auto, auto, auto),
    table.header(
      [Formation],
      [Primary Effect],
      [Best Against (defending
        unit)],
      [Weak Into],
    ),
    table.hline(),
    [#strong[Hammer];],
    [Sword Infantry and Heavy assault units gain
      \+20% attack, -15% defense],
    [#strong[Sword
      Infantry];],
    [#strong[Spearman];],
    [#strong[Shield Wall];],
    [Frontline units gain +20% defense, -10%
      attack],
    [#strong[Archer];],
    [#strong[Light Cavalry];],
    [#strong[Flanking];],
    [Light Cavalry gain +30% damage and bypass 20%
      wall HP],
    [#strong[Slinger];],
    [#strong[Spearman];],
    [#strong[Spearhead];],
    [Spearman and Sword Infantry gain +15%
      first-round damage],
    [#strong[Spearman];],
    [#strong[Archer];],
    [#strong[Skirmish Screen];],
    [Archer and Slinger gain +20% damage,
      \-10% defense],
    [#strong[Light Cavalry];],
    [#strong[Sword
      Infantry];],
    [#strong[Siege Focus];],
    [Siege units attack walls first and deal
      \+25% wall damage],
    [#strong[Catapult / Battering Ram (defending
      siege units)];],
    [#strong[Light Cavalry];],
    [#strong[Balanced];],
    [No bonus, no penalty],
    [No specific
      target],
    [Specialized formations],
  )],
  kind: table,
)

Defenders have no formation system. Defense behavior is determined by
garrison composition, unit counts, and unit quality.

=== 10.5 Combat Resolution
<105-combat-resolution>
Combat is fully abstracted in v1. When an attacking army reaches a city
or meets a defending army on the map:

+ #strong[Attacker Formation Application];: Apply the selected attacker
  formation modifiers to the attacking army. Defenders do not select or
  receive formation modifiers.
+ #strong[Wall Phase];: If attacking a city with walls, wall HP must be
  reduced before garrison is attacked. Siege weapons dramatically
  accelerate this. The wall phase resolves first.
+ #strong[Battle Phase];: Units engage based on type matchups and
  formation bonuses. Each \"round\" resolves instantly in the abstracted
  model.
+ #strong[Attacker Morale Modifier];: Apply pre-battle morale to
  attacking units only, based on attacker-vs-defender progression gap
  (points/power range). No defender morale modifier is applied.
+ #strong[Resolution];: Winner remains; loser retreats or is destroyed.
  City capture triggers if attacker wins and garrison is eliminated.

==== 10.5.1 Attacker Morale (Progression Fairness)
<1051-attacker-morale-progression-fairness>
Morale exists to narrow extremes between mastodont accounts and newer
players. Attackers perform best when fighting peers, lose confidence
when punching far up or far down, and gain only a small bonus when
challenging a slightly stronger target.

#strong[Scope rules:]

- Applies to attacking units only
- Computed once at battle start
- Multiplies final attacker damage output (after formation/counter
  modifiers)
- Does not affect wall HP formulas, claim timers, or non-combat systems

#strong[Inputs:]

- `A = attacker progression score` (world points or combat power index)
- `D = defender progression score`
- `gap = (A - D) / max(D, 1)`

Positive `gap` means attacker is stronger. Negative `gap` means defender
is stronger.

#strong[Morale function (attacker only):]

```py
if gap >= 0:
    morale = clamp(1.00 - 0.50 * min(gap, 1.00), 0.70, 1.00)
else:
    morale = clamp(1.00 + 0.12 * min(-gap, 0.25), 1.00, 1.03)
```

This yields:

- `100%` vs equal-strength targets
- Down to `70%` when heavily bullying much weaker targets
- Up to `103%` when attacking a slightly stronger target
- No large over-100% spikes

#strong[Examples:]

- Attacker 20% stronger (`gap = +0.20`) -\> morale `90%`
- Attacker 100% stronger (`gap = +1.00`) -\> morale `70%` (floor)
- Defender 10% stronger (`gap = -0.10`) -\> morale `101.2%`
- Defender 25% stronger (`gap = -0.25`) -\> morale `103%` (cap)

This keeps high-progression players from farming low-progression players
at full efficiency while preserving fair fights and rewarding modestly
risky attacks.

#strong[Combat Report];: After resolution, both players receive a
detailed narrative combat report --- unit losses, round-by-round
summary, formation effectiveness, loot gained/lost. This is the
\"drama\" layer --- richly written, historically flavored.

=== 10.6 City Defense
<106-city-defense>
Three layers of city defense:

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header([Layer], [Description], [Depletes?]),
    table.hline(),
    [#strong[Walls];],
    [Stone HP barrier; must be destroyed before
      garrison is engaged],
    [Yes; repairable with Stone],
    [#strong[Garrison];],
    [Player-assigned military units stationed in
      city],
    [Yes; lost in battle],
    [#strong[Civilian Militia];],
    [Auto-spawned when city is attacked;
      weak but provide a final layer],
    [Yes; resets after battle],
  )],
  kind: table,
)

Militia strength scales with city population. They are not free units
--- they appear only during active siege and disappear after. They are
the last line against an instant capture when a player is offline and
their garrison is depleted.

=== 10.7 Loot & Capture
<107-loot--capture>
#strong[Raid] (defeat garrison, don\'t occupy): Attacker gains 10--15%
of city\'s current resource stockpile. City ownership unchanged.

#strong[Capture] (eliminate garrison + occupy): City ownership transfers
to attacker. Attacker gains 25% of stockpile. Defender retains account
and any other cities; receives a #strong[Grievance Bonus] (temporary
production boost as comeback mechanic).

Detailed city acquisition flows (Conquest, Revolt, Rapid Siege) are
defined in #strong[§10.8];.

=== 10.8 City Acquisition Systems (Conquest, Revolt, Rapid Siege)
<108-city-acquisition-systems-conquest-revolt-rapid-siege>
There are two primary city acquisition systems in normal worlds:
#strong[Conquest] and #strong[Revolt];. The active system is chosen by
world setting at world creation.

- #strong[Conquest] applies to Siege worlds
- #strong[Revolt] applies to Revolt worlds
- #strong[Rapid Siege] applies to Game Night worlds only

The world cannot switch acquisition system after start.

==== 10.8.1 Shared Requirements
<1081-shared-requirements>
- Conquest research completed (Conquest and Revolt worlds only)
- Enough Culture Points to own an additional city
- One Colony Ship (CS) committed to the claim action
- Target city is not under beginner protection

If the Colony Ship is destroyed, the claim attempt fails.

==== 10.8.2 Conquest (Siege Worlds)
<1082-conquest-siege-worlds>
#strong[Requires:]

- Conquest researched
- Enough Culture Points
- Colony Ship survives the full siege

#strong[Process:]

+ Launch attack with land and naval units, including a Colony Ship.
+ If defender is defeated, city enters #strong[Siege State];.
+ During Siege State, attacker holds provisional control, but defender
  can counterattack normally.
+ Support troops in support mode may reinforce the siege.
+ If siege timer completes and CS is alive, city transfers.
+ If CS is destroyed before completion, conquest fails and surviving
  attackers retreat.

#strong[Default duration model:]

```
siege_duration = max(2h, conquest_base_hours / world_speed_multiplier)
```

On successful transfer, buildings and completed research remain intact.

==== 10.8.3 Revolt (Revolt Worlds)
<1083-revolt-revolt-worlds>
#strong[Requires:]

- Conquest researched
- Colony Ship
- Enough Culture Points

#strong[Process:]

+ Launch #strong[Revolt Attack] (land units only) and defeat all
  defending land units.
+ Successful attack starts a #strong[Revolt Window] of X hours.
+ During this window, send Colony Ship with land and naval escorts.
+ Final claim requires winning both land and sea battles.
+ If CS lands successfully within window, city transfers.
+ If window expires or CS is destroyed, revolt fails and ownership stays
  with defender.

#strong[Default duration model:]

```
revolt_window = max(2h, revolt_window_hours / world_speed_multiplier)
```

==== 10.8.4 Rapid Siege (Game Night)
<1084-rapid-siege-game-night>
Rapid Siege is tuned for short sessions and defender reaction fairness.

#strong[Process:]

+ Attacker wins claim battle with CS alive.
+ City enters #strong[Rapid Claim State] for a short timer.
+ Defender can cancel claim by winning one relief battle in city radius
  before timer ends.
+ If timer completes with attacker still controlling claim state and CS
  alive, city transfers.

#strong[Defaults:]

- Claim timer: 12 minutes (or scaled formula from §2.8)
- Recapture immunity after transfer: 10 minutes
- One active claim per player: enabled

==== 10.8.5 Key Notes and Exceptions
<1085-key-notes-and-exceptions>
- #strong[Ghost Towns (Revolt worlds):] can be claimed without Conquest
  technology; still require CS and successful landing
- #strong[Colonies:] permanent and cannot be abandoned
- #strong[Support Importance:] support mode is critical during siege and
  revolt windows
- #strong[Divine Unit Support:] divine units may support only when they
  worship the same god as the city under siege

==== 10.8.6 Anti-Exploit Guardrails
<1086-anti-exploit-guardrails>
- Culture Point requirement is validated again at final claim resolution
  (not only at launch)
- One city may have only one active claim state at a time
- If city ownership changes mid-claim, previous claim state is canceled
- Beginner-protected players cannot be targeted by claim actions
- Attacker morale and night bonus modify battle outcomes only; claim
  timer behavior is controlled explicitly by world settings
