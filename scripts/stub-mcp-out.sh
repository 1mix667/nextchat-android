#!/bin/bash
# Restore the original app/mcp/actions.ts after a static-export build.
# Verifies the restore is byte-identical to the pre-build backup.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$ROOT/app/mcp/actions.ts"
BACKUP="$ROOT/app/mcp/actions.ts.exportbak"

if [ ! -f "$BACKUP" ]; then
  echo "[stub-mcp-out] no backup found, nothing to restore" >&2
  exit 1
fi
cp "$BACKUP" "$TARGET"
if cmp -s "$BACKUP" "$TARGET"; then
  echo "[stub-mcp-out] app/mcp/actions.ts restored (identical to original)"
else
  echo "[stub-mcp-out] ERROR: restore mismatch!" >&2
  exit 1
fi
rm -f "$BACKUP"
