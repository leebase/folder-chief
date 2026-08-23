# Shell execution

## What it enables

The shell capability allows Folder Chief to run local command-line utilities via the harness. This is used for inspecting repository state, verifying system properties, running non-destructive probes, and executing user-requested local tools.

## Status & Validation

- **Status:** Verified with harness built-in shell execution tools.
- **Last tested:** 2026-08-23.

## What it requires

- A harness with command execution support (e.g. bash or shell tool).
- Appropriate user permissions on the host system.
- No special folder setup is required; ambient shell capabilities are provided directly by the harness.

## Security implications

- **Execution privilege**: Commands executed through the harness run with the full permissions of the current local user account.
- **Contract vs sandbox boundary**: Folder Chief's contract strictly restricts its own write operations to this repository root. However, the underlying shell tool provided by the harness may not be sandboxed unless configured by the operating system or harness container.
- **Approval mechanism**: In interactive use, the harness prompts the human owner before running unfamiliar or consequential shell commands. Never bypass interactive approval flags for unverified tasks.
- **Forbidden actions**: The Chief will never run commands that delete files outside the repository, modify system configuration, exfiltrate private data, or install persistent background services.

## How to set it up

### Claude Code
Claude Code provides built-in bash execution. Permission modes can be set via command-line flags (e.g., standard prompting vs `--dangerously-skip-permissions` which is not recommended).

### Codex CLI
Codex CLI executes commands within its execution environment, configurable in `~/.codex/config.toml` (e.g., configuring sandboxing or command allowlists).

### Gemini CLI
Gemini CLI provides shell execution when granted in session or configured in `.gemini/settings.json`.

### OpenCode
OpenCode allows shell tool execution governed by its user prompt settings in global configuration.

## How to verify it works

1. Ask Folder Chief to run a harmless command: `echo "probe: shell ok" && uname -s`.
2. Confirm the command executes and outputs the expected string along with the operating system name.
3. Verify that no unexpected side effects or filesystem modifications occurred.
4. Record the verified status, harness, and date in `chief/capabilities.md`.

## How to revoke it

1. Restrict or disable shell execution in the harness settings or start the harness in a read-only / no-shell mode.
2. If sandboxing is available, enforce containerization or strict path confinement to the `folder-chief` directory.
3. Update `chief/capabilities.md` to reflect `not probed` or `revoked`.
