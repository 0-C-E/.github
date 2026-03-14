= 0 C.E. --- Shrine / Temple
<0-ce--shrine--temple>
#link("../chapters/Buildings-and-Wonders.typ")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Temple],
    [#strong[Max Level];], [35],
    [#strong[Effects];], [Favor production],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
favor_per_hour = base_favor_h × (1 + a_temple × L^p_temple)
```

Coefficients are defined in `config/buildings/temple.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/temple.toml`.

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
    [Fast], [1],
    [Game Night], [3],
  )]
  , kind: table
  )

== Notes
<notes>
- Favor is consumed by the Divine System (see
  #link("../chapters/Divine-System.typ")[Divine System];).
- The #link("Building-Divine-Statue.typ")[Divine Statue] special building
  multiplies the output of this building.
