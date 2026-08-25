# For Developers: Architecture & Technical Reference

> **How Folder Chief works under the hood.**

Folder Chief is built on a minimal, inspectable architectural model: **the folder is the agent**. There are no compiled binaries, no node_modules, and no hidden databases.

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
│   ├── capabilities.md        # Observed tool capability registry
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
4. **Query:** When answering questions, the Chief inspects `brain/index.md` first, then reads only the specific notes required.
5. **Visual Graph:** Interlinked notes form a native Obsidian-compatible graph. See [Using with Obsidian](using-with-obsidian.md).


---

## The Specialist Workspace Pattern

Folder Agents in `team/<name>/` are created by copying `chief/templates/folder-agent/`. Each specialist directory is completely self-contained with its own `AGENTS.md`, `direction.md` instruction queue, `work/` output folder, and acceptance test scenarios in `tests/acceptance.md`.

Specialists execute strictly when invoked interactively within their directory, preventing runaway execution loops and ensuring complete user oversight.
