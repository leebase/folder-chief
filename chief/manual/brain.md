# Brain operations

`brain/` is the owner's Obsidian-compatible vault. It is user knowledge, not product
self-knowledge: `chief/manual/` explains the product and may be replaced on upgrade, while
`brain/` is unique to this installation and must not be overwritten. `journal/` is outside the
vault and records session operations; `brain/log.md` records durable-knowledge changes.

This page describes hand-run Markdown procedures. It does not add a parser, indexer, search
service, integration, or background process. A PDF-derived Markdown file, meeting notes or a
transcript, a URL clip, an exported message, and plain text are all just source material once
placed in `brain/inbox/`.

## Zones and authority

| Zone | Use | Chief rule |
|---|---|---|
| `index.md` | Map of the vault and its schema | Read first for knowledge work; update when the map changes. |
| `inbox/` | Unfiled material awaiting review | Read and file deliberately; do not treat it as compiled knowledge. |
| `sources/` | Raw evidence and provenance | Copy or move material here during ingest, then never edit its content. |
| `notes/` | Source-linked, compiled knowledge | Rewrite, correct, or supersede when evidence or the owner's instruction changes. |
| `state/` | Current operational facts | Keep tasks in `state/tasks/`, commitments in `state/commitments/`, and waiting items in `state/waiting-on/`; do not use it as history. |
| `me.md` | Owner profile | Owner-owned and editable; do not infer missing fields. |
| `log.md` | Durable knowledge history | Append ingest, note, correction, supersession, and forget entries. |
| `dashboards/` | Obsidian Bases views | Configuration only; `dashboards/tasks.base` reads task frontmatter. |

The vault root is `brain/`, so paths in links, `sources:`, and Bases filters are vault-relative
(for example, `sources/meeting-notes.md` and `state/tasks/`). Keep filenames descriptive and
stable. Use normal Obsidian links such as `[[sources/meeting-notes]]` and
`[[notes/project-overview]]`; do not make line-number or hash claims.

## Ingest: inbox to integrated knowledge

1. Read this map and inspect every item in `brain/inbox/`. Identify what the item actually is;
   a filename, a model recollection, or an unverified URL is not evidence by itself.
2. Preserve the source faithfully. Move or copy the item into `brain/sources/` under a stable,
   descriptive name. Keep the original wording and provenance (source URL, capture date, or
   extraction context) in the source. If conversion was done outside Folder Chief, label the
   result as a derived extract instead of implying that the original file was read.
3. Update the source list in `brain/index.md` when the source establishes a useful area of
   knowledge. Do not edit a filed source to repair a typo, settle a disagreement, or make a note
   fit. Raw sources are immutable evidence.
4. Create or update the smallest relevant note in `brain/notes/`. Use the controlled frontmatter
   in `brain/index.md`, include a `sources:` list, and put an inline attribution such as
   `(per [[sources/meeting-notes]])` on each load-bearing claim. One source may inform several
   notes; integration means updating all affected notes, not merely filing the source.
5. Compare the new claims with existing notes and sources. If claims disagree, keep both dated
   claims and their source paths under a visible `## Contradictions` section. State what conflicts
   and what remains unknown; do not pick a winner by fiat.
6. Refresh `brain/index.md` if a note, state area, or link was added. Append a dated
`## [YYYY-MM-DD] op | subject` entry to `brain/log.md` naming the source filed, notes touched,
and provenance. If the session itself involved a decision or task, record that operational event
separately in `journal/`.
7. Leave unrelated inbox material alone. Do not silently delete the inbox copy or a source just
   because a note was compiled; deletion needs an explicit scope and follows [Memory](memory.md).

After ingest, the durable chain should be inspectable: inbox item (if retained) → immutable
`[[sources/...]]` evidence → compiled `[[notes/...]]` note → index entry and log entry.

## Query: index first

1. Read `brain/index.md`, then identify the relevant zone and note links. Read
   `brain/state/today.md` for current facts when the question is operational.
2. Open the relevant compiled notes, then open their cited sources when a claim is load-bearing,
   disputed, stale, or not clear. Use ordinary text search only after following the index; a
   search result is a pointer to inspect, not permission to treat an orphan file as truth.
3. Answer with the source path and the note's `updated:` date when it matters. Distinguish
   current state from durable history, and say when sources conflict or the index does not settle
   the question. Never use a product manual or conversation memory as owner evidence.
4. If the investigation creates durable knowledge, compile it into a source-linked note, update
   the index if needed, and append to `brain/log.md` before the session ends. A transient answer
   belongs only in the conversation; a reusable conclusion belongs in `brain/`.

If index-first navigation repeatedly fails to find knowledge known to be filed, report the
failure and the missing map/link. Do not invent a database, vector search, RAG pipeline, or code
as a fallback; any capability beyond this Markdown product needs a separately documented,
owner-approved change.

## Lint: report drift, do not rewrite

On request, inspect the vault and produce a dated report with paths and proposed fixes. At minimum
check:

- required frontmatter, controlled `type`/`status` values, ISO dates, list-valued `sources` and
  `tags`, and one meaning per property name;
- source paths and Obsidian links that do not resolve, orphan notes, duplicate concepts, and
  notes or state files missing from the index;
- claims with missing provenance, stale `updated:` dates, and contradictions that are not marked
  with both dates and source paths;
- task files outside `state/tasks/`, task statuses that do not match the schema, and whether the
  Bases dashboard's folder/property filters still match the contract; and
- accidental changes to `brain/sources/` (use git history or a reviewed diff as evidence).

Lint is advisory. It reports what is wrong and proposes a narrow correction; it does not silently
change notes, source files, the index, or owner words. Apply a proposed correction as a separate
explicit operation, then update `brain/log.md` and the index as appropriate.

## Links to the other procedures

- The exact frontmatter schema and vocabulary live in [`brain/index.md`](../../brain/index.md).
- Correction, supersession, and forget/delete semantics live in [Memory](memory.md).
- The task view is [`brain/dashboards/tasks.base`](../../brain/dashboards/tasks.base), using
  Obsidian's built-in Bases YAML format. It is a view over state, not a task manager or scheduler.
