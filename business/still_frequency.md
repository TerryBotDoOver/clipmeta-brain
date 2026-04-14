# Still Frequency

> Faceless YouTube sleep/healing music channel. Originally planned as "Healing Frequencies" — same project, "Still Frequency" is the chosen brand name.
> Captured 2026-04-11 from `healing-frequencies/LAUNCH-PLAN.md` (master plan), Terry's MEMORY.md, and the Python pipeline files in `/home/lb12340/`.
> This file is much more detailed than the earlier draft because I found a TON more code and planning during the deeper scan.
> Part of [[business|business]]'s graph.

## What it is
A YouTube channel posting sleep music, binaural beats, and healing/Solfeggio frequencies (174Hz, 396Hz, 432Hz, 528Hz, 639Hz, 741Hz, 852Hz, 963Hz). 100% automated production pipeline. Reuses [[levi|Levi]]'s 3TB of drone footage as the visual layer.

**Why this niche specifically:** Sleep/healing soundscapes is the **#3 most profitable YouTube niche in 2026** per OutlierKit data:
- **RPM: $10.92** (1M views ≈ $10,920)
- **CPM: $16-20**
- **Competition: LOW** (~20K channels vs millions in gaming)
- **Faceless: yes**
- **Growth: 5.4x year over year**

For comparison, generic music is ~$3.50 RPM. Gaming is ~$6.17 RPM. This niche is 3x more lucrative.

## Naming history (don't get confused)
- **2026-03-31:** Project started under the working name "Healing Frequencies"
- Launch plan listed 5 channel name options. **Option #1: "Still Frequency"** was chosen.
- Both names still appear in the workspace:
  - openclaw `healing-frequencies/LAUNCH-PLAN.md` is the master plan doc
  - openclaw `still-frequency/` folder contains the JavaScript pipeline (Hermes-built version)
  - WSL home `still_frequency_*.py` files contain the Python pipeline
  - Discord HEALING FREQUENCIES category contains active channels: `#general`, `#content-pipeline`, `#research`, `#uploads-log`, `#analytics`, `#build-log`

So "Still Frequency" is the brand. "Healing Frequencies" is the working name and Discord category. Same project.

## Channel info
- **YouTube Channel ID:** `UCxEU8jGxTj-6buGKos8disg`
- **Brand colors:** Deep navy `#0A1628`, Soft gold `#C9A96E`, Muted teal `#4A8B8B`
- **Thumbnail style:** Dark cosmic/nature background, large glowing frequency number (e.g. "528 Hz"), soft light effects, minimal text
- **Channel art:** Dark gradient with subtle frequency wave visualization
- **Google OAuth credentials:** Stored on Hermes (`/home/lb12340/`)

## The actual production pipeline (authoritative — rewritten 2026-04-11 from Levi's own walkthrough)

> ⚠️ The earlier version of this section in this file described a simpler 4-phase pipeline with random-clip-category pulls and single-track audio loops. **That version is obsolete.** The real production workflow that Levi and Hermes actually use is the project-based, constraint-shuffle, split-render pipeline described below. Trust this section.

