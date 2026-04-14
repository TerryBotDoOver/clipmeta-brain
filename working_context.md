# Working Context

> Snapshot of what's loaded in my head right now. Read first at session start.
> Continuously updated throughout each session.
> Part of [[levi]]'s graph -- this is the live "what's happening" view of his focus.

---

## Active Focus
[[still_frequency|Still Frequency]] third video rendering overnight on the Predator RTX 4070. Levi went to bed ~02:30 AM 4/14 with the pipeline mid-run (SCP transfer phase). First real end-to-end test of the rebuilt pipeline — fixed 8 bugs tonight to get here. Expected completion ~04:30-06:30 AM.

## First thing to do next session
1. **Check pipeline status.** Hit `http://localhost:3000/projects/963hz_type_crown_chakra` OR directly read `C:\Users\levic\Desktop\Still Frequency\video_projects\963hz_type_crown_chakra/` for DONE / FAILED / RUNNING marker.
2. **Latest log:** `C:\StillFrequency\logs\963hz_type_crown_chakra_20260414_022102.log`
3. **If DONE:** verify private video is on YouTube with correct title "963Hz Deep Sleep Music | Crown Chakra Activation | 10 Hours Meditation". Levi will review + schedule publish.
4. **If FAILED:** read the FAILED marker + tail log for root cause. I have no known blockers — every bug from tonight is fixed.
5. **If still RUNNING:** tail the log, confirm NVENC is active on Predator (`nvidia-smi` via SSH), estimate remaining time.

## Session Summary (2026-04-13 late → 2026-04-14 early)
**Massive night.** Dashboard built out end-to-end (New Project form, file upload, Run buttons). Predator SSH authorized + path fixed. Config upgraded to 4K. 8 bugs fixed (mostly Windows Unicode + PowerShell-vs-bash issues). Third video (`963hz_type_crown_chakra`, Polulu Valley drone footage, 58 clips, 6 fresh Suno tracks) running on the right path for the first time.

See [[daily_logs/2026-04-14]] for full detail.

## Open Threads
- 3rd video upload verification (morning)
- Thumbnail system still "not there" per Levi 4/13 — need to revisit
- NewProjectForm placeholder fix (caused "type" in slug)
- Rename `clips_1080p` → `clips_transcoded` in work dir
- Supabase project creation (deferred)
- Windows Task Scheduler install (deferred)
- Cloudflare tunnel for phone access (deferred)
- helton conversion check — NEVER resolved from 4/11 session
- Google Ads API compliance follow-up (due today, 4/15)
- Metadata Grader still undeployed
- Discord bot token still broken
- FB Page Access Token still expired

## Notes for Next-Me
- **Pipeline lives at `C:\StillFrequency\`** with Python venv at `.venv\`
- **Content at `C:\Users\levic\Desktop\Still Frequency\`**
- **Dashboard:** FastAPI on 8000, Next.js on 3000, both running in background tasks at session end
- **Predator is at `10.0.0.157` (LAN) or `ef-productions` (Tailscale)** — NOT `.158` which was in the old config
- **Predator admin key file:** `C:\ProgramData\ssh\administrators_authorized_keys` — Dell's ed25519 pub key is in there now
- **Pipeline trigger:** `POST /api/projects/{slug}/run` (via dashboard "Run Full Pipeline" button) spawns `python -m pipeline.run --project {slug}` and logs to `C:\StillFrequency\logs\{slug}_{timestamp}.log`
- **Shuffle uses seed 42 first, then tries 5 backup seeds** if the target rule fails. Dashboard preview also uses seed 42 so dry-run and real run are consistent.
- **Unicode print bulletproofing:** `run.py` reconfigures stdout to UTF-8 at import time; `trigger_run` sets `PYTHONIOENCODING=utf-8` + `PYTHONUTF8=1` on subprocess env. Future unicode in print statements won't crash.
- **If Predator SSH breaks:** check `administrators_authorized_keys` perms (icacls output), check OpenSSH service on Predator, run `ssh -vv levib@10.0.0.157 whoami` from Dell to debug auth
- **Config gotcha:** FastAPI loads config at import time, so `.json` file edits need a full FastAPI restart — `--reload` only watches `.py` files. Also watch for python zombie processes (multiprocessing children surviving parent kills) — use `Stop-Process python -Force` to wipe them all.
