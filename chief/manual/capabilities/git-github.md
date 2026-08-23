# Git and GitHub private backup

## What it enables

The Git capability enables full version control of Folder Chief: tracking changes across sessions, committing memory updates, inspecting diffs, and backing up the entire repository to a private GitHub (or other Git host) repository. This provides off-machine safety and complete change history.

## Status & Validation

- **Status:** Verified with standard system git and remote topology.
- **Last tested:** 2026-08-23.

## What it requires

- Local `git` command-line utility installed and in `$PATH`.
- A configured Git identity (`user.name` and `user.email` in `~/.gitconfig`).
- SSH key in `~/.ssh/` loaded into `ssh-agent`, or GitHub CLI (`gh`) / credential helper configured outside the repository.
- A private remote repository on GitHub or your preferred Git host.

## Security implications

- **Private repository requirement**: `brain/` contains your personal knowledge, profile, notes, and task state. The remote backup repository **must always be private**. Never push Folder Chief owner state to a public repository.
- **Reference-only credentials**: SSH keys, tokens, and passwords must never be stored inside this directory. Git authentication must be handled entirely by the host system's SSH agent or Git credential helper.
- **Ignored patterns**: Ensure `.gitignore` continues to ignore `.env*`, `secrets/`, and local harness files so private credentials are never staged.
- **Push boundaries**: The Chief can prepare commits, explain diffs, and suggest push commands, but will only execute remote pushes upon explicit owner request.

## Remote topology: `upstream` vs `origin`

To enable both clean upstream product updates and a private off-machine backup:
- **`upstream`**: Points to the public product repository (`https://github.com/leebase/folder-chief.git`).
- **`origin`**: Points to your private backup repository (e.g. `git@github.com:username/my-folder-chief.git`).

### Setting up the two remotes

If you cloned directly from GitHub, `origin` currently points to the public product repository. Configure your remotes as follows:

1. Rename the initial remote to `upstream`:
   ```bash
   git remote rename origin upstream
   ```
2. Create a new **private** repository on GitHub (e.g. `github.com/username/my-folder-chief`).
3. Add your private repository as `origin`:
   ```bash
   git remote add origin git@github.com:username/my-folder-chief.git
   ```
4. Push your local repository to your private remote:
   ```bash
   git push -u origin main
   ```
5. When product updates are released, pull them cleanly from `upstream`:
   ```bash
   git pull upstream main
   ```

## How to verify it works

1. Ask Folder Chief to check git status and remotes:
   ```bash
   git status && git remote -v
   ```
2. Verify that `origin` points to your private repository and `upstream` points to `https://github.com/leebase/folder-chief.git`.
3. Record the verified status, remote names, and date in `chief/capabilities.md`.

## How to revoke it

1. Remove the private remote configuration:
   ```bash
   git remote remove origin
   ```
2. Revoke the deploy key or Personal Access Token on GitHub / Git host settings.
3. Update `chief/capabilities.md` to set Git / private backup status to `not probed` or `revoked`.
