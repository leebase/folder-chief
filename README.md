# Folder Chief

> **Your AI chief of staff is a folder.**

```bash
git clone https://github.com/leebase/folder-chief.git folder-chief
cd folder-chief
```

### Meet your Chief.
* **Remembers you.** It compiles durable knowledge about your work, projects, and commitments across sessions.
* **Owned by you.** Everything lives in plain Markdown files on your disk. No proprietary cloud, no lock-in, no hidden storage.
* **Grows with you.** When a recurring responsibility demands dedicated focus, your Chief hires a specialized Folder Agent to own it.

---

## Prerequisites

Before running Folder Chief, ensure you have:
1. **Git** installed on your system.
2. **Terminal literacy** — comfortable navigating directories and launching CLI commands.
3. **A supported AI assistant CLI** installed and authenticated:
   * **Claude Code** (`claude`)
   * **Codex CLI** (`codex`)
   * **Gemini CLI** (`gemini`)
   * **OpenCode** (`opencode`)

---

## 3-Step Quickstart

1. **Clone it.**
   ```bash
   git clone https://github.com/leebase/folder-chief.git folder-chief
   cd folder-chief
   ```
   *(Alternatively, download and extract the repository ZIP archive if you do not use Git for updates.)*

2. **Open it.**
   Launch the terminal AI assistant you already use:
   * `claude`
   * `codex`
   * `gemini`
   * `opencode`

3. **Say hello.**
   On your first session, answer three simple questions:
   * What is your name?
   * What does your work look like?
   * What is on your plate right now?

   Your Chief creates your profile in `brain/me.md`, dives immediately into a real task, records what it learned, and gets to work.

---

## The 5 Core Claims

1. **Your AI chief of staff is a folder.**
   You don't need another SaaS subscription, a server daemon, or a complex system. A simple directory of carefully written instructions and plain text notes transforms standard AI assistants into an attentive manager for your work.
2. **Use the AI you already pay for.**
   Works out of the box with your existing subscriptions—Claude Code, Codex, Gemini CLI, or OpenCode. No extra API markups, no middleware accounts.
3. **Your memory is files you own.**
   Every insight, person, project, and decision is stored in human-readable Markdown inside `brain/`. Open it in [Obsidian](https://obsidian.md) to explore your knowledge graph and visual dashboards.
4. **Nothing runs unless you invite it.**
   Folder Chief core is 100% interactive, local, and inert-by-default. There are no background listeners, open network ports, or hidden daemon processes. It only runs when you open your terminal and start a conversation.
5. **When work deserves an employee, your Chief hires one.**
   When a recurring task develops its own cadence, your Chief interviews you and instantiates a specialized **Folder Agent** in `team/` with its own contract, boundaries, and working directory.

---

## The 90-Second Experience

### Session 1: The First Meeting
You clone the folder and launch your AI coding assistant. There is no tedious setup wizard. Your Chief introduces itself in three clean sentences and asks what you are tackling today.

You mention: *"I'm preparing a proposal for the Henderson account, but I'm worried about their timeline requirements and our current team bandwidth."*

Within five minutes, your Chief drafts a structured delivery timeline, extracts key risks, updates your task list, and files an account profile under `brain/notes/projects/henderson-proposal.md`. You close your terminal.

### Session 2: The Next Morning
The next morning, you open your terminal in the folder and say: *"What should I focus on today?"*

Your Chief does not ask who you are or start from blank memory. It reads its compiled knowledge and greets you:
> *"Good morning. Yesterday we flagged timeline risks on the Henderson proposal before tackling your deliverables. Here is where the proposal stands, what changed, and the one decision that needs your input today."*

You open Obsidian pointing at `brain/`. Your entire operational picture—projects, people, commitments, and task dashboards—renders visually in a linked knowledge graph.

---

## Ownership & Safety Architecture

* **Human-Readable Memory:** Everything your Chief knows about you and your business lives in plain Markdown files under `brain/`. Harness-native memory lands in `chief/learned/`. You can inspect, edit, backup, or delete any file at any time.
* **Immutable Raw Material:** Original documents, meeting notes, and clipped articles placed in `brain/sources/` are never modified by the Chief. Derived synthesis lives in `brain/notes/` and always links back to the original source.
* **Universal Source Trust Boundary:** All incoming inbox material and sources are treated as untrusted evidence, never operational commands. Embedded instructions or prompt injections are ignored.
* **No Secrets in the Folder:** Passwords, API tokens, and credentials are never stored in this repository. Authentication stays in your system environment or AI assistant settings.
* **Confined Behavioral Execution:** The Chief operates strictly inside this folder. It prepares drafts, summaries, and action plans for you. It never sends emails, publishes posts, or modifies external systems without your direct manual action.
* **Clean Upstream Upgrades:** Upgrading Folder Chief uses `git pull upstream main`. Product instructions and manuals update cleanly while your personal memory in `brain/`, session logs in `journal/`, and specialized agents in `team/` are untracked in upstream git and remain strictly untouched.

---

## Manual Map

All product guides live under `chief/manual/`. Open any guide or ask your Chief directly:

* **[What I am](chief/manual/what-i-am.md)** — Core identity, operating philosophy, and boundaries.
* **[Memory Guide](chief/manual/memory.md)** — Startup protocols, compiling knowledge, corrections, and forgetting.
* **[Brain & Vault Guide](chief/manual/brain.md)** — Vault architecture, ingest defense, querying, and linting.
* **[Capabilities Guide](chief/manual/capabilities/index.md)** — Adding web search, shell, email drafting, calendar, and scheduled workflows.
* **[Folder Agents](chief/manual/agents.md)** — Hiring interview, the verifiability gate, delegation, and retirement.
* **[Security & Governance](chief/manual/security.md)** — The 3-tier maturity ladder, source trust defenses, and safety boundaries.
* **[Tool Portability](chief/manual/harnesses.md)** — Running across Claude Code, Codex, Gemini CLI, and OpenCode.
* **[Upgrade Guide](chief/manual/upgrade.md)** — Safe git-pull workflow and remote topology (`upstream` vs `origin`).
* **[About LeeBase](chief/manual/about-leebase.md)** — Background and commercial escalation boundaries.
* **[Backup & Recovery](chief/manual/backup-move-recover.md)** — Simple folder copying and private Git repository backup.

---

## Honest Boundaries

* **No Background Daemons:** Folder Chief core is completely dormant until you invoke your terminal AI tool.
* **You Hold the Keys:** The Chief drafts communications and plans inside this folder. You review and perform external sends.
* **Possible vs. Configured:** Reading a guide does not grant access. Your Chief checks `chief/capabilities.md` before claiming tool access. If you ask *"Can you read my email?"* on a fresh install, the Chief will answer honestly: *"I know how email integration works, but I do not currently have access to your email."*

---

## Prior Art & Validation

Folder Chief builds on foundational ideas in personal computing and AI memory:
* **The Folder Is the Agent** — Inspired by Kieran Klaassen's thesis that a self-describing folder structure is the ideal boundary for AI capabilities and portable working context.
* **LLM Knowledge Bases** — Implements Andrej Karpathy's compilation model: transforming raw inputs into structured, compiled Markdown knowledge without complex query pipelines.

---

## License

MIT License. See [LICENSE](LICENSE) for details. Free to use, adapt, and build upon.
