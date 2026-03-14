= 0 C.E. - Buildings and Wonders
<0-ce---buildings-and-wonders>
#link("../nav/Home.pdf") | #link("Economy.pdf")[Previous] |
#link("Divine-System.pdf")[Next]

== 8. Buildings & Construction
<8-buildings--construction>
=== 8.1 Construction Queue & Mechanics
<81-construction-queue--mechanics>
- #strong[Queue model (Grepolis-like)];: one construction queue per city
- #strong[Construction progress];: real-time, one level at a time
  (`L -> L+1`)
- #strong[Resource cost];: paid upfront when queued; reserved
  immediately
- #strong[Cancellation];: queued or in-progress upgrades can be
  canceled; 50% resource refund
- #strong[Downgrade];: not voluntary; only damage/event systems may
  temporarily disable levels

Base upgrade duration is formula-based per building, then modified by
Senate level and world speed.

```
upgrade_time_seconds(B, L) = base_time_B * (time_growth_B ^ (L - 1))
final_time = upgrade_time_seconds / senate_speed_multiplier / world_speed_multiplier
```

No builder assignment minigame is used.

=== 8.2 Building Model
<82-building-model>
Every building occupies a fixed named slot, one per city, permanently.
There are no building tiers (T1/T2/T3). Buildings scale by level with
high caps (roughly 25 to 45 depending on building type).

This model intentionally avoids active-capacity unlocks from buildings
(extra training queues, extra research queues, etc.). Buildings provide
passive and formula-driven economic, defensive, and time modifiers.

Certain buildings are marked as special buildings. Special buildings can
be constructed when prerequisites are met but cannot be upgraded.

==== 8.2.1 Garrison Grouping
<821-garrison-grouping>
- #strong[Barracks garrison];: all land units are trained, stored, and
  managed in Barracks context
- #strong[Harbor garrison];: all naval units are trained, stored, and
  managed in Harbor context

Players can mix any available unit types in an attack, but city
management is split by land vs naval garrisons.

==== 8.2.2 Formula Conventions
<822-formula-conventions>
For each building and level `L`:

- `1 <= L <= cap_B`
- `cost_r(B, L) = round(base_r_B * L ^ alpha_r_B * growth_r_B ^ (L - 1))`
- `effect(B, L)` is building-specific (listed below)

Recommended balancing ranges:

- `alpha_r_B`: 1.05 to 1.25
- `growth_r_B`: 1.04 to 1.10

These values support long progression to level 25 to 45 without tier
breakpoints.

==== 8.2.3 City Tiers via Culture Level
<823-city-tiers-via-culture-level>
Cities may upgrade their city tier when they reach required development
milestones and a required culture level threshold. This is treated as a
city evolution step, not a building upgrade.

- Building levels do not reset on tier-up
- Tier-up raises max level caps for all upgradable buildings in that
  city
- Special buildings are excluded from cap increases (they remain
  non-upgradable)

Tier indexing is numeric and unbounded by design
(`tier = 1, 2, 3, ...`). There is no maximum city tier in rules.

Recommended model:

- City Tier 1: base caps
- Every tier above Tier 1: +10 cap to all upgradable buildings
- Buildings flagged with a hard cap ignore any tier bonus beyond that
  cap (example: Academy hard cap 35)

Formula:

```
effective_cap_B = min(hard_cap_B, base_cap_B + tier_cap_bonus(city_tier))
tier_cap_bonus(city_tier) = tier_step_bonus * max(0, city_tier - 1)
tier_step_bonus = 10
```

Why +10 per tier: with superlinear costs and diminishing efficiency per
level, this creates a meaningful late-game vertical strategy while still
preserving horizontal expansion advantages, while allowing long-horizon
worlds to continue scaling beyond Tier 3.

==== 8.2.4 City Foundation Starting Levels
<824-city-foundation-starting-levels>
When a city is founded, buildings do not all start at level 0. Each new
city is initialized from a #strong[game-mode starting profile];.

Rules:

- Starting levels are applied at foundation time only
- Starting levels can differ by game mode
- A profile cannot set any building above its effective cap
- Special buildings default to level 0 (unbuilt) unless a specific game
  mode grants one at level 1

