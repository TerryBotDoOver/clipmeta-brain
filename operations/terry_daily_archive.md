---
name: Terry daily memory archive (highlights)
description: Curated highlights from Terry's daily memory files in /c/Users/levic/.openclaw/workspace/memory/. Captures the major events, decisions, and outstanding issues from each day so future-me has a timeline without re-reading 24 raw files.
type: reference
---

# Terry daily archive — highlights

> Source: `C:\Users\levic\.openclaw\workspace\memory\` (24 daily files spanning 2026-03-13 → 2026-04-06).
> Captured 2026-04-11. These are highlights only — full files are still on disk.
> Part of [[operations]] / [[agents]] graph.

## What this is
Terry (OpenClaw) writes a daily memory file at the end of each working day. Reading 24 of them is expensive in context. This file pulls out the **load-bearing facts**: major decisions, project starts, customer events, broken systems, recoveries. Anything that future-me would need to know to understand "how did we get here?".

For deep dives into a specific day, read the source file directly: `C:\Users\levic\.openclaw\workspace\memory\YYYY-MM-DD.md`.

## Timeline of major events

### 2026-03-13 — ClipMeta begins as a real codebase
- ClipMeta strategy and competitor positioning locked in
- First real Next.js + Supabase code committed; Storage bucket `project-uploads` created
- Small clip uploads working end-to-end
- **Critical bottleneck identified:** Server Action upload fails for ~110MB files (socket/network closure). Sets the tone for the next sprint: rip out Server Action upload, replace with browser-direct-to-Supabase resumable upload
- See `clipmeta-context.md` in same directory for the "frozen 2026-03-13" project context Terry wrote at this point

### 2026-03-18 — Video Engine built
- [[video_engine|Video Engine]] (Node Canvas + FFmpeg) built in one session for marketing reels
- Reused for Still Frequency / Served Cold pipelines later

### 2026-03-24 — [[served_cold|Served Cold]] project starts
- Brand identity locked: SERVED COLD, navy/ice/ember palette
- Discord channels created
- Plan written (`workspace/served-cold/launch-plan.md`)
- **Andrew (Airoma)** appears as ClipMeta customer this day

### 2026-03-25 — Google OAuth fix
- A separate file `2026-03-25-google-oauth-fix.md` exists alongside the daily file. Likely an emergency mid-day note about restoring Google OAuth credentials (probably for YouTube API access). Worth reading if YouTube auth ever breaks again.

### 2026-03-30 — Sakis bug-fix day
- [[sakis|Sakis]] reports the **500MB upload limit** bug — fixed same day
- Sakis reports the **"null" location in CSV** bug — fixed same day
- Bug fix email sent via Resend, signed as Terry
- This is the day Sakis becomes ClipMeta's most valuable feedback source

### 2026-03-31 — First paying customer + [[still_frequency|Still Frequency]] starts
- 🎉 **First paying ClipMeta customer confirmed: Andrew (andrew@airoma.com.au), Starter $9/mo**
- Andrew's clip counter was stuck at 189 (trial-to-paid conversion didn't reset `clips_used_this_month`) — fixed manually, **webhook bug logged for later**
- Stripe fees discussion: Tax already off, Billing fee 0.7% unavoidable for subs, annual billing is the best optimization
- **Healing Frequencies project begins** (later renamed Still Frequency)
  - Health/wellness RPM $7-11 vs $1-3 generic music — 3x more lucrative
  - 3TB drone footage = the moat
  - Suno Pro ($10/mo) + FFmpeg + YouTube API stack chosen
  - Discord HEALING FREQUENCIES category created with 6 channels
  - Full launch plan written: `workspace/healing-frequencies/LAUNCH-PLAN.md`
- Brave Search API key added to `openclaw.json`

### 2026-04-02 — Hermes Agent decision + WSL install
- **Decision: install Hermes Agent on the Dell** as a specialist for Still Frequency, separate from Terry
- Terry = manager / general; Hermes = specialist with its own memory for that project
- WSL2 install on Dell (Win10 Home, build 19045, i7-7500U):
  - `wsl --install` failed `0xc004000d` initially
  - DISM staged the features successfully after a reboot
  - **Stuck at the WSL2 kernel update step** at end of day
- Cron optimizations: dropped ~158 agent turns/day by reducing frequencies (Email Approval Sender 96/day → 15/day, Content Post Scheduler 12/day → 1/day, Signup Monitor 24/day → 9/day, etc.)
- Cron model demotions: Morning Briefing Opus → Sonnet, Morning Task Drafts Opus → Sonnet
- **Mission Control dashboard** had hung since March 26 — killed PID 14224, restarted at localhost:3131
- **ClipMeta dashboard LCP fix shipped:** 5 sequential Supabase queries → `Promise.all()` parallel queries (1-2.5s → much less). Deployed.
- Still Frequency channel name confirmed: `@stillfrequency`
- **CRITICAL: Blackbox restricted-words list captured** (must be filtered from BOTH descriptions and keywords in CSV exports — case-insensitive). Implemented in `src/lib/csvExport.ts` as `BLACKBOX_RESTRICTED_WORDS` set + `filterBlackboxText()`. Full word list is in the source daily file — reproduce exactly when needed; do not paraphrase.

### 2026-04-04 — Anthropic ban + Hermes setup + Discord token meltdown
- ⚠️ **Anthropic killed Claude Pro/Max subscription access for all third-party tools (OpenClaw, Hermes) effective April 4 noon PT**
  - Forced migration: OpenClaw and Hermes both move to **OpenAI Codex OAuth ($20/mo flat)**
  - Levi's personal Max 5x ($100/mo) still works for claude.ai web, Claude Code, Claude Cowork
  - **$100 one-time credit available — must claim by April 17 at claude.com** (expires 90 days after claiming) — ⚠️ **deadline check: this is/was in early-to-mid April**
- **Hermes setup completed:**
  - Running on GPT-5.4 via Codex OAuth
  - Gateway in WSL Ubuntu on Dell — must be manually restarted after `wsl --shutdown` (no service supervision)
  - Restart command: `wsl bash -il -c "cd /home/lb12340/.hermes/hermes-agent && source venv/bin/activate && hermes gateway run >> /home/lb12340/.hermes/logs/gateway.log 2>&1 &"`
  - Discord MCP server added (`@iqai/mcp-discord` via npx) — gives Hermes full Discord API access
  - `require_mention: false` set
  - SSH Dell→Predator working with key auth (`ssh levib@10.0.0.158`, key at `/home/lb12340/.ssh/id_ed25519`, authorized at `C:\ProgramData\ssh\administrators_authorized_keys` on Predator)
- ⚠️ **Discord bot token broken** — a `config.apply` around 14:03 ET overwrote `channels.discord.token` alongside other auth settings
  - Levi pasted the live token in chat to recover service — **token should be rotated in Discord Developer Portal once stable**
  - DM routing reset: `channels.discord.dmPolicy: allowlist`, Levi's user id `1476617112498995384` added to `allowFrom` and `dm.allowFrom`
- **Gateway does not self-recover after restart** on the Dell — requires manual restart from PowerShell. Service supervision issue, not a model issue.
- **ClipMeta support email reply-target bug:** the `#email-approvals` draft would have replied to `hello@clipmeta.app` instead of `mclou190@yahoo.com`. Manually sent the right reply via `https://clipmeta.app/api/emails/reply` (email ID `d1811982-f556-4fa0-994c-b392f3d58b82`). **Reply-target parsing bug must be fixed before relying on auto-send.**
- WSL memory cap: `C:\Users\levic\.wslconfig` set to 6GB RAM, 2 processors, 2GB swap (Dell has 16GB total)

