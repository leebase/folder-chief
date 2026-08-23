# Notifications (Slack and Telegram)

## What it enables

The notifications capability enables Folder Chief to prepare and send outbound status summaries, daily digest alerts, or reminder notifications to your personal Slack workspace or Telegram chat.

## What it requires

- A Slack or Telegram MCP server, incoming webhook URL, or bot integration.
- Bot token or webhook URL stored securely in environment variables outside the repository (e.g. `$SLACK_WEBHOOK_URL`, `$TELEGRAM_BOT_TOKEN`).
- A Tier 1 (interactive) or Tier 2 (scheduled) capability grant in `chief/capabilities.md`.

## Security implications

- **Target channel isolation**: Notifications must be sent exclusively to private channels, designated alert rooms, or direct messages to the owner. Never configure notifications for public or team-wide channels without strict filtering.
- **Drafts and approval**: In interactive Tier 1 mode, messages are drafted and confirmed before dispatch. In Tier 2 unattended mode, notifications are restricted to pre-authorized summary formats.
- **Information disclosure**: Ensure sensitive passwords or confidential personal notes from `brain/` are never included in outbound chat notifications.
- **Credential isolation**: Webhook URLs and bot tokens are secrets and must never be committed to repository files.

## How to set it up

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
2. Ask Folder Chief to send a test ping to your designated private channel or DM: `"Folder Chief notification test: verified."`
3. Check your Slack or Telegram client to confirm message delivery.
4. Record the grant stanza in `chief/capabilities.md` with status `active` and target channel scope.

## How to revoke it

1. Remove the webhook URL or MCP server from your harness configuration.
2. Delete the incoming webhook or regenerate the Slack/Telegram bot token.
3. Update `chief/capabilities.md` status to `revoked` and append a dated revocation stanza.
