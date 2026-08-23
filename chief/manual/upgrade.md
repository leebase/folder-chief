# Upgrading Folder Chief

This document details how Folder Chief handles product updates, the file preservation manifest,
remote repository topology, and how the Chief can pull updates and explain changes conversationally.

## The Git-native upgrade model & remote topology

Folder Chief is distributed via Git. Because your folder retains a connection to the upstream
product repository, updates are applied using standard Git mechanisms.

### Remote topology: `upstream` vs `origin`
To maintain both seamless upstream product updates and a private off-machine backup:
- **`upstream`** points to the public product repository: `https://github.com/leebase/folder-chief.git`.
- **`origin`** points to your own private repository (e.g. `git@github.com:yourname/my-private-vault.git`).

When you first clone Folder Chief, `origin` initially points to the public repository. We recommend:
```bash
# Rename the product remote to upstream
git remote rename origin upstream

# Add your private backup repository as origin
git remote add origin git@github.com:yourname/my-private-vault.git
```

This ensures `git push origin main` backs up your private vault, while `git pull upstream main`
pulls product updates.

## Clone vs Fork vs ZIP

- **Clone (Recommended):** `git clone https://github.com/leebase/folder-chief.git`. Retains git history,
  allows configuring separate `upstream` and `origin` remotes, and enables one-command upgrades.
- **Fork:** Forking directly on GitHub creates a repository in your GitHub account. Note: GitHub forks
  of public repositories default to public visibility, which risks exposing private owner notes. A clean
  clone with a dedicated private `origin` remote is strongly recommended.
- **Download ZIP:** Extracting a ZIP archive provides an inert local folder without Git history. Note that
  ZIP installations cannot use `git pull` for updates; upgrades require manually downloading the new ZIP
  and copying updated `chief/manual/`, `chief/templates/`, and root shims over your folder while preserving
  `brain/`, `journal/`, `team/`, and `chief/capabilities.md`.

## The Upgrade Manifest: What changes vs what is preserved

Folder Chief maintains strict physical decoupling between product machinery and owner state (D101).
Upstream releases track product logic, documentation, and starting scaffolds, while runtime owner state
is untracked and gitignored in the upstream repository.

### Replaced / Updated on product upgrade (`upstream/main`)
These files contain upstream product logic and documentation:
- `chief/manual/` — Product documentation and self-knowledge manuals.
- `chief/templates/` — Standard templates (e.g. `folder-agent/`) and runtime scaffolds (`chief/templates/scaffolds/`).
- `chief/VERSION` — Product version and sprint tracking.
- `AGENTS.md` & platform shims (`CLAUDE.md`, `GEMINI.md`, `.gemini/settings.json`, `.claude/settings.json`) —
  The canonical operating contract and platform configuration.

### Preserved / Never overwritten on upgrade
These paths contain your personal identity, memories, notes, and team configuration. Because they are
untracked runtime files in the product repository, upstream updates never conflict with them:
- `brain/` — Your entire Obsidian-compatible vault (`me.md`, `sources/`, `notes/`, `state/`, `dashboards/`, `index.md`, `log.md`).
- `journal/` — Your operational session journals and historical logs.
- `team/` — Your Folder Agents (`team/<agent-name>/`) and active `team/ROSTER.md`.
- `chief/capabilities.md` — Your installation's verified capability registry.
- `chief/learned/` — Local harness-native auto-memory.
- `chief/installed.md` — Your local onboarding marker.
- `.gitignore` & local environment configurations.

## Upgrade procedure

When you want to check for or apply an upgrade:

1. **Check status:** Ask the Chief: *"Are there any updates to Folder Chief?"*
2. **Fetch and diff:** The Chief fetches upstream changes (`git fetch upstream` or `git fetch origin`) and reviews the incoming diff against the manifest.
3. **Conversational briefing:** The Chief summarizes:
   - What features, bug fixes, or manual pages have changed.
   - Confirmation that all files in `brain/`, `journal/`, and `team/` remain untouched.
4. **Apply update:** With your consent, the Chief pulls upstream changes:
   ```bash
   git pull upstream main
   ```
5. **Verify:** The Chief verifies that `chief/VERSION` is updated, the operating contract is intact, and logs the upgrade in today's `journal/YYYY-MM-DD.md`.

## Handling customizations and merge conflicts

If you have customized `AGENTS.md` or contract rules:
- Standard Git merge strategies apply.
- If a conflict arises in `AGENTS.md`, the Chief helps resolve it by preserving your custom rules while adopting upstream contract enhancements.
- Files in `brain/`, `journal/`, and `team/` will never conflict because upstream branches do not track your personal runtime state.
