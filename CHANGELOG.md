# Folder Chief change history

This file records product changes supported by repository history. `chief/VERSION` is the
authority for the checked-out product version. A heading here does not by itself mean that a
Git tag or GitHub Release exists.

## Unreleased

The default branch contains the following improvements after the `1.0.0` technical baseline.
`chief/VERSION` still reports `1.0.0`; these changes have not been assigned a later product
version in the repository.

### Added

- Public-adoption guides covering setup, the first week, specialists, privacy, support, and
  developer architecture (`9f655e3`, 2026-08-23).
- Optional Obsidian and visual-graph guidance (`ef0c15b`, 2026-08-23).
- Patterns for AI relationship transfer, an AI leadership team, and external-advisor handoffs
  (`f857b48`, `388afc6`, `f60bcaf`, 2026-08-23).
- A conversational session-wrap ritual, daily journal scaffold, and `brain/state/today.md` as a
  dated hot-state re-entry brief (`96b34df`, 2026-08-25).
- A two-strike, owner-approved correction-to-rule promotion loop in `chief/learned/`, including
  explainable origins and removable boundaries (`adba44b`, 2026-08-25).
- Offline semantic memory indexing capability via `sqlite-mem` (v1.0.0), including Day 1 onboarding auto-provisioning (`scripts/setup-sqlite-mem.sh`), Agent Skill in `.claude/skills/sqlite-mem/SKILL.md` (mirrored to `.gemini/skills/`), capability guide `chief/manual/capabilities/sqlite-mem.md`, capability registry updates, and `brain/` query acceleration guidance in `chief/manual/brain.md` (2026-09-03).

### Changed

- User documentation now covers both supported terminal harnesses and desktop apps with folder
  access (`6bb90d2`, 2026-08-23).
- Contact guidance points inquiries directly to `lee@leebase.com` (`c3521ac`, 2026-08-23).

### Fixed and validated

- Repaired contract drift in the Gemini pointer, scaffold paths, backup claims, and path
  terminology (`4d90ec4`, 2026-08-25).
- Updated the harness matrix with the repository's observed 2026-08-25 verification results
  (`155ccf7`, 2026-08-25).

## 1.0.0 technical baseline — 2026-08-23

Commit `efd4a91` finalized the `1.0.0` technical-remediation baseline and set
`chief/VERSION` to the current three-field form. The baseline included:

- the canonical `AGENTS.md` behavioral contract and lightweight harness shims;
- local, gitignored owner state in `brain/`, `journal/`, `team/`,
  `chief/capabilities.md`, `chief/learned/`, and `chief/installed.md`;
- first-run onboarding, memory authority, immutable raw sources, source-trust defenses, and
  capability truth in the installation-local registry;
- bounded Folder Agent templates, the four-question hiring interview, acceptance scenarios,
  and Chief-only writes to shared memory;
- manuals for security, harnesses, upgrades, backup/recovery, and optional capabilities; and
- the `1.0.0` remediation and launch-candidate validation work from commits `7a99a6a`,
  `4c17976`, and `11743ad`.

## Earlier development milestones — 2026-08-23

These values appeared in `chief/VERSION` during the initial sprint sequence:

| Version marker | Evidence commit | Repository milestone |
|---|---|---|
| `0.1.0` | `bda673f` | Initial Folder Chief skeleton |
| `0.2.0` | `4b66390` | Brain and memory structure |
| `0.3.0` | `9014294` | Capabilities and harness portability |
| `0.4.0` | `190b031` | Folder Agents and governance |
| `1.0.0` | `bac9737` | Sprint 5 dogfood and launch package |

During remediation, `chief/VERSION` briefly contained `1.0.1` (`7a99a6a`) and `1.0.2`
(`4c17976`) before the launch-candidate work normalized the baseline back to `1.0.0`
(`11743ad`). Repository history contains no corresponding tags or GitHub Releases, so this
history treats those as transient development markers, not published releases.

## Maintaining this file

- Add current work under **Unreleased** and cite the commit that supplies the evidence.
- When maintainers assign a new version in `chief/VERSION`, move the applicable entries to a
  dated version heading and add the tag or GitHub Release link if one actually exists.
- Do not infer release dates, compatibility, or capabilities from prose alone; verify the Git
  history, `chief/VERSION`, `AGENTS.md`, and the relevant installation-independent contracts.
