# Harness portability and configuration

Folder Chief is designed to run seamlessly across major agentic coding harnesses: **Claude Code**, **Codex CLI**, **Gemini CLI**, and **OpenCode**. The folder is the persistent product; the harness is interchangeable execution hands.

## Multi-harness architecture

The core contract is contained in a single canonical file, with lightweight pointers and configuration for individual harnesses:

```
folder-chief/
├── AGENTS.md                  # The canonical contract (<150 lines)
├── CLAUDE.md                  # "@AGENTS.md" (Claude Code entry point)
├── GEMINI.md                  # Pointer to AGENTS.md
├── .gemini/settings.json      # context.fileName: ["AGENTS.md", "GEMINI.md"]
├── .claude/
│   ├── settings.json          # Harness configuration ({})
│   └── skills/                # Agent skills (SKILL.md standard)
```

### Instruction payload budget
To prevent silent instruction truncation (notably Codex CLI's 32 KiB ceiling), the total always-loaded instruction payload (`AGENTS.md` + shims + settings) is strictly budgeted under **24 KiB**. All detailed product knowledge lives in `chief/manual/` and is read on demand.

## Prerequisites & Launch Check

Before launching Folder Chief in any harness:
1. **Git** installed on your system.
2. **Terminal literacy** — comfortable navigating directories and running CLI commands.
3. **Supported AI assistant CLI** installed and authenticated:
   - **Claude Code** (`claude`)
   - **Codex CLI** (`codex`)
   - **Gemini CLI** (`gemini`)
   - **OpenCode** (`opencode`)

### Working directory verification (cwd check)
Always verify your current working directory before launching your AI assistant:
```bash
pwd
# Ensure the path ends in .../folder-chief
```

## Standard First-Run Greeting

Across all harnesses, a fresh Folder Chief installation introduces itself in exactly three sentences:
1. *"I am Folder Chief, your AI chief of staff living in this folder."*
2. *"I operate strictly inside this directory and keep what I learn in `brain/` as plain Markdown you own."*
3. *"To get started: what is your name, what does your work look like, and what is your top priority today?"*

## Harness specifics & Instruction Verification

### 1. Claude Code
- **Entry point**: Reads `CLAUDE.md`, which imports `@AGENTS.md`.
- **Memory note**: Claude-native auto-memory uses user-level configuration (`~/.claude.json`). All Folder Chief knowledge lives in inspectable Markdown inside `brain/`.
- **Skills**: Discovers `.claude/skills/` natively.
- **Verification**: Run `claude` and ask *"What are your 8 operating rules?"* The Chief should recite the rules from `AGENTS.md`.

### 2. Codex CLI
- **Entry point**: Reads `AGENTS.md` natively in the repository root.
- **Configuration**: Global or user settings in `~/.codex/config.toml`.
- **Skills**: Can link or copy from `.claude/skills/` to `.codex/skills/`.
- **Verification**: Run `codex` and ask *"What are your 8 operating rules?"*

### 3. Gemini CLI
- **Entry point**: Reads `.gemini/settings.json` which specifies `context.fileName: ["AGENTS.md", "GEMINI.md"]`.
- **Skills**: Can link or copy from `.claude/skills/` to `.gemini/skills/`.
- **Verification**: Run `gemini` and ask *"What are your 8 operating rules?"*

### 4. OpenCode
- **Entry point**: Reads `AGENTS.md` natively.
- **Skills**: Discovers and reads skills located in `.claude/skills/` natively.
- **Verification**: Run `opencode` and ask *"What are your 8 operating rules?"*

## Skills linking procedure

Folder Chief uses the open **Agent Skills `SKILL.md` standard**. Skills are authored once under `.claude/skills/<skill-name>/SKILL.md`.

When using Codex CLI or Gemini CLI, Folder Chief can create symbolic links or directory copies on request:

### Symlinking skills (Linux / macOS)
```bash
# For Codex CLI:
mkdir -p .codex
ln -s ../.claude/skills .codex/skills

# For Gemini CLI:
mkdir -p .gemini
ln -s ../.claude/skills .gemini/skills
```

### Windows / non-symlink environments
If symlinks are not supported, the Chief copies the skill directory from `.claude/skills/` to `.codex/skills/` or `.gemini/skills/` upon request.

## Migration and moving between harnesses

To switch harnesses or move Folder Chief to another machine:

1. **Copy or clone the repository**:
   ```bash
   git clone https://github.com/username/my-folder-chief.git
   # Or copy the directory directly
   ```
2. **Open the directory in the new harness**:
   ```bash
   cd my-folder-chief
   claude   # Or codex, gemini, opencode
   ```
3. **Say hello**: The new harness reads `AGENTS.md`, detects `chief/installed.md` and `brain/me.md`, and resumes your existing context and memory.
4. **Re-wire capability grants**:
   - Capabilities and OAuth credentials are tied to harness installations and host environments, not stored in the repository.
   - Check `chief/capabilities.md` to see what capabilities were previously configured.
   - Configure necessary MCP servers or environment variables in the new harness environment.
   - Run probe checks to verify and update the registry for the new harness.

## Recovery & Troubleshooting

### 1. Handling write-denied / permission issues
If your harness reports a permission error when attempting to write files in `brain/`, `journal/`, or `chief/`:
- **Filesystem permissions**: Ensure your user account owns the repository directory (`chmod -R u+rw .`).
- **Harness execution flags**: Some tools default to read-only or ask for approval on every write. Ensure your CLI permissions allow file creation in the current directory.
- **Directory confinement**: If a harness attempts to write outside the repository root, Folder Chief will fail closed and refuse the operation.

### 2. Recovering from interrupted onboarding
If onboarding is interrupted before completion (e.g. terminal closed, network error):
- Delete any partial profile file: `rm -f brain/me.md`.
- Delete the installation marker if present: `rm -f chief/installed.md`.
- Ensure runtime files can re-scaffold cleanly from `chief/templates/scaffolds/`.
- Re-open your terminal AI tool in this directory (`pwd`) and say hello to restart clean onboarding.

### 3. Verifying instruction loading
If the model responds generically or does not recognize its Chief of Staff role:
- Check that your CLI was launched from inside `folder-chief` (`pwd`).
- **Claude Code**: Verify `CLAUDE.md` exists in cwd and contains `@AGENTS.md`.
- **Codex CLI**: Verify `AGENTS.md` is in cwd.
- **Gemini CLI**: Verify `.gemini/settings.json` specifies `AGENTS.md` and `GEMINI.md`.
- **OpenCode**: Verify `AGENTS.md` is in cwd.
- Run the rule check probe: ask *"What are your 8 operating rules?"* The assistant should answer with the exact rules from `AGENTS.md`.
