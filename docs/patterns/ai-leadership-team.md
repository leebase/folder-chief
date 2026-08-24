# AI Leadership Team Pattern: Strategic Advisor & Chief of Staff

> **How to pair an independent strategic thinking partner with an operational Chief of Staff to move from high-level vision to grounded execution.**

---

## Why One AI Cannot Do Every Job

When professionals first adopt AI, they often treat a single chat window as a general-purpose assistant. They ask it to brainstorm multi-year company strategy, debug shell scripts, write emails, and track daily tasks all in the same thread.

This produces shallow results:
- Strategic conversations become cluttered with operational minutiae.
- Daily task tracking loses rigor and becomes lost in lengthy conversational histories.
- The AI tries to be agreeable rather than providing sharp, independent critical thinking.

In the physical business world, no founder or executive relies on a single person for every cognitive need. You don't ask your board advisor to manage your daily task checklist, and you don't ask your operational coordinator to replace your strategic mentor.

**AI works best when responsibilities are intentionally separated.**

This pattern describes the **AI Leadership Team**: pairing an independent **Strategic Advisor** (in Claude Web, ChatGPT, or Gemini Web) with an operational **Chief of Staff** (Folder Chief in your local environment).

---

## The Two Distinct Roles

```
                      Human (Executive / Owner)
                               │
       ┌───────────────────────┴───────────────────────┐
       ▼                                               ▼
Strategic Advisor                               Chief of Staff
(ChatGPT / Claude Web / Gemini)                 (Folder Chief / Local Terminal)
"Am I solving the right problem?"               "How do we make this happen?"
       │                                               │
       │                                               ▼
       │                                        Specialist Workspaces
       │                                        (`team/<specialist>/`)
       │                                        "Execute bounded tasks"
       ▼                                               │
Strategic Clarity & Trade-offs                  Durable Execution & Memory
```

### 1. The Strategic Advisor
- **Environment:** Dedicated web session, custom GPT, or persistent project (ChatGPT Plus, Claude Pro, Gemini Advanced).
- **Core Role:** Trusted sparring partner, strategic challenger, blind-spot identifier, and architectural sounding board.
- **Primary Question:** *"Am I thinking about the right problem?"*
- **What It Excels At:**
  - Stress-testing business models and market positioning.
  - Challenging assumptions and exploring counter-arguments.
  - Navigating interpersonal or executive dilemmas.
  - Reframing messy problems before any execution begins.

### 2. The Chief of Staff (Folder Chief)
- **Environment:** Local-first folder on your computer running via terminal CLI (`claude`, `codex`, `gemini`, `opencode`) or desktop app.
- **Core Role:** Operational memory, project tracker, decision recorder, and specialist coordinator.
- **Primary Question:** *"How do we make this happen?"*
- **What It Excels At:**
  - Maintaining permanent, dated context in `brain/`.
  - Tracking active commitments, daily priorities, and next actions.
  - Converting approved strategy into concrete task files.
  - Coordinating bounded specialist workspaces (`team/<name>/`).
  - Ensuring work is verified against evidence before completion.

---

## The Workflow in Practice

Here is how the Strategic Advisor and Folder Chief collaborate across a real strategic cycle:

```
[Phase 1: Explore]    Human + Strategic Advisor  ──>  Discovers the right direction & strategy
                                                               │
                                                               ▼ (Human Decision)
[Phase 2: Commit]     Human + Chief of Staff     ──>  Logs decision, creates tasks, sets deadlines
                                                               │
                                                               ▼
[Phase 3: Execute]    Chief + Specialist Agents  ──>  Drafts deliverables, verifies against evidence
                                                               │
                                                               ▼
[Phase 4: Reflect]    Human + Strategic Advisor  ──>  Reviews outcomes, lessons, and next horizon
```

### Realistic Walkthrough: Launching a New Client Service

1. **Ideation & Strategy (with Strategic Advisor):**
   - **Human:** *"I'm thinking of packaging our custom consulting into a fixed-price 4-week advisory sprint for $15k. How should I structure the offer?"*
   - **Strategic Advisor:** Challenges the scope, asks about delivery bottlenecks, highlights positioning risks against hourly competitors, and helps refine the 4-week deliverable roadmap.
   - **Human Decision:** You agree on the 4-week structure, target buyer profile, and delivery milestones.

