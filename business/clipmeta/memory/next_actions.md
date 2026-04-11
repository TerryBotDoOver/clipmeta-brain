# Next Actions

> Top priorities for next session. Pulls from [[active_issues]] and [[dev/feature_backlog]]. Updated at session end.

## Time-sensitive (next ~5 hours)
1. **[[helton|Helton A da Silva]] trial converts at 2026-04-11 08:01 UTC.** Check Stripe + Supabase next session to confirm whether the conversion went through. If yes: send a "thanks for joining" email that acknowledges his volume specifically. If no: figure out why and learn from it for future trial users.

## High priority
2. **Rotate the Stripe live secret key.** It sat in plain text on disk for an unknown amount of time. Risk is low (machine isn't compromised that we know of), but rotation is good hygiene now that we just discovered it. Will need to update env vars in dashboard `.env` AND in Vercel production env.
3. **Address `video-worker/worker.js` hardcoded secrets.** The Supabase key there is the OLD rotated one (already invalid), but R2 credentials and worker secret are still in plain text. Move to env vars.
4. **Verify referral qualify cron works end-to-end** with the schema fix. Either trigger manually with CRON_SECRET or wait for next paid signup via referral.
5. **Fix metadata repetition for batches of similar clips.** Existing uniqueness mitigations (existingTitles, overused adjective detection, keyword root dedup) are insufficient when frames are visually similar. Options: multi-pass generation, post-processing similarity check, stronger diversity enforcement.

## Medium priority
6. **Build morning brief Discord cron** (architecture already designed in late-night session). Reads yesterday's daily log + working_context, posts a structured summary to a Discord webhook every morning.
7. **Improve conversion signals at limit boundaries** (continue from earlier work).
8. **Rotate Meta/Facebook access token** (expired March 27) to resume social posting.
9. **Resume content pipeline crons** once Meta token is refreshed.

## Lower priority / when there's time
10. **Audit `dashboard/data/analytics-snapshots.json`** to make sure the fresh ClipMeta Hub stats account for the regen counter fix (the old double-counted values shouldn't be skewing recent snapshots).
11. **Drone footage for high-end golf courses idea** — research the cart screen vendors (Visage, GPS Industries, ClubCar Tempo) to see if they accept third-party content. 30 minutes, gating question. See [[business/drone_golf_courses/idea]].
