= 0 C.E. --- Lumber Camp
<0-ce--lumber-camp>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Lumber],
    [#strong[Max Level];], [40],
    [#strong[Effects];], [Wood production],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
wood_per_hour = base_wood_h × (1 + a_lumber × L^p_lumber)
```

Coefficients are defined in `config/buildings/lumber_camp.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/lumber_camp.toml`.

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
    [Standard], [1],
    [Fast], [3],
    [Game Night], [7],
  )]
  , kind: table
  )
