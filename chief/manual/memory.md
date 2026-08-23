# Memory

Folder Chief's memory is inspectable Markdown, not a hidden database. The owner can read the
whole memory surface with ordinary file tools, edit owner-owned files, and use git to see what
changed. The contract is behavioral: the Chief must read the right files, cite what it knows,
and file durable learning before the session ends.

## Session start and daily records

Before substantive work, read these in order:

1. `brain/me.md` — the owner profile and working preferences.
2. `journal/YYYY-MM-DD.md` for today's date, if it exists — what happened operationally and
   which loops are open.
3. `brain/state/today.md` — current commitments and facts.

Then read `brain/index.md` and only the relevant notes or sources. Create today's journal file
when there is an event worth recording. Keep `journal/` for operational events: a brief given,
a task performed, a delegation or decision, and what remains open. Keep `brain/log.md` for
changes to durable knowledge: ingestion, note creation, correction, supersession, or deletion.

## What gets remembered

- The owner profile belongs in `brain/me.md`, which the owner can edit or delete.
- Raw documents, transcripts, and clippings belong in `brain/sources/` and are immutable to the
  Chief. A source can be referenced by several notes.
- Compiled knowledge belongs in `brain/notes/` and must name its source paths and dates for
  load-bearing claims.
- Current tasks, commitments, and waiting items belong in `brain/state/`.
- A durable lesson discovered in conversation is filed in `brain/` in the same session, and the
  touched path is named to the owner. Claude-native auto-memory, when Claude supplies it, is
  directed to `chief/learned/`; it does not make an unconfigured integration active.

## Onboarding marker is separate from profile

If `chief/installed.md` is absent, the Chief must introduce itself in three sentences, ask at
most the three onboarding questions, write the answers to `brain/me.md`, show that file, do a
real useful task in the same session, capture durable learning, and then write the marker with
an ISO date and harness name. No marker may be written merely because a greeting occurred.

Deleting `brain/me.md` means forget the owner profile; it does not trigger onboarding again.
Deleting `chief/installed.md` is the documented reset. A new onboarding run may repopulate
`me.md`, but it must not claim to remember answers that are no longer in the files.

## Correction, supersession, and contradiction

When the owner says “that's wrong,” show the derived note, correct it in place, and append a
dated entry to `brain/log.md` naming the correction and its source. Keep the prior wording in
git history and retain a dated superseded claim when it explains why the note changed. Never
edit `brain/sources/` to make the note fit. Never rewrite or silently delete the owner's own
words; preserve them and record the correction or supersession.

When two sources disagree, record both claims, dates, and source paths and say that they
conflict. Do not choose a winner by confidence or convenience. A newer source or an explicit
owner decision can supersede an older derived claim, but the reason and date remain visible.

For “forget X,” identify the exact requested scope before deleting derived material. Remove only
what the owner asked to remove and record the durable-knowledge change in `brain/log.md`; a
raw source is not edited to hide a contradiction. Ordinary git history preserves recoverable
states. Purging history is a separate, deliberate owner request covered by the backup page,
not something the Chief does silently.

## Honest recall

A fact without a source in `brain/` is not an owner fact. Say what was checked and what remains
unknown. Do not infer that a manual page, a remembered conversation, a harness permission, or
an ignored file is evidence of a configured capability. If the answer requires an external
system, prepare an in-folder draft or question and escalate rather than claiming an action.
