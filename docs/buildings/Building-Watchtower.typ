= 0 C.E. --- Watchtower #emph[(Special)]
<0-ce--watchtower-special>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Property], [Value],),
    table.hline(),
    [#strong[Type];], [Special (non-upgradable)],
    [#strong[Slot];], [Watchtower],
    [#strong[Max Level];], [1],
    [#strong[Effects];], [Improves City Walls defense bonus; intel
    radius],
  )]
  , kind: table
  )

== Effect Formulas
<effect-formulas>
```
effective_defense_mult = defense_mult × (1 + watchtower_bonus)
intel_radius           = 20
```

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Coefficient], [Value],),
    table.hline(),
    [`watchtower_bonus`], [0.12],
    [`intel_radius`], [20],
  )]
  , kind: table
  )

`defense_mult` is the value produced by
#link("Building-City-Walls.pdf")[City Walls] at its current level. The
Watchtower multiplies this on top, so it is most valuable in cities with
high-level walls.

== Cost
<cost>
```toml
# config/buildings/watchtower.toml
[cost]
wood_base  = 420
stone_base = 520
metal_base = 140
```

Special buildings have a flat one-time construction cost (no level
scaling).

== Starting Levels
<starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Mode], [Starting Level],),
    table.hline(),
    [Standard], [0],
    [Fast], [0],
    [Game Night], [0],
  )]
  , kind: table
  )

== Notes
<notes>
- Built once at level 1; can never be upgraded further.
- Has no effect if #link("Building-City-Walls.pdf")[City Walls] are not
  built.
- See #link("../chapters/Espionage.pdf")[Espionage] for how `intel_radius` interacts
  with scouting.
