= 0 C.E. - Economy
<0-ce---economy>
#link("../nav/Home.pdf") | #link("World-and-Civilizations.pdf")[Previous] |
#link("Buildings-and-Wonders.pdf")[Next]

== 6. Resource Economy
<6-resource-economy>
=== 6.1 Core Resources
<61-core-resources>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto, auto, auto, auto),
    table.header([Resource], [Symbol], [Source], [Scarcity]),
    table.hline(),
    [Food], [🌾], [Tile-scan passive], [Abundant],
    [Wood], [🪵], [Tile-scan passive], [Abundant],
    [Stone], [🪨], [Tile-scan passive], [Common],
    [Metal], [⛏️], [Tile-scan passive], [Scarce],
    [Gold], [💰], [One-time founding gift + trade], [Node-based],
    [Favor], [✨], [Temple buildings], [Generated],
  )],
  kind: table,
)

No production chains. Resources are spent directly on buildings and
units with no intermediate processing step.

=== 6.2 Tile-Scan Resource Production
<62-tile-scan-resource-production>
Each city\'s passive production profile is #strong[computed once at
  world generation time] by scanning a circular radius of 6 tiles around
the city slot (radius constant: `CITY_SCAN_RADIUS = 6`, producing
approximately 113 scanned tiles). The result --- stored as
`CityResources` in the world file --- is the #strong[permanent
  production profile] for that city. It never changes.

#strong[This is a design constraint, not a limitation.] Fixed profiles
make city placement a permanent strategic decision: you cannot farm a
bad location into a good one. Scouting terrain before settling is the
highest-leverage early-game action.

The five passive resources (Food, Wood, Stone, Metal, Favor) are stored
as signed `i16` percentage modifiers, averaged across all scanned tiles.
A city surrounded by Forest tiles will have a high Wood modifier and low
Stone modifier. A city near Sacred Grove tiles will have a strong Favor
modifier.

#strong[Gold is a one-time founding gift.] When a city is founded on a
slot, the world generator\'s `gold_nodes: u8` count for that slot is
converted into an immediate gold deposit credited to the player\'s city
treasury. A city slot with 3 gold nodes gives a larger founding windfall
than one with 0. After that moment, `gold_nodes` has no further effect
--- there is no passive gold income from nodes.

```
gold_founding_gift = gold_nodes × gold_node_value
gold_node_value    = 50  (configurable in world.toml)
```

Gold after founding comes exclusively from trade. Cities with rich gold
node counts give their founders a meaningful early-game resource
advantage --- enough to jump-start their first buildings --- but the
advantage does not compound forever. This keeps the gold economy
trading-dependent at all stages of the game.

=== 6.3 Production Formula
<63-production-formula>
```
resource_per_hour = base_rate
                  × (1 + tile_scan_modifier / 100)
                  × building_level_multiplier
                  × civ_passive_modifier
                  × era_multiplier
                  × world_speed_multiplier
                  − upkeep_per_hour
```

`tile_scan_modifier` is the `i16` value from `CityResources` --- a value
of `+30` means 30% production bonus from terrain, `-15` means 15%
penalty. The formula is multiplicative: civilization passives and era
bonuses compound on top of terrain advantages.

=== 6.4 Resource Storage Caps
<64-resource-storage-caps>
Storage caps apply per-resource. Resources above cap are lost
(overflow). This prevents passive hoarding and keeps active players
advantaged over idle ones.

```py
warehouse_storage(level) = 300 + 100 × level^1.5
granary_storage(level)   = 250 + 80  × level^1.5
```

Where `level` is the current building level for that storage line (0 if
unbuilt). Food uses `granary_storage(level)`. Wood, Stone, Metal, Gold,
and Favor use `warehouse_storage(level)`.

Wonder bonus remains additive:

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Condition], [Bonus]),
    table.hline(),
    [Wonder bonus], [+25,000 on Wonder island],
  )],
  kind: table,
)

Food has its own storage building line (Granary). All other resources
share the Warehouse line. A city can have both a Granary and a Warehouse
--- they stack independently.

