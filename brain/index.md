# Brain index

`brain/` is the owner's plain-Markdown knowledge vault. Read this map before navigating
knowledge, then open only the relevant files.

## Zones

- `me.md` — the human-owned profile, preferences, and working context.
- `inbox/` — material waiting for the owner and Chief to review and file.
- `sources/` — raw documents, transcripts, clippings, or references. The Chief never edits
  these files; preserve their wording and provenance.
- `notes/` — compiled, source-linked knowledge that can be corrected or superseded.
- `state/` — current operational facts, beginning with `state/today.md`.
- `log.md` — append-only record of durable-knowledge changes.

`journal/` is deliberately outside this vault. It records session operations; `brain/log.md`
records what changed in durable knowledge. Do not use one as a substitute for the other.

## Working contract

Before substantive work, read `me.md`, today's journal entry when present, and
`state/today.md`. State owner facts with a source path. If sources conflict, retain both dated
claims and identify the conflict rather than silently selecting a winner. When correcting a
compiled note, preserve source paths, record the correction in `log.md`, and let git preserve
prior states.

This Sprint 1 tree is a starting scaffold. It has no ingestion, query, lint, dashboard, or
other automation. File durable learning by hand in the same session that discovered it.
