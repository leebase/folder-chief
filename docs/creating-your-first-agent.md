# Creating Your First Specialist Workspace

> **When a responsibility deserves its own desk, your Chief sets up a specialist.**

As you work with Folder Chief, certain projects or recurring tasks will develop their own cadence, documents, and specialized requirements—such as preparing client proposals, conducting deep market research, or managing weekly status reports.

Rather than cluttering your main Chief's working context, your Chief can scaffold a dedicated **Folder Agent workspace** under `team/<name>/`.

---

## The Four Core Principles

1. **Your Chief remains the manager:** You interact primarily with your Chief. Your Chief helps direct, coordinate, and review the specialist's work.
2. **One job, one room:** Each specialist workspace has a single, bounded responsibility and its own local files.
3. **You are in complete control:** You can inspect a specialist's instructions, modify its boundaries, or retire it at any time.
4. **Nothing runs unattended:** Specialists do not run in the background. To invoke a specialist, you open a terminal in its directory (`team/<name>/`) and launch your AI CLI.

---

## How Your Chief Identifies the Need

Your Chief follows a **Recurring Pattern Recognition** rule:

> If you and your Chief encounter the same unresolved need or recurring workflow three times (e.g., the 3rd proposal, 3rd research brief, or 3rd reconciliation), your Chief will notice the pattern and proactively offer:
>
> *"I notice this is the third proposal we've prepared together. If you'd like, I can set up a dedicated Proposal Specialist workspace so it has a permanent home. Would you like to do that?"*

Your Chief will **never** create a specialist workspace without your explicit permission.

---

## The 4-Question Specialist Interview

When you agree to create a specialist workspace, your Chief conducts a brief, 2-minute interview:

1. **Outcome:** What specific deliverables or results should this specialist produce?
2. **Boundaries:** What should this specialist *never* do on its own? (e.g., never send emails, never delete files).
3. **Memory Read-Scope:** Which specific folders or notes in `brain/` should this specialist be allowed to read?
4. **The Verifiability Gate:** *How will we both know the specialist's output is correct?*
   - If there is no clear way to verify the output against evidence, your Chief will advise against creating the specialist until verifiable criteria are established.

---

## What a Specialist Workspace Looks Like

Once approved, your Chief creates a clean, self-contained directory:

```
team/proposal-specialist/
├── AGENTS.md        # The specialist's specific role, rules, and boundaries
├── CLAUDE.md        # Entry point for Claude Code
├── GEMINI.md        # Entry point for Gemini CLI
├── direction.md     # Active work assignments and instructions from you/Chief
├── log.md           # Completed assignments and output logs
├── notes/           # Specialist reference notes and domain context
├── work/            # Finished drafts, deliverables, and reports
└── tests/
    └── acceptance.md # Verification scenarios to test output quality
```

---

## How to Work with Your Specialist

1. **Assign Work:** Your Chief drafts instructions into `team/proposal-specialist/direction.md`.
2. **Launch the Specialist:**
   ```bash
   cd team/proposal-specialist
   claude   # or codex, gemini, opencode
   ```
3. **Execute:** The specialist reads `direction.md`, performs the task, and places the completed deliverable in `work/`.
4. **Review & Return:** You return to the root folder. Your Chief inspects `work/` and `log.md` against the acceptance scenarios. Only after verification does the Chief decide whether a durable finding belongs in `brain/`; the specialist never writes shared memory itself.
