= 0 C.E. - World and Civilizations <0-ce---world-and-civilizations>
#link("../nav/Home.pdf") | #link("Vision-and-Modes.pdf")[Previous] |
#link("Economy.pdf")[Next]

== 4. World Map & Territory <4-world-map--territory>

=== 4.1 Coordinate System <41-coordinate-system>
The world map is a #strong[gridless 2D plane];. Positions use integer
coordinates rendered via Leaflet.js with custom map layers. Distance,
territory, and movement are all calculated directly from those world
coordinates.

This mirrors Grepolis\' sense of spatial readability while using a freer
coordinate system that allows for organic territory shapes, natural
borders, and fluid unit movement.

=== 4.2 Map Generation <42-map-generation>
Worlds are procedurally generated at creation using a deterministic
seed. The same seed always produces the same world.

#strong[Generation Pipeline];:

+ #strong[Heightmap];: Simplex noise → continental shelves, mountain
  ranges, valleys, coastlines
+ #strong[Biome Assignment];: Elevation + latitude analog → desert,
  grassland, forest, jungle, steppe, tundra, coastal
+ #strong[Resource Scanning Zones];: Each potential city location has a
  surrounding scan radius pre-computed for resource modifiers (see §6.2)
+ #strong[Strategic Node Placement];: Metal veins, gold nodes, and other
  strategic resources placed with weighted biome-appropriate
  distribution
+ #strong[Neutral Sites];: Villages and ruins placed procedurally
+ #strong[Spawn Point Validation];: Valid player spawn points identified
  with minimum spacing enforcement

#strong[Map Types];:

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header([Type], [Description], [Naval?]),
    table.hline(),
    [#strong[Continental];],
    [Large landmasses with inland
      seas],
    [Optional coastal],
    [#strong[Archipelago];],
    [Island chains, heavy ocean
      presence],
    [Full naval layer active],
    [#strong[Pangaea];],
    [Single giant continent,
      land-locked
      majority],
    [Minimal naval],
    [#strong[Islands];],
    [Medium islands separated
      by sea],
    [Full naval
      layer active],
  )],
  kind: table,
)

Naval mechanics (transport ships, naval combat, blockades, coastal
raids) are only active when the map type includes significant ocean
presence. Archipelago and Islands maps enable the full naval layer.

=== 4.3 Visibility <43-visibility>
#strong[The map is fully visible from turn 1.] There is no fog of war.
All terrain, resource nodes, and city locations are visible to all
players at all times.

Unit positions and city internal stats (resource levels, building
composition, garrison size) are hidden and require espionage to reveal.

This design choice creates a world of open geopolitical information ---
you know where everyone is --- but strategic opacity around military and
economic state.

=== 4.4 Terrain Types <44-terrain-types>
#figure(
  align(center)[#table(
    columns: 7,
    align: (auto, auto, auto, auto, auto, auto, auto),
    table.header(
      [Terrain],
      [Movement Mod],
      [🪵 Wood],
      [🪨 Stone],
      [🌾
        Food],
      [⛏️ Metal],
      [✨ Favor],
    ),
    table.hline(), [Beach], [0.9x], [-10%], [-5%], [+10%], [0%],
    [+5%], [Coast], [1.0x], [0%], [-5%], [+15%], [0%],
    [-10%], [Deep Harbor], [1.0x], [-5%], [-10%], [+20%], [-5%],
    [0%], [Desert], [0.8x], [-20%], [+20%], [-25%], [+15%],
    [+10%], [Far Land (out of bounds)], [N/A], [0%], [0%], [0%], [0%],
    [0%], [Forest], [0.6x], [+30%], [-5%], [+10%], [-20%],
    [-15%], [Highlands], [0.7x], [-15%], [+20%], [-10%], [+20%],
    [-15%], [Hills], [0.5x], [-5%], [+25%], [+5%], [+5%],
    [-30%], [Mountains], [0.2x], [-20%], [+25%], [-20%], [+25%],
    [-10%], [Ocean], [1.0x (naval)], [0%], [0%], [+15%], [0%],
    [-15%], [Plains], [1.0x], [+5%], [-10%], [+25%], [-15%],
    [-5%], [Sacred Grove], [0.7x], [+10%], [-20%], [+5%], [-25%],
    [+30%], [Snowy Peaks], [0.3x], [-15%], [+5%], [-30%], [+35%],
    [+5%], [Swamp], [0.6x], [+5%], [-20%], [+15%], [-10%],
    [+10%], [Tundra], [0.5x], [-15%], [+5%], [-20%], [+25%],
    [+5%], [Valley], [1.1x], [+15%], [-5%], [+20%], [-15%],
    [-15%],
  )],
  kind: table,
)

