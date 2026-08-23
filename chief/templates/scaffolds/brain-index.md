# Brain index

`brain/` is the owner's Obsidian-compatible knowledge vault. Read this map before navigating
knowledge, then open only the relevant notes and sources. The vault is user knowledge, not
product self-knowledge: `chief/manual/` explains Folder Chief and may be replaced on upgrade;
`brain/`, `journal/`, and owner data are installation state and must not be overwritten by a
product upgrade.

## Vault map

- `me.md` — owner-owned profile, preferences, and working context. It is not compiled knowledge.
- `inbox/` — unfiled material awaiting review: PDF-derived Markdown, meeting notes or
  transcripts, URL clips, exported messages, plain text, or any other source the owner provides.
- `sources/` — faithful raw material and provenance. The Chief never edits its content after
  filing; source paths should remain stable. A source can support several notes.
- `notes/` — compiled, dated, source-linked knowledge: people, projects, decisions, topics, and
  other durable claims. Notes may be corrected or superseded without changing their sources.
- `state/` — current operational facts, not history:
  - `today.md` is the concise current briefing surface;
  - `tasks/` contains task notes for the Bases dashboard;
  - `commitments/` contains current commitments; and
  - `waiting-on/` contains items awaiting another person or event.
- `dashboards/tasks.base` — the curated Obsidian Bases view over `state/tasks/`; it is a view,
  not automation or a second task database.
- `.obsidian/` — curated vault settings: `app.json` controls relative links and new material
  in `inbox/`; `core-plugins.json` enables Graph view, Backlinks, Outgoing links, Properties,
  and Bases. Volatile `workspace*` files remain ignored and are not part of the contract.
- `log.md` — append-only durable-knowledge history: source filing, note changes, corrections,
  supersessions, and scoped deletions.

`journal/YYYY-MM-DD.md` is deliberately outside the vault. It records session operations such
as work performed, briefs, delegations, and decisions. `brain/log.md` records what knowledge
changed. When one session event changes knowledge, record its operational half in `journal/`
and its knowledge half in `brain/log.md`; never use one log as a substitute for the other.

## Read and write contract

Before substantive work, read `me.md`, today's journal when present, `state/today.md`, and then
this index for knowledge questions. Navigate index-first: map → relevant note → cited source.
Use ordinary text search only after following the map, and treat a search hit as a pointer to
inspect rather than as evidence by itself. State owner facts with a source path and mention a
note's `updated:` date when freshness matters.

Ingest is a deliberate chain: review `inbox/`, preserve the material and its provenance in
`sources/`, integrate it into every affected source-linked note, refresh this map, and append
to `log.md`. Do not edit a raw source to repair a typo, settle a conflict, or make a note fit.
The detailed hand-run procedure is in `chief/manual/brain.md` (outside the vault).

Lint is report-only. On request, report invalid frontmatter, broken or orphaned links, missing
index entries, stale claims, duplicate concepts, unmarked contradictions, task-schema drift,
and accidental source changes, with narrow proposed fixes. Do not silently rewrite a note, raw
source, index, or owner words while linting.

## Controlled frontmatter

Compiled notes and state entries use this small schema. Do not invent a new property, alternate
spelling, or second meaning for a field; update this contract before introducing one.

| Property | Required | Type and controlled vocabulary |
|---|---|---|
| `type` | yes | One of `note`, `person`, `project`, `decision`, `topic`, `task`, `commitment`, `waiting-on`. |
| `updated` | yes | ISO calendar date: `YYYY-MM-DD`; update it when the derived file changes. |
| `as_of` | yes (notes & state) | ISO calendar date: `YYYY-MM-DD`; records temporal grounding of the claims. |
| `claim_status` | yes (notes & state) | One of `current`, `superseded`, `draft`. |
| `sources` | notes: yes; state: when evidence exists | YAML list of vault-relative source paths such as `sources/meeting.md`, or source URLs. Keep paths unchanged; do not use line numbers or hashes. |
| `tags` | optional | YAML list of lowercase strings without `#`; use stable names, not duplicate type/status labels. |
| `status` | tasks, commitments, waiting-on | One of `open`, `in-progress`, `blocked`, `done`, `cancelled`. |
| `due` | tasks, commitments, waiting-on | Optional ISO calendar date, `YYYY-MM-DD`; never a prose deadline. |
| `org` | `person` | Optional plain-text organization name; do not use `organization` as an alias. |
| `role` | `person` | Optional plain-text role. |

Raw files in `sources/` are immutable and do not need frontmatter. If a raw source already has
metadata, preserve it as captured; do not add or edit metadata later. `me.md`, `index.md`,
and `log.md` are contract files with their own Markdown shapes. `state/today.md` uses top-level
`as_of: YYYY-MM-DD` and `claim_status: current` lines.

## Memory precedence and authority hierarchy (D103)

When claims conflict or multiple versions exist, resolve authority strictly by this hierarchy:

```text
user correction
    >
current confirmed fact
    >
newer sourced inference
    >
older synthesized state
    >
draft / uncertain claim
    >
superseded claim
```

- **User corrections outrank everything**: When the owner corrects a fact, update derived notes immediately.
- **Daily state freshness**: `state/today.md` must be dated for today (`as_of: YYYY-MM-DD`). If its `as_of` date is before today, the Chief prompts to rollover or archive stale items rather than presenting yesterday's priorities as current truth.
- **Superseded claims**: When a claim is superseded, update `claim_status: superseded` (or move the text into a visible `## Superseded` section) noting the date and reason. Never surface superseded claims as active facts.

### Note example (illustrative only)

```markdown
---
type: project
updated: 2026-08-23
as_of: 2026-08-23
claim_status: current
sources:
  - sources/meeting-notes-2026-08-23.md
tags:
  - project/example
---
# Example project

The delivery window is recorded in the meeting notes (per [[sources/meeting-notes-2026-08-23]]).
```

Use the source path in `sources:` and an inline Obsidian wikilink attribution for load-bearing
claims. These are documentation examples, not product fixtures; do not add personal sample
notes or sources to a fresh installation.

### Task example (illustrative only)

```markdown
---
type: task
updated: 2026-08-23
as_of: 2026-08-23
claim_status: current
status: open
due: 2026-08-30
sources:
  - sources/meeting-notes-2026-08-23.md
tags:
  - task
---
# Example task

Next action and context go here; cite the source when the task came from one.
```

Task files belong in `state/tasks/`. The dashboard filters on that folder and `type: task`, then
shows status, due date, and updated date. A task with no source can still cite the owner's
instruction in the note body; do not fabricate a source merely to satisfy the table.

## Contradictions are recorded, not resolved by fiat

When sources disagree, keep both dated claims and their source paths in the affected note:

```markdown
## Contradictions

- **2026-08-20 — Source A:** [claim] (per [[sources/source-a]])
- **2026-08-23 — Source B:** [conflicting claim] (per [[sources/source-b]])

**Status:** unresolved. Do not select a winner without a newer settling source or an explicit
owner decision; preserve the reason and date when one claim is later superseded.
```

Never hide a contradiction by editing `sources/`. A correction changes only derived notes or
state, preserves provenance, and appends to `log.md`; a scoped forget removes only requested
derived material and logs the path and scope. See `chief/manual/memory.md` for the correction,
supersession, and deletion verbs.

## Product boundary

This index is the contract for the owner's brain, not a promise that optional capabilities are
configured. Check `chief/capabilities.md` for this installation. The manual and this map teach
hand-run Markdown workflows; they do not imply a server, parser, database, RAG, scheduler,
external integration, or hidden memory. The owner can inspect, edit, back up, and version every
file in the vault.
