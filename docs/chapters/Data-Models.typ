= 0 C.E. - Data Models
<0-ce---data-models>
#link("../nav/Home.pdf") | #link("Technical-Architecture.pdf")[Previous] |
#link("Event-System.pdf")[Next]

== 21. Data Models & Schemas
<21-data-models--schemas>
=== 21.1 Core Tables
<211-core-tables>
```sql
-- Players (global, cross-world)
CREATE TABLE players (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username      VARCHAR(32) UNIQUE NOT NULL,
    email         VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    prestige      BIGINT DEFAULT 0,
    faith_title   VARCHAR(64),
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- Worlds
CREATE TABLE worlds (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name          VARCHAR(64) NOT NULL,
    mode          VARCHAR(16) NOT NULL,         -- full_world | campaign | skirmish | game_night
    config        JSONB NOT NULL,               -- world.toml serialized
    seed          BIGINT NOT NULL,
    status        VARCHAR(16) DEFAULT 'active', -- active | ended | archived
    started_at    TIMESTAMPTZ,
    ends_at       TIMESTAMPTZ,                  -- NULL for full_world
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- World Players (player participation per world)
CREATE TABLE world_players (
    world_id      UUID REFERENCES worlds(id),
    player_id     UUID REFERENCES players(id),
    civ_id        VARCHAR(64) NOT NULL,
    faith_path    VARCHAR(16) DEFAULT 'polytheist', -- monotheist | polytheist
    god_id        VARCHAR(64),                  -- primary god (monotheist: only god; polytheist: main)
    joined_at     TIMESTAMPTZ DEFAULT NOW(),
    eliminated    BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (world_id, player_id)
);

-- Cities
CREATE TABLE cities (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    world_id      UUID REFERENCES worlds(id),
    player_id     UUID REFERENCES players(id),
    name          VARCHAR(64) NOT NULL,
    x             FLOAT NOT NULL,
    y             FLOAT NOT NULL,
    population    INTEGER DEFAULT 100,
    pop_cap       INTEGER DEFAULT 200,
    culture_points BIGINT DEFAULT 0,
    cultural_level INTEGER DEFAULT 0,
    gold_founding_gift INTEGER DEFAULT 0,    -- one-time gift credited at city founding
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- Resources (per city)
CREATE TABLE city_resources (
    city_id       UUID PRIMARY KEY REFERENCES cities(id),
    food          BIGINT DEFAULT 500,
    wood          BIGINT DEFAULT 500,
    stone         BIGINT DEFAULT 200,
    metal         BIGINT DEFAULT 0,
    gold          BIGINT DEFAULT 100,
    favor         BIGINT DEFAULT 0,
    updated_at    TIMESTAMPTZ DEFAULT NOW()
);

-- Resource production rates (cached tile scan results)
CREATE TABLE city_production (
    city_id       UUID PRIMARY KEY REFERENCES cities(id),
    food_rate     FLOAT NOT NULL DEFAULT 1.0,
    wood_rate     FLOAT NOT NULL DEFAULT 1.0,
    stone_rate    FLOAT NOT NULL DEFAULT 0.5,
    metal_rate    FLOAT NOT NULL DEFAULT 0.0,
    favor_rate    FLOAT NOT NULL DEFAULT 0.0,
    computed_at   TIMESTAMPTZ DEFAULT NOW()
    -- gold is a one-time founding gift (see cities.gold_founding_gift), not a rate
);

-- Buildings
CREATE TABLE buildings (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    city_id       UUID REFERENCES cities(id),
    building_id   VARCHAR(64) NOT NULL,
    tier          INTEGER DEFAULT 1,
    status        VARCHAR(16) DEFAULT 'complete', -- complete | constructing | upgrading
    completes_at  TIMESTAMPTZ,
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- Armies
CREATE TABLE armies (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    world_id      UUID REFERENCES worlds(id),
    player_id     UUID REFERENCES players(id),
    name          VARCHAR(64),
    x             FLOAT NOT NULL,
    y             FLOAT NOT NULL,
    status        VARCHAR(16) DEFAULT 'idle',
    formation     VARCHAR(32) DEFAULT 'balanced',
    destination_x FLOAT,
    destination_y FLOAT,
    arrives_at    TIMESTAMPTZ
);

-- Army unit composition
CREATE TABLE army_units (
    army_id       UUID REFERENCES armies(id),
    unit_id       VARCHAR(64) NOT NULL,
    quantity      INTEGER NOT NULL,
    hp_pct        FLOAT DEFAULT 1.0,
    PRIMARY KEY (army_id, unit_id)
);

-- Research
CREATE TABLE player_research (
    world_id      UUID REFERENCES worlds(id),
    player_id     UUID REFERENCES players(id),
    tech_id       VARCHAR(64) NOT NULL,
    progress      INTEGER DEFAULT 0,
    completed     BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (world_id, player_id, tech_id)
);

-- Diplomatic Relations
CREATE TABLE diplomatic_relations (
    world_id      UUID REFERENCES worlds(id),
    player_a      UUID REFERENCES players(id),
    player_b      UUID REFERENCES players(id),
    score         INTEGER DEFAULT 0,
    status        VARCHAR(32) DEFAULT 'neutral',
    active_treaty VARCHAR(32),
    updated_at    TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (world_id, player_a, player_b)
);

-- Alliances
CREATE TABLE alliances (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    world_id      UUID REFERENCES worlds(id),
    name          VARCHAR(64) NOT NULL,
    created_at    TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE alliance_members (
    alliance_id   UUID REFERENCES alliances(id),
    player_id     UUID REFERENCES players(id),
    role          VARCHAR(16) DEFAULT 'member', -- founder | officer | member
    joined_at     TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (alliance_id, player_id)
);

-- Spies
CREATE TABLE spies (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    world_id      UUID REFERENCES worlds(id),
    owner_id      UUID REFERENCES players(id),
    target_city_id UUID REFERENCES cities(id),
    mission       VARCHAR(32) NOT NULL,
    status        VARCHAR(16) DEFAULT 'active', -- active | complete | captured
    completes_at  TIMESTAMPTZ NOT NULL
);

-- Game Events Log
CREATE TABLE game_events (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    world_id      UUID REFERENCES worlds(id),
    event_type    VARCHAR(64) NOT NULL,
    payload       JSONB NOT NULL,
    created_at    TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX idx_game_events_world ON game_events(world_id, created_at DESC);

-- Messages
CREATE TABLE messages (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    world_id      UUID REFERENCES worlds(id),
    sender_id     UUID REFERENCES players(id),
    recipient_id  UUID REFERENCES players(id),   -- NULL for alliance-scope
    alliance_id   UUID REFERENCES alliances(id), -- NULL for direct messages
    subject       VARCHAR(128),
    body          TEXT NOT NULL,
    is_read       BOOLEAN DEFAULT FALSE,
    created_at    TIMESTAMPTZ DEFAULT NOW()
);
```
