= 0 C.E. - Divine System
<0-ce---divine-system>
#link("../nav/Home.typ") | #link("Buildings-and-Wonders.typ")[Previous] |
#link("Cultural-Events.typ")[Next]

== 5. Divine System & Favor
<5-divine-system--favor>
=== 5.1 Divine Core Rules
<51-divine-core-rules>
The divine system follows a Grepolis-like structure with explicit
city-god commitment and per-god Favor economies.

- A city cannot access divinity without a Temple
- One city worships one god at a time
- Each god has a separate Favor pool
- Favor is aggregated across all cities currently worshipping that god
- All listed gods for a civilization are available from game start
- Divine powers have no cooldowns
- Casting is limited by Favor availability and target-city protection
  rules only
- Target players are explicitly notified when hit by a divine power,
  including caster identity
- Favor spending is irreversible

=== 5.2 Faith Path Commitment: Monotheist vs. Polytheist
<52-faith-path-commitment-monotheist-vs-polytheist>
A player\'s faith path is chosen permanently the first time they assign
a god to any city.

#strong[Monotheist];:

- A main god is chosen at first assignment
- New temples default to the main god automatically
- All powers cost 20% less Favor: `final_cost = base_cost × 0.80`
- If any city worships a non-main god, #strong[Devotion Fracture]
  applies
- Fracture scales multiplicatively by fractured city count:

```
favor_production_multiplier = 0.8 ^ fractured_cities
```

Examples:

- 1 fractured city: 80% production
- 2 fractured cities: 64% production
- 5 fractured cities: \~32% production
- 10 fractured cities: \~10% production
- 20 fractured cities: \~1% production (effectively halted)

#strong[Polytheist];:

- Cities may switch gods freely
- Switching a city away from god X immediately #strong[hard-resets god
  X\'s entire Favor pool to 0]
- No fracture debuff exists for polytheists

#strong[Balance];:

- Monotheist: deeper, cheaper casting around one god; fracture is a
  severe deterrent to deviation
- Polytheist: wider situational coverage at the cost of total Favor loss
  on every god switch

=== 5.3 Favor Production and Cap
<53-favor-production-and-cap>
#strong[Per-city effective temple contribution:]

```
effective_level(city) = temple_tier(city) + (5 if Divine Statue built in city, else 0)
```

The Divine Statue contributes only toward that city\'s currently
assigned god.

#strong[Per-god Favor production:]

```
favor_per_second(god) = √( Σ effective_level(city) for all cities worshipping god ) × world_speed
```

#strong[Per-god Favor cap:]

```
favor_cap = 500  (hard cap, flat, no scaling)
```

Favor cannot exceed 500. Excess generation is lost. This applies equally
to all gods, all civs, all faith paths.

The square root formula creates intentional diminishing returns ---
broad worship scales sublinearly, keeping single-city mega-base builders
competitive in divine output against expansionists.

=== 5.4 Divine Power Structure
<54-divine-power-structure>
- Gods have 3 to 5 powers each
- Every god has at least one active power; passive powers have no
  minimum
- No global tiering system --- all powers available from game start
- Power Favor costs scale with effect magnitude --- bigger effects cost
  more
- Activation types are mixed per spell: instant, delayed, and
  conditional
- Favor spent triggers the effect directly --- no minigame, no extra
  confirmation

Universal casting cost rule:

```
final_favor_cost = max(0, X - sacrifice)
```

- `X` is the base Favor cost shown in the table
- `sacrifice` is the total free population sacrificed at cast time
- Sacrificed units convert at a 1:1 ratio with their free-population
  value

=== 5.5 Target Protection and Stacking Rules
<55-target-protection-and-stacking-rules>
#strong[Hostile protection (city-level):]

- When a hostile divine power successfully hits a city, that city enters
  #strong[Divine Protection]
- During protection, no further hostile divine powers may target that
  city, regardless of god or caster
- One universal protection timer per city --- not spell-family-specific
- Protection duration is defined per power in its data file (scaled to
  effect severity)
- Protection timer is visible to all players

#strong[Defensive stacking:]

- Defensive spells cannot be stacked on the same city while an
  equivalent effect is still active
