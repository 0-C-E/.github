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
    [Skirmish], [0],
    [Game Night], [0],
  )],
  kind: table,
)

== Market Place Levels Data
<market-place-level-data>
#let max_level = 30

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
