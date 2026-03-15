= 0 C.E. --- Farm
<0-ce--farm>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

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
    [Game Night], [10],
  )],
  kind: table,
)

== Farm Levels Data
<farm-level-data>
#let max_level = 45

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(24 * calc.pow(l, 1.58))
#let stone_cost(l) = calc.round(18 * calc.pow(l, 1.69))
#let metal_cost(l) = calc.round(5 * calc.pow(l, 1.975))
#let food_cost(l) = (l - 1) * 3
#let pop_cost(l) = 0
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(500 * calc.pow(1.1615, l)) } else { 50 * calc.pow(l, 2) },
)
#let militia(l) = if l <= max_level { l * 10 } else { max_level * 10 + (l - max_level) * 5 }
#let points(l) = calc.round(17 * calc.pow(l, 1.31))

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
  [Militia],
  [Points],
)

#let building_row(l) = (
  [#l],
  [#wood_cost(l)],
  [#stone_cost(l)],
  [#metal_cost(l)],
  [#food_cost(l)],
  [#pop_cost(l)],
  [#fmt_time(total_time(l))],
  [#militia(l)],
  [#points(l)],
)

#let building_table(from, to) = figure(
  align(center)[#table(
    columns: building_row(0).len(),
    align: (center,) * building_row(0).len(),
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
#building_table(16, 31)

=== Late game
#building_table(31, 46)

=== City tier 2
#building_table(46, 56)

=== City tier 3
#building_table(56, 66)
