# Scheduled and unattended runs (Optional Advanced Extension)

> **Core Boundary Notice:** Folder Chief core is 100% interactive, local, and inert-by-default. Scheduled runs and unattended execution are optional advanced extensions that operate outside the core behavioral promise.

## What it enables

The scheduled runs capability enables Folder Chief to execute recurring, non-interactive tasks on a timetable (for example, preparing your morning briefing in `brain/state/today.md`, organizing notes from `brain/inbox/`, or compiling project summaries).

## Status & Validation

- **Status:** Illustrative reference pattern for CLI headless modes (`claude -p`, `codex exec`, `gemini -p`, `opencode run`; no enforcement wrapper ships in this repository and end-to-end validation is pending).


## What it requires

- A system scheduler on the host (e.g. `cron`, `launchd` on macOS, or `systemd --user` timers on Linux).
- A harness CLI that supports headless / non-interactive execution (e.g. `claude -p "..."`, `codex exec "..."`, `gemini -p "..."`, or `opencode run "..."`).
- A written standing instruction file (e.g. `brain/state/standing-briefing.md`).
- A Tier 2 capability grant recorded in `chief/capabilities.md`.
- The **approval-as-a-file** pattern: an explicit `approved: YYYY-MM-DD` line inside the standing instruction file.
- A separately implemented, manually verified wrapper that checks the approval line before launching the harness, enforces path/time/output bounds, and fails closed. Prompt text alone is not an approval control.

## Security implications

- **Unattended execution risk**: Scheduled runs execute without a human in the interactive loop. Therefore, scheduled tasks must operate under strict Tier 2 constraints:
  1. Read-and-draft only.
  2. Writes strictly confined to `brain/` or `journal/`.
  3. No autonomous external sending, publishing, or deletion.
  4. Every run must append a dated entry to `brain/log.md`.
- **Approval-as-a-file**: The wrapper must verify that the standing instruction file contains the expected `approved: YYYY-MM-DD` value on every run. The date attributes approval; it expires only if the owner's recorded policy says it does. Missing, malformed, unexpected, or revoked approval aborts before the model starts.
- **Resource bounds**: Set strict execution timeouts and output limits on cron jobs to prevent runaway loops.

## How to set it up

### 1. Create a standing instruction file
Create a file such as `brain/state/morning-brief-instruction.md`:
```markdown
# Morning briefing instruction
approved: 2026-08-23
schedule: daily 07:00

### Instructions
1. Read brain/me.md and brain/state/today.md.
2. Review any new notes in brain/inbox/ and file them into brain/sources/.
3. Update brain/state/today.md with today's priorities.
4. Append an entry to brain/log.md: "## [YYYY-MM-DD] scheduled-run | Morning brief prepared".
```

### 2. Test the harness headless command interactively

The commands below demonstrate harness entry points. They are not safe scheduler wrappers by
themselves because a natural-language request to check approval is not deterministic enforcement.

#### Claude Code
```bash
claude -p "Read and execute the already-validated instructions in brain/state/morning-brief-instruction.md; stay in-folder and log to brain/log.md."
```

#### Codex CLI
```bash
codex exec "Read and execute the already-validated instructions in brain/state/morning-brief-instruction.md; stay in-folder and log to brain/log.md."
```

#### Gemini CLI
```bash
gemini -p "Execute the already-validated tasks in brain/state/morning-brief-instruction.md; stay in-folder and log to brain/log.md."
```

#### OpenCode
```bash
opencode run "Execute the already-validated tasks in brain/state/morning-brief-instruction.md; stay in-folder and log to brain/log.md."
```

### 3. Add only the verified wrapper to the host scheduler

Implement and manually test a wrapper outside this repository. The wrapper must validate the
expected approval value, use an explicit repository path, enforce a timeout and output cap, and
launch one of the tested commands above. Then schedule that wrapper, not a raw model prompt. A
Linux cron entry has this shape:
```bash
0 7 * * * /absolute/path/to/verified-folder-chief-wrapper >> /absolute/path/to/folder-chief/journal/cron.log 2>&1
```

Use `launchd` on macOS, Task Scheduler on Windows, or a user-level timer on Linux when those are
the host's normal scheduling mechanisms.

## How to verify it works

1. Test the wrapper manually before placing it in a scheduler, including missing, malformed, and revoked approval cases:
   ```bash
   /absolute/path/to/verified-folder-chief-wrapper
   ```
2. Inspect `brain/state/today.md` and `brain/log.md` to confirm that the expected updates were written.
3. Confirm that no unintended files or external side effects occurred.
4. Record the grant stanza and update `chief/capabilities.md` with status `active` and schedule details.

## How to revoke it

1. Remove or comment out the cron entry (`crontab -e`) or disable the systemd timer.
2. Remove or edit the `approved:` line in the standing instruction file (e.g. change to `approved: revoked`).
3. Update `chief/capabilities.md` setting status to `revoked` and append a dated revocation stanza.
