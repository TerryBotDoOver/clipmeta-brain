# Tax Library

> Levi's permanent reference set for self-filing EFP (S-Corp) and personal taxes. Added 2026-04-14 to replace the "pay a CPA for every question" model.

## Why this exists

Levi wants to ask the assistant tax questions instead of paying a CPA $150+/hr for calls and emails. This folder holds the official IRS publications the assistant needs to answer those questions authoritatively, with citations. See [[daily_logs/2026-04-14]] for the reasoning and the rejected over-engineered approach (full Title 26 corpus ingestion).

## What's in `2025/`

All downloaded 2026-04-14 from irs.gov / revenue.wi.gov:

| File | Source | Scope | Use for |
|---|---|---|---|
| `Instructions for Form 1120-S (2025).txt` | IRS | 2025 | S-Corp return line-by-line instructions, Schedule K/K-1, M-2 (AAA), shareholder basis |
| `Publication 334 (2025) Small Business.txt` | IRS (from epub) | 2025 | General small-business tax guide, 12 chapters covering filing/paying, accounting methods, income, cost of goods sold, business expenses, SE tax |
| `Publication 463 (2025), Travel, Gif.txt` | IRS | 2025 | Travel, meals (50% rule), entertainment (nondeductible), business gifts ($25 limit), car expenses (standard mileage vs actual) |
| `Publication 946 (2025), How To Depr.txt` | IRS | 2025 | Depreciation, §179 deduction, special depreciation allowance (bonus), MACRS, listed property, de minimis safe harbor ($2,500) |
| `Publication 535 Cat. No. 15065Z Bus.txt` | IRS | **2022 (discontinued)** | Comprehensive business expense reference. ⚠️ Pub 535 was discontinued after 2022 — content migrated to 334/463/946 + Sch C instructions. Use for conceptual coverage (chapters on Employees' Pay, Rent, Interest, Taxes, Insurance, Amortization, Depletion, Bad Debts), but verify specific dollar amounts against newer pubs. |
| `2025 Wisconsin Form 5S Instructions.txt` | WI DOR | 2025 | WI S-Corp return (Form 5S), pass-through rules, Schedule 5K-1, WI-specific adjustments |
| `p334.epub` | IRS | 2025 | Original epub source for Pub 334; the `.txt` is extracted from this |

## What's intentionally NOT here

- **Title 26 U.S. Code / CFR / Treasury Regs** — covered conversationally. 99% of EFP's needs are handled by the pubs above. For genuine edge cases where a statute/reg is needed, pull on demand from house.gov / eCFR.
- **Internal Revenue Bulletin (IRB)** — rarely relevant for a small S-Corp. Pull on demand.
- **Commercial tax guides** (Master Tax Guide, Checkpoint, Bloomberg Tax) — not needed at this scale.
- **FL state income tax** — Florida has no state income tax. No FL pub needed.
- **Prior-year 1120-S instructions** — not needed; we have Levi's 2024 return already parsed and stored in `project_efp_2024_tax_return` memory.

## How to use this

**When Levi asks a tax question:**
1. Identify which pub(s) cover the topic (see the table above — it's scope-based)
2. Read the relevant section(s)
3. Answer with a citation: "Per Pub 946 section X, ..." or "Per 1120-S instructions line Y, ..."
4. When a rule has changed or the 2022 Pub 535 is the only source, flag it explicitly
5. If the question is genuinely out of scope (niche §code question, PLR territory, state other than WI/FL), say so and recommend pulling from the official source or, for high-stakes decisions, hiring an EA

**Do not:**
- Answer from general training knowledge when the pubs cover it — always pull from the file
- Treat the 2022 Pub 535 as authoritative on 2025 dollar thresholds
- Mix federal and state without labeling which is which
- Make up citations

## Refresh cadence

Once a year, when new IRS pubs drop (typically January/February for the prior tax year). Levi downloads → I re-ingest. No daily/weekly/monthly pipeline. Simple.

## Related memory
- `reference_zoho_books` — Zoho API credentials for pulling live books data
- `reference_zoho_api_patterns` — API recipes
- `project_efp_2024_tax_return` — prior-year baseline
- `project_levi_2024_personal_return` — personal return + cap loss carryforwards
- `project_efp_2026_books_cleanup` — current books state
- `project_efp_florida_move` — WI/FL residency status