### 2026-04-05 — Cron chaos → recovery + first 528Hz render verified
- 1 AM: 14 cron jobs in error (Ollama RAM failures — models needing 9-15 GiB vs 7-8 GiB available — plus Anthropic billing remnants)
- By midday: down to 3 errors (Email Drip x3, Paid Customer Drip x2, Critical QA x1)
- By evening: **all 29 enabled jobs healthy**
- All 30 cron jobs migrated to Codex (no Anthropic API calls remaining)
- ClipMeta Critical QA: switched Sonnet→Codex, timeout 300s→600s
- Email Drip Sequence: Sonnet→Codex
- Paid Customer Drip: Sonnet→Codex
- 🎉 **First Still Frequency video render complete and verified:**
  - File: `/home/lb12340/still_frequency_output/528hz_hawaii_rough_coast_528hz_10h_master.mp4`
  - Duration exactly 10:00:00, H.264 1080p, AAC stereo, **48GB**
- ⚠️ **First upload FAILED — YouTube removed it because account was unverified** (15-min cap for unverified accounts)
- Levi verified the YouTube account → cap raised to 12 hours
- **Re-upload in progress via Hermes** at end of day — outcome unknown (no later note)
- **NEW IDEA captured: Stock Footage Metadata Grader** as a free landing-page lead magnet for ClipMeta:
  - Score contributor metadata against 1,000 real stock clip patterns
  - Gate full rewrite behind email + ClipMeta trial CTA
  - Full copy already written: headline, subhead, form fields, result screen, CTA
  - **Status: not built yet**
