# Folder Agent roster

This table records all registered Folder Agents in this installation. In Folder Chief, the directory
on disk and this roster row constitute agent registration—there are no background registries,
databases, or state daemons.

| Name | Responsibility | Status | Hired | Directory |
|---|---|---|---|---|
| *(None)* | — | — | — | — |

## Roster rules

- **Active agents:** Live in `team/<agent-name>/` and have `Status: active` in the table above.
- **Hiring:** Instantiated from `chief/templates/folder-agent/` following the 4-question hiring interview
  and verifiability gate in `chief/manual/agents.md`.
- **Retirement:** When retired, an agent's directory is moved to `team/retired/<agent-name>/` (or deleted
  at the owner's discretion) and its table status is marked `retired`.
- **Write confinement:** Every agent writes exclusively inside its own directory (`work/`, `notes/`,
  and `log.md`). Only the Chief writes to `brain/` and `journal/`.
