#!/usr/bin/env bash
# check-docs.sh — MDC Workflow document timestamp validator
# Scans project-docs/ for last_updated fields and compares against
# git log modification times of linked code modules.
# Usage: bash scripts/check-docs.sh [--verbose] [--fix]

set -euo pipefail

VERBOSE=false
FIX=false
STALE_COUNT=0
OK_COUNT=0

for arg in "$@"; do
  case "$arg" in
    --verbose|-v) VERBOSE=true ;;
    --fix|-f) FIX=true ;;
    --help|-h)
      echo "Usage: check-docs.sh [--verbose] [--fix]"
      echo "  --verbose  Show detailed comparison for each document"
      echo "  --fix      Suggest fixes for stale documents"
      echo "  --help     Show this help"
      exit 0
      ;;
  esac
done

# Check if we're in a git repo
if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "[WARN] Not a git repository. Cannot compare against git history."
  echo "       Only checking for presence of last_updated fields."
  GIT_AVAILABLE=false
else
  GIT_AVAILABLE=true
fi

# Find all markdown files in project-docs
DOCS=$(find project-docs -name "*.md" -type f 2>/dev/null | sort)

if [ -z "$DOCS" ]; then
  echo "[INFO] No documents found in project-docs/"
  exit 0
fi

echo "=== MDC Document Timestamp Check ==="
echo ""

while IFS= read -r doc; do
  # Extract last_updated field
  TIMESTAMP=$(grep -oP 'last_updated:\s*\K\d{8}-\d{4}' "$doc" 2>/dev/null || echo "")

  if [ -z "$TIMESTAMP" ]; then
    echo "[MISSING] $doc — no last_updated field"
    STALE_COUNT=$((STALE_COUNT + 1))
    if $FIX; then
      echo "  → Add to header: > last_updated: $(date +%Y%m%d-%H%M)"
    fi
    continue
  fi

  # Extract linked code modules (if any)
  MODULES=$(grep -oP '关联代码模块[：:]\s*\K.*' "$doc" 2>/dev/null || echo "")

  if [ -z "$MODULES" ] || ! $GIT_AVAILABLE; then
    if $VERBOSE; then
      echo "[OK]    $doc — last_updated: $TIMESTAMP (no linked code to compare)"
    fi
    OK_COUNT=$((OK_COUNT + 1))
    continue
  fi

  # Compare doc timestamp with last git modification of linked code
  DOC_DATE="${TIMESTAMP:0:8}"
  DOC_TIME="${TIMESTAMP:9:4}"

  # Check each linked module path
  STALE=false
  for module in $MODULES; do
    # Remove trailing punctuation
    module=$(echo "$module" | sed 's/[,\/]*$//')
    if [ -n "$module" ] && [ -e "$module" ]; then
      LAST_CODE_CHANGE=$(git log -1 --format="%ai" -- "$module" 2>/dev/null | head -1 || echo "")
      if [ -n "$LAST_CODE_CHANGE" ]; then
        CODE_DATE=$(echo "$LAST_CODE_CHANGE" | cut -d' ' -f1 | tr -d '-')
        if [ "$DOC_DATE" -lt "$CODE_DATE" ]; then
          STALE=true
          if $VERBOSE || true; then
            echo "[STALE] $doc"
            echo "        doc: $TIMESTAMP  |  code ($module): $LAST_CODE_CHANGE"
          fi
        fi
      fi
    fi
  done

  if ! $STALE; then
    if $VERBOSE; then
      echo "[OK]    $doc — last_updated: $TIMESTAMP"
    fi
    OK_COUNT=$((OK_COUNT + 1))
  else
    STALE_COUNT=$((STALE_COUNT + 1))
  fi
done <<< "$DOCS"

echo ""
echo "=== Summary ==="
echo "  OK:     $OK_COUNT"
echo "  Stale:  $STALE_COUNT"
echo ""

if [ "$STALE_COUNT" -gt 0 ]; then
  echo "[ACTION] $STALE_COUNT document(s) need updating."
  echo "         Run with --fix for suggestions, or ask AI to sync them."
  exit 1
else
  echo "[CLEAN] All documents up to date."
  exit 0
fi
