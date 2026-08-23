# Harness portability and configuration

Folder Chief is designed to run seamlessly across major agentic coding harnesses: **Claude Code**, **Codex CLI**, **Gemini CLI**, and **OpenCode**. The folder is the persistent product; the harness is interchangeable execution hands.

## Multi-harness architecture

The core contract is contained in a single canonical file, with lightweight pointers and configuration for individual harnesses:

```
folder-chief/
├── AGENTS.md                  # The canonical contract (~120-130 lines)
├── CLAUDE.md                  # "@AGENTS.md" (Claude Code entry point)
├── GEMINI.md                  # Pointer to AGENTS.md
├── .gemini/settings.json      # context.fileName: ["AGENTS.md", "GEMINI.md"]
├── .claude/
│   ├── settings.json          # autoMemoryDirectory -> ./chief/learned/
│   └── skills/                # Agent skills (SKILL.md standard)
```

### Instruction payload budget
To prevent silent instruction truncation (notably Codex CLI's 32 KiB ceiling), the total always-loaded instruction payload (`AGENTS.md` + shims + settings) is strictly budgeted under **24 KiB**. All detailed product knowledge lives in `chief/manual/` and is read on demand.

## Harness specifics

### 1. Claude Code
- **Entry point**: Reads `CLAUDE.md`, which contains `@AGENTS.md`.
- **Auto-memory redirection**: `.claude/settings.json` configures `autoMemoryDirectory` pointing to `./chief/learned/`. This ensures Claude-native memory stays inside the folder you own.
- **Skills**: Reads `.claude/skills/` natively.

### 2. Codex CLI
- **Entry point**: Reads `AGENTS.md` natively in the repository root.
- **Configuration**: Global or user settings in `~/.codex/config.toml`.
- **Skills**: Can link or copy from `.claude/skills/` to `.codex/skills/`.

### 3. Gemini CLI
- **Entry point**: Reads `.gemini/settings.json` which specifies `context.fileName: ["AGENTS.md", "GEMINI.md"]`.
- **Skills**: Can link or copy from `.claude/skills/` to `.gemini/skills/`.

### 4. OpenCode
- **Entry point**: Reads `AGENTS.md` natively.
- **Skills**: Discovers and reads skills located in `.claude/skills/` natively.

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
   git clone git@github.com:username/my-folder-chief.git
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