=== 4.5 Territory Control <45-territory-control>
There is no radius-based territory control. Players control only the
cities and city slots they own, in the same spirit as Grepolis.

- #strong[Build Scope];: Construction is limited to owned cities only.
- #strong[Map Control];: Strategic control comes from holding city slots
  and cities, not from projected influence areas.
- #strong[No Outposts / No Contested Radius];: There are no military
  outposts and no overlap-based contested zones.

=== 4.6 Special Map Features <46-special-map-features>
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto, auto),
    table.header([Feature], [Effect]),
    table.hline(), [#strong[Ancient Ruins];],
    [Discoverable by sending units; one-time
      research boost or resource cache],
    [#strong[Sacred Site];],
    [Required for specific Wonder construction;
      spawns contested],
  )],
  kind: table,
)

== 5. Civilizations <5-civilizations>

=== 5.1 Design Philosophy <51-design-philosophy>
Civilizations in 0 C.E. are #strong[historically grounded archetypes
  with open playstyles];. Each civilization draws from a real ancient
civilization --- its mechanics, unit names, buildings, and divine system
are inspired by history, but mechanical fit always takes priority over
strict historical accuracy. Where history and fun diverge, fun wins.

#strong[Core design rules];:

- Every civilization shares the same underlying systems (buildings,
  units, research, divine)
- Civs differ in stat modifiers, cost structures, scaling curves, and
  exclusive mechanics
- Each civilization has a pushed archetype suggesting a primary strategy
  --- but never forcing it
- #strong[No civilization is a hard counter to another.] Every
  civilization can win via any victory path.
- #strong[No mechanical safety net between skill levels.] Skill ceiling
  is the only balance lever. A beginner playing Sumer can beat an expert
  playing Maya if the expert plays poorly. Civilization difficulty is
  hidden --- discovered through play and community knowledge, never
  telegraphed by the UI.

=== 5.2 Difficulty & Archetype Overview <52-difficulty--archetype-overview>
// #figure(
//   align(center)[#table(
//     columns: 4,
//     align: (auto, auto, auto, auto),
//     table.header(
//       [Civilization],
//       [Archetype],
//       [Difficulty],
//       [Core
//       Identity],
//     ),
//     table.hline(), [#strong[Sumer];],  [Foundation Builder],     [⭐],
//     [First civilization
//     --- deep tech, broad construction, forgiving economy],              [#strong[Greece];], [Naval
//     / Trade],          [⭐⭐],
//     [Sea power, colonies,
//     Olympian gods, active map presence],              [#strong[Egypt];],  [Hybrid
//     Builder +
//     Divine],                         [⭐⭐⭐],
//     [Capital-focused, time-scaling divine bonuses,
//     Pharaoh as living god],              [#strong[Rome];],   [Administrative Builder], [⭐⭐⭐⭐],
//     [Provincial
//     scaling, multi-city efficiency, engineering depth],              [#strong[Maya];],   [Divine
//     / Sacrifice],     [⭐⭐⭐⭐⭐],
//     [Blood
//     sacrifice economy, complex pantheon, punishing mismanagement],
//   )],
//   kind: table,
// )

Difficulty reflects #strong[skill ceiling] --- how much mastery the
civilization rewards --- not how punishing it is to a beginner. A
beginner playing Maya still has access to all mechanics; they simply
won\'t extract the civilization\'s full potential.

=== 5.3 Sumer --- The First Cities <53-sumer--the-first-cities>
#emph[Archetype: Foundation Builder | Difficulty: ⭐] #emph[\"Before all
  others, we built. Before all others, we wrote. Before all others, we
  knew.\"]

Sumer is the entry point civilization --- the most historically
appropriate choice, since Sumer invented urban civilization itself.
Mechanically, they are the most intuitive: build things, unlock things,
grow. Their depth comes from a unique building technology system that
rewards players who understand construction sequencing. A beginner can
play Sumer reactively and do well; an expert extracts compounding
advantages from optimal build orders.

