= 0 C.E. --- Siege Workshop #emph[(Special)]
<0-ce--siege-workshop-special>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Property], [Value]),
    table.hline(),
    [#strong[Type];], [Special (non-upgradable)],
    [#strong[Slot];], [Siege Workshop],
    [#strong[Max Level];], [1],
    [#strong[Effects];], [Enables siege weapon training],
  )],
  kind: table,
)

== Effect
<effect>
```
siege_unlocked = true
```

Without the Siege Workshop, siege weapons cannot be trained regardless
of #link("Building-Barracks.pdf")[Barracks] level.

== Cost
<cost>
```toml
# config/buildings/siege_workshop.toml
[cost]
wood_base  = ...
stone_base = ...
metal_base = ...
```

Exact values defined in `config/buildings/siege_workshop.toml`. Special
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
- See #link("../chapters/Military.pdf")[Military] for siege weapon types and
  mechanics.
