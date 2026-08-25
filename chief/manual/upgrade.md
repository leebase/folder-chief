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

### 2. Pulling Upstream Updates
When upstream changes are available, pull them cleanly after review:
```bash
# If your default remote is origin:
git pull origin main

# Or if you configured an upstream remote:
git pull upstream main
```
Under Folder Chief's current owner-state topology, substantive runtime owner files in `brain/`,
`journal/`, `team/`, and `chief/learned/`, plus `chief/capabilities.md` and
`chief/installed.md`, are gitignored by the product repository. They are therefore not part of
ordinary upstream diffs. This sharply reduces owner-data conflicts, but it is not a substitute for
a backup or diff review: local edits to tracked product files can conflict, and a future upstream
path-topology change must be inspected before pulling.

### 3. Understanding Product Updates vs Personal Memory Backup
- **Product updates:** `git pull` pulls changes to manuals (`chief/manual/`), templates (`chief/templates/`), and contracts (`AGENTS.md`).
- **Personal memory backup:** Because owner runtime paths are gitignored, running `git push` on the product repository **does not back them up**. See [Backup, Move, and Recover](backup-move-recover.md); a complete folder copy is the full-fidelity option, while a dedicated private `brain/` vault covers notes only.

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
  `brain/`, `journal/`, `team/`, `chief/learned/`, `chief/capabilities.md`, and
  `chief/installed.md`.

---

## The Upgrade Manifest: What changes vs what is preserved

Folder Chief maintains strict physical decoupling between product machinery and owner state.

### Replaced / Updated on product upgrade (`upstream/main`)
These files contain upstream product logic and documentation:
- `chief/manual/` — Product documentation and self-knowledge manuals.
- `chief/templates/` — Standard templates (e.g. `folder-agent/`) and runtime scaffolds (`chief/templates/scaffolds/`).
- `chief/VERSION` — Product version tracking.
- `CHANGELOG.md` — Evidence-backed history, including work not yet assigned a later version.
- `AGENTS.md` & platform shims (`CLAUDE.md`, `GEMINI.md`, `.gemini/settings.json`, `.claude/settings.json`) —
  The canonical operating contract and platform configuration.

### Preserved owner-state paths under the current topology
These paths contain your personal identity, memories, notes, and team configuration. Because they are
untracked runtime files in the product repository, they stay out of ordinary upstream diffs:
- `brain/` — Your entire Obsidian-compatible vault (`me.md`, `sources/`, `notes/`, `state/`, `dashboards/`, `index.md`, `log.md`, `.obsidian/`). Tracked `.gitkeep` anchors are product placeholders; substantive runtime content is ignored.
- `journal/` — Your operational session journals and historical logs.
- `team/` — Your Folder Agents (`team/<agent-name>/`) and active `team/ROSTER.md`.
- `chief/capabilities.md` — Your installation's capability registry.
- `chief/learned/` — Installation-local observed lessons and owner-approved promoted rules.
- `chief/installed.md` — Your local onboarding marker.

---

## Moving or Relocating Folder Chief

When moving Folder Chief to a new directory, storage drive, or computer:
1. **Preserve hidden files:** Ensure hidden files (`.gitignore`, `.claude/`, `.gemini/`, and all `.gitkeep` anchor files) are copied along with visible folders.
2. **Preserve local memory:** Copy `brain/`, `journal/`, `team/`, `chief/learned/`,
   `chief/installed.md`, and `chief/capabilities.md`.
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
- `chief/templates/scaffolds/obsidian-app.json` $\rightarrow$ `brain/.obsidian/app.json`
- `chief/templates/scaffolds/obsidian-core-plugins.json` $\rightarrow$ `brain/.obsidian/core-plugins.json`
- `chief/templates/scaffolds/capabilities.md` $\rightarrow$ `chief/capabilities.md`
- `chief/templates/scaffolds/team-roster.md` $\rightarrow$ `team/ROSTER.md`
- `chief/templates/scaffolds/journal-entry.md` $\rightarrow$ `journal/YYYY-MM-DD.md`
- `chief/templates/scaffolds/learned-lesson.md` $\rightarrow$ `chief/learned/<slug>.md`

The Chief initializes only the missing core files listed in `AGENTS.md` at session startup.
Obsidian files and the task dashboard are optional copies; journal and learned files are created
when their lifecycle events occur. Reconstruction must never overwrite an existing owner file.

---

## Upgrade procedure

When you want to check for or apply an upgrade:

1. **Check status:** Ask the Chief: *"Are there any updates to Folder Chief?"*
2. **Fetch and diff:** The Chief fetches upstream changes (`git fetch origin` or `git fetch upstream`) and reviews the incoming diff against the manifest.
3. **Conversational briefing:** The Chief summarizes:
   - What features, bug fixes, or manual pages have changed.
   - Confirmation that ignored owner-state paths remain outside the incoming product diff.
4. **Apply update:** With your consent, the Chief pulls upstream changes:
   ```bash
   git pull origin main
   ```
5. **Verify:** The Chief checks `chief/VERSION` (which may legitimately remain unchanged for
   unreleased/current work), reads `CHANGELOG.md`, verifies the operating contract, confirms owner
   paths remain untracked, and logs the upgrade in today's `journal/YYYY-MM-DD.md`.

The repository currently records a `1.0.0` technical baseline and later work under
**Unreleased**. It has no Git tags or GitHub Releases in the available history. See
[`CHANGELOG.md`](../../CHANGELOG.md); do not manufacture a release number from the newest commit.

---

## Handling Customizations and Merge Conflicts

If you have customized `AGENTS.md` or contract rules:
- Standard Git merge strategies apply.
- If a conflict arises in `AGENTS.md`, the Chief helps resolve it by preserving your custom rules while adopting upstream contract enhancements.
- Substantive runtime files in `brain/`, `journal/`, `team/`, and the other ignored owner-state
  paths should not appear in an ordinary upstream diff. Stop and review if an incoming change
  begins tracking one of those paths.
