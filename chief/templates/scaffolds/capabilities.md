# Capability registry

This file is the installation-specific authority on what Folder Chief can actually do in this folder, not a catalog of what the manual describes.

The manual describes what is *possible* across supported harnesses. This file records what is *true* here. Never present a possible capability as an active or configured one unless this file records an observed probe or an explicit, owner-approved grant with date, scope, harness, and verification evidence.

## Registry table

| Capability | Status | Scope | Since | Verified | Harness/evidence |
|---|---|---|---|---|---|
| filesystem writes | not probed | contract: this folder only | — | — | — |
| shell | not probed | unknown | — | — | — |
| web fetch/search | not probed | unknown | — | — | — |
| Git / private backup | not probed | unknown | — | — | — |
| browser automation | not probed | unknown | — | — | — |
| email read/draft | not configured | no grant | — | — | — |
| calendar | not configured | no grant | — | — | — |
| Google Drive | not configured | no grant | — | — | — |
| notifications | not configured | no grant | — | — | — |
| scheduled runs | not configured | no grant (Tier 2 only) | — | — | — |

## Status definitions

- **not probed**: An ambient or harness-provided tool that may exist in this CLI environment but has not been verified with a harmless read-only check.
- **active**: Empirically verified via a harmless check or configured via an approved grant; working as expected within the recorded scope.
- **not configured**: Requires an external integration, MCP server, credentials, or explicit Tier grant that has not been set up.
- **degraded / failed**: Was previously active or configured, but an observed check or attempted operation failed. Requires investigation or re-authorization.
- **revoked**: Previously granted access has been explicitly severed and verified as disconnected.

## Hand-run probe procedure

When the owner asks to verify capabilities or on initial setup when requested, run harmless read-only checks to determine what the current harness environment supports. Never run destructive, external-sending, or out-of-folder modifying commands during a probe.

### 1. Filesystem writes probe
- **Check**: Test writing and removing a harmless temporary check file inside the folder boundary (e.g. `scratch/probe-check.tmp` or a test file in an ignored directory).
- **Verify**: File is created and removed cleanly; writes stay strictly within repository root.
- **Record**: Set status to `active`, scope to `this folder only`, record date and harness name.

### 2. Shell probe
- **Check**: Run a harmless echo command (e.g. `echo "probe: shell ok"` or `uname -s`).
- **Verify**: Output returns successfully without error.
- **Record**: Set status to `active`, scope to user account / local CLI, record date and harness name.

### 3. Web fetch / search probe
- **Check**: Perform a lightweight, read-only search query or fetch a known static public page (e.g. documentation check or public headers).
- **Verify**: Response text is received cleanly without error.
- **Record**: Set status to `active`, scope to `read-only fetch/search`, record date and harness name.

### 4. Git / private backup probe
- **Check**: Run `git status` and `git remote -v`.
- **Verify**: Git repository state and configured remotes (if any) are reported without making changes or pushes.
- **Record**: Set status to `active`, scope to local git / configured remotes, record date and harness name.

### 5. Browser automation probe
- **Check**: Inspect if browser automation tools (e.g. playwright/puppeteer MCP, browser tool) are available in the harness environment.
- **Verify**: Harness reports whether browser tools are loaded and can open a blank or local page without performing actions.
- **Record**: Set status to `active` (or leave `not probed`/`not configured` if no browser tool is present), record date and scope.

### 6. MCP & external integration checks (Email, Calendar, Google Drive, Notifications)
- **Check**: Check if the harness has relevant MCP tools registered in its active session.
- **Verify**: Tools are listed and respond to benign list/search calls.
- **Record**: If not configured or no credentials present, keep as `not configured`. When configured by owner, follow the grant procedure below.

## Grant and revocation rules

1. **Explicit owner approval**: No external capability (Tier 1 or Tier 2) may be activated without the owner's explicit instruction in conversation.
2. **Reference-only secrets**: Credentials, tokens, API keys, and passwords must **never** be written into this file, `AGENTS.md`, or any repository file. Reference them only by environment variable name (e.g. `$GMAIL_MCP_TOKEN`) or harness configuration path (e.g. `~/.config/claude/claude_desktop_config.json`).
3. **Drafts stay in-folder**: Even when email or notification reads are granted, the Chief composes drafts only inside this folder. Creating a remote draft or dispatching externally is reserved for the human owner in their own tool.
4. **Immediate status change on failure**: If an active capability fails during use, immediately update its status in the registry table to `degraded / failed` instead of retrying blindly.
5. **Logged grant stanzas**: When a capability is granted or revoked, append a dated stanza below.

## Grant stanza template

```markdown
### [YYYY-MM-DD] GRANT: <Capability Name>
- **Scope**: <Specific allowed scope, e.g. read-only inbox search, draft creation>
- **Harness**: <Claude Code | Codex CLI | Gemini CLI | OpenCode>
- **Credential location**: <Reference only: e.g. $VARIABLE_NAME or harness config path>
- **Verification performed**: <Description of harmless check performed to verify access>
- **Revocation procedure**: <One-line instruction on how to sever this access>
- **Approved by owner**: Yes (in-conversation confirmation)
```

## Revocation stanza template

```markdown
### [YYYY-MM-DD] REVOKE: <Capability Name>
- **Former scope**: <Scope that was granted>
- **Harness**: <Harness from which access was removed>
- **Revocation action**: <Action taken, e.g. removed MCP server from harness config, unset environment variable>
- **Verification**: <Harmless check confirming tools/credentials are no longer accessible>
- **Registry updated**: Status updated to `revoked` / `not configured`
```

## Active grant and revocation log

*(No external grants or revocations recorded in this fresh installation.)*
