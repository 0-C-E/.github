= 0 C.E. --- City Walls
<0-ce--city-walls>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Walls],
    [#strong[Max Level];], [35],
    [#strong[Effects];], [Passive defender bonus and wall HP when
    attacked],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
defense_mult = 1 + a_walls × L^p_walls
wall_hp      = base_wall_hp × (1 + b_walls × L^q_walls)
```

Both the defender combat bonus and the wall\'s own hit points scale with
level.

Coefficients are defined in `config/buildings/city_walls.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/city_walls.toml`.

== Upgrade Time
<upgrade-time>
```
upgrade_time_seconds(L) = base_time × time_growth^(L−1)
final_time = upgrade_time_seconds / senate_speed_multiplier / world_speed_multiplier
```

== Starting Levels
<starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Mode], [Starting Level],),
    table.hline(),
    [Standard], [0],
    [Fast], [2],
    [Game Night], [5],
  )]
  , kind: table
  )

== Notes
<notes>
- The #link("Building-Watchtower.pdf")[Watchtower] special building further
  multiplies `defense_mult`.
- Wall HP is a passive layer; walls must be breached before the city
  itself can be attacked at full strength.
- See #link("../chapters/Military.pdf")[Military] for siege and assault mechanics.
