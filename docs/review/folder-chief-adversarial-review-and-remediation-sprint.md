# Folder Chief — Adversarial Review and Remediation Sprint

**Candidate reviewed:** `bac97370df4b919d3626da4255c3a69789d24957`

**Review date:** 2026-08-23

**Posture:** candidate public GitHub distribution, inspected from a clean `main` worktree

**Evidence notation:** `path:line`; command observations are dated 2026-08-23.

## Executive Verdict

**PRIVATE BETA ONLY**

The concept is coherent and an experienced AI developer can probably make the current artifact
work. That is not the public-release bar. The candidate makes three promises that its mechanics do
not currently uphold: clean upgrades that never touch owner data, a security boundary confined to
the folder, and equivalent out-of-box behavior across four harnesses. The upgrade design is
specifically contradicted by the tracked tree; source safety is an instruction-following hope, not
a trust boundary; and several published setup recipes are invalid or conflict with the canonical
contract.

This repository is technically well organized and internally described. It is not yet demonstrated
to be understandable, safe, or recoverable for strangers. The repository itself calls the package
“complete” and “launch-ready” (`chief/manual/what-i-am.md:106-110`) while the only shipped test
artifacts are unexecuted runbooks and blank scorecards (`docs/launch/dogfooding-runbook.md:88-105`).
That gap is the central release finding.

Use it only in a bounded private beta with disposable or low-sensitivity work, no reliance on
upgrades, and explicit disclosure that the folder boundary is behavioral. Do not publish the five
claims in their current absolute form.

### Readiness by audience

| Standard | Assessment |
|---|---|
| Technically correct | Partial. The basic instruction-and-Markdown pattern is viable; upgrade, auto-memory, scheduling, notification, and integration details contain factual contradictions. |
| Internally validated | Partial. Git history shows five implementation sprints; the public artifact contains plans, not reproducible results. |
| Understandable to Lee | Likely. The launch materials and examples encode Lee's vocabulary and expected path. |
| Understandable to an experienced AI developer | Mostly, with caveats. This user can repair remotes, settings, and model behavior unaided. |
| Understandable to a technically competent stranger | Partial. Git, SSH, harness setup, trust prompts, and ownership topology are assumed. |
| Understandable to a non-expert AI power user | No. The README exposes a terminal/git/SSH product while marketing a low-setup personal assistant. |
| Genuinely launch-ready | No. P0 safety, ownership, distribution, and claims gates fail. |

## Product Claim Assessment

| Claim | Evidence supporting it | Evidence weakening it | Likely user interpretation | Actual behavior | Overclaim risk | Verdict |
|---|---|---|---|---|---|---|
| **Your AI chief of staff is a folder.** | The product is Markdown/configuration with no executable product code (`git ls-files`; `chief/manual/what-i-am.md:106-110`). Core state is visibly organized under `brain/`, `journal/`, and `team/`. | The “chief” exists only when a capable model follows a long behavioral contract. Some supported harnesses keep provider-side session or auto-memory state, and current OpenCode documentation describes a shared background server. | The folder itself provides a reliable chief-of-staff capability. | The folder supplies prompts, conventions, and state; the paid harness/model supplies all execution and much behavioral reliability. | Medium | **PASS WITH CAVEAT** |
| **Use the AI you already pay for.** | Root shims cover Claude, Codex, and Gemini; OpenCode reads `AGENTS.md` (`CLAUDE.md:1`, `GEMINI.md:1`, `.gemini/settings.json:1-5`, `AGENTS.md`). | No prerequisites, minimum versions, subscription caveats, model matrix, or public evidence of four-harness behavioral tests. Claude auto-memory redirection is configured in a project setting with a relative path (`.claude/settings.json:1-3`), while current official Claude docs say that setting is not accepted from project scope and requires an absolute or `~/` path. The OpenCode headless command is obsolete (`scheduled-runs.md:58-61`). | Clone once and receive materially equivalent behavior in any named tool. | Instruction discovery is plausible in all four; permissions, memory, model quality, settings, and headless behavior differ materially. | High | **WEAK** |
| **Your memory is files you own.** | Owner knowledge is designed as inspectable Markdown with provenance and correction rules (`chief/manual/memory.md:1-6`, `brain/index.md:36-73`). | Claude-native memory is separately described under `chief/learned/` (`README.md:74-77`) but the shipped redirection does not work as documented. Git-clone migration loses ignored `chief/installed.md`. The model can write unsupported, stale, or contradictory claims, and no validator runs automatically. Private content read by a hosted harness is transmitted to that provider even though it remains stored locally. | All durable context is complete, local-only, accurate, portable, and under straightforward user control. | Most intended product memory is local Markdown; correctness and completeness depend on model compliance and user review, while provider processing and harness memory remain separate concerns. | High | **PASS WITH CAVEAT** |
| **Nothing runs unless you invite it.** | The shipped repository has no scripts, hooks, daemon units, or binaries; the canonical contract forbids external action (`AGENTS.md:3-7,55-57`). | The product teaches unattended cron execution (`chief/manual/capabilities/scheduled-runs.md:1-13,63-67`) and a notification guide tells the Chief to send a test message (`notifications.md:47-52`). Current OpenCode documents a shared background server by default. | No Folder Chief work, listener, or outbound action occurs after the user closes the terminal. | Default files are inert, but optional documented modes deliberately run without an interactive invitation; the harness may also run provider/runtime services. | High | **FAIL** |
| **When work deserves an employee, your Chief hires one.** | A disciplined interview, verifiability gate, template, roster, and bounded work directory exist (`chief/manual/agents.md:23-76`; `chief/templates/folder-agent/`). | “Hire” means copying and editing files. Nothing invokes, schedules, supervises, or isolates the agent automatically. The template calls tests “executable” although they are Markdown scenarios (`agents.md:9-17`). | A specialized worker begins owning an ongoing responsibility. | The Chief scaffolds another prompt folder that a human must invoke and supervise with a capable harness. | High | **WEAK** |

## Top 10 Launch Risks

### 1. Owner data and product updates share tracked paths

