= 0 C.E. --- Market
<0-ce--market>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Upgradable],
    [#strong[Slot];], [Market],
    [#strong[Max Level];], [30],
    [#strong[Effects];], [Trade capacity and trade throughput],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
trade_capacity       = base_trade + b_market × L
trade_cooldown_mult  = 1 / (1 + c_market × sqrt(L))
```

Higher Market levels increase the number of concurrent trade routes and
reduce the cooldown between trades.

Coefficients are defined in `config/buildings/market.toml`.

== Cost
<cost>
```
cost_r(L) = round(base_r × L^alpha × growth^(L−1))
```

Coefficients are defined in `config/buildings/market.toml`.

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
- Trade is the primary post-founding source of Gold (see
  #link("../chapters/Economy.typ#62-tile-scan-resource-production")[Economy §6.2];).
- See #link("../chapters/Diplomacy-and-Trade.pdf")[Diplomacy and Trade] for trade
  route rules.