=== 6.5 Multiple Cities & Founding Cost Scaling
<65-multiple-cities--founding-cost-scaling>
Each city beyond the first carries escalating founding costs and
maintenance. Cultural Level slots gate access (§9.6), so the economic
scaling is the second constraint on expansion.

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header(
      [City number],
      [Founding cost multiplier],
      [Per-city
        maintenance multiplier],
    ),
    table.hline(),
    [1st], [--- (starting city)], [1.0×],
    [2nd], [1.5× base], [1.3×],
    [3rd], [2.5× base], [1.7×],
    [4th], [4.0× base], [2.5×],
    [5th+], [+2.0× per city], [+1.0× per city],
  )],
  kind: table,
)

Rome\'s Provincial Administration passive reduces maintenance
multipliers (see §5.6). All other civs use these defaults.

== 7. Population & Builder System
<7-population--builder-system>
=== 7.1 Population as a Hard Cap
<71-population-as-a-hard-cap>
Population is a #strong[ceiling];, not a consumable resource. It limits
what can simultaneously exist in a city. Population itself is not spent
on anything --- it determines the maximum count of builders, military
units in garrison, and city tier eligibility.

#strong[Population scale];: Grepolis-inspired. A fresh city starts at
roughly 100--200 population and a well-developed city can reach much
higher caps. Exact peaks depend on Granary investment, divinity
passives, and special buildings.

=== 7.2 Population Cap Formula
<72-population-cap-formula>
Population cap scales with Granary level.

```
population_cap(level) = 50 + 11 × level^1.5
```

Where `level` is the current Granary level (0 if unbuilt).

The total city cap can then be extended by external modifiers:

```
population_cap_total = population_cap(granary_level)
               + divine_bonus
               + special_building_bonus

Where:
  granary_level     = current Granary level
  divine_bonus      = Favor power effects (god-specific, e.g. Demeter)
  special_building_bonus = e.g. Rome Aqueduct adds +25% of current cap after formula
```

#strong[Population cap by Granary level, no bonuses:]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Granary level], [pop\_cap]),
    table.hline(),
    [0], [50],
    [1], [61],
    [2], [81],
    [3], [107],
  )],
  kind: table,
)

With Rome Aqueduct at Granary level 3: `107 × 1.25 = 133.75` (typically
rounded by game rules). With a Demeter divine bonus of +100:
`133.75 + 100 = 233.75`.

This is a superlinear curve (`level^1.5`), so each additional Granary
level gives more cap than the previous one.

The constants (`50` and `11`) should be exposed in `world.toml` for
balancing.

=== 7.3 Population Growth
<73-population-growth>
Current population grows toward the cap organically. There is no
happiness stat --- growth is driven purely by food surplus and cultural
investment.

```
growth_per_hour = base_growth_rate
                × food_surplus_modifier
                × cultural_level_modifier
```

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Condition], [Modifier]),
    table.hline(),
    [Food surplus \> 20% of consumption], [+15% growth],
    [Food surplus 0--20%], [×1.0 (normal)],
    [Food deficit (any)], [−25% growth],
    [Sustained food deficit (\>12h)], [Population begins declining],
    [Active war: enemy army in city territory], [−10% growth],
    [Cultural Level milestone achieved (last 24h)], [+10% growth],
  )],
  kind: table,
)

There is no rebellion mechanic. A starving city stops growing then
shrinks. Recovery begins immediately when food surplus is restored.

=== 7.4 Free Population & Builders
<74-free-population--builders>
Population not committed to military units is #strong[free population];.
A fixed ratio of free population becomes #strong[Builders] automatically
--- no player action required.

```
builders = floor(free_population / builder_ratio)
builder_ratio = 5  (configurable in world.toml)
```

Builders drive construction speed. Each builder assigned to an active
project reduces that project\'s remaining time.

#strong[Builder assignment --- two modes:]

- #strong[Auto (default)];: Builders distribute evenly across the active
  construction queue. Casual players never need to change this.
- #strong[Manual override];: Players can pin builders to a specific
  project (rush it), hold them idle (reserve for a future rush), or
  split by percentage weight. Manual override is a power-user feature
  --- it is not required to play.

#strong[Construction speed formula:]

```
construction_time = base_time / (1 + assigned_builders × builder_speed_factor)
builder_speed_factor = 0.1  (each builder reduces time by ~9% on top of prior builders)
```

This is a diminishing-returns formula --- going from 0 to 5 builders
cuts time roughly in half; going from 10 to 15 builders adds much less.
There is no hard cap on builder assignment, but returns flatten steeply
after \~15 builders on a single project.
