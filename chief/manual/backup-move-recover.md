# Backup, Move, and Recover

## The Direct Answer: How Backup Works

Folder Chief separates the **product machinery** from your **personal memory**:

1. **Product Repository:** Contains the operating contract (`AGENTS.md`), harness shims, product manuals (`chief/manual/`), and scaffolding templates (`chief/templates/`). This is tracked in Git and updated via `git pull`.
2. **Owner Runtime State:** Contains the knowledge vault (`brain/`), session logs (`journal/`),
   Folder Agents (`team/`), installation capabilities (`chief/capabilities.md`), learned rules
   (`chief/learned/`), and onboarding marker (`chief/installed.md`). Substantive runtime files are
   intentionally gitignored so they stay out of ordinary product diffs. This topology reduces
   conflicts; it does not replace backup and upgrade review.

Because your personal memory is gitignored, running `git push` on the product repository **does not back up your personal memory**.

---

## How to Back Up Your Memory

Choose one of two clear backup approaches:

### Method 1: Complete Folder Copy or Archive (Recommended)
Because Folder Chief consists entirely of plain files on disk, copying or archiving the entire `folder-chief/` directory preserves 100% of both product configurations and your personal memory.

```bash
# Create a timestamped compressed archive
tar -czf folder-chief-backup-$(date +%F).tar.gz -C .. folder-chief

# Or sync to an external drive / backup directory
rsync -av --exclude '.trash' folder-chief/ /path/to/backup/folder-chief/
```
Include hidden files (`.gitignore`, `.claude/`, `.gemini/`, and all `.gitkeep` files). Never put credentials or secrets into the backup.

### Method 2: Dedicated Private Git Vault (For Note History in `brain/` Only)
If you want Git history for your notes, you can initialize a dedicated, separate private Git repository inside `brain/`:
```bash
cd brain
git init
git remote add origin git@github.com:yourname/my-private-notes-vault.git
git add -A
git commit -m "Backup private brain vault"
git push -u origin main
```
This keeps your Obsidian notes vault under private version control, independent from the product repository.

> **Warning — Incomplete Memory Backup:** A dedicated Git repo inside `brain/` **only** tracks your notes in `brain/`. It does **not** back up your operational session journals (`journal/`), Folder Agent workspaces (`team/`), installation capabilities (`chief/capabilities.md`), learned rules (`chief/learned/`), or onboarding marker (`chief/installed.md`). For a complete, full-fidelity backup of your entire Chief, always use **Method 1 (Complete Folder Copy/Archive)**.


---

## Moving to Another Directory, Machine, or Harness

When moving Folder Chief to a different path or computer:

1. **Preserve hidden files & structure:** Ensure all hidden files (`.gitignore`, `.claude/`, `.gemini/`, and all `.gitkeep` anchor files) are copied alongside visible directories.
2. **Preserve owner state:** Copy `brain/`, `journal/`, `team/`, `chief/learned/`,
   `chief/installed.md`, and `chief/capabilities.md` to the new location.
3. **Launch in new environment:** Open the new directory with Claude Code, Codex CLI, Gemini CLI, or OpenCode (`pwd`), and say hello. The Markdown contract and memory resume naturally. See [Harnesses](harnesses.md) for detailed harness configuration and settings pointers.
4. **Re-wire capability grants:** Capability grants and credentials do not automatically travel across machines: inspect `chief/capabilities.md`, keep secrets in the new environment or keychain, and treat every unverified capability as unavailable.

---

## How to Restore After a Machine Loss or Clean Install

To restore your entire setup from scratch:

1. **Clone the product repository:**
   ```bash
   git clone https://github.com/leebase/folder-chief.git folder-chief
   cd folder-chief
   ```
2. **Restore your personal memory files:**
   Copy your preserved `brain/`, `journal/`, `team/`, `chief/learned/`,
   `chief/capabilities.md`, and `chief/installed.md` from your backup into the cloned
   `folder-chief` directory.
3. **Launch your AI assistant:**
   Run `claude`, `codex`, `gemini`, or `opencode`. The assistant detects `chief/installed.md` and `brain/me.md`, loads your active context, and resumes work.

---

## Recovery After a Mistake or State Corruption

1. **Stop making changes** and make a safety copy of the current folder.
2. **Inspect the affected Markdown** and use your backup copy or diffs to identify the last good state. Do not restore blindly over newer owner knowledge.
3. **Restore the smallest affected file or note** from your safe backup.
4. **Check `brain/sources/` first** when rebuilding a derived note: raw material remains the authoritative, unchanged input. Recompile or rewrite only `brain/notes/`, and record the correction in `brain/log.md`.
5. **Re-read `brain/me.md`**, today's journal, and `brain/state/today.md` before resuming work.

---

## Reconstructing Missing State Files from Scaffolds

If runtime state files are missing, accidentally deleted, or corrupted, the Chief can repopulate default scaffolds from `chief/templates/scaffolds/` without overwriting existing data:

| Target Path | Source Scaffold | Description |
|---|---|---|
| `brain/me.md` | `chief/templates/scaffolds/brain-me.md` | Owner profile, work overview, and preferences |
| `brain/state/today.md` | `chief/templates/scaffolds/brain-today.md` | Current daily priorities, `as_of` date, and open loops |
| `brain/index.md` | `chief/templates/scaffolds/brain-index.md` | Vault map and index navigation |
| `brain/log.md` | `chief/templates/scaffolds/brain-log.md` | Vault activity and memory change log |
| `brain/dashboards/tasks.base` | `chief/templates/scaffolds/tasks.base` | Obsidian Bases task dashboard view |
| `brain/.obsidian/app.json` | `chief/templates/scaffolds/obsidian-app.json` | Optional Obsidian vault settings |
| `brain/.obsidian/core-plugins.json` | `chief/templates/scaffolds/obsidian-core-plugins.json` | Optional Obsidian core-plugin settings |
| `chief/capabilities.md` | `chief/templates/scaffolds/capabilities.md` | Installation capability verification registry |
| `team/ROSTER.md` | `chief/templates/scaffolds/team-roster.md` | Active and retired Folder Agents registry |
| `journal/YYYY-MM-DD.md` | `chief/templates/scaffolds/journal-entry.md` | Session-wrap journal shape |
| `chief/learned/<slug>.md` | `chief/templates/scaffolds/learned-lesson.md` | Correction and promoted-rule shape |

Session startup automatically populates only the missing core files named in `AGENTS.md`.
The Obsidian files and task dashboard are optional copies; journal and learned files are created
when their corresponding lifecycle events occur. Never overwrite an existing owner file merely
to make it match a scaffold.

If `brain/me.md` was deleted, onboarding is still complete as long as `chief/installed.md` exists; the owner can recreate the profile directly. If the installation marker `chief/installed.md` is removed, the Chief restarts a clean 3-question onboarding flow on next launch.

---

## Secret Exposure and Leak Recovery

If a secret ever reaches a file or git history:
1. Immediately revoke the token at the providing service (GitHub, Google, Slack, etc.).
2. Follow the leak recovery procedure in [Security](security.md#git-leak-recovery-procedure) using `git-filter-repo` to purge the secret string or file across all commits.
3. The Chief does not perform external revocations or force-push history rewrites. It can prepare
   the recovery commands and verification checklist for the owner to execute in their own tool.

---

## Upgrade Boundary

Folder Chief has no automated background updater or migration script. Upstream changes update
product documentation (`chief/manual/`) and templates (`chief/templates/`) while preserving
untracked runtime files in `brain/`, `chief/capabilities.md`, `chief/learned/`, `team/`, and `journal/`.
