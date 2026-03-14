= 0 C.E. - Vision and Modes
<0-ce---vision-and-modes>
#link("../nav/Home.pdf") | Previous | #link("World-and-Civilizations.pdf")[Next]

== 1. Vision & Pillars
<1-vision--pillars>
=== 1.1 Elevator Pitch
<11-elevator-pitch>
#emph[0 C.E.] is a browser-based, open-source Massively Multiplayer
Online Real-Time Strategy game set in a fully fictional ancient world,
loosely inspired by antiquity. Players found cities in procedurally
generated continents, grow civilizations, forge alliances, wage wars,
and pursue victory --- all within a persistent world accessible from any
browser and self-hostable on any computer.

The game serves four distinct time contracts through a single shared
engine: a persistent #strong[Full World] that may last years, a focused
#strong[Campaign] of weeks, a fast #strong[Skirmish] of days, and an
intense #strong[Game Night] playable in a single sitting. The same
city-building, economy, and combat systems power all four --- only their
pace, feature set, and stakes differ.

=== 1.2 Core Design Pillars
<12-core-design-pillars>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Pillar], [Description],),
    table.hline(),
    [#strong[Grepolis Soul, 0 A.D. Depth];], [Browser accessibility and
    MMORTS social dynamics from Grepolis; historical authenticity, unit
    fidelity, and strategic depth from 0 A.D.],
    [#strong[Four Time Contracts];], [One engine, four modes. From a
    years-long persistent world to a 1-hour game night --- the same
    systems, compressed or expanded by mode configuration.],
    [#strong[Deep but Accessible];], [Spreadsheet optimizers and casual
    city-builders coexist. Every system has a simple surface and a deep
    optimization layer underneath.],
    [#strong[Open by Default];], [Free to play, free to host, free to
    mod. No pay-to-win. The scripting engine is a power-user convenience
    tool, never a competitive gate.],
    [#strong[Emergent Stories];], [The game does not script drama --- it
    creates conditions for it. Betrayed alliances, last-minute wonder
    races, desperate defenses, and improbable comebacks emerge from
    player decisions.],
    [#strong[Playstyle Agnostic Civs];], [Each civilization has a pushed
    archetype (aggressive raider, patient builder, divine diplomat) but
    never locks players into a single strategy. A city-builder can play
    Rome; a warmonger can play Maya.],
  )]
  , kind: table
  )

=== 1.3 Target Audience
<13-target-audience>
- #strong[Primary];: Veterans of Grepolis, Travian, OGame, and
  browser-based MMORTS games seeking a deeper, open-source alternative
- #strong[Secondary];: Strategy game enthusiasts (Civilization, Age of
  Empires, 0 A.D.) who want a persistent multiplayer world
- #strong[Tertiary];: Casual players drawn in by friends; developers and
  modders drawn by open architecture and scripting engine

=== 1.4 Tone & Aesthetic
<14-tone--aesthetic>
#strong[Clean and bold.] The UI prioritizes readability over decoration.
Information density matters --- a player should be able to parse their
city\'s status at a glance on mobile. The map is the centerpiece: rich,
zoomable, and alive with territory colors, unit movements, and world
events.

Aesthetically, the game is procedurally generated and presented through
a minimalist, highly legible UI. Civilizations are inspired by
historical cultures, but game balance takes precedence over strict
historical accuracy. Continents are fictional and currently generated
with Perlin noise in an archipelago layout; additional map presets are
planned but not yet implemented. Pantheons remain mostly faithful to
their mythological roots, while divine abilities are adapted for
gameplay first.

== 2. Game Modes
<2-game-modes>
This is the central architectural decision of 0 C.E. All four modes run
on the same engine. Mode configuration compresses or expands time,
restricts feature sets, and adjusts entry/exit mechanics.

=== 2.1 Mode Overview
<21-mode-overview>
#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([Attribute], [Full
      World], [Campaign], [Skirmish], [Game Night],),
    table.hline(),
    [#strong[Duration];], [2 months -- 10 years], [2 weeks -- 2
    months], [Days], [1 -- 4 hours],
    [#strong[Entry];], [Staggered (join anytime)], [Scheduled
    start], [Scheduled start], [Cold start (simultaneous)],
    [#strong[Production];], [Continuous real-time], [Continuous
    real-time], [Continuous real-time], [Continuous real-time
    (accelerated)],
    [#strong[Players];], [Configurable (no canonical
    size)], [Configurable], [Configurable], [Configurable],
    [#strong[Win Condition];], [World Domination], [Wonder
    hold], [Score], [Elimination / Score],
  )]
  , kind: table
  )

