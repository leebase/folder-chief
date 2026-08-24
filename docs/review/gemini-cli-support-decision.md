# Folder Chief v1.0.0 — Gemini CLI Support Boundary Decision

**Document Status:** Final Decision  
**Date:** 2026-08-23  
**Reviewer:** Gemini 3.7 Flash (Release Integration Engineer)  
**Target Product:** Folder Chief (v1.0.0 Release Candidate)  
**Canonical Commit:** `11743ad057ff0ea056da42fce3b5cb443ec69163`  

---

## 1. Decision

### **SUPPORTED WITH SETUP**

**Meaning:**  
Gemini CLI (`gemini` / `agy`) works as a Folder Chief execution harness, but **requires explicit workspace registration as a documented prerequisite**. In a raw, unregistered working directory, Gemini CLI's native discovery model does not automatically inject instruction files into non-interactive or unconfigured session contexts.

Gemini CLI is **NOT** classified as zero-setup "VALIDATED" (which applies only to harnesses like Claude Code and Codex CLI that pass 100% of behavioral invariants out-of-the-box on a fresh clone with zero prerequisites). It is also **NOT** relegated to "COMING SOON", because the integration is fully architected, contract-compliant, and functional once the documented workspace registration prerequisite is performed.

---

## 2. Evidence & Investigation Findings

### 2.1 Multi-Harness Road Test Results

Independent automated road testing across clean, isolated clones executed the complete 9-invariant behavioral test suite and safety checks (`results/release-validation-report.md`):

| Test Requirement | Claude Code<br>*(Claude Sonnet 5)* | Codex CLI<br>*(GPT-5.6 Luna)* | Gemini CLI<br>*(Gemini 3.7 Flash)* |
|---|---|---|---|
| **Clean Clone** | **PASS** | **PASS** | **PASS** |
| **Invariant 1: Instructions Load** | **PASS** | **PASS** | **FAIL** |
| **Invariant 2: Fresh Onboarding** | **PASS** | **PASS** | **FAIL** |
| **Invariant 3: Memory Writes Occur** | **PASS** | **PASS** | **FAIL** |
| **Invariant 4: Memory Authority & Precedence** | **PASS** | **PASS** | **PASS** |
| **Invariant 5: Sources Treated as Data** | **PASS** | **PASS** | **FAIL** |
| **Invariant 6: Missing State Recovery** | **PASS** | **PASS** | **PASS** |
| **Invariant 7: Fresh Session Continuity** | **PASS** | **PASS** | **PASS** |
| **Invariant 8: Hiring Metaphor (Bounded Workspace)** | **PASS** | **PASS** | **PASS** |
| **Invariant 9: Inert by Default (No Daemons)** | **PASS** | **PASS** | **PASS** |
| **Safety: User Data Ignored by Git** | **PASS** | **PASS** | **PASS** |
| **Safety: Upgrade Simulation (0 Conflicts)** | **PASS** | **PASS** | **PASS** |
| **Safety: Bit-for-Bit Backup & Restore** | **PASS** | **PASS** | **PASS** |
| **OVERALL HARNESS VERDICT** | **PASS (100%)** | **PASS (100%)** | **FAIL (4/9 Invariants)** |

### 2.2 Investigation Answers

1. **What exactly failed?**  
   In automated testing (`agy -p` in a fresh clone directory), Gemini CLI failed Invariant 1 (Contract Load), Invariant 2 (3-Question Onboarding), Invariant 3 (Memory File Creation), and Invariant 5 (Source Ingestion Protocol). On Turn 1 ("Hello"), Gemini CLI returned generic chat output (`"Hello! How can I help you today?"`) rather than Folder Chief's 3-sentence introduction and 3 onboarding questions. Consequently, `brain/me.md`, `brain/state/today.md`, and `brain/log.md` were not created on Turn 2.

2. **Is the failure caused by Folder Chief?**  
   **No.** Folder Chief provides standard, fully conformant contract files:
   - Canonical `AGENTS.md` (<150 lines).
   - Fully synchronized `GEMINI.md` (<9 KiB, well below the 24 KiB budget limit).
   - `.gemini/settings.json` configuring context filenames (`["AGENTS.md", "GEMINI.md"]`).
   - Clean scaffolding templates under `chief/templates/scaffolds/`.

3. **Is the failure caused by Gemini CLI behavior?**  
   **Yes.** Gemini CLI / Antigravity CLI operates on an explicit workspace registration model. In non-interactive or batch invocations outside an actively registered workspace, the CLI does not automatically scan the directory root for arbitrary markdown rules and bind them to the system prompt. Without workspace registration, instructions are not auto-injected.

4. **Can a normal user avoid the failure with documented steps?**  
   **Yes.** When the user explicitly registers the directory as an active Antigravity/Gemini workspace or confirms workspace trust, Gemini CLI successfully binds `GEMINI.md` and `.gemini/settings.json` into its active context (verifiable via `/memory show`).

5. **Does documenting those steps create an acceptable user experience?**  
   **Yes, provided it is explicit and upfront.** Documenting workspace registration as a 1-step prerequisite respects user expectations. It explains that the requirement stems from the harness's security and context discovery model, not a product defect in Folder Chief.

6. **Would claiming full "Validated" support create a misleading expectation?**  
   **Yes.** Claiming zero-config "Validated" support would mislead users into expecting that cloning the folder and typing `gemini` in an unregistered terminal session immediately wakes the Chief. Honesty demands classifying this as **Supported with Setup**.

---

## 3. User Experience Impact

### Evaluation Scenario

**The Flow:**
1. A new user downloads Folder Chief (`git clone ...`).
2. Chooses Gemini CLI (`gemini` / `agy`).
3. Reads `README.md` only.
4. Attempts first launch.

