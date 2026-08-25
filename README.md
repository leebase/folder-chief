# Folder Chief

> **Your AI chief of staff is a folder.**

## Start Here

You are about to meet your AI Chief of Staff.

It lives in this folder. It runs on the AI tools you already use—whether in your terminal (Claude Code, Codex CLI, Gemini CLI, OpenCode) or in a supported desktop AI app with folder access—so Folder Chief itself adds no server or background daemon. When you open it, it asks three questions, learns what you're working on, and starts helping today. When you return, it re-enters from the files it saved.

Everything it learns durably about you is written in plain Markdown in `brain/`, with session operations in `journal/`. You can open, edit, back up, or delete those files. Folder Chief never sends or publishes on your behalf, but a cloud AI harness processes the prompts and files it reads under that provider's terms, and configured external reads send queries to those services. Deleting the folder removes the local copy; provider retention, synced copies, and backups remain governed separately.

That's the whole idea: **an AI colleague whose durable working memory belongs to you.**

Current product marker: **`1.0.0`** in [`chief/VERSION`](chief/VERSION). The default branch also
contains clearly labeled post-baseline work; see the [change history](CHANGELOG.md).

---

## The First Five Minutes

Getting started takes less than two minutes:

1. **Get the folder:**
   ```bash
   git clone https://github.com/leebase/folder-chief.git
   cd folder-chief
   ```
   *(Or download and unzip the repository archive).*

2. **Open with your preferred AI tool:**
   - **Terminal CLI:** Open your terminal in the directory (`cd folder-chief`) and launch `claude`, `codex`, `gemini`, or `opencode`.
   - **Desktop AI app or IDE:** Point a supported app with workspace-folder access at `folder-chief`. Verify instruction loading as described in the [harness guide](chief/manual/harnesses.md).

3. **Say hello:**

   Your Chief will introduce itself and ask:
   - What is your name?
   - What does your work look like?
   - What is your top priority today?

4. **Let your Chief help configure itself:**
   Answer naturally. Your Chief will set up its own memory files (`brain/me.md`, `brain/state/today.md`, and `brain/log.md`), display your profile, and immediately get to work on your priority task.

---

## What Just Happened

Open `brain/me.md` in any text editor.

You will see what your Chief learned about you on turn one. This is how memory works in Folder Chief:

