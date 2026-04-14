# Eternal Frame Productions

> Levi's videography business. Drone footage, weddings, real estate, commercial work.
> Stub file -- expand as Levi shares more details.

## What is it
Active videography business. Per Mission Control:
- Drone footage (Levi is FAA Part 107 certified -- see [[life_state]])
- Wedding videography
- Real estate videography
- Commercial videography

## Status
Active and operational. No active dev tasks. This is a service business, not a software product.

## Relationship to other businesses
- The drone footage Levi captures for stock platforms IS part of this business
- [[clipmeta|ClipMeta]] grew out of this practice -- the metadata generation pain Levi experienced as a stock contributor became the seed of the SaaS
- [[idea|The drone golf courses idea]] is also an extension of this business (could pull in real videography work for premium courses)

## Bookkeeping Automation Idea (2026-04-11)
Levi wants to connect all EFP bookkeeping services and finances to an automated system — build a separate interface that tracks everything so he doesn't have to pay for a bookkeeper. This would involve:
- [ ] Identify what bookkeeping services/tools EFP currently uses
- [ ] Determine what financial accounts need to be connected
- [ ] Build or configure an interface to track income, expenses, invoices, etc.
- [ ] Replace paid bookkeeping service with the automated solution

See also: [[finance/taxes_2025|2025 tax filing reminder]]

## 2025 tax prep — current state (2026-04-14)

Levi used H&R Block for 2024 ($300+, expensive) and is determined to self-file the 2025 1120-S. Working through Zoho Books directly via API to get the books clean. Personal 1040 extension (4868) still needs to be filed tomorrow morning — personal deadline is April 15 and he won't have the K-1 ready by then, so extension buys until Oct 15.

### Prior-year summary
- 2024 short year (Apr 8 – Dec 31): $1,452 gross receipts, −$2,417 ordinary loss
- AAA opening balance for 2025: **−$2,417**
- Cash basis, calendar year, 1 shareholder (Levi 100%)
- No Schedule L required (total assets < $250K)
- H&R Block expensed all equipment immediately under de minimis safe harbor — that's the 2025 continuation approach
- See [[daily_logs/2026-04-13]] and [[daily_logs/2026-04-14]] for the full prep narrative

### 2026 books state (post-cleanup 2026-04-14)
- **148 transactions categorized** across Amex Checking, Spark Classic (CC), Nav Prime (CC)
- Zero uncategorized remain
- **Discovery:** broken "Google Ads" auto-rule in Zoho Books was catching every 2026 Spark charge and dumping it in Advertising And Marketing. 46 charges manually recategorized. Rule itself still active — needs deletion in Zoho UI before more charges land.
- 2026 YTD cash-basis P&L: Income $6,180.71, COGS $816.30, OpEx $8,186.75, **Net Loss −$2,822.34**
- One mystery charge ($122.45 eBay 2026-01-19) left uncategorized pending investigation — possible fraud

### Key customers/jobs mentioned this session
- **Denise Bond + Bob** — family friends, Levi does handyman work "through the business." Jan 2026: mulch job, Lowe's materials $816.30 (COGS), multiple payments from Denise (not all visible in current uncategorized view). Flagged — flowing handyman work through EFP is a gray area but Levi's choice.
- **Jacey Bellefeuille** — wedding videography client on a $100/mo payment plan, wedding date **April 24, 2026**. First $100 payment received 2026-04-10, booked as Sales, but invoices haven't been created retroactively in Zoho yet.
- **True Fence LLC (Keilly)** — 2025 issued a $2,550 1099-NEC to EFP via Gusto. Levi still working with them in 2026 on the SiteRules/PermitPilot validation project.

### Address inconsistency
EFP's address has shifted across filings:
- 2024 1120-S: 6808 University Ave Ste 108 #949, Middleton WI 53562
- Late 2025 / 2026: 4410 Warren Ave Unit 316 #244, Port Charlotte FL 33953 (matches the FL foreign LLC registration)
Mixed-state issue — Levi wants to maintain WI appearance for some filings while being operational in FL. See [[levi]] address notes.

### Zoho Books access
Levi runs his own EFP Zoho Books (org 885990781) with a self-client OAuth token. Full-access refresh token lives in auto-memory (`reference_zoho_books.md`). API patterns for categorization/reconciliation are captured in `reference_zoho_api_patterns.md` so future sessions don't re-learn the hard way.

## Things to add
- Year founded
- Is Levi solo or does he have help?
- Typical project rates / pricing structure
- How does work come in (referrals, ads, networking)?
- Best clients / favorite projects
- What's the long-term plan -- grow this, maintain it, or wind it down as ClipMeta grows?

## Cross-references
- [[business]] -- business hub
- [[clipmeta|ClipMeta]] -- the SaaS born from this practice
- [[idea|Drone golf courses idea]] -- a potential extension
- [[life_state]] -- where this fits in Levi's life
