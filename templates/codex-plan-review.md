# Codex Plan-Review (lean mode, default)

Use a second model as a **reviewer of your plan**, not an implementer. Implementation stays with Claude.

## When it fires — by blast radius, not vibes
Run a review when the plan touches any of:
- contracts / public API / interfaces
- routing / delegation / control flow
- persistence / DB / schema / state
- auth / tokens / permissions
- infra: deploy / cron / ports / SSL
- agent behavior / config / hooks
- external sends (email / posts / payments)
- roughly > 150 LOC or > 3 files

Skip: local, reversible, trivial changes (typo, single function, docs, tests, anything not in the list above).

## How to call it (token-light)
Send the **plan text only**, never the whole codebase:
```bash
codex exec --sandbox read-only "Review this PLAN (not code). Reply terse, <200 words.
Verdict must be exactly one of: PASS | REVISE | ESCALATE.
WHAT: <one line>
PLAN:
<paste plan>
QUESTIONS: (a) biggest failure mode? (b) is the scope right? (c) one concrete improvement."
```

## The verdict contract (closes the advisory gap)
The reviewer returns one of:
- `PASS` — sound, implement as-is.
- `REVISE` — fix first (reason + location), then implement.
- `ESCALATE` — serious concern / split decision → take it to a human.

Before implementing, record one line in the plan:
```
Reviewer verdict: <PASS|REVISE|ESCALATE> — <how handled>
```
Missing this line = do not implement. This is what stops "nod and ignore."

## Modes
- **lean** (default): review only, on substantial plans. Token-light.
- **full** (opt-in via routing-mode.sh): aggressive multi-model. Tokens ignored.
