# Show HN: My AI chief of staff is a folder — no server, no database, works with Claude Code/Codex/Gemini

**URL:** https://github.com/leebase/folder-chief  
**Tagline:** A Git-cloneable folder that turns your terminal AI assistant into a persistent Chief of Staff with Markdown memory and Obsidian dashboards.

---

Hey HN,

Like many of you, I spend hours every day in terminal AI assistants (Claude Code, Codex CLI, Gemini CLI). They are brilliant programmers, but when it comes to managing real-world work, they suffer from two major problems:

1. **Daily amnesia:** Every fresh session starts completely blank. They forget your active projects, team context, priorities, and past decisions.
2. **The SaaS trap:** Cloud "AI Chief of Staff" apps charge $50–$200/month, lock your business notes inside closed platforms, and require persistent servers or background daemons running on your machine.

I built **Folder Chief** to solve both problems with a radically simple premise: **Your AI chief of staff is a folder.**

### How it works

Folder Chief is an open-source template repository made of plain Markdown files:

```bash
git clone https://github.com/leebase/folder-chief.git folder-chief
cd folder-chief
claude  # or codex, gemini, opencode
```

When you launch your AI tool in this directory, it loads a compact instruction contract (`AGENTS.md`) and immediately adopts the role of your Chief of Staff:

* **Session Start Protocol:** It reads your profile (`brain/me.md`), today's session journal (`journal/`), and active commitments (`brain/state/today.md`) before answering substantive questions.
* **Compiled Markdown Memory:** Inspired by Andrej Karpathy's notes on LLM knowledge bases, it doesn't use complex query pipelines. Raw source documents dropped into `brain/inbox/` are filed immutably under `brain/sources/`. The Chief compiles synthesized notes into `brain/notes/` with explicit source links.
* **Obsidian-Ready Vault:** The entire `brain/` directory is a valid Obsidian vault. You get linked graphs, backlinks, and task dashboards (via Obsidian Bases) out of the box.
* **Consent-Based Execution:** There are no background listeners, daemons, or open network ports. It only acts when you open a terminal and talk to it. It drafts emails and action plans inside the folder, but external actions are always reviewed and sent by you.
* **Hiring Specialized Folder Agents:** When a project or workflow develops recurring cadence (like tracking a sales pipeline or monitoring research), the Chief walks you through a 4-question interview and instantiates a specialized **Folder Agent** in `team/<agent-name>/` with its own contract, private notes, and test suite.

### Architecture & Standards

* **Portable:** Built on open instruction standards. Tested across Claude Code, Codex CLI, Gemini CLI, and OpenCode.
* **Deterministic Self-Model:** The Chief answers questions about its capabilities from its modular manual (`chief/manual/`) rather than hallucinating from generic training weights.
* **Strict Separation of Possible vs. Configured:** Reading a guide does not grant access. If you ask *"Can you read my email?"* on a fresh install, it truthfully answers: *"I know how email integration works, but I do not currently have access to your email."*
* **Zero Secrets in Repo:** Environment variables and system keychains hold credentials; the folder only stores configuration references.

The project is MIT licensed. I'd love your feedback on the folder structure, the memory compilation pattern, and the multi-harness portability.

Repo: https://github.com/leebase/folder-chief
