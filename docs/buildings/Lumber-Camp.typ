= 0 C.E. --- Lumber Camp
<0-ce--lumber-camp>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

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
    [Skirmish], [0],
    [Game Night], [0],
  )],
  kind: table,
)

== Lumber Camp Levels Data
<lumber-camp-level-data>
#let max_level = 40

// ── Base values & Functions ──
#let total_time(l) = calc.round(
  if l <= max_level { calc.round(500 * calc.pow(1.1615, l)) } else { 50 * calc.pow(l, 2) },
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
