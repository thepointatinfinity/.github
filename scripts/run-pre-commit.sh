#!/usr/bin/env bash
set -euo pipefail

if command -v pre-commit >/dev/null 2>&1; then
  exec pre-commit "$@"
fi

if command -v uvx >/dev/null 2>&1; then
  exec uvx pre-commit "$@"
fi

if command -v python3 >/dev/null 2>&1 && python3 -c 'import pre_commit' >/dev/null 2>&1; then
  exec python3 -m pre_commit "$@"
fi

cat >&2 <<'EOF'
pre-commit is required to run this repository's Git hooks.

Install it with one of:
  brew install pre-commit
  uv tool install pre-commit
  pipx install pre-commit

Then re-run:
  bash scripts/install-git-hooks.sh
EOF

exit 1
