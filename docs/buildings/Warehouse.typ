= 0 C.E. --- Warehouse
<0-ce--warehouse>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes
<notes>
- Food has its own storage building: the
  #link("Building-Granary.pdf")[Granary];.
- A city can have both a Granary and a Warehouse; they apply to separate
  resource pools.

== Starting Levels
<starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Mode], [Starting Level]),
    table.hline(),
    [Full World], [1],
    [Campaign], [3],
    [Skirmish], [5],
    [Game Night], [7],
  )],
  kind: table,
)

== Warehouse Levels Data
<warehouse-level-data>
#let max_level = 35

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(-90 + 100 * calc.pow(l, 1.23))
#let stone_cost(l) = calc.round(-85 + 100 * calc.pow(l, 1.36))
#let metal_cost(l) = calc.round(-96 + 100 * calc.pow(l, 1.27))
#let food_cost(l) = (l - 1) * 5
#let pop_cost(l) = 0
#let total_time(l) = calc.round(
  if l <= max_level { 127 * calc.pow(1.21, l) } else { 101 * calc.pow(l, 2) },
)
#let storage(l) = calc.round(300 + 181 * calc.pow(l, 1.42))
#let stash_size(l) = l * 100
#let points(l) = calc.round(7 * calc.pow(l, 1.46))

// ── Helper functions ──
#let fmt_time(time) = {
  let h = calc.floor(time / 3600)
  let m = calc.floor(calc.rem(time, 3600) / 60)
  let s = calc.floor(calc.rem(time, 60))
  let pad(n) = if n < 10 { "0" + str(n) } else { str(n) }
  pad(h) + ":" + pad(m) + ":" + pad(s)
}

#let building_header = table.header(
  [*Level*],
  [🪵],
  [🪨],
  [⛏️],
  [🌾],
  [👥],
  [⏱️],
  [*Storage*],
  [*Stash size*],
  [*Points*],
)

#let building_row(l) = (
  [#l],
  [#wood_cost(l)],
  [#stone_cost(l)],
  [#metal_cost(l)],
  [#food_cost(l)],
  [#pop_cost(l)],
  [#fmt_time(total_time(l))],
  [#storage(l)],
  [#stash_size(l)],
  [#points(l)],
)

#let building_table(from, to) = figure(
  align(center)[#table(
    columns: 10,
    align: (center,) * 10,
    building_header,
    table.hline(),
    ..for l in range(from, to) { building_row(l) },
  )],
  kind: table,
)

// ── Tables ──
=== Early game
#building_table(1, 16)

=== Mid-game
#building_table(16, 26)

=== Late-game
#building_table(26, 36)

=== City tier 2
#building_table(36, 46)

=== City tier 3
#building_table(46, 56)
