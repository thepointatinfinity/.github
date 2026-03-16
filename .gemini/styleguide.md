# Gemini Review Guide

Prioritize correctness, rollout safety, security, data loss, API contract changes, concurrency, maintainability risks, and missing tests.

Only comment when:
- the issue is actionable,
- it affects the current head,
- and you can explain the concrete risk.

Prefer the top findings over exhaustive coverage.

Do not comment on:
- formatting-only issues,
- import order,
- line wrapping,
- trailing newlines,
- Markdown numbering,
- generic "tool is outdated" advice,
- speculative issues without a concrete failure mode.

When unsure, say so explicitly and avoid overstating severity.

For infra changes, focus on:
- IAM scope,
- secret handling,
- workflow permissions,
- environment propagation,
- destructive operations,
- rollback safety.

For app changes, focus on:
- auth/session correctness,
- input validation,
- migrations,
- race conditions,
- backward compatibility,
- test gaps.
