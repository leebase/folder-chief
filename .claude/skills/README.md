# Agent Skills

This directory holds specialized skills for Folder Chief following the open **Agent Skills `SKILL.md` standard**.

## Structure

Each skill lives in its own subdirectory containing a `SKILL.md` file:

```
.claude/skills/
├── README.md
└── <skill-name>/
    └── SKILL.md
```

## Cross-harness discovery

- **Claude Code**: Discovers skills located in `.claude/skills/`.
- **OpenCode**: Reads `.claude/skills/` natively.
- **Codex CLI**: Discovers skills in `.codex/skills/`. Folder Chief can link `.claude/skills/` to `.codex/skills/` on request.
- **Gemini CLI**: Discovers skills in `.gemini/skills/`. Folder Chief can link `.claude/skills/` to `.gemini/skills/` on request.

## Authoring rules

- Skills must be plain Markdown instructions.
- Skills must never contain embedded secrets, tokens, or credentials.
- Shims or links to other harnesses must never drift from the canonical definitions here.
