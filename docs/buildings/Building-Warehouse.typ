= 0 C.E. --- Warehouse
<0-ce--warehouse>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Warehouse],
    [#strong[Max Level];], [35],
    [#strong[Effects];], [Non-food resource storage (Wood, Stone, Metal,
    Gold, Favor)],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
warehouse_storage(L) = 300 + 100 × L^1.5
```

`L = 0` (unbuilt) gives warehouse\_storage = 300.

Resources above the cap are lost on overflow; this prevents passive
hoarding.

Wonder bonus is additive on top of this formula (+25,000 on Wonder
island).

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/warehouse.toml`.

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
    [Game Night], [6],
  )]
  , kind: table
  )

== Notes
<notes>
- Food has its own storage building: the
  #link("Building-Granary.pdf")[Granary];.
- A city can have both a Granary and a Warehouse; they apply to separate
  resource pools.
