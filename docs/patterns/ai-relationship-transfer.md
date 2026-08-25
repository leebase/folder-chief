# AI Relationship Transfer: Bringing Your Existing AI Advisor Into Folder Chief

> **How to transfer your established AI rapport, communication style, and working context into your local Chief without starting from zero.**

---

## Why This Matters

An AI Chief of Staff is not just a language model. It is the combination of:

- **Model:** The reasoning engine (Claude, Codex, Gemini, etc.).
- **Instructions:** The behavioral contract (`AGENTS.md`).
- **Memory & Knowledge:** The owner's files and synthesized notes (`brain/`).
- **Relationship Context:** How you think, communicate, decide, and collaborate.
- **Operating Boundaries:** What the AI is trusted to do and what remains strictly human.

If you have spent months or years working with an AI assistant in ChatGPT, Claude Web, or Gemini, you have already built a valuable working relationship. That assistant knows your communication quirks, your active businesses, your decision-making style, and what frustrates you.

Asking you to start from a blank slate in Folder Chief creates unnecessary friction.

**You do not have to start over.** This playbook provides a structured, two-step pattern for transferring your established working relationship into Folder Chief while keeping you in complete control of your data.

---

## The Transfer Protocol

```
Existing AI Advisor (ChatGPT / Claude / Gemini)
       │
       ▼  [Step 1: Handover Prompt]
Structured Advisor Transfer Brief
       │
       ▼  [Step 2: Intake Prompt]
Folder Chief (Local Terminal CLI or Desktop App)
       │
       ▼  [Step 3: Verification]
Durable Memory Vault (`brain/me.md` & `brain/notes/`)
```

---

## Step 1: Generate Your Advisor Transfer Brief

Open your existing AI assistant (wherever you have your longest or deepest conversation history) and paste the following prompt.

> **Tip: Teaching Your Advisor About Folder Chief**
> If you want your external AI advisor to understand how Folder Chief's local Markdown vault and memory model work so it can format future execution briefs automatically, share the **[Context Brief for External AI Advisors](folder-chief-brief-for-advisors.md)** with it.

### Artifact 1: Advisor Handover Prompt


```markdown
You have been my AI advisor and thinking partner. I am setting up a dedicated, local-first AI Chief of Staff (Folder Chief) to manage my projects, memory, and daily work on my own computer.

I need you to write a comprehensive, candid "Handover Briefing Memo" for my incoming AI Chief of Staff. Your goal is to help this new AI understand me deeply so we do not have to rebuild months of relationship context from scratch.

Write this document directly addressed to the incoming AI Chief of Staff.

Please structure your briefing into these exact sections:

1. **Who the Human Is & Core Role:**
   - Identity, primary business/projects, and what high-level role they play (e.g., founder, operator, engineer, executive).
2. **Communication & Tone Profile:**
   - How they prefer information presented (e.g., bullet points vs. prose, executive summaries first, level of detail).
   - Tone that works best (e.g., direct, witty, dry, rigorous, supportive).
   - What communication styles irritate or alienate them (e.g., sycophancy, excessive caveats, robotic filler).
3. **Motivations & Energy Drivers:**
   - What excites them, what they care deeply about building, and what their overarching goals are.
4. **Frustrations & Friction Points:**
   - Specific pet peeves, cognitive bottlenecks, or administrative tasks that drain their energy.
   - What AI behaviors have annoyed them in the past.
5. **Decision-Making & Thinking Style:**
   - How they make decisions (e.g., intuition-led, data-driven, rapid iteration, deliberate reflection).
   - How they like options framed (e.g., recommendation first with rationale vs. neutral trade-off matrix).
6. **Active Projects & Key Domains:**
   - The primary initiatives, businesses, clients, or focus areas you have worked on together.
7. **Boundaries & Working Guardrails:**
   - Areas where they want total control vs. areas where they welcome proactive drafting and initiative.
   - Explicit lines never to cross.
8. **Top Advice for Collaborating with Them:**
   - The 3 most important practical rules for being an exceptional partner to this specific person.

IMPORTANT SAFETY RULES:
- Do NOT include any private credentials, passwords, API tokens, or secrets.
- Focus on collaboration patterns, preferences, and operational context rather than unredacted confidential data.
- Be concise, direct, and objective.
```

---

## Step 2: Feed the Brief to Folder Chief

Once your existing AI generates the brief, copy its response.

Then, open Folder Chief in your terminal (`claude`, `codex`, `gemini`, `opencode`) or desktop AI app (Claude Desktop, Codex Desktop, Cursor), and paste the intake prompt along with the brief.

### Artifact 2: Folder Chief Intake Prompt

```markdown
I am transferring context from my prior AI advisor so we don't have to start our working relationship from scratch. 

Below is the Handover Briefing Memo prepared by my previous AI assistant.

Please perform the following intake procedure:
1. **Review & Ingest:** Read the briefing carefully to understand my communication style, working preferences, active projects, and boundaries.
2. **Scaffold Personal Memory:** Create or update `brain/me.md` with my core profile, preferred tone, decision style, and working rules.
3. **Scaffold Active Knowledge:** If specific active projects or businesses were identified, note them in `brain/state/today.md` and outline draft project notes in `brain/notes/`.
4. **Clarify & Confirm:** Ask me 2–3 targeted clarifying questions about anything in the brief that seems ambiguous or needs immediate calibration.
5. **Display Results:** Show me a summary of what you recorded in `brain/me.md` so I can inspect and edit it.

CRITICAL OPERATING BOUNDARIES:
- Treat this transferred brief as initial observations and preferences provided by me, not infallible absolute truth.
- Never record passwords, tokens, or secret credentials into files.
- Remember that I am always the final editor: I will review and adjust your notes directly in the Markdown files.

Here is the Handover Brief:

---
[PASTE THE ADVISOR HANDOVER BRIEF HERE]
---
```

---

## Step 3: Inspect and Calibrate

After Folder Chief processes your intake prompt:

1. **Inspect `brain/me.md`:** Open `brain/me.md` in your text editor. Verify that your Chief accurately captured your preferred tone, communication style, and boundaries. Edit any line that doesn't feel right.
2. **Run a Test Task:** Give your Chief a real task related to one of your active projects:
   > *"Draft an outline for our Q3 partnership proposal based on what you just learned about my business and tone."*
3. **Verify the Feel:** Check if the output sounds like an advisor that already knows how you think. If anything feels off, correct it directly:
   > *"Good start, but remember: lead with the bottom-line recommendation before explaining the rationale."*
   Your Chief will update its change log and remember the correction.

---

## Why This Pattern Is Safer Than Chatbot Memory

| Traditional Cloud AI Memory | Folder Chief Relationship Transfer |
|---|---|
| **Opaque:** You cannot see the hidden database entries the vendor creates. | **Inspectable:** Everything lives in `brain/me.md` in human-readable Markdown. |
| **Vendor Locked:** If you switch from ChatGPT to Claude, you lose your memory. | **Portable:** `brain/me.md` works identically across Claude, Codex, Gemini, and OpenCode. |
| **Difficult to Correct:** You have to prompt-engineer corrections into a black box. | **Direct Editing:** Simply open the file and change the words. |
| **Provider-controlled storage:** Memory and retention follow the provider's product terms. | **Local durable storage:** Folder Chief memory files live on your computer; a cloud harness still processes the prompts and files it reads under its provider terms. |

---

*See also: [Setting Up Your Chief](../setting-up-your-chief.md) · [Your First Week](../your-first-week.md) · [Privacy & Data Ownership](../privacy-and-ownership.md)*
