= 0 C.E. --- Granary
<0-ce--granary>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes
<notes>
- Food uses the Granary storage line; all other resources use the
  #link("Building-Warehouse.pdf")[Warehouse];.
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
    [Skirmish], [6],
    [Game Night], [15],
  )],
  kind: table,
)

== Granary Levels Data
<granary-level-data>
#let max_level = 35

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(-95 + 100 * calc.pow(l, 1.29))
#let stone_cost(l) = calc.round(-96 + 100 * calc.pow(l, 1.33))
#let metal_cost(l) = calc.round(-99 + 100 * calc.pow(l, 1.27))
#let food_cost(l) = (l - 1) * 5
#let pop_cost(l) = 0
#let total_time(l) = calc.round(
  if l <= max_level { 120 * calc.pow(1.21, l) } else { 100 * calc.pow(l, 2) },
)
#let food_storage(l) = calc.round(250 + 80 * calc.pow(l, 1.5))
#let pop_cap(l) = calc.round(50 + 11 * calc.pow(l, 1.625))
#let points(l) = calc.round(17 + 2 * calc.pow(l, 1.355))

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
  [*Max. Population*],
  [*Storage*],
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
  [#pop_cap(l)],
  [#food_storage(l)],
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
