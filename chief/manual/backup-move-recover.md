# Backup, Move, and Recover

## The Simple Answer

Copy the entire Folder Chief directory to a safe location. That copy is a complete backup of
the plain-file product and the owner's memory. Include hidden files and directories; preserve
`.gitkeep` anchor files, `.gitignore`, `brain/`, `chief/`, `team/`, `journal/`, and the root contract.
Never put credentials or secret material into the copy.

Git is the stronger optional backup for owners who want history and an off-machine copy. Make
normal commits and push only to a private repository you control, using the harness or Git
credentials outside this folder. See the [Git and GitHub guide](capabilities/git-github.md)
for complete setup details. The Chief may prepare a commit or explain a diff, but it does
not claim that a push happened and it never stores credentials here.

---

## Moving to Another Directory, Machine, or Harness

When moving Folder Chief to a different path or machine:

1. **Preserve hidden files & structure:** Ensure all hidden files (`.gitignore`, `.claude/`, `.gemini/`, and all `.gitkeep` anchor files) are copied alongside visible directories.
2. **Preserve owner memory:** Ensure `brain/`, `journal/`, `team/`, `chief/installed.md`, and `chief/capabilities.md` are copied or cloned from your private backup repository.
3. **Launch in new environment:** Open the new directory with Claude Code, Codex CLI, Gemini CLI, or OpenCode (`pwd`), and say hello. The Markdown contract and memory travel seamlessly. See [Harnesses](harnesses.md) for detailed harness configuration, settings pointers, and skill linking procedures.
4. **Re-wire capability grants:** Capability grants and credentials do not automatically travel across machines: inspect `chief/capabilities.md`, keep secrets in the new environment or keychain, and treat every unverified capability as unavailable.

---

## Remote Topology for Backup: `origin` vs `upstream`

When using Git for backup:
- Configure **`origin`** (or **`private`**) as your private vault repository (e.g. `git@github.com:yourname/my-private-vault.git`).
- Configure **`upstream`** as the public product repository (`https://github.com/leebase/folder-chief.git`).
- Backup your private vault with:
  ```bash
  git push origin main
  ```
- Pull upstream product updates with:
  ```bash
  git pull upstream main
  ```
Because runtime memory in `brain/`, `journal/`, and `team/` is untracked in upstream git (D101), upstream pulls complete with **0 merge conflicts**.

---

## Recovery After a Mistake or State Corruption

1. **Stop making changes** and make a safety copy of the current folder.
2. **Inspect the affected Markdown** and use `git diff` or earlier commits to identify the last good state. Do not restore blindly over newer owner knowledge.
3. **Restore the smallest affected file or note** from the safe copy or a reviewed git commit.
4. **Check `brain/sources/` first** when rebuilding a derived note: raw material remains the authoritative, unchanged input. Recompile or rewrite only `brain/notes/`, and record the correction in `brain/log.md`.
5. **Re-read `brain/me.md`**, today's journal, and `brain/state/today.md` before resuming work.

---

## Reconstructing Missing State Files from Scaffolds

If runtime state files are missing, accidentally deleted, or corrupted, the Chief automatically repopulates default scaffolds from `chief/templates/scaffolds/` without overwriting existing data:

| Target Path | Source Scaffold | Description |
|---|---|---|
| `brain/me.md` | `chief/templates/scaffolds/brain-me.md` | Owner profile, work overview, and preferences |
| `brain/state/today.md` | `chief/templates/scaffolds/brain-today.md` | Current daily priorities, `as_of` date, and open loops |
| `brain/index.md` | `chief/templates/scaffolds/brain-index.md` | Vault map and index navigation |
| `brain/log.md` | `chief/templates/scaffolds/brain-log.md` | Vault activity and memory change log |
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

For an owner-run history purge procedure, read [Security](security.md) and [Memory](memory.md).
Ordinary backup and derived-note deletion do not remove old content from Git history.
