# ClipMeta Ads — Status & Performance

> Updated 2026-04-12. See also: [[meta_pixel_implementation]], [[current_state]], [[live_business_context]]

## Status
- [x] Review Google Ads performance
- [x] Review Reddit Ads performance
- [x] Implement Meta Pixel on clipmeta.app
- [x] Get conversion tracking working end-to-end (all 3 platforms)
- [x] Build Ads dashboard in Mission Control
- [ ] Google Ads API access (pending compliance approval, follow up 2026-04-15)

## Google Ads
- **Campaign:** Campaign #1 (Performance Max), $5/day
- **Customer ID:** 667-455-6090 | **MCC:** 207-582-7325
- **Conversion label:** `AW-18071437581/oEmICIrewpccEI2CkalD`
- **Performance (Apr 8-12):** $20.42 spent, 1,137 impressions, 34 clicks, 2.99% CTR, $0.60 avg CPC
- **Conversions:** 0 (label was misconfigured until 2026-04-12 fix)
- **API credentials:** stored in `/home/lb12340/.hermes/google-ads-creds.json` + `google-ads-tokens.json`
- **API status:** Developer token `eGJrrABtiO3NUf88TiPtWA` in test mode. Google Ads API enabled in GCP. Compliance response sent 2026-04-08, no reply yet.

## Reddit Ads
- **Campaign:** "ClipMeta - Stock Footage Creators", $5/day, CONVERSIONS objective
- **Account ID:** a2_it6x1qz99k3n | **Business ID:** 59569d70-c57d-41f9-b20d-b0d9e3e91373
- **Targeting:** r/videography, r/stockphotography, r/Filmmakers, r/photography | US, CA, GB, DE, NL, AU
- **Performance (Apr 8-12):** $19.03 spent, 15,742 impressions, 56 clicks, 0.36% CTR, $0.34 avg CPC
- **Conversions:** 34 page visits, 1 signup, 0 purchases
- **Trend:** CPC dropping fast ($0.94 → $0.18), CTR rising (0.16% → 1.11%)
- **API credentials:** stored in `/home/lb12340/.hermes/reddit-ads-creds.json` + `reddit-ads-tokens.json` + dashboard `.env`
- **OAuth app:** "ClipMeta Ads Reporter" (Client ID: `-Cq4sVcjLK-3jfehEeuLHQ`)

## Conversion Tracking Stack
All three platforms fire on `/dashboard?upgraded=true` (Stripe checkout success redirect):
- **Google Ads:** `gtag('event', 'conversion', { send_to: 'AW-18071437581/oEmICIrewpccEI2CkalD' })` — via ConversionTracker.tsx
- **Meta Pixel:** `fbEvent('Purchase')` + `fbEvent('Subscribe')` — via ConversionTracker.tsx
- **Reddit Pixel:** `rdt('track', 'Purchase')` — via ConversionTracker.tsx
- **Meta Pixel PageView:** fires on every route change via MetaPixel.tsx component
- **Reddit Pixel PageVisit:** fires on every page via inline script in layout.tsx

## Mission Control Dashboard
- **Tab:** "Ads" in ClipMeta Hub (`localhost:3131/clipmeta#ads`)
- **Reddit:** Live API refresh, daily breakdown, campaign details
- **Google:** Manual snapshot (auto once API approved), daily breakdown, conversion status
- **Combined:** Total spend, clicks, blended CPC across both platforms

## Cross-references
- [[meta_pixel_implementation]] — pixel install spec
- [[current_state]] — ClipMeta snapshot
- [[live_business_context]] — business context
- [[clipmeta|ClipMeta]] — the product
