= 0 C.E. - Espionage
<0-ce---espionage>
#link("../nav/Home.typ") | #link("Military.typ")[Previous] |
#link("Research.typ")[Next]

== 11. Espionage
<11-espionage>
=== 11.1 Design Role
<111-design-role>
Espionage is the intelligence layer that makes hidden information
matter. Since the map is fully visible (no fog of war), the hidden
information is: garrison composition, formation choice, resource levels,
building completion status, and research progress. Espionage reveals
these.

Its deepest gameplay purpose is #strong[making formations meaningful for
attackers];. An attacker who invests in espionage before launching knows
the defender\'s garrison composition --- and can choose a formation that
counters it. An attacker who skips espionage is gambling.

=== 11.2 Spy Mechanics
<112-spy-mechanics>
Spies are #strong[persistent assets] assigned to missions
(Grepolis-style):

- Players start with 1 spy slot; expands via Espionage tech branch
- Spies are assigned missions with duration and success probability
- Failed missions: spy is captured (lost), diplomatic relation penalty
  with target

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Mission], [Duration], [Success Reveals / Effect],),
    table.hline(),
    [#strong[Scout Garrison];], [2h], [Exact garrison unit composition
    for 12h],
    [#strong[Scout Formation];], [3h], [Attacker\'s set formation if
    army is marching],
    [#strong[Scout Resources];], [2h], [Current resource levels of
    target city],
    [#strong[Scout Buildings];], [4h], [Building composition and
    completion status],
    [#strong[Sabotage];], [6h], [Destroys 10% of one resource type],
    [#strong[Incite Unrest];], [8h], [Target city\'s Culture Points
    generation −50% for 24h],
  )]
  , kind: table
  )

=== 11.3 Counter-Espionage
<113-counter-espionage>
A Watchtower building provides passive counter-espionage:

- Spy detection chance increases per Watchtower tier
- Detected spies are captured and the sending player is notified (not
  identified --- just \"a spy was caught\")
- High-level Watchtower can reveal the spy\'s origin city
