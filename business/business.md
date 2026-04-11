# Business

> Top-level hub for everything Levi makes money from (or plans to). All ventures live here.
> Part of [[levi]]'s graph.
> Significantly expanded 2026-04-11 after scanning Terry's MEMORY.md.

## Active businesses

### [[clipmeta|ClipMeta]] — AI metadata SaaS for stock footage creators
The newest venture and the one with the highest growth ceiling. Live at clipmeta.app, ~55 users, 4 paying, ~$46.50 MRR (likely jumping to ~$95.50 when [[helton]] auto-converts in ~5 hours).
- See [[clipmeta|the ClipMeta hub]] for everything: state, decisions, customers, roadmap, current priorities.

### [[eternal_frame_productions|Eternal Frame Productions LLC]] — Videography
Levi's videography business: drone, weddings, real estate, commercial. The creative practice ClipMeta was born from. Operational, no active dev tasks.

### [[resale_flipping|Resale / Auction Flipping]]
Side hustle. Buys at auction, flips online or locally.

### [[true_fence_florida|True Fence Florida]] — Keilly's fence company
[[keilly|Keilly]] (Levi's girlfriend) owns this. Levi helps her with the WordPress website. North Port, FL. Now also serves as the **Phase 0 validation customer for [[site_rules|SiteRules]]**.

### [[freelance_web_design|Freelance Web Design]] — Side service
The general "Levi takes on small WordPress jobs from his network" service. True Fence is the first known client. Pricing: $50-150 simple edits, $150-400 medium changes, $400-1,000+ major redesigns.

### [[still_frequency|Still Frequency]] — Faceless YouTube sleep music channel
Started ~2026-04-03. Fully automated AI pipeline: Suno music + FFmpeg Ken Burns over drone footage + RTX 4070 NVENC rendering on the Predator + YouTube auto-upload. **Status uncertain** — first render had issues, may be paused.

### [[served_cold|Served Cold]] — Faceless animated YouTube channel (betrayal/revenge narratives)
Started 2026-03-24. Fully AI-operated: Claude scripts + Flux images + Kling hero shots + ElevenLabs voice. Brand fully designed. Discord channels created. **Status uncertain** — Levi needed to provide YouTube + API credentials.

### [[site_rules|SiteRules]] — Vertical SaaS for fence contractors (Hermes-built)
Web app where fence contractors type an address and get rules, permits, zoning, AI Q&A. Started 2026-04-07 with [[agents|Hermes]]. Charlotte County, FL only at first. Phase 0 validation runs through [[true_fence_florida|Keilly's True Fence company]]. Code exists in `/home/lb12340/SiteRules/app/` (see [[wsl_hermes_workspace]]). Pricing: Free (3 lookups/mo), Pro $29/mo, Team $69/mo.

### [[beekeeper_hive_manager|Beekeeper Hive Manager]] — SaaS for beekeepers (early stage)
Discord category set up under "BEEKEEPER APP" in [[discord_server|Throw It In Reverse]]. Hermes was doing market research and competitor analysis. **No code on disk yet.** No mentions in Hermes sessions after 2026-04-05 — likely stalled at the research phase.

## Tools that support the businesses (not standalone businesses)

### [[video_engine|Video Engine]] — Custom video generation system
Built 2026-03-18 by Terry. Node.js Canvas + FFmpeg. Used to make ClipMeta marketing demos and reels. Reusable for Still Frequency / Served Cold.

## Queued ideas (not yet built)

### [[idea|Drone footage for high-end golf courses]]
Captured 2026-04-11 after a round with [[pete|Pete]] and [[dennis|Dennis]]. Concept: capture real drone footage of every hole at premium courses, license to play on the iPad screens in their golf carts. Gating question is whether the cart screen vendors are walled gardens. Honest pushback in the file.

### [[listing_meta|ListingMeta]] — AI metadata for real estate photographers
ON BACKBURNER. Captured 2026-03-30. Same engineering pattern as ClipMeta but targeting RE photographers ($29-49/mo, ~150K market in US). Blocker: needs 2 RE photographers to interview before building. No update in ~2 weeks.

---

## How the businesses relate

```
                                   LEVI
                                    │
               ┌────────────────────┼─────────────────────────┐
               │                    │                         │
        SOFTWARE/SAAS            CREATIVE                  SERVICES
               │                    │                         │
        ┌──────┼──────┐             │                  ┌──────┼──────┐
        │      │      │             │                  │             │
   ClipMeta  ListingMeta   Eternal Frame Prod    True Fence FL   Other freelance
   (live)    (backburner)        (active)           (active)     (potential)
              │                    │
              │                    ├── Stock footage uploads
              │                    │   (the practice that ClipMeta was born to serve)
              │                    │
              │                    └── Drone skills feed into:
              │                         ├── Still Frequency (sleep music YouTube)
              │                         ├── Served Cold (narrative YouTube)
              │                         └── Drone Golf Courses (new idea)
              │
              └── Forks ClipMeta core for new vertical
```

The drone skill set is the central asset. It feeds the videography business (EFP), the SaaS business (ClipMeta), and several content/automation experiments (Still Frequency, Served Cold, Drone Golf Courses). The resale and freelance work are unrelated income streams.

## Where Levi spends his time
Right now (2026-04-11):
- **ClipMeta** is the active focus. Live product, paying users, real bugs, real growth opportunity.
- **Eternal Frame Productions** runs in the background (operational, not actively growing).
- **True Fence Florida** is an ongoing maintenance engagement.
- **Still Frequency** and **Served Cold** are paused or quietly stalled — both need an "is this still alive?" check.
- **Resale** is a hands-on side hustle (no detail in the brain yet).
- **Drone Golf Courses** is captured but not validated — needs ~30 min of vendor research.
- **ListingMeta** is on backburner.

## My honest read on Levi's portfolio
[[levi|Levi]] has a lot of irons in the fire. ClipMeta is the highest-ceiling and probably deserves the most focus. The two automated YouTube channels (Still Frequency, Served Cold) follow a common pattern: build the pipeline, then content output stalls because the "fully automated" promise needs more curation than the launch plan assumed. The freelance + True Fence work is real income but doesn't scale.

If I were advising as a friend: protect ClipMeta time. Check if Still Frequency / Served Cold are still alive — if they're stalled, kill them or properly resource them, don't let them sit half-built draining attention. Drone Golf Courses is a fun new idea but needs the 30-minute vendor research before any real investment.

## Cross-references
- [[levi|Levi]] — the center
- [[life_state]] — high-level life snapshot
- [[working_context]] — what's actively being worked on right now
- [[agents|Multi-agent system]] — Terry/Hermes that have run a lot of this
- [[lessons_learned]] — distilled wisdom from running these businesses
