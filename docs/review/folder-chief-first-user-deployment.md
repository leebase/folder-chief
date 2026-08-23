# Folder Chief — First-User Deployment Playbook

**Mode:** private beta / design partner

**Goal:** learn whether the public repository works for someone who did not build it

**Entry gate:** the isolated road test has met its published threshold

# Deployment Principles

1. The user receives the same commit intended for GitHub distribution.
2. Do not quietly install a special fix, settings file, prompt, or script for this user.
3. Do not pre-populate memory unless that behavior is part of the public product.
4. Do not repair the user's Chief without recording the product defect first.
5. Any undocumented instruction Lee gives becomes documentation debt and an intervention in the
   evidence record.
6. The folder, its memory, its backups, and any credentials belong to the user.
7. Lee observes enough to learn but does not steer the Chief or translate its architecture.
8. README-level instructions—not Lee's presence—must carry basic installation and onboarding.
9. Use meaningful but non-catastrophic work. No secrets, regulated data, irreplaceable records, or
   externally consequential tasks in the first deployment.
10. A safety failure stops the session; it is not a prompt-engineering challenge.

# Lee's Steps

## 1. Candidate Selection

Choose one user who:

- already uses one advertised terminal AI harness at least weekly;
- is comfortable opening a terminal and following a GitHub README, but does not build agent systems;
- manages real projects, commitments, decisions, or client work where continuity could matter;
- will think aloud, tolerate a private-beta failure, and allow redacted evidence capture;
- is candid rather than socially motivated to validate Lee's idea;
- has a second supported harness available for a later portability check, if practical;
- can use a disposable or low-sensitivity work scenario for the first session.

Avoid an AI-agent engineer, close collaborator who already knows Folder Chief's architecture, person
who expects Lee to operate it, or user whose only AI experience is a browser chat product. The best
first user is capable enough to distinguish product friction from terminal basics, but not so
AI-native that they unconsciously repair prompts, remotes, permissions, or memory files.

Record why this person matches the selection criteria and any relationship bias before inviting
them.

## 2. Pre-Deployment Verification

Do this in the canonical repository without running the product behavior there:

- [ ] Road-test threshold passed on this exact commit.
- [ ] Full release commit SHA and version recorded.
- [ ] Canonical worktree clean; local `main` equals the distributed remote SHA.
- [ ] Intended release visibility permits this user access.
- [ ] README is the only startup document the user needs.
- [ ] Full license exists and matches public claims.
- [ ] Release/known-limitations note matches actual behavior.
- [ ] No Lee profile, Henderson fixture, test source, journal, onboarding marker, capability grant,
      agent, acceptance evidence, screenshot, or local workspace file is in the candidate.
- [ ] Secret scan and manual content review find no credential, private business data, email export,
      personal path, or private remote.
- [ ] HTTPS clone path is tested from a clean account/environment; any supported ZIP path and its
      no-Git limitations are tested and explicit.
- [ ] Supported harness/model/minimum version and installation/auth assumptions are public.
- [ ] Provider-processing and behavioral-boundary disclosures are visible before the user adds data.
- [ ] Source safety rules and supported format/size limits are public.
- [ ] Product/user ownership and upstream/private-backup remote topology are documented and road-tested.
- [ ] Backup, rollback, partial-onboarding recovery, correction, reset, migration, and uninstall paths
      are tested.
- [ ] No open P0; no P1 affecting install, source safety, memory correctness, or upgrade safety.

If any checkbox fails, postpone the user. Do not compensate with a private walkthrough.

## 3. Delivery

Send exactly:

1. The GitHub repository URL at the approved candidate commit/release.
2. This minimal welcome note, with only the supported harness names filled in:

> Folder Chief is a private beta for a chief of staff whose memory lives in a folder you own. Please
> start with the repository README and use one of the listed supported terminal AI tools. For the
> first session, use meaningful but non-sensitive work and think aloud; I want to see where the
> product—not you—gets confused. If anything appears destructive, exposes a secret, or tries to act
> outside the folder, stop and tell me.

3. A feedback destination the user already understands (for example, one email thread or a private
   issue form), plus the six-line feedback format under User Step 10.
4. The scheduled observation/debrief time and whether screen/audio recording is requested.

