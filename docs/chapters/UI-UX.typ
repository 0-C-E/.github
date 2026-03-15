= 0 C.E. - UI and UX <0-ce---ui-and-ux>
#link("../nav/Home.pdf") | #link("Scripting-Engine.pdf")[Previous] |
#link("Technical-Architecture.pdf")[Next]

== 19. UI/UX Design Principles <19-uiux-design-principles>

=== 19.1 Design Language <191-design-language>
#strong[Clean and bold.] The aesthetic is modern strategy game ---
information density prioritized, visual noise minimized. Every pixel of
UI real estate earns its place. The map is the primary interface; panels
are overlays that retreat when not needed.

Color palette:

- #strong[Primary];: Deep ochre (`#C8872A`), slate (`#4A5568`), bone
  white (`#F5F0E8`)
- #strong[Accent];: Crimson (`#8B1A1A`), lapis (`#2B4C8C`), verdigris
  (`#2D7D6F`)
- #strong[UI Chrome];: Near-black (`#1A1A1A`), dark stone (`#2D2D2D`),
  light stone (`#E8E4DC`)

=== 19.2 Primary Views <192-primary-views>
#figure(align(center)[#table(
  columns: 2,
  align: (
    auto,
    auto,
  ),
  table.header(
    [View],
    [Description],
  ),
  table.hline(),                [#strong[World Map];],
  [Full-screen Leaflet.js; primary interface;
  all overlays accessible here],                             [#strong[City Panel];],
  [Slide-in overlay; buildings, resources,
  queue, population],                             [#strong[Military Panel];],
  [Army management, march orders, garrison
  assignment],                             [#strong[Research Tree];],
  [Visual era-based tech tree], [#strong[Divine Panel];],
  [God selection, Favor meter, available
  powers],                             [#strong[Diplomacy Hub];],
  [Relations matrix, active treaties,
  diplomatic messages],                             [#strong[Alliance Portal];],
  [Alliance management, forum, bank, war
  status],                             [#strong[Event Feed];],
  [Chronological personal notification
  stream],                             [#strong[Leaderboard];],
  [Prestige, active victory condition
  progress],                             [#strong[World Map Overlays];],
  [Territory, resources, armies (own +
  scouted), active trade dispatches],
)], kind: table)

=== 19.3 Responsive Design <193-responsive-design>
All views function on:

- #strong[Desktop] (1024px+): Full side panels, multi-column layouts
- #strong[Tablet] (768px): Collapsible panels, tap-to-expand
- #strong[Mobile] (375px+): Bottom sheet UI, map-first, event feed
  prominent

The Event Feed is the primary mobile interface --- designed so a player
can manage their city in a 2-minute phone session.

=== 19.4 Performance Budget <194-performance-budget>
#figure(align(center)[#table(
  columns: 2,
  align: (
    auto,
    auto,
  ),
  table.header(
    [Element],
    [Target],
  ),
  table.hline(),                     [Initial page load],
  [\< 3s on 3G],                     [Map tile render],
  [\< 100ms per zoom],               [City panel open],
  [\< 50ms],                         [WebSocket latency],
  [\< 200ms],                        [Production update (visible)],
  [Smooth, every 5s visual refresh],
)], kind: table)
