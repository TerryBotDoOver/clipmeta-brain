# SiteRules

> SaaS Levi is building with Hermes. A web app where fence contractors type an address and instantly get fence rules, permits, zoning info, and AI Q&A.
> Captured 2026-04-11 from `/home/lb12340/SiteRules/PLAN.md` and `ARCHITECTURE_PLAN.md` in WSL.
> Tightly linked to [[true_fence_florida|True Fence Florida]] — Keilly's company is the validation partner.
> Part of [[business|business]]'s graph.

## What it is
A web app where fence contractors type an address (or click a map) and instantly see:
- What fence they can build there (height limits, materials, setbacks)
- What permits they need
- HOA / zoning / flood zone gotchas
- Direct links to all sources with "last verified" dates and confidence levels
- AI chat layer for "can I build a 6ft white vinyl fence here?" type questions

**Starting scope:** Charlotte County, FL. Fence contractors only. (Will expand to Punta Gorda, Sarasota County, Lee County after validation.)

## Status
- **Plan written:** 2026-04-07 (`PLAN.md`, 316 lines)
- **Architecture written:** 2026-04-08 (`ARCHITECTURE_PLAN.md`, 810 lines)
- **Code:** Some exists in `/home/lb12340/SiteRules/app/` (a `node server.js` was running from it on 2026-04-10 at PID 14940 in WSL)
- **Phase 0 validation:** Not yet started. Phase 0 was Keilly logging 10 jobs and asking 3-5 contractor friends about pain points + willingness to pay.
- **Built by:** [[agents|Hermes]] (NOT Terry — this is Hermes's first major SaaS build attempt)

## The plan in brief

### Phase 0: Validate (Week 1) — $0
1. [[keilly|Keilly]] logs 10 recent jobs she quoted: address, what she had to research, how long it took, did she get anything wrong, would she pay $29/mo
2. She asks 3-5 contractor friends the same questions
3. **Decision gate:** If 7+ out of 10 jobs involved annoying compliance research AND ≥3 contractors say they'd pay → proceed. If not, kill or pivot.

### Phase 1: Data layer (Weeks 2-3)
- Build the source registry (Charlotte County GIS, Sec. 3-5-71, FEMA flood maps, etc.)
- Extract fence rules from Sec. 3-5-71 organized by zoning district (RE, RS-1/2/3, RM-1/2, MH, CN/CG/CI, AE/AG, IL/IG, PD)
- Test Charlotte County's ArcGIS REST APIs (can we resolve zoning by address?)
- 2-3 days to extract and structure all rules

### Phase 2: MVP web app (Weeks 3-5)
**Tech stack:**
| Layer | Tool |
|---|---|
| Frontend | Next.js |
| Map | Mapbox GL JS |
| Backend/DB | Supabase (Postgres) |
| Auth | Supabase Auth |
| AI | OpenAI GPT-4o-mini |
| Hosting | Vercel |

**Cost at MVP scale: $0-20/mo** (mostly free tiers + some OpenAI usage)

**Screens:**
1. Landing/search (address bar + map)
2. Property result (rules, permit info, warnings, confidence, sources)
3. AI chat (context-aware Q&A with disclaimers)
4. Account / saved properties

### Phase 3: Get first paying users (Weeks 5-8)
**Pricing:**
| Plan | Price | Includes |
|---|---|---|
| Free | $0 | 3 lookups/month, no AI chat |
| Pro | $29/mo | Unlimited lookups, AI chat, saved properties |
| Team | $69/mo | 3 users, all Pro features, PDF reports |

**Distribution:**
1. Keilly uses it daily and shares with her contractor network
2. Facebook groups (fence contractor groups, Florida contractor groups)
3. Local trade association (Charlotte County contractor association)
4. Cold outreach via Google Maps + email

**Success metric:** 5 paying Pro users by end of Week 8 = $145/mo

### Phase 4-5: Expand (Months 3-12)
- Add Punta Gorda, Sarasota County, Lee County
- Add "Pre-Job Report" PDF
- Raise price to $49/mo as coverage expands
- Add more trades: decks, sheds, pools, signs
- Add more states (Florida has 67 counties; expand from there)
- Build contractor community features
- API for estimating software integration

## Why this is interesting
1. **Real problem.** Fence contractors actually do this manual research. Keilly will know within a week if it's a real pain.
2. **Tight feedback loop.** Levi is dating the validation customer. He gets daily ground truth.
3. **Real moat from data.** Once the rules database is built and validated, competitors have to redo months of source work.
4. **Cheap to validate.** Phase 0 is $0 and one week. If it's not real, you walk away with no time lost building.
5. **Clear kill switches.** Three explicit decision gates (after Phase 0, Phase 2, Phase 3) — each one is a moment to walk away if it's not working.

## Why the trap exists
"Vertical SaaS for $X niche" is one of the most common founder fantasies. The trap is:
- Engineering is fun and visible
- Validation is uncomfortable and unglamorous
- Most founders (and most agents) skip Phase 0 and go straight to building
- Then they end up with a working app and no buyers
- And nobody wants to admit Phase 0 wasn't done

The PLAN.md is explicit about kill switches BECAUSE Hermes (and Terry before it) know this trap. They wrote the kill criteria into the plan. **Honor them.**

## Connection to other ventures
- **[[true_fence_florida|True Fence Florida]]** is THE Phase 0 validation customer. If Keilly tells you "this isn't really a problem," that's the answer.
- **[[clipmeta|ClipMeta]]** is the parallel SaaS Levi already runs — same playbook (Next.js + Supabase + Vercel + OpenAI), so the engineering risk is low.
- **[[idea|Drone golf courses idea]]** is a similar "fork existing skills into new vertical" play. Different vertical, similar pattern.

## Code location
`/home/lb12340/SiteRules/` in WSL on the Dell:
- `PLAN.md` — 316 lines, the business plan
- `ARCHITECTURE_PLAN.md` — 810 lines, the technical architecture (I haven't read this in full yet)
- `app/` — actual code (Next.js server, was running at PID 14940 on 2026-04-10)
- `data/` — extracted rules data
- `cut_pg_from_county.py` — Python script to extract Punta Gorda from county data

## What I need from Levi to keep moving
1. **Has Phase 0 validation started?** Has Keilly logged any jobs yet?
2. **What's actually in the `/app/` folder?** I should read it to know what Hermes has built
3. **Is this still a priority** or has it slipped behind ClipMeta?
4. **Should I read ARCHITECTURE_PLAN.md** in full and add a technical writeup?

## Cross-references
- [[business|Business hub]]
- [[true_fence_florida|True Fence Florida]] — the validation partner
- [[keilly|Keilly]] — the human running validation
- [[clipmeta|ClipMeta]] — parallel SaaS using same stack
- [[listing_meta|ListingMeta]] — sister "fork ClipMeta into new vertical" play (RE photographers)
- [[beekeeper_hive_manager|Beekeeper Hive Manager]] — sister Hermes-built SaaS (much earlier stage)
- [[agents|Hermes]] — the agent building this
- [[wsl_hermes_workspace]] — the WSL home folder where the code lives
