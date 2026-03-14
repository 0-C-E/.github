= 0 C.E. - Event System
<0-ce---event-system>
#link("../nav/Home.typ") | #link("Data-Models.typ")[Previous] |
#link("Balancing.typ")[Next]

== 22. Event System
<22-event-system>
=== 22.1 Core Event Types
<221-core-event-types>
```rust
pub enum GameEvent {
    // Economy
    ResourceDelta      { city_id: Uuid, resource: Resource, delta: i64 },
    StorageCapHit      { city_id: Uuid, resource: Resource },

    // Construction
    BuildingQueued     { city_id: Uuid, building_id: String, completes_at: DateTime<Utc> },
    BuildingCompleted  { city_id: Uuid, building_id: String, tier: u8 },
    BuildingCancelled  { city_id: Uuid, building_id: String, refund: ResourceBundle },

    // Population
    PopulationChanged  { city_id: Uuid, delta: i32, new_total: u32 },
    CulturePointsGained { city_id: Uuid, amount: u32, source: String },
    CulturalLevelUp     { player_id: Uuid, world_id: Uuid, new_level: u32 },
    CitySlotUnlocked    { player_id: Uuid, world_id: Uuid },

    // Military
    ArmyDispatched     { army_id: Uuid, formation: Formation, arrives_at: DateTime<Utc> },
    ArmyArrived        { army_id: Uuid, location: Coord },
    CombatResolved     { attacker: Uuid, defender: Uuid, result: CombatResult, report: CombatReport },
    CityCaptured       { city_id: Uuid, new_owner: Uuid, previous_owner: Uuid },
    CityRaided         { city_id: Uuid, attacker: Uuid, loot: ResourceBundle },

    // Research
    ResearchStarted    { player_id: Uuid, world_id: Uuid, tech_id: String },
    ResearchCompleted  { player_id: Uuid, world_id: Uuid, tech_id: String },
    EraAdvanced        { player_id: Uuid, world_id: Uuid, new_era: u8 },

    // Divine
    FavorSpent         { player_id: Uuid, power_id: String, target: Option<Uuid> },
    DivinePowerActivated { player_id: Uuid, power_id: String, narrative: String },

    // Espionage
    SpyMissionStarted  { spy_id: Uuid, mission: Mission },
    SpyMissionComplete { spy_id: Uuid, mission: Mission, success: bool },
    SpyCaptured        { spy_id: Uuid, owner_id: Uuid, city_id: Uuid },

    // Diplomacy
    WarDeclared        { aggressor: Uuid, target: Uuid, world_id: Uuid },
    PeaceAgreed        { player_a: Uuid, player_b: Uuid, terms: Option<DiplomacyTerms> },
    TreatyBroken       { breaker: Uuid, other: Uuid, treaty_type: String },
    AllianceFormed     { alliance_id: Uuid, founders: Vec<Uuid> },
    AllianceDissolved  { alliance_id: Uuid },

    // Victory
    WonderConstructed  { wonder_id: String, owner: Uuid, world_id: Uuid },
    VictoryAchieved    { player_id: Uuid, world_id: Uuid, condition: VictoryType },
    WorldEnded         { world_id: Uuid, winner: Option<Uuid>, final_standings: Vec<Standing> },
}
```

=== 22.2 Event Pipeline
<222-event-pipeline>
```
Game Action (player or server)
    → Validate (auth, rate limit, game rule check)
    → Apply State Change (mutate DB)
    → Emit GameEvent (Tokio mpsc channel)
        ├── Persistence Handler  → INSERT INTO game_events
        ├── WebSocket Dispatcher → push to relevant connected clients
        ├── Script Trigger       → evaluate Lua hooks for affected players
        └── Victory Checker      → evaluate win conditions for mode
```
