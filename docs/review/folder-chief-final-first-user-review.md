# Folder Chief — Final First-User Readiness Review

**Candidate reviewed:** `11743ad057ff0ea056da42fce3b5cb443ec69163` (v1.0.0 RC)

**Review date:** 2026-08-23

**Scope:** the operator documentation Lee will run the beta from, the documentation the first
external user will receive, and the first-user deployment playbook as a release gate. Read-only
review; nothing was remediated. Companion document:
`folder-chief-final-launch-review.md` (final launch verdict: PRIVATE BETA ONLY).

---

# First-User Verdict

## NOT READY

The distance is process, not rewriting. The deployment playbook is a strong document — its
intervention discipline, evidence templates, stop conditions, and decision rubric are precise and
behavioral, and it asks exactly the right question ("can a first external user succeed with the
same artifact we intend to release publicly?"). But it fails on its own terms today:

1. **Its entry gate is unmet.** The playbook requires the isolated road test to have met its
   published threshold. The road-test scorecard is blank, `/home/lee/road-tests/` is empty, and
   no candidate SHA or evidence record exists anywhere. No candidate has ever met the threshold.
2. **The user's Step 2 fails as written.** The repo is private; the README's HTTPS clone 404s.
   No documented step grants the user access, and nothing mentions that HTTPS-cloning a private
   repo requires GitHub authentication. The beta would open with exactly the kind of undocumented
   Lee intervention the playbook exists to detect.
3. **A disclosure the playbook requires does not exist.** The pre-deployment checklist and a stop
   condition both presuppose a visible provider-processing disclosure; no user-facing document
   contains one, while the README's "no proprietary cloud… no hidden storage" actively invites
   the local-only-processing misreading the stop condition tests for.
4. **The docs would send the first user toward a backup that preserves nothing** (see launch
   review P0-2) — a stop-condition-grade risk if the user relies on it during the beta.

Fix 2–4 (hours of writing), then execute the road test to threshold on a tagged candidate (the
procedure is already written), and this playbook is ready to run without further review cycles.

---

## Lee Operator Review

Can Lee run a release and this beta purely from paper, months from now? Mostly yes — 8 of 11
operator questions are fully answered by written procedure:

| Operator question | Status |
|---|---|
| Road test outside the source repo | **Answered** — isolation diagram, `mktemp` roots, `pwd -P` guards (road-test.md) |
| Simulate upgrades | **Answered** — Test 9's local bare-remote fixture lab is the best-written test in the suite |
| Test migration | **Answered** — Test 10 (folder copy + private-clone, capability de-verification) |
| Test recovery | **Answered** — Test 11 (malformed YAML + planted contradiction) |
| Support a first user without becoming runtime | **Answered** — playbook principles and observation rules |
| Evidence to capture | **Answered** — per-test template + deployment evidence record |
| Conditions that block release | **Answered** — road-test threshold + 15 stop conditions + decision rubrics |
| Defect vs feature request | **Answered** — with examples and "do not downgrade a claim failure" |
| Prepare a release | **Partial** — Test 0 covers clean-tree/SHA/push, but no procedure for bumping `chief/VERSION`, tagging ("release tag (when adopted)" defers to memory; no tag exists), or where gate evidence durably lives |
| Know which commit is under test | **Partial** — SHA recorded only in a disposable evidence directory; nothing freezes `main` between road test and the user's clone |
| Verify all supported harnesses | **Partial** — the road test exercises two harnesses; the four-harness FC-009 matrix has no recorded results and no pinned versions |

**Undocumented knowledge Lee currently carries** (each is a step that fails for any other
operator): that the repo is private and users need access grants (and how); which harness is "the
first supported harness" in Test 2; where road-test evidence should be archived durably; that
"Henderson" is a prior demo fixture to avoid; what tool performs the checklist's "secret scan";
that `main` must not move during the beta window; what the provider-processing disclosure is
supposed to say (it doesn't exist); and whether tags are "adopted."

---

## First-User Documentation Review

**The good:** the playbook's "User's Steps" section is genuinely written for a normal user —
plain language, honest about beta friction ("Difficulty here is useful beta feedback, not
something you are expected to hide"), correct trust posture (no secrets in the folder, "accept
only permissions you understand," the Chief drafts and you send). The README's prerequisites
block, verbatim onboarding contract, and "What are your 8 operating rules?" probe give the user a
real self-check. A first user does not need architecture knowledge for the happy path.

**The gaps:**

- **Internal vocabulary leaks into shipped user-facing files:** "Under Lee's ratified decision
  D101…" (`upgrade.md`), "(D101)" (`backup-move-recover.md`), "Boundaries and memory authority
  (D103)" and "Lee's memory precedence hierarchy" (`AGENTS.md` — the shipped contract cites the
  builder by name), "(D103)" (`memory.md`), "harness shims" (README's troubleshooting — the one
  section a confused normal user is guaranteed to reach), "sprint: remediation-complete"
  (`chief/VERSION`).
- **The clone ships the observer's script.** `docs/review/` and `docs/launch/` are tracked, so
  the user's fresh install contains the adversarial review (with all six gates reading
  "Current: FAIL"), this playbook including all debrief questions and Lee's should-not list, and
  the Show HN draft. This undermines trust and lets the user rehearse the debrief. Decide
  deliberately: exclude these from the distributed artifact, or ship them with updated statuses.
- **`private-beta-guide.md` is architect-voiced and contradicts the playbook** ("hands-on pairing
  with Lee" vs the playbook's no-rescue discipline; "memory compilation reliability,"
  "multi-harness portability," "runaway agent sprawl"). It should be marked superseded for the
  first user or reconciled.
- **Trust-and-safety coverage is strong except the provider-processing gap** (P0 above) and the
  undocumented uninstall path (required by the checklist, documented nowhere in the manual).

---

## Exact First-User Journey

| Step | Expected behavior | Likely confusion | Doc support | Grade |
|---|---|---|---|---|
| Receive GitHub link | Open repo page, read README | **404 — repo is private**; no access-grant step exists in the playbook | None | **FAIL** |
| Understand product | "AI chief of staff in a folder; my files; nothing runs by itself" | Assumes local-only *processing* (README implies it); may not realize a web subscription ≠ CLI access | README discovery is otherwise good | **CAVEAT** |
| Clone/download | `git clone https://…` succeeds | Private-repo HTTPS demands credentials (undocumented); ZIP users aren't told they lose clean upgrades | Quickstart is clean once repo is accessible | **FAIL** today; CAVEAT once access is operationalized |
| Open terminal in folder | `cd folder-chief`, `pwd` check | Minimal — README's `pwd` check is exactly right | Good | **PASS** |
| Launch AI CLI | `claude` / `codex` / `gemini` / `opencode` | Workspace-trust and permission prompts appear before "hello" and are mentioned nowhere in README; no minimum versions | Partial (harnesses.md has it; README doesn't point there) | **CAVEAT** |
| Say hello | The exact three-sentence introduction | A weak model or conflicting global instructions gives a generic reply; the recovery probe detects this but the fix path is thin ("verify pwd and shims") | README recovery section exists | **CAVEAT** |
| Onboarding | 3 questions → `brain/me.md` shown → real task same session | Well-specified; interruption recovery documented. Unproven on this RC in any harness | AGENTS.md/README match verbatim | **CAVEAT** (spec strong, evidence absent) |
| First real task | Useful artifact + "here's what I wrote and where" | The design forces a real task (good anti-demo mechanism); usefulness depends on model | Good | **PASS** (design) |
| Inspect memory | Open `brain/` files or Obsidian; find the authoritative fact | `docs/review/` internals sit alongside; `index.md`/`state` vs `notes` distinction takes a minute | brain.md/memory.md are clear; README points to them | **PASS** with noise caveat |
| Correct something | "That's wrong, it's Tuesday" → supersession, everything current says Tuesday | `claim_status` can't mark inferred-vs-confirmed; old value must not resurface — never tested on RC | memory.md correction verbs are excellent | **CAVEAT** |
| Close session | Nothing to do; durable capture already happened (rule 7) | Abrupt close before capture loses the session's learning silently | Documented in contract | **PASS** |
| Return later | Fresh session reads me.md/journal/today.md; no re-onboarding, no amnesia | Stale `today.md` must trigger rollover prompt, not masquerade as current | Startup protocol is explicit | **CAVEAT** (verified pre-RC, Claude only) |
| Continue naturally | Indirect recall, accurate and sourced | Recall quality is model-dependent; second-harness continuity wholly unevidenced | Good spec | **CAVEAT** |

---

## Lee Intervention Budget

The playbook already defines the right budget; this review endorses it as written:

- **Allowed without invalidating the test:** true environment prerequisites only — installing or
  authenticating a harness CLI, granting repo access (once documented), OS-level issues unrelated
  to the product. One recorded prerequisite clarification is within budget.
- **Never allowed:** explaining undocumented folder semantics, rewording the user's prompts,
  fixing files/git/settings/memory/frontmatter mid-flow, pre-populating memory, translating
  product language, reinterpreting the Chief's output, unadvertised flags/models/remotes, any
  silent modification of the user's installation.
- **Budget:** zero product-operation interventions; more than one basic-operation intervention
  fails the low-intervention criterion and triggers PAUSE.
- **Every intervention is evidence:** timestamped, classified (prerequisite / documentation gap /
  product defect), and entered in the evidence record. An intervention that "worked" is still a
  defect record.
- **Addition required by this review:** the repo-access grant must be moved into the documented
  delivery procedure so it stops being an undocumented intervention, and the delivery record must
  note that the private install funnel differs from the public one (anonymous-HTTPS clone remains
  a launch gate that this beta cannot validate).

---

## First-User Interview Review

The 20-question debrief is unusually good — predominantly behavioral and mental-model probes
("what did you think before that point?", "which parts are fact versus inference?", "what happens
when you close the terminal?"), with the correct instruction that a wrong answer is product
evidence, not user failure. Mildly leading items (the "magical" question; the hypothetical
payment questions) are acceptable.

Add these four; nothing else is needed:

1. **A demonstration, not a self-report:** "Right now, without my help, find and show me the file
   where it stored [a specific fact from your session]." Watching navigation is the real
   inspectability test.
2. **Critical-incident replay:** "Walk me through the first moment something didn't work — what
   did you try, in what order, before you considered asking me?"
3. **Silent avoidance:** "What did you deliberately not do or touch because you weren't sure it
   was safe or allowed?" Trust failures that never error are otherwise invisible.
4. **Exit confidence:** "If you stopped using it today, how would you get your data out or delete
   everything?" Directly tests the ownership claim; currently also exposes the undocumented
   uninstall path.

---

## Success Criteria (evidence required to proceed to user #2)

The playbook's eight criteria stand. Restated as the evidence bundle:

1. Road test executed to its published threshold on a tagged candidate SHA, evidence archived in
   a durable, named location — *before* the user is invited (entry gate).
2. User reaches the correct three-sentence onboarding from the README alone, on the documented
   candidate, with zero product-operation interventions and at most one recorded prerequisite
   clarification.
3. One genuinely useful task completed in session one; the user can *show* (not describe) where
   the resulting memory lives.
4. One correction performed by the user, verified persistent in a later fresh session (the
   corrected value returned indirectly; the old value never presented as current).
5. Leave-and-return with accurate indirect recall and no re-onboarding.
6. No stop condition triggered; every Lee interaction recorded and classified.
7. Debrief completed; the user names a real task they will bring next, without Lee present.
8. All interventions and confusions converted into documentation-defect or product-defect
   records with owners — the beta's output is this list, not a pass/fail feeling.

## Stop Conditions

The playbook's 15 stop conditions are comprehensive and correctly biased toward stopping (data
loss, secret mishandling, an obeyed source instruction, any external action, ambiguous memory
authority, a corrected fact resurfacing, false capability claims, harness contract failure,
unsafe upgrade/backup/migration, private data to a wrong remote, repeated basic-operation
intervention, the local-only-processing misreading, safety-prompt pressure, user withdrawal).
This review adds two:

1. **The user runs the documented git backup and believes their memory is protected.** Until the
   backup docs are fixed, this is live misinformation with data-loss consequences — treat
   discovery of it mid-beta as a stop-and-correct event, recorded as a product defect.
2. **The user reads `docs/review/` and loses trust or re-calibrates their debrief answers.** If
   the internal corpus ships in the beta clone, its discovery is an evidence-contamination event;
   record it and weigh the debrief accordingly.

## Recommendation for User #1

The playbook's profile is exactly right and should be followed as written: a weekly terminal-AI
user — comfortable with a terminal, git clone, and a README — who is *not* an agent-systems
builder, has real recurring work with continuity stakes (a consultant, a solo founder, a
technical program manager), thinks aloud, and will report confusion candidly rather than
silently fixing it. Ideally they have a second supported harness installed. Exclude: AI-agent
engineers (they unconsciously repair prompts, remotes, and files — the exact defect-masking this
beta must avoid), anyone Lee has coached on the product, and browser-chat-only users (they test
the terminal prerequisite, not the product). The single most valuable signal this user produces
is the ordered list of what they tried when something first failed — which documentation rung
actually broke.

## Final Beta Decision Rubric

## PAUSE AND REMEDIATE

Not PROCEED AFTER MINOR DOC FIX, because the entry gate — an executed road test meeting its
published threshold — is a process prerequisite, not a document edit. The remediation is bounded
and already fully specified by the repo's own documents:

1. Fix the four launch-review P0s that touch this beta: delivery mechanics for the private repo,
   the provider-processing disclosure, the backup/restore documentation, the README upgrade
   command. (Writing, hours.)
2. Tag the candidate; freeze `main` for the beta window; name a durable evidence location.
3. Execute road-test Tests 0–11 to threshold (including injection Test 8 and upgrade Tests
   9–11), on the harnesses the README will actually claim.
4. Decide deliberately whether `docs/review/` and `docs/launch/` ship in the user's clone.

When those are done, PROCEED TO FIRST USER — with the playbook exactly as written, which is good
enough that no further gate-design work is warranted.
