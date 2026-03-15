= 0 C.E. - Cultural Events <0-ce---cultural-events>
#link("../nav/Home.pdf") | #link("Divine-System.pdf")[Previous] |
#link("Military.pdf")[Next]

== 9. Divine System & Favor <9-divine-system--favor>
#quote(block: true)[
  This section is part of the Divine System. For the core rules, Favor
  mechanics, pantheons, and divine powers, see
  #strong[#link("Divine-System.pdf")[Divine System];];.
]

=== 9.6 Cultural Events & City Progression <96-cultural-events--city-progression>
Happiness does not exist in 0 C.E. #strong[Cultural Events] replace it
entirely --- player-initiated activities generating #strong[Culture
Points] that accumulate into #strong[Cultural Levels];.

#strong[Cultural Levels unlock (one level = one action):]

- #strong[City Slot];: Spend one level to gain one slot (found a new
  city OR upgrade an existing city\'s tier)
- #strong[Research Undo];: Spend one level to reverse one completed
  technology

#strong[Cultural Level cost scaling (soft cap):]

```
culture_points_required(level N) = base_cost × N^1.5
```

#strong[City Tiers (Model B):]

- All cities start at Tier 1
- Each tier upgrade (costs one city slot) raises building level caps by
  a variable amount per building
- Some buildings have absolute maximum levels regardless of tier
- Total building damage exceeding a threshold triggers automatic tier
  downgrade

#strong[The strategic fork:]

- #strong[Expansionist];: cultural levels → new city slots → more
  cities, more production, more Favor sources
- #strong[Mega-base builder];: cultural levels → tier upgrades → fewer,
  deeper, dramatically more powerful cities

#strong[Cultural Events --- Base (all civs):]

#figure(align(center)[#table(
  columns: 4,
  align: (
    auto,
    auto,
    auto,
    auto,
  ),
  table.header(
    [Event],
    [Culture Points],
    [Resource Cost],
    [Duration],
  ),
  table.hline(), [City Festival],          [20], [Food + Gold],
  [12h],         [Grand Games],            [50], [Food + Wood + Gold],
  [24h],         [Theatrical Performance], [30], [Wood + Gold],
  [16h],         [Sacred Ceremony],        [40], [Gold + Favor (any god)],
  [20h],
)], kind: table)

#strong[Cultural Events --- Civ-Exclusive:]

#figure(align(center)[#table(
  columns: 4,
  align: (
    auto,
    auto,
    auto,
    auto,
  ),
  table.header(
    [Civ],
    [Event],
    [Culture Points],
    [Flavor],
  ),
  table.hline(), [Greece], [Olympic Games],       [80],
  [Requires Stadium special
  building],              [Sumer],  [Ziggurat Dedication], [60],
  [Requires Ziggurat; celebrates
  completed building tier],              [Egypt],  [Sed Festival],        [70],
  [Capital city only; Pharaoh\'s
  jubilee],              [Rome],   [Triumph],             [65],
  [Requires military victory within last 7
  days],              [Maya],   [Blood Rite],          [55],
  [Consumes population; generates Culture
  \+ Favor simultaneously],
)], kind: table)
