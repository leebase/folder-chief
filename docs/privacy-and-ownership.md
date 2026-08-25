# Privacy, Security & Data Ownership

> **Your data belongs to you. Period.**

Folder Chief is built on a simple architectural philosophy: **the user must own their memory, their tools, and their data.** There are no proprietary databases, no remote SaaS dashboards, and no telemetry services collecting information about your work.

---

## 1. Local-First File Ownership

- **All durable Folder Chief state is file-based and local:** Your profile (`brain/me.md`), daily priorities (`brain/state/today.md`), project notes (`brain/notes/`), and session logs (`journal/`) live as plain text Markdown files on your computer's drive. Provider processing is disclosed below.
- **Zero proprietary lock-in:** You can read, copy, edit, or delete any file using standard operating system tools, VS Code, Obsidian, or basic text editors.
- **Local deletion:** Deleting the directory removes the local Folder Chief files. It does not delete copies held by backups, sync services, Git remotes you configured, or an AI provider under its retention policy.

---

## 2. AI Provider Processing Disclosure

While Folder Chief stores all data locally, **AI reasoning is performed by the AI CLI tool you choose to run**:

- When you use **Claude Code**, prompts and relevant files read during the conversation are processed by Anthropic according to Anthropic's commercial terms of service.
- When you use **OpenAI Codex CLI**, prompts and files are processed by OpenAI according to OpenAI's terms.
- When you use **Google Gemini CLI**, prompts and files are processed by Google according to Google's terms.
- When you use **OpenCode**, processing location depends on the selected model/provider. It stays local only when OpenCode is configured to use a local model and no external tools are called.

**Local file storage does not mean offline AI execution** unless you are specifically running a local, offline model.

Web searches, connected email/calendar/Drive reads, and similar optional capabilities also send
queries or requests to the configured service. `chief/capabilities.md` is the installation-specific
authority for which of those capabilities has actually been verified or granted.

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
- **Drafts First, No External Dispatch:** Your Chief can prepare drafts for emails, documents, or pull requests, but **you** perform the external send, publication, merge, or remote mutation through your own tool.
- **No Core Background Daemons:** The shipped core has no background processes or network listeners. Optional Tier 2 schedules require separate host configuration and remain outside the core behavioral promise.

## 6. Owner-State Preservation

The product repository ignores substantive runtime files in `brain/`, `journal/`, `team/`, and
`chief/learned/`, plus `chief/capabilities.md` and `chief/installed.md`. This prevents ordinary
upstream pulls from treating personal state as product content. It is not a backup: clone/pull alone
cannot restore owner data, and tracked product customizations can still conflict. Keep a complete
folder backup and inspect incoming upgrades; see [Backup, Move, and Recover](../chief/manual/backup-move-recover.md).