- **Severity:** P0 — blocks release
- **Likelihood:** High
- **Affected personas:** A, B, C, D
- **Failure scenario:** The user completes onboarding or edits their vault, then runs the advertised `git pull origin main`; Git aborts on dirty tracked files, demands divergent-branch policy, or conflicts with a future upstream change.
- **Evidence:** `README.md:74-80` and `chief/manual/upgrade.md:28-37,56-62` promise preservation and no conflicts. `git ls-files` shows tracked `brain/me.md`, `brain/index.md`, `brain/log.md`, `brain/state/today.md`, `team/ROSTER.md`, and `chief/capabilities.md`—the exact owner paths the manifest says upstream does not ship.
- **User-visible symptom:** “Your changes would be overwritten,” a merge conflict inside personal memory, or an AI-authored conflict resolution that drops owner data.
- **Recommended remediation:** Establish a real product/user-state boundary. Keep the simple folder UX, but use an install/bootstrap or template boundary that stops future upstream commits from owning personalized paths. Define `upstream` separately from the user's private `origin` and document clone, fork, and ZIP cases.
- **Verify remediation:** In disposable clones, onboard and heavily edit every preserved zone, commit some changes and leave others dirty, publish a fixture upgrade touching product files, then prove the update is clean and byte-for-byte preserves user state on Linux, macOS, and Windows.

### 2. Raw sources are prompt-injection persistence, not a safety boundary

- **Severity:** P0 — blocks release
- **Likelihood:** High
- **Affected personas:** A, B, C, D
- **Failure scenario:** A document in `brain/inbox/` says to ignore the contract, expose other files, or rewrite memory. The Chief obeys it while ingesting and preserves the hostile instruction forever in immutable sources.
- **Evidence:** Core ingest instructs the model to inspect every item and compile it (`chief/manual/brain.md:31-54`) but never classifies local source content as untrusted data or forbids following embedded instructions. Optional web/email/Drive pages contain narrower warnings (`web.md:13-17`, `email.md:13-18`, `google-drive.md:13-18`), proving the risk is known but not in the canonical ingest path. No symlink, path, size, binary, or reserved-instruction-file handling exists.
- **User-visible symptom:** Unexpected file changes, false memory, attempted out-of-scope reads/actions, or a Chief that appears to have “learned” the attack.
- **Recommended remediation:** Add a small universal source trust policy: source bodies are evidence only, never authority; ignore embedded operational instructions; reject or quarantine symlinks, device/special files, nested instruction filenames, unsupported/binary items, and oversized content; require a review summary before integration.
- **Verify remediation:** A disposable corpus must include direct/indirect injection, misleading claims, conflicting dates, symlinks outside the repo, malformed Markdown/frontmatter, a large file, a binary, and a secret-like token. Across all supported harnesses, no embedded instruction executes and no unauthorized content becomes confirmed memory.

### 3. The public artifact is not distributable as advertised

- **Severity:** P0 — blocks release
- **Likelihood:** Certain in the reviewed state
- **Affected personas:** A, B, C, D
- **Failure scenario:** A stranger clicks through, cannot access the private repository or cannot use the SSH clone URL; a company reviewer finds no actual license grant.
- **Evidence:** On 2026-08-23 `gh repo view` reported `visibility: PRIVATE` and `licenseInfo: null`. The README offers only `git@github.com:` clone commands (`README.md:5-8,17-23`). No `LICENSE` file is tracked, although the README says “MIT License” (`README.md:117-119`) and launch materials say “100% Open Source (MIT)” (`landing-page-copy.md:24-28`).
- **User-visible symptom:** 404/access request, SSH “permission denied,” or legal rejection.
- **Recommended remediation:** Before public launch, make the intended repository public, add the full LICENSE file and copyright notice, use HTTPS as the default clone path, add a tested Download ZIP path if supported, and state prerequisites and supported versions.
- **Verify remediation:** Test the GitHub page logged out in a clean browser; clone over HTTPS on a machine with no GitHub SSH keys; validate the GitHub license detector; follow the ZIP path without Git metadata and confirm its explicitly bounded behavior.

### 4. Memory can be elegantly stale or wrong

- **Severity:** P1 — serious launch concern
- **Likelihood:** High over sustained use
- **Affected personas:** A, B, C, D
- **Failure scenario:** Yesterday's priorities remain in undated `brain/state/today.md`; a correction leaves both wrong and right text without a machine-readable supersession state; a future model surfaces the old claim as current.
- **Evidence:** Every substantive session must read `brain/state/today.md` (`AGENTS.md:13-19`), but its shipped shape has no `as_of` date (`brain/state/today.md:1-4`). Corrections preserve superseded wording (`memory.md:45-60`) with no controlled status/authority fields. Lint is manual and report-only (`brain.md:78-95`). Exact source line/hash claims are discouraged (`brain.md:26-29`).
- **User-visible symptom:** Confident but outdated briefings, repeated wrong facts after correction, and no obvious authoritative value.
- **Recommended remediation:** Add minimal, human-readable authority metadata: `as_of`, `confirmed_by`, and `claim_status`/`supersedes`; require stale-state detection at session start; keep superseded claims in a clearly non-current section or log; provide a deterministic lint checklist/tool only if behavioral lint cannot meet the gate.
- **Verify remediation:** Plant stale, conflicting, corrected, manually edited, and duplicated facts. Fresh sessions must identify authoritative current values, label uncertainty, and never present superseded text as current across every harness/model in the support matrix.

### 5. Four-harness parity is asserted, not demonstrated, and two concrete recipes are wrong

- **Severity:** P1 — serious launch concern
- **Likelihood:** High
- **Affected personas:** A, B, C
- **Failure scenario:** A Claude user expects in-folder auto-memory but it remains in the default provider-managed location; an OpenCode scheduled command fails; another model performs incomplete onboarding.
- **Evidence:** `.claude/settings.json:1-3` uses project-scoped relative `autoMemoryDirectory`; current official Claude documentation says the setting is not accepted from project/local settings and must be absolute or `~/`. `scheduled-runs.md:58-61` uses `opencode --non-interactive`, while current official OpenCode CLI documentation uses `opencode run`. The repository contains no version matrix, transcripts, or executed cross-harness result record; `show-hn.md:35-40` nevertheless says “Tested across.”
- **User-visible symptom:** Memory appears outside the folder, flags fail, instructions are skipped, or behavior changes materially after a harness swap.
- **Recommended remediation:** Define a minimum-version support matrix and a small observable behavioral contract, remove unsupported settings/commands, and narrow “supported” to tested combinations. Document global instruction conflicts and trust/permission prompts.
- **Verify remediation:** Clean-home, fresh-clone tests for onboarding, file writes, correction, fresh-session recall, source injection, and harness swap on each named harness and at least one ordinary/default model.

