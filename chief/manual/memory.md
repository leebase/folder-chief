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

“That's wrong” and “correct X” are explicit correction verbs. First show the affected derived
note and its sources. Then correct only the derived note or state file, preserve its `sources:`
links, set `updated:` to the correction date, and retain the old wording as a dated superseded
claim when it explains the change. Append a dated
`## [YYYY-MM-DD] op | subject` entry to `brain/log.md` naming the path, the owner instruction or
source, and what changed. Update `brain/index.md` if the title, path, or map changed. Never edit
`brain/sources/` to make a note fit, and never rewrite or silently delete the owner's own words.
Git preserves the prior derived state.

When two sources disagree, record both claims, dates, and source paths under a visible
contradiction section in the relevant note. Say that they conflict and what remains unknown;
do not choose a winner by confidence, recency, or convenience. A newer source or an explicit
owner decision may supersede an older derived claim, but keep the reason and date visible. A
lint report may identify a contradiction, but it does not resolve or rewrite it.

## Forgetting and deletion

“Forget X” is a deletion verb, but the scope must be explicit before anything is removed. Show
the proposed paths and distinguish an owner profile, a derived note or state item, an inbox copy,
and an immutable raw source. If the request is unclear, ask whether it means the claim, the
derived file, or the profile; do not infer a broad deletion from a narrow request.

- For requested derived material, remove only the named note, claim, or state item; repair the
  index and links that point to it, then append a minimal dated deletion entry to `brain/log.md`.
- For a requested inbox copy, remove only the named unfiled file; if it was already filed, keep
  the immutable source and log the limited removal rather than deleting evidence.
- Do not delete or edit `brain/sources/` as a way to hide a contradiction or erase evidence. If
  the owner wants a raw source removed, explain this immutable-source boundary and ask the owner
- Deleting `brain/me.md` forgets the profile but does not reset onboarding. Deleting
  `chief/installed.md` is the separate explicit onboarding reset.
- Do not purge git history as part of an ordinary forget request. History purging is a distinct,
  deliberate owner decision; use the optional procedure below rather than doing it from the Chief.

### Optional Git history purge

This is destructive and separate from forgetting a derived file. The Chief may prepare the
exact path and commands but never runs the rewrite or force-push. The owner should first make
an external backup, confirm the path scope, and inspect `git log --all -- <path>` in a disposable
clone. If the owner explicitly chooses to continue, use a vetted history-rewrite tool such as
`git filter-repo --path <path> --invert-paths`, then verify `git log --all -- <path>` is empty,
inspect the resulting diff, and decide separately whether a remote update is warranted.
Remote refs, forks, caches, and other clones may still retain old content; history purge is not
a guarantee of universal erasure.

Keep `journal/` for the operational event and `brain/log.md` for the durable deletion or
correction. A deletion log records the affected path and scope, not the forgotten content.

## Honest recall

A fact without a source in `brain/` is not an owner fact. Say what was checked and what remains
unknown. Do not infer that a manual page, a remembered conversation, a harness permission, or
an ignored file is evidence of a configured capability. If the answer requires an external
system, prepare an in-folder draft or question and escalate rather than claiming an action.
