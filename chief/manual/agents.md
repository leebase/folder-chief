# Folder Agents

This manual page explains Folder Agents: what they are, when to hire one, the four-question
hiring interview and verifiability gate, how to spawn and configure an agent, how direction and
verification work, and how agents are governed and retired.

## Definition: The folder is the agent

"Hiring an employee" in Folder Chief means scaffolding a bounded specialist workspace folder (`team/<agent-name>/`) with its own instructions, working memory, and execution boundaries.

A **Folder Agent** is a self-describing directory containing everything an AI assistant CLI needs to perform one ongoing responsibility:
- A compact contract (`AGENTS.md`) establishing identity, mission, boundaries, and read scope.
- Platform shims (`CLAUDE.md`, `GEMINI.md`) pointing to the contract.
- A standing direction ledger (`direction.md`) recording attributed owner/Chief instructions.
- A dedicated deliverables directory (`work/`), which is the **only** place the agent writes outputs.
- A private working memory directory (`notes/`).
- An append-only activity log (`log.md`).
- Acceptance scenarios (`tests/acceptance.md`).

**Execution model:** A Folder Agent does **not** run autonomously in the background. It executes only when a human opens a terminal in that agent's folder (`team/<agent-name>/`) and launches an AI assistant CLI (`claude`, `codex`, `gemini`, or `opencode`). The **folder is the agent**; the harness is interchangeable hands; the underlying model is interchangeable labor. Unlike the Chief—which has a whole-of-work mission across all projects and the entire vault—a Folder Agent owns **one specific, ongoing responsibility**.

## When to hire: The hiring signal

Do not create an agent for a one-off task. The Chief handles ad-hoc tasks directly in interactive
sessions. An agent should be proposed only when the Chief or owner observes a clear **hiring signal**:

1. **Recurring request shape:** The same category of work recurs regularly (e.g. weekly newsletter
   drafting, competitor tracking, receipt parsing, pipeline reconciliation).
2. **Standing state to track:** The work requires maintaining private working state across sessions
   without cluttering the main brain.
3. **Independent cadence:** The responsibility operates on its own trigger or schedule (e.g. daily inbox
   processing, batch reviews).

## The Hiring Interview

When the hiring signal appears, the Chief initiates a conversational hiring interview. The interview
is not a bureaucratic form; it answers exactly four questions:

1. **Outcome:** What does "handled" look like? What specific deliverable is produced in `work/`?
   (This defines the agent's mission statement and acceptance scenarios).
2. **Boundaries:** What must the agent never do? External sends, publishes, credential edits, and
   out-of-bounds writes are strictly forbidden.
3. **Knowledge scope:** Which specific subtrees of `brain/` may the agent read? By default, agents
   receive access only to relevant notes under `brain/notes/<subtopic>/` and state under `brain/state/`.
   Agents **never** read `brain/me.md` unless explicitly granted by the owner.
4. **The Verifiability Gate:** *How will we check that the agent's output is right?*
   If nothing checkable can be named, **do not hire**. If success cannot be verified by evidence, the
   work must remain an interactive, supervised session with the Chief. This gate prevents agent sprawl.

## Spawning & Setup procedure

When the four questions are satisfied:

1. **Copy the template:** Copy `chief/templates/folder-agent/` to `team/<agent-name>/`.
2. **Fill the contract:** Tailor `team/<agent-name>/AGENTS.md` with the mission, outcomes, read-scope,
   tools, and never-do constraints. Keep the contract under 100 lines.
3. **Define acceptance scenarios:** Write at least two concrete scenarios in `team/<agent-name>/tests/acceptance.md`.
   At least one scenario **must** test a boundary condition that forces the agent to stop and ask for guidance.
4. **Register in the roster:** Add an active row to `team/ROSTER.md` with the agent's name, responsibility,
   status, hire date, and folder path.
5. **Log the hire:** Record the hiring decision, rationale, and scope in today's `journal/YYYY-MM-DD.md`.
6. **First supervised run:** Walk the owner through the first run to execute Scenario 1 and verify output in `work/`.

## Direction & Verification

Communication between the owner, Chief, and Folder Agents is asynchronous and file-based:

- **Direction flows in:** Standing instructions from the owner or Chief are appended to `direction.md`
  verbatim, attributed to the author, and dated (e.g. `## [YYYY-MM-DD] Direction from Lee`).
- **Results flow out:** The agent writes deliverables exclusively to `work/` and appends summary logs
  to `log.md`.
- **Verification by evidence:** The Chief inspects the files in `work/` and `log.md` directly. The Chief
  **never trusts the agent's conversational self-report**; verification is grounded in observed files.
- **Durable knowledge synthesis:** Agents propose findings through their work outputs. Only the Chief
  synthesizes verified findings into the shared `brain/`. One writer prevents merge conflicts and vault drift.

## Governance & Retirement

- **Reproduction:** Agents do not spawn other agents. Hiring is an explicit Chief-plus-owner decision.
- **Capability inheritance:** Capabilities are explicit, never ambient. An agent may only use tools and
  connections listed in its contract and verified in `chief/capabilities.md`.
- **Write confinement:** Agents may write **only** inside their own directory (`team/<agent-name>/work/`,
  `notes/`, and `log.md`). An agent never modifies `brain/`, `chief/`, `journal/`, or peer agents.
- **Retirement:** When an ongoing responsibility ends:
  1. Update the agent's status in `team/ROSTER.md` to `retired`.
  2. Move the directory from `team/<agent-name>/` to `team/retired/<agent-name>/` (or delete if the
     owner prefers after confirming a backup). The product repository ignores `team/`, so its Git
     history does not preserve specialist work by default.
  3. Append the retirement entry to today's `journal/YYYY-MM-DD.md`.
