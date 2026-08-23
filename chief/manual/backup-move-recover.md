# Backup, move, and recover

## The simple answer

Copy the entire Folder Chief directory to a safe location. That copy is a complete backup of
the plain-file product and the owner's memory. Include hidden files and directories; preserve
`brain/`, `chief/`, `team/`, `journal/`, and the root contract. Never put credentials or secret
material into the copy.

Git is the stronger optional backup for owners who want history and an off-machine copy. Make
normal commits and push only to a private repository you control, using the harness or Git
credentials outside this folder. The Chief may prepare a commit or explain a diff, but it does
not claim that a push happened and it never stores the credential here.

## Moving to another path or harness

Copy or clone the folder, open the new location with Claude Code, Codex CLI, Gemini CLI, or
OpenCode, and say hello. The Markdown contract and memory travel. Harness-native settings and
capability grants do not automatically travel: inspect `chief/capabilities.md`, keep secrets in
the new harness's own configuration or keychain, and treat every unverified capability as
unavailable. A new harness must not be told that email, shell, web, or Git access works merely
because the manual describes it.

The portable instruction files are `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and the Gemini
settings file. The shims point to the canonical contract instead of copying its content. The
Claude settings direct native auto-memory to `chief/learned/`; if a harness does not use that
setting, the Markdown memory protocol still applies.

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

## Secret exposure

If a secret ever reaches a file or git history, stop using it, tell the owner exactly where it
was observed, and recommend revocation through the credential owner. Removing the visible file
is not enough if the value is in history. The Chief must not perform an external revocation,
push a repair, or rewrite history without the owner's explicit decision and the relevant
credential or Git authority; it can prepare the in-folder recovery plan.

## Upgrade boundary

Sprint 1 has no updater or migration script. Keep a backup before changing product files. Treat
`chief/manual/` and the root contract as product content; protect `brain/`, `chief/capabilities.md`,
`chief/learned/`, `team/`, and `journal/` as installation or owner state. Review every diff
rather than assuming a copied manual is harmless.