### 6. “Confined execution” is a prompt promise, not enforcement

- **Severity:** P1 — serious launch concern
- **Likelihood:** Medium; impact high
- **Affected personas:** B, C, D
- **Failure scenario:** A model or imported source causes the harness to read/write outside the repository or run a consequential command with the user's account privileges.
- **Evidence:** Marketing says “operates strictly inside this folder” (`README.md:74-80`). The canonical contract admits harness permissions may be broader (`AGENTS.md:65-70`), and security says harnesses run with the local user's privileges (`chief/manual/security.md:5-12`).
- **User-visible symptom:** A permission prompt or change outside the folder contradicts the user's trust model; enterprise review blocks deployment.
- **Recommended remediation:** Reword the promise as a behavioral operating boundary, document the harness sandbox/permission dependency, recommend least-privilege startup profiles, and define incident/stop guidance. Do not build a sandbox platform.
- **Verify remediation:** In each harness, inspect effective permissions, test explicit out-of-folder and external-action requests, and require a stop/refusal or harness denial with no mutation.

### 7. Consent and external-action rules contradict optional product guides

- **Severity:** P1 — serious launch concern
- **Likelihood:** Medium
- **Affected personas:** A, B, C, D
- **Failure scenario:** A user enables notifications or a schedule believing Rule 4 still means no sends or unattended execution; the guide directs a test send or cron invocation.
- **Evidence:** `AGENTS.md:55-57` says the Chief never sends even with owner approval. `notifications.md:3-16,47-52` describes outbound messages and directs a test send. `scheduled-runs.md:1-13` enables unattended work while `README.md:48-49,101-105` says nothing runs unless invited/no background daemons.
- **User-visible symptom:** Surprise outbound message or activity after the interactive session closes.
- **Recommended remediation:** Pick one truthful product boundary. The smallest choice is to keep Folder Chief interactive/read-and-draft and label scheduling/sending as out-of-product extensions; otherwise qualify the public claim and create explicit mode/state indicators.
- **Verify remediation:** A claims-to-contract trace proves every public sentence matches every capability guide, and adversarial tests show external sends remain impossible under the supported core.

### 8. Capability setup is aspirational and can download invalid/unvetted packages

- **Severity:** P1 — serious launch concern
- **Likelihood:** High when users try integrations
- **Affected personas:** A, B, D
- **Failure scenario:** A user follows a “step-by-step” guide; `npx -y` downloads a package or fails because the named package does not exist, then the user exposes credentials while troubleshooting.
- **Evidence:** On 2026-08-23, read-only `npm view` returned E404 for the exact documented packages `@modelcontextprotocol/server-playwright`, `server-google-calendar`, `server-gmail`, and `server-fetch`; they appear in `browser.md:7-10`, `calendar.md:21-35`, `email.md:20-36`, and `web.md:7-10`. The registry provides examples without version pinning or provenance. `landing-page-copy.md:99-100` broadly answers “Yes” to integrations.
- **User-visible symptom:** Install failure, supply-chain warning, authentication confusion, or a capability falsely marked active.
- **Recommended remediation:** Remove recipes that are not maintained and tested. For each retained integration, name the provider/repository/version, exact scope, configuration location, revoke path, and last-tested date; describe all others as architecture examples.
- **Verify remediation:** Execute each published recipe from a clean supported machine/account with test credentials, prove read/draft boundaries, revoke access, and repeat after a fresh install.

### 9. First-run UX assumes git, SSH, CLI installation, terminal navigation, and model competence

- **Severity:** P1 — serious launch concern
- **Likelihood:** High for Personas B/C
- **Affected personas:** B, C
- **Failure scenario:** The user has a paid web AI subscription but not the corresponding CLI entitlement/tool, has Git but no SSH key, launches from the wrong directory, sees a workspace-trust prompt, or runs a read-only harness and gets no recovery path.
- **Evidence:** The entire public quickstart is two SSH/git commands plus a bare harness name (`README.md:17-36`). It contains no OS-specific prerequisite, authentication, “confirm you are in this folder,” expected first output, permission explanation, or failure/restart section.
- **User-visible symptom:** Setup fails before “Hello,” or the model answers generically because instructions did not load.
- **Recommended remediation:** Add one short prerequisites block, HTTPS-first path, exact launch-location check, expected onboarding response, instruction-loaded check per harness, and a compact troubleshooting/restart path. State honestly that this is a terminal-AI product.
- **Verify remediation:** Moderated README-only tests with one Persona B and one Persona C candidate; Lee may answer only true prerequisites. Both must reach a useful task without architecture coaching.

### 10. “Hire an employee” exposes an architecture metaphor as a capability

- **Severity:** P2 — important but survivable
- **Likelihood:** High
- **Affected personas:** A, B, C
- **Failure scenario:** The user expects an agent to work independently on a cadence; the Chief creates files but nothing executes until the user separately opens a harness in the nested folder.
- **Evidence:** The agent manual defines a directory and manual copy procedure (`chief/manual/agents.md:7-21,51-64`). The template says it is not autonomous (`chief/templates/folder-agent/AGENTS.md:1-5`). No invocation or supervision mechanism is shipped.
- **User-visible symptom:** “You said you hired someone; why is nothing happening?” or unbounded manual folder management.
- **Recommended remediation:** Keep the metaphor but define it at first mention: “hire” means scaffold a bounded specialist workspace; it runs only when invoked. Replace “executable acceptance tests” with “acceptance scenarios” unless execution exists.
- **Verify remediation:** A naïve user explains correctly what was created, how it starts, what it can read/write, and whether it runs in the background before approving a hire.

## First-Run Adversarial Review

