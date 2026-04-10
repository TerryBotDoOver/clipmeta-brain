# ClipMeta Brain

Knowledge base and operating system for Claude Code to autonomously operate ClipMeta.

## Purpose

Transform Claude Code from "helper" to "autonomous operator" for ClipMeta SaaS.

Claude Code should be able to:
- Understand context from this brain
- Make code changes
- Run git workflow
- Deploy to Vercel
- Verify results
- Update memory
- Report back

**With minimal hand-holding.**

## Quick Start for Claude Code

1. **Load the brain at session start:**
   ```bash
   bash ~/Documents/ClipMeta_Brain/load-brain.sh
   ```

2. **Read START_HERE.md** for quick reference

3. **Follow CLAUDE.md** for operating behavior

4. **Use backend/deployment.md** for deploy workflow

## Structure

```
ClipMeta_Brain/
├── START_HERE.md           # Quick startup guide
├── CLAUDE.md              # Operating instructions and behavior rules
├── load-brain.sh          # Auto-loader script (Linux/Mac)
├── load-brain.bat         # Auto-loader script (Windows)
├── README.md              # This file
│
├── backend/
│   └── deployment.md      # Full deployment workflow + credentials
│
├── memory/                # Session-persistent memory
│   ├── current_state.md   # Current system snapshot
│   ├── active_issues.md   # Known problems
│   ├── next_actions.md    # Prioritized task queue
│   ├── decisions_log.md   # Why decisions were made
│   └── session_handoff.md # Cross-session continuity
│
├── product/               # Business context
│   ├── live_business_context.md  # Metrics, users, goals
│   ├── product_stack.md          # Tech stack details
│   └── roadmap.md                # Product roadmap
│
└── dev/
    └── feature_backlog.md # Feature ideas and requests
```

## Files Load Order (Priority)

1. **CLAUDE.md** - Operating instructions
2. **memory/current_state.md** - Current state
3. **memory/active_issues.md** - Known issues
4. **memory/next_actions.md** - Task queue
5. **product/live_business_context.md** - Business metrics

## Memory Maintenance

After completing significant work, update:
- `memory/current_state.md` - what changed
- `memory/decisions_log.md` - why you did it
- `memory/next_actions.md` - what's next

This keeps context accurate across sessions.

## Operating Principles

From CLAUDE.md:
- Default to ACTION, not explanation
- If intent is 70%+ clear, execute
- Don't ask permission unless risky
- Always propose next steps
- Ship fast with acceptable quality
- Update memory after major work

## Key Resources

- **ClipMeta production:** https://clipmeta.app
- **GitHub (ClipMeta):** https://github.com/TerryBotDoOver/clipmeta
- **GitHub (Brain):** https://github.com/TerryBotDoOver/clipmeta-brain
- **Vercel:** https://vercel.com/terrybotdoover/clipmeta
- **Supabase:** https://iprnnrdjnoemhmcypseh.supabase.co

## Version

**v2.0** - Adapted from Hermes (April 2026)
