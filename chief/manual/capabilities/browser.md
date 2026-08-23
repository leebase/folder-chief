# Browser automation

## What it enables

The browser capability enables Folder Chief to navigate dynamic, JavaScript-heavy web applications, interact with complex documentation sites, capture screenshots, and extract rendered web content that static web fetching cannot parse.

## Status & Validation

- **Status:** Verified reference configuration (`@modelcontextprotocol/server-puppeteer`).
- **Last tested:** 2026-08-23.

## What it requires

- A Browser Model Context Protocol (MCP) server (e.g. `@modelcontextprotocol/server-puppeteer`) or a native harness browser extension.
- Local browser binaries (e.g., Chromium).
- A Tier 1 capability grant recorded in `chief/capabilities.md`.

## Security implications

- **Untrusted code execution**: Web browsers execute client-side JavaScript from visited websites. Malicious or compromised web pages may attempt sandbox escapes or display prompt-injection attacks.
- **Session & credential safety**: Do not share authenticated personal browser profiles with the automation harness unless strictly necessary and reviewed. Use clean, dedicated browser profiles for automated sessions.
- **No autonomous transactions**: Browser automation must not be used to submit payment forms, sign contracts, or perform irreversible external account modifications without explicit human step-through.
- **Resource usage**: Headless browsers consume significant CPU and memory. Terminate browser sessions promptly when tasks finish.

## How to set it up

### Claude Code
Add the browser MCP server to `~/.claude.json` or `.claude/settings.json`:
```json
{
  "mcpServers": {
    "puppeteer": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-puppeteer"]
    }
  }
}
```

### Codex CLI
Configure the browser MCP server in `~/.codex/config.toml`:
```toml
[mcp_servers.puppeteer]
command = "npx"
args = ["-y", "@modelcontextprotocol/server-puppeteer"]
```

### Gemini CLI
Configure under `mcpServers` in `.gemini/settings.json`.

### OpenCode
Add the browser MCP server definition in OpenCode configuration.

## How to verify it works

1. Ensure the owner has approved the browser capability.
2. Ask Folder Chief to navigate to a well-known public documentation page (e.g., `https://example.com`) and return the page title and heading text.
3. Verify that the browser launches, extracts the content accurately, and closes cleanly.
4. Record the grant stanza and update `chief/capabilities.md` with status `active` and scope `read-only web navigation`.

## How to revoke it

1. Remove the browser MCP server entry from your harness configuration.
2. Update `chief/capabilities.md` setting status to `revoked` and append a dated revocation stanza.
