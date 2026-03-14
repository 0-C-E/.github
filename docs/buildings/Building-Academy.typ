= 0 C.E. --- Academy
<0-ce--academy>
#link("../chapters/Buildings-and-Wonders.typ")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Academy],
    [#strong[Max Level];], [35 (hard cap --- ignores city tier bonuses
    beyond this)],
    [#strong[Effects];], [Research points per hour, research duration
    reduction],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
research_points_per_hour = base_rp_h × (1 + rp_a × L^rp_p)
research_time_mult       = 1 / (1 + duration_scale × ln(1 + L))
```

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Coefficient], [Value],),
    table.hline(),
    [`rp_a`], [0.05],
    [`rp_p`], [1.08],
    [`duration_scale`], [0.04],
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
    [Wood], [180], [1.15], [1.07],
    [Stone], [160], [1.15], [1.07],
    [Metal], [140], [1.15], [1.07],
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
    [`base_time`], [120 s],
    [`time_growth`], [1.08],
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
    [Standard], [0],
    [Fast], [1],
    [Game Night], [4],
  )]
  , kind: table
  )

== Notes
<notes>
- The Academy has a #strong[hard cap of 35] --- city tier bonuses do not
  raise this cap further.
- See #link("../chapters/Research.typ")[Research] for the full technology tree and
  research mechanics.
