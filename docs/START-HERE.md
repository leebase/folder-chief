# Start Here: Welcome to Folder Chief

> **Your AI chief of staff is a folder.**

Welcome to Folder Chief. If you are here, you likely want an AI that can truly help you manage your work, remember your context across days and weeks, and keep you organized—without locking your data into another subscription, cloud database, or proprietary web app.

Folder Chief turns the AI tools you already use in your terminal into an attentive, capable personal chief of staff.

---

## What Is Folder Chief?

Folder Chief is not a software package, a server, or a background service. It is a folder of plain text files—instructions and structured Markdown notes—that lives on your own computer.

When you open this folder with a supported AI tool—either in your terminal (Claude Code, OpenAI Codex CLI, Google Gemini CLI, OpenCode) or in a desktop AI app with folder access (Claude Desktop, Codex/ChatGPT Desktop, Cursor, VS Code)—your AI tool reads these files and instantly assumes the role of your Chief of Staff:

1. **It remembers your context.** Every priority, project, and decision is stored in human-readable Markdown notes in your `brain/` folder. When you return tomorrow, it picks up right where you left off.
2. **You own everything.** There is no hidden database or proprietary format. You can open any file, edit it with any text editor, or view your notes in tools like [Obsidian](https://obsidian.md).
3. **Nothing runs behind your back.** Folder Chief is completely inert until you open your tool. It never runs background listeners, never sends unexpected emails, and never touches files outside this folder.
4. **It grows with your work.** When a specific recurring task needs dedicated attention, your Chief can help you set up a specialist workspace with its own focused responsibilities.

---

## Who Is It For?

- **Founders, Executives, and Operators:** Keep track of strategic initiatives, daily priorities, follow-ups, and key decisions in one place.
- **Consultants and Freelancers:** Manage multiple client contexts, meeting notes, project deliverables, and commitments without context fragmentation.
- **Engineers and Technical Leaders:** A lightweight, local-first management layer that fits directly into your existing development workflow.
- **Anyone who wants an AI colleague that belongs to them, not to a service.**

---

## The First Five Minutes

Getting started takes less than two minutes:

### 1. Download or Clone the Folder
```bash
git clone https://github.com/leebase/folder-chief.git
cd folder-chief
```
*(Or download and extract the ZIP archive from GitHub).*

### 2. Launch Your AI Assistant
- **Terminal CLI:** Open your terminal in `folder-chief` and run `claude`, `codex`, `gemini`, or `opencode`.
- **Desktop AI App:** Point Claude Desktop, Codex/ChatGPT Desktop, Cursor, or VS Code at the `folder-chief` directory as your workspace.

### 3. Say Hello

When you start your first conversation, your Chief will introduce itself and ask three simple questions:
1. What is your name?
2. What does your work look like?
3. What is your top priority today?

### 4. Give It a Real Task
Answer naturally. Your Chief will record your profile in `brain/me.md`, set up today's priority list in `brain/state/today.md`, and immediately get to work helping you with your priority task.

---

## What to Expect Next

- **Look at your files:** Open `brain/me.md` and `brain/state/today.md` in any text editor. You will see exactly what your Chief learned about you in plain English.
- **Follow the First Week:** See [Your First Week](your-first-week.md) for a step-by-step roadmap to turn Folder Chief into a daily productivity habit.
- **Understand how memory works:** Read [Setting Up Your Chief](setting-up-your-chief.md) to learn how to add project notes, correct mistakes, and organize your work.

---

## Essential Guides

- **[Setting Up Your Chief](setting-up-your-chief.md)** — How memory, preferences, and corrections work.
- **[Your First Week](your-first-week.md)** — Day 1 to Day 5 adoption guide.
- **[Using with Obsidian](using-with-obsidian.md)** — Optional visual navigation, interactive graph view, and task dashboards.
- **[Creating Your First Specialist](creating-your-first-agent.md)** — How your Chief sets up dedicated workspaces.
- **[Your First Automation](your-first-automation.md)** — Building the Weekly Review ritual.
- **[Privacy & Ownership](privacy-and-ownership.md)** — Data ownership, local files, and safety boundaries.
- **[Why a Folder, Not an App](why-a-folder.md)** — Design philosophy and competitive comparison.
- **[Getting Help](getting-help.md)** — Community discussions, troubleshooting, and AI Concierge setup support.
- **[For Developers](for-developers.md)** — Architecture and technical reference.
