# Tax Session Handoff — UPDATED 2026-04-14 11:00 PM

> For a new Claude Code session resuming tax work. Read this first.

## Status as of 2026-04-14 11:00 PM

**1120-S: FILED.** E-filed via TurboTax Desktop Business 2025 at ~10:45 PM on 2026-04-14. Both federal 1120-S and WI Form 5S transmitted. Awaiting IRS + WI DOR acceptance confirmation.

**Personal 1040: ON EXTENSION.** Filed Form 4868 via FreeTaxUSA at ~10:53 PM. $0 payment. New deadline: **October 15, 2026.**

**Personal 1040 is the only remaining filing task.** All numbers are ready (K-1 generated, saved in Downloads folder).

## Original Mission (completed)

## Software decisions (locked in)

- **EFP 1120-S + WI Form 5S:** TurboTax Desktop Business 2025 (bought today, ~$190 + state ~$50). Installed on the **Predator** laptop. He's currently walking through the interview. Was going to be H&R Block Premium & Business but we pivoted after researching quality issues — H&R Block has documented data-corruption bugs in business edition, TurboTax has better polish + confirmed WI Form 5S e-file support.
- **Personal 1040 + WI Form 1:** FreeTaxUSA (free, his existing account `levibozacki1`). **Do NOT recommend TurboTax Home & Business** — that's a different product for sole props, not needed since Levi's income flows through a K-1 from the S-Corp.
- **FL filings:** Both deferred from tonight. FL F-1120 (first-year informational filing) and FL Annual Report on Sunbiz are both due May 1, 2026. Handle in a separate session before May 1.

## Where Levi is RIGHT NOW

Walking through TurboTax Desktop Business 2025 interview on the Predator. Last confirmed state: on the **"Are You New to TurboTax Business?"** screen, "Yes" radio selected, needs to click **Continue**. Next screens will start collecting entity info.

He's opening a new Claude Code terminal to get around the SSH image-paste problem from the prior session. The old session ran Claude Code on Dell via SSH from Predator, which broke Ctrl+V clipboard paste for screenshots. The workaround we built was: pull screenshots from Predator via scp to the Dell (works but adds ~5 seconds per screenshot).

**Screenshot workflow that works (if still needed):**
```
LATEST=$(ssh levib@10.0.0.157 "cmd /c dir /OD /B C:\\Users\\levib\\Pictures\\Screenshots\\*.png" 2>/dev/null | grep Screenshot | tail -1 | tr -d '\r')
ssh levib@10.0.0.157 "copy \"C:\\Users\\levib\\Pictures\\Screenshots\\$LATEST\" C:\\Users\\levib\\latest_shot.png"
scp levib@10.0.0.157:C:/Users/levib/latest_shot.png "C:/Users/levic/Downloads/tt_screenshots/latest.png"
```
Then Read the PNG.

## The numbers (all decisions locked in)

**Source:** `finance/tax_prep_2025/1120s_draft.md` (the master working doc — every line of 1120-S, Sch K, K-1, M-2, 7203, WI 5S with sources). **Read it when you resume.**

### Form 1120-S page 1 — final numbers

| Line | Description | Amount |
|---|---|---|
| 1a | Gross receipts | **$16,716.63** (Sales $8,655.00 + General Income $8,061.63) |
| 2 | Cost of goods sold | **$2,541.13** |
| 3 | Gross profit | **$14,175.50** |
| 5 | Other income | **$20.59** (bank recon JE only — the $78.45 cashback is NOT taxable) |
| 6 | Total income | **$14,196.09** |
| 7 | Compensation of officers | **$1,528.26** |
| 12 | Taxes and licenses | **$141.25** |
| 16 | Advertising | **$2,671.13** |
| 19 | Other deductions | **$8,152.62** (before meals adjustment) |
| 20 | Total deductions | **$12,493.26** |
| **21** | **Ordinary business income** | **$1,801.02** (after +$98.19 meals add-back, −$78.45 cashback, −$22.37 interest) |

### Line 19 — "Other deductions" breakdown

```
Automobile Expense          $88.22
Bank Fees and Charges      $142.37
Camera & Production Equip $1,444.80
Consultant Expense         $248.66
Credit Card Charges        $120.05
IT and Internet Expenses   $309.23
Legal & Compliance Fees    $909.51
Meals and Entertainment    $196.38   ← TurboTax will auto-apply 50% haircut; enter 100%
Member subscriptions       $150.00
Office Supplies          $1,745.31
Other Expenses                $9.88
Payroll Service Fees         $58.83
Postage                      $12.54
Software Subscriptions    $1,269.45
Telephone Expense           $142.56
Travel Expense            $1,027.91
Vehicle                     $276.92
TOTAL                     $8,152.62
```

### Schedule K

- Line 1 Ordinary business income: **$1,801.02**
- Line 4 Interest income: **$22.37**
- Line 16b Other tax-exempt income (cashback): **$78.45**
- Line 16c Nondeductible expenses (meals): **$98.19**

### Schedule K-1 for Levi (100% shareholder)

- Box 1 Ordinary business income: **$1,801.02**
- Box 4a Interest income: **$22.37**
- Box 16 code B (tax-exempt income): **$78.45**
- Box 16 code C (nondeductible): **$98.19**

### Schedule M-2 (AAA)

- Opening (from 2024 return): **−$2,417.00**
- + Ordinary income: $1,801.02
- + Interest: $22.37
- + Tax-exempt income: $78.45
- − Nondeductible expenses: $98.19
- − Distributions: $0 (Levi confirmed none)
- **Ending AAA: −$613.35**

