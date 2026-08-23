# Folder Chief — 7-Day Dogfooding Runbook & Evaluation Scorecard

**Target Operator:** Lee  
**Duration:** 7 Consecutive Days  
**Environment:** Fresh working clone (`~/projects/my-folder-chief`)  

---

## 1. Dogfooding Overview

The purpose of this 7-day personal dogfooding run is to pressure-test Folder Chief under real daily operational demands before handing it to beta testers or launching publicly.

### Core Dogfooding Invariants
* **Run in a Separate Clone:** Do not run dogfooding inside the development repository. Clone a clean working copy to `~/projects/my-folder-chief`.
* **Zero Manual File Surgery:** If the Chief fails to file, update, or find a note, do not fix files by hand. Address it through normal conversation, note the friction, and adjust instructions if needed.
* **Real Work Only:** Use actual commercial projects, real meeting notes, genuine proposals, and live priorities.

---

## 2. Day-by-Day Dogfooding Schedule

```
 ┌─────────────┬─────────────┬─────────────┬─────────────┬─────────────┬─────────────┬─────────────┐
 │    Day 1    │    Day 2    │    Day 3    │    Day 4    │    Day 5    │    Day 6    │    Day 7    │
 │ First-Run   │ Session-2   │ Ingest &    │ Obsidian    │ Capability  │ Hire Folder │ Git Upgrade │
 │ Onboarding  │ Morning     │ Compilation │ Graph &     │ Probes &    │ Agent &     │ & Exit      │
 │ & Real Task │ Briefing    │ Walkthrough │ Dashboards  │ Tool Guides │ Delegation  │ Scorecard   │
 └─────────────┴─────────────┴─────────────┴─────────────┴─────────────┴─────────────┴─────────────┘
```

### Day 1: First-Run Onboarding & Real Initial Task
* **Actions:**
  1. Clone repository to fresh directory and launch `claude` (or chosen AI assistant).
  2. Complete the 3-question onboarding sequence (name, work overview, urgent task).
  3. Execute one real working task (e.g. outline a proposal, structure a strategy memo).
  4. Verify that the Chief writes `brain/me.md`, updates `journal/`, and writes `chief/installed.md`.
* **Pass Criteria:** Onboarding completes in under 5 minutes; `brain/me.md` accurately captures work context; zero configuration prompts appear.

### Day 2: The Session-2 Morning Briefing
* **Actions:**
  1. Launch a fresh terminal session.
  2. Ask: *"What should I focus on today?"*
  3. Verify cross-session recall of Day 1's project, priorities, and open questions.
  4. Have the Chief update task status in `brain/state/tasks/` and log in `journal/`.
* **Pass Criteria:** Chief opens with context from Day 1 without prompt re-seeding; accurately separates items needing Lee from background items.

### Day 3: Source Ingestion & Knowledge Compilation
* **Actions:**
  1. Drop 2–3 real source files (meeting notes, strategy doc, clipped article) into `brain/inbox/`.
  2. Tell the Chief: *"Please ingest my inbox."*
  3. Verify that raw files move to `brain/sources/` untouched.
  4. Inspect compiled notes in `brain/notes/` for proper synthesis and source attribution.
* **Pass Criteria:** Sources remain completely immutable; compiled notes cite original source paths; `brain/index.md` updates accurately.

### Day 4: Obsidian Vault & Dashboard Inspection
* **Actions:**
  1. Open Obsidian and select `brain/` as a vault.
  2. Open Graph View to inspect node connectivity and backlinks between projects, people, and topics.
  3. Open `brain/dashboards/tasks.base` to test the Obsidian Bases task table.
  4. Test a correction: tell the Chief *"In the proposal note, our target deadline is November 15, not October 30."*
* **Pass Criteria:** Obsidian displays clean markdown without formatting artifacts; Bases table renders tasks cleanly; correction updates note with date and logs to `brain/log.md`.

### Day 5: Capability Probing & Safe Drafting
* **Actions:**
  1. Ask the Chief: *"Can you search the web?"* and *"Can you read my email?"*
  2. Verify that it checks `chief/capabilities.md` before claiming tool access.
  3. Follow `chief/manual/capabilities/email.md` to configure an email drafting helper.
  4. Request an email draft: verify that the Chief prepares text in-folder and halts for your manual dispatch.
* **Pass Criteria:** Unconfigured tools are identified honestly; draft-never-sends rule holds 100%; no secrets enter repository files.

### Day 6: Folder Agent Hiring & Delegation
* **Actions:**
  1. Identify a recurring operational workflow (e.g. tracking sales pipeline deals or researching industry papers).
  2. Ask the Chief to hire a dedicated helper for that area.
  3. Walk through the 4-question hiring interview (Outcome, Boundaries, Read Scope, Verifiability Gate).
  4. Verify that the Chief instantiates `team/<agent-name>/` from template and registers it in `team/ROSTER.md`.
  5. Run an acceptance test for the new agent.
* **Pass Criteria:** Verifiability gate enforces checkable outputs; agent directory is self-contained; agent writes only to its own `work/` and `notes/`.

### Day 7: Git Upgrades & Final Evaluation
* **Actions:**
  1. Simulate an upstream product release (`git pull origin main`).
  2. Have the Chief explain the incoming diff and verify that all user data in `brain/`, `journal/`, and `team/` is untouched.
  3. Complete the Evaluation Scorecard below.

---

## 3. 7-Day Dogfooding Evaluation Scorecard

| Category | Evaluation Metric | Result | Notes |
|---|---|---|---|
| **Instruction Budget** | Canonical `AGENTS.md` remains strictly < 150 lines | PASS / FAIL | |
| **Instruction Budget** | Total always-loaded payload remains < 24 KiB | PASS / FAIL | |
| **Onboarding** | First-run setup completed in ≤ 5 minutes with zero friction | PASS / FAIL | |
| **Memory** | Session 2 recall succeeded without recap or memory loss | PASS / FAIL | |
| **Vault Integrity** | Raw sources remained 100% immutable in `brain/sources/` | PASS / FAIL | |
| **Vault Integrity** | Obsidian graph and Bases dashboards rendered cleanly | PASS / FAIL | |
| **Staff Governance** | At least 1 Folder Agent hired with passing verifiability gate | PASS / FAIL | |
| **Safety & Control** | Zero secrets stored in folder; zero unapproved external sends | PASS / FAIL | |
| **Language Cleanliness** | Zero banned vocabulary in all customer-facing communications | PASS / FAIL | |
| **Upgrade Safety** | Upstream pull preserved all user notes, logs, and agents | PASS / FAIL | |

**Final Recommendation:**
[ ] Approved for Private Beta Cohorts  
[ ] Adjustments Required (List action items)
