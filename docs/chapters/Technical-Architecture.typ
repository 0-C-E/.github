= 0 C.E. - Technical Architecture
<0-ce---technical-architecture>
#link("../nav/Home.pdf") | #link("UI-UX.pdf")[Previous] |
#link("Data-Models.pdf")[Next]

== 20. Technical Architecture Reference
<20-technical-architecture-reference>
=== 20.1 System Diagram
<201-system-diagram>
```
Browser (Leaflet.js + HTML5 Canvas)
    ↕ REST API (Actix-web)
    ↕ WebSocket (Tungstenite)
        ↓
    API Layer (auth, rate-limit, routing, session)
        ↓
    Game Logic Layer (pure Rust, no I/O)
    ├── EconomyEngine        (continuous production, tile scan)
    ├── CombatResolver       (abstracted battle, formation logic)
    ├── DiplomacySystem      (relations, treaties, alliance)
    ├── ResearchEngine       (era progression, tech tree)
    ├── DivineSystem         (favor economy, power activation)
    ├── EspionageEngine      (mission resolution, detection)
    ├── MapGenerator         (proc gen, biome, resource placement)
    └── VictoryChecker       (condition evaluation per mode)
        ↓
    Persistence Layer (SQLx + PostgreSQL)
        ↓
    Event Bus (Tokio mpsc channels)
    ├── Persistence (write events)
    ├── WebSocket Broadcast (push to relevant clients)
    ├── Scripting Sandbox (trigger player Lua scripts)
    └── Victory Check (scan conditions on state-change events)
```

=== 20.2 Crate Structure
<202-crate-structure>
```
0ce/
├── crates/
│   ├── api/              # Actix-web handlers, auth, WebSocket
│   ├── game-logic/       # Pure domain logic, zero async, zero I/O
│   │   ├── economy/      # Production, tile scan, storage
│   │   ├── combat/       # Formation resolution, battle phases
│   │   ├── diplomacy/    # Relations, treaties, alliance rules
│   │   ├── research/     # Tech tree, era advancement
│   │   ├── divine/       # Favor, powers, faith paths
│   │   ├── espionage/    # Mission system, detection
│   │   └── map/          # World gen, terrain, territory
│   ├── persistence/      # SQLx queries, migrations
│   ├── events/           # GameEvent enum, bus
│   ├── scripting/        # Lua sandbox (WASM)
│   ├── world-gen/        # Deterministic map generation
│   └── shared/           # Types, errors, config, mode definitions
├── frontend/
│   ├── src/
│   │   ├── map/          # Leaflet integration, overlays
│   │   ├── ui/           # Panels, feeds, forms
│   │   ├── ws/           # WebSocket client, reconnect logic
│   │   └── state/        # Client-side state cache
│   └── assets/
├── config/
│   ├── civs/             # rome.toml, iron_covenant.toml, …
│   ├── buildings/        # farm.toml, barracks.toml, …
│   ├── units/            # berserker.toml, archer.toml, …
│   ├── technologies/     # iron_working.toml, …
│   ├── gods/             # veldran.toml, auranis.toml, …
│   └── wonders/          # eternal_pyre.toml, …
├── migrations/           # PostgreSQL (sqlx)
├── docker-compose.yml
└── Cargo.toml
```

=== 20.3 SBC Performance Targets
<203-sbc-performance-targets>
#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Metric], [Target], [Strategy],),
    table.hline(),
    [RAM at 100 players], [\< 512MB], [Connection pooling, stateless
    handlers],
    [Production processing], [\< 1s per cycle], [Batched SQL, indexed
    city queries],
    [DB connections], [\< 20 pooled], [SQLx PgPool],
    [WebSocket connections], [100 concurrent], [Tokio async, actor
    model],
    [Map tile serving], [\< 50ms cached], [Pre-generated tiles + HTTP
    cache headers],
  )]
  , kind: table
  )
