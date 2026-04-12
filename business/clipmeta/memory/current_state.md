# Current State

> Live snapshot of ClipMeta. Cross-references: [[working_context]] · [[next_actions]] · [[active_issues]] · [[product/roadmap]] · [[product/live_business_context]] · [[product/product_stack]] · [[dev/feature_backlog]]


## Project: ClipMeta
- Live SaaS for stock footage creators
- AI-powered batch metadata generation, review, and CSV export
- Stage: Post-launch, revenue-generating, growth phase
- Users: ~55 total, 4 paying
- MRR: ~$46.50 (likely ~$95.50 in ~5 hours if [[helton]] auto-converts from Studio trial as expected)
- Domain: clipmeta.app
- **Studio regen cap added 2026-04-11:** 500/mo (was effectively unlimited via 999999 sentinel). Removes unbounded loss risk.
- **Top conversion event tonight:** [[helton|Helton A da Silva]] — Studio trial converts at 2026-04-11 08:01 UTC. ~90% predicted conversion. See [[helton]] for full profile.

## Codebase
- Path: C:\Users\levic\.openclaw\workspace\clipmeta\clipmeta
- Git: https://github.com/TerryBotDoOver/clipmeta.git (active, pushed today)
- Deploys via Vercel CLI to production

## Architecture
- Next.js App Router with TypeScript
- Supabase (database + auth)
- Cloudflare R2 (file storage)
- Stripe (billing)
- OpenAI GPT-4o (metadata generation, vision + text)
- Resend (email)
- Vercel (hosting)

## Key Modules
- generateMetadata.ts: Core AI generation with extensive stock-platform prompt engineering
- plans.ts: 4 tiers + annual plans + credit packs, regen limits, rollover caps
- csvExport.ts: Multi-platform CSV (Blackbox primary, Shutterstock, Adobe, Pond5, Generic)
- Video worker: Local Dell machine, ffmpeg for ProRes/MOV extraction

## Automation (Hermes Cron System)
13 active crons on haiku, 7 paused for cost savings:

Active:
- Email Drip (free + paid): daily 10am
- Welcome Emails: 2x/day
- Signup Monitor: 2x/day
- Referral + Rollover: daily 6am
- Customer Email Checker: every 4h
- Full QA Suite: daily 4am
- Critical QA: daily 6pm
- Cron Health Monitor: daily 9pm
- Stripe Reconciliation: daily 8am
- Feedback Check: daily 9am
- Reddit Lead Finder: 2x/day
- Daily Intelligence Briefing: daily 5am
- Blog Post Writer: Mon/Wed/Fri 9am

Paused (cost saving):
- Google Ads Daily Reminder
- Google Ads API Approval Check
- Content Script Writer
- Content Creator
- Content Post Scheduler (Meta token expired)
- Daily SEO + Speed Check
- Self-Serve Deletion Reminder (monthly, runs May 1)

## Ads & Conversion Tracking (Updated 2026-04-12)

### Google Ads
- Campaign: "Campaign #1" (Performance Max), $5/day budget
- Customer ID: 667-455-6090 (MCC: 207-582-7325)
- Conversion label: `AW-18071437581/oEmICIrewpccEI2CkalD` — **fixed and verified 2026-04-12** (was missing label suffix, showing Misconfigured/Inactive)
- Total spend to date: $20.42, 34 clicks, 0 conversions (pre-fix)
- API access: developer token in test mode, awaiting compliance approval (applied 2026-04-08, follow up 2026-04-15 if no reply)

### Reddit Ads
- Campaign: "ClipMeta - Stock Footage Creators", $5/day budget, CONVERSIONS objective
- Account ID: a2_it6x1qz99k3n
- Targeting: r/videography, r/stockphotography, r/Filmmakers, r/photography | US, CA, GB, DE, NL, AU
- API connected and working (OAuth app: ClipMeta Ads Reporter)
- Total spend to date: $19.03, 56 clicks, 1 signup, 0 purchases
- CPC trending down: $0.94 → $0.18 over 5 days

### Meta Pixel
- Pixel ID: 1447998937339743
- Deployed on clipmeta.app (component + noscript fallback)
- Fires: PageView (all routes), Purchase + Subscribe (on upgrade), CompleteRegistration (signup)
- Fixed duplicate firing 2026-04-12 (inline script + component were both loading)

### Reddit Pixel
- Pixel ID: a2_it6x1qz99k3n (inline in layout.tsx)
- Fires: PageVisit (all pages), Purchase (on upgrade via ConversionTracker)

### Mission Control Ads Dashboard
- New "Ads" tab in ClipMeta Hub — live Reddit data (API refresh), manual Google data
- Combined spend view across both platforms

## Recent Completed Work (April 8-9, 2026)
- Fixed plan limit enforcement (clips table user_id issue)
- Added regeneration limits by plan (Free 1/day, Starter 100, Pro 300, Studio unlimited)
- Regen tracking on dashboard + pricing page
- Editorial toggle (project-level + per-clip override)
- Mandatory keyword positioning (beginning/middle/end)
- Keywords visible in preview with purple highlights
- ProRes/MOV auto-generate (server-side frame extraction)
- Review page auto-refresh
- Adjective and category diversity improvements
- Keyword count minimum enforced (40+)
- clip_history table for lifetime tracking
- Google Ads conversion tracking deployed
- Referral system overhauled: qualification now requires paid plan conversion
- Referral widget added to dashboard (copy link, stats, tier progress)
- Referral tiers made more generous (5 tiers up to Pro forever)
- Product update email sent to all 53 users
- Secrets audit: removed hardcoded Supabase key from check-feedback.mjs
- Git history cleaned (filter-branch)
- Supabase keys rotated and updated in Vercel + .env.local + cron scripts
- GitHub push working (TerryBotDoOver/clipmeta, force pushed with clean history)
- Usage/regen logic refactored: dedicated regens_used_this_month counter
- Default Hermes model switched from Opus to Sonnet for cost savings

## Current Priorities
1. Conversion: free to paid, especially helton_1818
2. Metadata quality: fix repetition across batches
3. Ops stability: monitoring, error visibility
4. Onboarding/UX: reduce friction
5. Retention: keep paying users