Do not send the internal architecture, this adversarial review, hidden prompts, a private command
cheat sheet, prebuilt memory, or special harness settings. If the repository needs any of those,
the deployment is testing Lee's support, not Folder Chief.

## 4. Observation Rules

### Lee may

- observe a screen share with explicit consent;
- ask the user to think aloud and describe expectations before clicking or typing;
- record timestamps, exact error text, questions, hesitations, and user language;
- answer a true prerequisite question such as where to obtain the already-advertised harness;
- ask “What would you try next?” without suggesting an action;
- stop an unsafe command, apparent secret exposure, destructive mutation, or external action;
- ask permission to capture sanitized file diffs or screenshots after a failure.

### Lee should not

- tell the Chief what it is or what to do;
- rewrite the user's prompt to make onboarding pass;
- explain undocumented folder semantics before the user encounters and interprets them;
- fix Git, settings, memory, links, frontmatter, or agent files during the observed flow;
- reinterpret confusing output for the user;
- supply an unadvertised flag, model choice, remote layout, or recovery command;
- rescue every failed interaction;
- dismiss confusion because the answer exists in an internal manual;
- count a task as successful because files were written;
- collect full transcripts or business content without specific consent and a retention plan.

Every rescue is evidence. Before intervening, say “I am stopping the test to help,” timestamp it,
record the trigger and exact intervention, and classify it as prerequisite clarification, safety
stop, documentation gap, or product defect. More than one basic-operation intervention fails the
low-intervention criterion.

## 5. Debrief

Conduct the interview immediately after first use, before explaining the intended architecture.
Ask in this order:

1. Before starting, what did you think Folder Chief was?
2. At what exact point did you understand it? What did you think before that point?
3. What did you expect to happen after you said hello?
4. Which moment was most confusing or frustrating?
5. What surprised you?
6. What felt magical or distinctly useful?
7. What felt brittle, ceremonial, or like developer tooling?
8. What do you believe it knows about you now? Which parts are fact versus inference?
9. Did you trust what it remembered? Why or why not?
10. Where is your information stored? What content might be processed by your AI provider?
11. Which files would you edit, and which would you avoid?
12. How would you correct a wrong fact? How would you delete something sensitive?
13. What do you think happens when you close the terminal?
14. What do you think “hire a Folder Agent” means? Would it run by itself?
15. How would you back this up, move it, or receive an update?
16. Would you use this tomorrow without Lee present? For what work?
17. Would you recommend it to someone like you? What warning would you include?
18. Would you pay for help setting up a more capable version? What outcome would justify that?
19. What did you expect it to do that it did not do?
20. What single change would most increase your trust or likelihood of continuing?

Do not correct their mental model until their answers are recorded. A wrong answer is product
evidence, not a user failure.

## 6. Evidence Capture

Create one deployment record outside the user's folder and canonical repository. Obtain consent for
every screenshot, recording, transcript, or file excerpt. Record:

- date/time/timezone and session duration;
- candidate commit/version/release URL;
- OS, shell, Git version, installation method, network constraints;
- harness, exact version, model, account/subscription type, permission/sandbox mode;
- test-folder path only in private evidence; redact it in shared reports;
- install elapsed time, failed commands, authentication/trust/permission prompts;
- onboarding elapsed time, questions asked, incomplete or surprising steps;
- first task, user-perceived usefulness, unsupported claims, and output paths;
- every file created/changed/deleted and any outside-folder attempt;
- fresh-session and correction behavior when performed;
- user understanding of sources, notes, state, logs, ownership, provider processing, and agents;
- every question the user asked Lee;
- every intervention Lee made, including duration and classification;
- exact user quotes for confusion, delight, trust, and abandonment risk;
- errors, screenshots/log references, and redaction notes;
- security/privacy concerns and any stop condition;
- requests and desired outcomes;
- final success-criteria and decision-rubric results.

### Defect versus feature request

Classify an item as a **product defect** when shipped behavior, documentation, safety boundary, or a
reasonable interpretation of a public claim fails. Examples: SSH quickstart fails, instructions do
not load, corrected memory resurfaces, an upgrade conflicts, or “nothing runs” proves false.

Classify an item as a **feature request** when the documented product works as bounded and the user
wants an additional outcome. Examples: mobile UI, a new dashboard, another integration, automatic
meeting attendance, or multi-user sharing.

