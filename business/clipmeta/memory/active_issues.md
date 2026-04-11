# Active Issues

> Known bugs, security risks, ops issues. Cross-references: [[next_actions]] · [[dev/feature_backlog]] · [[mistakes]]


## Security
- **Stripe live secret key sat in plain text** in `dashboard/server.js` for an unknown amount of time. Discovered + cleaned up 2026-04-11. **Should be rotated** as a follow-up. Risk is low (machine isn't compromised that we know of), but rotation is good hygiene.
- **video-worker/worker.js still has hardcoded secrets** (lines 24-47): Supabase key (now the OLD rotated key, won't work, but still in plain text), R2 access keys, worker secret. Must be moved to env vars.

## Bugs
- Metadata repetition: clips in same batch get similar titles/keywords despite uniqueness enforcement. Existing mitigation (existingTitles, overused adjective detection, keyword root dedup) is insufficient for visually similar clips.
- Batch review UX: too many clicks to review and approve a full batch.

## Ops
- Meta/Facebook access token expired March 27. Social content pipeline is paused. Levi needs to generate a new long-lived Page Access Token.
- Content crons paused for cost savings. Can resume when Meta token is refreshed.
- Mission Control dashboard's Hermes-self-reported sections (terry-status, task-log, MISSION_CONTROL.md) had been stale ~28 days because Hermes stopped reporting. As of 2026-04-11, Claude updates these after every meaningful work session per the new discipline in CLAUDE.md.

## Business
- Revenue concentrated in 4 paying users (single-customer-loss risk)
- **[[helton]]** is the most active trial user (Studio, NOT free). Auto-converts at 2026-04-11 08:01 UTC. ~90% predicted conversion. **CORRECTION:** brain previously called him "heaviest free user" — that was wrong, he was on Studio trial since 2026-04-04. See [[mistakes]].
- OpenAI GPT-4o costs scale with free tier usage without revenue offset
- Studio plan margins are thin at the cap (~15% margin / ~$7 profit per user at 2000 clips). Pro is your best-margin paid tier.
