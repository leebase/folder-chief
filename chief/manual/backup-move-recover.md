# Backup, Move, and Recover

## The Direct Answer: How Backup Works

Folder Chief separates the **product machinery** from your **personal memory**:

1. **Product Repository:** Contains the operating contract (`AGENTS.md`), harness shims, product manuals (`chief/manual/`), and scaffolding templates (`chief/templates/`). This is tracked in Git and updated via `git pull`.
2. **User Vault (Your Personal Memory):** Contains your profile (`brain/me.md`), knowledge vault (`brain/`), session logs (`journal/`), Folder Agents (`team/`), and installation capabilities (`chief/capabilities.md`). These files are **intentionally gitignored** in the product repository so upstream updates apply with **0 merge conflicts**.

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

### Method 2: Dedicated Private Git Vault (For Note History)
If you want Git history for your notes and memory, you can initialize a dedicated, separate private Git repository inside `brain/`:
```bash
cd brain
git init
git remote add origin git@github.com:yourname/my-private-notes-vault.git
git add -A
git commit -m "Backup private brain vault"
git push -u origin main
```
This keeps your personal vault under private version control, completely independent from the product repository.

---

## Moving to Another Directory, Machine, or Harness

When moving Folder Chief to a different path or computer:

1. **Preserve hidden files & structure:** Ensure all hidden files (`.gitignore`, `.claude/`, `.gemini/`, and all `.gitkeep` anchor files) are copied alongside visible directories.
2. **Preserve owner memory:** Copy your `brain/`, `journal/`, `team/`, `chief/installed.md`, and `chief/capabilities.md` folders and files to the new location.
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
   Copy your preserved `brain/`, `journal/`, `team/`, `chief/capabilities.md`, and `chief/installed.md` from your backup into the cloned `folder-chief` directory.
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
| `chief/capabilities.md` | `chief/templates/scaffolds/capabilities.md` | Installation capability verification registry |
| `team/ROSTER.md` | `chief/templates/scaffolds/team-roster.md` | Active and retired Folder Agents registry |

If `brain/me.md` was deleted, onboarding is still complete as long as `chief/installed.md` exists; the owner can recreate the profile directly. If the installation marker `chief/installed.md` is removed, the Chief restarts a clean 3-question onboarding flow on next launch.

---

## Secret Exposure and Leak Recovery

If a secret ever reaches a file or git history:
1. Immediately revoke the token at the providing service (GitHub, Google, Slack, etc.).
2. Follow the leak recovery procedure in [Security](security.md#git-leak-recovery-procedure) using `git-filter-repo` to purge the secret string or file across all commits.
3. The Chief must not perform external revocations or push force-rewrites without the owner's explicit direction and authority; it can prepare the recovery commands.

---

## Upgrade Boundary

Folder Chief has no automated background updater or migration script. Upstream releases update
product documentation (`chief/manual/`) and templates (`chief/templates/`) while preserving
untracked runtime files in `brain/`, `chief/capabilities.md`, `team/`, and `journal/`.
