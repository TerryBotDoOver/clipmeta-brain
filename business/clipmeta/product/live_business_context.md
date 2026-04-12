# ClipMeta Live Business Context (Updated April 9, 2026)

## Users
- ~55 registered users
- 4 paying customers
- Key users:
  - helton_1818: Pro trial, 194 lifetime clips, 534 API calls/month. NOT paying. Top conversion target.
  - haydnhopewell: Pro, paying $9.50/mo, 55 clips, 22 exports. Solid customer.
  - sakispalskg: Starter, paying $9/mo, 43 clips. Gave detailed feedback, editorial feature built for him.
  - jwnowland: Free, 12 clips, 7 exports. Potential conversion target.

## Revenue
- MRR: ~$46.50
- Plans: Free / Starter ($9) / Pro ($19) / Studio ($49)
- Annual plans available with 18-38% savings
- Credit packs: Small ($5/50 clips), Medium ($14/200), Large ($29/500)
- Stripe handles all billing

## Recently Shipped Features (April 7-9, 2026)
- Plan limit enforcement fix
- Regeneration limits by plan with dedicated counter (regens_used_this_month)
- Regen tracking on dashboard + pricing page
- Editorial toggle (project + per-clip)
- Mandatory keyword positioning (beginning/middle/end)
- Purple keyword highlights in preview
- ProRes/MOV auto-generate
- Review page auto-refresh
- Adjective and category diversity improvements
- Keyword count minimum (40+)
- clip_history table
- Google Ads conversion tracking
- Referral system overhaul (paid-user qualification, 5 generous tiers, dashboard widget)
- FTP transfer (clips from ClipMeta to Blackbox)
- Product update email sent to all users

## Referral System (Current)
- Code = first 8 chars of user UUID
- Qualification: referred user must convert to paid plan (not free, not trialing)
- Tier 1 (1 ref): Both get +50 bonus clips
- Tier 2 (3 refs): Referrer gets 1 month Pro + 50 clips
- Tier 3 (5 refs): Referrer gets 3 months Pro + 100 clips
- Tier 4 (10 refs): Referrer gets 6 months Pro + 200 clips
- Tier 5 (20 refs): Referrer gets Pro forever + 500 clips
- Dashboard widget shows link, stats, tier progress

## Competitive Position
- Competitors: SendStock AI, FreeMetadata, Stocktag, Xpiks, AI Stock Keywords
- ClipMeta differentiator: stock-footage-first workflow, review-first UX, batch processing, multi-platform export
- Market commoditized at shallow end; ClipMeta wins on workflow depth

## Advertising (Updated 2026-04-12)

### Google Ads
- Campaign: Performance Max, $5/day | $20.42 spent, 34 clicks, 0 conv (conversion was misconfigured, fixed 2026-04-12)
- Conversion label: `AW-18071437581/oEmICIrewpccEI2CkalD` — verified working end-to-end
- API: developer token pending compliance approval (follow up Apr 15)

### Reddit Ads
- Campaign: "ClipMeta - Stock Footage Creators", $5/day, CONVERSIONS objective
- $19.03 spent, 56 clicks, 1 signup, 0 purchases | CPC dropping ($0.94 → $0.18)
- Targeting: r/videography, r/stockphotography, r/Filmmakers, r/photography | US/CA/GB/DE/NL/AU
- API connected, live data in Mission Control dashboard

### Meta Pixel + Reddit Pixel
- Both deployed on clipmeta.app with conversion events firing on upgrade
- Meta Pixel duplicate firing bug fixed 2026-04-12

## Current Business Priorities
1. Conversion (free to paid)
2. Metadata quality (fix repetition)
3. Ops stability
4. Onboarding/UX
5. Retention
