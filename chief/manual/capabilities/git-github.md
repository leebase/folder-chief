# Git and GitHub private backup

## What it enables

The Git capability enables full version control of Folder Chief: tracking changes across sessions, committing memory updates, inspecting diffs, and backing up the entire repository to a private GitHub (or other Git host) repository. This provides off-machine safety and complete change history.

## What it requires

- Local `git` command-line utility installed and in `$PATH`.
- A configured Git identity (`user.name` and `user.email` in `~/.gitconfig`).
- SSH key in `~/.ssh/` loaded into `ssh-agent`, or GitHub CLI (`gh`) / credential helper configured outside the repository.
- A private remote repository on GitHub or your preferred Git host.

## Security implications

- **Private repository requirement**: `brain/` contains your personal knowledge, profile, notes, and task state. The remote repository **must always be private**. Never push Folder Chief to a public repository.
- **Reference-only credentials**: SSH keys, tokens, and passwords must never be stored inside this directory. Git authentication must be handled entirely by the host system's SSH agent or Git credential helper.
- **Ignored patterns**: Ensure `.gitignore` continues to ignore `.env*`, `secrets/`, and local harness files so private credentials are never staged.
- **Push boundaries**: The Chief can prepare commits, explain diffs, and suggest push commands, but will only execute remote pushes upon explicit owner request.

## How to set it up

### Claude Code
Ensure Git is configured on the host system. When Claude Code executes git commands, it uses the host user's Git and SSH configuration automatically.

### Codex CLI
Configure git tool permissions in Codex's profile. Authentication uses the ambient SSH keys or git credential manager.

### Gemini CLI
Verify that shell commands can access `git`. Ambient SSH authentication from the user environment is inherited.

### OpenCode
OpenCode uses host shell execution for git commands. Ensure your SSH agent is running in your terminal session before starting.

### Configuring a private remote
1. Create a new private repository on GitHub (e.g., `github.com/username/my-folder-chief`).
2. Add the remote in your terminal:
   ```bash
   git remote add origin git@github.com:username/my-folder-chief.git
   ```
3. Set the default branch: `git branch -M main`.

## How to verify it works

1. Ask Folder Chief to check git status and remotes:
   ```bash
   git status && git remote -v
   ```
2. Verify that the working directory state is clean and the remote points to your intended private repository URL.
3. Test a safe push if desired: `git push -u origin main`.
4. Record the verified status, remote name, and date in `chief/capabilities.md`.

## How to revoke it

1. Remove the remote configuration from the repository:
   ```bash
   git remote remove origin
   ```
2. Revoke the deploy key or Personal Access Token on GitHub / Git host settings.
3. Update `chief/capabilities.md` to set Git / private backup status to `not probed` or `revoked`.
