# Working Context

> Snapshot of what's loaded in my head right now. Read first at session start.
> Continuously updated throughout each session.
> Part of [[levi]]'s graph -- this is the live "what's happening" view of his focus.

---

## Active Focus
Late-night session wrapping up. Big sweep across Mission Control cleanup, Studio plan economics, [[helton|helton_1818]] deep dive, Studio regen cap deployment. Brain graph getting fuller — added customer profiles + a real correction to mistakes.md.

## Time-sensitive — read first next session
**[[helton|Helton A da Silva]] trial converts at 2026-04-11 08:01 UTC.**
First thing next session: query Stripe + Supabase to confirm whether the conversion happened.
- If YES: send him a "thanks for joining" email that acknowledges his volume specifically. Update MRR. Celebrate.
- If NO: figure out why and learn from it.

## Recently Completed (this session)
- Mission Control dashboard secrets cleanup (8 secrets including Stripe live key moved to .env)
- MISSION_CONTROL.md sync (was 28 days stale)
- terry-status.json + task-log.json updated (16 new task entries for our recent work)
- New CLAUDE.md section: Mission Control dashboard sync discipline
- Helton deep dive — created [[helton|customer profile]] with full identity, usage, prediction
- Discovered helton was NOT on the free plan — Studio trial since Apr 4. Logged in [[mistakes]].
- Studio plan unit economics analysis (per-clip $0.02, Studio at cap = $7 profit, worst case = -$192 loss)
- Studio regen cap deployed (500/mo) — 6 files updated, deployed to production
- Two new persistent feedback rules saved (descriptive tool descriptions + plain-language approval explanations)
- Daily logs + decisions log + active issues + next actions all updated

## Open Threads
- helton conversion check (above) — 5 hours from now
- Stripe key rotation as follow-up to the dashboard cleanup
- Video-worker hardcoded secrets still need cleanup
- Metadata repetition fix
- Morning brief Discord cron (architecture designed, not built)
- helton onboarding (he doesn't seem to know about regenerations)

## Notes for Next-Me
- The brain is now a full life knowledge graph with 14 people files, customer profiles, business folder structure, daily logs, working context, mistakes log
- Levi can SSH into the Dell from the Predator: `ssh -p 2222 levic@clipmeta-dell` (see persistent memory `reference_remote_access`)
- Vault auto-syncs Dell ↔ Predator via Obsidian Git plugin (5min pull, 10min push)
- Vercel deploy: `npx vercel --prod --token vcp_... --yes` from ClipMeta repo dir (token in persistent memory)
- Supabase admin: Management API curl with PAT (see persistent memory `reference_supabase_admin`)
- Stripe live key is in `dashboard/.env` AND in the ClipMeta repo's Vercel env vars
- Mission Control dashboard at http://localhost:3131 (login required, password is `Ja7bFeofjrME1lSL` in `.env`)
- Two persistent feedback rules now active: descriptive tool descriptions + plain-language approval explanations
- Levi explicitly wants pushback, never agree-to-agree, never hallucinate
- Helton's full real name is Helton A da Silva, lives in Ireland, probably Brazilian/Portuguese
