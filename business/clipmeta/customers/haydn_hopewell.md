# Haydn Hopewell

> ClipMeta Pro customer with FOUNDING50 promo. Confirmed paying as of 2026-04-11.
> Captured 2026-04-12 from Stripe data during Finance page build.

## Identity
- **Name:** Haydn Hopewell
- **Email:** (check Stripe — not captured in this session)
- **Plan:** Pro ($19/mo)
- **Status:** Active, paying

## Promo / Discount
- **Coupon:** FOUNDING50
- **Discount:** 50% off Pro plan
- **Duration:** 3 months repeating
- **Effective price:** $9.50/mo during promo
- **Promo expires:** 2026-07-04
- **After expiry:** Full $19/mo (MRR goes from $104.50 → $114)

## Why this matters
Haydn's promo is the reason effective MRR ($104.50) is lower than list MRR ($114). The $9.50 gap was initially misattributed to "mid-cycle subscription timing" — see [[mistakes]] for the correction. The finance collector now reads `subscription.discounts` properly.

## What I should find out
- Email address (pull from Stripe next session)
- Stripe customer ID
- Usage pattern (clips, projects, regens)
- How they found ClipMeta / who gave them the FOUNDING50 code
- Whether they're likely to stay at full price after the promo ends

## Cross-references
- [[customers/README|Customer index]]
- [[clipmeta]] — main product hub
- [[mistakes]] — the MRR gap hand-wave incident