- Recasting is allowed only after the prior instance expires

#strong[No additional cast-rate limiter:]

- No cooldowns
- No global cast lock
- Favor availability and target-city protection are the only constraints

=== 5.6 Cultural Events & City Progression
<56-cultural-events--city-progression>
Cultural Events and Cultural Levels are the progression system that
gates city founding and tier upgrades. They are documented separately
--- see #strong[#link("Cultural-Events.typ")[Cultural Events];];.

=== 5.7 Greek Pantheon --- The Twelve Olympians
<57-greek-pantheon--the-twelve-olympians>
Greece has the largest pantheon. Polytheism is the historically
authentic and mechanically natural Greek choice --- 12 gods means a
Greek polytheist can field a divine response to virtually any situation.
A Greek monotheist is making a bold, high-commitment gamble on one
domain.

==== Zeus --- Sky, Thunder, Justice
<zeus--sky-thunder-justice>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Aegis of Zeus];], [Instant], [Your city walls gain +20%
    defense for 12h], [250],
    [#strong[Thunderstrike];], [Delayed (2h)], [Random non-special
    building in target city loses 1 level], [400],
    [#strong[Divine Authority];], [Instant], [Your next outgoing army
    gains +20% movement speed for 12h], [500],
  )]
  , kind: table
  )

==== Hera --- Marriage, Alliances, Loyalty
<hera--marriage-alliances-loyalty>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Bond of Hera];], [Instant], [City gains +2 effective City
    Walls levels for 8h], [200],
    [#strong[Jealous Wrath];], [Conditional], [If target city is
    attacked within 12h, its garrison fights at -15% effectiveness for
    one battle], [500],
    [#strong[Sacred Union];], [Instant], [Targeted citiy gains +20%
    defender effectiveness for 8h], [300],
  )]
  , kind: table
  )

==== Poseidon --- Sea, Naval Power, Earthquakes
<poseidon--sea-naval-power-earthquakes>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Favorable Winds];], [Instant], [All your naval units move
    10% faster for 8h], [225],
    [#strong[Trident\'s Call];], [Instant], [Enemy naval units targeting
    your coast slowed 30% for 12h], [500],
    [#strong[Sea Dominion];], [Instant], [Your naval units deal +25%
    damage for one battle], [500],
    [#strong[Earthquake];], [Delayed (4h)], [Target enemy city loses 2
    effective City Walls levels for 12h], [450],
  )]
  , kind: table
  )

==== Demeter --- Agriculture, Harvest, Famine
<demeter--agriculture-harvest-famine>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Fertile Season];], [Instant], [Food production +35% in one
    city for 12h], [200],
    [#strong[Harvest Blessing];], [Instant], [Food production +20%
    across all cities for 8h], [450],
    [#strong[Blight];], [Delayed (6h)], [Target enemy city\'s food
    production −40% for 24h], [500],
  )]
  , kind: table
  )

==== Athena --- Wisdom, Crafts, Strategic Warfare
<athena--wisdom-crafts-strategic-warfare>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Owl\'s Sight];], [Instant], [Reveals target city\'s
    garrison composition], [300],
    [#strong[Aegis Craft];], [Instant], [Construction speed +35% in one
    city for 8h], [500],
    [#strong[Stratagem];], [Conditional], [Your next attacking army
    ignores 20% of defender\'s City Walls defense bonus if garrison was
    scouted in last 24h], [500],
  )]
  , kind: table
  )

==== Apollo --- Sun, Prophecy, Healing
<apollo--sun-prophecy-healing>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Solar Blessing];], [Instant], [All production in one city
    \+10% for 12h], [225],
    [#strong[Prophet\'s Eye];], [Instant], [Reveals formation of next
    army currently marching toward any of your cities], [500],
    [#strong[Oracle\'s Warning];], [Conditional], [If your city is
    attacked within 12h, garrison fights at +15% effectiveness], [500],
    [#strong[Healing Light];], [Instant], [Recover 10% of units lost in
    your last attacked army], [350],
  )]
  , kind: table
  )

