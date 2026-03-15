= 0 C.E. --- Senate
<0-ce--senate>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Senate],
    [#strong[Max Level];], [30],
    [#strong[Effects];], [Building speed modifier],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
build_speed_multiplier = 1 + a_senate × ln(1 + L)
```

This is a logarithmic curve --- early Senate levels give the largest
speed gains; returns diminish at high levels.

Coefficients are defined in `config/buildings/senate.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/senate.toml`.

== Upgrade Time
<upgrade-time>
```
upgrade_time_seconds(L) = base_time × time_growth^(L−1)
final_time = upgrade_time_seconds / senate_speed_multiplier / world_speed_multiplier
```

Note: the Senate\'s own multiplier applies to all building upgrades,
including itself.

== Starting Levels
<starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Mode], [Starting Level],),
    table.hline(),
    [Standard], [1],
    [Fast], [3],
    [Game Night], [6],
  )]
  , kind: table
  )
