= 0 C.E. --- Barracks <0-ce--barracks>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes <notes>
- All land units are trained, stored, and managed in the Barracks
  garrison context.
- Naval units are managed separately in the
  #link("Building-Harbor.pdf")[Harbor] garrison.
- Siege weapons require the
  #link("Building-Siege-Workshop.pdf")[Siege Workshop] special building to
  unlock.
- See #link("../chapters/Military.pdf")[Military] for unit types and combat rules.

== Starting Levels <starting-levels>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Mode], [Starting Level]),
    table.hline(), [Full World],
    [0], [Campaign],
    [1], [Skirmish],
    [3], [Game Night],
    [5],
  )],
  kind: table,
)

== Barracks Levels Data <barracks-level-data>
#let max_level = 30

// ── Base values & Functions ──
#let wood_cost(l) = calc.round(70 * calc.pow(l, 1.22))
#let stone_cost(l) = calc.round(20 * calc.pow(l, 1.67))
#let metal_cost(l) = calc.round(40 * calc.pow(l, 1.54))
#let food_cost(l) = (l + 1) * 7
#let pop_cost(l) = calc.round(1.5 * calc.pow(l, 1.13))
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(500 * calc.pow(1.1615, l)) } else {
    50 * calc.pow(l, 2)
  },
)
#let points(l) = calc.round(33 * calc.pow(l, 1.21))

// Unit training times
#let swordsman_time(l) = calc.round(20 * 60 * calc.pow(0.975, l))
#let light_cavalry_time(l) = calc.round(55 * 60 * calc.pow(0.975, l))
#let war_chariot_time(l) = calc.round(80 * 60 * calc.pow(0.975, l))
#let spearman_time(l) = calc.round(18 * 60 * calc.pow(0.975, l))
#let archer_time(l) = calc.round(20 * 60 * calc.pow(0.975, l))
#let slinger_time(l) = calc.round(22 * 60 * calc.pow(0.975, l))
#let heavy_infantry_time(l) = calc.round(75 * 60 * calc.pow(0.975, l))
#let pikeman_time(l) = calc.round(25 * 60 * calc.pow(0.975, l))
#let peltast_time(l) = calc.round(35 * 60 * calc.pow(0.975, l))

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

#let units_header = table.header(
  [*Level*],
  [⚔️],
  [🐎],
  [🐴],
  [↗️],
  [🏹],
  [🪨],
  [🛡️],
  [↗️],
  [🪓],
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

#let units_row(l) = (
  [#l],
  [#fmt_time(swordsman_time(l))],
  [#fmt_time(light_cavalry_time(l))],
  [#fmt_time(war_chariot_time(l))],
  [#fmt_time(spearman_time(l))],
  [#fmt_time(archer_time(l))],
  [#fmt_time(slinger_time(l))],
  [#fmt_time(heavy_infantry_time(l))],
  [#fmt_time(pikeman_time(l))],
  [#fmt_time(peltast_time(l))],
)

#let building_table(from, to) = figure(
  align(center)[
    #table(
      columns: building_row(0).len(),
      align: (center,) * building_row(0).len(),
      building_header,
      table.hline(),
      ..for l in range(from, to) { building_row(l) },
    ),
    #table(
      columns: units_row(0).len(),
      align: (center,) * units_row(0).len(),
      units_header,
      table.hline(),
      ..for l in range(from, to) { units_row(l) },
    )
  ],
  kind: table,
)

=== Early game
#building_table(1, 11)

=== Mid game
#building_table(11, 21)

=== Late game
#building_table(21, 31)

=== City tier 2
#building_table(31, 41)

=== City tier 3
#building_table(41, 51)