==== Historical Grounding <historical-grounding>
The Sumerians (c. 4500--1900 BCE, Mesopotamia) built the world\'s first
cities --- Uruk, Ur, Eridu. They invented writing (cuneiform),
mathematics, the wheel, and formalized irrigation. Their ziggurats were
stepped temple-towers serving as both religious centers and
administrative hubs. The Anunnaki were their pantheon --- gods of sky,
earth, and underworld.

==== Mechanics <mechanics>
#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header([Attribute], [Design], [Historical Basis]),
    table.hline(),
    [#strong[Passive --- Cradle
      of Civilization];],
    [All building
      construction costs reduced by 10%. Each completed building tier
      permanently increases research speed by 1% (stacks, no
      cap).],
    [Sumerians pioneered both construction and written
      knowledge],
    [#strong[Passive ---
      Irrigation Mastery];],
    [Farm buildings produce
      20% more food.],
    [Sumerian civilization was built on canal
      irrigation of the Tigris-Euphrates],
    [#strong[Active ---
        Cuneiform Decree] (cooldown 48h/world
      speed)],
    [Instantly complete the
      current lowest-tier building in the
      construction queue.],
    [Writing enabled administrative efficiency and
      record-keeping],
    [#strong[Unique
        Unit --- Sumerian Spearman] (replaces Spearmen
      T1)],
    [Standard stats + formation
      bonus: for every 10% of the army
      composed of Spearmen, Spearmen gain +3% defense (max
      \+15%).],
    [Earliest recorded phalanx-style infantry formations],
    [#strong[Unique Building ---
        Ziggurat] (replaces
      Temple)],
    [Functions as Temple
      (Favor generation) AND Workshop
      (research generation) simultaneously. Cannot be upgraded
      independently --- it scales with city population tier
      instead.],
    [Ziggurats were simultaneously religious, administrative,
      and scholarly centers],
    [#strong[God
      Affinity];],
    [Anunnaki pantheon. Bonus Favor from
      construction completions and irrigation buildings. Unique divine
      power: #emph[Enki\'s Gift] --- target city receives a temporary
      Metal production surge (representing Sumerian metalworking
      knowledge).],
    [Enki was god of water, knowledge, and craftsmanship],
  )],
  kind: table,
)

==== Skill Expression <skill-expression>
- #strong[Beginner];: Build Ziggurats early, let research compound
  passively, and prioritize irrigation-friendly starts. Straightforward
  and forgiving.
- #strong[Expert];: Sequence the Cuneiform Decree to skip expensive
  mid-tier construction bottlenecks. Optimize Ziggurat placement to
  maximize simultaneous Favor + research output. Stack the 1% research
  bonus as early as possible to create a late-game research avalanche.

==== Playstyle Flexibility <playstyle-flexibility>
A militarist Sumer uses cheap construction to rush Barracks tiers ahead
of schedule and leverages compounding research to reach advanced
military technologies faster. A diplomatic Sumer uses Ziggurat Favor
output to maintain a strong divine presence while keeping build costs
low enough to maintain multiple cities cheaply.

=== 5.4 Greece --- The City-States <54-greece--the-city-states>
#emph[Archetype: Naval / Trade | Difficulty: ⭐⭐] #emph[\"The sea is
  not our obstacle. The sea is our empire.\"]

Greece is the sea power civilization --- their strength flows from
coastal presence, active trade, and the most versatile divine system in
the game (the full Olympian pantheon). They are not the strongest in any
single domain on land, but they project power across distances that
confound purely land-based civs. Moderately complex: naval mechanics
require map awareness, and active trade management rewards engaged
players.

==== Historical Grounding <historical-grounding-1>
Ancient Greece (c. 800--146 BCE) was not a unified empire but a network
of competing city-states (poleis) connected by the Aegean and
Mediterranean seas. Athens dominated trade and culture; Sparta dominated
land warfare; Macedon under Alexander projected both. The Olympian gods
(Zeus, Athena, Poseidon, Ares, Apollo, etc.) were deeply embedded in
every aspect of public and military life. Greek colonies stretched from
the Black Sea to Spain.

