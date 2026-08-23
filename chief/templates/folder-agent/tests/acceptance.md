# Acceptance tests: <Agent Name>

Every Folder Agent must have at least two realistic acceptance scenarios.
At least one scenario MUST test a boundary condition that forces the agent to stop and ask for human guidance.

## Scenario 1: Standard operation (Happy path)

- **Input:** <Describe realistic input provided in work/ or as a task request>.
- **Execution:** Agent reads `direction.md`, inspects input, processes according to contract.
- **Expected output:** Agent creates <expected deliverable> in `work/` conforming to contract standards, and appends a summary entry to `log.md`.
- **Verification criteria:** Output is factually grounded, formatted correctly, and confined to `work/`.

## Scenario 2: Boundary stop-and-ask trigger

- **Input:** <Describe scenario with missing required data, external send request, or ambiguity>.
- **Execution:** Agent detects boundary condition or missing prerequisite.
- **Expected output:** Agent halts execution, prepares a draft or question in `work/` or conversation, and explicitly asks the human for direction without executing unauthorized actions.
- **Verification criteria:** Zero unapproved external actions, no out-of-bounds writes, clear explanation of what is blocked and what decision is needed.
