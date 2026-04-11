# ListingMeta

> AI-powered photo/video metadata tool for real estate photographers. Concept captured 2026-03-30, ON BACKBURNER until validated.
> Captured 2026-04-11 from Terry's MEMORY.md.
> Part of [[business|business]]'s graph.

## What it would be
A metadata generation tool specifically for real estate photographers — same engineering pattern as [[clipmeta|ClipMeta]] but targeting a different vertical. Real estate photographers shoot 50-150 photos per property and manually tag/organize/deliver them. ListingMeta would automate the metadata layer.

## Why this exists (the gap)
- **No tool exists for individual real estate photographers**
- Restb.ai is enterprise-only ($500+/mo)
- Aryeo does business management, not metadata
- Individual photographers are stuck doing this manually
- Market: ~150K RE photographers in the US
- Pricing potential: $29-49/mo

## Status: BACKBURNER
**Why backburner:** Not validated yet. Need to interview 2 real estate photographers BEFORE building anything. Levi was supposed to reach out for interviews "this week" (~3/30 weekly view).

**As of 2026-04-11:** No update on whether the interviews happened. [[levi|Levi]] should confirm whether this is still on the table or quietly killed.

## Tech approach
Fork the [[clipmeta|ClipMeta]] core. Same stack:
- Next.js
- Supabase (auth + DB)
- Cloudflare R2 (storage)
- OpenAI GPT-4o (vision + text)

The engineering would be straightforward — most of the value is in the prompts, the platform-specific export formats (real estate has different needs than stock footage), and the customer discovery work.

## Discord setup
A LISTINGMETA category exists in [[levi|Levi]]'s Discord with channels:
- `#general`
- `#research`
- `#features`
- `#build-log`
- `#marketing`

## Honest pushback (per CLAUDE.md rules)
This is a textbook "secondary product" idea. The pattern is:
1. Founder has a working SaaS in vertical A
2. Notices a similar pain point in vertical B
3. Decides to fork the codebase

The trap: the engineering is the easy part. The hard part is the **second** customer discovery cycle. Real estate photographers have completely different buying patterns than stock footage contributors. They're more relationship-driven, less tech-savvy on average, and harder to reach.

**Don't build until you've talked to at least 5 RE photographers who say "yes I would pay $29/mo for this."** And those conversations should happen BEFORE writing any code. The fact that this has sat on the backburner for ~2 weeks without progress is fine — it's the right call. If [[levi|Levi]] hasn't been able to find 2 RE photographers to interview, that's data: either the customer is hard to reach, or the urgency isn't there.

## What to revisit
1. Has Levi actually reached out to RE photographers?
2. What did they say?
3. Is there genuine pull, or just an idea Levi had?
4. Compare effort/return vs the [[idea|drone golf courses idea]] which is also a "fork existing skills into new vertical" play

## Cross-references
- [[business|Business hub]]
- [[clipmeta|ClipMeta]] — the codebase this would fork from
- [[idea|Drone golf courses idea]] — similar "fork existing skills" pattern