==== Mechanics <mechanics-1>
#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header([Attribute], [Design], [Historical Basis]),
    table.hline(),
    [#strong[Passive --- Thalassocracy];],
    [Naval
      units move 25% faster.
      Gold bonus from completed trades +20% when sent from coastal
      cities.],
    [Greek naval dominance; Athens\' trade empire],
    [#strong[Passive --- City-State
      Network];],
    [Each additional city
      Greece founds beyond the first generates a small passive gold income
      bonus to all other Greek cities. Maximum 5 cities before this bonus
      plateaus.],
    [Greek polis network; economic interdependence],
    [#strong[Active --- Agora] (cooldown
      36h)],
    [For 8 hours, gold
      bonuses from all completed trades doubled.],
    [The Agora was the
      commercial and civic heart of every Greek city],
    [#strong[Unique
        Unit --- Trireme] (naval unit, replaces standard
      warship)],
    [Faster than standard naval
      units; rams deal bonus damage
      on first contact; can transport a small number of land units.],
    [The
      trireme was the defining Greek naval weapon],
    [#strong[Unique
        Unit --- Hoplite] (replaces Heavy
      Infantry)],
    [Standard stats + Phalanx
      Formation: for every 10% of
      the army composed of Hoplites, Hoplites gain +4% defense and +2%
      attack (max +20% defense, +10% attack). Weaker individually than
      standard Heavy Infantry; stronger in mass.],
    [Greek hoplite warfare
      relied on collective formation discipline],
    [#strong[Unique
        Building --- Stoa] (replaces Marketplace
      T2)],
    [Generates gold + increases simultaneous
      trade dispatch
      capacity by 1 + grants 10 bonus Culture Points per completed
      trade.],
    [The Stoa was a covered walkway serving as marketplace and
      philosophical gathering place],
    [#strong[God
      Affinity];],
    [Full Olympian pantheon --- Greece has
      access to more gods than any other civilization (see §9). Each god
      represents a different strategic domain. Polytheist path is
      historically authentic for Greece and mechanically
      rewarded.],
    [Greek religion was explicitly polytheistic and deeply
      civic],
  )],
  kind: table,
)

==== Skill Expression <skill-expression-1>
- #strong[Beginner];: Settle coastal, build Harbors, dispatch merchants
  actively, let gold accumulate. Hoplites in groups are naturally
  effective.
- #strong[Expert];: Optimise trade dispatch timing around Agora windows
  for maximum gold. Use Trireme speed for surprise coastal raids that
  disrupt enemy economies. Manage the Olympian pantheon to maintain
  situational divine advantages simultaneously.

==== Playstyle Flexibility <playstyle-flexibility-1>
A militarist Greece uses Trireme speed for rapid force projection and
Hoplite mass formations for devastating land battles. A builder Greece
ignores naval warfare and uses City-State Network income to fund a rich
inland economy, treating naval units as economic deterrents only.

=== 5.5 Egypt --- The Eternal Kingdom <55-egypt--the-eternal-kingdom>
#emph[Archetype: Hybrid Builder + Divine | Difficulty: ⭐⭐⭐]
#emph[\"The Pharaoh does not rule Egypt. The Pharaoh IS Egypt.\"]

Egypt is the capital-focused civilization --- their entire mechanical
identity revolves around a single designated capital city that grows
stronger the longer it is held and developed. They are the
anti-expansion civ: while Rome and Greece benefit from spreading wide,
Egypt benefits from going deep. Their hybrid builder+divine identity
means both construction investment and religious investment compound
over time. The difficulty is not in the mechanics themselves (which are
passive and self-reinforcing) but in #strong[capital placement] --- the
single most important decision an Egyptian player makes, ideally before
building anything.

