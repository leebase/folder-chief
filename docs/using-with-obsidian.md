# Using Folder Chief with Obsidian

> **Optional visual navigation for your AI Chief's memory.**

Folder Chief is designed to work 100% in plain text directly from your terminal. You never *need* to install third-party apps or visual tools to get the full power of your Chief.

However, your Chief's memory folder (`brain/`) is structured from day one as an **Obsidian-compatible knowledge vault**. If you enjoy visual knowledge management, opening Folder Chief in [Obsidian](https://obsidian.md) turns your Chief's memory into an interactive, interconnected second brain (inspired by Andrej Karpathy's compilation model).

---

## 30-Second Setup

1. **Install Obsidian:** Download and install [Obsidian](https://obsidian.md) (free for personal use on macOS, Windows, Linux, iOS, and Android).
2. **Open Vault:** In Obsidian, click **"Open folder as vault"** (or *File* → *Open Vault*).
3. **Select Folder:** Choose your `folder-chief` directory (or select `folder-chief/brain/`).

That's it. Obsidian will automatically recognize the folder structure and pre-configured vault settings.

---

## What You Unlock in Obsidian

### 1. Interactive Graph View
When your Chief compiles information, it connects concepts, sources, and projects using standard bidirectional wikilinks (e.g., `[[sources/2026-08-20-vendor-meeting]]` and `[[notes/solar-partner-terms]]`).

In Obsidian:
- Click the **Graph View** icon in the left sidebar (or press `Ctrl/Cmd + G`).
- You will see an interactive, animated visual map showing how all your projects, raw sources, meeting notes, and daily tasks connect to each other.
- As you work with your Chief each day, watch the graph grow and cluster naturally around your active priorities.

---

### 2. Task & Project Dashboards (Obsidian Bases)
Folder Chief includes a pre-configured task view in `brain/dashboards/tasks.base`.

- When you open this file in Obsidian, it renders a clean, live table view across all your active tasks in `brain/state/tasks/`.
- You can filter, sort by priority, and inspect next actions visually without manually searching through files.

---

### 3. Backlinks & Context Navigation
- When viewing any project note in `brain/notes/`, Obsidian's **Backlinks** pane shows every source document, journal entry, or meeting note that references that project.
- Click any link to jump directly to the underlying raw evidence.

---

### 4. Rich Markdown Preview & Fast Search
- Enjoy clean typography, collapsible headings, outline sidebars, and instant full-vault search (`Ctrl/Cmd + Shift + F`).
- Edit any note directly inside Obsidian. Your Chief reads your updates on its next turn.

---

## Mobile Access & Cloud Sync (Optional)

Because your entire Chief lives in local files, you can read your notes on your phone or across computers:

- **iCloud Drive / Syncthing:** Place your `folder-chief` folder in an iCloud Drive (macOS/iOS) or Syncthing folder to view your notes in mobile Obsidian.
- **Git Sync:** Use standard Git commits to sync notes between work and personal laptops.
- **Obsidian Sync:** Use Obsidian's encrypted sync service if you prefer an automated sync layer.

---

## Zero Lock-In

Obsidian is simply a visual lens over your files:
- It does not modify your files into a proprietary database.
- It does not require an account or internet connection.
- If you ever stop using Obsidian, your files remain 100% standard Markdown readable by your AI CLI, VS Code, or any text editor.

---

*See also: [Setting Up Your Chief](setting-up-your-chief.md) · [Privacy & Data Ownership](privacy-and-ownership.md)*
