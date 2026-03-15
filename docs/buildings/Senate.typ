= 0 C.E. --- Senate <0-ce--senate>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Starting Levels <starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Mode], [Starting Level]),
    table.hline(),
    [Full World], [1],
    [Campaign], [2],
    [Skirmish], [5],
    [Game Night], [10],
  )],
  kind: table,
)

== Senate Levels Data <senate-level-data>
#let max_level = 25

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(25 * calc.pow(l, 1.7))
#let stone_cost(l) = calc.round(12 * calc.pow(l, 2))
#let metal_cost(l) = calc.round(10 * calc.pow(l, 1.8))
#let food_cost(l) = calc.round(7 * calc.pow(l, 1.05))
#let pop_cost(l) = calc.round(3 * calc.pow(l, 1.21))
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(310 * calc.pow(1.22, l)) } else {
    50 * calc.pow(l, 2)
  },
)
#let construction_time(l) = calc.round(
  100 * calc.pow(0.965, (l - 1)),
  digits: 1,
)
#let points(l) = calc.round(110 * calc.pow(l, 0.75))

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
  [Buildings Construction Times],
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
  [#construction_time(l)%],
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
#building_table(1, 9)

=== Mid-game
#building_table(9, 17)

=== Late game
#building_table(17, 26)

=== City tier 2
#building_table(26, 36)

=== City tier 3
#building_table(36, 46)
