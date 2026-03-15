= 0 C.E. - Social <0-ce---social>
#link("../nav/Home.pdf") | #link("Villages.pdf")[Previous] |
#link("Scripting-Engine.pdf")[Next]

== 16. Social Systems <16-social-systems>

=== 16.1 Messaging & Forums <161-messaging--forums>
All in-game communication tools are first-class citizens, not
afterthoughts:

#figure(
  align(center)[#table(
    columns: 3,
    align: (
      auto,
      auto,
      auto,
    ),
    table.header([Tool], [Scope], [Persistence]),
    table.hline(), [Direct Message], [Player ↔ Player],
    [Persists for world lifetime], [Alliance Forum], [Alliance members],
    [Persists; threaded], [Alliance Chat], [Alliance members],
    [Session-persistent], [Diplomatic Channel], [Two players/alliances],
    [Persists; formal
      tone],
    [World Announcement],
    [All players],
    [Public; throttled], [Combat Report], [Battle participants],
    [Auto-generated; narrative], [Event Feed], [Individual player],
    [Personal notification stream],
  )],
  kind: table,
)

=== 16.2 Event Feed <162-event-feed>
Every player has a personal #strong[Event Feed] --- a chronological
stream of things that happened to or near them:

- Construction completed
- Research completed
- Incoming army detected (via Watchtower)
- Battle resolved
- Trade dispatch sent / completed
- Diplomatic messages received
- Divine power used on your city (flavor text)
- Alliance events (member joined, war declared)
- World events (Wonder constructed, Campaign timer update)

The Event Feed is the game\'s pulse --- a well-designed feed means
players can manage a city in a 2-minute mobile session by scanning what
happened since last login.

=== 16.3 Player Reputation <163-player-reputation>
Across worlds, player actions contribute to their #strong[Reputation]
--- a soft social signal visible on their profile:

- #strong[Covenant Keeper];: Rarely breaks treaties (tracked via
  diplomatic history)
- #strong[Warmonger];: High military victory count
- #strong[Merchant];: High trade volume
- #strong[Betrayer];: Frequently breaks alliances (tracked; visible as a
  warning)

Reputation is #strong[informational only] --- no mechanical bonus or
penalty. Players choose how to interpret it.
