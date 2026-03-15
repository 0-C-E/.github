= 0 C.E. - Research <0-ce---research>
#link("../nav/Home.pdf") | #link("Espionage.pdf")[Previous] |
#link("Diplomacy-and-Trade.pdf")[Next]

== 12. Research & Technology <12-research--technology>

=== 12.1 Era Structure <121-era-structure>
Research is organized into #strong[Eras];. Era advancement unlocks new
building tiers, new unit types, and new divine power tiers.

#figure(
  align(center)[#table(
    columns: 3,
    align: (
      auto,
      auto,
      auto,
    ),
    table.header([Era], [Theme], [Unlock Requirement]),
    table.hline(),
    [#strong[Era I: Foundation];],
    [Basic agriculture,
      bronze tools,
      wooden structures],
    [Starting era],
    [#strong[Era II: Classical];],
    [Iron working, advanced
      military,
      philosophy],
    [500 RP + Era I complete],
    [#strong[Era III: Hellenistic];],
    [Engineering, siege
      craft, trade
      networks],
    [2,000 RP + Era II],
    [#strong[Era IV: Imperial];],
    [Advanced administration,
      elite units,
      Wonders],
    [5,000 RP + Era III],
  )],
  kind: table,
)

(#emph[Not available in Game Night mode];)

=== 12.2 Research Mechanics <122-research-mechanics>
- Research is produced continuously by Workshop/Academy/University
  buildings
- Players select #strong[one active research] at a time (default;
  expandable by civilization bonus or tech)
- Queue depth: 1 active + up to 2 queued (expandable)
- Technologies have prerequisite chains
- #strong[Era Advancement] is itself a research action --- a large RP
  cost that transitions all available technologies to the next tier

=== 12.3 Tech Categories <123-tech-categories>
#figure(
  align(center)[#table(
    columns: 2,
    align: (
      auto,
      auto,
    ),
    table.header([Category], [Example Technologies]),
    table.hline(), [#strong[Agriculture];],
    [Crop Rotation (+15% food), Animal
      Husbandry (+pop cap), Irrigation Techniques],
    [#strong[Construction];],
    [Advanced Masonry (−10% build time), Arch
      & Vault (unlocks T3 buildings), Aqueduct],
    [#strong[Military];],
    [Sword Infantry Training, Archer Training,
      Slinger Training, Heavy Infantry Training, Pikeman Training, Peltast
      Training, Light Cavalry Training, War Chariot Training, Shield Wall
      (+defense), Siege Engineering --- each unlocks the corresponding
      unit type at the Barracks or Siege Workshop],
    [#strong[Commerce];],
    [Coinage (+gold/s), Long-Distance Trade
      (+route value), Maritime Routes],
    [#strong[Espionage];],
    [Tradecraft (+1 spy slot), Deep Cover
      (+success rate), Cipher Systems],
    [#strong[Divine];],
    [Sacred Rites (+Favor/s), Theogony (unlocks T2
      divine powers), Apotheosis (T3 unlock)],
    [#strong[Naval];],
    [Trireme Design, Open-Ocean Navigation, Naval
      Tactics],
    [#strong[Governance];],
    [Tax Reform, Provincial Administration,
      Census (+builder ratio)],
  )],
  kind: table,
)
