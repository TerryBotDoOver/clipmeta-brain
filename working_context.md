# Working Context

> Snapshot of what's loaded in my head right now. Read first at session start.
> Continuously updated throughout each session.
> Part of [[levi]]'s graph -- this is the live "what's happening" view of his focus.

---

## Active Focus
**Three parallel threads as of 2026-04-14 end-of-day:**

1. **[[still_frequency|Still Frequency]] — 90-day commit started 2026-04-14.** Kill date: **2026-07-14.** 963Hz Crown Chakra shipped through the rebuilt pipeline (137.59 GB 4K final MP4). Manual upload in progress to YouTube. Kill criteria locked: subs ≥ 300, CTR ≥ 4%, avg view duration ≥ 2 min, at least one video ≥ 500 views. 3/4 hit = continue, 2/4 or worse = shut down and redirect to ClipMeta.

2. **[[eternal_frame_productions|EFP]] 2025 tax prep** — actively filing 1120-S in TurboTax Business on the Predator (see section below). Books cleaned morning, 1120-S being filed tonight before midnight deadline. Personal 4868 extension also in queue.

3. **[[clipmeta|ClipMeta]] background** — revenue-positive, ads tracking live, dashboard live. No active work this session, just compounding.

## First thing to do next session
1. **Check 963Hz upload status** (manual YouTube Studio upload). If finished, verify private video looks right, upload the Short (file ready at `upload_ready/Type Crown Chakra/963hz_type_crown_chakra_short.mp4`), then Levi reviews and sets visibility.
2. **Verify EFP 1120-S state** — last known in TurboTax Business interview, "Are You New to TurboTax Business?" screen. See `finance/tax_prep_2025/session_handoff.md` for full resume state.
3. **File 4868 personal extension** if not already done overnight.
4. **Pull up `C:\StillFrequency\STILL_FREQUENCY_TODO.md` and TaskList** to see live task state (11 tasks, 3 done, 8 active/pending).

## Session Summary (2026-04-14 full day — three sessions)

**Morning: Still Frequency 963Hz Crown Chakra pipeline run completed.**
Overnight render finished successfully. SCP-back took ~5.5 hrs (slow channel). Mux succeeded (137.59 GB), validate passed, thumbnail generated, upload failed OAuth `invalid_grant` — but actually fine because Levi had already decided during this session to upload manually from now on. Final file ready in `upload_ready/Type Crown Chakra/`. Levi started manual upload via YouTube Studio.

**Afternoon: EFP 2026 books cleanup + 1120-S filing started.**
148 transactions categorized, 2026 P&L cleaned, moved to TurboTax Business on Predator.

**Late night: Still Frequency strategy + infrastructure build.**
Levi asked the honest question: "will this channel ever grow or should I give up?" → got real multi-factor analysis → committed to 90-day test with kill criteria. Built 3 new things:
- `pipeline/shorts.py` (NEW) — auto-generates 60s vertical YouTube Short with burned-in text, runs as pipeline stage 6.5
- `pipeline/thumb_qc.py` (NEW) — iterative thumbnail generator with clean + cosmic styles. **Levi rejected outputs as "still terrible" — Pillow compositing hit ceiling.** Task #11 open to replace with ChatGPT/Canva/Flux workflow.
- Task tracking system — 11 tasks via TaskCreate + persistent dashboard at `C:\StillFrequency\STILL_FREQUENCY_TODO.md`

Also fixed: `type` slug filler-word bug, pipeline default `--skip-upload=True`, dashboard "Build Final Video (no upload)" button rename, FastAPI trigger_run now logs to file instead of DEVNULL.

See [[daily_logs/2026-04-14]] for full detail across all three sessions.

## Open Threads

### Still Frequency (managed via TaskCreate — 11 tasks live)
- 963Hz main upload finish + 963Hz Short upload (morning)
- **Replace Pillow thumbnail generator** — task #11 — Levi trying ChatGPT for custom thumbnails first, then decide: Canva template / gpt-image-1 API / Flux Pro
- **Channel hygiene** — task #3 — draft ready, needs Levi execution (trailer, About, playlists, end cards, pinned comments)
- **24/7 livestream plan** — task #5 — target launch week 4 (~2026-05-12), research Gyre vs LiveReacting vs OBS
- **Per-video copy package** — task #4 — recurring, Claude owns all titles/descriptions/tags/pinned comments/Short captions
- **Day 45 early checkpoint: 2026-05-29** — if 0-1 kill criteria passing, PULL EARLY, don't rationalize
- **Day 90 hard checkpoint: 2026-07-14**

