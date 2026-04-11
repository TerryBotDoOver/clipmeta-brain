# Helton A da Silva (helton_1818)

> ClipMeta's most active trial user. Studio plan trial. Auto-converts 2026-04-11 ~08:01 UTC.
> Cross-references: [[current_state|ClipMeta state]] · [[live_business_context]]

## Identity
- **Name:** Helton A da Silva
- **Email:** helton_1818@hotmail.com
- **Country (billing):** Ireland
- **Language signal:** Project named "Abril 2026" — Spanish/Portuguese, likely Brazilian or Portuguese living in Ireland
- **Stripe customer ID:** `cus_UGx0NMgfT3HPTi`
- **Stripe subscription ID:** `sub_1TIP8eHwyttCVHwalsvAuyhA`
- **Supabase user ID:** `4437bb2f-bbf4-4c56-9e75-18515966fb8e`

## Plan + status (as of 2026-04-11 02:30 UTC)
- **Plan:** Studio ($49/month, top tier)
- **Status:** trialing
- **Trial start:** 2026-04-04 08:01 UTC
- **Trial end:** 2026-04-11 08:01 UTC (~5h from snapshot time)
- **Auto-convert:** Yes — Stripe Link payment method on file, no cancel signal
- **Currency:** EUR (presented)
- **Drip track:** paid

## Usage pattern (signup to 2026-04-11)
| Day | Created | Deleted | Net |
|---|---|---|---|
| Apr 4 (signup) | -- | -- | -- |
| Apr 5 | -- | -- | -- |
| Apr 6 | 24 | 0 | +24 |
| Apr 7 | 131 | 104 | +27 |
| Apr 8 | 171 | 139 | +32 |
| Apr 9 | 124 | 83 | +41 |
| Apr 10 | 53 | 165 | -112 (cleanup day) |
| Apr 11 (trial end day) | 22 | 0 | +22 |
| **Lifetime** | **525** | **491** | **34 current** |

- **Regenerations:** **0** (zero across his entire history — accepts first-pass output)
- **clips_used_this_month:** 941 (inflated by the now-fixed double-increment bug)

## Projects
1. "Test" — Apr 4 → deleted Apr 5 (testing the product)
2. "Abril 2026" — Apr 4 → deleted Apr 9 (main project, processed his April footage)
3. **"BlackBox April 1"** — Apr 5 → still active
4. "Project 2" (dupe) — Apr 10 → deleted 10 min later (UI mistake)
5. **"Project 2"** — Apr 10 23:48 UTC → still active, 22 uploads (created hours before trial end)

All projects target **Blackbox** as the export platform.

## Workflow interpretation
Power user processing a stock footage backlog. Pattern is: upload batch → generate metadata → presumably export CSV → delete clips to free space → next batch. The 91% lifetime delete rate is normal workflow hygiene, not abuse.

He picked Studio because his volume (~75 clips/day average) crushes the lower tiers — Pro caps at 320/month total. He intentionally chose the right plan for his needs.

## Conversion prediction (made 2026-04-11 02:30 UTC)
**~90% likelihood of conversion** based on:

**Strong positives:**
1. Started a brand new project hours before trial end (Project 2, 22 uploads same day) — people who plan to cancel don't start new work
2. Active TODAY with 22 fresh uploads
3. Stripe Link payment method already attached
4. `cancel_at_period_end: false` — no cancel signal
5. Real billing name (Helton A da Silva) — not throwaway
6. Picked Studio intentionally (top tier)
7. Volume justifies the price (525 clips in 7 days)
8. 0 regens = no frustration signal

**Risk:**
- Apr 10 cleanup day was suspicious until he came back Apr 11 with new uploads
- Generic trial-cliff cancellation rate (~5-10%)

## Unit economics
- Net revenue (after Stripe): $47.28/month
- OpenAI cost at his projected pace (~2,000 clips/mo cap): $40
- **Net profit: ~$7.28/month** (~$87/year)
- He's near the bottom of Studio's profitability range, but still profitable
- 0 regens means he's not contributing to the unbounded loss scenario that prompted the [[decisions_log|Studio regen cap]]

## What I should remember about him
- He doesn't know about regenerations (or doesn't care to use them) — there may be onboarding/feature-discovery work needed
- He's the kind of customer who proves Studio is the right product for serious contributors
- His existence single-handedly will take ClipMeta from $46.50 → $95.50 MRR
- If you ever email him, name him by his real name (Helton) — not the handle
- His native language is probably Portuguese — keep marketing copy simple if you reach out

## Decision: don't intervene before trial end
Reaching out 5 hours before billing risks reminding him about the upcoming charge and triggering a cancellation. Let auto-conversion happen.

## What to do AFTER conversion
- Send a "thanks for joining" email that acknowledges his volume specifically (makes him feel seen)
- Ask what's working / what's not (low-stakes feedback)
- Watch for his Apr 11+ usage pattern (does he stay heavy or slow down?)
- If he stays at this pace, he's a long-term customer worth nurturing carefully
