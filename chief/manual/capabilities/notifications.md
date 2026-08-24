# Notifications (Optional Advanced Extension)

> **Core Boundary Notice:** Folder Chief core is 100% interactive, local, and inert-by-default. Outbound notifications are optional advanced extensions that operate outside the core behavioral promise.

## What it enables

The notifications capability enables Folder Chief to prepare status summaries, daily digest alerts, or reminder notifications intended for your personal Slack workspace or Telegram chat.

## Status & Validation

- **Status:** Illustrative architecture example (webhook or community Slack/Telegram MCP server required; validation pending).


## What it requires

- A Slack or Telegram MCP server, incoming webhook URL, or bot integration.
- Bot token or webhook URL stored securely in environment variables outside the repository (e.g. `$SLACK_WEBHOOK_URL`, `$TELEGRAM_BOT_TOKEN`).
- A Tier 1 (interactive draft) or Tier 2 (scheduled summary) capability grant in `chief/capabilities.md`.

## Security implications

- **Target channel isolation**: Notifications must be directed exclusively to private channels, designated alert rooms, or direct messages to the owner. Never configure notifications for public or team-wide channels without strict filtering.
- **Drafts and approval**: In interactive Tier 1 mode, messages are prepared as in-folder drafts for human review. In Tier 2 unattended mode, notifications are restricted to pre-authorized summary formats under approval-as-a-file.
- **Information disclosure**: Ensure sensitive credentials or confidential personal notes from `brain/` are never included in outbound chat notifications.
- **Credential isolation**: Webhook URLs and bot tokens are secrets and must never be committed to repository files.

## How to set it up (Illustrative Reference)

### Claude Code
Configure the notification MCP server in `~/.claude.json` or `.claude/settings.json`:
```json
{
  "mcpServers": {
    "slack": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-slack"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-reference-only"
      }
    }
  }
}
```

### Codex CLI
Configure in `~/.codex/config.toml` referencing environment variables.

### Gemini CLI
Configure under `mcpServers` in `.gemini/settings.json`.

### OpenCode
Add the notification tool definition in OpenCode configuration.

## How to verify it works

1. Ensure the owner has approved the notification grant.
2. In interactive mode, ask Folder Chief to prepare a test ping draft: `"Folder Chief notification test: verified."`
3. If outbound send is explicitly authorized, dispatch the message to your designated private test channel or DM.
4. Check your Slack or Telegram client to confirm message delivery.
5. Record the grant stanza in `chief/capabilities.md` with status `active` and target channel scope.

## How to revoke it

1. Remove the webhook URL or MCP server from your harness configuration.
2. Delete the incoming webhook or regenerate the Slack/Telegram bot token.
3. Update `chief/capabilities.md` status to `revoked` and append a dated revocation stanza.
