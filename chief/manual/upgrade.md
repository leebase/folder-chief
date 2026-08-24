# Upgrading Folder Chief & Ownership Lifecycle

This document details how Folder Chief handles product updates, the file preservation manifest,
remote repository topology, moving/relocating installations, and recovering state files.

## The Git-Native Upgrade Model

Folder Chief is distributed via Git. Because your folder retains a Git connection to the upstream
product repository, updates are applied using standard Git pull operations without proprietary daemons.

### 1. Cloning Upstream
To install Folder Chief, clone directly from the product repository:
```bash
git clone https://github.com/leebase/folder-chief.git folder-chief
cd folder-chief
```

### 2. Pulling Upstream Updates (0-Conflict Guarantee)
When upstream releases updates, pull them cleanly:
```bash
# If your default remote is origin:
git pull origin main

# Or if you configured an upstream remote:
git pull upstream main
```
Under Folder Chief's owner-state topology, upstream Git branches track **only** product scaffolds, manuals, templates, and instruction shims. Runtime owner files (`brain/`, `journal/`, `team/`, `chief/capabilities.md`, `chief/installed.md`) are gitignored in the product repository. As a result, pulling upstream changes produces **0 merge conflicts** against your personal notes and memory.

### 3. Understanding Product Updates vs Personal Memory Backup
- **Product updates:** `git pull` pulls changes to manuals (`chief/manual/`), templates (`chief/templates/`), and contracts (`AGENTS.md`).
- **Personal memory backup:** Because `brain/`, `journal/`, and `team/` are gitignored, running `git push` on the product repository **does not back up your personal memory**. For backing up your personal memory, see [Backup, Move, and Recover](backup-move-recover.md) (copying the folder or using a dedicated private git vault).

---

## Clone vs Fork vs ZIP

- **Clone (Recommended):** `git clone https://github.com/leebase/folder-chief.git`. Retains git history
  and enables simple one-command upgrades via `git pull`.
- **Fork:** Forking directly on GitHub creates a repository in your GitHub account. Note that GitHub forks
  of public repositories default to public visibility, and forks only track the product files (since personal
  memory remains gitignored). A standard clone is recommended.
- **Download ZIP:** Extracting a ZIP archive provides an inert local folder without Git history. Note that
  ZIP installations cannot use `git pull` for updates; upgrades require manually downloading the new ZIP
  and copying updated `chief/manual/`, `chief/templates/`, and root shims over your folder while preserving
  `brain/`, `journal/`, `team/`, and `chief/capabilities.md`.

---

## The Upgrade Manifest: What changes vs what is preserved

Folder Chief maintains strict physical decoupling between product machinery and owner state.

### Replaced / Updated on product upgrade (`upstream/main`)
These files contain upstream product logic and documentation:
- `chief/manual/` — Product documentation and self-knowledge manuals.
- `chief/templates/` — Standard templates (e.g. `folder-agent/`) and runtime scaffolds (`chief/templates/scaffolds/`).
- `chief/VERSION` — Product version tracking.
- `AGENTS.md` & platform shims (`CLAUDE.md`, `GEMINI.md`, `.gemini/settings.json`, `.claude/settings.json`) —
  The canonical operating contract and platform configuration.

### Preserved / Never overwritten on upgrade
These paths contain your personal identity, memories, notes, and team configuration. Because they are
untracked runtime files in the product repository, upstream updates never conflict with them:
- `brain/` — Your entire Obsidian-compatible vault (`me.md`, `sources/`, `notes/`, `state/`, `dashboards/`, `index.md`, `log.md`, `.obsidian/`).
- `journal/` — Your operational session journals and historical logs.
- `team/` — Your Folder Agents (`team/<agent-name>/`) and active `team/ROSTER.md`.
- `chief/capabilities.md` — Your installation's capability registry.
- `chief/learned/` — Local harness-native auto-memory.
- `chief/installed.md` — Your local onboarding marker.

---

## Moving or Relocating Folder Chief

When moving Folder Chief to a new directory, storage drive, or computer:
1. **Preserve hidden files:** Ensure hidden files (`.gitignore`, `.claude/`, `.gemini/`, and all `.gitkeep` anchor files) are copied along with visible folders.
2. **Preserve local memory:** Copy `brain/`, `journal/`, `team/`, `chief/installed.md`, and `chief/capabilities.md`.
3. **Open and say hello:** Launch your AI assistant in the new directory (`pwd`). The Chief reads `AGENTS.md` and `brain/me.md` and resumes existing context.
4. **Re-wire capabilities:** Check `chief/capabilities.md` and re-verify any local host tools or environment variables.

---

## Reconstructing Broken or Missing State Files

If a state file is accidentally deleted, corrupted, or missing after a migration, the Chief can reconstruct standard default structures from `chief/templates/scaffolds/`:
- `chief/templates/scaffolds/brain-me.md` $\rightarrow$ `brain/me.md`
- `chief/templates/scaffolds/brain-today.md` $\rightarrow$ `brain/state/today.md`
- `chief/templates/scaffolds/brain-index.md` $\rightarrow$ `brain/index.md`
- `chief/templates/scaffolds/brain-log.md` $\rightarrow$ `brain/log.md`
- `chief/templates/scaffolds/tasks.base` $\rightarrow$ `brain/dashboards/tasks.base`
- `chief/templates/scaffolds/capabilities.md` $\rightarrow$ `chief/capabilities.md`
- `chief/templates/scaffolds/team-roster.md` $\rightarrow$ `team/ROSTER.md`

The Chief initializes missing scaffolds automatically on session startup without overwriting existing files or notes.

---

## Upgrade procedure

When you want to check for or apply an upgrade:

1. **Check status:** Ask the Chief: *"Are there any updates to Folder Chief?"*
2. **Fetch and diff:** The Chief fetches upstream changes (`git fetch origin` or `git fetch upstream`) and reviews the incoming diff against the manifest.
3. **Conversational briefing:** The Chief summarizes:
   - What features, bug fixes, or manual pages have changed.
   - Confirmation that all files in `brain/`, `journal/`, and `team/` remain untouched.
4. **Apply update:** With your consent, the Chief pulls upstream changes:
   ```bash
   git pull origin main
   ```
5. **Verify:** The Chief verifies that `chief/VERSION` is updated, the operating contract is intact, and logs the upgrade in today's `journal/YYYY-MM-DD.md`.

---

## Handling Customizations and Merge Conflicts

If you have customized `AGENTS.md` or contract rules:
- Standard Git merge strategies apply.
- If a conflict arises in `AGENTS.md`, the Chief helps resolve it by preserving your custom rules while adopting upstream contract enhancements.
- Files in `brain/`, `journal/`, and `team/` will never conflict because upstream branches do not track your personal runtime state.