=== 2.2 System Availability Matrix
<22-system-availability-matrix>
#figure(
  align(center)[#table(
    columns: 5,
    align: (auto,auto,auto,auto,auto,),
    table.header([System], [Full World], [Campaign], [Skirmish], [Game
      Night],),
    table.hline(),
    [City Building], [✅], [✅], [✅], [✅],
    [Resource Economy], [✅], [✅], [✅], [✅],
    [Ascension / Eras], [✅], [✅], [✅], [❌],
    [Combat & Military], [✅], [✅], [✅], [✅],
    [Research / Tech Tree], [✅], [✅], [✅], [❌],
    [Alliances], [✅], [✅], [❌], [❌],
    [Diplomacy / Treaties], [✅], [✅], [❌], [❌],
    [Trade], [✅], [✅], [✅], [❌],
    [Espionage], [✅], [✅], [✅], [❌],
    [Divine Abilities], [✅], [✅], [✅], [❌],
    [Wonders], [✅], [✅], [❌], [❌],
    [Villages], [✅], [✅], [✅], [❌],
    [Social (chat, forum)], [✅], [✅], [✅], [✅],
    [Prestige / Leaderboard], [✅], [✅], [✅], [✅],
    [Scripting Engine (Wave 2)], [✅], [✅], [✅], [❌],
    [Heroes (Wave 2)], [✅], [✅], [❌], [❌],
  )]
  , kind: table
  )

=== 2.3 Full World
<23-full-world>
The canonical, persistent experience. No end date is set at creation ---
worlds run until the host retires them or a community milestone is
reached. New players can join at any time.

- #strong[Entry];: Staggered. Players can join anytime.
- #strong[Protection];: New cities receive a configurable protection
  window (default: 72 hours of immunity from attack).
- #strong[Win Condition];: #strong[World Domination] --- the first
  alliance to control every city slot on the map wins. The world then
  enters a Legacy state (read-only archive). No time limit is set;
  worlds run until domination is achieved or the host retires them.
- #strong[Elimination];: Losing all cities does not end your account.
  You may found a new city or migrate to a different world.

=== 2.4 Campaign
<24-campaign>
A structured competitive world with a defined arc and a winner. Designed
for organized play --- guilds, communities, tournaments.

- #strong[Entry];: Scheduled. A lobby opens before the world start date.
  New players can join at any time during the early game; once World
  Wonder construction begins, no new players can join.
- #strong[Duration];: 2 weeks to 2 months, configured at creation.
- #strong[Win Condition];: #strong[Wonder Hold] --- the first player or
  alliance to construct a designated Wonder and hold it for a configured
  duration (default: 7 days) wins the Campaign.
- #strong[Elimination];: Losing all cities ends your participation in
  that Campaign. Eliminated players may spectate.
- #strong[Late Join];: Enabled during early game only. Late join is
  permanently disabled once any World Wonder starts construction.

=== 2.5 Skirmish
<25-skirmish>
A fast, focused competitive world. All the strategic depth of a Campaign
compressed into days.

- #strong[Entry];: Scheduled. Simultaneous start.
- #strong[Duration];: Days (host-configured; typically 3--7 days).
- #strong[Win Condition];: #strong[Score] --- highest Prestige score at
  world end wins.
- #strong[Systems];: Alliances and Diplomacy are disabled. Trade and
  Espionage remain. This creates a more direct competitive environment
  where every player is, by default, a potential adversary.
- #strong[Elimination];: Losing all cities ends participation. Spectate
  only.

=== 2.6 Game Night
<26-game-night>
The most radical mode. Designed to be playable start-to-finish in a
single sitting with friends. Targets 1-hour minimum playable session.

- #strong[Entry];: Cold start. All players join a lobby and begin
  simultaneously when the host starts.
- #strong[Production];: Accelerated to compress the full arc of
  city-building and combat into hours. The acceleration multiplier is
  configured by the host (e.g., 60x normal speed = 1 in-game day per
  real minute).
- #strong[Win Condition];: #strong[Elimination] (last city standing) or
  #strong[Score] (highest Prestige at time limit), host choice.
- #strong[Elimination];: Instant. Lose your last city, you are out.
  Eliminated players spectate.
- #strong[Features];: Stripped to the essentials --- city building,
  economy, combat, social chat, prestige. No research tree, no
  diplomacy, no alliances, no divine abilities. Pure competitive
  city-building and combat.
- #strong[Session Design];: The host sets a hard time limit. If no
  elimination victory occurs, the highest Prestige score wins.

=== 2.7 Production Speed Model
<27-production-speed-model>
All modes use #strong[continuous real-time production] --- there are no
discrete economy ticks visible to the player. Resources accumulate
smoothly, construction progresses in real time, armies march in real
time.

Under the hood, the server processes production at a high-frequency
interval (e.g., every 30 seconds), but the player experience is always
of continuous flow. Game Night uses an acceleration multiplier applied
to all timers and rates:

```
effective_rate = base_rate × mode_speed_multiplier

Mode Speed Multipliers (defaults, host-configurable):
  Full World:  1.0x – 3.0x
  Campaign:    2.0x – 5.0x
  Skirmish:    3.0x – 10.0x
  Game Night:  7.0x – 15.0x
```

