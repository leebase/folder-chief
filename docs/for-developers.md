# For Developers: Architecture & Technical Reference

> **How Folder Chief works under the hood.**

Folder Chief is built on a minimal, inspectable architectural model: **the folder is the agent**. There are no compiled binaries, no node_modules, and no hidden databases.

The product version authority is [`chief/VERSION`](../chief/VERSION). Repository changes that
have not been assigned a later version belong under **Unreleased** in the
[change history](../CHANGELOG.md); do not infer a release from a commit message alone.

---

## Core Technical Architecture

```
folder-chief/
├── AGENTS.md                  # Canonical behavioral contract (<150 lines)
├── CLAUDE.md                  # Pointer entry point for Claude Code (@AGENTS.md)
├── GEMINI.md                  # Mirror pointer for Google Gemini CLI
├── .claude/
│   ├── settings.json          # Claude Code configuration
│   └── skills/                # Agent skills following the SKILL.md specification
├── .gemini/
│   └── settings.json          # Workspace context file bindings
├── brain/                     # Gitignored owner memory vault
│   ├── me.md                  # Owner profile and operating preferences
│   ├── index.md               # Knowledge map and navigation index
│   ├── log.md                 # Durable knowledge mutation ledger
│   ├── inbox/                 # Raw incoming notes and dropped documents
│   ├── sources/               # Immutable raw source documents
│   ├── notes/                 # Sourced, compiled knowledge notes
│   └── state/                 # Current operational state (today.md, tasks/)
├── chief/                     # Product self-model and manual
│   ├── manual/                # Detailed guides read on-demand
│   ├── VERSION                # Checked-out product version authority
│   ├── capabilities.md        # Gitignored, installation-local capability registry
│   ├── learned/               # Gitignored correction/rule lessons
│   └── templates/             # Scaffolds for runtime files and specialist workspaces
├── docs/                      # User-facing adoption and getting started guides
├── journal/                   # Daily operational session logs (gitignored)
└── team/                      # Specialized Folder Agent workspaces (gitignored)
```

---

## Instruction Payload Budget

To ensure fast startup, low token costs, and compatibility across diverse terminal AI harnesses (including strict token ceiling constraints), always-loaded root instructions are strictly budgeted:

- **Line Count:** `AGENTS.md` is strictly capped at **< 150 lines**.
- **Combined Byte Budget:** `AGENTS.md` + `CLAUDE.md` + `GEMINI.md` + `.claude/settings.json` + `.gemini/settings.json` is strictly budgeted under **< 24 KiB** (typically ~10 KiB).
- **On-Demand Knowledge:** Detailed procedures, capability guides, and security protocols live in `chief/manual/` and are read by the model on-demand when relevant questions are asked.

---

## Memory Compilation Model

Folder Chief implements a direct **compilation model** for personal knowledge (inspired by Andrej Karpathy):

1. **Ingest:** Raw documents placed in `brain/inbox/` are moved untouched to `brain/sources/`.
2. **Compile:** The Chief extracts key facts, links, and operational details into dated Markdown notes in `brain/notes/`.
3. **Index:** `brain/index.md` maintains a structured map of all active topics and files.
4. **Query & Semantic Acceleration:** When answering questions, the Chief inspects `brain/index.md` or uses its offline semantic index (`./bin/sqlite-mem ask`) to find relevant concepts without scanning entire file trees, then reads only the specific notes required.
5. **Visual Graph:** Interlinked notes form a native Obsidian-compatible graph. See [Using with Obsidian](using-with-obsidian.md).


---

## The Specialist Workspace Pattern

Folder Agents in `team/<name>/` are created by copying `chief/templates/folder-agent/`. Each specialist directory is completely self-contained with its own `AGENTS.md`, `direction.md` instruction queue, `work/` output folder, and acceptance test scenarios in `tests/acceptance.md`.

Specialists execute strictly when invoked interactively within their directory. They write only
inside that directory; the Chief verifies `work/` and `log.md` against acceptance scenarios and
is the only writer that may synthesize verified findings into `brain/`.

---

## Session and Rule Lifecycle

- **Re-entry:** Read `brain/me.md`, today's journal when present, promoted rules in
  `chief/learned/`, and the dated `brain/state/today.md` hot-state brief.
- **Wrap:** Append `journal/YYYY-MM-DD.md`, refresh `brain/state/today.md`, persist durable
  learning, and report the written paths.
- **Rule promotion:** A first behavioral correction is `observed-once`; a recurrence is promoted
  only with owner approval. Each promoted rule records its origin and a retirement boundary.

The canonical details remain in `AGENTS.md` and [`chief/manual/memory.md`](../chief/manual/memory.md).

---

## Documentation and Release Maintenance

When product contracts change:

1. Update `AGENTS.md` first when behavior changes; otherwise keep the task documentation-only.
2. Reconcile `README.md`, `docs/`, `chief/manual/`, and affected templates against that contract.
3. Add an evidence-backed entry under **Unreleased** in `CHANGELOG.md`.
4. Change `chief/VERSION` only when a maintainer intentionally assigns a product version.
5. Before publishing, verify local links, version references, ignored owner-state paths, the
   instruction payload budget, and `git diff --check`; then inspect the complete diff.

Tracked `.gitkeep` files anchor empty runtime directories. All substantive owner data below
`brain/`, `journal/`, `team/`, `chief/learned/`, plus `chief/capabilities.md` and
`chief/installed.md`, must remain untracked. Never use owner runtime data as a documentation fixture.
