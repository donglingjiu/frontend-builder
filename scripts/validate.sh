#!/usr/bin/env bash
set -euo pipefail
fail() { echo "::error::$1"; exit 1; }
warn() { echo "::warning::$1"; }
[ -s references/preview-protocol.md ] || fail "references/preview-protocol.md missing or empty"
grep -q 'step_id' references/preview-protocol.md || fail "preview-protocol.md missing step_id"
grep -q 'rollback' references/preview-protocol.md || fail "preview-protocol.md missing rollback"
if [ ! -s SKILL.md ] && [ ! -s README.md ]; then warn "no SKILL.md / README.md (pre-existing)"; fi
echo "OK: frontend-builder validated: preview protocol"
