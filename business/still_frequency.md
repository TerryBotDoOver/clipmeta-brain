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

## The pipeline (4 phases, each fully or semi-automated)

### Phase 1: Video assembly (FULLY automated)
1. FFmpeg selects random clips from a footage category folder
2. Slows footage to 0.3x-0.5x
3. Applies color LUT (warm/cool/cosmic/dark presets)
4. Loops/crossfades footage to match audio length (2-8 hours)
5. Overlays particle effects + vignette
6. Muxes audio + video
7. Adds intro card (3 sec: frequency + title) and outro card

### Phase 2: Audio creation (semi-automated)
1. Generate 2-4 minute base track in Suno AI Pro ($10/mo, has commercial rights)
2. Generate pure frequency tone in Audacity/ffmpeg (sine wave)
3. Loop Suno track to target duration (2-8 hours)
4. Mix: Suno music 70% + frequency tone 15% + nature sounds 15%
5. Apply fade in/out

### Phase 3: Upload & publish (FULLY automated)
1. YouTube Data API v3 uploads
2. AI generates title/description/tags from template
3. Thumbnail auto-generated
4. Schedule publish time (optimal: 6-8 PM EST)

### Phase 4: Thumbnail generation (FULLY automated)
- Canvas/Sharp generates 1280x720
- Dark cosmic background + nature overlay + glowing Hz number + benefit text

**Target: <10 minutes of Levi's time per video once the pipeline is built.**

## The footage moat
[[levi|Levi]]'s 3TB of original drone footage from [[eternal_frame_productions|Eternal Frame Productions]] is the competitive advantage:
- **Other channels use stock footage.** YouTube's algorithm rewards original content.
- **Reuse strategy:** same shots, different speed (0.3x-0.5x slow-mo), different color grade, reversed, different segments, different transitions. Nobody notices because viewers have their eyes closed (literally).
- **Categorize once** into folders: ocean, sunset, aerial-nature, clouds, water-close-up, forest, night.
- Each video pulls random clips from the relevant category, applies different processing.

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

## Status (updated 2026-04-11 from STILL_FREQUENCY_README + Terry daily notes 2026-04-05/06)
- ✅ Launch plan complete (March 31)
- ✅ Pipeline coded (4+ Python iterations on disk + JS version in openclaw workspace)
- ✅ Channel created with branding (`UCxEU8jGxTj-6buGKos8disg`, @stillfrequency)
- ✅ Cross-machine render setup working (Dell network share → Predator RTX 4070 NVENC)
- ✅ **First video render COMPLETE and verified** (April 5): `/home/lb12340/still_frequency_output/528hz_hawaii_rough_coast_528hz_10h_master.mp4` — exactly 10:00:00, H.264 1080p, AAC stereo, 48GB
- ✅ STILL_FREQUENCY_README declares: "Pipeline ready for handoff to production"
- ⚠️ **First upload FAILED on April 4-5** — YouTube removed it because the account was unverified (15-minute upload cap for unverified accounts; the video was 10 hours)
- ✅ Levi verified the YouTube account on April 5 → upload cap raised to 12 hours
- ⚠️ **Hermes ran low on tokens before completing the re-upload.** Levi confirmed 2026-04-11 that **he had to do the re-upload himself** because Hermes was running out.
- ❓ Whether the manual upload Levi did is now live on the channel, and whether it has any views/subs — not confirmed
- ❌ **No mention in Hermes session logs since 2026-04-06** — the project went quiet right after the verification fix, partly because Hermes had no tokens left to push it forward

### Why this matters
The pipeline is genuinely DONE. The 48GB master file genuinely exists. The only thing between Levi and his first published Still Frequency video is **finding out whether Hermes's re-upload after account verification actually completed.** This is a 30-second check, not a project to restart.

## Publishing strategy (locked in 2026-04-05)
- **3 long-form videos per week:** Mon / Wed / Fri at 8 PM ET
- **Companion Shorts same day** at 6 PM ET (30-60 sec clip + text overlay "[FREQ]Hz for 60 seconds. Feel the shift.")
- **Frequency rotation order:** 528Hz ✅ → 963Hz next → 432Hz → 396Hz → 417Hz → 639Hz → 741Hz → 285Hz → 174Hz
- Levi creates project folders manually; notifies Hermes. **No folder watcher cron** (deliberate — Levi wants curation control)
- Suno prompt for 963Hz already written and ready (ambient healing, crown chakra, no percussion, loops cleanly)
- Target: 4+ hour average watch time per video. Kill any track under 60% retention to avoid algorithm death spiral.

## Honest pushback
This is the most fully built of [[levi|Levi]]'s side projects. The economics are real ($10.92 RPM is verified, not hype). The pipeline exists. The footage is owned. The cost is $10/mo.

But it's also the project that most needs the **first video to actually go live** before any of the math matters. Right now you have:
- A plan
- A pipeline (multiple iterations)
- Half a render
- Zero published videos
- Zero subscribers

The next move is **getting one video live**, not improving the pipeline. The Hawaii 528Hz video that got corrupted should be fixed and published. After that, you can iterate on the second.

If you don't want to do this anymore, that's fine — kill it and free the mental space. But don't let it sit half-built draining attention.

## Things to find out
- **Did Hermes's post-verification re-upload of 528Hz Hawaii actually complete?** (highest-priority unknown — the master file exists, the account is verified, this is the only thing left)
- Did Hermes ever generate the 963Hz Suno track to start the rotation?
- Why did the project go quiet 2026-04-06? (Hermes uptime? Discord token issue? Lost interest?)

## Cross-references
- [[business|Business hub]]
- [[eternal_frame_productions|Eternal Frame Productions]] — source of the drone footage
- [[served_cold|Served Cold]] — sister automated YouTube project (different niche)
- [[dell_topology]] — Dell + Predator render setup
- [[wsl_hermes_workspace]] — where most of the code lives
- [[agents|Hermes]] — the agent supposed to run this
- [[discord_server|Throw It In Reverse]] — has a HEALING FREQUENCIES category for this project