==== Historical Grounding <historical-grounding-2>
Ancient Egypt (c. 3100--30 BCE) was defined by its capital cities ---
Memphis, Thebes, Alexandria --- which served as the administrative,
religious, and cultural heart of the empire. The Pharaoh was
simultaneously king and living god, the earthly incarnation of Horus
and, in death, Osiris. Egyptian construction was monumental by design
--- pyramids, temples, and obelisks were not merely buildings but divine
infrastructure. The Nile flood (#emph[inundation];) was the economic
engine of the entire civilization, making Egypt uniquely dependent on a
single geographic feature.

==== Mechanics <mechanics-2>
#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header([Attribute], [Design], [Historical Basis]),
    table.hline(),
    [#strong[Passive --- Seat of the Pharaoh];],
    [One
      city per player is
      designated the #strong[Capital] (chosen at founding; can be
      re-designated once per world at great gold cost). The Capital
      receives compounding bonuses for every 7 days it remains under
      Egyptian control: +2% to all production rates, stacking
      indefinitely.],
    [Egyptian capitals were permanent sacred centers;
      moving the capital was a rare, politically seismic event],
    [#strong[Passive ---
      Inundation Cycle];],
    [The Capital receives a
      periodic food surge every 72 hours (representing the Nile flood
      cycle).],
    [The annual Nile inundation deposited fertile silt, making
      Egypt the breadbasket of the ancient world],
    [#strong[Active ---
        Pharaoh\'s Decree] (cooldown 72h)],
    [Apply 7
      days\' worth of Capital compounding bonus instantly (as if the city
      had been held for 7 additional days). Does not reset the natural
      timer.],
    [Pharaonic edicts could mobilize the entire state
      apparatus],
    [#strong[Unique Unit --- Medjay] (replaces Light Infantry)],
    [Elite
      scouts and city guards. +30% defense when garrisoned in the Capital.
      Standard stats elsewhere.],
    [The Medjay were ancient Nubian warriors
      who became Egypt\'s elite police and royal guard],
    [#strong[Unique
        Unit --- War Chariot] (replaces Cavalry)],
    [Faster
      than standard cavalry; +20% attack on open terrain (plains, desert);
      −20% on hills or forest.],
    [Egyptian chariotry was among the
      earliest and most effective in the ancient world],
    [#strong[Unique
        Building --- Temple of Amun] (replaces Grand Temple
      T3)],
    [In addition
      to standard Grand Temple effects, generates a
      Favor surge whenever the Capital\'s compounding bonus hits a new
      milestone (every 7 days). Only buildable in the Capital.],
    [The
      Temple of Amun at Karnak was the wealthiest and most powerful
      religious institution in ancient Egypt],
    [#strong[Capital Capture
      Rule];],
    [If the Capital is captured, the
      compounding bonus #strong[resets to zero];. If recaptured, the bonus
      resumes from zero --- not from where it was. This is the
      highest-stakes mechanic in the game for an Egyptian player.],
    [The
      fall of an Egyptian capital (Memphis to the Assyrians, Alexandria to
      Rome) was existential],
    [#strong[God Affinity];],
    [Egyptian
      pantheon (Ra, Osiris, Isis,
      Horus, Anubis, Thoth). Monotheist path is historically authentic ---
      the Pharaoh was the intermediary of a supreme divine order. Unique
      divine power: #emph[Ma\'at\'s Balance] --- for 12 hours, the Capital
      cannot be raided (only fully sieged).],
    [Ma\'at represented cosmic
      order, truth, and justice --- the foundation of Egyptian divine
      rule],
  )],
  kind: table,
)

==== Skill Expression <skill-expression-2>
- #strong[Beginner];: Place the Capital well (high food potential + rich
  terrain), build Temple of Amun early, let compounding bonuses
  accumulate. The longer you play safely, the stronger you get.
- #strong[Expert];: Optimize Capital placement for maximum terrain-scan
  bonuses before founding. Use Pharaoh\'s Decree to burst-accelerate the
  compounding timeline at critical moments. Diplomatically protect the
  Capital at all costs --- defending it is worth more than any military
  adventure.

==== Playstyle Flexibility <playstyle-flexibility-2>
A militarist Egypt uses War Chariots for fast raids while keeping the
Capital compounding safely at home --- the military funds the defensive
shell around the real asset. An expansionist Egypt uses secondary cities
as economic satellites while channeling their output back into Capital
development.

=== 5.6 Rome --- The Eternal Administration <56-rome--the-eternal-administration>
#emph[Archetype: Administrative Builder | Difficulty: ⭐⭐⭐⭐]
#emph[\"An empire is not won by armies alone. It is administered into
  existence.\"]

