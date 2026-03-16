#import "../utils/formulas.typ": building_table, format_time, starting_levels

= 0 C.E. --- Quarry <0-ce--quarry>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Starting Levels <starting-levels>
#figure(
  align(center)[#starting_levels(0, 1, 5, 15)],
  kind: table,
)

== Quarry Levels Data <quarry-level-data>
#let max_level = 40

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(6 * calc.pow(l, 1.69))
#let stone_cost(l) = calc.round(10 * calc.pow(l, 1.5))
#let metal_cost(l) = calc.round(10 * calc.pow(l, 1.75))
#let food_cost(l) = (l - 1) * 5
#let pop_cost(l) = calc.round(0.5 * calc.pow(l, 1.44))
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(300 * l * calc.pow(1.049, l)) }
  else { 60 * calc.pow(l, 2) },
)
#let production(l) = calc.round(10 * calc.pow(l, 1.1))
#let points(l) = calc.round(10 * calc.pow(l, 1.22))

// ── Helper functions ──
#let this_table = (from, to) => building_table(
  from,
  to,
  costs: l => (
    wood_cost(l),
    stone_cost(l),
    metal_cost(l),
    food_cost(l),
    pop_cost(l),
  ),
  time: total_time,
  points: l => points(l),
  extra_headers: ([*Production per hour*],),
  extra: l => ([#production(l)],),
)

// ── Tables ──
=== Early game
#this_table(1, 16)

=== Mid-game
#this_table(16, 31)

=== Late-game
#this_table(31, 41)

=== City tier 2
#this_table(41, 51)

=== City tier 3
#this_table(51, 61)
