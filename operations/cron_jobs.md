# Cron Jobs (OpenClaw / Terry's scheduled tasks)

> The 31 scheduled tasks that run on the OpenClaw gateway. All times are America/New_York (Eastern).
> Source: `C:\Users\levic\.openclaw\workspace\cron-list.json` (extracted 2026-04-11).
> All jobs are currently `enabled: true`.

## Schedule overview (when each job runs)

| Time | Job | Frequency |
|------|-----|-----------|
| Every 15 min | Email Approval Sender | continuous |
| Every hour (`0 * * * *`) | Stripe Reconciliation, ClipMeta Feedback Check, Welcome Email Sender, Signup Monitor | hourly |
| Every 2 hours | Content Post Scheduler | bi-hourly |
| Every 4 hours | Customer Email Checker | 4x daily |
| Every 6 hours | ClipMeta Reddit Monitor | 4x daily |
| 03:00 daily | Clear inbound media cache | daily |
| 04:00 daily | ClipMeta QA Test Suite | daily |
| 05:00 daily | Daily Memory Collector | daily |
| 06:00 daily | Content Script Writer | daily |
| 06:00 daily | Referral Qualifier | daily |
| 06:30 daily | Morning Briefing | daily |
| 07:00 daily | Morning Task Drafts | daily |
| 07:00 daily | Content Creator | daily |
| 07:30, 08:30, 09:30, 10:30, 11:30, 12:30 | Task Draft Executor | 6x morning |
| 08:00 daily | Backlink Finder | daily |
| 09:00, 21:00 daily | Cron Health Monitor | 2x daily |
| 09:00, 15:00, 21:00 daily | Mythos Model Monitor | 3x daily |
| 09:00 Mon, Thu | Blog Post Writer | 2x weekly |
| 09:00 Mon | SEO Rank Tracker | weekly |
| 10:00 daily | Email Drip Sequence | daily |
| 10:00 daily | Daily SEO + Speed Check | daily |
| 10:30 daily | Paid Customer Drip | daily |
| 12:00, 18:00 daily | ClipMeta Critical QA | 2x daily |
| 00:00 1st of month | Monthly Clip Rollover | monthly |
| reminders only | HN Post Reminder, Sakis follow-up, Served Cold YouTube channel, Reddit r/editors Dev Thread Reminder | one-shot |

## What each job does

### ClipMeta operations
- **Email Approval Sender** (every 15 min) — checks for ✅/❌ reactions in `#email-approvals` Discord channel and auto-sends/discards drafted customer email replies. Uses Dash (local Ollama).
- **Customer Email Checker** (every 4 hours) — drafts customer email replies → posts to `#email-approvals`. Uses Sonnet.
- **Welcome Email Sender** (hourly) — sends welcome emails to new signups.
- **Signup Monitor** (hourly) — watches for new ClipMeta signups, alerts in Discord.
- **ClipMeta Feedback Check** (hourly) — queries Supabase for new feedback entries, posts to Discord channel `1484279405646844004`.
- **Email Drip Sequence** (10:00 daily) — runs the 10-email free user conversion drip (Track 1).
- **Paid Customer Drip** (10:30 daily) — runs the 7-email paid/trial retention drip (Track 2).
- **Stripe Reconciliation** (hourly) — calls `/api/admin/stripe-reconcile`, posts repairs to Discord channel `1482069898409541715`.
- **Referral Qualifier** (06:00 daily) — runs `/api/referral/qualify` to mark new paid referrals as qualified. (NOTE: was broken until 2026-04-11 because the SQL referenced non-existent `email`/`created_at` columns. Fixed and deployed.)
- **Monthly Clip Rollover** (00:00 on the 1st) — rolls over unused clips for paying users.