Rome is the multi-city scaling civilization --- the only civilization
where founding additional cities becomes #emph[more] efficient rather
than less. Where every other civilization faces exponential maintenance
costs for expansion, Rome\'s administrative system reduces per-city
overhead with each new province added. The complexity lies in managing a
distributed empire: each city has different terrain bonuses, different
production profiles, and must be individually optimized. A beginner Rome
player who expands carelessly will be overwhelmed; an expert who
sequences expansion correctly will build an economic engine that
outpaces every other civilization in the late game.

==== Historical Grounding <historical-grounding-3>
Rome (c. 509 BCE--476 CE) was defined not by conquest alone but by its
extraordinary capacity to administrate conquered peoples. Roman
engineering --- aqueducts, sewers, amphitheaters, fortifications ---
transformed every city it touched. The Roman Senate and its provincial
governor system allowed a single city to govern an empire spanning three
continents. Roman legions were the most professionally trained and
logistically supported armies of antiquity.

==== Mechanics <mechanics-3>
#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header([Attribute], [Design], [Historical Basis]),
    table.hline(),
    [#strong[Passive --- Provincial Administration];],
    [Each
      city Rome
      founds beyond the first #strong[reduces] the maintenance cost
      multiplier of all cities by 5% (to a minimum of 0.5x). A 4-city Rome
      pays less per city than a 2-city Greece.],
    [Roman provincial
      administration made empire economically viable],
    [#strong[Passive ---
      Roman Engineering];],
    [Construction speed +10%
      per city currently owned (stacks). A 3-city Rome builds 30% faster
      than a 1-city Rome.],
    [Roman engineers built faster and more durably
      than any contemporary civilization],
    [#strong[Active --- Senatus
        Consultum] (cooldown
      96h)],
    [Redistribute
      resources freely between all owned cities
      instantly (no travel time, no loss).],
    [The Roman Senate coordinated
      resource allocation across the entire empire],
    [#strong[Unique Unit ---
        Legionary] (replaces Heavy
      Infantry)],
    [+15%
      defense. Passive: after winning a battle,
      Legionaries recover 10% of lost HP (representing Roman medical corps
      and discipline).],
    [The Roman Legion was the most professional and
      durable heavy infantry of antiquity],
    [#strong[Unique Unit --- Ballista]
      (replaces Siege Weapon)],
    [Longer
      range than standard siege weapons; can be used defensively from city
      walls (standard siege weapons cannot).],
    [Roman ballistae were
      deployed both offensively and as wall-mounted defensive weapons],
    [#strong[Unique
        Building --- Aqueduct] (replaces Aqueduct tech
      building)],
    [A physical
      building that increases population cap by
      25% in its city AND removes population growth penalty from
      overcrowding. Each city must build its own Aqueduct.],
    [Roman
      aqueducts enabled cities to grow far beyond what local water sources
      could support],
    [#strong[Unique Building --- Amphitheatre] (replaces
      Theatre)],
    [Generates
      Culture Points passively (+5/h) AND reduces
      military unit upkeep by 5% in that city AND contributes to cultural
      event completion speed.],
    [Roman amphitheatres served political,
      religious, and social functions simultaneously],
    [#strong[God Affinity];],
    [Roman
      pantheon (Jupiter, Mars, Venus,
      Minerva, Neptune, Janus). Syncretic by nature --- Rome absorbed
      foreign gods. Unique divine interaction: Roman players can
      #emph[adopt] one divine power from a god worshipped by an allied
      civilization (one-time, requires alliance).],
    [Roman religious
      syncretism absorbed Greek, Egyptian, and Near Eastern gods
      wholesale],
  )],
  kind: table,
)

==== Skill Expression <skill-expression-3>
- #strong[Beginner];: Found 2 cities, build Aqueducts in both, let
  Provincial Administration reduce costs. Legionaries are strong without
  micromanagement.
- #strong[Expert];: Sequence city founding to maximize the Engineering
  speed stacking --- build the most expensive buildings in cities
  founded later (when construction speed is highest). Use Senatus
  Consultum to surgically move resources to whichever city is under
  pressure. Optimize Amphitheatre placement to minimize military upkeep
  across the empire.

==== Playstyle Flexibility <playstyle-flexibility-3>
A focused Rome player ignores expansion and runs a 1--2 city empire with
maximum engineering investment --- they lose the Provincial
Administration scaling but build the densest, most efficient cities in
the game. A diplomatic Rome uses the god adoption mechanic to mirror an
ally\'s divine advantages, creating a uniquely flexible divine toolkit.

