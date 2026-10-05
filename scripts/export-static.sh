#!/bin/bash
# Static-export build of NextChat for app shells (Capacitor/Tauri).
#
# Upstream `BUILD_MODE=export BUILD_APP=1 next build` fails at
# "Collecting page data" with:
#   "Server Actions are not supported with static export."
# because app/mcp/actions.ts is a "use server" module imported by client
# components. MCP is server-side-only and disabled by default anyway, so this
# script temporarily swaps in scripts/mcp-actions.stub.ts (plain module,
# MCP disabled), runs the export build, and restores the original file —
# even if the build fails. Byte-identical restore is verified.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$ROOT/app/mcp/actions.ts"
STUB="$ROOT/scripts/mcp-actions.stub.ts"
BACKUP="$ROOT/app/mcp/actions.ts.exportbak"

if [ ! -f "$BACKUP" ]; then
  cp "$TARGET" "$BACKUP"
fi
cp "$STUB" "$TARGET"

cleanup() {
  if cmp -s "$BACKUP" "$TARGET"; then
    # build did not touch it; nothing to do
    :
  fi
  cp "$BACKUP" "$TARGET"
  if cmp -s "$BACKUP" "$TARGET"; then
    echo "[export-static] app/mcp/actions.ts restored (identical to original)"
  else
    echo "[export-static] ERROR: restore mismatch!" >&2
    exit 1
  fi
  rm -f "$BACKUP"
}
trap cleanup EXIT

cd "$ROOT"
npx tsx app/masks/build.ts
BUILD_MODE=export BUILD_APP=1 npx next build
