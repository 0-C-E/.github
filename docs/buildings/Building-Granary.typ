= 0 C.E. --- Granary
<0-ce--granary>
#link("../chapters/Buildings-and-Wonders.typ")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Granary],
    [#strong[Max Level];], [35],
    [#strong[Effects];], [Food storage, Population cap],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
food_storage(L)  = 250 + 80  × L^1.5
population_cap(L) = 50 + 11  × L^1.5
```

`L = 0` (unbuilt) gives food\_storage = 250, population\_cap = 50.

The full population cap with external modifiers:

```
population_cap_total = population_cap(L) + divine_bonus + special_building_bonus
```

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/granary.toml`.

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
- Food uses the Granary storage line; all other resources use the
  #link("Building-Warehouse.typ")[Warehouse];.
- A city can have both a Granary and a Warehouse; they apply to separate
  resource pools.
- Population cap constants (`50` and `11`) are exposed in `world.toml`
  for balancing.