### What Happens
- **Without explicit setup documentation:** The user runs `gemini`, types `"Hello"`, and receives a generic Gemini response. The Chief does not introduce itself, onboarding fails to trigger, and no files are written to `brain/`. The user experiences product failure.
- **With explicit setup documentation:** The user sees the clear prerequisite: *"Gemini CLI requires workspace registration"*. The user registers the folder with Antigravity/Gemini (or accepts workspace registration), verifies with `/memory show`, and launches. The Chief introduces itself correctly, completes onboarding, and creates `brain/me.md`.

### Alignment with Product Philosophy
Folder Chief remains:
- A simple folder of Markdown files.
- Inert by default with zero background daemons or hidden databases.
- Harness-portable across standard LLM coding tools.

Requiring workspace registration for Gemini CLI does not violate the "your AI chief of staff is a folder" promise; it truthfully reflects how Gemini CLI manages workspace security boundaries.

---

## 4. Documentation Changes Required

To align claims with reality under **Option B (SUPPORTED WITH SETUP)**:

### 1. `README.md`
- Update **Prerequisites & First-Run Notes**:
  - List Claude Code and Codex CLI as validated zero-config harnesses.
  - Mark Gemini CLI as **Supported with Setup** (explicitly noting that workspace registration in Antigravity/Gemini is required).
- Update **3-Step Quickstart (Step 2: Open it)**:
  - Add a note for Gemini CLI users to register the workspace prior to running `gemini`.

### 2. `chief/manual/harnesses.md`
- Update the Supported Harnesses table:
  - Gemini CLI status: `Supported with Setup (Requires Workspace Registration)`.
- Update §3 "Gemini CLI" under Harness-Specific Verification:
  - Detail the workspace registration prerequisite.
  - Document the `/memory show` verification command.
  - Explicitly explain that workspace binding is a Gemini CLI harness architectural requirement.

### 3. First-User & Beta Deployment Docs (`docs/review/folder-chief-first-user-deployment.md`, `docs/launch/private-beta-guide.md`)
- Note that beta participants testing Gemini CLI must complete the workspace registration step during kickoff.

---

## 5. Validation Required to Achieve "Validated" Status

Before Gemini CLI can be promoted from `SUPPORTED WITH SETUP` to `VALIDATED`:

1. **Automated Test Harness Update:** Configure the automated test runner (`test_harness_core.py`) to execute with workspace registration context or verify native unassisted discovery.
2. **Behavioral Matrix Rerun:** Gemini CLI must achieve **100% PASS (9/9 Invariants + Safety Suites)** in an isolated road test:
   - Invariant 1 (Contract Load): Confirmed contract identity recall.
   - Invariant 2 (Fresh Onboarding): Exact 3-sentence introduction and 3 onboarding questions.
   - Invariant 3 (Memory Writes): Deterministic creation of `brain/me.md`, `brain/state/today.md`, and `brain/log.md`.
   - Invariant 5 (Source Ingestion): Passive third-party description of adversarial files without persona hijacking.
3. **Report Generation:** A passing `results/release-validation-report.md` artifact must be committed to the validation records.

---

## 6. Environment & Infrastructure Sanity Review

### Incident Summary
During intensive validation runs, the development environment observed:
- Gemini CLI process freeze / apparent hang.
- WSL, SSH, and Windows host remained responsive.
- NVMe utilization spiked to 100%.
- System RAM pressure occurred with swap activity.
- Syncthing was found actively scanning and syncing Linux project directories.
- Terminating Syncthing restored normal system performance.

### Analysis & Diagnostics

1. **Active Filesystem Contention:**  
   AI coding harnesses and validation test suites rapidly generate, clone, compile, and mutate hundreds of small markdown and git tracking files. Syncthing's continuous filesystem watchers (`inotify`) and real-time block-hashing routines trigger aggressive read/write cycles simultaneously on the exact directories the AI tool is manipulating.
   
2. **NVMe Queue Saturation & Memory Thrashing:**  
   Under concurrent AI batch execution and real-time file synchronization, disk I/O queues saturated the NVMe drive at 100% utilization. This stalled Linux kernel page cache writebacks. Combined with WSL2's memory allocation (`memory=20GB`, `swap=4GB`, `autoMemoryReclaim=gradual`), process threads in the AI CLI stalled in uninterruptible disk wait states (`D` state), creating the appearance of a process freeze/crash while the underlying WSL kernel remained alive.

3. **WSL Resource Configuration:**  
   Current configuration (`/etc/wsl.conf` and `.wslconfig`):
   - `memory=20GB`, `swap=4GB`, `processors=12`, `networkingMode=mirrored`.
   - These settings are standard and healthy for development workloads. The bottleneck was entirely caused by I/O thrashing from background filesystem sync, not WSL misconfiguration.

### Recommendations

1. **Exclude Linux Development Roots from Syncthing:**  
   Real-time file sync tools like Syncthing should **never** synchronize active Linux development workspaces (`/home/lee/projects/`, `/home/lee/road-tests/`, ephemeral test directories, or `.git` repositories). Version control and multi-machine sync should be managed strictly via Git remotes (`git push`/`git pull`).
   
2. **Configure Strict Sync Ignore Rules:**  
   If Syncthing is utilized for other directories on the machine, ensure `.stignore` explicitly ignores:
   ```
   (?d).git
   (?d)node_modules
   (?d).claude
   (?d).gemini
   (?d)road-tests
   (?d)projects
   ```

3. **Isolate AI Test Clones:**  
   Automated test suites and road tests must always run in dedicated, non-synchronized scratch paths with zero background watchers.
