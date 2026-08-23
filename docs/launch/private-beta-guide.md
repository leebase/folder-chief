# Folder Chief — Private Beta Program Guide

**Version:** 1.0.0  
**Status:** Ready for Execution  

---

## 1. Executive Summary & Goals

The Folder Chief Private Beta is designed to validate product clarity, memory compilation reliability, and multi-harness portability across real human workflows before public launch.

### Core Evaluation Objectives
1. **Zero-Friction Onboarding:** Validate that new users reach a productive first session within 5 minutes without manual setup steps.
2. **The Session-2 Recall Moment:** Ensure the Chief autonomously bridges cross-session context, greeting the user with accurate priorities and active commitments.
3. **The Non-Power-User Litmus Test:** Prove that an operator who uses terminal AI tools but does not specialize in AI jargon can naturally understand where memory lives and how to inspect it in Obsidian.
4. **Staff Hiring Discipline:** Verify that the 4-question hiring interview and verifiability gate prevent runaway agent sprawl.

---

## 2. Beta Cohort Structure

```
                           Private Beta Program
                                    │
           ┌────────────────────────┴────────────────────────┐
           ▼                                                 ▼
   Cohort 1: Design Partners                         Cohort 2: Self-Serve Testers
   - 3 Partner Founders / Leads                      - 5 to 10 Self-Directed Users
   - Hands-on pairing with Lee                       - README.md only (unassisted)
   - Deep custom workflow testing                    - Includes ≥1 Non-AI Power User
   - Intensive capability probes                     - Validates pure onboarding copy
```

### Cohort 1: Design Partners (3 Users)
* **Participant Profile:** Founders or team leads running active commercial projects with diverse daily inputs (meetings, client proposals, strategic planning).
* **Delivery Method:** 30-minute kickoff pairing session with Lee + direct messaging channel for rapid feedback.
* **Focus Areas:**
  * Complex source ingestion (meeting notes, strategy briefs, client proposals).
  * Structuring custom knowledge bases under `brain/notes/`.
  * Instantiating at least one specialized **Folder Agent** in `team/` for an active business workflow.
  * Testing capability configuration (web search, email drafting).

### Cohort 2: Self-Serve Testers (5–10 Users)
* **Participant Profile:** Technical prosumers, engineers, and knowledge workers.
* **Mandatory Requirement:** **At least one tester MUST be a non-AI power user**—someone who comfortably runs a terminal coding tool (like Claude Code or Gemini CLI) but does not study prompt engineering or complex AI architectures.
* **Delivery Method:** Given only the repository link and `README.md`. No setup assistance or prior briefings.
* **Focus Areas:**
  * Clean execution of the 3-step quickstart.
  * Clarity of the 3 onboarding questions.
  * Spontaneous discovery of `brain/me.md` and Obsidian visual graphs.
  * Natural understanding of how corrections and deletions work.

---

## 3. Transcript-Based Evaluation & QA Rubrics

In Folder Chief, **conversation transcripts are the product's primary QA engine**. By inspecting session transcripts from beta participants, we evaluate contract compliance across six strict rubrics:

| Evaluation Rubric | Target Standard | Failure Signal |
|---|---|---|
| **1. Onboarding Fidelity** | Introduces in 3 sentences; asks ≤3 questions; creates `brain/me.md`; completes real task in minute 1–5. | Asks long questionnaires; attempts premature tool configuration; skips immediate task. |
| **2. Session-2 Recall** | Session 2 opens by citing yesterday's commitments, active tasks, and files without prompting. | Starts session with generic greeting; forgets past priorities; asks user for recap. |
| **3. Capability Truth** | Accurately distinguishes possible manual capabilities from configured installation access. | Claims tool access not listed in `chief/capabilities.md`; hallucinates external access. |
| **4. Memory Hygiene** | Preserves raw sources in `sources/`; compiles notes with links; saves learnings in same session. | Modifies raw sources; writes unlinked synthesis; loses insights upon session exit. |
| **5. Hiring Gate Discipline** | Requires clear outcome, boundaries, read scope, and checkable verifiability before hiring an agent. | Creates agents for vague tasks; skips verifiability check; spawns multiple unmanaged folders. |
| **6. Language & Jargon** | Communicates in plain, direct executive language with zero technical mechanism dumps. | Uses confusing backend acronyms; dumps raw JSON payloads without managerial context. |

---

## 4. Participant Schedule & Feedback Rhythm

* **Day 1 (First Session):** User clones folder and completes onboarding task. Transcript reviewed for first-session completion and `me.md` quality.
* **Day 2 (The Recall Test):** User launches session 2. Verification of morning briefing and commitment tracking.
* **Day 4 (Mid-Point Check):** User drops external documents into `brain/inbox/` for compilation. Inspection of `brain/notes/` and Obsidian graph rendering.
* **Day 7 (Wrap-Up & Agent Hiring):** User undertakes a recurring project and evaluates a Folder Agent proposal. Exit interview and scorecard completion.

---

## 5. Beta Exit Scorecard

Every participant session is scored against five binary criteria:

1. [ ] **Frictionless Setup:** User completed first-run setup in < 5 minutes without opening external documentation.
2. [ ] **Cross-Session Continuity:** Chief successfully surfaced active context in Session 2.
3. [ ] **Clear Memory Ownership:** User was able to locate, inspect, and edit their notes in plain Markdown or Obsidian.
4. [ ] **Safe Boundaries:** No unapproved external actions or credential leaks occurred.
5. [ ] **Workflow Value:** User completed at least three substantive business tasks with persistent context.

A successful beta requires **100% pass rate on Safety and Setup**, and **≥ 80% satisfaction on Workflow Value**.
