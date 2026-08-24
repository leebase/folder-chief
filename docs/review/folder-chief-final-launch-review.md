# Folder Chief — Final Independent Launch Review

**Candidate reviewed:** `11743ad057ff0ea056da42fce3b5cb443ec69163` (v1.0.0 RC, "remediation-complete")

**Review date:** 2026-08-23

**Reviewer:** Fable 5, acting as final independent product reviewer. Read-only review; nothing
was remediated, redesigned, committed, or pushed. Findings were produced by one lead reviewer and
five parallel specialist review passes (upgrade/ownership, source trust, claims/README, operator
and first-user documentation, multi-harness evidence), each grounded in file paths and read-only
command observations dated 2026-08-23.

---

# Final Verdict

## PRIVATE BETA ONLY

The remediation sprints did real work. The three prior P0 designs — owner-state topology (D101),
the universal source trust boundary (D103/rule 8), and honest first-run UX — are genuinely
implemented in the shipped files, and the review/road-test procedures written for this release are
among the best-constructed launch-gate documents this reviewer has seen. The product's *design*
distance to launch is short.

Its *evidence* distance is not closed, and one lifecycle promise is broken in the shipped
documentation:

1. **The validation the release claims was never executed.** The road-test scorecard is blank,
   `/home/lee/road-tests/` is empty, the dogfooding scorecard is blank, and no behavioral session
   of *any* harness against the v1.0.0 commit exists anywhere on this machine. Three of the four
   supported harnesses have zero recorded runs ever; Gemini CLI is not even installed on the
   build machine. Yet the repo ships a "Tested Support Matrix," capability pages stamped
   "Last tested: 2026-08-23," and launch copy saying "Tested across" all four harnesses. This is
   the exact failure the prior adversarial review ordered fixed ("remove 'tested' where evidence
   is absent"), reproduced at a more polished level.
2. **The documented private Git backup backs up nothing.** Every memory path is gitignored
   (correct for upgrade safety), so `git push origin main` pushes zero owner memory — verified by
   dry-run (`git add brain/me.md` is refused; `git add -A` stages nothing). Three manual pages
   nevertheless present this as the off-machine backup and tell users to *restore by cloning it*.
   A user who trusts the documented path and loses their machine loses everything. Only the
   folder-copy path works.
3. **Public distribution is not real yet.** `github.com/leebase/folder-chief` is private
   (anonymous HTTPS returns 404; verified 2026-08-23 with network confirmed working). Every
   README/launch-copy clone command fails for a stranger, and the README's own upgrade command
   (`git pull upstream main`) fails on a fresh clone because the `upstream` remote only exists
   after a rename step documented solely in a manual page.

None of this requires redesign. It requires executing the tests the repo already wrote, fixing a
bounded set of documentation defects, and flipping visibility at launch. Until then, the honest
posture is the same one the prior review assigned: private beta, low-sensitivity work, folder-copy
backups, claims narrowed to what is evidenced.

---

## Prior Risk Closure

### Risk 1 — Owner Memory / Upgrade Safety: **STILL OPEN** (upgrade half closed; backup half broken)

- **Original risk:** upgrade and private-backup design could conflict with or lose owner memory.
- **Remediation implemented:** D101 is real at the git layer. `git ls-files` confirms no owner
  memory is tracked; all runtime owner paths (`brain/me.md`, `brain/index.md`, `brain/log.md`,
  `brain/state/*`, `brain/notes/*.md`, `brain/sources/*`, `brain/inbox/*`, `team/*`,
  `chief/capabilities.md`, `chief/learned/*`, `journal/*.md`) are gitignored, and runtime files
  are generated from tracked scaffolds in `chief/templates/scaffolds/`. On a clean install,
  `git pull upstream main` genuinely cannot conflict with ignored memory. This closes the
  original data-loss-on-pull scenario.
- **Evidence:** `.gitignore`; `git ls-files`; `git check-ignore` on all owner paths;
  `git add --dry-run` refusals; `chief/manual/upgrade.md`.
- **Remaining weaknesses:**
  - **Backup/restore contradiction (P0).** `chief/manual/backup-move-recover.md` ("make normal
    commits and push… to a private repository"), `chief/manual/capabilities/git-github.md`
    ("backing up the entire repository… brain/ contains your personal knowledge"), and
    `chief/manual/harnesses.md:154-157` (migrate by cloning the private backup) all describe a
    git backup that excludes 100% of memory, with no force-add/second-repo/tarball mechanism
    documented anywhere. This is a documentation-induced total-memory-loss path.
  - **Tracked files inside `brain/` (P1).** `brain/dashboards/tasks.base`,
    `brain/.obsidian/app.json`, and `brain/.obsidian/core-plugins.json` are tracked upstream
    while `upgrade.md` promises `brain/` (including `dashboards/`) is "never overwritten."
    Ordinary Obsidian use rewrites `app.json`, dirtying a tracked file and re-creating the exact
    pull-abort/conflict scenario D101 was built to kill.
  - **Ignore-net gaps (P1).** `brain/notes/*.md` covers only top-level notes — the README's own
    flagship example (`brain/notes/projects/henderson-proposal.md`) is *not* ignored; likewise
    note/task/journal subdirectories and custom dashboards.
  - **False history claims (P2).** AGENTS.md rule 6 and `backup-move-recover.md` invoke git
    history to preserve/recover owner words; untracked memory has no git history under the
    documented setup.
  - **Silent-clobber hazard (P2).** If upstream ever ships a tracked file at an ignored path,
    git silently overwrites the user's file — no release checklist constrains upstream from this,
    and upstream already tracks files under `brain/`.
- **Six-month answer:** "Your memory is files you own" is true *on disk* and true *against pulls*
  in the common case — a real improvement — but the ownership lifecycle (backup, restore, history,
  Obsidian coexistence) is not yet truthful as documented.

### Risk 2 — Source Trust and Prompt Injection: **CLOSED WITH CAVEAT** (design), evidence still owed

- **Original risk:** untrusted sources could persist prompt injection and corrupt memory.
- **Remediation implemented:** the Universal Source Trust Boundary (rule 8) is in the
  always-loaded contract and restated in every ingest-path manual page (`security.md`,
  `brain.md`, `memory.md`, `harnesses.md` invariant 5, README). Fail-closed cases are concrete
  and consistent: external symlinks, device files, nested instruction files, binaries, >500KB,
  secret-like tokens. The instruction payload (~8.4KB) fits every harness's limits. Corruption
  that does occur is auditable and reversible: immutable sources, provenance links, `brain/log.md`,
  and user correction outranking everything. Blast radius is bounded — rule 4 means injected
  content cannot directly send or execute anything in the shipped core. For a no-code,
  prompt-contract product, this is close to the ceiling.
- **Evidence:** `AGENTS.md` rule 8; `chief/manual/security.md:14-25`; `chief/manual/brain.md:31-41`;
  `.gitignore` (hostile files can't be committed upstream); road-test Test 8 (well-designed
  fixture — unexecuted).
- **Remaining weaknesses:**
  - **No recorded injection test in any harness (P1).** For a product whose only enforcement is
    behavioral, the test record *is* the security artifact. README states "prompt injections are
    ignored" as accomplished fact.
  - **Harness auto-load bypass unacknowledged (P1).** A hostile `CLAUDE.md` dropped in
    `brain/sources/` can be auto-loaded by Claude Code itself when reading that subtree — before
    ingest-time quarantine can fire. Gemini's `context.fileName` registers `AGENTS.md` as a
    context filename, shielded only accidentally by gitignore-respecting discovery. No doc
    acknowledges this channel.
  - **`claim_status` cannot express inferred-vs-confirmed (P1).** A note compiled from a single
    hostile source is written `claim_status: current` and reads back as a rank-2 "confirmed
    fact"; "newer sourced inference > older synthesized state" is a mild injection amplifier,
    braked only by the contradiction rule and model judgment.
  - Folder Agent template omits the trust boundary (P2); secret-detection guidance is
    pattern-free (P2).
- **Direct answer:** yes, a hostile source can plausibly become persistent authority through the
  legitimate ingest pipeline — but not *silently*: provenance, immutable sources, and correction
  precedence make it auditable and reversible. Honest disclosure of that residual truth is one
  paragraph away and currently missing.

### Risk 3 — Public Claims Exceed Reality: **STILL OPEN**

- **Original risk:** packaging, setup, licensing, and unproven harness parity made public claims
  exceed reality.
- **Remediation implemented:** real progress — full MIT LICENSE shipped; HTTPS-first quickstart;
  a prerequisites block; "hiring" defined at first mention; core README claim 4 correctly fenced
  ("core is 100% interactive, local, and inert-by-default"); scheduled-runs/notifications carry
  D102 core-boundary notices; the "possible vs configured" capability honesty pattern is
  best-in-class.
- **Remaining weaknesses:**
  - Repo is **private**; all launch copy links strangers to a 404; "100% Open Source" and "Clone
    Free on GitHub" are not operative (P0 at launch time; a visibility flip, but Gate A's
    "HTTPS clone works without Lee access" is unverifiable until flipped).
  - "Tested across Claude Code, Codex CLI, Gemini CLI, and OpenCode" (`show-hn.md`), "runs
    seamlessly on…" (`landing-page-copy.md`), "Works out of the box" (`README.md`), and the
    `harnesses.md` "Tested Support Matrix" — all unbacked by any recorded run (P0). The matrix's
    "Tested Versions" cells ("v0.2.x+", "Current CLI on Linux, macOS") were never populated from
    real runs; Gemini CLI is not installed on the build machine and macOS was never available.
  - Landing page still says "no scheduled services" while the product ships a scheduled-runs
    guide stamped "Status: Verified"; the demo script's "what changed overnight" implies
    background progress (P1).
  - Capability FAQ answers "Yes" with "step-by-step guides" for integrations whose pages
    self-label as illustrative and still print npm packages previously found nonexistent (P1).
  - README's upgrade one-liner fails on a fresh clone (`upstream` remote does not exist yet) (P0).

---

## Five Public Claims

| # | Claim | Verdict | Basis |
|---|---|---|---|
| 1 | Your AI chief of staff is a folder. | **PASS WITH CAVEAT** | The folder is genuinely the whole product (66 tracked Markdown/config files, zero executables). Caveat: all reliability comes from the harness/model; `what-i-am.md` says this honestly, the tagline doesn't. |
| 2 | Use the AI you already pay for. | **FAIL as worded** | Discovery wiring for four harnesses is present and plausible, but "works out of the box" plus a "Tested Support Matrix" is asserted with zero recorded runs for 3 of 4 harnesses and zero runs of the RC in any harness. Honest claim today: "built and tested with Claude Code; designed for instruction discovery in Codex, Gemini CLI, and OpenCode." |
| 3 | Your memory is files you own. | **PASS WITH CAVEAT** | True on disk: plain Markdown, untracked, editable, with real authority semantics. Caveats: documented git backup captures none of it; README's "Harness-native memory lands in `chief/learned/`" has no mechanism (`.claude/settings.json` is `{}`); tracked `.obsidian`/`tasks.base` files sit inside "your vault"; "own" ≠ "private" (provider processing undisclosed). |
| 4 | Nothing runs unless you invite it. | **PASS WITH CAVEAT** | Shipped core is verifiably inert (no scripts, hooks, daemons) and the README/AGENTS versions are correctly fenced with D102 notices. Caveats: landing copy still absolute ("no scheduled services"); notifications guide's test-send step is in tension with rule 4; enforcement is behavioral; OpenCode's background-server posture is only hedged. |
| 5 | When work deserves an employee, your Chief hires one. | **PASS WITH CAVEAT** | Best-remediated claim: "hiring" is defined at first mention in README, landing page, and Show HN as a bounded, manually-invoked workspace. Caveats: the top-of-README teaser and the LinkedIn post still carry the unqualified metaphor. |

---

## Release Gates

| Gate | Verdict | Why |
|---|---|---|
| A — Repository Safety | **FAIL** | No private data or secrets in the artifact and the license is complete (good), but "HTTPS clone works without Lee access" is false (private repo) and the injection/symlink/binary/oversize/secret fixtures were never run. |
| B — First-Run UX | **FAIL on evidence, materially improved on content** | The prerequisites block, verbatim onboarding contract, and "8 operating rules" probe are genuine FC-005 deliverables. The gate requires two external README-only strangers; zero have been run. The README's own upgrade command also fails on a fresh clone. |
| C — Cross-Session Memory | **PASS WITH CAVEAT** | The strongest area: D103 precedence, `as_of`/`claim_status`, stale-`today.md` rollover, supersession rules all shipped and coherent. Caveats: only pre-remediation Claude Code evidence exists (Sprint 5 fresh-session recall was real); the full six-tier hierarchy and the inferred-vs-confirmed gap are untested. |
| D — Multi-Harness Portability | **FAIL** | 0 of 27 non-Claude harness×invariant cells has any recorded run; Gemini CLI not installed; no version pins from real observations; "Tested" claims shipped anyway. |
| E — Upgrade Safety | **FAIL** | Pull-side design is sound, but road-test Tests 9–11 were never executed, the documented backup preserves no memory, tracked files inside `brain/` violate the 0-conflict promise, and rollback was never demonstrated. |
| F — Public Claims | **FAIL** | "Tested across," "seamlessly," "works out of the box," "no scheduled services," "100% Open Source" (private repo), and "Last tested" stamps on illustrative pages all fail the gate's own literal-reading standard. |

---

## Documentation Review

- **README** — Substantially improved and mostly honest: prerequisites, HTTPS quickstart,
  recovery probe, honest boundaries, "possible vs configured." Defects: upgrade command fails on
  fresh clone; ZIP path's no-clean-upgrade consequence undisclosed; `chief/learned/` sentence has
  no mechanism; no OS statement (`chmod` assumes Unix); no provider-processing disclosure — "no
  hidden storage" invites the local-only-processing misreading; no warning about trust/permission
  prompts at first launch.
- **Operator docs** — The road-test and first-user-deployment procedures are rigorous, behavioral,
  and self-skeptical; 8 of 11 operator questions are fully answered from paper. Gaps: no durable
  home for road-test evidence or the candidate SHA; no tag/release procedure ("when adopted"
  defers to memory); private-repo delivery mechanics unwritten; "not Henderson," "first supported
  harness," and the secret-scan tool assume Lee's memory.
- **Upgrade/recovery** — `upgrade.md`'s conversational fetch-brief-consent-verify flow and the
  scaffold-recovery tables are good. Defects: broken backup story (above); ".gitignore" listed as
  "never overwritten" while tracked; "0 merge conflicts" overstated; corrupt `brain/index.md`
  regenerates only as an empty template with no rebuild-from-notes procedure; uninstall documented
  nowhere.
- **Security** — Honest about the behavioral write boundary (twice), good git-leak recovery.
  Missing: the one-paragraph residual-risk truth (enforcement is the model; harnesses may
  auto-load nested instruction files), and any provider-processing disclosure.
- **Harness docs** — Correct loading chains and useful per-harness probes. Defects: "Tested
  Support Matrix" presents unexecuted assertions as results; Codex `[sandbox] mode =
  "workspace-only"` recipe needs verification (commonly documented form is `sandbox_mode =
  "workspace-write"`) — the same invalid-recipe class FC-007 was meant to purge.
- **Launch materials** — Furthest behind remediation. `landing-page-copy.md` and `show-hn.md`
  contain the P0 overstatements quoted above; `linkedin-post.md` carries the unqualified "hire"
  metaphor; `demo-video-script.md` implies overnight background work; `private-beta-guide.md`
  contradicts the deployment playbook (hands-on pairing vs no-rescue discipline) and is
  architect-voiced. Also: `docs/review/` and `docs/launch/` are tracked, so every user's clone
  ships the adversarial review (with stale "Current: FAIL" on all six gates), the observer's
  debrief script, and the Show HN draft.

---

## Top Remaining Risks

1. **Validation debt presented as validation.** The release's central claims ("Tested across,"
   "Tested Support Matrix," "Verified" stamps, D104 "validated matrix") describe runs that never
   happened. If shipped, the first knowledgeable stranger who asks for evidence — or the first
   Gemini user who hits a divergence — falsifies the product's credibility, not just a claim.
2. **Documentation-induced memory loss.** The recommended git backup silently protects nothing;
   the restore path restores nothing. This will destroy exactly the user who followed the docs
   most carefully.
3. **Persistent injection via legitimate ingest.** Bounded and auditable, but real: a hostile
   source can become `claim_status: current` authority; the harness nested-file auto-load channel
   bypasses ingest quarantine entirely and is acknowledged nowhere.
4. **Upgrade landmines inside the vault.** Tracked `.obsidian`/`tasks.base` files plus the
   ignore-net gaps mean the "0 merge conflicts" promise degrades with ordinary use, precisely on
   the six-month horizon the product's trust depends on.
5. **The internal corpus ships in the artifact.** Stale FAIL gates and the observer's script in
   every clone undermine trust and pre-contaminate the first-user test.

## P0/P1 Findings

**P0 (block public launch):**

- **P0-1** Road test and multi-harness matrix never executed; every "Tested/Verified" claim
  unbacked; no behavioral run of the RC commit in any harness. (missing evidence + documentation
  defect)
- **P0-2** Documented private Git backup captures zero memory; restore/migration docs clone the
  memory-less backup. (implementation/documentation defect — data loss path)
- **P0-3** Public distribution not real: private repo behind every public link; README's
  `git pull upstream main` fails on a fresh clone. (distribution defect)
- **P0-4** No provider-processing disclosure anywhere user-facing while README affirmatively
  implies local-only ("no hidden storage") — required by the deployment playbook's own checklist
  and stop conditions. (documentation defect)

**P1:**

- **P1-1** Tracked files inside `brain/` (`.obsidian/app.json`, `core-plugins.json`,
  `dashboards/tasks.base`) contradict "never overwritten" and re-create pull conflicts under
  ordinary Obsidian use.
- **P1-2** Ignore-net gaps: `brain/notes/` subdirectories (including the README's own example
  path), task/journal subdirectories, custom dashboards.
- **P1-3** Harness auto-load of nested instruction files is an unacknowledged injection bypass;
  `.claude/settings.json` is `{}` with no deny rules; Gemini's shield is accidental.
- **P1-4** `claim_status` vocabulary cannot express confirmed-vs-inferred, letting a
  single-source hostile claim read back as top-tier fact.
- **P1-5** Launch copy contradictions: "no scheduled services," "seamlessly," "Yes +
  step-by-step guides" for illustrative integrations, "what changed overnight."
- **P1-6** Internal corpus (adversarial review with stale FAIL gates, playbook, launch drafts)
  ships in every clone.
- **P1-7** No tag/release pinning: users clone `main` HEAD; nothing prevents an unapproved
  artifact reaching them; `chief/VERSION` says 1.0.0 with no tag.
- **P1-8** README `chief/learned/` auto-memory sentence has no mechanism behind it.

## Evidence Gaps

- **Implementation defects:** P0-2 (backup), P1-1/P1-2 (topology gaps), P1-8 (removed mechanism,
  surviving claim).
- **Documentation defects:** P0-3 (upgrade command), P0-4 (disclosure), P1-4 (schema vocabulary),
  P1-5, P1-6, false git-history claims, internal vocabulary (D101/D103/"Lee's hierarchy"/"sprint:
  remediation-complete") in shipped user-facing files.
- **Missing evidence (the largest category):** all of Gates B, D, E's execution: four-harness
  matrix with pinned versions, road-test Tests 0–11 (including injection Test 8 and upgrade Tests
  9–11), dogfooding scorecard, external README-only strangers. The procedures exist and are good;
  they have simply never been run, and their evidence has no durable home.
- **Acceptable caveats (document, don't fix):** behavioral (not technical) enforcement of the
  write boundary; provider processing as inherent to the product class; git history retaining
  "forgotten" content; model-dependence of contract compliance; "hire" as metaphor once defined.

---

## Adversarial Questions (summary answers)

1. *Could someone else understand and use this repo if Lee disappeared?* Mostly yes — the docs
   are unusually complete — but they would inherit the broken backup path, the unexecuted gates,
   and evidence with no durable home.
2. *Does it genuinely work as a folder?* The design does; the recorded proof covers only Claude
   Code, pre-remediation.
3. *Are four harnesses supported or mentioned?* One supported by evidence; three mentioned with
   plausible wiring.
4. *Can a user confidently correct the Chief?* The semantics are the product's strongest part;
   unproven on the RC.
5. *Can upstream updates repeat safely?* Pull-side yes (clean installs); the `.obsidian`/
   dashboard tracking and ignore gaps erode it with use.
6. *Could hostile source material become persistent instruction?* Persistent *authority* yes
   (auditable); persistent *instruction* via harness nested-file auto-load is an open,
   unacknowledged channel.
7. *Is "nothing runs unless you invite it" literally true?* For the shipped core, yes; the
   landing page's absolute version is not.
8. *Does "hire" communicate what happens?* Now, mostly yes — the qualifier just hasn't reached
   the teaser or LinkedIn post.
9. *Does the first-user guide test the product or Lee?* The product — it is well designed for
   exactly that — but its own entry gate is unmet.
10. *Is anything in launch copy still aspirational?* Yes: "Tested across," "seamlessly," "no
    scheduled services," "100% Open Source," "out of the box."
11. *Has remediation added unnecessary complexity?* Modestly. The core UX remains one sentence —
    "clone a folder, open your AI CLI in it, say hello" — and D101/D103 are invisible when they
    work. But internal vocabulary (D-numbers, "Lee's hierarchy," sprint labels) leaked into
    shipped files, and the frontmatter/schema surface is nearing the pseudo-database line without
    yet crossing it.
12. *Would I hand this exact commit to a stranger?* Not yet — because the stranger cannot clone
    it, might follow the backup docs, and would be relying on tests that were never run.

## Public Launch Recommendation

## HOLD FOR REMEDIATION

This is a bounded hold, not a return to redesign. The design work is done and should not be
reworked; doing more architecture now would be the "endless perfection loop" this review is
instructed to avoid. What stands between this RC and an honest launch is a finite, mostly
mechanical list:

1. Execute the already-written road test (Tests 0–11) on a tagged candidate, all four harnesses
   or a narrowed support list, and give the evidence a durable home. (P0-1)
2. Fix the backup/restore documentation to tell the truth: folder copy (or a dedicated vault
   repo) is the backup; the product remote is not. (P0-2)
3. Make distribution real at launch: flip visibility, verify anonymous HTTPS clone, tag v1.0.0,
   and fix the README upgrade command / ZIP disclosure. (P0-3)
4. Add the provider-processing paragraph to README and security.md. (P0-4)
5. Align launch copy with Gate F: replace "Tested/seamlessly/out of the box/no scheduled
   services" with evidenced language, or produce the evidence first. (P1-5)

The P1 topology items (tracked `.obsidian`/`tasks.base`, ignore-net widening, `docs/` shipping
decision) should ride along but are hours, not sprints. When items 1–5 are done, this reviewer
expects the next verdict to be PUBLIC LAUNCH READY WITH MINOR CAVEATS without further review
cycles.
