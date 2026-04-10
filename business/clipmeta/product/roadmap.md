# ClipMeta Product Roadmap (Updated April 9, 2026)

## Phase 1: Convert (NOW)
Goal: Turn heavy free users into paying users.

- Identify high-volume free users from Supabase data
- Add value signals at limit boundaries
- helton_1818 outreach (trial ending soon, 194 clips, top target)
- Test free tier limit adjustments
- Improve pricing page with feature comparison
- Track conversion funnel: signup > first batch > limit hit > upgrade

Success metric: Paying users from 4 to 15+, MRR to $150+

---

## Phase 2: Metadata Quality + Retention
Goal: Make metadata so good that paying users stay.

- Diagnose repetition root cause in generateMetadata.ts
- Expand keyword diversity (multi-pass generation or post-processing)
- Surface per-clip quality scores in review UI
- Improve batch review UX (fewer clicks, bulk approve, inline editing)
- Add "metadata diff" for regenerations

Success metric: Zero churn of paying users, lower edit rate

---

## Phase 3: Stabilize Ops
Goal: Make the system reliable and observable.

- Clean hardcoded secrets from video-worker/worker.js (move to env vars)
- Add error tracking for API routes
- Expand admin dashboard
- Video worker health monitoring

Success metric: No silent failures, clear visibility

---

## Phase 4: Grow
Goal: Scale acquisition and revenue.

- Optimize Google Ads with conversion data
- Refresh Meta access token and resume social content pipeline
- Annual billing push
- Creator testimonials on landing page
- SEO via blog (cron active Mon/Wed/Fri)

Success metric: 100+ users, 20+ paying, $300+ MRR

---

## Phase 5: Expand
Goal: Deepen the product moat.

- Direct upload to stock platforms via APIs
- Creator analytics (keyword performance, quality trends)
- Team/agency tier
- API access for power users
- Platform-specific keyword optimization
