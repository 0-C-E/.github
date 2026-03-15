= 0 C.E. --- Harbor <0-ce--harbor>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes <notes>
- All naval units are trained, stored, and managed in the Harbor
  garrison context.
- Land units are managed separately in the
  #link("Building-Barracks.pdf")[Barracks] garrison.
- See #link("../chapters/Military.pdf")[Military] for naval unit types and combat
  rules.

== Starting Levels <starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Mode], [Starting Level]),
    table.hline(), [Full World],
    [0], [Campaign],
    [0], [Skirmish],
    [1], [Game Night],
    [1],
  )],
  kind: table,
)

== Harbor Levels Data <harbor-level-data>
#let max_level = 30

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(1 * calc.pow(l, 1))
#let stone_cost(l) = calc.round(1 * calc.pow(l, 1))
#let metal_cost(l) = calc.round(1 * calc.pow(l, 1))
#let food_cost(l) = (l - 1) * 5
#let pop_cost(l) = 0
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(500 * calc.pow(1.1615, l)) } else {
    50 * calc.pow(l, 2)
  },
)

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