=== 5.7 Maya --- The Blood Covenant <57-maya--the-blood-covenant>
#emph[Archetype: Divine / Sacrifice | Difficulty: ⭐⭐⭐⭐⭐]
#emph[\"The gods do not give. The gods take. And in the taking, they
  sustain the world.\"]

Maya is the highest-skill civilization in the game. Their defining
mechanic --- blood sacrifice --- creates a second resource economy
layered on top of the standard one. Favor is not generated passively by
buildings alone; it is generated by #strong[sacrificing population and
  military units];. This creates a constant tension: sacrifice too little
and your divine powers fall silent; sacrifice too much and your city
weakens. A Maya player who masters this balance is terrifying. A Maya
player who does not is perpetually behind.

==== Historical Grounding <historical-grounding-4>
The ancient Maya (c. 2000 BCE--1500 CE, Mesoamerica) built sophisticated
cities --- Tikal, Chichén Itzá, Palenque --- in dense jungle terrain.
Their religious practice centered on blood sacrifice (both
self-sacrifice and prisoner sacrifice) to sustain cosmic cycles. Their
astronomy and calendar system (the Long Count) was among the most
accurate in the ancient world. Maya warfare was often ritualized ---
capturing enemies for sacrifice was as valuable as killing them.

==== Mechanics <mechanics-4>
#figure(
  align(center)[#table(
    columns: 3,
    align: (auto, auto, auto),
    table.header([Attribute], [Design], [Historical Basis]),
    table.hline(),
    [#strong[Passive --- Jungle Adaptation];],
    [Maya cities founded
      in
      Forest or Jungle terrain receive +20% to all production rates
      (instead of the standard penalty). Movement penalty for enemy armies
      in Maya territory is increased by an additional 10%.],
    [Maya
      civilization thrived in dense jungle that confounded other
      civilizations],
    [#strong[Passive --- Sacred Calendar];],
    [Every
      13 in-game days (a
      #emph[trecena];), Maya receive a free Favor surge equal to 20% of
      their current Favor cap. This is independent of buildings or
      sacrifice --- a guaranteed divine rhythm.],
    [The 260-day Tzolk\'in
      calendar structured all Maya religious and civic life in 13-day
      cycles],
    [#strong[Active --- Blood Offering] (no cooldown, resource
      cost)],
    [Sacrifice population or military
      units to generate Favor
      immediately: 10 population = 50 Favor; 1 military unit = unit\'s
      training cost in Favor equivalent. Sacrificed resources are
      permanently lost.],
    [Human and animal sacrifice was the central
      mechanism for communicating with Maya gods],
    [#strong[Active ---
        Ritual Warfare] (army order, replaces standard
      Raid)],
    [Instead of looting resources
      from a raided city, capture
      enemy population and bring them back as sacrifice fuel (converted to
      Favor on arrival). No resource loot; pure Favor generation.],
    [Maya
      warfare prioritized prisoner capture for sacrifice over territorial
      conquest],
    [#strong[Unique Unit --- Eagle Warrior] (replaces Light
      Infantry)],
    [Fast, high attack, low
      defense. Special: if an Eagle
      Warrior survives a battle in which they were part of the winning
      army, they generate 10 Favor passively (the warrior\'s valor honors
      the gods).],
    [Eagle Warriors were elite Maya jaguar/eagle warrior
      orders tied to religious ceremony],
    [#strong[Unique Unit --- Atlatl
        Skirmisher] (replaces
      Archer)],
    [Longer range than standard
      archers; deals bonus damage to
      enemies crossing jungle or forest terrain (ambush mechanic).],
    [The
      atlatl (spear-thrower) gave Maya ranged warriors exceptional range
      in jungle terrain],
    [#strong[Unique Building --- Temple Pyramid]
      (replaces Grand Temple
      T3)],
    [Massively increased Favor generation.
      Houses the sacrifice
      altar --- the building required to perform Blood Offering and Ritual
      Warfare conversions. Without a Temple Pyramid, Blood Offering is
      unavailable.],
    [Maya pyramids (like Temple I at Tikal) were
      sacrificial altars and divine residences],
    [#strong[Unique Building ---
        Observatory] (replaces Academy
      T2)],
    [Generates research AND tracks
      the Sacred Calendar --- shows
      players exactly when the next #emph[trecena] Favor surge will occur,
      enabling precise planning.],
    [Maya observatories (like El Caracol)
      tracked celestial cycles with extraordinary precision],
    [#strong[God
      Affinity];],
    [Maya pantheon (Itzamná, Kukulkan,
      Hunahpu, Ix Chel, Ah Puch). Monotheist path is historically complex
      --- Maya religion had a supreme creator but a rich polytheist
      practice. Both paths are viable. Unique divine power:
      #emph[Xibalba\'s Call] --- target enemy city suffers a narrative
      plague event (Culture Points generation −50% for 24h, −10% food
      production for 24h, flavor text of divine punishment).],
    [Xibalba
      was the Maya underworld; diseases were attributed to its lords],
  )],
  kind: table,
)