Recommended default profiles:

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Building], [Standard World], [Fast World], [Game
      Night],),
    table.hline(),
    [Farm], [1], [4], [8],
    [Lumber Camp], [1], [3], [7],
    [Quarry], [1], [3], [7],
    [Foundry], [0], [2], [6],
    [Granary], [1], [3], [6],
    [Warehouse], [1], [3], [6],
    [Shrine / Temple], [0], [1], [3],
    [Senate], [1], [3], [6],
    [Market], [0], [2], [5],
    [Barracks], [1], [3], [6],
    [City Walls], [0], [2], [5],
    [Academy], [0], [1], [4],
    [Harbor], [0], [2], [5],
    [Siege Workshop (special)], [0], [0], [0],
    [Watchtower (special)], [0], [0], [0],
    [Divine Statue (special)], [0], [0], [0],
  )]
  , kind: table
  )

These are initialization targets, not balance locks; worlds may override
them through configuration.

=== 8.3 Complete Building Registry
<83-complete-building-registry>
==== 8.3.1 Upgradable Buildings
<831-upgradable-buildings>
All buildings below are standard upgradable buildings using level
progression and formulas. Civ-specific replacements still occupy the
same named slot.

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([Building], [Slot], [Cap (typical)], [Passive
      Effects], [Effect Formula Template],),
    table.hline(),
    [#link("../buildings/Building-Farm.pdf")[#strong[Farm];];], [Farm], [45], [Food
    production, Militia
    cap], [`food_h = base_food_h * (1 + a_farm * L^p_farm)`;
    `militia_cap = base_militia + b_farm * L`],
    [#link("../buildings/Building-Lumber-Camp.pdf")[#strong[Lumber Camp];];], [Lumber], [40], [Wood
    production], [`wood_h = base_wood_h * (1 + a_lumber * L^p_lumber)`],
    [#link("../buildings/Building-Quarry.pdf")[#strong[Quarry];];], [Quarry], [40], [Stone
    production], [`stone_h = base_stone_h * (1 + a_quarry * L^p_quarry)`],
    [#link("../buildings/Building-Foundry.pdf")[#strong[Foundry];];], [Foundry], [40], [Metal
    production], [`metal_h = base_metal_h * (1 + a_foundry * L^p_foundry)`],
    [#link("../buildings/Building-Granary.pdf")[#strong[Granary];];], [Granary], [35], [Food
    storage, Population cap], [`food_storage(L) = 250 + 80 × L^1.5`;
    `pop_cap(L) = 50 + 11 × L^1.5`],
    [#link("../buildings/Building-Warehouse.pdf")[#strong[Warehouse];];], [Warehouse], [35], [Non-food
    storage
    (wood/stone/metal)], [`warehouse_storage(L) = 300 + 100 × L^1.5`],
    [#link("../buildings/Building-Shrine-Temple.pdf")[#strong[Shrine / Temple];];], [Temple], [35], [Favor
    production], [`favor_h = base_favor_h * (1 + a_temple * L^p_temple)`],
    [#link("../buildings/Building-Senate.pdf")[#strong[Senate];];], [Senate], [30], [Building
    speed modifier], [`build_speed_mult = 1 + a_senate * ln(1 + L)`],
    [#link("../buildings/Building-Market.pdf")[#strong[Market];];], [Market], [30], [Trade
    capacity and trade
    throughput], [`trade_capacity = base_trade + b_market * L`;
    `trade_cooldown_mult = 1 / (1 + c_market * sqrt(L))`],
    [#link("../buildings/Building-Barracks.pdf")[#strong[Barracks];];], [Barracks], [35], [Land
    troop training speed (land garrison
    only)], [`land_train_time_mult = 1 / (1 + a_barracks * ln(1 + L))`],
    [#link("../buildings/Building-City-Walls.pdf")[#strong[City Walls];];], [Walls], [35], [Passive
    defender bonus when city is
    attacked], [`defense_mult = 1 + a_walls * L^p_walls`;
    `wall_hp = base_wall_hp * (1 + b_walls * L^q_walls)`],
    [#link("../buildings/Building-Academy.pdf")[#strong[Academy];];], [Academy], [35], [Research
    points; research duration
    reduction], [`research_points_h = base_rp_h * (1 + a_academy * L^p_academy)`;
    `research_time_mult = 1 / (1 + b_academy * ln(1 + L))`],
    [#link("../buildings/Building-Harbor.pdf")[#strong[Harbor];];], [Harbor], [35], [Ship
    training speed (naval garrison
    only)], [`ship_train_time_mult = 1 / (1 + a_harbor * ln(1 + L))`],
  )]
  , kind: table
  )

