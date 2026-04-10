# Claude Code Startup Instructions

## Every Session Start

**Run this command FIRST:**
```bash
bash ~/Documents/ClipMeta_Brain/load-brain.sh
```

Or on Windows:
```cmd
%USERPROFILE%\Documents\ClipMeta_Brain\load-brain.bat
```

This loads all necessary context into your session.

## What Gets Loaded

1. **CLAUDE.md** - Your operating instructions
2. **memory/current_state.md** - Current system state
3. **memory/active_issues.md** - Known problems
4. **memory/next_actions.md** - Prioritized task queue
5. **product/live_business_context.md** - Business metrics and users

## Quick Reference

### Deploy ClipMeta
See `backend/deployment.md` for full workflow.

Quick version:
```bash
source ~/Documents/ClipMeta_Brain/.credentials
cd ~/Documents/clipmeta
git add .
git commit -m "Your changes"
git push origin main
vercel --prod --token $VERCEL_TOKEN
```

### Update Memory After Work
When you complete significant work, update:
- `memory/current_state.md` - what changed
- `memory/decisions_log.md` - why you did it
- `memory/next_actions.md` - what's next

### Operating Mode
Follow the rules in CLAUDE.md:
- Default to ACTION, not explanation
- If intent is 70%+ clear, act
- Don't ask permission unless risky
- Always propose next steps
- Update memory after major work

## Key Locations

- **ClipMeta repo:** `C:\Users\levic\Documents\clipmeta`
- **Brain repo:** `C:\Users\levic\Documents\ClipMeta_Brain`
- **Production:** https://clipmeta.app
- **Vercel dashboard:** https://vercel.com/terrybotdoover/clipmeta
- **Supabase:** https://iprnnrdjnoemhmcypseh.supabase.co

## Your Goal

Be an autonomous operator for ClipMeta. Take single instructions and execute end-to-end:
1. Understand context from Brain
2. Make code changes
3. Run git workflow
4. Deploy (preview first)
5. Verify results
6. Update memory
7. Report back

Minimal hand-holding required.