==== Artemis --- Hunt, Wilderness, Precision
<artemis--hunt-wilderness-precision>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Hunter\'s Mark];], [Instant], [Your archers deal +25%
    damage in next battle], [250],
    [#strong[Wild Terrain];], [Instant], [Enemy armies targeting your
    cities are slowed 20% for 24h], [500],
    [#strong[Moonlit Ambush];], [Conditional], [If your army attacks
    within 12h, first combat round deals +30% damage], [500],
  )]
  , kind: table
  )

==== Ares --- War, Bloodshed, Courage
<ares--war-bloodshed-courage>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Battlecry];], [Instant], [All attacking units deal +15%
    damage for one battle], [275],
    [#strong[War Fever];], [Instant], [Enemy city\'s garrison fights at
    −10% effectiveness for one battle], [500],
    [#strong[Blood Frenzy];], [Instant], [Your army gains +15% attack or
    \+10% defense for next battle], [500],
    [#strong[Carnage];], [Instant], [Enemy army in your next battle
    suffers +10% additional casualties], [500],
  )]
  , kind: table
  )

==== Aphrodite --- Love, Beauty, Persuasion
<aphrodite--love-beauty-persuasion>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Fertility\'s Grace];], [Passive (ongoing)], [City gains +2
    free population per Granary level and +1 free population per Farm
    level], [N/A],
    [#strong[Golden Apple];], [Instant], [Reveal target city\'s current
    resource stockpiles for 24h], [250],
    [#strong[Enchantment];], [Delayed (3h)], [Target player\'s next
    incoming army march slowed 20% for 12h], [475],
    [#strong[Discord];], [Instant], [Fake march --- ghost army appears
    marching toward target; vanishes on arrival], [500],
  )]
  , kind: table
  )

==== Hephaestus --- Fire, Forge, Craftsmanship
<hephaestus--fire-forge-craftsmanship>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Smith\'s Gift];], [Instant], [Metal production +40% in
    targeted city for 12h], [225],
    [#strong[Master Forge];], [Instant], [Next military unit batch
    trained in target city costs 25% fewer resources], [400],
    [#strong[Divine Fire];], [Delayed (3h)], [Target enemy city loses 1
    effective City Walls level for 12h], [500],
    [#strong[Celestial Armor];], [Instant], [Target army gains +20%
    defense for next battle], [500],
  )]
  , kind: table
  )

==== Hermes --- Messengers, Speed, Cunning
<hermes--messengers-speed-cunning>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Swift Feet];], [Instant], [Target army moves 20% faster for
    12h], [225],
    [#strong[Mercury\'s Veil];], [Instant], [Target army is hidden from
    enemy alters for 10% of their way], [150],
    [#strong[Thief\'s Touch];], [Instant], [Spy cost is reduced by 30%
    for next mission], [500],
    [#strong[Ghost March];], [Instant], [Fake march --- ghost army
    appears marching toward target; vanishes on arrival], [275],
    [#strong[Divine Intercept];], [Conditional], [If enemy spy operates
    in your city within 12h, mission auto-fails and spy
    captured], [500],
  )]
  , kind: table
  )

==== Dionysus --- Wine, Festivity, Chaos
<dionysus--wine-festivity-chaos>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Festival];], [Instant], [Grants 1 bonus Culture Points to
    one city immediately], [500],
    [#strong[Revelry];], [Instant], [Enemy city\'s military unit
    training speed −25% for 12h], [450],
    [#strong[Divine Madness];], [Delayed (4h)], [Target enemy army\'s
    formation randomized for their next battle], [275],
  )]
  , kind: table
  )

=== 5.8 Sumerian Pantheon --- The Anunnaki
<58-sumerian-pantheon--the-anunnaki>
Seven gods reflecting the first civilization: construction, water,
cosmic order, justice, time, fertility. Monotheism suits Sumer
historically and mechanically --- Enlil or Enki as supreme patron
rewards the builder playstyle deeply.

==== An --- Sky, Supreme Authority, Cosmic Order
<an--sky-supreme-authority-cosmic-order>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Celestial Mandate];], [Instant], [All Favor generation
    across your cities +10% for 12h], [300],
    [#strong[Divine Sanction];], [Instant], [Reveal all armies currently
    marching to or from one target player\'s cities for 6h], [500],
    [#strong[Heavenly Ward];], [Instant], [Target city cannot be
    targeted by any divine power for 24h], [400],
  )]
  , kind: table
  )

