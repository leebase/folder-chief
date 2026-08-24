# Folder Chief

> **Your AI chief of staff is a folder.**

## Start Here

You are about to meet your AI Chief of Staff.

It lives in this folder. It runs on the AI tools you already use—whether in your terminal (Claude Code, Codex, Gemini CLI, OpenCode) or in desktop AI apps (Claude Desktop, Codex/ChatGPT Desktop, Cursor, VS Code) pointed at this folder—so there is nothing new to buy and no background servers running on your machine. When you open it, it will ask you three questions, learn what you're working on, and start helping today. Tomorrow it will remember.

Everything it learns about you is written in plain Markdown files in `brain/` that you can open, edit, or delete. Nothing leaves this folder unless you choose to send it. If you ever want to stop, simply delete the folder and it is gone.

That's the whole idea: **an AI colleague that belongs to you, not to a subscription service.**

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
   - **Desktop AI App:** Point Claude Desktop, Codex/ChatGPT Desktop, or Cursor/VS Code at the `folder-chief` folder as your workspace.

3. **Say hello:**

   Your Chief will introduce itself and ask:
   - What is your name?
   - What does your work look like?
   - What is your top priority today?

5. **Let your Chief help configure itself:**
   Answer naturally. Your Chief will set up its own memory files (`brain/me.md`, `brain/state/today.md`, and `brain/log.md`), display your profile, and immediately get to work on your priority task.

---

## What Just Happened

Open `brain/me.md` in any text editor.

You will see what your Chief learned about you on turn one. This is how memory works in Folder Chief:

- **It writes what you tell it:** It only captures what you share or documents you provide.
- **Zero secrets stored:** It never writes passwords, tokens, or API credentials into notes.
- **You are always the editor:** If a note is incomplete or wrong, edit the Markdown file directly. Your Chief will read and respect your changes on its next turn.
- **Visual Knowledge Graph (Optional):** Prefer visual navigation? Open this folder in [Obsidian](https://obsidian.md) to explore your Chief's memory as an interactive visual graph.

*Learn more in [Setting Up Your Chief](docs/setting-up-your-chief.md), [Patterns & Playbooks](docs/patterns/README.md), and [Using with Obsidian](docs/using-with-obsidian.md).*



---

## Your First Week

Folder Chief is designed to turn from a quick novelty into a daily habit across five short sessions:

| Day | You Do | Your Chief Does | What You Can Inspect |
|---|---|---|---|
| **Day 1: Meet** | Answer 3 questions and name today's priority | Sets up initial memory, handles your first task | `brain/me.md`, `brain/state/today.md` |
| **Day 2: Return** | Ask: *"What should I focus on today?"* | Recalls yesterday, rolls open tasks forward | `today.md` updated without amnesia |
| **Day 3: Projects** | Describe 3–5 active projects; drop notes in `brain/inbox/` | Compiles structured notes with source links | `brain/notes/projects/*.md` |
| **Day 4: Trust** | Make an intentional correction to a project date | Dates and supersedes old claims without arguing | `brain/log.md`, `brain/notes/` diff |
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
- **Never runs background daemons:** It only runs when you open your terminal and start a conversation.
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
| **Cost** | Subscription | Subscription | Subscription | +$50–$200/mo | **$0 on top of existing AI tools** |

*Read the in-depth comparison in [Why a Folder, Not an App](docs/why-a-folder.md).*

---

## Getting Help

1. **Ask your Chief:** Your Chief knows its entire manual (`chief/manual/index.md`). Ask it anything about memory, capabilities, or setup.
2. **Community Support:** Join [GitHub Discussions](https://github.com/leebase/folder-chief/discussions) or open an issue on [GitHub Issues](https://github.com/leebase/folder-chief/issues).
3. **AI Concierge:** Some people prefer help setting up their Chief around their business—[LeeBase AI Concierge](docs/getting-help.md) provides hands-on setup and customization services.

---

## Under the Hood

Folder Chief is built on a simple architecture: **the folder is the agent**. The canonical behavioral contract lives in `AGENTS.md`, self-model documentation lives in `chief/manual/`, and personal knowledge compiles into structured Markdown in `brain/`. Always-loaded instructions are strictly budgeted under 24 KiB for fast startup and compatibility across AI tools.


*Read the technical documentation in [For Developers](docs/for-developers.md).*

---

## Prior Art · License

Folder Chief builds upon foundational ideas in personal computing:
- **The Folder Is the Agent** — Inspired by Kieran Klaassen's thesis that self-describing folder structures provide the ideal boundary for AI context.
- **Compiled Markdown Knowledge Bases** — Implements Andrej Karpathy's compilation model for personal knowledge management.

Distributed under the [MIT License](LICENSE). Free to use, adapt, and build upon.
