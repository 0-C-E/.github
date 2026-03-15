= 0 C.E. - Balancing <0-ce---balancing>
#link("../nav/Home.pdf") | #link("Event-System.pdf")[Previous] |
#link("Modding.pdf")[Next]

== 23. Balancing Philosophy <23-balancing-philosophy>

=== 23.1 Core Principles <231-core-principles>
+ #strong[Time is the primary scarcity] --- Faster timers are more
  valuable than bigger numbers. Mode speed multipliers must scale all
  systems uniformly.
+ #strong[No dominant strategy] --- Every civ, build order, faith path,
  and playstyle must have viable counters and exploitable weaknesses.
+ #strong[Espionage has a payoff] --- The hidden formation system exists
  specifically to make espionage investment materially rewarding, not
  just cosmetically informative.
+ #strong[Early mistakes recoverable, late-game mistakes punishing] ---
  Escalating commitment must feel real.
+ #strong[Solo viability mid-game, alliance advantage late] --- Solo
  players should compete effectively through mid-game. Alliance
  advantage in late game is intentional --- it creates the incentive for
  diplomacy.

=== 23.2 Anti-Snowball Mechanisms <232-anti-snowball-mechanisms>
#figure(align(center)[#table(
  columns: 2,
  align: (
    auto,
    auto,
  ),
  table.header(
    [Mechanism],
    [Description],
  ),
  table.hline(), [#strong[Grievance Bonus];],
  [Player who loses a city to capture
  receives a temporary +20% production boost],              [#strong[Multi-City Tax];],
  [Exponential city maintenance costs
  punish over-extension],              [#strong[Trade Dependency];],
  [Gold-vein scarcity means dominant
  players need trade to sustain military upkeep],              [#strong[Wonder Magnet];],
  [Holding a Wonder makes you every
  player\'s primary target],              [#strong[Domination Pressure];],
  [As an alliance approaches full map
  control, every other alliance has existential incentive to unite
  against them],
)], kind: table)

=== 23.3 Balance Levers (Per World) <233-balance-levers-per-world>
All key balance parameters are exposed in `world.toml`:

- Speed multiplier (universal)
- Protection window duration
- City cost scaling exponent
- Maximum alliance size