==== Enlil --- Wind, Storms, Earth, Agriculture
<enlil--wind-storms-earth-agriculture>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Wind\'s Blessing];], [Instant], [Wood production +25% in
    one city for 12h], [225],
    [#strong[Gale Force];], [Instant], [Enemy army marching toward your
    city arrives 20% slower], [500],
    [#strong[Storm Season];], [Delayed (3h)], [Target enemy city\'s food
    production −30% for 18h], [500],
    [#strong[Tablet of Destinies];], [Instant], [Reveals target enemy\'s
    entire building composition], [450],
  )]
  , kind: table
  )

==== Enki --- Water, Wisdom, Crafts, Creation
<enki--water-wisdom-crafts-creation>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Abzu\'s Flow];], [Instant], [Food production +30% in one
    city for 24h], [200],
    [#strong[Gift of Craft];], [Instant], [Next building orders placed
    in target city within 12h build 35% faster], [350],
    [#strong[Waters of Life];], [Instant], [Recover 25% of units lost in
    your last battle], [500],
    [#strong[Enkidu\'s Strength];], [Instant], [One army gains +20%
    attack and +10% defense for next battle], [500],
  )]
  , kind: table
  )

==== Inanna / Ishtar --- Love, War, Power
<inanna--ishtar--love-war-power>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Lioness\'s Roar];], [Instant], [Attacking army deals +15%
    damage for one battle], [375],
    [#strong[Starlight Veil];], [Instant], [Fake march --- ghost army
    appears marching toward target; vanishes on arrival], [275],
    [#strong[Descent and Return];], [Passive], [If your city is
    captured, first building enemy constructs there collapses on
    completion], [0],
    [#strong[Ishtar\'s Gate];], [Instant], [Attacking army loses 10%
    forces before combat begins], [300],
  )]
  , kind: table
  )

==== Utu / Shamash --- Sun, Justice, Truth
<utu--shamash--sun-justice-truth>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Sun\'s Eye];], [Instant], [Reveals exact resource
    stockpiles of target city], [225],
    [#strong[Law\'s Weight];], [Instant], [Reveals garrison composition
    of target city], [450],
    [#strong[Divine Verdict];], [Delayed (6h)], [Target enemy\'s Favor
    generation halved for 24h], [500],
  )]
  , kind: table
  )

==== Nanna / Sin --- Moon, Time, Cycles
<nanna--sin--moon-time-cycles>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Moonrise];], [Instant], [Stone and wood production +30% in
    one city for 16h], [200],
    [#strong[Cattle Blessing];], [Instant], [Food production +20% across
    all cities for 8h], [450],
    [#strong[Lunar Dispel];], [Instant], [Remove one active negative
    divine effect from one of your cities], [500],
  )]
  , kind: table
  )

==== Ninhursag --- Earth, Fertility, Healing
<ninhursag--earth-fertility-healing>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Earth\'s Embrace];], [Instant], [Recover 15% of units lost
    in your last battle], [200],
    [#strong[Sacred Soil];], [Instant], [Stone and food production +25%
    in one city for 16h], [450],
    [#strong[Healer\'s Hand];], [Instant], [All armies garrisoned in
    your cities recover 10% of units lost in their most recent
    battle], [500],
    [#strong[Mother\'s Shield];], [Instant], [Target city\'s civilian
    militia spawns at double strength for next attack], [500],
  )]
  , kind: table
  )

=== 5.9 Egyptian Pantheon --- The Divine Order
<59-egyptian-pantheon--the-divine-order>
Egypt\'s eight gods are inseparable from statecraft. Ra\'s Divine
Radiance is the most powerful single divine action in the game for a
dedicated Egyptian monotheist --- it directly accelerates the Capital
compounding bonus that defines the civ.