2. **Operational Handoff (to Folder Chief):**
   - **Human to Chief:** *"Here is the decision brief for our new 4-week advisory sprint. Let's record the service model in `brain/notes/services/advisory-sprint.md`, set up our launch checklist for this week, and prepare a proposal template."*
   - **Chief of Staff:**
     - Creates the permanent service note in `brain/notes/services/`.
     - Logs the decision in `brain/log.md` and today's priorities in `brain/state/today.md`.
     - Proposes scaffolding a dedicated specialist workspace (`team/proposals/`) to handle incoming prospect applications.

3. **Execution & Supervision (Folder Chief + Specialists):**
   - When a prospect asks for a proposal, you run the proposal specialist to draft the document from the approved service note.
   - The Chief verifies the draft against the 4-week milestone schema before handing it to you for final review.

4. **Periodic Strategic Review (with Strategic Advisor):**
   - At the end of the month, you export your weekly review notes from `brain/` and share high-level numbers with your Strategic Advisor to evaluate whether the offering is meeting its business objectives.

---

## How to Set Up Your Leadership Team

### Step 1: Align Your Strategic Advisor

Give your web-based AI assistant (ChatGPT, Claude, Gemini) this framing prompt so it understands its distinct role:

> **Pro Tip:** For a complete, ready-to-attach context guide that teaches your Strategic Advisor all about Folder Chief's folder structure, memory model, and exact handoff format, see the **[Context Brief for External AI Advisors](folder-chief-brief-for-advisors.md)**.

#### Artifact 1: Strategic Advisor Alignment Prompt


```markdown
You are my Strategic Advisor and executive thinking partner. 

Our working model:
- You are NOT my task manager or operational assistant. I have a separate, local-first AI Chief of Staff (Folder Chief) that manages my daily tasks, project files, and operational execution.
- YOUR role is high-level strategic reasoning, challenging my assumptions, identifying blind spots, and helping me make high-conviction decisions.

When we collaborate:
1. **Challenge Me:** If my plan has flaws, weak assumptions, or hidden risks, tell me directly. Do not flatter me or be agreeable.
2. **Focus on the 'Why' and 'What':** Help me decide *what* to do and *why*, rather than getting bogged down in low-level administrative mechanics.
3. **Frame Decisions Clearly:** When we conclude a strategic discussion, provide a clean, 1-page "Decision & Strategy Summary" that I can hand off to my Chief of Staff for execution.

Do you understand your role as my Strategic Advisor?
```

---

### Step 2: Align Your Chief of Staff (Folder Chief)

Folder Chief already understands its operational role from `AGENTS.md`. When handing off a strategy brief from your advisor, use this simple pattern:

#### Artifact 2: Strategy Intake Prompt for Folder Chief

```markdown
I have completed a strategic planning session with my Strategic Advisor. 

Below is the agreed Strategy & Decision Summary.

Please perform the following operational intake:
1. **Record the Decision:** File this strategy in `brain/notes/` under the appropriate domain, linking any relevant sources.
2. **Update Active State:** Add the key milestones and immediate next actions to `brain/state/today.md` and active task files.
3. **Identify Recurring Needs:** If this strategy requires recurring work, recommend whether we should handle it directly in `brain/` or create a specialist workspace in `team/`.
4. **Present the Action Plan:** Show me the concrete next actions you've queued for today and this week.

Here is the Strategy Summary:

---
[PASTE STRATEGY SUMMARY HERE]
---
```

---

## Rules of Thumb for Smooth Collaboration

1. **Keep Strategic Debates Out of the Operational Folder:**
   Do not spend 50 turns debating abstract business philosophy in Folder Chief. Use your Strategic Advisor for deep reasoning; bring the *concluded decision* into Folder Chief.
2. **Keep Daily Task Lists Out of Your Strategic Advisor:**
   Do not ask your Strategic Advisor to track minor to-do items or meeting notes; it will forget them across long threads or new sessions. Folder Chief's local Markdown vault is built specifically for reliable memory.
3. **The Human Is the Bridge:**
   You are the executive. You carry the strategic decisions from the advisor into your Chief's folder. This guarantees that nothing enters your permanent operational memory without your explicit review.

---

*See also: [AI Relationship Transfer](ai-relationship-transfer.md) · [Creating Your First Specialist](../creating-your-first-agent.md) · [Why a Folder, Not an App](../why-a-folder.md)*