- **It writes from owner-directed evidence:** It captures what you share, files you provide, and sources you explicitly ask a configured capability to inspect.
- **Zero secrets stored:** It never writes passwords, tokens, or API credentials into notes.
- **You are always the editor:** If a note is incomplete or wrong, edit the Markdown file directly. Your Chief will read and respect your changes on its next turn.
- **Sessions close into files:** Say *"wrap"* or *"done for today"* and your Chief records the operational journal, refreshes the dated re-entry brief, and tells you what it persisted.
- **Visual Knowledge Graph (Optional):** Prefer visual navigation? Open `brain/` as an [Obsidian](https://obsidian.md) vault to explore your Chief's memory as an interactive visual graph.

*Learn more in [Setting Up Your Chief](docs/setting-up-your-chief.md), [Patterns & Playbooks](docs/patterns/README.md), and [Using with Obsidian](docs/using-with-obsidian.md).*



---

## Your First Week

Folder Chief is designed to turn from a quick novelty into a daily habit across five short sessions:

| Day | You Do | Your Chief Does | What You Can Inspect |
|---|---|---|---|
| **Day 1: Meet** | Answer 3 questions and name today's priority | Sets up initial memory, handles your first task | `brain/me.md`, `brain/state/today.md` |
| **Day 2: Return** | Ask: *"What should I focus on today?"* | Re-enters from saved files; asks before rolling stale state | `brain/state/today.md`, today's journal |
| **Day 3: Projects** | Describe 3–5 active projects; drop notes in `brain/inbox/` | Compiles structured notes with source links | `brain/notes/projects/*.md` |
| **Day 4: Trust** | Make an intentional correction to a project date | Dates and supersedes old claims; records a lesson after a behavioral correction | `brain/log.md`, `brain/notes/`, `chief/learned/` |
| **Day 5: Grow** | Ask: *"What recurring patterns have we handled?"* | Identifies repetitive work; offers a weekly ritual | First Weekly Review or specialist |

*Follow the complete walkthrough in [Your First Week](docs/your-first-week.md).*

---

## When Your Chief Hires a Specialist

When a recurring responsibility demands dedicated focus—such as preparing client proposals, weekly market research, or financial reconciliations—your Chief notices the pattern and offers to set up a dedicated **Folder Agent workspace** under `team/<name>/`:

> **You:** *"We have three more client proposals to write this month."*
>
> **Chief:** *"I've noticed this is the third proposal we've prepared together. If you'd like, I can set up a dedicated Proposal Specialist workspace under `team/proposals/` so it has its own instructions and templates. Would you like to do that?"*

The four rules of specialist workspaces:
1. **The Chief stays the manager:** You talk to your Chief; your Chief directs the specialist.
2. **One job, one room:** Each specialist has its own bounded directory and specific role.
3. **You stay in control:** You can inspect its instructions, adjust its boundaries, or retire it anytime.
4. **Nothing runs unattended:** You run a specialist by opening a terminal in its folder and launching your CLI.

*Learn how specialist workspaces work in [Creating Your First Specialist](docs/creating-your-first-agent.md).*

---

## What It Will Never Do

- **Never sends messages on its own:** It drafts emails, documents, and code inside this folder; you review and execute external sends yourself.
- **Never stores passwords or keys:** API tokens and credentials stay in your environment, never in files.
- **Never runs a core background daemon:** Core behavior occurs only in an opened interactive harness. Scheduled runs are separate, explicitly configured Tier 2 extensions.
- **Never modifies original source files:** Dropped notes in `brain/sources/` remain immutable evidence.
- **Never pretends to have access it lacks:** If you ask *"Can you read my email?"*, it answers honestly: *"I know how email integration works, but I do not currently have access to your email."*

*Read our full [Privacy, Security & Data Ownership](docs/privacy-and-ownership.md) guide.*

---

## Why a Folder, Not an App?

| Dimension | ChatGPT Custom GPT | Claude Project | Generic Web Chat | SaaS AI Assistant | **Folder Chief** |
|---|---|---|---|---|---|
| **Data Ownership** | Vendor cloud | Vendor cloud | Vendor cloud | Proprietary database | **Plain files on your disk** |
| **Continuity** | Opaque vendor memory | Project-bound | None across chats | Vendor database | **Session-2 recall in `brain/`** |
| **Transparency** | Black box | Partially visible | None | Closed database | **`ls brain/` shows everything** |
| **Portability** | Locked to OpenAI | Locked to Anthropic | Locked to one provider | Locked to SaaS | **Interchangeable across CLIs & Desktop Apps** |
| **Relationship** | Generic assistant | Document assistant | Chatbot | Basic helper | **Chief of staff that manages work** |
| **Software cost** | Provider-dependent | Provider-dependent | Provider-dependent | Provider-dependent | **MIT-licensed; AI harness/model costs are separate** |

*Read the in-depth comparison in [Why a Folder, Not an App](docs/why-a-folder.md).*

---

## Getting Help

1. **Ask your Chief:** Your Chief knows its entire manual (`chief/manual/index.md`). Ask it anything about memory, capabilities, or setup.
2. **Community Support:** Join [GitHub Discussions](https://github.com/leebase/folder-chief/discussions) or open an issue on [GitHub Issues](https://github.com/leebase/folder-chief/issues).
3. **AI Concierge:** Some people prefer help setting up their Chief around their business—[LeeBase AI Concierge](docs/getting-help.md) provides hands-on setup and customization services.

---

## Under the Hood

Folder Chief is built on a simple architecture: **the folder is the agent**. The canonical behavioral contract lives in `AGENTS.md`, self-model documentation lives in `chief/manual/`, and personal knowledge compiles into structured Markdown in `brain/`. Always-loaded instructions are budgeted under 24 KiB for fast startup and compatibility across AI tools. Maintainers should also read the [developer guide](docs/for-developers.md) and [change history](CHANGELOG.md).


*Read the technical documentation in [For Developers](docs/for-developers.md).*

---

## Prior Art · License

Folder Chief builds upon foundational ideas in personal computing:
- **The Folder Is the Agent** — Inspired by Kieran Klaassen's thesis that self-describing folder structures provide the ideal boundary for AI context.
- **Compiled Markdown Knowledge Bases** — Implements Andrej Karpathy's compilation model for personal knowledge management.

Distributed under the [MIT License](LICENSE). Free to use, adapt, and build upon.
