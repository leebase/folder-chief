# Scheduled and unattended runs

## What it enables

The scheduled runs capability enables Folder Chief to execute recurring, non-interactive tasks on a timetable (for example, preparing your morning briefing in `brain/state/today.md`, organizing notes from `brain/inbox/`, or compiling project summaries).

## What it requires

- A system scheduler on the host (e.g. `cron`, `launchd` on macOS, or `systemd --user` timers on Linux).
- A harness CLI that supports headless / non-interactive execution (e.g. `claude -p "..."`, `codex exec "..."`, `gemini -p "..."`, or OpenCode headless mode).
- A written standing instruction file (e.g. `brain/state/standing-briefing.md`).
- A Tier 2 capability grant recorded in `chief/capabilities.md`.
- The **approval-as-a-file** pattern: an explicit `approved: YYYY-MM-DD` line inside the standing instruction file.

## Security implications

- **Unattended execution risk**: Scheduled runs execute without a human in the interactive loop. Therefore, scheduled tasks must operate under strict Tier 2 constraints:
  1. Read-and-draft only.
  2. Writes strictly confined to `brain/` or `journal/`.
  3. No autonomous external sending, publishing, or deletion.
  4. Every run must append a dated entry to `brain/log.md`.
- **Approval-as-a-file**: The harness script must verify that the standing instruction file contains an unexpired `approved: YYYY-MM-DD` date. If the approval is missing or revoked, execution aborts immediately.
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

### 2. Configure the harness headless command

#### Claude Code
```bash
claude -p "Read brain/state/morning-brief-instruction.md. If approved date is valid, execute the instructions and log to brain/log.md."
```

#### Codex CLI
```bash
codex exec "Read brain/state/morning-brief-instruction.md. If approved date is valid, execute the instructions."
```

#### Gemini CLI
```bash
gemini -p "Execute the approved tasks in brain/state/morning-brief-instruction.md."
```

#### OpenCode
```bash
opencode --non-interactive "Execute tasks in brain/state/morning-brief-instruction.md."
```

### 3. Add to crontab
Open your user crontab (`crontab -e`) and add an entry with full paths:
```bash
0 7 * * * cd /home/user/folder-chief && claude -p "Read brain/state/morning-brief-instruction.md. If approved date is valid, execute instructions." >> journal/cron.log 2>&1
```

## How to verify it works

1. Test the command manually in your terminal before placing it in cron:
   ```bash
   cd /path/to/folder-chief && claude -p "..."
   ```
2. Inspect `brain/state/today.md` and `brain/log.md` to confirm that the expected updates were written.
3. Confirm that no unintended files or external side effects occurred.
4. Record the grant stanza and update `chief/capabilities.md` with status `active` and schedule details.

## How to revoke it

1. Remove or comment out the cron entry (`crontab -e`) or disable the systemd timer.
2. Remove or edit the `approved:` line in the standing instruction file (e.g. change to `approved: revoked`).
3. Update `chief/capabilities.md` setting status to `revoked` and append a dated revocation stanza.