- Content pipeline still blocked: Facebook token expired 2026-03-27 (Error 190), 4 posts queued. Levi must generate fresh long-lived FB Page Access Token.
- SEO check: 0 visitors / 0 pageviews last 7 days, all 4 keywords not in Bing top 30, uptime online 354ms
- QA all day: 68 passed / 0 failed / 3 warnings (expected — `bradenton-beach-10-clip` has no clips)
- **Predator cluster details:**
  - IP `10.0.0.158`, username `levib` (NOT `levic` — that's the Dell)
  - Dell is `10.0.0.157`, username `levic`
  - Network share on Dell: `\\10.0.0.157\StillFrequency`
  - FFmpeg on Predator: `C:\Users\levib\AppData\Local\Microsoft\WinGet\Packages\Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe\ffmpeg-8.0.1-full_build\bin\ffmpeg.exe`

### 2026-04-06 — Metadata Grader already built (but never deployed) + Discord token broken AGAIN
- ⚠️ **Discord bot token BROKEN AGAIN** — `openclaw.json` `channels.discord.token` reset to `"REPLACE_THIS_TOKEN"`. All Discord sends returning 401. Likely lost during the April 4 config reset and never properly persisted. **Levi needs to restore the real bot token and figure out why it's getting reset.**
- Could not post the morning draft to channel `1482069898409541715` because of the token issue
- **Metadata Grader: full implementation already built locally on April 5 but NEVER committed/deployed**
  - Untracked files: `src/app/tools/metadata-grader/page.tsx` + `src/lib/stockFootageMetadataGrader.ts`
  - Live site still showing the older keyword-only version
  - Deployment task written to `morning-drafts/2026-04-06/task-1.md`
- **This is the most recent file in the archive.** No daily memory file exists for 2026-04-07 onwards as of capture date.

## Outstanding issues that may still be alive

These are issues that were open at the end of the daily files. I have not verified whether they're still open. **Verify before acting.**

1. **Discord bot token** — set to `"REPLACE_THIS_TOKEN"` on 2026-04-06; all Discord sends 401. Token also needs rotation per the 2026-04-04 incident.
2. **Hermes Still Frequency re-upload** — was in progress 2026-04-05, no confirmation it completed.
3. **Metadata Grader** — built locally 2026-04-05, never committed/deployed. Files: `src/app/tools/metadata-grader/page.tsx`, `src/lib/stockFootageMetadataGrader.ts`.
4. **Facebook Page Access Token** — expired 2026-03-27 (Error 190). Content post scheduler blocked. Multiple approved posts queued.
5. **ClipMeta webhook bug** — trial-to-paid conversion doesn't reset `clips_used_this_month`. Worked around manually for Andrew on 2026-03-31. Still needs proper fix.
6. **ClipMeta email reply-target parsing bug** — would reply to `hello@clipmeta.app` instead of the customer. Logged 2026-04-04. Must fix before auto-send.
7. **Hermes gateway service supervision** — does not self-recover after `wsl --shutdown` or restart. Manual restart required from PowerShell.
8. **$100 Anthropic credit** — must be claimed by 2026-04-17 at claude.com (expires 90 days after claim).
9. **Discord token rotation** — the live token Levi pasted in chat 2026-04-04 should be rotated in Discord Developer Portal.

## Cross-references
- [[agents|Multi-agent system]] — Terry, Hermes, etc.
- [[lessons_learned]] — distilled wisdom from across these days
- [[wsl_hermes_workspace]] — where Hermes lives
- [[cron_jobs]] — the cron table that this archive references
- [[clipmeta]] — the main product these days revolve around
- [[still_frequency]] — the second-largest project across this timeline
- [[sakis]] — the customer who appears most often in these notes