==== Ra / Amun-Ra --- Sun, Creation, Supreme Authority
<ra--amun-ra--sun-creation-supreme-authority>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Solar Disc];], [Instant], [All production in your Capital
    \+25% for 12h], [250],
    [#strong[Sunstrike];], [Delayed (3h)], [Target enemy city loses 2
    effective City Walls levels for 12h], [500],
    [#strong[Eye of Ra];], [Instant], [Reveal all enemy armies currently
    moving on the same island as your Capital for 6h], [500],
    [#strong[Divine Radiance];], [Instant], [Your Capital\'s compounding
    bonus advances by 3 extra days instantly], [500],
  )]
  , kind: table
  )

==== Osiris --- Underworld, Afterlife, Rebirth
<osiris--underworld-afterlife-rebirth>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Passage Rite];], [Instant], [15% of units lost in last
    battle return as garrison troops], [275],
    [#strong[Green Flood];], [Instant], [Food production +35% across all
    cities for 12h], [500],
    [#strong[Resurrection];], [Delayed (8h)], [One destroyed building in
    one city rebuilt at no resource cost], [500],
  )]
  , kind: table
  )

==== Isis --- Magic, Protection, Healing
<isis--magic-protection-healing>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Veil of Isis];], [Passive (ongoing)], [Enemy espionage
    reports on this city hide 25% of stationed units (randomly
    sampled)], [0],
    [#strong[Healing Knot];], [Instant], [Remove one active negative
    divine effect from target city], [500],
    [#strong[Wings of Protection];], [Instant], [One city immune to
    conquest for 30 minutes], [500],
    [#strong[Isis\'s Knot];], [Conditional], [If Capital is attacked,
    all marching armies return to it at double speed], [500],
  )]
  , kind: table
  )

==== Horus --- Sky, Kingship, War
<horus--sky-kingship-war>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Falcon\'s Eye];], [Instant], [Your next attacking army\'s
    formation hidden from defender\'s espionage], [275],
    [#strong[Eye of Horus];], [Instant], [Attacking army gains +15%
    attack and +10% defense for one battle], [450],
    [#strong[Divine Kingship];], [Instant], [All enemy spies in your
    Capital auto-fail silently for 12h], [500],
  )]
  , kind: table
  )

==== Anubis --- Death, Passage, Judgment
<anubis--death-passage-judgment>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Jackal\'s Warning];], [Instant], [Select one specific
    incoming attack on one of your cities; that army\'s formation is
    revealed immediately], [100],
    [#strong[Embalmer\'s Art];], [Instant], [Military units in one city
    cannot be reduced below 1 unit in next battle], [500],
    [#strong[Scales of Ma\'at];], [Instant], [Randomly reveal target
    enemy city\'s complete building composition or garrison], [500],
  )]
  , kind: table
  )

==== Thoth --- Wisdom, Writing, Moon
<thoth--wisdom-writing-moon>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Sacred Script];], [Instant], [Construction speed +25% in
    target city for 8h], [225],
    [#strong[Ibis Guard];], [Instant], [Your next outgoing spy missions
    cost 35% fewer resources], [200],
    [#strong[Scroll of Ages];], [Instant], [Reveal target enemy\'s
    garrison composition or resource stockpiles simultaneously], [500],
  )]
  , kind: table
  )

==== Ptah --- Crafts, Creation, Architecture
<ptah--crafts-creation-architecture>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Craftsman\'s Hand];], [Instant], [Construction speed +15%
    in one city for 12h], [275],
    [#strong[Master Builder];], [Instant], [All cities construction
    speed +15% for 6h], [500],
    [#strong[Memphis Foundation];], [Instant], [Next building
    constructed in your Capital costs 25% fewer resources], [400],
    [#strong[Eternal Monument];], [Instant], [One random building in
    your Capital cannot be damaged for 48h], [200],
  )]
  , kind: table
  )

==== Hathor --- Love, Beauty, Joy, Fertility
<hathor--love-beauty-joy-fertility>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[House of Joy];], [Instant], [Grants 1 bonus Culture Points
    to one city immediately], [500],
    [#strong[Dance of Hathor];], [Instant], [All cities gain +10% food
    production for 24h], [400],
    [#strong[Golden Sistrum];], [Instant], [Fake march --- ghost army
    appears marching toward target; vanishes harmlessly], [425],
  )]
  , kind: table
  )

