# Google Drive integration

## What it enables

The Google Drive capability allows Folder Chief to search for documents, read Docs, Sheets, and exported PDFs, and extract content into Markdown for ingestion into `brain/inbox/` and integration into `brain/notes/`.

## Status & Validation

- **Status:** Illustrative architecture example. (Community or custom Google Drive MCP server required; verify provider package before installation).
- **Last tested:** 2026-08-23.

## What it requires

- A Google Drive Model Context Protocol (MCP) server (e.g., custom or community Google Drive MCP).
- Google OAuth credentials or service account credentials stored securely outside this folder.
- A Tier 1 capability grant recorded in `chief/capabilities.md`.

## Security implications

- **Read-only boundary**: Folder Chief reads Google Drive documents to extract knowledge. It does not overwrite, alter, or delete remote Drive files.
- **Access scoping**: Restrict OAuth scopes to read-only (`https://www.googleapis.com/auth/drive.readonly`) or specific folder IDs whenever possible.
- **Untrusted document content**: Documents shared by third parties may contain unexpected instructions or prompt injection attempts. The Chief treats remote documents as raw source material.
- **Credential isolation**: Google client secrets and token caches must remain in `~/.config/` or secure credential managers, never in `folder-chief/`.

## How to set it up (Illustrative Reference)

### Claude Code
Add the Google Drive MCP server to `~/.claude.json` or `.claude/settings.json`:
```json
{
  "mcpServers": {
    "gdrive": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-gdrive"],
      "env": {
        "GDRIVE_CREDENTIALS_PATH": "~/.config/credentials/gdrive-oauth.json"
      }
    }
  }
}
```

### Codex CLI
Configure in `~/.codex/config.toml`:
```toml
[mcp_servers.gdrive]
command = "npx"
args = ["-y", "@modelcontextprotocol/server-gdrive"]
env = { GDRIVE_CREDENTIALS_PATH = "~/.config/credentials/gdrive-oauth.json" }
```

### Gemini CLI
Configure under `mcpServers` in `.gemini/settings.json`.

### OpenCode
Add the server entry to OpenCode's configuration.

## How to verify it works

1. Ensure the owner has approved the Google Drive grant.
2. Ask Folder Chief to search for a known file in your Google Drive by title or keyword.
3. Verify that the file title and metadata are returned, and ask for a short snippet/summary of the text.
4. Record the grant stanza and update `chief/capabilities.md` with status `active` and scope `read-only document search`.

## How to revoke it

1. Remove the Google Drive MCP server from your harness configuration.
2. Revoke the application's permissions in your Google Account security settings (`https://myaccount.google.com/permissions`).
3. Update `chief/capabilities.md` to `revoked` and append a dated revocation stanza.
