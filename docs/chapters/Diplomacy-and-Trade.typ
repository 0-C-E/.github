= 0 C.E. - Diplomacy and Trade <diplomacy-and-trade>
#link("../nav/Home.pdf") | #link("Research.pdf")[Previous] |
#link("Victory-and-Prestige.pdf")[Next]

== 13. Diplomacy, Trade & Alliances <13-diplomacy-trade--alliances>

=== 13.1 Diplomatic Model (Grepolis Baseline) <131-diplomatic-model-grepolis-baseline>
Diplomacy mirrors Grepolis\' first-release model as the canonical
foundation:

- #strong[Relation Score];: −100 (War) to +100 (Alliance), continuous
  spectrum
- #strong[No forced diplomacy];: All actions are player-initiated; the
  game does not auto-manage relations
- #strong[Free Betrayal];: Any agreement can be broken at any time.
  There is no game-enforced consequence beyond the relation score
  penalty. The social consequence (reputation, retaliation) is the
  deterrent.

=== 13.2 Diplomatic Actions <132-diplomatic-actions>
#figure(
  align(center)[#table(
    columns: 3,
    align: (
      auto,
      auto,
      auto,
    ),
    table.header([Action], [Requirement], [Effect]),
    table.hline(), [#strong[Declare War];], [None],
    [Enables combat; removes protection
      treaties],
    [#strong[Propose Peace];],
    [During
      war],
    [Ends war; optional
      reparations terms],
    [#strong[Non-Aggression
      Pact];],
    [Neutral+],
    [Cannot initiate combat
      for duration; breakable with 12h notice],
    [#strong[Alliance];],
    [Friendly+],
    [Shared war/peace status; access
      to alliance systems],
    [#strong[Trade];],
    [Both
      have Market],
    [Send resources to target
      player; travel time based on distance],
    [#strong[Embargo];],
    [Hostile],
    [Blocks trade dispatches between
      both parties],
    [#strong[Send Gift];],
    [Any],
    [Resource transfer; +relation score],
    [#strong[Military Access];],
    [Alliance
      or treaty],
    [Armies may pass
      through territory],
    [#strong[Tribute Demand];],
    [During/after
      war],
    [Request ongoing
      resource payment; target can refuse],
  )],
  kind: table,
)

=== 13.3 Alliance System <133-alliance-system>
Alliances are formal multi-player groups (Grepolis-style):

- #strong[Size];: 2--20 members (host-configurable)
- #strong[Alliance Bank];: Shared voluntary resource pool
- #strong[Roles];: Founder (full control), Officer (declare war, manage
  bank), Member
- #strong[War];: Alliance-level war declarations affect all members
- #strong[Betrayal];: An Officer or Founder can declare war on a former
  ally immediately after leaving the alliance. No cooldown. This is
  intentional --- backstabs are a core social drama mechanism.
- #strong[Diplomacy between Alliances];: Alliances can sign
  inter-alliance Non-Aggression Pacts

=== 13.4 Trade System <134-trade-system>
Trade works exactly like Grepolis: it is an #strong[active,
  player-initiated transaction];, not a passive background income stream.
There are no persistent trade routes. Every trade is a discrete action.

#strong[How trade works];:

+ Player A opens the trade interface and selects a target player (must
  have a Market/Bazaar; target must also have one)
+ Player A specifies the resources to send and (optionally) the
  resources to request in return
+ A trade dispatch is sent --- physically modeled as a merchant leaving
  the city (travel time based on distance)
+ Target player receives the goods on arrival; any requested return
  goods are sent back as a separate dispatch

#strong[Trade rules];:

- No automatic income --- every gold piece from trade requires a player
  decision
- Trade can be sent to any player regardless of diplomatic status
  (trading with enemies is legal and sometimes strategically valuable)
- Trade dispatches can be intercepted by enemy naval units on
  sea-crossing routes (archipelago maps)
- Players may automate trade decisions using the Scripting Engine ---
  scripts can monitor resource levels and dispatch trades automatically,
  but the trade itself is still a discrete mechanical action
- Embargo (diplomatic action) blocks the #emph[sending] of trade from
  your cities to the embargoed player, and vice versa

#strong[Trade capacity];: Number of simultaneous trade dispatches in
transit is limited by Market/Bazaar tier. Higher tier = more dispatches
active at once.

#strong[Gold generation from trade];: Both sender and receiver gain a
small gold bonus on successful trade completion, scaling with the total
resource value transferred. This rewards active trading without making
it passive.

=== 13.5 Communication <135-communication>
In-game communication is a first-class feature:

- #strong[Direct Messages];: Player-to-player private messaging
- #strong[Alliance Forum];: Threaded forum posts, visible to alliance
  members only
- #strong[Alliance Chat];: Real-time chat within alliance
- #strong[World Announcements];: Public messages visible to all players
  (throttled to prevent spam)
- #strong[Diplomatic Channel];: A formal diplomatic message thread
  between two players or alliances; has a distinct visual treatment
  (scroll/parchment aesthetic)
- #strong[Combat Reports];: Auto-generated narrative reports sent to
  both parties after battle