=== 5.10 Roman Pantheon --- The Dii Consentes
<510-roman-pantheon--the-dii-consentes>
Rome\'s eleven gods feel institutionally distinct from Greece --- civic
force, military organization, state continuity. Rome\'s syncretic
passive (adopt one allied civilization\'s divine power) makes their
pantheon the most diplomatically flexible.

==== Jupiter --- Sky, Justice, State Authority
<jupiter--sky-justice-state-authority>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Capitoline Shield];], [Instant], [City walls gain +25%
    defense for 12h], [250],
    [#strong[Omen of Victory];], [Conditional], [If your army attacks
    within 12h, they deal +15% damage], [500],
    [#strong[Triumph Declared];], [Instant], [All military units
    empire-wide +10% attack and +10% defense for 6h], [500],
  )]
  , kind: table
  )

==== Juno --- Marriage, State, Watchfulness
<juno--marriage-state-watchfulness>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Sacred Geese];], [Conditional], [If Capital targeted by
    espionage within 12h, notified before mission completes], [225],
    [#strong[Matrimonial Bond];], [Instant], [Reveal target enemy\'s
    garrison and formation if army is currently marching], [475],
    [#strong[Juno\'s Wrath];], [Instant], [Target enemy city\'s military
    training speed −25% for 12h], [500],
  )]
  , kind: table
  )

==== Minerva --- Wisdom, Crafts, Strategic Planning
<minerva--wisdom-crafts-strategic-planning>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Tactical Clarity];], [Instant], [Reveal target city\'s
    garrison for 24h], [275],
    [#strong[Athenaeum];], [Instant], [Construction speed +40%
    empire-wide for 6h], [500],
    [#strong[Master Stratagem];], [Instant], [Your next army dispatch
    cannot be detected by any watchtower or spy for 6h], [500],
  )]
  , kind: table
  )

==== Mars --- War, Agriculture, Guardianship
<mars--war-agriculture-guardianship>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[War Season];], [Instant], [Attacking army deals +20% damage
    for one battle], [275],
    [#strong[Agrarian Blessing];], [Instant], [Food and metal production
    \+20% across all cities for 8h], [500],
    [#strong[Shield of Rome];], [Instant], [Defending garrison gains
    \+25% defense for one battle], [500],
    [#strong[Legion\'s Fury];], [Instant], [All Legionary units
    empire-wide gain +20% attack for 8h], [500],
  )]
  , kind: table
  )

==== Venus --- Love, Prosperity, Victory
<venus--love-prosperity-victory>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Favor of Venus];], [Instant], [Grants 35 bonus Culture
    Points to one city immediately], [200],
    [#strong[Golden Peace];], [Instant], [Fake march --- ghost army
    appears marching toward target; vanishes on arrival], [450],
    [#strong[Victoria\'s Crown];], [Conditional], [If you win a battle
    within 12h, Favor pool refills 20%], [500],
  )]
  , kind: table
  )

==== Apollo --- Sun, Prophecy, Healing
<apollo--sun-prophecy-healing-1>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Augury];], [Instant], [Reveal formation of next army
    marching toward one of your cities], [275],
    [#strong[Physician\'s Art];], [Instant], [Recover 25% of units lost
    in your last battle], [500],
    [#strong[Sibylline Verse];], [Conditional], [If enemy attacks within
    24h, garrison\'s first combat round deals +25% damage], [500],
  )]
  , kind: table
  )

==== Diana --- Hunt, Moon, Wilderness
<diana--hunt-moon-wilderness>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Hunter\'s Path];], [Instant], [One army moves +35% faster
    for 12h], [225],
    [#strong[Silver Arrow];], [Instant], [Archers in next battle deal
    \+30% damage], [500],
    [#strong[Wild Hunt];], [Instant], [Enemy army retreating from your
    territory takes +15% additional casualties], [500],
  )]
  , kind: table
  )

