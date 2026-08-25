# Your First Automation: The Weekly Review

> **Ritual first, automation second.**

The most powerful productivity habit in Folder Chief is the **Weekly Review**. It transforms raw daily notes into strategic clarity, flags stale commitments, and sets up your coming week.

Rather than installing complex background engines or fragile scripts, Folder Chief approaches automation in two deliberate stages: **master the interactive ritual first, then automate the run when trusted.**

---

## Stage 1: The Interactive Ritual (Day 5 or Friday Afternoon)

Before automating anything, run the Weekly Review interactively with your Chief to learn its rhythm and calibrate its output.

### How to Run It:
1. Open your terminal in `folder-chief` and launch your AI CLI.
2. Say: *"Let's do our Weekly Review."*

### What Your Chief Does:
- Scans `brain/state/today.md` and your recent `journal/` entries.
- Identifies what was accomplished over the past week.
- Surfaces open loops, stale tasks, and waiting-on items that need your attention.
- Drafts a clean, structured summary in `brain/state/weekly/YYYY-WW.md`:
  - **Key Wins:** Completed milestones.
  - **Open Loops & Stale Items:** Tasks that haven't moved in >5 days.
  - **Next Week's Big 3:** Top strategic focus areas.
  - **One Key Decision:** The single most important choice requiring your judgment.

### Review and Adjust:
Read the generated review file. Tell your Chief what to emphasize or tweak. Because it's plain Markdown, you can also edit the file directly.

---

## Stage 2: Scheduled Automation (Optional Tier 2 Extension)

Once you have run the interactive ritual twice and trust the output structure, you can separately configure your computer's scheduler (`cron` on Linux, `launchd` on macOS, or Task Scheduler on Windows) and a headless harness command. Folder Chief does not install or run this extension by itself.

### How Scheduled Runs Work Safely:

1. **Standing Instruction File:** Create a simple instruction file (for example, `brain/state/weekly-review-instruction.md`) containing the exact prompt and an approval line:
   ```markdown
   # Weekly Review Task
   approved: 2026-08-25
   instruction: Read brain/state/ and journal/, compile weekly brief into brain/state/weekly/latest.md.
   ```
2. **Approval-as-a-File:** The wrapper or scheduled command must validate the approval value on every run and fail closed when it is missing, revoked, or outside the policy you define. The Markdown line alone is not an enforcement mechanism.
3. **Read-and-Draft Only:** The scheduled task reads approved in-folder inputs and writes the review plus its required audit entry. It never sends external messages, touches external systems, or runs a network listener.
4. **Audit Log:** Every run must record an entry in `brain/log.md`; verify this during the manual test.

### The Result:
After you install and verify the optional host schedule, the review can be waiting on Monday morning. It remains a draft that you inspect; cloud harness processing and any configured external reads follow their providers' privacy terms.

The complete reference recipe, constraints, and revocation procedure are in
[`chief/manual/capabilities/scheduled-runs.md`](../chief/manual/capabilities/scheduled-runs.md).
