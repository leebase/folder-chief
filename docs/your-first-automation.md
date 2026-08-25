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

## Stage 2: Scheduled Automation (Optional)

Once you have run the interactive ritual twice and trust the output structure, you can optionally configure your computer's built-in scheduler (`cron` on macOS/Linux or Task Scheduler on Windows) to prepare this file automatically before you wake up on Monday morning.

### How Scheduled Runs Work Safely:

1. **Standing Instruction File:** Create a simple instruction file (e.g., `brain/state/weekly-review-instruction.md`) containing the exact prompt and an approval line:
   ```markdown
   # Weekly Review Task
   approved: 2026-08-25
   instruction: Read brain/state/ and journal/, compile weekly brief into brain/state/weekly/latest.md.
   ```
2. **Approval-as-a-File:** If the `approved:` date is missing or revoked, the task will not execute.
3. **Read-and-Draft Only:** The scheduled task *only* reads your folder and writes a single review file. It never sends external messages, never touches external systems, and never runs background network listeners.
4. **Audit Log:** Every run records an entry in `brain/log.md`.

### The Result:
Every Monday morning, you open your terminal or Obsidian, and your Weekly Review is already waiting for you—clear, accurate, and completely private.
