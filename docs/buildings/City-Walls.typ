= 0 C.E. --- City Walls <0-ce--city-walls>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes <notes>
- The #link("Building-Watchtower.pdf")[Watchtower] special building further
  multiplies `defense_mult`.
- Wall HP is a passive layer; walls must be breached before the city
  itself can be attacked at full strength.
- See #link("../chapters/Military.pdf")[Military] for siege and assault mechanics.

== Starting Levels <starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Mode], [Starting Level]),
    table.hline(),
    [Full World], [0],
    [Campaign], [1],
    [Skirmish], [3],
    [Game Night], [7],
  )],
  kind: table,
)

== City Walls Levels Data <city-walls-level-data>
#let max_level = 25

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(
  if l <= max_level - 5 { 400 } else { 50 * calc.pow((l - 13), 1.01) },
)
#let stone_cost(l) = calc.round(350 * calc.pow(l, 1.05))
#let metal_cost(l) = calc.round(242 * calc.pow(l, 1.04))
#let food_cost(l) = (l - 1) * 5
#let pop_cost(l) = calc.round(2.9 * calc.pow(l, 1.05))
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(200 * calc.pow(1.255, l)) } else {
    100 * calc.pow(l, 2)
  },
)
#let defense_bonus(l) = calc.round(2.95 * calc.pow(l, 1.2), digits: 1)
#let base_defense(l) = (l + 1) * 10
#let points(l) = calc.round(7 + 1.8 * calc.pow(l, 1.75))

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
  [Defense Bonus],
  [Base defense],
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
  [#defense_bonus(l)%],
  [#base_defense(l)],
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

=== Late-game
#building_table(17, 26)

=== City tier 2
#building_table(26, 36)

=== City tier 3
#building_table(36, 46)
