# How-To Instructions

Quick-reference recipes for things Levi forgets and re-asks. Each entry is a condensed "just tell me what to type" version. When the underlying setup changes, update the entry here.

Related: [[dell_topology]], [[wsl_hermes_workspace]], [[mission_control_commands]], [[cron_jobs]]

---

## Zoho Books — categorize bank feed items via API

Full recipe set (transfers, deposits, expenses, refunds, recategorize, unwind) is captured in auto-memory at `reference_zoho_api_patterns.md`. Quick hits:

**Recategorize an already-categorized item** (e.g. fixing a bad auto-rule):
```
PUT /expenses/{expense_id}?organization_id=885990781
{ "account_id": "<new>", "paid_through_account_id": "<bank>", "date": "...", "amount": N, "description": "..." }
```

**Categorize an uncategorized item as a transfer, deposit, or refund:**
```
POST /banktransactions/uncategorized/{feed_id}/categorize?organization_id=...
{ "transaction_type": "transfer_fund" | "sales_without_invoices" | "expense_refund", "from_account_id": "...", "to_account_id": "...", "amount": N, "date": "..." }
```

**Categorize an uncategorized item as a regular expense** (two steps — `expense` is NOT a valid transaction_type for the categorize endpoint):
1. `POST /expenses` with `{account_id, paid_through_account_id, amount, date, description}` → get new `expense_id`
2. `POST /banktransactions/uncategorized/{feed_id}/match` with `{"transactions_to_be_matched":[{"transaction_id":"<expense_id>","transaction_type":"expense"}]}`

**Critical gotcha for inter-account transfers (Amex↔Spark, Amex↔NavPrime):** Only categorize ONE side as `transfer_fund`. Match the other side to the created transfer record via `/match`. Categorizing both sides creates duplicate transfer records and double-counts movement.

**Unwind a bad categorization:**
```
POST /banktransactions/{imported_transaction_id}/uncategorize?organization_id=...
```
Use the `imported_transaction_id` from `banktransaction.imported_transactions[0]`, NOT the wrapping transaction_id. The wrapping transfer/expense record is auto-deleted; the feed item returns to uncategorized.

Access tokens last 1 hour — refresh mid-script if you hit code 57.

Cannot create chart-of-accounts entries or manage auto-rules via API even with `fullaccess.all` — must use the Zoho UI for those.

---

## SSH from Predator to Dell

From Predator PowerShell:

```powershell
ssh -p 2222 levic@clipmeta-dell
```

Fallback by Tailscale IP if the hostname doesn't resolve:

```powershell
ssh -p 2222 levic@100.78.190.53
```

- Port is **2222**, not 22. Port 22 is a netsh portproxy forwarding to WSL Ubuntu for Hermes. Do not touch.
- Key-based auth, no password.
- Once connected, run `claude` to resume a Claude Code session.

See [[dell_topology]] for the full networking picture.

---

## Running Hermes after SSH

You land in Windows `cmd.exe` at `c:/users/levic>`. Hermes lives in **WSL Ubuntu**, not Windows, so typing `hermes` alone fails with "not recognized as an internal or external command".

Drop into WSL first:

```cmd
wsl
```

Then:

```bash
hermes
```

Or as a one-liner from Windows:

```cmd
wsl -d Ubuntu -- hermes
```

**Note (2026-04-11):** Hermes was retired as the Still Frequency runner after it ran out of tokens mid-render. The deterministic replacement lives at `C:\StillFrequency\` and runs from Windows Task Scheduler. Use that for SF renders. Use Hermes only for things it still owns (PermitPilot work, any cron not yet migrated to [[cron_jobs|the Mission Control cron runner]]).

See [[wsl_hermes_workspace]] for the Hermes workspace layout.

---
