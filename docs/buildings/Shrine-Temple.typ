= 0 C.E. --- Shrine / Temple
<0-ce--shrine--temple>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes
<notes>
- Favor is consumed by the Divine System (see
  #link("../chapters/Divine-System.pdf")[Divine System];).
- The #link("Building-Divine-Statue.pdf")[Divine Statue] special building
  multiplies the output of this building.

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
    [Skirmish], [1],
    [Game Night], [3],
  )],
  kind: table,
)

== Shrine / Temple Levels Data
<shrine-temple-level-data>
#let max_level = 30

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(30 * calc.pow(l, 1.69))
#let stone_cost(l) = calc.round(40 * calc.pow(l, 1.63))
#let metal_cost(l) = calc.round(35 * calc.pow(l, 1.65))
#let food_cost(l) = l * 7
#let pop_cost(l) = l * 5
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(1000 * calc.pow(1.188, l)) } else { 250 * calc.pow(l, 1.92) },
)
#let points(l) = calc.round(216 * calc.pow(l, 0.67))

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
#building_table(1, 11)

=== Mid-game
#building_table(11, 21)

=== Late game
#building_table(21, 31)

=== City tier 2
#building_table(31, 41)

=== City tier 3
#building_table(41, 51)
