#!/usr/bin/env bash
# Toggle how aggressively you use a second model.
#   lean (default) = reviewer only, token-light
#   full           = aggressive multi-model, tokens ignored
# usage: routing-mode.sh [lean|full|show|clear]
set -euo pipefail
f="${TMPDIR:-/tmp}/claude-routing-mode"
case "${1:-show}" in
  lean|full) echo "$1" > "$f"; echo "routing mode = $1  ($f)";;
  show)      echo "routing mode = $(cat "$f" 2>/dev/null || echo 'lean (default, unset)')";;
  clear)     rm -f "$f"; echo "routing mode cleared -> lean (default)";;
  *)         echo "usage: routing-mode.sh [lean|full|show|clear]"; exit 1;;
esac
