# Active Issues

## Security
- video-worker/worker.js still has hardcoded Supabase service key and R2 credentials (lines 24-47). Must be moved to env vars. Note: the Supabase key in this file is now the OLD rotated key and won't work, but it should still be cleaned up.

## Bugs
- Metadata repetition: clips in same batch get similar titles/keywords despite uniqueness enforcement. Existing mitigation (existingTitles, overused adjective detection, keyword root dedup) is insufficient for visually similar clips.
- Batch review UX: too many clicks to review and approve a full batch.

## Ops
- Meta/Facebook access token expired March 27. Social content pipeline is paused. Levi needs to generate a new long-lived Page Access Token.
- Content crons paused for cost savings. Can resume when Meta token is refreshed.

## Business
- Revenue concentrated in 4 paying users
- helton_1818 is heaviest free user (194 clips, 534 API calls). Key conversion target.
- OpenAI GPT-4o costs scale with free tier usage without revenue offset