### Still Frequency — deferred housekeeping (not blocking)
- Rename `clips_1080p` → `clips_transcoded` in work dir (task #10)
- Supabase project creation (dashboard run history)
- Windows Task Scheduler install (`scripts\install_task_scheduler.ps1`)
- Cloudflare tunnel for phone dashboard access
- ~~`type` slug bug~~ — ✅ FIXED 2026-04-14 (filler-word filter)
- ~~Shorts pipeline stage~~ — ✅ BUILT 2026-04-14

### ClipMeta (background, no active work)
- helton conversion check — NEVER resolved from 4/11 session
- Google Ads API compliance follow-up (was due 4/15)
- Metadata Grader still undeployed
- Discord bot token still broken
- FB Page Access Token still expired

### EFP tax — FILED (2026-04-14 evening)

**1120-S + WI Form 5S: FILED** via TurboTax Desktop Business 2025 on 2026-04-14 ~10:45 PM.
- Ordinary business income: $1,802
- K-1: Box 1 $1,802, Box 4a $22, Box 16B $78, Box 16C $98
- Business code corrected from 512191 → 512100 for e-file
- LLC address changed to FL on this return (was WI on 2024)

**Personal 4868 extension: FILED** via FreeTaxUSA at ~10:53 PM. $0 payment. Extends to Oct 15 2026.

**Personal 1040: ON EXTENSION** — due Oct 15 2026. File on FreeTaxUSA using K-1 + W-2 + capital loss carryforwards.

All files saved in `C:\Users\levic\Downloads\2025 Business Tax Stuff\`.

### EFP tax open loops (non-blocking)
- **Check TurboTax e-file acceptance** — IRS + WI DOR, check in a few days
- **FL F-1120 + Sunbiz Annual Report** — due May 1 2026 (EFP's first year in FL)
- **Delete broken "Google Ads" Zoho rule** (rule_id `6355719000000104025`)
- **Create Insurance Expense account in Zoho UI**
- **$122.45 eBay charge** — confirmed personal, book as owner distribution in 2026
- **Retroactive invoices for Jacey Bellefeuille** ($100/mo wedding plan)
- **~$1,669 Amex book-vs-bank gap**
- **Consolidate Automobile Expense into Vehicle account**

## Notes for Next-Me

### Still Frequency infrastructure
- **Pipeline lives at `C:\StillFrequency\`** with Python venv at `.venv\`
- **Content at `C:\Users\levic\Desktop\Still Frequency\`**
- **Dashboard servers:** FastAPI on 8000, Next.js on 3000, both running at session end
- **Persistent task dashboard:** `C:\StillFrequency\STILL_FREQUENCY_TODO.md` — compact, always readable without asking Claude
- **Task system:** TaskList / TaskCreate / TaskUpdate — 11 tasks live, see list below
- **UPLOAD POLICY (LOCKED):** Levi uploads manually via YouTube Studio. Pipeline default is `--skip-upload=True`. DO NOT suggest re-encoding to save upload time — this was explicitly rejected 4/14. Full quality always.
- **Shorts stage:** auto-runs after thumbnail, non-fatal. Stitches 4+ drone clips via concat demuxer to hit 60s, vertical crop, Pillow-generated text overlay PNG (avoids ffmpeg drawtext escaping hell), libx264 veryfast CRF 23.
- **Thumbnail reality:** Pillow hit its ceiling. Task #11 open to replace. Levi trying ChatGPT for custom thumbnails before we commit to a long-term solution.

### The 11 live tasks (use TaskList to see latest)
1. Build Shorts generation stage ✅ done
2. Build thumbnail generator w/ self-QC loop ✅ done (but not great)
3. Channel hygiene setup — pending, draft ready
4. Write titles/descriptions/tags per video — recurring
5. Plan 24/7 livestream launch — pending
6. Upload first 963Hz Short — ready for Levi
7. 90-day test checkpoint 2026-07-14 — scheduled
8. Ship videos 4-6 with A/B thumbnail test — blocked on #11
9. Fix `type` slug bug ✅ done
10. Rename `clips_1080p` → `clips_transcoded` — low priority
11. Replace Pillow thumbnail generator — pending, decision needed

### Predator SSH + render
- **Predator:** `levib@10.0.0.157` (LAN) or `ef-productions` (Tailscale). NOT `.158` which was in the old config.
- **Admin key file:** `C:\ProgramData\ssh\administrators_authorized_keys` — Dell's ed25519 pub key is there (NOT the user `.ssh\authorized_keys` — Windows OpenSSH gotcha for Administrators group)
- **Remote mkdir:** uses `New-Item -ItemType Directory -Force -Path 'a','b','c'` (PowerShell native, NOT `mkdir -p` which is a bash-ism)
- **Shuffle seed:** 42 first, then 5 retry seeds. Dashboard preview also uses 42.
- **Unicode print safety:** `run.py` reconfigures stdout to UTF-8 at import. `trigger_run` sets `PYTHONIOENCODING=utf-8`. Future unicode in print statements won't crash.
- **If SSH breaks:** run `ssh -vv levib@10.0.0.157 whoami` from Dell to debug
- **Config gotcha:** FastAPI loads config at import. `.json` edits need full FastAPI restart — `--reload` only watches `.py` files. Kill python zombies with `Stop-Process python -Force`.

### 90-day test gates (DO NOT RATIONALIZE AWAY)
- **Day 45 (2026-05-29) early checkpoint:** if 0-1 kill criteria passing, PULL EARLY. Don't wait.
- **Day 90 (2026-07-14) hard checkpoint:** subs ≥ 300 / CTR ≥ 4% / avg view duration ≥ 2 min / one video ≥ 500 views. 3/4 continue, 2/4 or worse SHUT DOWN. No rationalizing.
