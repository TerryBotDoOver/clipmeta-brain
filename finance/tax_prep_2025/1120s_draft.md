# EFP 2025 Form 1120-S — Working Draft

> Pulled 2026-04-14 from Zoho (cash basis). Use this as the source of numbers to type into TurboTax Business. Every line is sourced — no magic numbers.

## Entity header

| Field | Value |
|---|---|
| Name | Eternal Frame Productions LLC |
| Address | 4410 Warren Ave Unit 316 #244, Port Charlotte FL 33953 (current) OR 6808 University Ave Ste 108 #949, Middleton WI 53562 (prior 2024 return) |
| EIN | 99-2371938 |
| Date incorporated | 2024-04-08 |
| S-election effective | 2024-04-08 |
| Business activity code | 512191 (Teleproduction) |
| Business activity | Teleproduction / Video Production |
| Accounting method | Cash |
| Tax year | 2025 calendar year (Jan 1 – Dec 31, 2025) |
| Shareholders | 1 (Levi Bozacki, 100%) |
| Schedule L required? | **No** — total assets < $250,000 |

**⚠️ Address question:** The 2024 return used the WI Middleton address. Your 2025 bank statements and the True Fence 1099 show the FL Port Charlotte address. Which do you want on the 2025 return? FL matches reality; WI matches the 2024 filing and keeps state continuity. Lean FL.

## 2025 cash-basis P&L from Zoho (verified zero uncategorized)

```
Operating Income            $16,838.04
  Sales                      $8,655.00
  General Income             $8,061.63
  Interest Income                $22.37
  Other Charges                  $99.04
Cost of Goods Sold           $2,541.13
Gross Profit                $14,296.91
Operating Expense           $12,493.26
  Advertising And Marketing   $2,671.13
  Automobile Expense             $88.22
  Bank Fees and Charges         $142.37
  Camera & Production Equip   $1,444.80
  Consultant Expense            $248.66
  Credit Card Charges           $120.05
  IT and Internet Expenses      $309.23
  Legal & Compliance Fees       $909.51
  Meals and Entertainment       $196.38
  Member subscriptions          $150.00
  Office Supplies             $1,745.31
  Other Expenses                  $9.88
  Payroll Service Fees           $58.83
  Payroll Taxes                 $141.25
  Postage                        $12.54
  Salaries and Emp Wages      $1,528.26
  Software Subscriptions      $1,269.45
  Telephone Expense             $142.56
  Travel Expense              $1,027.91
  Vehicle                       $276.92
Net Profit (per Zoho)        $1,803.65
```

## Form 1120-S Page 1 — line by line

### Income

| Line | Description | Amount | Source |
|---|---|---|---|
| 1a | Gross receipts or sales | **$16,716.63** | Zoho Sales $8,655.00 + General Income $8,061.63 |
| 1b | Returns and allowances | $0 | |
| 1c | Balance (1a − 1b) | **$16,716.63** | |
| 2 | Cost of goods sold | **$2,541.13** | Zoho COGS line |
| 3 | Gross profit | **$14,175.50** | 1c − 2 |
| 4 | Net gain (loss) from Form 4797 | $0 | No asset sales |
| 5 | Other income | **$99.04** | Other Charges (includes 12/31/2025 bank recon JE $20.59 + misc) |
| **6** | **Total income (add 3-5)** | **$14,274.54** | |

Note: **Interest Income $22.37 is NOT on page 1.** It's portfolio income → Schedule K line 4 only.

### Deductions

| Line | Description | Amount | Source |
|---|---|---|---|
| 7 | Compensation of officers | **$1,528.26** | Zoho Salaries and Employee Wages. Levi is the sole officer — wages go here not line 8. |
| 8 | Salaries and wages (other than officer comp) | $0 | |
| 9 | Repairs and maintenance | $0 | |
| 10 | Bad debts | $0 | |
| 11 | Rents | $0 | |
| 12 | Taxes and licenses | **$141.25** | Payroll Taxes account |
| 13 | Interest expense | $0 | |
| 14 | Depreciation (attach 4562) | $0 | Continuing 2024 approach: de minimis safe harbor, no 4562 |
| 15 | Depletion | $0 | |
| 16 | Advertising | **$2,671.13** | Advertising And Marketing account |
| 17 | Pension, profit-sharing plans | $0 | |
| 18 | Employee benefit programs | $0 | |
| 19 | Other deductions (attach statement) | **$8,152.62** | Everything else — see Statement 1 below |
| **20** | **Total deductions** | **$12,493.26** | |
| **21** | **Ordinary business income (loss)** | **$1,781.28** | Line 6 − Line 20 |

**Line 21 = $1,781.28** ← This is the key number. Flows to Schedule K line 1, then K-1 box 1.

