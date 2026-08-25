# Git version control and repository remotes

## What it enables

The Git capability enables local version control of Folder Chief product files, inspection of upstream diffs, and application of owner-approved product pulls. Remote publishing and owner-memory backup remain separate concerns.

## Status & Validation

- **Status:** Supported reference pattern (standard system git and remote topology; validation pending).

## What it requires

- Local `git` command-line utility installed and in `$PATH`.
- A configured Git identity (`user.name` and `user.email` in `~/.gitconfig`).
- SSH key in `~/.ssh/` loaded into `ssh-agent`, or GitHub CLI (`gh`) / credential helper configured outside the repository.

## Understanding Git vs Personal Memory Backup (Crucial Distinction)

Folder Chief maintains strict physical decoupling between product machinery and owner memory:

1. **Product Repository:** The Git repository tracks Folder Chief's contract (`AGENTS.md`), harness shims, manuals (`chief/manual/`), templates, and scaffolds.
2. **Owner Runtime State Is Gitignored:** Substantive files in `brain/`, `journal/`, `team/`, and `chief/learned/`, plus `chief/capabilities.md` and `chief/installed.md`, are intentionally gitignored. They stay out of ordinary upstream diffs, but local tracked-file customizations can still conflict and every upgrade needs a backup and diff review.
3. **What `git push` Does and Does Not Do:**
   - **Does:** Backs up your tracked product configuration, custom prompt additions, and template changes.
   - **Does NOT:** It does **not** push or back up the ignored owner runtime paths listed above.
4. **How to Back Up Personal Memory:**
   - **Primary / Complete Backup:** Copy or archive the entire `folder-chief` directory (e.g. `tar -czf backup.tar.gz folder-chief`, `rsync`, or Time Machine). This preserves 100% of product and memory files.
   - **Dedicated Git Vault:** If you want Git history for your notes, initialize a dedicated, separate private Git repository inside `brain/` or back up your personal data to a private vault repository decoupled from the product repo. See [Backup, Move, and Recover](../backup-move-recover.md).

## Security implications

- **Do not commit secrets**: Ensure `.gitignore` continues to ignore `.env*`, `secrets/`, and local credentials so tokens are never staged.
- **Reference-only credentials**: SSH keys, tokens, and passwords must never be stored inside this directory. Git authentication must be handled entirely by the host system's SSH agent or Git credential helper.
- **Remote mutation boundary**: The Chief can prepare local commits, explain diffs, and suggest push commands, but it does not push, open or merge pull requests, create releases, or otherwise mutate a remote. The owner performs remote publication through their own tool.

## Remote topology: `upstream` vs `origin`

If you maintain your own product fork or custom branch:
- **`upstream`**: Points to the canonical public product repository (`https://github.com/leebase/folder-chief.git`).
- **`origin`**: Points to your personal fork or repository.

### Setting up remotes

When you clone directly from GitHub, `origin` points to `https://github.com/leebase/folder-chief.git`. If you maintain a separate remote:

1. Rename the initial remote to `upstream`:
   ```bash
   git remote rename origin upstream
   ```
2. Add your personal repository as `origin`:
   ```bash
   git remote add origin git@github.com:username/my-folder-chief-fork.git
   ```
3. When product updates are released, pull them cleanly from `upstream`:
   ```bash
   git pull upstream main
   ```

## How to verify it works

1. Ask Folder Chief to check git status and remotes:
   ```bash
   git status && git remote -v
   ```
2. Verify that configured remotes are reported accurately without error.
3. Record the status in `chief/capabilities.md`.

## How to revoke it

1. Remove any custom remote configuration:
   ```bash
   git remote remove origin
   ```
2. Update `chief/capabilities.md` to set Git capability status to `not probed` or `revoked`.
