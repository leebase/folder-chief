# Folder Chief

**Your AI chief of staff is a folder.** Folder Chief is a cloneable set of Markdown files that
teaches a supported coding harness to work with you, keep readable memory, respect clear
boundaries, and hire specialized Folder Agents when work becomes an ongoing responsibility.
Nothing in this folder listens or runs by itself.

## Start in three steps

1. **Clone it.** Clone your permitted copy of Folder Chief into a new folder named
   `folder-chief`.
   For this repository: `git clone git@github.com:leebase/folder-chief.git folder-chief`.
2. **Open it.** Change into that folder and open it with Claude Code, Codex CLI, Gemini CLI, or
   OpenCode—the AI tool you already use.
3. **Say hello.** On a fresh installation, answer at most three questions: your name, what your
   work looks like, and what is on your plate right now. The Chief writes and shows
   `brain/me.md`, does a useful task from that conversation, records durable learning, and only
   then records the installation marker.

## Ownership promises

- Owner knowledge is plain Markdown in `brain/`; Claude-native auto-memory, when present, is plain
  Markdown in `chief/learned/`; both are readable and inside this folder.
- Product instructions live in canonical `AGENTS.md` plus `chief/manual/`; shims point to the
  contract. Upgrades may replace manual pages and templates but merge the contract carefully,
  leaving `brain/`, `journal/`, `team/`, and capability settings untouched.
- The Chief's contract confines its writes to this folder. The harness itself may have broader
  permissions; the folder contract is not a claim that the harness is sandboxed.
- Raw material in `brain/sources/` is kept unchanged. Derived notes can be corrected with dates,
  sources, and superseded claims, with git providing the prior state.
- Specialized Folder Agents live in `team/<agent-name>/`, write only inside their own folder
  (`work/` and `notes/`), and report to the Chief.
- No secrets, tokens, passwords, or credentials belong in this folder. Keep them in the
  harness, operating-system keychain, or environment managed outside the folder.

## Manual map

Start with `AGENTS.md`, the portable contract loaded by the harness. For questions about Folder
Chief itself, read `chief/manual/index.md` first:

- `chief/manual/what-i-am.md` — identity, purpose, memory zones, capabilities, agents, and limits.
- `chief/manual/memory.md` — session read order, durable capture, correction, supersession, and
  the difference between forgetting your profile and resetting onboarding.
- `chief/manual/brain.md` — vault zones, frontmatter rules, ingest, query, and lint procedures.
- `chief/manual/capabilities/index.md` — guides for web, shell, git, email, calendar, drive,
  notifications, scheduled runs, and browser.
- `chief/manual/agents.md` — Folder Agent definition, 4-question interview, verifiability gate,
  template spawning, direction, and retirement.
- `chief/manual/security.md` — maturity ladder (Tiers 0–2), secrets model, and git leak recovery.
- `chief/manual/harnesses.md` — portability across Claude Code, Codex, Gemini CLI, and OpenCode.
- `chief/manual/upgrade.md` — git-native upgrade model, manifest of replaced vs preserved files,
  and conversational diffs.
- `chief/manual/about-leebase.md` — vendor background, trust notice, and the three boundary
  escalation rules.
- `chief/manual/backup-move-recover.md` — copy, move, restore, and git-history guidance.
- `chief/capabilities.md` — this installation's actual, dated capability state; it starts
  unprobed/not configured and never inherits access from the manual.
- `brain/index.md` — the owner's knowledge-vault map; `journal/` is the separate operational
  session log.
- `team/ROSTER.md` — registration table for specialized Folder Agents.

## Honest limits

This Sprint 4 product is Markdown only: no server, daemon, database, telemetry, RAG, or standalone
scripts. It acts only while a harness is open. The manual describes capabilities that a harness could be
configured to provide; this installation has none configured until `chief/capabilities.md` says so.
In this fresh state, the answer is: “I know how email integration works, but I do not currently
have access to your email.” Email is a possible capability, not access: a fresh installation
cannot read your email unless that registry says it is configured and verified.

The Chief can prepare drafts in this folder, but it does not send email or messages, publish,
change meetings, grant credentials, or modify external systems. Review and execute any such
action yourself. If a request needs a decision, authority, access, or work outside this folder,
the Chief prepares the safe in-folder material and asks you.

For recovery and portability, see `chief/manual/backup-move-recover.md` and `chief/manual/harnesses.md`.
For the product's self-model, always prefer the manual over generic assumptions about AI tools.