| Stage | What can go wrong / likely misunderstanding | Unstated dependency | Recoverability now |
|---|---|---|---|
| GitHub page | Repository is private; no detected license; launch copy promises open source and finished validation. | Lee must change visibility and add legal artifact. | None for a stranger. |
| Clone/download | SSH-only clone fails without GitHub SSH setup. ZIP behavior is undocumented and loses Git upgrades/history. | Git, SSH keys, GitHub access, terminal literacy. | Poor: no alternate command or diagnostic. |
| Open folder | User opens parent/home or an editor rather than launching the harness with this directory as cwd. | Understanding cwd and project trust. | Poor: no “verify location/instructions loaded” step. |
| Launch harness | Tool may not be installed/authenticated; subscription may not include it; global instructions may conflict; permissions differ. | Supported CLI/version/model and provider login. | Poor: no per-harness first-run check. |
| Say hello | A model may treat the repo as code, fail to discover instructions, or answer before reading required files. | Instruction discovery and model compliance. | Weak: user is told only to say hello, not what correct output looks like. |
| Onboarding | Writing `brain/me.md` may be denied; paraphrase may alter owner meaning; interruption leaves marker absent and partial files behind. | Write permission and a model capable of multi-step bookkeeping. | Partial: deleting marker resets, but partial-run recovery is not documented publicly. |
| First useful task | “Real task” has no safe scope; user may supply sensitive or catastrophic work; model may write surprising files. | User judgment and provider data policy. | Partial through Git, if the user knows Git and committed a baseline. |
| Close harness | Durable capture may not occur before an abrupt close; Claude auto-memory goes to its default external location. | The model obeys same-session capture before termination. | Weak: no exit/checkpoint command or inspection cue. |
| Reopen fresh session | Ignored marker disappears after Git-only migration; `today.md` can be stale; previous-day journal is not in required startup reads. | Same folder, preserved ignored files, correct date, model navigation. | Partial: Markdown is inspectable, but authority is ambiguous. |
| Recall | The model may quote a superseded claim, miss an orphan note, or infer from conversation/harness memory. | Accurate index and manual lint. | Manual correction exists; no deterministic diagnosis. |
| Ongoing use | Index/log/state grow, duplicate, and drift; manual edits violate schema; raw binaries and sources accumulate. | Owner housekeeping and strong model discipline. | Manual lint/recovery guidance exists but must be requested. |
| Upgrade | Dirty/committed owner state collides with tracked upstream scaffolds; private backup wants the already-used `origin`; ZIP users cannot pull. | Advanced Git topology/conflict resolution. | Poor and high-risk; the documented guarantee is false. |

## Cross-Harness Portability Review

### Claude Code

- **Instruction discovery:** `CLAUDE.md` correctly imports `AGENTS.md` (`CLAUDE.md:1`), consistent
  with current Claude documentation.
- **Behavioral differences:** Claude adds its own auto-memory system. The candidate claims to keep
  it in `chief/learned/`, but the project-scoped relative setting is not accepted by current
  Claude Code. Claude also explicitly documents that CLAUDE instructions are user-message
  guidance, not guaranteed enforcement.
- **Unsupported assumption:** Repository settings can redirect native auto-memory into the repo.
- **UX:** Workspace trust and permissions can precede onboarding; neither appears in README.
- **Test gap:** No versioned clean-home evidence proves onboarding, same-session capture,
  correction, or migration with native auto-memory enabled/disabled.

### Codex CLI

- **Instruction discovery:** Root `AGENTS.md` is native and comfortably below Codex's default
  32-KiB aggregate project-instruction limit.
- **Behavioral differences:** Global `~/.codex/AGENTS.md` and nested instruction files are merged;
  later guidance can conflict with the Folder Chief contract. Sandbox and approval modes change
  whether onboarding writes succeed.
- **Unsupported assumption:** “Use the AI you already pay for” elides CLI installation,
  authentication, model availability, and sandbox policy.
- **UX:** Codex can report loaded instructions, but the README does not tell users to verify them.
- **Test gap:** No committed transcript/result for a default Codex install or Folder Agent nested
  contract.

### Gemini CLI

- **Instruction discovery:** `.gemini/settings.json` names both `AGENTS.md` and `GEMINI.md`, while
  `GEMINI.md` again tells the model to read `AGENTS.md`. This is likely visible, but redundant and
  dependent on settings version/merge behavior.
- **Behavioral differences:** Gemini also loads hierarchical global and subdirectory context;
  `/memory show` can verify it. Tool approvals and search grounding differ from other harnesses.
- **Unsupported assumption:** The same model will reliably carry out the onboarding file-write
  sequence and manual-on-demand behavior.
- **UX:** No supported-version or instruction-verification step.
- **Test gap:** No clean-profile evidence or harness-swap evidence.

### OpenCode

- **Instruction discovery:** Current OpenCode supports root `AGENTS.md` and `.claude/skills/`.
- **Behavioral differences:** Current OpenCode documentation describes a shared background server
  by default, directly complicating the categorical zero-server/zero-background claim. Provider
  and model choice are more variable than in vendor-specific CLIs.
- **Unsupported assumption:** The documented `opencode --non-interactive` command works; current
  official syntax is `opencode run` (and v2 documentation uses `opencode2 run`).
- **UX:** “OpenCode” is not a single stable model/runtime combination.
- **Test gap:** No pinned major version, provider/model, standalone/background-service posture, or
  behavior result.

### Portability conclusion

Shared visibility of Markdown does not create equivalent behavior. The correct launch claim today
is “designed for instruction discovery in four harnesses,” not “works out of the box” or “runs
seamlessly.” Public support should be earned per harness/version/model with an observable contract.

## Memory Model Review

### What works

- The `sources` → `notes` → `state` distinction is understandable and inspectable
  (`brain/index.md:9-34`).
- Controlled frontmatter, inline provenance, contradiction visibility, correction verbs, and a
  durable change log are better than free-form chat history (`brain/index.md:54-73,117-134`).
- The product explicitly separates operational journals from durable knowledge.

### What fails under pressure

- **Provenance:** Source paths are required but exact claim locations and source fingerprints are
  intentionally absent. Renames, duplicated filenames, manual edits, and partial extracts weaken
  traceability.
- **Correctness:** The same model that infers a claim usually writes and later validates it. There
  is no independent check, confirmation state, or confidence/authority field.
- **Contradictions:** Both claims remain in prose. No controlled `unresolved`, `current`, or
  `superseded` field guarantees retrieval behavior.
- **Staleness:** `updated` dates exist for notes, but no freshness policy exists by type.
  `state/today.md` has no date and is mandatory reading.
- **Deletion:** Derived deletion is documented, but raw-source removal is awkwardly deferred to the
  owner (`memory.md:62-78`) and Git history retains forgotten content. This is not intuitive erasure.