When uncertain, preserve both labels and the user's expected outcome; do not downgrade a claim
failure to a feature request.

### Deployment evidence record

```markdown
# First-user deployment — <anonymous participant ID>

- Date/time:
- Candidate commit/version:
- Environment/harness/model:
- Consent and evidence-retention scope:
- Install result and elapsed time:
- Onboarding result and elapsed time:
- First useful outcome:
- Files changed:
- Fresh-session continuity result:
- Corrections/source safety result:
- Questions asked:
- Lee interventions:
- Exact user quotes:
- Trust/privacy concerns:
- Product defects:
- Documentation gaps:
- Feature requests:
- Stop conditions triggered:
- Success-criteria result:
- Final decision:
- Required remediation/retest:
```

# User's Steps

The following section is written to hand directly to the first user. It deliberately does not
explain Folder Chief's architecture.

## Step 1 — Choose Where Your Chief Lives

Choose a normal private location on your computer. The Folder Chief directory will become your
Chief's persistent workspace: its instructions, what it learns, and the work you create together
live there.

For this first beta, use non-sensitive work that would be inconvenient—but not harmful—to recreate.
Do not use passwords, API keys, regulated information, confidential client documents, or your only
copy of anything important.

## Step 2 — Get Folder Chief

Open the GitHub link Lee sent and follow the repository README exactly to clone the listed release.
Do not use a command from a private message or an older copy of the instructions.

If you are uncomfortable with Git, stop and tell Lee. Do not improvise a download method: a ZIP or
GUI path is supported only if the public README explicitly offers it and explains its limitations.
Difficulty here is useful beta feedback, not something you are expected to hide.

## Step 3 — Open the Folder

In your terminal, change into the new Folder Chief directory. Confirm your terminal is inside that
folder, then start one AI tool listed as supported in the README.

Use the tool and model you would normally choose. Accept only permissions you understand. If the
tool asks for broad access or a command looks unsafe, stop and ask Lee rather than approving it to
help the test pass.

## Step 4 — Say Hello

Do not prompt-engineer the product. Type only:

> Hello.

Folder Chief should introduce itself and guide the first conversation. If you get a generic coding
assistant response, follow only the public README's troubleshooting instructions. Record what
happened instead of explaining the product to the AI.

## Step 5 — Answer Onboarding Naturally

Answer in your own words. Do not organize your response for a database or guess which files it wants.
Talk to it as you would talk to a thoughtful chief of staff: who you are, what your work looks like,
and what is on your plate.

If it asks for credentials, a long setup questionnaire, or access you did not request, stop and note
that behavior.

## Step 6 — Give It Real Work

Choose one meaningful but non-catastrophic task you actually care about, such as:

- plan an important meeting;
- organize a project with unresolved dependencies;
- prepare questions for a client conversation;
- structure a decision and its assumptions;
- track a concern you do not want to lose.

Do not use a synthetic joke task, and do not give it permission to send, publish, schedule, delete,
purchase, or change an external system. Judge whether the result improves your work—not merely
whether the AI creates files.

## Step 7 — Inspect What It Learned

Ask:

> Show me what you learned, where you stored it, what came directly from me, and what you inferred.

Open the named files yourself in a normal editor. The owner's persistent knowledge should be under
`brain/`; raw material, derived notes, and current state have different roles. The product should
explain those roles in plain language when needed. Obsidian is optional: use it if you already have
it or want the visual view, but the files must make sense without it.

You may edit your owner memory and derived notes. Do not edit raw source material merely to make a
summary agree with you; ask the Chief to correct the derived belief. To correct something, say
naturally:

> That is wrong. The correct fact is ____. Show me what you will change and what will remain as
> history.

Review the result and verify the wrong value is not still presented as current.

## Step 8 — Leave

Close the AI tool completely. Do not use a resume-session feature and do not keep the terminal AI
conversation artificially alive. Your normal work may remain open, but the AI session should end.

## Step 9 — Come Back Later

Later—ideally the next day—open a new terminal in the same folder and start a genuinely fresh AI
session. Continue normal work without explaining yesterday.

Ask an indirect question that requires the prior context, such as:

> What is the most important unresolved question before my meeting?