Construction, research, army training, march times, and resource
production all scale uniformly with the mode multiplier unless
explicitly overridden by mode-specific acquisition rules (see §10.8).

=== 2.8 Game Night Fairness Rules
<28-game-night-fairness-rules>
Game Night uses the same combat engine as other modes, but city
acquisition and counterplay windows are tuned for a 1-4 hour session.

- #strong[Acquisition Mode];: Uses #strong[Rapid Siege] only (no Revolt
  mode)
- #strong[Rapid Siege Rule];: Rapid Siege functions like a compressed
  siege. After destroying the defending city forces, the attacker takes
  temporary control of the city and must hold it for 12 minutes by
  default to complete the conquest.
- #strong[Occupation State];: While the timer is active, the attacker\'s
  units become the city\'s active defenders and allied support may
  reinforce the occupied city as normal.
- #strong[Defender Counterplay];: The current owner must attack their
  own occupied city and retake it before the timer expires to cancel the
  conquest.
- #strong[No Chain Abuse];: Captured cities receive temporary recapture
  immunity (default: 10 minutes)
- #strong[One Active Siege];: Each player may run only one active rapid
  siege at a time in Game Night
- #strong[Morale Scope];: Morale remains enabled but with reduced impact
  (recommended clamp: 0.90 to 1.10)
- #strong[Night Bonus];: Disabled by default in Game Night

#strong[Rapid siege duration scaling (optional host setting):]

```
rapid_siege_window_minutes = max(10, floor(20 / sqrt(world_speed_multiplier)))
```

If scaling is disabled, use a fixed window (recommended default: 12
minutes).

== 3. World Structure & Configuration
<3-world-structure--configuration>
=== 3.1 World Types & Hosting
<31-world-types--hosting>
#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([Type], [Host], [Access], [Reset],),
    table.hline(),
    [#strong[Official Public];], [Maintainer server], [Free,
    public], [Never (or major patch)],
    [#strong[Official Seasonal];], [Maintainer], [Free, public], [After
    season end],
    [#strong[Community Private];], [Self-hosted (SBC, VPS, home
    server)], [Free, self-host], [Admin\'s discretion],
  )]
  , kind: table
  )

All world types share the same codebase and configuration system. There
is no feature difference between official and self-hosted worlds.

=== 3.2 World Configuration (`world.toml`)
<32-world-configuration-worldtoml>
```toml
[world]
name        = "Aeturnum"
mode        = "full_world"        # full_world | campaign | skirmish | game_night
max_players = 500
map_seed    = 8675309
map_type    = "continental"       # continental | archipelago | pangaea | islands

[time]
speed_multiplier      = 1.0       # 1.0 for full world; higher for faster modes
late_join_hours       = 0         # 0 = always open (full world); 0 after N% elapsed (campaign)
protection_hours      = 72        # new city immunity window

[pvp]
early_protection      = true
protection_score_threshold = 500  # score at which protection ends
morale_enabled        = true
morale_min            = 0.70
morale_max            = 1.30
night_bonus_enabled   = true
night_bonus_start_utc = "00:00"
night_bonus_end_utc   = "08:00"
night_defense_bonus   = 0.50

[acquisition]
mode                  = "conquest" # conquest | revolt | rapid_siege
conquest_base_hours   = 24          # siege world baseline at 1.0x speed
revolt_window_hours   = 12          # revolt window baseline at 1.0x speed
rapid_siege_minutes   = 12          # game night default if not scaled
duration_scaling      = "by_speed" # by_speed | fixed
duration_min_hours    = 2
rapid_min_minutes     = 10
recapture_immunity_minutes = 120    # set 10 in game night presets
one_active_claim_per_player = false # true recommended for game night
ghost_claim_without_conquest = true

[victory]
condition             = "domination"    # domination | wonder_hold | score | elimination
wonder_hold_days      = 7
score_time_limit_hours = 0        # 0 = no limit

[economy]
speed_multiplier      = 1.0       # inherits from time.speed_multiplier unless overridden
max_cities_base       = 1         # starting city limit
city_cost_scaling     = 2.0       # each new city costs 2x the previous

[features]
eras_enabled          = true
research_enabled      = true
alliances_enabled     = true
diplomacy_enabled     = true
trade_enabled         = true
espionage_enabled     = true
divine_enabled        = true
wonders_enabled       = true
villages_enabled      = true
heroes_enabled        = false     # Wave 2
scripting_enabled     = false     # Wave 2
```

=== 3.3 World Registry
<33-world-registry>
A public API endpoint lists all worlds accepting players. Players browse
by: mode, player count, world age, map type, ruleset, and active victory
conditions. Private worlds may opt in or out of the registry.

=== 3.4 World Lifecycle
<34-world-lifecycle>
```
[Created] → [Map Generated] → [Lobby Open]
  → [Active: Gameplay] → [Endgame: Victory condition met or time limit reached]
  → [Legacy: Read-only archive with final standings]
  → [Reset] (seasonal/campaign only)
```
