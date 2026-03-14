= 0 C.E. --- Farm
<0-ce--farm>
#link("../chapters/Buildings-and-Wonders.typ")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Farm],
    [#strong[Max Level];], [45],
    [#strong[Effects];], [Food production, Militia cap],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
food_per_hour = base_food_h × (1 + food_a × L^food_p)
militia_cap   = base_militia + militia_per_l × L
```

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Coefficient], [Value],),
    table.hline(),
    [`food_a`], [0.045],
    [`food_p`], [1.10],
    [`militia_per_l`], [4],
  )]
  , kind: table
  )

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Resource], [Base], [α], [growth],),
    table.hline(),
    [Wood], [80], [1.12], [1.06],
    [Stone], [30], [1.12], [1.06],
  )]
  , kind: table
  )

== Upgrade Time
<upgrade-time>
```
upgrade_time_seconds(L) = base_time × time_growth^(L−1)
final_time = upgrade_time_seconds / senate_speed_multiplier / world_speed_multiplier
```

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Parameter], [Value],),
    table.hline(),
    [`base_time`], [60 s],
    [`time_growth`], [1.075],
  )]
  , kind: table
  )

== Starting Levels
<starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Mode], [Starting Level],),
    table.hline(),
    [Standard], [1],
    [Fast], [4],
    [Game Night], [8],
  )]
  , kind: table
  )