The Chief should recover the context from its files, use corrected/current information, and say when
it is uncertain. Do not ask “What do you remember?”; continuity should appear naturally.

## Step 10 — Tell Lee What Broke

Send Lee these six lines. Short and blunt is useful:

```text
I expected…
Instead…
I was confused by…
I liked…
I would stop using it if…
I wish it…
```

Also tell Lee if you needed an undocumented command, approved something you did not understand,
could not tell which fact was current, or felt your information might leave the place you expected.

# First-User Success Criteria

| Criterion | Success evidence |
|---|---|
| Successful installation | User follows the public README on the supported environment and reaches the correct first response without a private command or file. |
| Successful onboarding | Natural answers produce an accurate owner profile and transition into real work without a long setup questionnaire. |
| First useful outcome | User says the artifact materially improved one real task and identifies how. |
| Cross-session continuity | A genuinely fresh session answers an indirect question with accurate, corrected, current context from files. |
| User understanding | User can explain where product instructions, raw evidence, derived memory, current state, and session history live at a practical level. |
| User trust | User understands local storage versus provider processing, can inspect/correct memory, and reports no unexplained action. |
| Low intervention from Lee | Zero product-operation interventions is ideal; at most one true prerequisite clarification, fully recorded. |
| Willingness to use again | User names a real task they will bring tomorrow without Lee present. |

Overall first-user success requires all eight criteria. “They liked the idea” is not a substitute for
installation, correct recall, trust, or independent reuse.

# Stop Conditions

Stop the beta immediately, preserve evidence, and return the issue to remediation if any of these
occur:

- data loss, unexplained overwrite, or inability to recover owner files;
- a secret is requested, displayed, stored, staged, or transmitted unexpectedly;
- a source-carried instruction is obeyed;
- a destructive command or unexpected file change occurs inside or outside the folder;
- the Chief sends, publishes, schedules, purchases, or changes an external system;
- the user cannot determine which of two contradictory memories is authoritative;
- a corrected fact returns as current in a fresh session;
- the product claims a host-bound capability that is not verified in this environment;
- a supported harness does not discover the core identity or materially violates its boundaries;
- upgrade, backup, or migration risks owner memory;
- private information is pushed to a public or unintended remote;
- Lee must intervene repeatedly for clone, launch, onboarding, correction, recall, or inspection;
- the user reasonably interprets local storage as local-only processing after reading the disclosure;
- the model pressures the user to bypass a harness safety prompt;
- the user asks to stop or withdraw evidence consent.

After a stop, do not repair the user's live folder in place as the first response. Make a safe copy
with permission, document the candidate SHA and exact evidence, help the user secure or recover their
data, and remediate/retest in a disposable product clone.

# Final First-User Decision

## PROCEED TO NEXT USER

Evidence required: all eight success criteria pass; no stop condition; road-test gates remain valid;
zero product-operation intervention (one recorded prerequisite clarification is acceptable); the
user independently returns in a fresh session, trusts the corrected memory, and names real work they
will use tomorrow. Any residual issue is P2/P3, documented, and does not contradict a public claim.

## PROCEED WITH MINOR REMEDIATION

Evidence required: no stop condition; safety, memory continuity, correction, and ownership all pass;
the user reaches value and would reuse it; one or more bounded P2/P3 wording, discoverability, or
polish defects caused friction. Remediate them in the product, create a new candidate SHA, rerun the
affected road tests, and give the first user the normal documented update—never a private patch.

## PAUSE BETA AND REMEDIATE

Evidence required: any P1 failure, more than one Lee intervention for basic operation, failed
README-only install/onboarding, material harness difference, ambiguous memory authority, failed
migration/update, or user unwillingness to return without Lee. File the defects, remediate in the
product, rerun the full affected gates, and restart with a new candidate; do not add a second user
while the failure remains.

## BLOCK PUBLIC RELEASE

Evidence required: any stop condition involving data loss, secret exposure, unsafe/destructive or
external action, source-instruction obedience, public-data push, false current memory after explicit
correction, or a failed core ownership/upgrade guarantee; also use this result if a public claim is
known false and remains in launch copy. Public release stays blocked until root cause is remediated,
the adversarial road test passes on a new candidate, and a fresh external user independently clears
the same gate.
