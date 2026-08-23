# Calendar integration

## What it enables

The calendar capability enables Folder Chief to inspect your upcoming meetings, check availability across dates, summarize daily schedules for `brain/state/today.md`, and propose meeting time options or draft event agendas.

## Status & Validation

- **Status:** Illustrative architecture example. (Community or custom MCP server/CLI required; verify provider package before installation).
- **Last tested:** 2026-08-23.

## What it requires

- A Calendar Model Context Protocol (MCP) server (e.g., custom Google Calendar MCP, Outlook MCP, or calendar CLI).
- Authenticated OAuth credentials or tokens stored securely outside the repository.
- A Tier 1 capability grant recorded in `chief/capabilities.md`.

## Security implications

- **Read-focused operation**: Calendar access should be primarily read-only. Folder Chief can propose event details or draft calendar entries, but scheduling commitments or accepting invitations must be verified by the owner.
- **Privacy**: Calendar event titles, attendee emails, and meeting notes can contain confidential business or personal data. The Chief respects this context and keeps notes inside `brain/`.
- **Credential isolation**: OAuth client secrets and user tokens must remain in external config files or OS keychains, never checked into this folder.

## How to set it up (Illustrative Reference)

### Claude Code
Configure the calendar MCP server in `~/.claude.json` or `.claude/settings.json`:
```json
{
  "mcpServers": {
    "calendar": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-google-calendar"],
      "env": {
        "GCAL_CREDENTIALS_PATH": "~/.config/credentials/gcal-oauth.json"
      }
    }
  }
}
```

### Codex CLI
Configure in `~/.codex/config.toml`:
```toml
[mcp_servers.calendar]
command = "npx"
args = ["-y", "@modelcontextprotocol/server-google-calendar"]
env = { GCAL_CREDENTIALS_PATH = "~/.config/credentials/gcal-oauth.json" }
```

### Gemini CLI
Configure under `mcpServers` in `.gemini/settings.json` or global profile.

### OpenCode
Add the calendar MCP server definition to OpenCode's configuration.

## How to verify it works

1. Ensure the owner has approved the calendar grant.
2. Ask Folder Chief to list events scheduled for today and tomorrow.
3. Verify that event names, times, and attendees are reported accurately without errors.
4. Record the grant stanza and update `chief/capabilities.md` with status `active` and scope `read/query only`.

## How to revoke it

1. Remove the calendar server entry from your harness configuration.
2. Revoke OAuth permissions in your Google or Microsoft security dashboard.
3. Update `chief/capabilities.md` to `revoked` and append a dated revocation stanza.
