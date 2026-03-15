= 0 C.E. --- Divine Statue #emph[(Special)]
<0-ce--divine-statue-special>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Property], [Value]),
    table.hline(),
    [#strong[Type];], [Special (non-upgradable)],
    [#strong[Slot];], [Divine Statue],
    [#strong[Max Level];], [1],
    [#strong[Effects];], [Additional Favor production multiplier],
  )],
  kind: table,
)

== Effect Formulas
<effect-formulas>
```
favor_per_hour_final = favor_per_hour × (1 + statue_favor_bonus)
```

`favor_per_hour` is the base output of the
#link("Building-Shrine-Temple.pdf")[Shrine / Temple] at its current level.
The Divine Statue applies a flat multiplier on top.

The value of `statue_favor_bonus` is defined in
`config/buildings/divine_statue.toml`.

== Cost
<cost>
Exact values defined in `config/buildings/divine_statue.toml`. Special
buildings have a flat one-time construction cost (no level scaling).

== Starting Levels
<starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Mode], [Starting Level]),
    table.hline(),
    [Full World], [0],
    [Campaign], [0],
    [Skirmish], [0],
    [Game Night], [0],
  )],
  kind: table,
)

== Notes
<notes>
- Built once at level 1; can never be upgraded further.
- Has no effect if the #link("Building-Shrine-Temple.pdf")[Shrine / Temple]
  is not built.
- See #link("../chapters/Divine-System.pdf")[Divine System] for how Favor is used.