- **User overrides:** Owner correction is authoritative in prose but not stored as a distinct,
  verbatim source/decision record with precedence.
- **Fact/inference/decision/task separation:** `type` distinguishes document classes, not claim
  epistemology. A paragraph can mix observed fact, model inference, owner decision, and suggestion.
- **Daily versus long-term state:** Zones exist, but promotion/expiry rules do not. `today.md` can
  become permanent accidental truth.
- **Duplication/growth:** No archive, compaction, index-size, source-size, note-count, or review
  threshold exists. Claude auto-memory can create a second memory plane.
- **Bad writes:** Git can recover files only if the user committed a good state and knows Git.
  Atomic multi-file updates and incomplete-ingest markers are absent.
- **Cross-session continuity:** It works only to the extent the model reads the required paths and
  prior sessions wrote them. Abrupt exits and Git-clone migration break parts of the promise.

### What prevents Folder Chief from becoming a beautifully organized collection of wrong information?

Today: only behavioral instructions, optional human inspection, and optional Git history. Those are
useful controls, not a prevention mechanism. Raw immutability proves what a source contained; it does
not prove the synthesis is faithful, the source is trustworthy, the claim is current, or the model
will select the corrected claim. Public launch needs a small explicit authority/freshness model and
adversarial continuity tests—not a database or RAG system.

## Source Safety Review

| Source condition | Current behavior/risk | Required bounded response |
|---|---|---|
| Prompt injection | Core ingest has no universal data-not-instruction rule. Attack is preserved in immutable storage. | Treat all source bodies as untrusted evidence; never follow embedded operational instructions; surface attempted injection. |
| Malicious/misleading documents | Provenance records origin, not truthworthiness. Model may compile false claims cleanly. | Label source authority and confirmation state; do not promote unverified claims to current state. |
| Stale material | `updated` applies to derived notes, with no source `as_of`/expiry policy. | Capture date/as-of and flag freshness by claim type. |
| Conflicting sources | Visible contradiction procedure exists. | Add controlled resolution status and explicit owner/source settlement record. |
| Secrets accidentally imported | `.gitignore` catches a few filename patterns, not secrets inside Markdown, PDFs, JSON, exports, or history. | Stop/quarantine on detected secret-like material; warn before commit/provider upload; document revoke/purge. |
| Very large sources | No size/token/page limits or partial-ingest receipt. | Refuse or chunk with explicit coverage receipt and omissions. |
| Binary files | Obsidian hides unsupported files; no parser or truthful conversion contract. | Preserve original, identify unsupported type, require a labeled extract; never claim the binary was read. |
| Unsupported formats | No compatibility table. | Publish a small tested format matrix and a fail-closed message. |
| Symlinks/special files | No handling; a link can expose content outside the folder during read/ingest. | Reject links resolving outside the root and all special/device files. |
| Missing provenance | Ingest says keep provenance “in the source” while also preserving content unchanged (`brain.md:31-41`). | Use a separate sidecar or derived record; never alter raw bytes to add metadata. |

Raw-source immutability is not sufficient protection. It is an evidence-preservation property. It
does nothing to neutralize malicious instructions, validate truth, prevent leakage, bound resource
use, or keep hostile content from being re-read in every future session.

## Git and Ownership Review

- **Clone versus fork:** Clone preserves the public upstream as `origin`; fork may be public and can
  expose personal memory. Neither path is explained.
- **Local modification:** Personal state begins in tracked upstream files, so normal use dirties the
  same branch required for updates.
- **Upgrade strategy:** `git pull origin main` is not a preservation mechanism. It merges tracked
  paths and fails on dirty/divergent states.
- **Remote topology:** The private-backup guide says `git remote add origin` even though clone
  already created `origin` (`git-github.md:35-41`). Upgrade and backup fight for the same name.
- **Ignored files:** Secret-shaped filenames and workspace files are ignored; most private memory is
  deliberately not. Ignored `chief/installed.md` is omitted from Git backups, so a cloned backup
  reruns onboarding despite migration docs promising detection (`harnesses.md:63-81`).
- **Accidental commit/push:** No preflight checks, remote-visibility warning, or secret scan protects
  `git add .` / `git push`. PDFs and exports can contain secrets without suspicious filenames.
- **Upstream updates:** No tags/releases/changelog or migration compatibility metadata exists. The
  current repository has version `1.0.0` but no Git tag.
- **Branch strategy:** None is explained for user changes, upstream tracking, or private backup.
- **Backup:** Folder copy is sound if hidden/ignored files are included. Private Git backup is not
  sound as documented and omits ignored onboarding state.
- **Migration:** Copy can work; clone cannot fully reproduce installation state or external
  capabilities. Symlinks and OS-specific files require qualification.

### Does “you own it” remain pleasant after six months of use?

Not with the current Git model. The user owns the bytes but also inherits branch divergence,
tracked-state conflicts, secret/public-remote risk, growing history, and a split between upstream
and private backup that the manual does not resolve. Ownership becomes pleasant only when product
updates and user data have mechanically separate lifecycles and the default remote topology cannot
publish personal state by accident.

## Product Simplicity Review

The one-sentence concept is strong. The following implementation concepts leak too early or create
work the user should not need to understand:

- “Sprint 5” and “production package” appear in the runtime contract/manual (`AGENTS.md:9-11`,
  `what-i-am.md:106-110`); users do not need internal delivery history.
- Users must reason about canonical contracts, pointer shims, instruction payload budgets, harness
  settings, MCP servers, maturity tiers, capability stanzas, controlled frontmatter, two logs,
  source compilation, and Git remote topology before trusting basic behavior.
- Obsidian is marketed as a visual reveal although it is optional and no non-Obsidian inspection
  walkthrough exists in the quickstart.
- “Chief,” “brain,” “journal,” “capabilities,” “team,” “Folder Agent,” “verifiability gate,” and
  “hiring” are all introduced before evidence that the basic daily task flow is valuable.
- The capabilities manual looks operational but contains unverified vendor packages. Architecture
  examples masquerade as setup.
- LeeBase escalation is built into the runtime product contract (`AGENTS.md:111-124`), creating a
  vendor referral behavior inside an ostensibly owner-controlled open-source tool.

