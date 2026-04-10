# Working Context

What I'm focused on right now. Updated continuously throughout each session.
This file is the "what's loaded into my head" snapshot. Read first at session start.

---

## Active Focus
Setting up the Obsidian-style memory system based on Alex Finn's video.

## Current Goal
Restructure ClipMeta_Brain so it works as a proper Obsidian vault with daily logs,
mistakes tracking, working context, and cross-agent shared workspace.

## Recently Completed (this session)
- Fixed upload limit too late (block before R2 upload starts)
- Fixed regen vs upload limit collision
- Replaced clips_used_this_month derivation with dedicated regens_used_this_month counter
- Fixed clips_used_this_month double-increment bug
- Built promo reward system (50% off, 24h countdown, fireworks popup)
- Built shared LimitReachedModal for upload + regen limits
- Fixed referral tracking (?ref= param was being silently dropped)
- Fixed referral qualify cron (was crashing on non-existent email/created_at columns)
- Added bonus clips celebration animation
- Fixed dashboard showing soft-deleted projects
- Fixed signup with existing email UX
- Built upload progress bar with glowing gradient + shimmer

## Open Threads
- [[active_issues|Active issues]] still has the video-worker hardcoded secrets risk
- Referral system needs end-to-end test with a paid signup
- Morning brief cron not yet built

## Blockers
None right now.

## Notes for Tomorrow-Me
- Levi uses Vercel CLI deploys via stored token in [[reference_vercel_deploy]]
- Supabase admin SQL via Management API in [[reference_supabase_admin]]
- ClipMeta repo at C:\Users\levic\.openclaw\workspace\clipmeta\clipmeta
- Stripe coupon `welcome_reward_50` exists for the welcome offer