==== Vulcan --- Fire, Forge, Destruction
<vulcan--fire-forge-destruction>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Forge Heat];], [Instant], [Metal production +40% for
    12h], [225],
    [#strong[Divine Armament];], [Instant], [Next military unit batch
    trained gains +15% unit count], [500],
    [#strong[Volcanic Rage];], [Delayed (4h)], [Target enemy city loses
    2 effective City Walls levels for 12h], [500],
  )]
  , kind: table
  )

==== Vesta --- Hearth, Home, State Continuity
<vesta--hearth-home-state-continuity>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Eternal Flame];], [Passive (ongoing)], [While Vesta
    worshipped in Capital, Culture Points generated +15%], [150/day],
    [#strong[Sacred Hearth];], [Instant], [Food production +30% across
    all cities for 12h], [450],
    [#strong[Vestal Guard];], [Instant], [Your Capital cannot be
    captured (only raided) for 24h], [500],
  )]
  , kind: table
  )

==== Mercury --- Commerce, Speed, Trickery
<mercury--commerce-speed-trickery>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Winged Sandals];], [Instant], [One army moves +40% faster
    for 8h], [225],
    [#strong[Merchant\'s Hand];], [Instant], [Gold production +35%
    empire-wide for 12h], [500],
    [#strong[Mercury\'s Veil];], [Instant], [Your next army dispatch
    hidden from all enemy watchtowers for 8h], [500],
    [#strong[Ghost Legion];], [Instant], [Fake march --- full ghost army
    appears marching toward target; vanishes on arrival], [500],
  )]
  , kind: table
  )

==== Neptune --- Sea, Earthquakes, Horses
<neptune--sea-earthquakes-horses>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Sea Roads];], [Instant], [Naval units +35% speed for
    8h], [225],
    [#strong[Cavalry Blessing];], [Instant], [Cavalry units deal +25%
    damage for one battle], [500],
    [#strong[Earthshaker];], [Delayed (4h)], [Target enemy city loses 2
    effective City Walls levels for 12h; garrison reduced 10%], [500],
  )]
  , kind: table
  )

=== 5.11 Maya Pantheon --- The Lords of Creation
<511-maya-pantheon--the-lords-of-creation>
Maya\'s seven gods are the most mechanically distinct. Several use
#strong[sacrifice costs] --- paying population or military units instead
of Favor, feeding the blood sacrifice loop. Maya divine powers trend
toward high cost, high impact.

==== Itzamná --- Creation, Sky, Writing
<itzamná--creation-sky-writing>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Primordial Script];], [Instant], [Construction speed +40%
    in one city for 8h], [225],
    [#strong[World Tree];], [Instant], [Remove all active negative
    divine effects from all your cities simultaneously], [500],
    [#strong[Creator\'s Hand];], [Instant], [All production empire-wide
    \+20% for 12h], [500],
  )]
  , kind: table
  )

==== Kukulcán --- Wind, Feathered Serpent, Learning
<kukulcán--wind-feathered-serpent-learning>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Serpent Wind];], [Instant], [One army moves +40% faster for
    12h], [250],
    [#strong[Feathered Veil];], [Instant], [Your next army dispatch
    hidden from all enemy watchtowers for 8h], [500],
    [#strong[Descent of Kukulcán];], [Instant], [Your next battle result
    sent to you 4h before it resolves --- time to reinforce or
    recall], [500],
  )]
  , kind: table
  )

==== Ix Chel --- Moon, Medicine, Fate
<ix-chel--moon-medicine-fate>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Moon\'s Mercy];], [Instant], [Recover 20% of units lost in
    your last battle], [225],
    [#strong[Silver Thread];], [Instant], [Reveal target enemy\'s
    garrison composition and resource stockpiles], [500],
    [#strong[Loom of Fate];], [Conditional], [If your city is attacked
    within 12h, attacker\'s formation revealed before battle
    resolves], [500],
    [#strong[Unweaving];], [Instant], [Remove one active negative divine
    effect from one of your cities], [500],
  )]
  , kind: table
  )

==== Chaac --- Rain, Lightning, Agriculture
<chaac--rain-lightning-agriculture>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Rain Blessing];], [Instant], [Food production +40% in one
    city for 12h], [225],
    [#strong[Lightning Axe];], [Instant], [Enemy city\'s food production
    −35% for 18h], [500],
    [#strong[Blood Rain];], [Instant], [Food +60% all cities for 24h AND
    all Favor pools refill 15%], [500],
  )]
  , kind: table
  )