### ClipMeta QA + monitoring
- **ClipMeta QA Test Suite** (04:00 daily) — full Playwright test suite via `qa-bot`.
- **ClipMeta Critical QA** (12:00 + 18:00 daily) — critical-path subset of the test suite.
- **Daily SEO + Speed Check** (10:00 daily) — checks page speed + SEO health.
- **SEO Rank Tracker** (09:00 Monday) — tracks 6 keywords in Bing → posts to `#ops`.
- **Cron Health Monitor** (09:00 + 21:00 daily) — checks if any other cron jobs errored, alerts `#ops`.
- **Mythos Model Monitor** (09:00, 15:00, 21:00 daily) — monitors something Mythos-related (AI model monitoring?).

### Content + marketing
- **ClipMeta Reddit Monitor** (every 6 hours) — scans subreddits for ClipMeta-relevant posts, drafts replies → `#reddit-drafts`.
- **Backlink Finder** (08:00 daily) — searches Reddit for mention opportunities → `#ops`.
- **Blog Post Writer** (09:00 Mon + Thu) — auto-generates and deploys a blog post via GPT-4o.
- **Content Script Writer** (06:00 daily) — drafts content scripts for [[served_cold|Served Cold]] / [[still_frequency|Still Frequency]] / similar.
- **Content Creator** (07:00 daily) — generates content (images/videos) from scripts.
- **Content Post Scheduler** (every 2 hours) — checks `pending-review` folder for approved posts and schedules them.

### Daily operations / agent self-management
- **Daily Memory Collector** (05:00 daily) — Terry's daily memory collection routine. Probably writes that day's `memory/YYYY-MM-DD.md` summary.
- **Morning Briefing** (06:30 daily) — generates Levi's morning brief.
- **Morning Task Drafts** (07:00 daily) — drafts the day's task list.
- **Task Draft Executor** (07:30, 08:30, 09:30, 10:30, 11:30, 12:30) — runs through the morning task drafts and tries to execute them.
- **Clear inbound media cache** (03:00 daily) — cleans up cached inbound media files.

### Reminders (one-shot scheduled nudges)
- **HN Post Reminder** — reminds Levi to do the Hacker News "Show HN" post (was blocked on karma gate, revisit in ~1 week from when the entry was made).
- **Reminder: Sakis follow-up** — follow up with [[sakis_palskg]] (real ClipMeta customer who reported and helped fix bugs).
- **Reminder: Served Cold YouTube channel** — reminder to actually launch [[served_cold|Served Cold]].
- **Reddit r/editors Dev Thread Reminder** — reminder about a Reddit thread Levi was planning.

## Notes from Terry's MEMORY.md history

- All 30 cron jobs were switched from `dash`/`cody`/`sonnet` to `codex` on 2026-04-04 to standardize on the Codex provider.
- Timeouts bumped on 7 jobs that were timing out (300-600s).
- Ollama RAM errors on the Predator were resolved because nothing calls local models on schedule anymore.
- Earlier (March): cron jobs were originally on Sonnet/Opus, switched to local Ollama (Dash/Cody) to save tokens, then back to codex.
- The previous brain notes in `business/clipmeta/live_business_context.md` mentioned "13 active crons + 7 paused" — but the actual `cron-list.json` shows **all 31 jobs as enabled**. So that count was wrong, or the "paused" status is tracked elsewhere (maybe inside the openclaw gateway, not in this JSON file).

## Open question
Are these 31 jobs actually firing? Many of them depend on:
1. Hermes / OpenClaw gateway being running on the Dell or Predator
2. The Codex OAuth subscription being active
3. The various API tokens (Stripe, Supabase, Resend, etc.) still being valid

If [[levi|Levi]] hasn't checked Discord recently to see notifications from the cron jobs, it's worth verifying which ones are actually working vs silently dead. The 28-day-stale terry-status.json suggests Hermes may have been down or quiet for a while.

## Cross-references
- [[agents]] — Terry/Hermes that schedule and run these
- [[clipmeta]] — most of these jobs serve ClipMeta
- [[lessons_learned]] — what's been learned from running these
- [[discord]] — where the alerts and approvals route to
