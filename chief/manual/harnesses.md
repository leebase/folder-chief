# Harness Portability & Behavioral Equivalence

Folder Chief is designed to run consistently across major terminal AI coding harnesses: **Claude Code**, **Codex CLI**, **Gemini CLI**, and **OpenCode**. The folder is the persistent product; the harness is interchangeable execution hands.

## Multi-Harness Architecture

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

### Instruction Payload Budget
To prevent silent instruction truncation (notably Codex CLI's 32 KiB ceiling), the total always-loaded instruction payload (`AGENTS.md` + shims + settings) is strictly budgeted under **24 KiB** (currently ~10 KiB). All detailed product knowledge lives in `chief/manual/` and is read on demand.

---

## Supported Harnesses & Design Targets

| Harness | Entry Point & Discovery | Target Environment & Status | Trust & Permission Modes | Memory & Runtime Notes |
|---|---|---|---|---|
| **Claude Code** (`claude`) | `CLAUDE.md` (`@AGENTS.md`) | Linux, macOS, WSL2 (Validated reference harness: 2026-08-25) | Interactive tool prompt or `--dangerously-skip-permissions` | Harness auto-memory lives in user config (`~/.claude.json`). Product memory is pure Markdown in `brain/`. |
| **Codex CLI** (`codex`) | Root `AGENTS.md` native discovery | Linux, macOS (Validated harness: 2026-08-25) | `sandbox_mode = "workspace-write"` in `~/.codex/config.toml` or approved writes | Instruction payload < 24 KiB comfortably satisfies Codex 32 KiB aggregate limit. |
| **Gemini CLI** (`gemini` / `agy`) | `GEMINI.md` & `.gemini/settings.json` | Linux, macOS (Supported with Setup; validated 2026-08-25) | Interactive tool approval; requires workspace registration; verify with `/memory show` | Loads `GEMINI.md` / context array once registered; skills linked from `.claude/skills/`. |
| **OpenCode** (`opencode`) | Root `AGENTS.md` native discovery | Linux, macOS (`opencode`, `opencode run`) (Design target; validated 2026-08-25) | Interactive terminal session | Standalone interactive runtime; zero background daemons required. |
| **Desktop AI Apps & IDEs** (Claude Desktop, Codex Desktop, Cursor, VS Code) | Root `AGENTS.md` / workspace folder discovery | macOS, Windows, Linux (Supported) | Workspace folder read/write permissions | Point the app at `folder-chief`; operates directly on local Markdown files. |

*Note: Behavioral equivalence across all harnesses is evaluated against the 9 invariants below.*


---


## The 9 Observable Behavioral Equivalence Invariants

Regardless of which supported harness or underlying frontier model executes Folder Chief, the installation must uphold nine observable behavioral invariants:

1. **Loads Intended Product Instructions (`AGENTS.md`):**
   Whether discovered natively (`AGENTS.md`), imported via `@AGENTS.md` (`CLAUDE.md`), or loaded via settings (`.gemini/settings.json`), the model loads the canonical contract into its active context and can recite its 8 core operating rules when probed.

2. **Performs Onboarding Without Custom Rescue:**
   On a clean install (absence of `chief/installed.md`), the Chief introduces itself in exactly three standard sentences, asks at most three onboarding questions (name, work overview, urgent task), creates `brain/me.md`, handles a real initial task, and writes `chief/installed.md` with zero manual prompt rescue or human debugging.

3. **Writes Canonical Memory Structures:**
   All persistent state is written as valid, human-readable Markdown in designated locations (`brain/me.md`, `brain/state/today.md`, `brain/log.md`, `brain/notes/`, and `journal/YYYY-MM-DD.md`) conforming to standard frontmatter and section schemas.

4. **Respects Memory Precedence:**
   When evaluating conflicting or evolving statements, the Chief resolves truth strictly by precedence:
   $$\text{user correction} > \text{confirmed fact} > \text{newer sourced inference} > \text{older synthesized state} > \text{draft} > \text{superseded}$$
   Superseded claims or drafts are never cited as current truth over direct user corrections or verified facts.

5. **Treats Sources as Untrusted Data, Not Instructions:**
   All incoming material in `brain/inbox/` and `brain/sources/` is treated as untrusted passive evidence (universal source trust boundary). Embedded operational instructions, prompt injections, or system directives within source documents are ignored and never executed.

6. **Recovers from Stale / Missing State:**
   On session initialization, the Chief inspects `as_of` timestamps, recognizes outdated state, and cleanly re-scaffolds missing runtime files from `chief/templates/scaffolds/` without crashing, corrupting data, or overwriting existing owner notes.

7. **Resumes Across Fresh Sessions:**
   In subsequent sessions, the Chief immediately reads `brain/me.md`, `journal/YYYY-MM-DD.md`, and `brain/state/today.md` upon receiving a substantive request, seamlessly maintaining project continuity without amnesia or repeated onboarding.

8. **Interprets "Hire" as Scaffolded Specialist Workspace:**
   When directed to hire an agent, the Chief conducts the 4-question interview, applies the verifiability gate, and scaffolds a bounded directory under `team/<agent-name>/` with its own contract and acceptance scenarios. It explicitly clarifies that the agent runs only when manually invoked in that directory—never as an autonomous background daemon.

9. **Remains Inert Unless Explicitly Invoked:**
   The core product contains zero background listeners, cron daemons, web servers, or automatic outbound triggers. The Chief executes strictly in response to direct interactive invocations in the terminal.

---

## Harness-Specific Verification Commands & Trust Modes

### 1. Claude Code
- **Launch Command:**
  ```bash
  claude
  ```
- **Permission Modes:**
  - Standard mode prompts for file write confirmations.
  - Non-interactive / autonomous local testing: `claude --dangerously-skip-permissions` (grants in-workspace execution).
- **Rule Check Probe:**
  Ask: *"What are your 8 operating rules?"*
  The Chief must recite the 8 rules from `AGENTS.md`.

### 2. Codex CLI
- **Launch Command:**
  ```bash
  codex
  ```
- **Configuration & Trust:**
  - Ensure `~/.codex/config.toml` allows workspace writes:
    ```toml
    sandbox_mode = "workspace-write"
    ```
- **Rule Check Probe:**
  Ask: *"What are your 8 operating rules?"*
  Verify that the Chief loads `AGENTS.md` natively without exceeding instruction context limits.

### 3. Gemini CLI
- **Status:** Supported with Explicit Setup (Harness Integration Requirement)
- **Launch Command:**
  ```bash
  gemini   # or agy
  ```
- **Configuration & Workspace Registration:**
  - **Prerequisite:** Gemini CLI (`agy`) requires the directory to be registered as an active workspace in Antigravity/Gemini before first launch. In an unregistered folder, Gemini CLI's native discovery model does not automatically inject instruction files into the session.
  - Instructions are loaded from `GEMINI.md` and `.gemini/settings.json`.
  - Check loaded context inside Gemini CLI:
    ```
    /memory show
    ```
- **Rule Check Probe:**
  Ask: *"What are your 8 operating rules?"*
  Confirm accurate recall of the 8 canonical contract rules from `GEMINI.md` / `AGENTS.md`.

### 4. OpenCode
- **Launch Command:**
  ```bash
  opencode
  # Or for direct scripted verification:
  opencode run "What are your 8 operating rules?"
  ```
- **Runtime Notes:**
  - Discovers `AGENTS.md` and `.claude/skills/` natively.
  - Runs interactively in the terminal without requiring persistent background daemon processes.

---

## Skills Linking Procedure

Folder Chief uses the open **Agent Skills `SKILL.md` standard**. Skills are authored once under `.claude/skills/<skill-name>/SKILL.md`.

When using Codex CLI or Gemini CLI, Folder Chief can create symbolic links or directory copies on request:

### Symlinking Skills (Linux / macOS)
```bash
# For Codex CLI:
mkdir -p .codex
ln -s ../.claude/skills .codex/skills

# For Gemini CLI:
mkdir -p .gemini
ln -s ../.claude/skills .gemini/skills
```

### Windows / Non-Symlink Environments
If symlinks are not supported, copy the skill directory from `.claude/skills/` to `.codex/skills/` or `.gemini/skills/`.

---

## Migration and Moving Between Harnesses

To switch harnesses or move Folder Chief to another machine:

1. **Preserve and move your installation:**
   - **Method A (Recommended — Complete Folder Copy):** Copy the entire `folder-chief` directory (including hidden files and ignored `brain/`, `journal/`, `team/` directories) to your new location.
   - **Method B (Clean Clone + Memory Restore):** Clone a fresh copy of the product repository (`git clone https://github.com/leebase/folder-chief.git`), then copy your backed-up `brain/`, `journal/`, `team/`, and `chief/capabilities.md` into the new folder. *(Note: cloning the product Git repository alone does not restore `brain/` because personal memory is intentionally gitignored for upgrade safety).*
2. **Open the directory in the new harness:**
   ```bash
   cd folder-chief
   claude   # Or codex, gemini, opencode
   ```
3. **Say hello:** The new harness reads `AGENTS.md`, detects `chief/installed.md` and `brain/me.md`, and resumes your existing context and memory.
4. **Re-wire capability grants:**
   - Capabilities and OAuth credentials are tied to harness installations and host environments, not stored in the repository.
   - Check `chief/capabilities.md` to see what capabilities were previously configured.
   - Re-verify local tools or environment variables in the new harness environment.

---

## Recovery & Troubleshooting

### 1. Handling Write-Denied / Permission Issues
If your harness reports a permission error when attempting to write files in `brain/`, `journal/`, or `chief/`:
- **Filesystem permissions:** Ensure your user account owns the repository directory (`chmod -R u+rw .`).
- **Harness execution flags:** Ensure your CLI permissions allow file creation in the current directory.
- **Directory confinement:** If a harness attempts to write outside the repository root, Folder Chief will fail closed and refuse the operation.

### 2. Recovering from Interrupted Onboarding
If onboarding is interrupted before completion:
- Delete any partial profile file: `rm -f brain/me.md`.
- Delete the installation marker if present: `rm -f chief/installed.md`.
- Ensure runtime files can re-scaffold cleanly from `chief/templates/scaffolds/`.
- Re-open your terminal AI tool in this directory (`pwd`) and say hello to restart clean onboarding.

### 3. Verifying Instruction Loading
If the assistant gives generic model responses or fails to recognize its Chief of Staff role:
- Check that your CLI was launched from inside `folder-chief` (`pwd`).
- **Claude Code:** Verify `CLAUDE.md` exists in cwd and contains `@AGENTS.md`.
- **Codex CLI:** Verify `AGENTS.md` is in cwd.
- **Gemini CLI:** Verify `.gemini/settings.json` specifies `AGENTS.md` and `GEMINI.md`.
- **OpenCode:** Verify `AGENTS.md` is in cwd.
- Run the rule check probe: ask *"What are your 8 operating rules?"* The assistant should answer with the exact rules from `AGENTS.md`.