### Statement 1 — Other Deductions (line 19 detail)

| Category | Amount |
|---|---|
| Automobile Expense | $88.22 |
| Bank Fees and Charges | $142.37 |
| Camera & Production Equipment | $1,444.80 |
| Consultant Expense | $248.66 |
| Credit Card Charges | $120.05 |
| IT and Internet Expenses | $309.23 |
| Legal & Compliance Fees | $909.51 |
| Meals and Entertainment (50% deductible) | $196.38 |
| Member subscriptions | $150.00 |
| Office Supplies | $1,745.31 |
| Other Expenses | $9.88 |
| Payroll Service Fees | $58.83 |
| Postage | $12.54 |
| Software Subscriptions | $1,269.45 |
| Telephone Expense | $142.56 |
| Travel Expense | $1,027.91 |
| Vehicle | $276.92 |
| **Total Statement 1** | **$8,152.62** |

⚠️ **Meals check:** Zoho shows $196.38 — this should already be the 100% amount. The IRS allows **50% deduction** for business meals per Pub 463. So the deductible portion is $98.19. **Need to apply the 50% reduction** — either reduce the account to 50% before filing, or enter $98.19 on line 19 with a book-to-tax adjustment on Schedule M-1 for the other $98.19. I recommend just reducing the deduction claimed — cleanest. This drops Line 19 to $8,054.43 and Line 21 to **$1,879.47**.

(TurboTax Business will typically ask you to enter 100% meals and auto-applies the 50% haircut. Enter the full $196.38 when it asks and let TurboTax handle the haircut.)

## Schedule B — 10 questions (I'll fill these when drafting in TurboTax)

Most common answers for EFP:
- Accounting method: Cash ✓
- Business activity code: 512191
- Any stock in foreign corps: No
- At any time during year did corp issue debt instruments w/ original issue discount: No
- Shareholder loans to corp: No
- Distributions of appreciated property: No
- LIFO method: No
- Accumulated E&P from C-corp years: No (never was a C-corp)

## Schedule K — Pass-through items (shareholder allocation)

| Line | Description | Amount |
|---|---|---|
| 1 | Ordinary business income (loss) | **$1,781.28** (or $1,879.47 after meals adjustment) |
| 2 | Net rental real estate income | $0 |
| 3 | Other net rental income | $0 |
| 4 | **Interest income** | **$22.37** |
| 5a | Ordinary dividends | $0 |
| 10 | Other income | $0 |
| 12 | Section 179 deduction | $0 (using de minimis, not 179) |
| 13 | Other deductions | $0 |
| 16c | Nondeductible expenses (50% meals haircut) | **$98.19** (the disallowed half of Unwined meal) |
| 17v | QBI items | ordinary income + separately stated |

## Schedule K-1 — Levi Bozacki (100% owner)

| Box | Description | Amount |
|---|---|---|
| Part I/II header | EIN, name, address, 100% allocation | |
| 1 | Ordinary business income (loss) | **$1,781.28** (or post-meals $1,879.47) |
| 4a | Interest income | **$22.37** |
| 16c | Nondeductible expenses | $98.19 |
| 17 V | QBI information | Same as box 1 |

**This K-1 is what Levi files on his personal 1040** (Schedule E part II) along with the interest on Schedule B.

## Schedule M-2 — AAA (Accumulated Adjustments Account)

| Line | Description | Amount |
|---|---|---|
| Beginning AAA (from 2024 return) | | **−$2,417.00** |
| 2 | Ordinary income | +$1,781.28 |
| 3 | Other additions (interest) | +$22.37 |
| 5 | Other reductions (nondeductible meals) | −$98.19 |
| 7 | Distributions | $0 (assuming no distributions — confirm) |
| **8 Ending AAA** | | **−$711.54** |

## Schedule L (Balance Sheet)

**Not required** — total assets < $250,000. Leave blank. This is the same as 2024.

## Form 7203 — Shareholder Stock and Debt Basis

This is where it gets complex. Form 7203 tracks Levi's basis so he can claim losses and not report phantom gains on distributions.

**Opening stock basis 1/1/2025:** Need to confirm. Per 2024 facts:
- 2024 capital contribution: $2,000 (per Zoho opening OE)
- 2024 loss allocation: −$2,417
- Stock basis can't go below $0 → if only $2,000 was contributed, $417 of 2024 loss should have been suspended
- But Levi's 2024 personal 1040 claimed the full $2,417 loss — meaning he must have had more basis than $2,000

