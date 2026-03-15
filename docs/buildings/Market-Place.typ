= 0 C.E. --- Market
<0-ce--market>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes
<notes>
- Trade is the primary post-founding source of Gold (see
  #link("../chapters/Economy.typ#62-tile-scan-resource-production")[Economy §6.2];).
- See #link("../chapters/Diplomacy-and-Trade.pdf")[Diplomacy and Trade] for trade
  route rules.

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
    [Game Night], [2],
  )],
  kind: table,
)

== Market Place Levels Data
<market-place-level-data>
#let max_level = 30

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(139 * calc.pow(l, 1.175))
#let stone_cost(l) = calc.round(61 * calc.pow(l, 1.29))
#let metal_cost(l) = calc.round(20 * calc.pow(l, 1.57))
#let food_cost(l) = (l - 1) * 5
#let pop_cost(l) = calc.round(2 * calc.pow(l, 1.1))
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(450 * calc.pow(1.2, l)) } else { 120 * calc.pow(l, 2) },
)
#let trade_capacity(l) = if l <= max_level { l * 500 } else { max_level * 500 + (l - max_level) * 350 }
#let points(l) = calc.round(100 + 9 * calc.pow(l, 1.36))

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
  [Trade capacity],
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
  [#trade_capacity(l)],
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
