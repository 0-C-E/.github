= 0 C.E. - Roadmap <0-ce---roadmap>
#link("../nav/Home.pdf") | #link("Modding.pdf")[Previous] | #link("Heroes.pdf")[Next]

== 25. Roadmap & MVP Scope <25-roadmap--mvp-scope>

=== 25.1 MVP (v0.1 --- 6-Month Target) <251-mvp-v01--6-month-target>
#strong[In Scope];:

- ☐ 5 civilizations with full TOML data definitions
- ☐ Full World and Game Night modes (2 of 4 modes)
- ☐ Continuous real-time production engine
- ☐ Tile-scan resource system
- ☐ Farm-gated population + auto-assigned builders
- ☐ Building trees (3 categories, 3 tiers)
- ☐ Basic military (5 unit types, formation system, abstracted combat)
- ☐ City defense: walls + garrison + militia
- ☐ Grepolis-baseline diplomacy (war, peace, NAP, alliance)
- ☐ Trade routes
- ☐ Espionage (scout garrison + 2 sabotage missions)
- ☐ Research (Era I + Era II)
- ☐ Divine system (3 gods, Tier 1 powers, monotheist/polytheist choice)
- ☐ Procedural world gen (continental + archipelago map types)
- ☐ Continuous Leaflet.js map (no grid)
- ☐ WebSocket real-time updates
- ☐ Event Feed (personal notification stream)
- ☐ In-game messaging (direct + alliance)
- ☐ Prestige system (cosmetic only)
- ☐ Docker Compose single-node deployment

#strong[Explicitly Out of MVP];:

- Campaign and Skirmish modes (v0.2)
- Scripting Engine / Lua (v0.2)
- Wonders (v0.2)
- Full espionage mission set (v0.2)
- Era III + Era IV research (v0.2)
- Full god roster (v0.2 adds 2 additional gods)
- Heroes system (Wave 2 / v0.3)
- Visual node-based scripting (Wave 2 / v0.3)
- Mobile-optimized UI (v0.2)

=== 25.2 Post-MVP Milestones <252-post-mvp-milestones>
#figure(
  align(center)[#table(
    columns: 3,
    align: (
      auto,
      auto,
      auto,
    ),
    table.header([Version], [Target], [Focus]),
    table.hline(), [v0.2], [+3 months],
    [Campaign + Skirmish modes, Wonders, full
      Espionage, Lua scripting, mobile UI],
    [v0.3],
    [+3 months],
    [Heroes system, Era III/IV, 2 new civs, visual
      scripting node editor],
    [v0.4],
    [+2 months],
    [Performance hardening, 100-player SBC
      validation, balance pass],
    [v1.0],
    [+4 months],
    [Public launch, full contributor docs,
      community modding guide],
  )],
  kind: table,
)

=== 25.3 Wave 2 Features (Heroes) <253-wave-2-features-heroes>
Heroes are fully designed in #strong[§22 --- Heroes System] (see
#link("Heroes.pdf")[Heroes];). Summary: named historical figures, fixed
as military or governor type at selection, 1 per city (scaling with
expansion), XP-driven linear ability progression, wounded on defeat
(recovery period, not permanent death). Wave 2 because they require
significant art investment and careful balance testing to avoid
trivializing combat for experienced players.