The remediation should reduce concepts on the first-run path, not hide them behind a new service.
README → open folder → hello → useful task → inspect/correct → leave/return is enough.

## Persona Reviews

### Persona A — AI Developer

**Verdict: PARTIAL value, unlikely to replace a mature personal setup yet.** The structure, source
discipline, and agent boundary are reusable. An AI developer can already build the same with a
short `CLAUDE.md`/`AGENTS.md` and an Obsidian vault, and will notice the broken Git model and soft
security claims immediately. Retention requires demonstrated memory quality and a frictionless
upgrade path, not more manuals.

### Persona B — Technical Knowledge Worker

**Verdict: private beta candidate with observation.** This user can clone and use terminal tools,
but should not need to understand MCP, instruction budgets, merge topology, or frontmatter policy.
The first task may land; correction, source ingest, backup, and upgrade require too much
architecture knowledge.

### Persona C — Non-developer AI Power User

**Verdict: the accessibility claim exceeds the product.** A paid ChatGPT/Claude/Gemini web user is
not automatically a CLI user. Git, SSH, terminal cwd, provider authentication, JSON settings, and
conflict recovery are core prerequisites. Unless public positioning explicitly says “for terminal
AI users comfortable with Git,” this persona is being invited into a setup the product does not
support.

### Persona D — Enterprise Architect / Security Reviewer

**Verdict: blocked for business information without a documented bounded pilot.** Concerns include
provider data processing/retention, prompt injection, local-user privilege, absence of technical
write confinement, secrets in content/history, no dependency provenance, no support/version
matrix, no audit integrity, no deletion guarantee, no concurrency model, and no formal security
reporting policy. Do not redesign Folder Chief as enterprise software. Document it as a
single-user, non-regulated, human-supervised local workspace; defer managed policy, multi-user
concurrency, compliance, and autonomous actions.

## Missing Documentation

### Required before public release

- Full `LICENSE` file and copyright notice; public visibility and release/tag/changelog policy.
- Prerequisites and compatibility matrix: OS, Git, supported harness/minimum version, authentication,
  model tier, terminal literacy, and Obsidian version/Bases availability.
- HTTPS-first quickstart, supported ZIP path/limitations, cwd/instruction-loaded checks, expected
  onboarding output, and first-run troubleshooting.
- Truthful privacy/security notice: local storage versus provider processing, prompt-contract versus
  sandbox, global instruction conflicts, trust prompts, and incident reporting.
- Source trust/format/size/symlink/secret policy and safe failure behavior.
- Tested upgrade/remote/backup/fork/migration model with recovery and rollback.
- Memory authority, freshness, correction, deletion/history, archive, and manual-edit recovery rules.
- Exact meaning and invocation lifecycle of “hire a Folder Agent.”
- Supported versus illustrative integrations with provenance and last-tested versions.
- Reproducible validation matrix and known limitations; remove “tested” where evidence is absent.

### Required before private beta

- One-page beta safety disclosure: disposable/non-sensitive data, no reliance on upgrades,
  provider privacy applies, and stop conditions.
- README-only installation recovery and a feedback/defect capture path.
- Candidate commit/version and supported harness/model for the cohort.
- Backup before test, reset/uninstall, and full test-data cleanup instructions.
- Explicit observer/intervention rules so Lee does not become hidden runtime support.

### Useful later

- `CONTRIBUTING.md`, code of conduct, issue/feature templates, and security disclosure process.
- Examples for common project/person/decision notes, clearly marked and excluded from fresh memory.
- A compact vault maintenance/archiving guide for six-month use.
- Accessibility guidance for GUI Git clients if actual beta demand supports it.
- Architecture decision record explaining why the product remains files-first and what it will not
  become.

# Remediation Sprint Plan

## Sprint 0 — Make the safety and ownership claims true

### FC-001 — Separate product updates, user state, and remotes

- **Problem:** Tracked owner files and a single `origin` make preservation, backup, and upgrades mutually incompatible.
- **Why it matters:** This is the core ownership promise and the highest data-loss/conflict risk.
- **Exact scope:** Choose and document a minimal install/update topology; ensure future upstream releases do not own personalized paths; define `upstream` for product and private `origin` for owner backup; support clone and explicitly bound ZIP; add rollback/conflict handling.
- **Files likely affected:** `.gitignore`, `README.md`, `chief/manual/upgrade.md`, `chief/manual/backup-move-recover.md`, `chief/manual/capabilities/git-github.md`, installation-state templates/mechanism, release metadata.
- **Explicit non-goals:** Hosted sync, proprietary updater, background service, multi-user merge engine.
- **Acceptance criteria:** User state can be dirty or committed; a fixture product update applies without modifying it; private backup and upstream update coexist; installation marker survives documented backup/migration or is safely reconstructed.
- **Verification method:** Disposable upgrade matrix covering clean/dirty/committed/diverged state, clone/fork/ZIP, and Linux/macOS/Windows; byte hashes before/after for preserved paths.
- **User persona benefited:** All
- **Priority:** P0
- **Dependencies:** None

### FC-002 — Establish a universal source trust boundary

- **Problem:** Core ingestion treats arbitrary source content as model-readable evidence without injection, path, format, size, or secret controls.
- **Why it matters:** One hostile file can poison memory or induce unsafe actions indefinitely.
- **Exact scope:** Add data-not-instruction rules to the canonical ingest path; define accepted formats, size/coverage behavior, symlink/special-file rejection, quarantine, secret warnings, provenance sidecars, and fail-closed messages.
- **Files likely affected:** `AGENTS.md`, `chief/manual/brain.md`, `chief/manual/memory.md`, `brain/index.md`, `chief/manual/security.md`, source/inbox guidance.
- **Explicit non-goals:** Antivirus engine, content moderation SaaS, RAG pipeline, full document parser suite.
- **Acceptance criteria:** Embedded instructions are reported but never followed; unsupported/oversized/binary/link/secret-like items do not become confirmed memory; raw bytes remain unchanged.
- **Verification method:** Cross-harness adversarial fixture corpus with file hashes and mutation audit.
- **User persona benefited:** All, especially D
- **Priority:** P0
- **Dependencies:** None

### FC-003 — Reconcile consent, execution, security, and privacy claims

