# Capability registry

This file is the truth for this installation, not a catalog of what the manual can describe.
No capability probe or grant has been recorded in this fresh Sprint 2 installation. Treat every
optional capability row as unavailable until a harmless, observed check or an explicit
owner-approved grant adds a date, scope, harness, and verification evidence. Never put credentials here.
The contract-required onboarding and in-folder Markdown writes remain available as part of this
folder's operation; they do not imply optional shell, web, Git, or external access.

| Capability | Status | Scope | Since | Verified | Harness/evidence |
|---|---|---|---|---|---|
| filesystem writes | not probed | contract: this folder only | — | — | — |
| shell | not probed | unknown | — | — | — |
| web fetch/search | not probed | unknown | — | — | — |
| Git / private backup | not probed | unknown | — | — | — |
| browser automation | not probed | unknown | — | — | — |
| email read/draft | not configured | no grant | — | — | — |
| calendar | not configured | no grant | — | — | — |
| cloud drive | not configured | no grant | — | — | — |
| notifications | not configured | no grant | — | — | — |
| scheduled or unattended runs | not configured | prohibited in Sprint 2 | — | — | — |

## Registry rules

The manual describes possible capabilities; this table describes only what is true here. A
later setup must record the capability, narrow scope, date, harness, and how it was verified.
Failures must change the status rather than trigger blind retries. Revocation removes access
from the harness or credential owner and records the dated status change here; secrets remain
outside this folder.

External integrations, sends, scheduled work, and capability adapters are not configured in
this Sprint 2 product. In particular, email is possible in principle but unavailable here
unless this file is deliberately updated with observed configuration and verification.
