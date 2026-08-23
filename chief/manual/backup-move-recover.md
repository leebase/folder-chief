# Backup, move, and recover

## The simple answer

Copy the entire Folder Chief directory to a safe location. That copy is a complete backup of
the plain-file product and the owner's memory. Include hidden files and directories; preserve
`brain/`, `chief/`, `team/`, `journal/`, and the root contract. Never put credentials or secret
material into the copy.

Git is the stronger optional backup for owners who want history and an off-machine copy. Make
normal commits and push only to a private repository you control, using the harness or Git
credentials outside this folder. See the [Git and GitHub guide](capabilities/git-github.md)
for complete setup details. The Chief may prepare a commit or explain a diff, but it does
not claim that a push happened and it never stores credentials here.

## Moving to another path or harness

Copy or clone the folder, open the new location with Claude Code, Codex CLI, Gemini CLI, or
OpenCode, and say hello. The Markdown contract and memory travel seamlessly. See [Harnesses](harnesses.md)
for detailed harness configuration, settings pointers, and skill linking procedures.

Capability grants do not automatically travel across machines or harnesses: inspect
`chief/capabilities.md`, keep secrets in the new environment or keychain, and treat every
unverified capability as unavailable. A new harness must not be told that email, shell, web,
or Git access works merely because the manual describes it.

## Recovery after a mistake

1. Stop making changes and make a safety copy of the current folder.
2. Inspect the affected Markdown and `git diff` or earlier commits to identify the last good
   state. Do not restore blindly over newer owner knowledge.
3. Restore the smallest affected file or note from the safe copy or a reviewed git state.
4. Check `brain/sources/` first when rebuilding a derived note: raw material remains the
   authoritative, unchanged input. Recompile or rewrite only `brain/notes/`, and record the
   correction in `brain/log.md`.
5. Re-read `brain/me.md`, today's journal, and `brain/state/today.md` before resuming work.

If `brain/me.md` was deleted, onboarding is still complete as long as `chief/installed.md`
exists; the owner can recreate the profile directly. If the marker was deleted intentionally,
run the documented onboarding sequence. A missing marker in a copied working tree should not be
silently recreated without completing onboarding.

## Secret exposure and leak recovery

If a secret ever reaches a file or git history:
1. Immediately revoke the token at the providing service (GitHub, Google, Slack, etc.).
2. Follow the leak recovery procedure in [Security](security.md#git-leak-recovery-procedure) using
   `git-filter-repo` to purge the secret string or file across all commits.
3. The Chief must not perform external revocations or push force-rewrites without the owner's
   explicit direction and authority; it can prepare the recovery commands.

## Upgrade boundary

This Sprint 3 release has no automated updater or migration script. Keep a backup before
changing product files. Treat `chief/manual/` and the root contract as product content; protect
`brain/`, `chief/capabilities.md`, `chief/learned/`, `team/`, and `journal/` as installation or
owner state. Review every diff rather than assuming a copied manual is harmless.

For an owner-run history purge procedure, read [Security](security.md) and [Memory](memory.md).
Ordinary backup and derived-note deletion do not remove old content from Git history.
