= 0 C.E. --- Barracks
<0-ce--barracks>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Barracks],
    [#strong[Max Level];], [35],
    [#strong[Effects];], [Land troop training speed (land garrison)],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
land_train_time_mult = 1 / (1 + a_barracks × ln(1 + L))
```

Logarithmic curve --- early Barracks levels give the largest speed
gains.

Coefficients are defined in `config/buildings/barracks.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/barracks.toml`.

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
- All land units are trained, stored, and managed in the Barracks
  garrison context.
- Naval units are managed separately in the
  #link("Building-Harbor.pdf")[Harbor] garrison.
- Siege weapons require the
  #link("Building-Siege-Workshop.pdf")[Siege Workshop] special building to
  unlock.
- See #link("../chapters/Military.pdf")[Military] for unit types and combat rules.
