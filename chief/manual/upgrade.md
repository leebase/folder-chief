# Upgrading Folder Chief

This document details how Folder Chief handles product updates, the file preservation manifest,
and how the Chief can pull updates and explain changes conversationally.

## The Git-native upgrade model

Folder Chief is distributed via `git clone`, not as a detached template repository or an opaque binary installer.
Because your folder retains its connection to the upstream repository remote (`origin/main`), updates are
applied using standard Git mechanisms.

This enables a unique capability: **the Chief can inspect upstream updates, perform the update, and explain the
diff to you in plain English**, all without risking your private vault or team data.

## The Upgrade Manifest: What changes vs what is preserved

Folder Chief maintains strict physical separation between product machinery and owner data. Upgrades respect
this boundary unconditionally.

### Replaced / Updated on product upgrade
These files contain upstream product logic and documentation:
- `chief/manual/` — Product documentation and self-knowledge manuals.
- `chief/templates/` — Standard templates (e.g. `folder-agent/`).
- `chief/VERSION` — Product version and sprint tracking.
- `AGENTS.md` & platform shims (`CLAUDE.md`, `GEMINI.md`, `.gemini/settings.json`, `.claude/settings.json`) —
  The canonical operating contract and platform configuration.

### Preserved / Never overwritten on upgrade
These files contain your personal identity, memories, notes, and team configuration. Upstream never ships
replacements for these paths:
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
2. **Fetch and diff:** The Chief fetches upstream changes (`git fetch origin`) and reviews the incoming diff
   against the manifest.
3. **Conversational briefing:** The Chief summarizes:
   - What features, bug fixes, or manual pages have changed.
   - Confirmation that all files in `brain/`, `journal/`, and `team/` remain untouched.
4. **Apply update:** With your consent, the Chief pulls upstream changes:
   ```bash
   git pull origin main
   ```
5. **Verify:** The Chief verifies that `chief/VERSION` is updated, the operating contract is intact, and logs
   the upgrade in today's `journal/YYYY-MM-DD.md`.

## Handling customizations and merge conflicts

If you have customized `AGENTS.md` or contract rules:
- Standard Git merge strategies apply.
- If a conflict arises in `AGENTS.md`, the Chief helps resolve it by preserving your custom rules while adopting
  upstream contract enhancements.
- Files in `brain/` and `team/` will never conflict because upstream branches do not contain your personal files.