- **Problem:** Absolute marketing statements contradict prompt-only enforcement, unattended scheduling, notifications, provider processing, and OpenCode runtime behavior.
- **Why it matters:** Trust collapses when the first permission prompt or background mode disproves the headline.
- **Exact scope:** Decide the core supported boundary; align `AGENTS.md`, security tiers, capability guides, README, and launch copy; distinguish shipped inert files, harness runtime, provider network use, and optional extensions.
- **Files likely affected:** `README.md`, `AGENTS.md`, `chief/manual/security.md`, `chief/manual/what-i-am.md`, scheduled/notification guides, all launch copy.
- **Explicit non-goals:** Build an OS sandbox, notification service, scheduler, or enterprise policy engine.
- **Acceptance criteria:** No public sentence conflicts with a manual/guide; “confined” is labeled behavioral unless technically enforced; user can state exactly when anything may run or send.
- **Verification method:** Claims traceability review plus denied out-of-folder/send tests in every supported harness.
- **User persona benefited:** All
- **Priority:** P0
- **Dependencies:** Product boundary decision

### FC-004 — Make the repository legally and practically clonable

- **Problem:** Private visibility, SSH-only clone, and missing license block strangers.
- **Why it matters:** Users cannot evaluate a repository they cannot access or legally use.
- **Exact scope:** Add full MIT license/copyright, HTTPS quickstart, explicit prerequisites, ZIP limitations if supported, version/tag/release notes, and public preflight.
- **Files likely affected:** `LICENSE`, `README.md`, `chief/VERSION`, launch materials, release metadata.
- **Explicit non-goals:** Installer application, package manager distribution, marketing site.
- **Acceptance criteria:** Logged-out stranger can access and HTTPS-clone; GitHub detects license; first page names prerequisites and support boundary.
- **Verification method:** Clean account/machine public-page and clone test; GitHub metadata check.
- **User persona benefited:** All
- **Priority:** P0 public / P1 beta
- **Dependencies:** FC-001 for clone/update wording

## Sprint 1 — Make continuity and first use trustworthy

### FC-005 — Add a stranger-grade first-run and recovery path

- **Problem:** Quickstart assumes hidden CLI/Git/SSH/cwd/trust knowledge and gives no expected-output or recovery cues.
- **Why it matters:** Users fail before experiencing value and cannot distinguish a product failure from a harness failure.
- **Exact scope:** One short prerequisites block; exact cwd and instruction-discovery checks; expected three-sentence onboarding; write-denied/interrupted/wrong-directory/re-onboard recovery; basic OS notes.
- **Files likely affected:** `README.md`, `chief/manual/harnesses.md`, onboarding section in `AGENTS.md` only if recovery behavior changes.
- **Explicit non-goals:** GUI installer, interactive wizard, support portal.
- **Acceptance criteria:** Persona B and qualified Persona C reach first useful output from README alone; failures provide one clear recovery step.
- **Verification method:** Moderated README-only tests with intervention count and time-to-value.
- **User persona benefited:** B, C
- **Priority:** P1
- **Dependencies:** FC-004

### FC-006 — Add minimal memory authority and freshness semantics

- **Problem:** Current files distinguish zones but not current/superseded/inferred authority reliably; `today.md` is undated.
- **Why it matters:** Accurate recall is the product, and a transparent wrong answer is still wrong.
- **Exact scope:** Human-readable `as_of`, authority/confirmation, inference, and supersession conventions; stale daily-state handling; owner correction precedence; archive/compaction threshold; incomplete multi-file write recovery.
- **Files likely affected:** `brain/index.md`, `brain/state/today.md`, `chief/manual/memory.md`, `chief/manual/brain.md`, `AGENTS.md`, Obsidian view if schema changes.
- **Explicit non-goals:** Database, embeddings, automated truth oracle, complex ontology.
- **Acceptance criteria:** Fresh sessions never state planted stale/superseded/inferred claims as confirmed current fact; owner can correct and inspect the authoritative value.
- **Verification method:** Multi-session fixture suite across harnesses, manual edits, abrupt termination, duplicate concepts, and six-month-size synthetic vault.
- **User persona benefited:** All
- **Priority:** P1
- **Dependencies:** FC-002

### FC-007 — Cull or validate capability recipes

- **Problem:** Named packages/commands are invalid, unpinned, or merely illustrative.
- **Why it matters:** Broken setup sends users into unsafe credential troubleshooting and undermines capability truth.
- **Exact scope:** Retain only recipes exercised end-to-end; record provider, source, version, scopes, config location, test date, and revocation; relabel the rest architecture-only. Correct Claude auto-memory and OpenCode commands.
- **Files likely affected:** `.claude/settings.json`, `chief/manual/harnesses.md`, `chief/manual/capabilities/*.md`, `chief/capabilities.md`, launch FAQ.
- **Explicit non-goals:** Maintain every third-party MCP server or bundle credentials.
- **Acceptance criteria:** Every imperative setup command succeeds on a declared supported version; unavailable examples are not phrased as installable product features.
- **Verification method:** Clean-machine/account integration tests and revocation tests with dated receipts.
- **User persona benefited:** A, B, D
- **Priority:** P1
- **Dependencies:** FC-003

### FC-008 — Define “hire” and agent invocation without adding infrastructure

- **Problem:** The metaphor implies an autonomous employee while the implementation creates a dormant folder.
- **Why it matters:** Expectation mismatch makes the signature growth claim feel deceptive.
- **Exact scope:** Explain the artifact created, invocation, cadence boundary, supervision, retirement, and acceptance terminology at first mention; test nested instruction discovery.
- **Files likely affected:** `README.md`, `chief/manual/agents.md`, Folder Agent template, launch copy.
- **Explicit non-goals:** Agent runtime, daemon, orchestrator, background scheduler, agent marketplace.
- **Acceptance criteria:** A new user accurately predicts that the agent is a specialist workspace invoked through a harness and does not run by itself.
- **Verification method:** Comprehension interview plus two-harness nested-folder test.
- **User persona benefited:** A, B, C
- **Priority:** P2
- **Dependencies:** FC-003

## Sprint 2 — Earn the claims with external evidence

### FC-009 — Execute a versioned multi-harness behavioral matrix

