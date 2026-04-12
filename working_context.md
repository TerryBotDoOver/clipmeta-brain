# Working Context

> Snapshot of what's loaded in my head right now. Read first at session start.
> Continuously updated throughout each session.
> Part of [[levi]]'s graph -- this is the live "what's happening" view of his focus.

---

## Active Focus
Late-night ads blitz session (2026-04-12). All three ad platforms now have working conversion tracking. Ads dashboard built in Mission Control. Reddit Ads API fully connected. Google Ads API blocked on compliance approval.

## Time-sensitive — read first next session
1. **Google Ads API compliance follow-up** — if no reply by 2026-04-15, send a nudge email to ads-api-compliance@google.com. The response Levi sent on 2026-04-08 was thorough.
2. **First Google Ads conversion watch** — now that the conversion label is fixed, the next real upgrade should register as a conversion. Check Google Ads dashboard.
3. **[[helton|Helton A da Silva]] trial conversion check** — was expected at 2026-04-11 08:01 UTC. Verify in Stripe + Supabase.

## Recently Completed (this session — 2026-04-12)
- Meta Pixel: fixed duplicate firing (inline script + component both loading in layout.tsx). Deployed.
- Google Ads: fixed conversion label (was `AW-18071437581` only, now `AW-18071437581/oEmICIrewpccEI2CkalD`). Verified end-to-end in browser with qa@clipmeta.app test account. Deployed.
- Reddit Ads API: set up OAuth app ("ClipMeta Ads Reporter"), completed auth flow, pulled campaign data via API
- Reddit Ads performance review: $19.03 spent, 56 clicks, CPC trending down to $0.18, 1 signup
- Google Ads performance review (manual CSV): $20.42 spent, 34 clicks, 0 conversions (pre-fix)
- Mission Control: built Ads tab in ClipMeta Hub with live Reddit data refresh + Google manual snapshot + combined summary
- qa@clipmeta.app password reset to `ClipMetaQA2026!` for testing
- Credentials saved: Reddit Ads creds in Claude memory, Hermes directory, and dashboard .env
- Brain graph updated: [[clipmeta_ads]], [[current_state]], [[live_business_context]], [[meta_pixel_implementation]]

## Open Threads
- Google Ads API compliance approval (follow up Apr 15)
- helton conversion check
- Metadata repetition fix
- Discord bot token still broken
- FB Page Access Token still expired
- Metadata Grader still undeployed

## Notes for Next-Me
- Reddit Ads API refresh: one-click in Mission Control Ads tab, or `POST /api/ads/reddit/refresh`
- Google Ads data is manual until API approved — update via `POST /api/ads/google` with snapshot JSON
- Conversion tracking now works on all 3 platforms (Google, Meta, Reddit) via ConversionTracker.tsx
- qa@clipmeta.app test account: `ClipMetaQA2026!`
- All Hermes-accessible creds at `/home/lb12340/.hermes/reddit-ads-*.json` and `google-ads-*.json`
