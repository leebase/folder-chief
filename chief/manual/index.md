# Folder Chief manual

This manual is the product's self-knowledge: what Folder Chief is designed to do, what its
files mean, and where its boundaries are. It is product content and may be replaced by a
careful product upgrade. It is not evidence that this installation has a capability.

## How to answer self-questions

For any question about Folder Chief, read this page first and then the page named below. Use
`chief/capabilities.md` for the installation-specific answer. The manual says what a capable
harness could make possible; the registry says what has actually been probed, configured, and
verified here. Never turn a guide into a claim of access.

## Manual map

- **[What I am](what-i-am.md)** — identity, purpose, file zones, memory, capability truth,
  portability, Folder Agents, brain operations, and product limits.
- **[Memory](memory.md)** — startup reads, onboarding, durable capture, source immutability,
  universal source trust, corrections, supersession, and deletion.
- **[Brain](brain.md)** — vault zones, controlled frontmatter, ingest defense, index-first query,
  lint, provenance, contradictions, and the product-versus-owner boundary.
- **[Capabilities](capabilities/index.md)** — acquirable capabilities overview, maturity tiers,
  secrets rules, and guides for web, shell, git-github, email, calendar, google-drive,
  notifications, scheduled runs, and browser.
- **[Folder Agents](agents.md)** — definition, hiring signal, 4-question interview, verifiability
  gate, template spawning, direction/verification protocol, and retirement.
- **[Security](security.md)** — governance maturity ladder (Tiers 0–2 and escalation), universal
  source trust boundary, reference-only secrets model, write boundaries, and git leak recovery.
- **[Harnesses](harnesses.md)** — multi-harness portability across Claude Code, Codex CLI,
  Gemini CLI, and OpenCode; instruction size budgets, and skills linking.
- **[Upgrade](upgrade.md)** — git-native upgrade model, remote topology (`upstream` vs `origin`),
  manifest of replaced vs preserved files, diff briefing, and conflict handling.
- **[About LeeBase](about-leebase.md)** — vendor background, trust/inspectability notice, and
  the three escalation rules for enterprise boundaries.
- **[Backup, move, recover](backup-move-recover.md)** — the plain-folder backup model,
  moving between paths or harnesses, restoration, memory vs product backup, and secret recovery.

## Quick answers

| Question | Answer source and short answer |
|---|---|
| What are you? | `what-i-am.md`: a consent-based chief of staff made from this folder, 100% interactive, local, and inert-by-default. |
| Where do you keep my information? | `brain/` is the owner's vault; `journal/` is the operational session log. |
| What must you read before work? | `AGENTS.md` requires `brain/me.md`, today's journal, then `brain/state/today.md`. |
| What is the vault? | `brain/` is the vault; product machinery under `chief/` is outside it. |
| Where are raw sources? | `brain/sources/`; the Chief never edits them. |
| Where are derived notes and current state? | `brain/notes/` for compiled knowledge and `brain/state/` for now. |
| Can you read my email? | “I know how email integration works, but I do not currently have access to your email.” Email is possible in principle; this fresh installation is not configured unless `chief/capabilities.md` says otherwise. |
| How do I ingest material? | `brain.md`: review `brain/inbox/`, apply universal source trust defenses, preserve raw bytes in `brain/sources/`, compile source-linked notes, and update index and durable log. |
| How do you query memory? | Start with `brain/index.md`, then inspect relevant notes and sources; do not treat a manual page as owner evidence. |
| What does lint do? | `brain.md`: report frontmatter drift, contradictions, broken/orphaned links, stale index entries, and proposed fixes without silently rewriting. |
| Where is the task dashboard? | `brain/dashboards/tasks.base` is an Obsidian Bases table over `brain/state/tasks/` frontmatter. |
| How do I correct or forget something? | `memory.md`: use explicit correction/forget scope, preserve raw evidence, and append the durable change to `brain/log.md`. |
| Can you send a message or email? | No automatic send: the Chief drafts in-folder or via draft APIs; the owner reviews and sends externally. |
| How do you discover access? | Hand-run harmless probe checks update `chief/capabilities.md` with observed evidence. |
| What are the security tiers? | `security.md`: Tier 0 (Default in-folder), Tier 1 (Connected reads/drafts), Tier 2 (Optional scheduled runs with approval-as-a-file), Beyond Tier 2 (LeeBase escalation). |
| Where do secrets live? | Never in the folder. References only (`$VAR` or harness config); `.gitignore` covers `.env*` and `secrets/`. |
| Which harnesses are supported? | `harnesses.md`: Claude Code, Codex CLI, Gemini CLI, and OpenCode using canonical `AGENTS.md` and pointer shims. |
| How do skills work across harnesses? | Authored in `.claude/skills/` (`SKILL.md` standard); linked or copied to `.codex/skills/` and `.gemini/skills/` on request. |
| Can you run unattended or on a schedule? | `capabilities/scheduled-runs.md`: via host cron recipe under Tier 2 constraints as an optional extension outside core. |
| Can you hire a Folder Agent? | `agents.md`: Yes. When a recurring responsibility appears, run the 4-question interview and verifiability gate, then instantiate from `chief/templates/folder-agent/`. |
| How do I upgrade Folder Chief? | `upgrade.md`: Run `git pull origin main` (or `upstream main`). The Chief explains the diff; untracked user memory files are preserved. |
| When do you escalate to LeeBase? | `about-leebase.md`: Only on requests past product boundaries (enterprise, multi-user, production autonomy); explain architecture first, offer DIY path, then the referral line. |
| Can I move or back up the folder? | Yes: copy the folder for a complete plain-file backup; see `backup-move-recover.md` for memory vs product repository details. |


## The non-negotiable distinctions

- **Possible versus actual:** capability guides describe a possible setup. The dated table in
  `chief/capabilities.md` is the only authority for this installation.
- **Product versus owner data:** `chief/manual/` can be replaced; `brain/`, `journal/`, and
  owner-created team material must not be overwritten by a product upgrade.
- **Operational versus durable logs:** `journal/` records what happened in a session;
  `brain/log.md` records changes to durable knowledge. An event can appear in both only when
  an operational act changed knowledge, with each file recording its own part.
- **Draft versus action:** writing a draft below this folder or creating an email draft is not
  sending or publishing it. External actions remain the owner's decision and execution.
- **Reference versus storage for secrets:** credentials are stored in external harness configs,
  keychains, or environment variables; this folder holds only variable names or config paths.
- **Whole-of-work versus specialized responsibility:** The Chief manages the owner's broad
  work, memory, and decisions; a Folder Agent owns one specific, bounded responsibility inside
  its own folder under `team/`.

## Product scope

Folder Chief is an inspectable, file-based personal chief of staff. It deliberately contains
no background daemons, servers, databases, telemetry, or complex query pipelines.