==== 8.3.2 Special Buildings (Non-Upgradable)
<832-special-buildings-non-upgradable>
Special buildings are separated from the main progression track. They
are built once at level 1 and never upgraded.

#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([Building], [Slot], [Cap], [Purpose], [Effect Formula
      Template],),
    table.hline(),
    [#link("../buildings/Building-Siege-Workshop.pdf")[#strong[Siege Workshop];];], [Siege
    Workshop], [1 (special)], [Enables siege weapon
    training], [`siege_unlocked = true`],
    [#link("../buildings/Building-Watchtower.pdf")[#strong[Watchtower];];], [Watchtower], [1
    (special)], [Improves City Walls bonus; intel
    radius/quality], [`effective_defense_mult = defense_mult * (1 + watchtower_bonus)`;
    `intel_radius = 20`],
    [#link("../buildings/Building-Divine-Statue.pdf")[#strong[Divine Statue];];], [Divine
    Statue], [1 (special)], [Additional Favor production
    multiplier], [`favor_h_final = favor_h * (1 + statue_favor_bonus)`],
  )]
  , kind: table
  )

Other special buildings can be added later using this same level-1
non-upgradable pattern.

Notes:

- #strong[No building tiers];: buildings do not use T1/T2/T3 tracks;
  only city tiers exist.
- #strong[No building-granted active capacity];: buildings do not grant
  extra training queues, extra research queues, or similar slot unlocks.
- #strong[Special buildings are separate by design];: they are listed in
  §8.3.2 and are always non-upgradable.

=== 8.4 Building Data Schema
<84-building-data-schema>
All buildings are data-driven in TOML with formula coefficients. No Rust
code changes are required to rebalance level curves.

```toml
# config/buildings/farm.toml
[building]
id         = "farm"
slot       = "farm"
max_level  = 45

[cost]
wood_base   = 80
stone_base  = 30
metal_base  = 0
food_base   = 0
favor_base  = 0
alpha       = 1.12
growth      = 1.06

[time]
base_seconds = 60
growth       = 1.075

[effects]
food_a        = 0.045
food_p        = 1.10
militia_per_l = 4

[formulas]
food_per_hour = "base_food_h * (1 + food_a * level^food_p)"
militia_cap   = "base_militia + militia_per_l * level"
```

```toml
# config/buildings/academy.toml
[building]
id         = "academy"
slot       = "academy"
max_level  = 40

[cost]
wood_base   = 180
stone_base  = 160
metal_base  = 140
food_base   = 0
favor_base  = 0
alpha       = 1.15
growth      = 1.07

[time]
base_seconds = 120
growth       = 1.08

[effects]
rp_a           = 0.05
rp_p           = 1.08
duration_scale = 0.04

[formulas]
research_points_per_hour = "base_rp_h * (1 + rp_a * level^rp_p)"
research_time_multiplier = "1 / (1 + duration_scale * ln(1 + level))"
```

```toml
# config/buildings/watchtower.toml
[building]
id          = "watchtower"
slot        = "watchtower"
is_special  = true
max_level   = 1

[cost]
wood_base   = 420
stone_base  = 520
metal_base  = 140
food_base   = 0
favor_base  = 0

[effects]
watchtower_bonus = 0.12
intel_radius     = 20

[formulas]
effective_defense_mult = "defense_mult * (1 + watchtower_bonus)"
```

```toml
# config/buildings/city_tiers.toml
[tiers]
tier_step_bonus = 10
tier_index_min = 1

[requirements]
culture_level_formula = "base_culture + culture_step * (city_tier - 1)"
base_culture = 1
culture_step = 1

[formulas]
tier_cap_bonus = "tier_step_bonus * max(0, city_tier - 1)"
effective_cap = "min(hard_cap, base_cap + tier_cap_bonus)"
```

