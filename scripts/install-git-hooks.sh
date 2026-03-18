#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --show-toplevel >/dev/null 2>&1; then
  echo "Not inside a Git worktree; skipping hook installation."
  exit 0
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

chmod +x .githooks/pre-commit .githooks/pre-push scripts/run-pre-commit.sh
git config core.hooksPath .githooks

echo "Configured core.hooksPath to .githooks in ${REPO_ROOT}."
echo "If hooks complain about missing pre-commit, install it with brew, uv, or pipx."
