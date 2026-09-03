# Setting Up Your Chief of Staff

> **The core concept: Your Chief helps you set up your Chief.**

You do not need to fill out complex configuration files, manage databases, or write YAML frontmatter by hand. Setting up Folder Chief happens through natural conversations during your regular workday.

This guide explains what your Chief learns, how memory is stored, how you remain in complete control, and how to build long-term trust.

> **Tip: Coming from ChatGPT, Claude Web, or Gemini?**
> If you already have an established working relationship with an existing AI assistant, you don't have to start from scratch. See the **[AI Relationship Transfer Playbook](patterns/ai-relationship-transfer.md)** to transfer your communication style, working preferences, and active project context directly into Folder Chief.


---

## What Your Chief Learns

Everything your Chief knows about you lives inside the `brain/` folder in plain, human-readable Markdown:

- **Who you are (`brain/me.md`):** Your name, role, communication style, operating principles, and working preferences.
- **What you are doing today (`brain/state/today.md`):** Current daily priorities, active tasks, follow-ups, and open loops.
- **Your projects and knowledge (`brain/notes/`):** Synthesized profiles of your active projects, clients, team members, and reference materials.
- **Durable changes (`brain/log.md`):** A permanent, dated ledger of what was learned, corrected, or updated over time.
- **Session events (`journal/`):** Daily operational notes recording what happened, decisions, delegations, and open loops. Draft deliverables stay in an appropriate in-folder work or state path.

---

## What Belongs in Memory (and What Does Not)

### What Belongs in Memory
- Strategic priorities and active goals
- Project context, deadlines, and key deliverables
- Client, colleague, and stakeholder notes
- Decisions made and the rationale behind them
- Personal preferences on writing style, formatting, and analysis depth

### What Must NEVER Be Stored
- **Passwords, API keys, private tokens, or credentials**
- Credit card numbers, banking information, or financial account secrets
- Regulated confidential data (HIPAA, FINRA, or sensitive personal data)

Your Chief strictly adheres to a **zero-secrets policy**: it will never write secret credentials into the folder, and it will warn you if it detects secret-like patterns. Keep API keys and logins in your system environment or AI CLI configuration, never in text files.

---

## How You Control Memory

Your memory is 100% transparent and inspectable:

1. **Open the folder:** Use your terminal (`ls brain/`) or open the folder in any text editor (VS Code, Sublime Text, TextEdit, etc.).
2. **View in Obsidian (Optional):** Point [Obsidian](https://obsidian.md) at the `folder-chief` directory to view your notes as an interactive visual knowledge graph. See [Using with Obsidian](using-with-obsidian.md).
3. **Edit directly:** If you see something you want to change, edit the Markdown file directly. Your Chief will immediately read and respect your changes on its next turn.
4. **Offline Semantic Acceleration:** To recall facts and decisions across a growing vault without burning tokens reading dozens of files, your Chief uses a local, offline index (`sqlite-mem`). The index is purely a retrieval accelerator: your Markdown files remain the sole authority. If deleted, it can be reindexed directly from your Markdown notes.
5. **Delete to reset:**
   - Delete `brain/me.md` to reset your personal profile.
   - Delete `chief/installed.md` to trigger a fresh first-run onboarding session.
   - Delete the entire `folder-chief` directory to remove the local installation. Separately review any backups, synced copies, private remotes, and AI-provider retention.

## How Sessions Re-enter and Wrap

At the start of substantive work, the Chief reads `brain/me.md`, today's journal when present,
and `brain/state/today.md`. If `today.md` is stale, it asks before rolling priorities forward;
it does not silently present yesterday's state as current.

At the end of a session, say *"wrap"*, *"done"*, or *"good night"*. The Chief appends the day's
operational journal, refreshes `brain/state/today.md`, files durable learning, and confirms in one
line what it persisted. Behavioral corrections are first recorded in `chief/learned/` as
`observed-once`; a recurring correction becomes a promoted rule only with owner approval.

---

## How to Correct Mistakes

If your Chief ever misunderstands a fact or relies on outdated information, simply tell it:

> *"Actually, the Henderson proposal deadline moved to next month, not this Friday."*

Your Chief follows a strict **memory precedence hierarchy**:

$$\text{User Correction} > \text{Confirmed Fact} > \text{New Inference} > \text{Old Synthesis} > \text{Draft Claim} > \text{Superseded}$$

When you make a correction:
- It immediately updates the active note.
- It moves the outdated information to a dated `## Superseded` section or logs the update in `brain/log.md`.
- It never argues, never re-surfaces superseded claims as current truth, and never silently erases your historical record.

---

## Ownership, Updates, and Backups

Folder Chief separates the **product** from your **personal memory**:

- **Product Updates:** Fetch and inspect updates before applying `git pull origin main` (or `upstream main` for a fork). See the [upgrade guide](../chief/manual/upgrade.md).
- **Memory Protection:** Runtime owner data in `brain/`, `journal/`, `team/`, `chief/capabilities.md`, `chief/learned/`, and `chief/installed.md` is gitignored by the product repository. Keep a backup and review the incoming diff; local edits to tracked product files can still conflict.
- **Backing Up Your Memory:** Because personal files are gitignored, running `git push` on the product repository does not upload your notes. To back up your memory:
  - Copy or archive the complete `folder-chief/` directory, including hidden files.
  - A private, separate Git vault inside `brain/` adds note history but is not a complete installation backup.

See [Privacy & Ownership](privacy-and-ownership.md) and [Backup, Move, and Recover](../chief/manual/backup-move-recover.md) for the complete boundaries.
