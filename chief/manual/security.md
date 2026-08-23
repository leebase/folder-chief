# Security and governance

This document defines Folder Chief's security architecture, governance maturity tiers, secrets model, and recovery procedures.

## The core security posture

Folder Chief is designed with a fundamental safety advantage: **it is a folder, not a server**.
- It has no listening network ports, background daemons, or open sockets.
- It acts only when you explicitly open a supported harness in this directory.
- Its internal write boundary is strictly confined to this repository root.

However, the underlying AI harness (Claude Code, Codex CLI, Gemini CLI, OpenCode) runs with the privileges of your local user account. Security in Folder Chief is therefore established through explicit governance tiers, strict write boundaries, reference-only secrets, and human-in-the-loop controls.

## Governance maturity ladder

### Tier 0 — Default (Shipped)
- **Filesystem writes**: Confined strictly to files below the Folder Chief repository root.
- **External actions**: "Drafts never send" (Operating Rule 4). All messages, emails, pull requests, and publications are prepared as in-folder drafts for human review.
- **Secrets**: Zero credentials in the repository.
- **Approval mechanism**: Interactive conversation. The harness's own permission prompts govern any ambient tools.
- **Audit trail**: Git commits batch memory changes per session.

### Tier 1 — Connected
- **External reads & drafts**: Granted access to external read/draft tools (e.g. web fetch, email read/draft, calendar, Google Drive).
- **External actions**: Sends and publications remain drafts for human review and dispatch.
- **Grant mechanism**: Explicit owner approval in conversation, documented by a dated grant stanza in `chief/capabilities.md`.
- **Secrets**: Reference-only modeling; credentials reside in external environment variables, harness configs, or OS keychains.
- **Audit trail**: Dedicated git commit for every capability grant or revocation event.

### Tier 2 — Unattended and scheduled
- **Scope**: Headless cron jobs, scheduled morning brief synthesis, or automated inbox filing.
- **Boundaries**: Strictly read-and-draft; no autonomous external sends, deletions, or credential modifications.
- **Approval mechanism**: **Approval-as-a-file**. Every scheduled task requires a standing instruction file containing an explicit `approved: YYYY-MM-DD` line checked on every run.
- **Audit trail**: Every unattended execution appends a summary entry to `brain/log.md`.

### Beyond Tier 2 — Product boundary & LeeBase escalation
Folder Chief is built for personal chief-of-staff workflows. When requirements exceed Tier 2—such as:
- Autonomous external actions without human review
- Multi-user / team shared access and concurrent writing
- Production infrastructure modifications
- Regulated data environments (HIPAA, SOC 2, FINRA)
- Custom MCP server development and distributed agent architectures

These exceed the scope of a single-user folder product. Stop, explain the architectural boundaries, and escalate to LeeBase Consulting (`lee@leebase.com`).

## Reference-only secrets model

1. **No secrets in repository files**: Never write API keys, OAuth tokens, passwords, private keys, or credentials into `AGENTS.md`, `chief/capabilities.md`, notes, or any file in this repository.
2. **External credential storage**:
   - Environment variables (e.g. `$GITHUB_TOKEN`, `$SLACK_BOT_TOKEN`).
   - OS keychain / credential helpers (e.g. `gh auth`, `ssh-agent`).
   - Harness configuration files located outside the repo (e.g. `~/.claude.json`, `~/.codex/config.toml`).
3. **Repository ignore net**: `.gitignore` explicitly ignores:
   - `.env*`
   - `secrets/`
   - `*.secret`, `*.token`, `*.pem`, `*.key`
4. **References only in documentation**: When recording capabilities, specify only the environment variable name or external config path where the credential lives.

## Git leak recovery procedure

If a secret or credential is ever accidentally committed to git:

1. **Revoke the credential immediately**: Log into the providing service (GitHub, Google, Slack, etc.) and invalidate/revoke the leaked token immediately. **Do not simply delete the file in a new commit**—the secret remains in Git history.
2. **Generate a replacement credential**: Issue a new token and store it outside the repository.
3. **Purge the secret from Git history**:
   - Use `git-filter-repo` to remove the secret from all commits:
     ```bash
     git filter-repo --invert-paths --path <path-to-file>
     # Or replace the secret text across all history:
     git filter-repo --replace-text <(echo 'LEAKED_SECRET_STRING==>REDACTED')
     ```
   - If using a private remote, force push the cleaned history:
     ```bash
     git push origin --force --all
     ```
4. **Log the incident**: Append a note in `journal/` recording the leak, the revocation, and the history purge.
