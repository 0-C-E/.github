= 0 C.E. --- Foundry
<0-ce--foundry>
#link("../chapters/Buildings-and-Wonders.typ")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Foundry],
    [#strong[Max Level];], [40],
    [#strong[Effects];], [Metal production],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
metal_per_hour = base_metal_h × (1 + a_foundry × L^p_foundry)
```

Coefficients are defined in `config/buildings/foundry.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/foundry.toml`.

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
    [Game Night], [6],
  )]
  , kind: table
  )
