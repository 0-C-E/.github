= 0 C.E. - Modding <modding>
#link("../nav/Home.pdf") | #link("Balancing.pdf")[Previous] |
#link("Roadmap.pdf")[Next]

== 24. Modding & Extensibility <24-modding--extensibility>

=== 24.1 Data-Driven Design <241-data-driven-design>
All game content is defined in #strong[TOML data files];. No Rust code
changes are required to add:

- New civilizations
- New buildings (within existing categories)
- New units
- New technologies
- New gods and divine powers
- New wonders

The engine reads config files at startup. A modder adding a new
civilization creates one TOML file, adds assets, and submits a PR.
Automated schema validation tests catch malformed configs.

=== 24.2 Adding a New Civilization <242-adding-a-new-civilization>
#strong[Effort estimate];: \< 1 week for an experienced contributor.

+ Create `config/civs/your_civ.toml` following the schema
+ Reference existing or new unit/building IDs
+ Add civilization artwork to `assets/civs/your_civ/`
+ Run schema validation: `cargo test --package shared -- civ_validation`
+ Submit PR with balance notes

=== 24.3 Private World Modding <243-private-world-modding>
Private world hosts can override any balance constant via `world.toml`,
add custom content files to a local `config/` override directory, and
enable experimental features.
