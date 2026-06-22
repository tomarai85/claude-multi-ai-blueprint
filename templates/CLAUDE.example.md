# CLAUDE.md (lean multi-AI excerpt)

Drop this section into your project's CLAUDE.md.

## Second-model review (lean, default)

Before implementing any **substantial** plan, get a second-model review of the PLAN
(not the code). "Substantial" = touches contracts / routing / persistence / auth /
infra / agent behavior / external sends, or roughly > 150 LOC or > 3 files.

- Call the reviewer with the plan text only, token-light (see `codex-plan-review.md`).
- The reviewer returns PASS | REVISE | ESCALATE.
- Record `Reviewer verdict: <X> — <how handled>` in the plan before implementing.
  No verdict recorded = do not implement.

Skip the review for local, reversible, trivial changes.

Default mode is **lean** (review only). Switch to **full** multi-model with
`routing-mode.sh full` only when you explicitly want it.