**⚠️ Open question for Levi:** Did you make any capital contributions to EFP in 2024 that aren't visible in Zoho? The Amex shows a 2024-11-29 $1,000 credit labeled "Owner's Equity" — is that in addition to the $2,000 Zoho opening balance, or is the $2,000 opening INCLUDING that $1,000? If the opening $2,000 = just the entity-formation contribution and the $1,000 in November was separate, then 2024 total contributions = $3,000, 2024 loss fully absorbed at shareholder level, end-2024 stock basis = $583.

**Most likely reconstruction (subject to confirmation):**
```
Opening stock basis 1/1/2025:           $583.00    (assumes $3,000 2024 contrib - $2,417 loss)
+ 2025 capital contributions           $1,467.00    (3/31 $1,000 + 6/23 $467)
+ 2025 ordinary income                 $1,781.28
+ 2025 interest income                    $22.37
- 2025 nondeductible expenses            ($98.19)    (50% meals haircut)
- 2025 distributions                        $0      (confirm)
= Ending stock basis 12/31/2025        $3,755.46
```

Debt basis: $0 throughout (no shareholder loans to EFP)

**⚠️ This is the part where I most need you to verify.** A wrong Form 7203 can trigger an IRS notice. Worth walking through together.

## Wisconsin Form 5S — State S-Corp return

WI treats S-Corps as pass-through. Starting point is the federal ordinary business income, with WI adjustments.

- Federal ordinary income: **$1,781.28**
- WI adjustments: probably none material for EFP
- WI allocation: 100% Levi (WI resident for state purposes? — if yes, full income taxable to WI; if FL resident, 0% WI taxable)

**⚠️ Critical state question:** Your 2024 personal return was filed as WI resident. Your 2024 1120-S listed WI address. Your 2025 bank statements and 1099 show FL address. **For the 2025 WI 5S, are you still claiming WI residency, or did you move state residency to FL during 2025?**

If WI resident: file WI 5S with 100% apportionment.
If FL resident mid-year: WI 5S with partial-year apportionment, pay WI tax on income earned while WI resident.
If FL full-year 2025: WI 5S may not be needed; file only federal.

This affects both the WI 5S filing and your personal WI Form 1 return.

## Payroll reconciliation (needed for Schedule K / payroll forms match)

Need to verify Zoho wages $1,528.26 matches your 2025 W-2 Box 1 $1,500. Small delta ($28.26). Possible causes:
- Employer-side stuff not on W-2
- A half-period payroll run not matching
- Payroll taxes account interaction

Your 2024 and 2025 payroll forms (940, Q1-Q4 941s, W-2, W-3, state UI) should all tie to this. Let me know where I can access them if you want me to cross-check.

## Late filing penalty ⚠️

- 2025 1120-S was due 2026-03-15
- Today: 2026-04-14
- Days late: 30
- Penalty: $245 per shareholder per month = **$245 for 1 shareholder × 1 full month**
- If not filed by 2026-04-15 (tomorrow): an additional $245 kicks in
- Penalty is per shareholder-month regardless of whether you owe any tax

**Practical implication:** filing this week vs next week saves $245.

## Open questions for Levi before finalizing

1. **Residency** — WI, FL, or mixed in 2025? Affects state return and possibly federal address.
2. **2024 capital contributions** — was the $1,000 Nov 2024 deposit a separate contribution, or is it already in the $2,000 opening OE balance? (Affects basis reconstruction)
3. **2025 distributions** — did you take any money out of EFP to personal beyond the $1,500 W-2 wages? (S-Corps typically allow tax-free distributions up to basis.)
4. **Other income $99.04** — this includes the $20.59 12/31/2025 bank recon journal entry. What's the other $78.45? Is it actual business income or a plug?
5. **Sales vs General Income split** — Zoho has both accounts with similar totals ($8,655 + $8,061). Is there a meaningful distinction in your mind, or is it noise from different rule/categorization paths? (Doesn't affect the return, just curious.)
6. **TurboTax Business** — do you have it installed already, or do we need to buy + install it as part of this workflow?
7. **Meals limitation** — confirm the $196.38 at Unwined was a business meal (you already confirmed this, just sanity-checking before applying the 50% haircut).

## Recommended next steps

Once the extension is filed and you're back:
1. Answer open questions above (30-60 min conversation)
2. Resolve the Form 7203 basis question (15-30 min)
3. Buy + install TurboTax Business ($180, 15 min)
4. Type numbers from this doc into TurboTax following the interview (60-90 min with me guiding)
5. Run TurboTax diagnostics, review, e-file federal (15 min)
6. Repeat for WI 5S (if applicable) — TurboTax Business typically handles state too
7. File Form 7203 as part of the federal return (attached)
8. Send K-1 to yourself (you need it for your personal 1040, which is on extension until Oct 15)

Total: ~3-4 hours once the questions are answered. Penalty clock is ticking.
