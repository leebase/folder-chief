# Notifications (Optional Advanced Extension)

> **Core Boundary Notice:** Folder Chief core is 100% interactive, local, and inert-by-default. Optional scheduled drafting operates outside the core behavioral promise; Folder Chief does not deliver outbound notifications.

## What it enables

This guide covers preparing status summaries, digest text, or reminders in-folder for the owner to dispatch through Slack, Telegram, or another notification tool.

## Status & Validation

- **Status:** In-folder drafting uses ordinary verified filesystem writes. Optional source reads require a separately configured integration; outbound delivery is outside Folder Chief.


## What it requires

- An in-folder target path for the prepared alert.
- Optionally, a read-only integration when source data must be inspected.
- A Tier 1 read grant or Tier 2 scheduled-draft grant in `chief/capabilities.md`, as applicable.

## Security implications

- **Drafts and approval**: Interactive and scheduled modes produce in-folder drafts only. The owner chooses the destination and performs delivery.
- **Information disclosure**: Review drafts for confidential owner information before copying them to any external channel.
- **Credential isolation**: Webhook URLs and bot tokens are unnecessary for in-folder drafting and must never be committed to repository files.

## How to set it up

Choose an ignored, in-folder draft path such as `brain/state/notifications/latest.md`. If a
scheduled run prepares it, follow [Scheduled runs](scheduled-runs.md) and record the Tier 2 grant.
Keep any optional read-only integration and its credentials outside the repository.

## How to verify it works

1. Ensure the owner has approved the notification grant.
2. Ask Folder Chief to prepare a test ping in the named in-folder draft file.
3. Verify the file content and confirm no external service changed.
4. If desired, the owner manually copies the text to a private test destination.
5. Record the grant stanza in `chief/capabilities.md` with scope limited to in-folder drafting and any separately verified reads.

## How to revoke it

1. Disable the scheduled draft, if configured, and remove its `approved:` line.
2. Remove any optional read-only integration from the harness and revoke its external credential yourself.
3. Update `chief/capabilities.md` status to `revoked` and append a dated revocation stanza.
