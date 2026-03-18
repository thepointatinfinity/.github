#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

if ! git -C "$REPO_ROOT" rev-parse --show-toplevel >/dev/null 2>&1; then
  echo "Git hook installer must live inside a Git worktree; skipping installation."
  exit 0
fi

REPO_ROOT="$(git -C "$REPO_ROOT" rev-parse --show-toplevel)"
cd "$REPO_ROOT"

chmod +x .githooks/pre-commit .githooks/pre-push scripts/run-pre-commit.sh
git config core.hooksPath .githooks

echo "Configured core.hooksPath to .githooks in ${REPO_ROOT}."
echo "If hooks complain about missing pre-commit, install it with brew, uv, or pipx."