Each video is built from **4 ingredients**: audio (long-form ambient music from Suno), video (Levi's drone clips), assembly (the render pipeline), packaging (thumbnail + title + description + tags + upload/schedule).

### Stage 1 — Pick the concept (the "video identity")
Every video starts with a named concept like `432Hz Midnight Pass` or `528Hz Deep Sleep`. The concept determines:
- The frequency
- The healing angle ("deep sleep", "release fear", "spiritual sleep")
- The mood of the music (drives the Suno prompt)
- The style of footage (drives which drone project to draw from)
- The wording of title/description/thumbnail text

The identity gets locked before any rendering happens. A concept is not "432Hz + random nature clips" — it's **"432Hz Midnight Pass"**, meaning the footage has to come from the Midnight Pass drone project specifically.

### Stage 2 — Create the music (Suno, multi-track)
**CRITICAL: audio is NOT one track looped for 10 hours.** That's the old/naive approach and it sounds obviously repetitive.

The real workflow:
1. **Levi generates ~6 Suno tracks** per concept in Suno Pro, all variations on the same theme (manual step — Suno web app, no API)
2. All tracks get dropped into the project folder
3. Hermes lines them up in sequence
4. **Crossfades between them** (~3 seconds each)
5. **Loops that whole combined sequence** until it fills the target duration
6. **Trims to exact final length** to match the video

Result: one long seamless AAC audio file. This step is **fast** (~1 minute). Audio is not the slow part.

**Why multiple tracks matter:** ~6 related tracks feel natural across 10 hours. One track looped feels artificial by minute 30.

### Stage 3 — Prepare the footage (project-based, NOT category-based)
**Old approach (now explicitly wrong):** grab random clips from an "ocean" or "forest" category pool.

**Current approach (rule):** each video has its own **dedicated footage set** — all clips come from the actual drone project that matches the concept. `432Hz Midnight Pass` uses only Midnight Pass drone footage, not some other pretty lake shot that happens to look similar.

This rule is **enforced for thumbnails too** (see Stage 9). It became a rule after a wrong-source thumbnail was produced once and is now explicitly disallowed.

### Stage 4 — Shuffle the clips (constraint-based, not random)
This is one of the most important and non-obvious parts of the whole system. Naive random shuffle is not good enough because clips filmed back-to-back look nearly identical. Clip 57 followed by clip 58 feels looped and cheap, even if a human would struggle to articulate why.

**Levi's rule:** consecutive source-numbered clips must never play near each other. **Target spacing: 8+ positions apart.** Minimum guarantee: zero adjacent near-neighbor violations.

The process:
1. Repeat all clips enough times to cover 10 hours
2. Randomize order
3. **Scan the sequence for bad neighbors** (source-adjacent clips within the no-fly zone)
4. Swap violators with safer candidates later in the list
5. Validate the final sequence **before** committing to render

This is a **first-class quality check** because once the render starts, re-doing it costs ~1.5 hours per mistake.

### Stage 5 — Render the video-only track (Predator, NVENC)
**Current workflow deliberately separates video encoding from final audio muxing.** Video is rendered as a **silent** long MP4 first.

Render specs:
- **Machine:** Predator (RTX 4070) via SSH/task scheduler from Dell — NOT the Dell itself
- **Encoder:** H.264 NVENC (hardware)
- **Resolution:** 4K
- **Frame rate:** 30 fps
- **Duration:** typically ~10 hours
- **MP4 flags:** fragmented MP4 behavior enabled to reduce corruption risk if the render is interrupted (hard-learned lesson — a moov-atom-corrupted file from an interrupted render happened before)

**Time:** ~1.5 hours for a 10-hour video on Predator NVENC. This is the slow part of the pipeline.

### Stage 6 — Build the full audio track (parallel with Stage 5 or after)
While the video render is happening, Hermes prepares the long audio file using the Stage 2 process: crossfade Suno tracks → loop → trim to exact final video duration. Fast.

### Stage 7 — Mux video and audio
Once the silent video and the long audio exist separately, FFmpeg combines them into the final deliverable. This is **fast** because both streams are already encoded — it's essentially a remux, not a re-encode.

**Why split-and-mux beats one-shot render:** if something goes wrong with audio, you don't lose the 1.5-hour video render. If something goes wrong with video, you don't lose the audio work. Recovery is cheap.

### Stage 8 — Verify the final file (ffprobe gate)
**A file existing on disk does NOT mean it is valid.** This is a lesson the project already learned the hard way.

Before declaring the render "done":
- Run `ffprobe` against the output
- Confirm the file opens cleanly
- Confirm both audio and video streams are readable
- Confirm duration matches expected (for a 10-hour video: ~36,000 seconds)

If validation fails → not done. No upload.

### Stage 9 — Thumbnail (must use project-specific footage)
Current branded style:
- **Background:** real footage from that video's own project (hero frame extracted from the source clips or the final video)
- **"Still Frequency"** wordmark top right
- **Large frequency text** bottom left ("432 Hz")
- **Subtitle** beneath ("Midnight Pass — 10 Hours Deep Sleep")
- **Dark bottom gradient** for text readability
- **No manual duration badge**
- **Output:** 1280×720 JPEG

**Enforced rule:** the background frame MUST come from that video's own footage. Sourcing from a different project is explicitly disallowed after a past mistake.

### Stage 10 — Metadata (per-video, no templates)
Each upload has its own title, description, tags, optional pinned comment, category, and schedule time. **No generic metadata pasted across videos.**

Title pattern:
```
[frequency] + [benefit] + [duration] + [context]
```
Example: `528Hz Deep Sleep Music | Healing Frequency for Relaxation & Meditation | 10 Hours`

Description includes:
- Explanation of the frequency
- Sleep/relaxation positioning
- Chapter timestamps if applicable
- SEO-supportive language
- Calm but clear wording

### Stage 11 — Upload to YouTube (private first, then schedule)
**Never publish immediately.** The safe upload flow is:
1. Upload as **private** via YouTube Data API v3
2. Set the thumbnail
3. Check processing status via API (very long 4K files can get stuck processing — this has happened)
4. Confirm YouTube is processing it properly
5. Set schedule time
6. Leave it private/scheduled until Levi decides to release

This process exists because of real incidents where huge 4K files got stuck in processing or uploaded with wrong durations.

## Production failure modes (what breaks and why it matters)
1. **Bad clip shuffle** — makes repetition obvious to the eye, forces a re-render (~1.5 hours lost). Mitigation: Stage 4 constraint check before render.
2. **Wrong-source thumbnail** — violates branding, must be re-done. Mitigation: Stage 9 rule that thumbnail hero frame must come from the same project's footage.
3. **Broken long render** — interrupted render produces invalid MP4s. Mitigation: fragmented MP4 flags + Stage 8 ffprobe validation.
4. **YouTube processing stuck** — especially for very large 4K uploads. Mitigation: upload private, check status via API, don't trust "uploaded" as "live".
5. **Missing source organization** — if the right project footage/audio isn't clearly locatable, the pipeline drifts or makes wrong assumptions. Mitigation: one project folder per video, explicit layout.

## The target operating mode (fully hands-off, what Levi wants)
**Night before:** Levi drops footage set + the ~6 Suno tracks for one concept into a designated project folder.

**Overnight:** Hermes
- Builds the constraint-shuffled clip list
- Kicks off the long Predator NVENC video-only render
- Builds the long audio from the Suno tracks
- Muxes video + audio after render completes
- Runs ffprobe validation
- Extracts the thumbnail hero frame from the correct source
- Generates thumbnail + title + description + tags
- Uploads as private
- Checks YouTube processing status
- Sets the scheduled publish time
- Reports completion in `#build-log` / `#uploads-log`

**Next day:** finished package is already private/scheduled on the channel. Levi reviews and releases (or lets the schedule fire).

**Levi's only hands-on steps** in the ideal state: pick the concept, generate the Suno tracks, drop files in the folder. Everything else is Hermes.

## The footage moat
[[levi|Levi]]'s 3TB of original drone footage from [[eternal_frame_productions|Eternal Frame Productions]] is the competitive advantage:
- **Other channels use stock footage.** YouTube's algorithm rewards original content.
- **Project-based sourcing** (not category pools) means each video has a coherent visual identity tied to a real place Levi actually filmed.
- Cost: already owned. Zero marginal cost per video.

## Revenue math (per the launch plan)
| Month | Views/Mo | RPM | Revenue |
|---|---|---|---|
| 1-3 | 10K-50K | $0 (pre-monetization) | $0 |
| 4-6 | 100K-300K | $10.92 | $1,092-$3,276 |
| 7-12 | 500K-1M | $10.92 | $5,460-$10,920 |
| Year 2 | 2M-5M | $10.92 | $21,840-$54,600 |

## 24/7 livestream strategy (game changer, post-monetization)
Per Gyre case study cited in the launch plan:
- Run 24/7 livestreams of looping pre-recorded sleep music
- Live streams show up differently in YouTube search/recommendations — people searching "sleep music" at 2 AM see LIVE content first
- Tools: **Gyre** ($9.99/mo) or LiveReacting
- Result on one channel: **1,100% revenue increase, 847% watch time increase in 90 days**
- On another channel: streams were only 11% of views but **80.3% of total income** ($17,936)
- **Add this AFTER YPP monetization is approved** (need 1,000 subs + 4,000 watch hours first)

## Real-world proof points (from launch plan)
- **Adavia Davis:** $700K/year from AI background content, 85-89% margins (Fortune, Dec 2025)
- **Yellow Brick Cinema:** 6M+ subscribers, 2.5B+ views, 11 years running, has its own app
- **AI slop channels collectively:** 63B views, 221M subs, $117M/year revenue (Guardian, Jan 2026)

## Tool stack & costs
| Tool | Purpose | Cost |
|---|---|---|
| Suno AI Pro | Music generation | $10/mo |
| FFmpeg | Video assembly + audio mixing | Free |
| YouTube Data API v3 | Upload + scheduling | Free |
| Audacity | Frequency tone generation | Free |
| Node.js + Sharp / Python Pillow | Thumbnail generation | Free |
| Drone footage | Visuals | Already owned (3TB) |
| Premiere Pro | Optional manual touch-ups | Already owned |
| **Total** | | **~$10/mo** |

## Suno license — CRITICAL legal note
- **Free tier: NO commercial use.** Cannot monetize.
- **Pro plan ($10/mo): full commercial rights.** Suno retains authorship. You get perpetual license to exploit commercially.
- **You CANNOT get Content ID** on Suno-generated music.
- **Risk:** Someone using the same Suno prompt could get similar music.
- **Mitigation:** Layer frequency tones, nature sounds, and original drone footage on top. The more human effort mixed in, the safer.

## Code (where the pipeline lives)

### openclaw workspace (`C:\Users\levic\.openclaw\workspace\still-frequency\`)
JavaScript pipeline (Hermes built this version):
- `assemble-video.js`, `generate-audio.js`, `index.js`, `metadata.js`, `render.js`
- `client_secret.json` — Google OAuth credentials (in plain text — security concern)

### WSL home (`/home/lb12340/`)
Python pipeline (newer / more developed). Files directly in home dir:
- `complete_still_frequency_pipeline.py` (7.4KB) — earlier version
- `complete_still_frequency_pipeline_enhanced.py` (16.3KB) — newer version
- `still_frequency_assembly.py`, `still_frequency_assembly_enhanced.py`
- `still_frequency_demo.py`, `still_frequency_fixed.py`, `still_frequency_production.py`
- `still_frequency_metadata.py` — YouTube metadata
- `still_frequency_thumbnail.py`, `still_frequency_thumbnail_ab.py`, `still_frequency_thumbnail_v2.py`
- `still_frequency_youtube_auth.py`, `still_frequency_youtube_upload.py`
- `youtube_uploader.py`, `thumbnail_generator_fal.py`
- `create_sf_banner.py`, `create_sf_watermark.py`, `prepare_sf_profile_pic.py` — branding assets
- `pipeline_status_report.py` — pipeline monitoring
- `STILL_FREQUENCY_README.md` (3.9KB) — readme I haven't read yet

### Cross-machine rendering scripts
- `render_528hz_hawaii_remote.ps1` — PowerShell to render on the Predator's RTX 4070
- `run_still_frequency_upload_528hz_hawaii.sh` — shell wrapper
- `copy_to_predator.py` — file transfer
- `predator_check.ps1` — Predator health check
- `rerender_hawaii_528.py` — re-render the first failed Hawaii video

**The cross-machine pipeline:** Source footage on Dell network share `\\10.0.0.157\StillFrequency` → SSH/SCP to Predator → Render on RTX 4070 NVENC → Upload from Predator with YouTube API.

## Upload policy (locked 2026-04-14)
**Levi uploads Still Frequency videos manually via YouTube Studio. The pipeline renders and stops.** Reason: quality preservation. The Predator NVENC render at CQ 23 produces large 4K files (~130-150 GB for 10 hours). Re-encoding before upload would introduce generation loss that defeats the purpose of rendering at 4K in the first place. YouTube re-encodes on their side anyway, and a higher-quality source produces a better YouTube re-encode than an already-compressed source.

The dashboard's "Build Final Video (no upload)" button now passes `skip_upload: true` automatically. The pipeline finishes after mux/validate/thumbnail and leaves the final file at:
- **MP4:** `C:\Users\levic\Desktop\Still Frequency\upload_ready\{Theme Label}\{slug}_final.mp4`
- **Thumbnail:** `C:\Users\levic\Desktop\Still Frequency\thumbnails\{slug}.jpg`

Levi then uploads via YouTube Studio in the browser. Typical upload time for a 130+ GB file over a home connection is 12-18 hours, so he'll usually start the upload before bed and let it run overnight.

**Do not suggest re-encoding Still Frequency videos to save upload time.** This was explicitly considered and rejected 2026-04-14. Full quality every time.

## Channel status (updated 2026-04-14)
**2 videos LIVE + 1 rendering overnight:**
1. ✅ **528Hz Deep Sleep Music | Hawaii Coast Relaxation & Meditation | 10 Hours** — published ~2026-04-06, 11 views, 10:00:01 duration. Original Hermes-built video.
2. ✅ **432Hz Deep Sleep Music | Calm Ocean Waters | 10 Hours Meditation** — published ~2026-04-12, 1 view, 10:48:20 duration. Second video.
3. 🏃 **963Hz Deep Sleep Music | Crown Chakra Activation | 10 Hours Meditation** — FIRST video through the rebuilt C:\StillFrequency pipeline. Rendering overnight 2026-04-14 on the Predator RTX 4070 at 4K 30fps h264_nvenc. Polulu Valley drone footage (58 clips), 6 fresh Crown Suno tracks. Slug: `963hz_type_crown_chakra` (typo in theme field, handled with title.txt override). Expected upload: ~04:30-06:30 AM private to YouTube. See [[daily_logs/2026-04-14]] for full detail.

**Important:** the "3 videos with 2 stuck in processing" story from the previous brain version was WRONG. There are exactly two videos on the channel. The earlier mention of "432Hz Midnight Pass ready but not uploaded" appears to have been superseded — the 432Hz video that actually shipped is "Calm Ocean Waters", not Midnight Pass.

**Production evidence the pipeline works end-to-end:**
- Both live videos prove the auto-render + upload flow works
- The pipeline rebuild at `C:\StillFrequency\` is the new deterministic replacement for the Hermes-based production flow

### Next video (rotation planning as of 2026-04-13)
- **528Hz and 432Hz are both already shipped** — the next video must be a different frequency
- **963Hz Crown Chakra is the logical next** — it was the original #2 slot in Levi's rotation plan, and 6 Suno tracks for it are already staged in `audio_library/` (Crown Glasslight, Crown Pulse, Crown Quartz Metonym, each with 2 variations)
- **Still needed for 963Hz video:** drone footage staged in `video_projects/963hz_crown_chakra/` (TBD which drone project fits a crown chakra / cosmic spiritual theme)
- **Target cadence:** 2 videos per week

## Publishing strategy (locked in 2026-04-05, updated 2026-04-13)
- **2 long-form videos per week** (target cadence confirmed by Levi 2026-04-13)
- **Frequency rotation — actual shipped state:**
  - 528Hz ✅ SHIPPED (Hawaii Coast, ~2026-04-06)
  - 432Hz ✅ SHIPPED (Calm Ocean Waters, ~2026-04-12)
  - 963Hz ← NEXT (audio already staged in `audio_library/`, footage TBD)
  - Then: 396Hz → 417Hz → 639Hz → 741Hz → 285Hz → 174Hz
- Levi creates project folders manually; pipeline picks them up. **No folder watcher cron** (deliberate — Levi wants curation control)
- Suno prompt for 963Hz already written and ready (ambient healing, crown chakra, no percussion, loops cleanly)
- Target: 4+ hour average watch time per video. Kill any track under 60% retention to avoid algorithm death spiral.

## Can it actually be fully hands-off? (honest assessment, 2026-04-11)
Yes — but with specific gaps to close. The pipeline has already proven the hardest parts (render, assembly, constraint shuffle, split mux, ffprobe validation, upload). The remaining work is infrastructure and edge-case handling, not core functionality.

### Gaps between "today" and "drop a folder, walk away"
1. **Hermes token burn on uploads.** Hermes ran out of tokens on ONE upload. Probable cause: the upload flow was streaming progress back through the agent context, or wrapped in retries that burned agent turns per chunk. **Fix:** make the upload a fire-and-forget shell script the agent launches (`nohup bash upload.sh &`) and checks status on via a separate status-poll, not a blocking operation. Target: ≤500 Hermes tokens per completed upload.
2. **Gateway supervision.** The Hermes WSL gateway does not self-recover after Windows sleep/restart. If the Dell reboots overnight, the pipeline silently stops. **Fix:** wrap `hermes gateway run` in a supervised process (pm2 inside WSL, or a Windows scheduled task that pings it every 5 min and restarts on failure).
3. **YouTube processing monitor.** Two videos are currently stuck in YouTube processing — nobody noticed because there's no watchdog. **Fix:** 20-line cron that polls `videos.list` for each uploaded video; if status is "processing" after 6 hours, ping Discord `#uploads-log`.
4. **Project folder convention.** Levi's mental model is "drop footage and audio into the proper place." That "proper place" needs to be an explicit, documented folder layout the pipeline watches. **Fix:** lock the layout (e.g. `projects/{concept}/footage/`, `projects/{concept}/suno/`, `projects/{concept}/output/`) and either add a file watcher OR keep a "Levi posts in `#content-pipeline`: ready to render `432hz_midnight_pass`" Discord trigger.
5. **Retention kill switch (algorithmic safety).** The launch plan says "kill tracks under 60% retention" to avoid the death spiral. Right now nothing does that. **Fix:** cron polls YouTube Analytics at 48h post-publish; unlists any track under 60% average retention. This is the one piece of automation that protects the channel from a bad track poisoning the algo.

Note that **Suno generation stays on Levi's side** — that's deliberate, not a gap. Suno doesn't have a realistic commercial API, and Levi generating ~6 themed tracks per video is his quality gate. The "hands-off" model is: Levi makes Suno + drops files + forgets, Hermes does everything downstream.

### What Levi has to do per video in the ideal state
1. Pick the concept (1 minute)
2. Generate ~6 Suno tracks in the Suno web app (~15 min)
3. Drop Suno files + matching footage into the project folder (2 min)
4. Review and release when Hermes reports done (1 min)

**Total human time per video: ~20 minutes, none of which is babysitting render or upload.** That's the prize.

### The honest "yes, if..." answer
Yes, this can be fully hands-off on Levi's end. The core pipeline is real and has shipped. The remaining work is **5 specific gaps**, and **none of them are speculative** — each one is a known failure mode with a clear fix. The question is whether Levi wants to invest the ~1 week of focused work to close all 5 gaps, in exchange for a self-running sleep-music factory that could become the highest-ceiling project in the portfolio alongside ClipMeta.

## Things to find out / verify
- **963Hz upload result (morning of 4/14):** did the pipeline finish end-to-end? Is the private video on YouTube?
- **Current subscriber count** — haven't checked. The first video has 11 views after 7 days, the second has 1 view after 1 day. Very early.
- **Thumbnail quality:** Levi still not satisfied with the layered Pillow compositor as of 4/13. Need to revisit — possibly pivot to Canva templates or a Flux img2img enhancement pass.

## Pipeline authority (as of 2026-04-14)
`C:\StillFrequency\` (deterministic Python rebuild) is the authoritative pipeline. The Hermes-based Python files in `/home/lb12340/` are legacy; the openclaw JS pipeline is abandoned. The first real end-to-end run (963Hz Crown Chakra) started the night of 4/13-14 and is the production proof-of-life.

### Dashboard running pattern
- **FastAPI:** `cd C:\StillFrequency && .venv\Scripts\python -m uvicorn api.main:app --host 0.0.0.0 --port 8000 --reload`
- **Next.js:** `cd C:\StillFrequency\web && npm run dev`
- **Access:** http://localhost:3000 (dashboard) or http://localhost:8000/docs (API docs)
- **Run a project:** create via dashboard → drag-drop footage + audio → "Run Full Pipeline" button → tail `C:\StillFrequency\logs\{slug}_{timestamp}.log`

### Known-working Predator path
- **SSH target:** `levib@10.0.0.157` (LAN) or `ef-productions` (Tailscale)
- **Auth:** Dell's `~/.ssh/id_ed25519` pubkey authorized in Predator's `C:\ProgramData\ssh\administrators_authorized_keys` (NOT user `.ssh\authorized_keys` — Windows OpenSSH gotcha for Administrators)
- **FFmpeg path:** `C:/Users/levib/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-8.0.1-full_build/bin/ffmpeg.exe`
- **NVENC encoder:** h264_nvenc confirmed available on RTX 4070 Laptop (8 GB VRAM, driver 572.83)
- **Remote work dir:** `C:/Users/levib/Desktop/still_frequency_render/{clips,work,output}`

## Cross-references
- [[business|Business hub]]
- [[eternal_frame_productions|Eternal Frame Productions]] — source of the drone footage
- [[served_cold|Served Cold]] — sister automated YouTube project (different niche)
- [[dell_topology]] — Dell + Predator render setup
- [[wsl_hermes_workspace]] — where most of the code lives
- [[agents|Hermes]] — the agent supposed to run this
- [[discord_server|Throw It In Reverse]] — has a HEALING FREQUENCIES category for this project
