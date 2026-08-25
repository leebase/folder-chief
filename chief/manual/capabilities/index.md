# Capabilities overview

This directory contains product guides for acquirable capabilities in Folder Chief. Each guide explains how a specific capability works, what tools or external services it requires, security considerations, harness-specific configuration, verification checks, and revocation procedures.

## Possible versus actual

A critical principle of Folder Chief:

- **The manual (`chief/manual/capabilities/`)** describes what is *possible* when a capable harness and relevant tools are configured.
- **The registry (`chief/capabilities.md`)** records what is *true* in this specific installation.

Never assume a capability is present merely because a guide exists in this directory. If asked whether a capability is available (such as reading email or querying a calendar), the Chief must always check `chief/capabilities.md` first and report the truth. If unconfigured, the Chief answers with the standard distinction:
> "I know how this integration works, but I do not currently have access to it."

## Maturity tiers

Capabilities and execution modes progress along a clear governance ladder:

### Tier 0 — Default (Shipped)
- **Scope**: In-folder filesystem operations, Markdown editing, and local conversation memory.
- **Boundaries**: Writes are strictly confined to this repository root. Drafts never send externally.
- **Secrets**: No secrets or credentials exist in the folder.
- **Approval**: Interactive session with the human owner; harness prompt approvals govern any ambient tools.

### Tier 1 — Connected
- **Scope**: Granted external reads (such as web fetch, email reading, calendar inspection, or Google Drive querying) plus in-folder draft preparation.
- **Boundaries**: Folder Chief does not create remote drafts, send, publish, schedule, merge, or otherwise mutate an external service. The human owner performs those actions in an external tool.
- **Grant mechanism**: Explicit owner approval in conversation, documented with a dated grant stanza in `chief/capabilities.md`.
- **Secrets**: Reference-only credentials stored outside the folder (environment variables, OS keychain, or harness config).

### Tier 2 — Unattended & Scheduled
- **Scope**: Headless or cron-triggered execution recipes (e.g., daily briefing preparation, inbox sorting).
- **Boundaries**: Read-and-draft only; no autonomous external sends.
- **Approval mechanism**: Approval-as-a-file pattern—a standing instruction file containing an explicit `approved: YYYY-MM-DD` line checked on every run.
- **Enforcement**: A separately implemented, manually verified wrapper checks approval and bounds before launching the harness; this repository does not ship one.
- **Audit**: Every unattended run appends an execution summary to `brain/log.md`.

### Beyond Tier 2 — Product Boundary
Workflows requiring Folder Chief to mutate an external service, multi-user deployments, production system modifications, and regulated data environments exceed the Folder Chief personal architecture and trigger the documented boundary response.

## Secrets rules

1. **Never store credentials in the repository**: API keys, tokens, passwords, and private certificates must never be written into any file in this repository.
2. **Reference-only modeling**: Refer to secrets only by variable name (e.g., `$SLACK_BOT_TOKEN`) or external path (e.g., `~/.config/claude/claude_desktop_config.json`).
3. **Safety net**: The repository `.gitignore` ignores `.env*`, `secrets/`, `*.token`, `*.secret`, `*.key`, and `*.pem` to prevent accidental staging.
4. **Leak recovery**: If a credential is ever accidentally committed, immediately follow the leak recovery procedure in [Security](../security.md).

## Capability guides

1. **[Web fetch & search](web.md)** — Searching the public web and fetching documentation or articles into Markdown.
2. **[Shell execution](shell.md)** — Local command execution boundaries, shell safety, and sandbox considerations.
3. **[Git & GitHub](git-github.md)** — Local version control, upstream reads, remote topology, and the separate owner-memory backup boundary.
4. **[Email reading & drafting](email.md)** — Connecting mail tools for search/reading and preparing in-folder reply drafts.
5. **[Calendar](calendar.md)** — Querying schedule and upcoming events via calendar tools or CLI.
6. **[Google Drive](google-drive.md)** — Reading shared documents, sheets, and workspace files via Drive tools.
7. **[Notifications](notifications.md)** — Preparing in-folder alert drafts for owner dispatch.
8. **[Scheduled runs](scheduled-runs.md)** — Headless cron recipes and the Tier 2 approval-as-a-file pattern.
9. **[Browser automation](browser.md)** — Navigating dynamic web pages and extracting content via browser tools.