### Form 7203 shareholder basis (for Levi's personal 1040)

Opening stock basis 1/1/2025: **$0** (2024 contributions $2,000 fully absorbed by $2,417 loss — note: Levi's 2024 1040 claimed full loss, technically overclaimed by $417, but that's a prior-year issue not fixed in 2025)

- + Capital contributions 2025: **$1,467** ($1,000 on 3/31 + $467 on 6/23)
- + Ordinary income: $1,801.02
- + Interest: $22.37
- + Tax-exempt cashback: $78.45
- − Nondeductible meals: $98.19
- − Distributions: $0
- **Ending stock basis 12/31/2025: $3,270.65**

Debt basis: $0 throughout (no shareholder loans to EFP).

## Entity facts for the return

- **Name:** Eternal Frame Productions LLC
- **EIN:** 99-2371938
- **Address on return:** Use the WI business address — 6808 University Ave Ste 108 #949, Middleton WI 53562 (matches 2024 return, maintains continuity). Levi wants to maintain WI residency story. FL registration exists but use WI address on the 1120-S.
- **Date incorporated / S-election effective:** 2024-04-08
- **Business activity code:** 512191 (Teleproduction)
- **Accounting method:** Cash
- **Tax year:** 2025 calendar year
- **Schedule L required?** No (total assets < $250,000)
- **Schedule B answers:** Cash basis, code 512191, no foreign stock, no OID debt, no shareholder loans, no appreciated property distributions, no LIFO, no C-corp E&P

## Levi's answers to open questions (all resolved earlier today)

1. **State residency:** WI for 2025 (with acknowledgment that real life is in FL with girlfriend — filing WI for continuity, pushed back on the residency risk but it's his call)
2. **2024 capital contributions:** Confirmed $2,000 exactly ($100 BoA 4/11, $400 BoA 5/1, $500 BoA 10/22, $1,000 Amex 11/29)
3. **2025 distributions:** NONE. Only the $1,528.26 W-2 wages.
4. **Other Income $99.04:** $78.45 is nontaxable Spark credit card cashback (→ Sch K 16b, not gross income). $20.59 remainder is the 12/31/2025 bank recon journal entry (→ line 5 Other Income, small enough to not fight).
5. **Sales vs General Income split:** Just Zoho noise from different categorization rules. Both roll to line 1a. No tax distinction.
6. **Software:** TurboTax Desktop Business 2025 (chose this over H&R Block after bug concerns)
7. **Meals:** $196.38 at Unwined Wine & Beer Bar = business meal, 50% haircut applies. TurboTax typically wants the full $196.38 and auto-applies the haircut.
8. **$122.45 eBay:** Personal (shipping label for personal sale accidentally charged to business card). **This is 2026, doesn't affect 2025 return.** For 2026 cleanup: book as owner distribution. Don't deduct it.

## Correction to existing memory

**FL registration date** — actual filing document shows **September 4, 2025** (filing H25000315352, via INCFILE/bizee.com, $130 fee). Old memory said Levi moved to FL Aug 2024 and registered EFP as foreign LLC then — the personal move was 2024 but **EFP's FL foreign registration is Sep 2025.** This is the updated truth. Memory file `project_efp_florida_move.md` was corrected this morning.

**Implication:** 2025 is EFP's FIRST year registered in FL → FL F-1120 first-year informational filing is required, due May 1, 2026. 2024 was correctly NOT filed in FL (EFP wasn't registered there yet). H&R Block 2024 return was right.

## Timeline for tonight

Current time when this was written: **4:32 PM**

- 4:32 → 5:30 PM: Finish TurboTax Business interview for 1120-S federal (Levi types, I read off numbers)
- 5:30 → 6:00 PM: Run diagnostics, review, e-file federal 1120-S
- 6:00 → 6:45 PM: WI Form 5S in TurboTax Business state module
- 6:45 → 7:15 PM: Dinner break
- 7:15 → 9:00 PM: Personal 1040 + WI Form 1 on FreeTaxUSA (use the K-1 just generated, federal capital loss carryforward ~$36,210, WI cap loss carryforward $45,157 ST / $21,281 LT)
- 9:00 → 9:30 PM: Review + e-file both personal returns
- **Hard deadline: midnight 4/14 for personal; 1120-S saves $245 if filed today vs tomorrow**

## Still pending (NOT blocking)

- **Personal 4868 extension** — Levi was going to file this as a safety net before TurboTax install. Unclear if he actually did it yet. If he didn't, it's 10 min on FreeTaxUSA and protects against any late-night snag. Recommend doing it first.

## Files to read in the new session

1. **`finance/tax_prep_2025/1120s_draft.md`** — master working doc with every line and source
2. **`finance/tax_prep_2025/session_handoff.md`** — THIS file (for current state)
3. **`business/eternal_frame_productions.md`** — entity context
4. Auto-memory: `project_efp_2024_tax_return`, `project_levi_2024_personal_return`, `project_efp_florida_move`, `project_efp_2026_books_cleanup`, `reference_zoho_books`, `reference_zoho_api_patterns`, `reference_tax_library`

## Resume prompt for new session

Paste this into the new Claude Code terminal:

```
I'm resuming a tax filing session. Read Documents\ClipMeta_Brain\finance\tax_prep_2025\session_handoff.md and Documents\ClipMeta_Brain\finance\tax_prep_2025\1120s_draft.md first — everything you need is there. I'm in TurboTax Desktop Business 2025 on the Predator, currently past the "Are You New" welcome screen, about to start the 1120-S entity info interview. Walk me through every screen. I'll paste screenshots directly via Ctrl+V this time.
```