==== Kinich Ahau --- Sun, Jaguar, Fire
<kinich-ahau--sun-jaguar-fire>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Solar Jaguar];], [Instant], [Attacking army +20% attack for
    one battle], [275],
    [#strong[Lord\'s Gaze];], [Instant], [All production in one city
    \+25% for 12h], [500],
    [#strong[Descent and Return];], [Passive], [If your city is
    captured, first building enemy constructs there collapses on
    completion], [0],
    [#strong[Descent into Xibalba];], [Passive], [If your city attacked
    between server 20:00--06:00, garrison fights at +25%
    effectiveness], [0],
  )]
  , kind: table
  )

==== Huracan --- Storms, Wind, Destruction
<huracan--storms-wind-destruction>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Heart of Sky];], [Instant], [Enemy army targeting your city
    slowed 25% for 12h], [275],
    [#strong[Whirlwind];], [Instant], [One enemy city\'s construction
    queue paused for 6h], [500],
    [#strong[World Destroyer];], [Instant], [Target enemy city loses 15%
    of all resource stockpiles simultaneously], [500],
  )]
  , kind: table
  )

==== Yum Kaax --- Maize, Forest, Sustenance
<yum-kaax--maize-forest-sustenance>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Power], [Type], [Effect], [Favor Cost],),
    table.hline(),
    [#strong[Maize Gift];], [Instant], [Food production +35% empire-wide
    for 8h], [200],
    [#strong[Forest Veil];], [Instant], [Enemy city\'s military training
    speed -25% for 12h], [450],
    [#strong[Green Canopy];], [Instant], [Your next army dispatch cannot
    be detected by watchtowers for 12h], [500],
    [#strong[Abundance Cycle];], [Conditional], [Every time your food
    storage hits maximum capacity, 10% of overflow converts to Favor for
    all active Maya gods], [500],
  )]
  , kind: table
  )

=== 5.12 Divine System Data Schema
<512-divine-system-data-schema>
```toml
# config/gods/poseidon.toml
[god]
id     = "poseidon"
civilization    = "greece"
name   = "Poseidon"
domain = "Sea, Naval Power, Earthquakes"
icon   = "assets/gods/poseidon/icon.png"

# Favor production: √(Σ effective_levels) × world_speed
# Hard cap: 500 (global, no scaling)

[[power]]
id                  = "favorable_winds"
type                = "instant"          # instant | delayed | conditional
targeting           = "self"             # self | self_army | enemy_city | enemy_army
favor_cost          = 225
# No cooldown_hours — no cooldowns exist
effects             = [{ target = "naval_speed", modifier = 0.40, duration_hours = 8 }]
# hostile = false → does not trigger city protection on target

[[power]]
id                  = "tridents_call"
type                = "instant"
targeting           = "enemy_city"
favor_cost          = 500
hostile             = true
protection_duration_hours = 12           # city protection window after this lands
effects             = [{ target = "incoming_naval_speed", modifier = -0.30, duration_hours = 12 }]

[[power]]
id                  = "sea_dominion"
type                = "instant"
targeting           = "self_army"
favor_cost          = 500
effects             = [{ target = "naval_damage", modifier = 0.25, scope = "next_battle" }]
defensive_effect_type = "naval_damage_buff"  # prevents stacking same type on same city

[[power]]
id                  = "earthquake"
type                = "delayed"
targeting           = "enemy_city"
favor_cost          = 500
delay_hours         = 4
hostile             = true
protection_duration_hours = 24
effects             = [{ target = "effective_wall_levels", modifier = -2, duration_hours = 12 }]
```

#strong[Key schema rules:]

- `hostile = true` → landing this power starts the target city\'s
  universal protection timer
- `protection_duration_hours` → how long that protection lasts (defined
  per power, scales with severity)
- `defensive_effect_type` → string key used to prevent stacking; two
  powers with the same key cannot both be active on the same city
  simultaneously
- No `cooldown_hours` field exists --- omitted by design