==== Skill Expression <skill-expression-4>
- #strong[Beginner];: Build Temple Pyramid early, use Sacred Calendar
  Favor surges reactively, sacrifice small amounts of population during
  resource surplus periods. Jungle Adaptation makes Maya territory
  naturally defensible.
- #strong[Expert];: Treat Blood Offering as a Favor pump --- maintain a
  population surplus specifically to feed sacrifice cycles. Time Ritual
  Warfare raids to coincide with Sacred Calendar surges for maximum
  Favor accumulation. Use Eagle Warrior Favor generation to create a
  self-sustaining military-divine loop. Manage the sacrifice rate
  precisely --- sacrifice too aggressively and population growth stalls,
  leaving you economically weakened.

==== Playstyle Flexibility <playstyle-flexibility-4>
A builder Maya minimizes sacrifice, relies on Sacred Calendar rhythms
and Temple Pyramid passive generation, and uses the jungle terrain
advantage as a purely defensive shield. A diplomatic Maya uses Ritual
Warfare to extract Favor from enemies rather than territory --- raiding
purely for sacrifice fuel while maintaining formal peace with neighbors.

=== 5.8 Civilization Data Schema <58-civilization-data-schema>
All civilization properties are defined in TOML data files. No Rust code
changes are required to add or modify civilizations.

```toml
# config/civs/sumer.toml
[civ]
id          = "sumer"
name        = "Sumer"
adjective   = "Sumerian"
archetype   = "foundation_builder"
difficulty  = 1                          # 1-5 scale; not shown in UI
color       = "#C8872A"
icon        = "assets/civs/sumer/icon.png"
quote       = "Before all others, we built."

[[passive]]
id          = "cradle_of_civilization"
effects     = [
  { target = "building_cost",          modifier = -0.10 },
  { target = "research_per_building_tier", modifier = 0.01, stacking = true },
]

[[passive]]
id          = "irrigation_mastery"
effects     = [
  { target = "farm_output",            modifier = 0.20 },
  { target = "irrigation_food_bonus",  modifier = 0.15 },
]

[active]
id              = "cuneiform_decree"
cooldown_hours  = 48
effects         = [{ target = "complete_lowest_building_in_queue" }]

[[unique_unit]]
replaces        = "spearmen_t1"
id              = "sumerian_spearman"

[[unique_unit]]  # Note: civs can have multiple unique units
# (Sumer has one; Greece has two — Trireme + Hoplite)

[unique_building]
replaces        = "temple"
id              = "ziggurat"

[god_affinity]
pantheon        = "anunnaki"
bonus_favor_sources = ["building_completed", "irrigation_building_completed"]
favor_bonus     = 0.15
unique_power    = "enkis_gift"
```

=== 5.9 Future Civilization Candidates (Post-MVP) <59-future-civilization-candidates-post-mvp>
The data-driven architecture means new civs require no code changes.
Historical candidates for post-MVP waves: Persia (Achaemenid) ---
diplomatic/trade empire; Han China --- technological/administrative;
Carthage --- naval/trade rival to Greece; Mongols --- cavalry-centric
aggressive; Mali Empire --- gold economy; Babylon --- law and
governance; Sparta --- military specialization diverging from standard
Greece.

Community contributors can add civilizations by following the schema
above. Automated schema validation tests catch malformed configs before
they reach gameplay.
