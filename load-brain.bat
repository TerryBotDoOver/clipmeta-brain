@echo off
REM ClipMeta Brain Auto-Loader for Claude Code (Windows)
REM Run this at session start to load full context

set BRAIN_DIR=%USERPROFILE%\Documents\ClipMeta_Brain

echo === Loading ClipMeta Brain ===
echo.

echo --- CLAUDE.md (Operating Instructions) ---
type "%BRAIN_DIR%\CLAUDE.md"
echo.

echo --- Current State ---
type "%BRAIN_DIR%\memory\current_state.md"
echo.

echo --- Active Issues ---
type "%BRAIN_DIR%\memory\active_issues.md"
echo.

echo --- Next Actions ---
type "%BRAIN_DIR%\memory\next_actions.md"
echo.

echo --- Live Business Context ---
type "%BRAIN_DIR%\product\live_business_context.md"
echo.

echo === Brain loaded. Ready to operate. ===
