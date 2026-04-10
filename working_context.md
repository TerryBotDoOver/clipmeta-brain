# Working Context

> Snapshot of what's loaded in my head right now. Read first at session start.
> Continuously updated throughout each session.

---

## Active Focus
Just finished the big restructure: ClipMeta_Brain expanded from a project-only vault into a full life knowledge graph. Phase 1 (folder structure) and Phase 2 (CLAUDE.md rewrite) both done. Now we're in the "fill it with real content over time" stage.

## Current Goal
Honor the new role: be a long-term thinking partner across all of Levi's life domains. Push back when needed, never agree just to agree, never hallucinate. Capture what Levi tells me about his life into the right vault files as it comes up.

## Recently Completed (this session)
- Massive ClipMeta bug fix sweep (regen counter, upload limit, dashboard, signup UX, referrals, etc.)
- Built welcome promo reward system (50% off, fireworks, 24h countdown)
- Built shared limit-reached modal
- Fixed referral tracking + qualify cron (was completely broken)
- Set up Obsidian vault with daily logs / mistakes / working context
- Set up SSH + Tailscale + key auth between Dell and Predator
- Set up Obsidian Git plugin for cross-machine vault sync
- Restructured vault into life domains (Phase 1)
- Rewrote CLAUDE.md with expanded role + pushback rules (Phase 2)

## What's Now Possible
- I'm now expected to be a thinking partner across ALL of Levi's life, not just ClipMeta
- New domain folders ready to fill: people, goals, health, learning, creative, finance, routines, journal
- private/ folder gitignored for sensitive content
- Each domain folder has a README.md explaining what goes in it
- ClipMeta files all moved to business/clipmeta/

## Open Threads
- Brain is mostly empty in the new domains -- waiting for Levi to start telling me about his life
- Verify referral qualify cron works end-to-end (need CRON_SECRET or paid signup)
- Build morning brief Discord cron
- helton_1818 conversion outreach
- Fix metadata repetition for similar clip batches

## Tomorrow (2026-04-11)
Levi has limited availability tomorrow:
- Morning/midday: golfing with stepdad
- Evening: dinner with girlfriend + friends
- Light or no work session expected. Don't push hard work, just be ready if he checks in.

## Notes for Next-Me
- The folder is still named ClipMeta_Brain but it's now a full life brain. Don't be confused.
- ClipMeta-specific stuff lives in `business/clipmeta/`
- Read `CLAUDE.md` carefully — the role is meaningfully different from before
- Levi explicitly asked for honest pushback. NEVER agree just to agree. Never hallucinate. Never sycophantic.
- Levi can SSH from Predator to Dell: `ssh -p 2222 levic@clipmeta-dell` (see [[reference_remote_access]] in persistent memory)
- Vault auto-syncs Dell ↔ Predator via Obsidian Git plugin
- Stripe coupon `welcome_reward_50` is live for the welcome offer
- Vercel + Supabase access tokens are in persistent memory (`~/.claude/projects/...`)
