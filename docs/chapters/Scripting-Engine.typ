= 0 C.E. - Scripting Engine <0-ce---scripting-engine>
#link("../nav/Home.pdf") | #link("Social.pdf")[Previous] | #link("UI-UX.pdf")[Next]

== 18. Scripting Engine <18-scripting-engine>

=== 18.1 Overview & Philosophy <181-overview--philosophy>
The Scripting Engine is a #strong[power-user convenience tool];. It
allows players to automate repetitive decisions they could make manually
--- but cannot do anything mechanically impossible for a human player.
It is never a competitive gate.

The engine launches in two waves:

- #strong[Wave 1];: Lua scripting (server-side, sandboxed)
- #strong[Wave 2];: Visual node-based editor (no-code, same capabilities
  as Lua)

=== 18.2 Access Model (Freemium) <182-access-model-freemium>
#figure(align(center)[#table(
  columns: 3,
  align: (
    auto,
    auto,
    auto,
  ),
  table.header(
    [Tier],
    [Script Slots],
    [Cost],
  ),
  table.hline(),                [Free],        [2 scripts],
  [Free],                       [Supporter],   [10 scripts],
  [One-time payment],           [Self-Hosted], [Unlimited],
  [Free (server admin grants)],
)], kind: table)

Scripts are #strong[never available in Game Night mode] --- the
compressed session length makes automation unfair in a way it isn\'t in
longer modes.

=== 18.3 What Scripts Can and Cannot Do <183-what-scripts-can-and-cannot-do>
#figure(align(center)[#table(
  columns: 2,
  align: (
    auto,
    auto,
  ),
  table.header(
    [✅ Allowed],
    [❌ Disallowed],
  ),
  table.hline(),        [Auto-queue building when resource \> threshold],
  [Alter game state
  directly],                     [Auto-trade when gold exceeds cap],
  [Bypass rate limits], [Alert alliance members on incoming army],
  [Access other players\'
  data],                     [Rebalance unit training queue],
  [Issue combat commands faster than
  human-possible],                     [Auto-pray for Favor when cap is near],
  [Exploit or chain actions in
  impossible sequences],                     [Notify when construction completes],
  [Run without execution time
  limits],
)], kind: table)

=== 18.4 Lua API (Wave 1) <184-lua-api-wave-1>
```lua
-- Read-only state
state.resources          -- {food, wood, stone, metal, gold, favor}
state.population         -- {current, cap, free, builders}
state.buildings          -- list with {id, tier, status, progress_pct}
state.military           -- {armies: [{id, units, x, y, status}]}
state.research           -- {active, queued, completed}
state.diplomacy          -- {relations: [{player_id, score, status}]}
state.divine             -- {god, faith_path, favor, available_powers}

-- Actions (rate-limited, logged)
queue_building(id)
queue_research(id)
send_trade_offer(player_id, {resource, amount})
activate_divine_power(power_id)
notify(message)              -- player notification feed only

-- Event hooks
on_resource_threshold(resource, amount, above_or_below, fn)
on_construction_complete(building_id, fn)
on_research_complete(tech_id, fn)
on_incoming_army(fn)
on_favor_threshold(amount, fn)
```

=== 18.5 Execution Constraints <185-execution-constraints>
- Max 100ms execution time per script per server cycle
- All script actions logged to audit trail
- Server-side execution in WASM sandbox
- Rate-limited: scripts cannot execute more actions per second than a
  human could
- Admins on public worlds can inspect any player\'s scripts
