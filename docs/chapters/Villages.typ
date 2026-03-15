= 0 C.E. - Villages <0-ce---villages>
#link("../nav/Home.pdf") | #link("Victory-and-Prestige.pdf")[Previous] |
#link("Social.pdf")[Next]

== 15. Villages & Neutral Sites <15-villages--neutral-sites>

=== 15.1 Villages <151-villages>
Villages are #strong[neutral settlements] scattered across the map ---
pre-existing communities that predate the player civilizations. They are
not player cities, cannot be colonized into player cities, and cannot be
destroyed. They are persistent geographic features that players compete
to control.

==== 15.1.1 Ownership Model --- King of the Hill <1511-ownership-model--king-of-the-hill>
Villages use a #strong[single-owner contestable] model. At any moment,
exactly one player owns a village (or it is unowned at world start).
Ownership is seized and held by military force.

#strong[To claim an unowned village];: Send any army to it --- the
village garrison (NPC defenders, fixed strength) must be defeated. On
victory the village is yours.

#strong[To seize an owned village];: Defeat the current owner\'s
garrison. The owner may station troops there; the village has no walls,
only the garrison. No siege phase --- pure open battle.

#strong[Ownership is permanent until taken] --- there is no expiry.
Holding a village requires either stationing a garrison or accepting the
risk of losing it to an opportunistic attack.

==== 15.1.2 Owner Benefits <1512-owner-benefits>
#figure(
  align(center)[#table(
    columns: 2,
    align: (
      auto,
      auto,
    ),
    table.header([Benefit], [Description]),
    table.hline(), [#strong[Resource Tribute];],
    [Village pays a resource tribute every
      production cycle (type varies by village --- farms pay food,
      quarries pay stone, etc.)],
    [#strong[Exclusive Recruitment];],
    [Owner can recruit a small number
      of village-specific units for gold (unit type varies by village
      culture)],
    [#strong[Trade Monopoly];],
    [Owner receives +25% gold on any trade
      dispatched through that village\'s region],
  )],
  kind: table,
)

==== 15.1.3 Non-Owner Interactions <1513-non-owner-interactions>
Non-owners are not locked out entirely:

#figure(
  align(center)[#table(
    columns: 3,
    align: (
      auto,
      auto,
      auto,
    ),
    table.header([Interaction], [Who], [Effect]),
    table.hline(), [#strong[Trade];], [Any player],
    [Send a merchant to trade --- gold
      exchange only, no resource tribute, no recruitment access],
    [#strong[Raid];],
    [Any
      player],
    [One-time attack on the village
      treasury --- yields a resource cache but does not change ownership
      unless garrison is defeated],
    [#strong[Seize];],
    [Any player],
    [Defeat garrison → become new
      owner],
  )],
  kind: table,
)

==== 15.1.4 Village Garrison <1514-village-garrison>
Each village spawns a fixed NPC garrison scaled to world age:

#figure(
  align(center)[#table(
    columns: 2,
    align: (
      auto,
      auto,
    ),
    table.header([World Phase], [Garrison Strength]),
    table.hline(), [Early (0--30 days)],
    [Weak --- defeatable by a small raiding
      party],
    [Mid (30--90 days)],
    [Moderate --- requires a real army commitment], [Late (90+ days)],
    [Strong --- discourages casual seizure attempts],
  )],
  kind: table,
)

The owner may reinforce the garrison by stationing their own military
units alongside the NPC defenders. NPC garrison regenerates slowly after
battle; player-stationed units do not regenerate automatically.

==== 15.1.5 Village Types <1515-village-types>
Village type determines tribute resource and recruitment unit:

#figure(
  align(center)[#table(
    columns: 3,
    align: (
      auto,
      auto,
      auto,
    ),
    table.header([Village Type], [Tribute Resource], [Recruitable Unit]),
    table.hline(), [#strong[Farming Settlement];], [Food],
    [Militia Infantry (cheap
      light infantry)],
    [#strong[Stone Quarry];],
    [Stone],
    [Siege Laborers (boost siege
      weapon construction speed)],
    [#strong[Hunting Ground];],
    [Wood],
    [Scout Cavalry (fast, low combat
      strength, high map reveal range)],
    [#strong[River Port];],
    [Gold],
    [River Traders (boost trade dispatch
      gold yield)],
    [#strong[Forge Village];],
    [Metal],
    [Auxiliary Warriors (medium
      infantry, no tech requirement)],
  )],
  kind: table,
)

==== 15.1.6 Integration <1516-integration>
A player who has owned the same village continuously for #strong[30
  days] unlocks the #strong[Integrate] action:

- Cost: 1 Cultural Level (city slot expenditure)
- Effect: Village is permanently absorbed into the nearest player city
  --- population bonus (+50 population cap) and that village\'s tribute
  type becomes a passive city production bonus (+10% of that resource
  permanently)
- The village disappears from the map as a separate entity
- Integration is irreversible; the village cannot be contested once
  integrated

Integration is the mega-base builder\'s village payoff --- trading a
city slot for a permanent city enhancement rather than expansion.

=== 15.2 Sacred Sites <152-sacred-sites>
Sacred Sites are special map locations --- ancient ruins, natural
formations, divine landmarks --- that interact with the divine system
rather than the resource economy.

- A city built adjacent to a Sacred Site gains +15% Favor generation for
  all gods worshipped in that city
- Sacred Sites cannot be owned or claimed --- the bonus applies to any
  city within range
- Sacred Sites are visible on the map from world start --- they are
  known geography, not hidden discoveries
- Eligible Wonder islands always contain at least one Sacred Site
  (contributing to why they are valuable)