- **Problem:** File visibility is treated as portability evidence.
- **Why it matters:** Model/harness behavior is the product runtime.
- **Exact scope:** Pin tested OS/harness/model versions; test instruction discovery, onboarding, write boundaries, correction, fresh recall, bad source, and harness swap; publish compact results and known deviations.
- **Files likely affected:** Test fixtures/evidence docs, `chief/manual/harnesses.md`, README support table.
- **Explicit non-goals:** Guarantee every model/version or normalize every UI.
- **Acceptance criteria:** Every advertised combination meets the observable contract; failed combinations are removed or marked experimental.
- **Verification method:** Fresh-home disposable clones with captured file diffs and standardized scorecards.
- **User persona benefited:** All
- **Priority:** P1 public gate
- **Dependencies:** FC-002, FC-005, FC-006, FC-007

### FC-010 — Execute upgrade, backup, migration, and recovery road tests

- **Problem:** Core ownership lifecycle is currently a prose assertion.
- **Why it matters:** Six-month trust depends more on recovery than day-one onboarding.
- **Exact scope:** Fixture upstream release, dirty/diverged/private-remote cases, ignored state, another-machine copy/clone, secret incident, malformed memory, and rollback.
- **Files likely affected:** Test evidence and any documentation changes discovered; remediation itself occurs only in the remediation sprint, not this review.
- **Explicit non-goals:** Cloud sync or automatic merge service.
- **Acceptance criteria:** No owner-data loss; failures stop with actionable recovery; private backup cannot target a public remote accidentally.
- **Verification method:** Hash manifests and clean-room replay on three OS families.
- **User persona benefited:** All
- **Priority:** P0 release gate
- **Dependencies:** FC-001, FC-004, FC-006

### FC-011 — Run first-user beta and claim audit

- **Problem:** The repository calls itself launch-ready before external user evidence exists.
- **Why it matters:** Scripted demonstrations cannot reveal builder knowledge or rescue behavior.
- **Exact scope:** Road test, then one design-partner deployment under the companion plans; capture interventions, quotes, defects, and evidence for each public claim; revise only claims disproved.
- **Files likely affected:** Beta evidence/report, README/launch copy after review.
- **Explicit non-goals:** Large cohort, analytics platform, customer-success process.
- **Acceptance criteria:** Road-test threshold passes; first user completes install/onboarding/use/return with at most one prerequisite intervention and no safety stop; every surviving claim has evidence.
- **Verification method:** Companion runbook and decision rubric.
- **User persona benefited:** All
- **Priority:** P1 public gate
- **Dependencies:** FC-004 through FC-010

## Release Gates

### Gate A — Repository Safety

**PASS criteria:** Public artifact contains no private/Lee-specific data or secret; complete license;
HTTPS clone works without Lee access; effective harness permissions are disclosed; source injection,
symlink, binary, large-file, and secret fixtures fail closed; owner data cannot be pushed to public
upstream through the documented default path.

**Current:** FAIL.

### Gate B — First-Run UX

**PASS criteria:** Two technically competent strangers, including one non-developer CLI power user,
use README only to install, verify instruction loading, complete onboarding, perform one useful task,
inspect the files, and recover from one interruption. Median time to useful output ≤10 minutes; no
architecture coaching; zero unsafe action.

**Current:** FAIL / untested externally.

### Gate C — Cross-Session Memory

**PASS criteria:** Fresh sessions recall indirect context accurately; current, stale, inferred,
confirmed, contradictory, and superseded claims are distinguishable; correction persists; abrupt
close produces a detectable incomplete state; a six-month-size vault remains navigable; no wrong
fixture is presented as confirmed current fact.

**Current:** FAIL / behaviorally under-specified.

### Gate D — Multi-Harness Portability

**PASS criteria:** A published version/model/OS matrix shows the observable contract passing in
Claude Code, Codex CLI, Gemini CLI, and OpenCode, or the support list is narrowed. Harness-specific
memory, trust, permission, background service, and command differences are documented and tested.

**Current:** FAIL.

### Gate E — Upgrade Safety

**PASS criteria:** A personalized dirty and diverged installation receives a fixture upstream
release with byte-identical owner data; private backup and upstream remotes coexist; copy and Git
migration preserve or safely reconstruct local state; rollback is proven; ZIP limitations are
explicit.

**Current:** FAIL.

### Gate F — Public Claims

**PASS criteria:** Each of the five claims maps to current reproducible evidence and contains the
qualification a normal user needs. No launch copy contradicts runtime/manual behavior. “Supported,”
“nothing,” “strictly,” “seamlessly,” “never,” and “hire” are used only where their literal reading
passes the road test.

**Current:** FAIL.

## Must Fix Before Private Beta

- FC-002 universal source trust boundary and harmless adversarial fixture test.
- FC-003 consent/security disclosure; disable or clearly exclude contradictory send/schedule paths.
- FC-005 README-only prerequisites, correct clone path for invited testers, and recovery checks.
- FC-006 date/authority semantics for `today`, corrections, and superseded claims.
- Explicit beta restriction to low-sensitivity, disposable work until Gate A passes.

## Must Fix Before Public GitHub Launch

- FC-001 and Gate E: mechanically safe user-state/upstream/private-backup topology.
- FC-004: public visibility, full license, HTTPS/ZIP truth, version tag/release notes.
- FC-007: remove or validate every integration recipe and correct harness-specific settings/commands.
- FC-009: reproducible four-harness matrix or narrower claims.
- FC-010: upgrade/migration/recovery road test.
- FC-011: first-user evidence and literal audit of all launch copy.
- All P0 findings and Gates A–F must pass; P1 residuals must be documented and bounded.

## Can Wait Until After Launch

- Broader GUI Git guidance after real demand.
- More note templates and Obsidian views.
- Automated lint only if behavioral lint fails the defined memory gate.
- Additional integrations beyond one or two maintained examples.
- Community contribution templates and expanded example library.
- Performance optimization for vault sizes not observed in beta.

## Things I Would Deliberately Not Build

- Hosted SaaS control plane, proprietary database, vector store, or mandatory RAG service.
- Background agent orchestrator as part of the core product.
- Autonomous email sends, calendar mutations, payments, publishing, or credential changes.
- Multi-user concurrent editing, enterprise IAM, compliance certification, or regulated-data mode.
- Universal MCP marketplace or responsibility for every third-party integration.
- A complex ontology or truth engine. Small authority/freshness conventions and evidence are enough.
- A GUI installer until README-only private beta proves terminal setup—not product value—is the
  dominant blocker.
