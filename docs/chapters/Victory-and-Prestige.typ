= 0 C.E. - Victory and Prestige <victory-and-prestige>
#link("../nav/Home.pdf") | #link("Diplomacy-and-Trade.pdf")[Previous] |
#link("Villages.pdf")[Next]

== 14. Victory Conditions <14-victory-conditions>

=== 14.1 By Mode <141-by-mode>
#figure(
  align(center)[#table(
    columns: 3,
    align: (
      auto,
      auto,
      auto,
    ),
    table.header([Mode], [Condition], [Description]),
    table.hline(), [#strong[Full World];], [World Domination],
    [First alliance to
      control every city slot wins],
    [#strong[Campaign];],
    [Wonder
      Hold],
    [Construct the designated
      Wonder and hold for N days],
    [#strong[Skirmish];],
    [Score],
    [Highest Prestige at world end],
    [#strong[Game Night];],
    [Elimination or Score],
    [Last city standing,
      or highest score at time limit],
  )],
  kind: table,
)

=== 14.2 Full World: World Domination <142-full-world-world-domination>
The first #strong[alliance] to control every city slot on the map wins.
City slots are the fixed coastal positions generated at world creation
--- a player\'s founded city occupies a slot, and a captured city
transfers that slot to the attacker.

- Solo players cannot win Full World --- alliance membership is required
  to achieve domination
- The win condition is evaluated continuously; victory triggers the
  moment the final slot falls
- Upon victory, the world enters #strong[Legacy] state: read-only
  archive with final standings preserved permanently
- The Victory Alliance and each member\'s contribution (cities held,
  battles won, Wonders constructed) is recorded in the world history log
- No time limit is set at creation --- worlds run until domination is
  achieved or the host retires them

#strong[Anti-turtling note];: The multi-city maintenance scaling (§6.5)
and the Grievance Bonus (§23.2) both apply normally. Domination requires
sustained military and diplomatic effort --- a single alliance holding
everything must also afford everything.

=== 14.3 Campaign: Wonder Hold <143-campaign-wonder-hold>
A single Wonder is designated as the #strong[Victory Wonder] at world
creation (revealed to all players). The first player or alliance to
construct it and hold it (without losing it to capture) for the
configured duration wins.

- The Wonder\'s city can be attacked and captured --- this transfers the
  Wonder and resets the hold timer
- Holding the Victory Wonder makes you the world\'s primary military
  target --- diplomacy and alliances become critical
- Other Wonders can still be built for their effects; only the
  designated Victory Wonder counts for Campaign win

=== 14.4 Skirmish: Score <144-skirmish-score>
Highest #strong[Prestige Score] at the world\'s configured end time:

```
Prestige = (cities_owned × 100)
         + (population × 0.5)
         + (buildings_completed × 10)
         + (technologies_researched × 50)
         + (wonders_held × 500)
         + (military_victories × 25)
         + (trades_completed × 5)
         + (favor_spent × 0.1)
```

=== 14.5 Game Night: Elimination / Score <145-game-night-elimination--score>
#strong[Elimination];: Last player with at least one city wins. Losing
your last city removes you from the game. Eliminated players spectate.

#strong[Score] (if time limit reached before elimination): Highest
Prestige at time limit wins.

Host chooses which applies, or sets both with elimination as primary and
score as tiebreaker.

== 17. Prestige & Account Progression <17-prestige--account-progression>

=== 17.1 Account-Level Persistence <171-account-level-persistence>
Nothing mechanical carries between worlds. A new world is always a fresh
start. What carries is #strong[Prestige] --- a purely cosmetic
account-level score tracking lifetime achievement.

=== 17.2 Prestige Sources <172-prestige-sources>
#figure(
  align(center)[#table(
    columns: 2,
    align: (
      auto,
      auto,
    ),
    table.header([Action], [Prestige Gain]),
    table.hline(), [Wonder constructed],
    [+500], [Campaign victory],
    [+1,000], [Skirmish victory],
    [+300], [Military victories (cumulative)],
    [+25 each], [Cities founded (per world)],
    [+100 each], [Era advancements],
    [+200 each], [Trade milestones],
    [+50 each], [Diplomatic agreements],
    [+10 each], [Alliance founded],
    [+150],
  )],
  kind: table,
)

=== 17.3 Prestige Rewards (Cosmetic Only) <173-prestige-rewards-cosmetic-only>
Prestige thresholds unlock #strong[cosmetic-only rewards] --- never
gameplay advantages:

- City banner designs
- Map marker icons
- Combat report illustration styles
- Profile title (Warlord, Merchant-Prince, Divine Servant, Architect of
  Ages)
- Chat flair (subtle icon next to username)
