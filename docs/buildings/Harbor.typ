= 0 C.E. --- Harbor
<0-ce--harbor>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Harbor],
    [#strong[Max Level];], [35],
    [#strong[Effects];], [Ship training speed (naval garrison only)],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
ship_train_time_mult = 1 / (1 + a_harbor × ln(1 + L))
```

Logarithmic curve --- early Harbor levels give the largest speed gains.

Coefficients are defined in `config/buildings/harbor.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/harbor.toml`.

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
- All naval units are trained, stored, and managed in the Harbor
  garrison context.
- Land units are managed separately in the
  #link("Building-Barracks.pdf")[Barracks] garrison.
- See #link("../chapters/Military.pdf")[Military] for naval unit types and combat
  rules.
