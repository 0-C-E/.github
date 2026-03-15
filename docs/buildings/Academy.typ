= 0 C.E. --- Academy <0-ce--academy>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

// TODO: Determine the actual academy level cap and adjust the data accordingly. The current cap of 35 is based on Grepolis, but may not be accurate for this game.

== Notes <notes>
- The Academy has a #strong[hard cap of 35] --- city tier bonuses do not
  raise this cap further.
- See #link("../chapters/Research.pdf")[Research] for the full technology tree and
  research mechanics.

== Starting Levels <starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Mode], [Starting Level]),
    table.hline(), [Full World],
    [0], [Campaign],
    [0], [Skirmish],
    [3], [Game Night],
    [7],
  )],
  kind: table,
)

== Academy Levels Data <academy-level-data>
#let max_level = 35

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(100 * calc.pow(l, 1.21))
#let stone_cost(l) = calc.round(100 + 100 * calc.pow(l, 1.37))
#let metal_cost(l) = calc.round(20 + 100 * calc.pow(l, 1.27))
#let food_cost(l) = l * 5
#let pop_cost(l) = l * 3
#let total_time(l) = calc.round(135 * calc.pow(1.21, l))
#let research_points(l) = l * 4
#let points(l) = calc.round(67 * calc.pow(l, 1.1))

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
  [📚],
  [Points],
)

#let building_row(l) = (
  [#l],
  [#wood_cost(l)],
  [#stone_cost(l)],
  [#metal_cost(l)],
  [#food_cost(l)],
  [#pop_cost(l) (+3)],
  [#fmt_time(total_time(l))],
  [#research_points(l) (+4)],
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

=== Early game
#building_table(1, 13)

=== Mid game
#building_table(13, 25)

=== Late game
#building_table(25, 36)