```toml
# config/buildings/foundation_profiles.toml
[profiles.standard_world]
farm = 1
lumber_camp = 1
quarry = 1
foundry = 0
granary = 1
warehouse = 1
temple = 0
senate = 1
market = 0
barracks = 1
city_walls = 0
academy = 0
harbor = 0
siege_workshop = 0
watchtower = 0
divine_statue = 0

[profiles.fast_world]
farm = 4
lumber_camp = 3
quarry = 3
foundry = 2
granary = 3
warehouse = 3
temple = 1
senate = 3
market = 2
barracks = 3
city_walls = 2
academy = 1
harbor = 2
siege_workshop = 0
watchtower = 0
divine_statue = 0

[profiles.game_night]
farm = 8
lumber_camp = 7
quarry = 7
foundry = 6
granary = 6
warehouse = 6
temple = 3
senate = 6
market = 5
barracks = 6
city_walls = 5
academy = 4
harbor = 5
siege_workshop = 0
watchtower = 0
divine_statue = 0
```

=== 8.5 Wonders
<85-wonders>
Wonders are monumental constructions that reshape the balance of power
on their island. They are the game\'s most powerful persistent effects
--- and the most contested real estate on the map.

==== 8.5.1 Placement Rules
<851-placement-rules>
- Wonders can only be built on the #strong[top 10% largest islands] by
  land area in a world, capped at #strong[100 eligible islands] per
  world
- Any civilization can build any Wonder --- there are no civilization
  restrictions
- #strong[Multiple players may build the same Wonder] across different
  eligible islands --- uniqueness is per-island, not per-world
- Only one instance of each Wonder per island --- if The Eternal Pyre
  already stands on an island, no one else can build it there
- Wonder construction requires Era IV research completion and an
  enormous resource investment

==== 8.5.2 Island-Scoped Effects
<852-island-scoped-effects>
Wonder effects apply to #strong[all players whose cities are on the same
island as the Wonder] --- owner and enemies alike. This is the central
strategic tension: Wonders benefit your neighbors as much as you.
Holding a Wonder island means:

- You benefit fully from the Wonder\'s primary effect
- Every rival also settled on that island benefits too
- You must decide whether to fortify the Wonder city against seizure or
  negotiate coexistence with island neighbors
- Island neighbors have a strong incentive to let you keep the Wonder
  rather than let a distant enemy take it --- organic diplomacy emerges

When a Wonder city is captured, ownership transfers to the attacker. The
Wonder itself is #strong[indestructible] --- it cannot be demolished or
destroyed under any circumstances. The new owner receives the Wonder\'s
effect; the previous owner loses it.

==== 8.5.3 First Builder Distinction
<853-first-builder-distinction>
The player who completes a Wonder first on any island earns a
#strong[permanent cosmetic distinction];:

- Their name is inscribed as the Wonder\'s founder in the world history
  log
- The Wonder displays a unique founder marker on the map
- Their account Prestige receives a permanent bonus tied to that Wonder
- No mechanical advantage --- the distinction is historical and
  reputational

==== 8.5.4 Wonder Roster
<854-wonder-roster>
#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Wonder], [Island Effect], [Campaign Role],),
    table.hline(),
    [#strong[The Eternal Pyre];], [Favor generation +50% for all cities
    on this island], [Victory Wonder candidate],
    [#strong[The Tessellated Colossus];], [Military unit training speed
    \+30% for all cities on this island], [Victory Wonder candidate],
    [#strong[The Undying Archive];], [Construction speed +35% for all
    cities on this island; building level caps +2], [Victory Wonder
    candidate],
    [#strong[The Grand Thalasseum];], [Trade dispatch capacity +3 for
    all players on island; gold per trade +50%], [Victory Wonder
    candidate],
    [#strong[The Hanging Sanctum];], [Food production +40% for all
    cities on island; population cap +150 per city], [Victory Wonder
    candidate],
    [#strong[The Iron Mausoleum];], [All cities on island: +5 effective
    City Walls levels], [Victory Wonder candidate],
  )]
  , kind: table
  )

#strong[Design note];: Effects are deliberately island-scoped rather
than empire-wide to make Wonder islands genuinely valuable geography
rather than a build-anywhere bonus. Two players sharing a Wonder island
may find cooperation more profitable than war --- until the Campaign win
condition makes that calculus brutal.

#strong[Campaign Mode Wonder Hold];: One Wonder is designated the
#strong[Victory Wonder] at world creation, revealed to all players. The
first player or alliance to construct it and hold it without losing the
city for the configured duration (default: 7 days) wins the Campaign.
All six Wonders are eligible candidates; the designation is random per
world.
