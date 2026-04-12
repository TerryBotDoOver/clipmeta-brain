# Cron Job Migration (Post-Hermes) — COMPLETE

> **STATUS: DONE** as of 2026-04-12. All essential cron jobs migrated from Hermes to `cron-runner.js` embedded in the Mission Control dashboard.

## What was built
- `cron-runner.js` — a Node.js scheduler (using `node-cron`) embedded in the Mission Control `server.js` process
- Runs inside tmux session "mission-control" in WSL on the Dell
- **14 of 15 jobs active**, 1 disabled (Critical QA needs Playwright which isn't set up)
- Cost: essentially $0 — only AI cost is gpt-4o-mini for Blog Post Writer (~$0.01/post)

## Architecture decisions
- Scheduler lives INSIDE the dashboard server.js process (not a separate process) — single tmux session, one thing to manage
- tmux is the detach mechanism (setsid/nohup was unreliable in WSL)
- Safe-only startup: monitoring jobs fire on restart, email-sending jobs only on schedule
- Jobs that need ClipMeta API auth use DRIP_SECRET (rollover + referral were patched to accept it as fallback)

## Migration outcome (Hermes 31 jobs → cron-runner 15 jobs)
The 31 Hermes jobs were triaged down to 15 essential ones. Killed jobs were either:
- Agent self-management (Daily Memory Collector, Morning Briefing, Task Drafts — all Terry/Hermes internals)
- Content creation that required full agent context (Content Script Writer, Content Creator, Content Post Scheduler)
- Discord-dependent (Email Approval Sender — needs Discord bot token which is broken)
- Redundant monitoring (Cron Health Monitor, Mythos Model Monitor)
- One-shot reminders (HN, Sakis, Served Cold, Reddit thread — converted to brain notes)

## What's running now
See [[mission_control_commands]] for the full list + tmux management commands.

## Cross-references
- [[operations/cron_jobs]] — the original Hermes job list (31 jobs)
- [[operations/mission_control_commands]] — current commands + cron runner details
- [[operations/agents]] — agent architecture
- [[operations/dell_topology]] — the Dell server where this runs
