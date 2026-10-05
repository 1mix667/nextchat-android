#!/bin/bash
# Temporarily replace app/mcp/actions.ts ("use server") with the static-export
# stub (scripts/mcp-actions.stub.ts). Server Actions are unsupported with
# `output: "export"`, and MCP is server-side-only / disabled by default anyway.
# Paired with stub-mcp-out.sh, which restores the original byte-identically.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$ROOT/app/mcp/actions.ts"
STUB="$ROOT/scripts/mcp-actions.stub.ts"
BACKUP="$ROOT/app/mcp/actions.ts.exportbak"

if [ -f "$BACKUP" ]; then
  echo "[stub-mcp-in] backup already exists, reusing it"
else
  cp "$TARGET" "$BACKUP"
  echo "[stub-mcp-in] backed up app/mcp/actions.ts"
fi
cp "$STUB" "$TARGET"
echo "[stub-mcp-in] stub installed"
