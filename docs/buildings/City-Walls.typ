= 0 C.E. --- City Walls
<0-ce--city-walls>
#link("../chapters/Buildings-and-Wonders.pdf")[← Buildings & Wonders]

== Notes
<notes>
- The #link("Building-Watchtower.pdf")[Watchtower] special building further
  multiplies `defense_mult`.
- Wall HP is a passive layer; walls must be breached before the city
  itself can be attacked at full strength.
- See #link("../chapters/Military.pdf")[Military] for siege and assault mechanics.

== Starting Levels
<starting-levels>
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

== City Walls Levels Data
<city-walls-level-data>
#let max_level = 25

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
