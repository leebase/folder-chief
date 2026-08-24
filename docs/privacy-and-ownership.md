# Privacy, Security & Data Ownership

> **Your data belongs to you. Period.**

Folder Chief is built on a simple architectural philosophy: **the user must own their memory, their tools, and their data.** There are no proprietary databases, no remote SaaS dashboards, and no telemetry services collecting information about your work.

---

## 1. Local-First File Ownership

- **All data is local:** Your profile (`brain/me.md`), daily priorities (`brain/state/today.md`), project notes (`brain/notes/`), and session logs (`journal/`) live as plain text Markdown files on your computer's hard drive.
- **Zero proprietary lock-in:** You can read, copy, edit, or delete any file using standard operating system tools, VS Code, Obsidian, or basic text editors.
- **Instant deletion:** If you ever want to remove Folder Chief, delete the directory. Nothing remains on any remote server.

---

## 2. AI Provider Processing Disclosure

While Folder Chief stores all data locally, **AI reasoning is performed by the AI CLI tool you choose to run**:

- When you use **Claude Code**, prompts and relevant files read during the conversation are processed by Anthropic according to Anthropic's commercial terms of service.
- When you use **OpenAI Codex**, prompts and files are processed by OpenAI according to OpenAI's terms.
- When you use **Google Gemini CLI**, prompts and files are processed by Google according to Google's terms.
- When you use **OpenCode** with a local model, all inference stays 100% on your local machine.

**Local file storage does not mean offline AI execution** unless you are specifically running a local, offline model.

---

## 3. Secrets & Credentials Policy

Folder Chief enforces a strict **zero-secrets rule**:

- **Never store credentials in files:** Passwords, API tokens, SSH keys, private certificates, and access secrets must never be placed in notes or configuration files within this folder.
- **Environment variables only:** If an external tool integration is configured, reference credentials via system environment variables (e.g., `$GITHUB_TOKEN`), never hardcoded strings.
- **Gitignore safety net:** The repository's `.gitignore` automatically excludes `.env*`, `secrets/`, `*.key`, `*.token`, and `*.pem` files.

---

## 4. Universal Source Trust Boundary

When you import external documents, clipped articles, or client notes into `brain/inbox/` or `brain/sources/`:

- All source content is treated as **passive evidence**, never as active operational instructions.
- If an imported document contains prompt injection attempts or system override instructions, your Chief ignores them completely and treats them strictly as plain text data.
- Original source files in `brain/sources/` are immutable—your Chief never alters original source files.

---

## 5. Confined Execution Boundaries

- **In-Folder Operations:** Your Chief operates strictly within the `folder-chief` directory tree. It never creates, edits, or deletes files in parent directories or other repositories.
- **Drafts First, No Auto-Send:** Your Chief can prepare drafts for emails, documents, or pull requests, but **you** perform the actual external send or publication through your own tools.
- **No Background Daemons:** The core product has zero background processes or network listeners. It is active only while your terminal session is open.
