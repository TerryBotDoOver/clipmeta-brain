#!/bin/bash
# ClipMeta Brain Auto-Loader for Claude Code
# Run this at session start to load full context

# Support both Windows (via WSL) and native paths
if [ -d "/mnt/c/Users/levic/Documents/ClipMeta_Brain" ]; then
    BRAIN_DIR="/mnt/c/Users/levic/Documents/ClipMeta_Brain"
else
    BRAIN_DIR="$HOME/Documents/ClipMeta_Brain"
fi

echo "=== Loading ClipMeta Brain ==="
echo ""

# Priority 1: Operating instructions
echo "--- CLAUDE.md (Operating Instructions) ---"
cat "$BRAIN_DIR/CLAUDE.md"
echo ""

# Priority 2: Current state
echo "--- Current State ---"
cat "$BRAIN_DIR/memory/current_state.md"
echo ""

# Priority 3: Active issues
echo "--- Active Issues ---"
cat "$BRAIN_DIR/memory/active_issues.md"
echo ""

# Priority 4: Next actions
echo "--- Next Actions ---"
cat "$BRAIN_DIR/memory/next_actions.md"
echo ""

# Priority 5: Product context
echo "--- Live Business Context ---"
cat "$BRAIN_DIR/product/live_business_context.md"
echo ""

echo "=== Brain loaded. Ready to operate. ==="
