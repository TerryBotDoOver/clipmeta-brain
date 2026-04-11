# Still Frequency

> Fully automated faceless YouTube sleep/ambient music channel. Started ~2026-04-03. Hermes was supposed to run it autonomously.
> Captured 2026-04-11 from Terry's MEMORY.md.
> Part of [[business|business]]'s graph.

## What it is
A YouTube channel that posts sleep music, binaural beats, and ambient frequency content (528Hz, 432Hz, etc.). 100% automated — no face, no voiceover, no manual editing required. The whole pipeline is supposed to run on its own once configured.

## Status (last known)
- First render attempted, interrupted by gateway restart (moov atom corruption in the output file)
- Re-render pending
- YouTube upload pending Google OAuth flow completion
- **Likely paused** because the project hasn't been mentioned recently in Terry's notes

## Channel info
- **YouTube Channel ID:** UCxEU8jGxTj-6buGKos8disg
- **Niche:** Sleep music, binaural beats, ambient frequencies
- **Google OAuth credentials:** Stored on Hermes (WSL Ubuntu)

## The pipeline
1. **Music:** Suno (AI-generated audio tracks, 10-hour loops)
2. **Video:** FFmpeg Ken Burns effect on drone footage from [[eternal_frame_productions|Eternal Frame Productions]]
3. **Rendering:** On the Predator with NVENC (RTX 4070), output to `C:\Users\levib\Desktop\still_frequency_render\`
4. **Thumbnails:** Python Pillow (extract frame from video + text overlay — no AI image generation needed, low cost)
5. **Upload:** YouTube Data API v3
6. **SEO:** Keyword-rich titles/descriptions targeting sleep music searches

## Infrastructure
- **Source clips:** Dell at `\\10.0.0.157\StillFrequency` (NOTE: that IP is the OLD Predator IP — the network share path may need updating to .158)
- **Render target:** Predator at 10.0.0.158 (SSH access as `levib@10.0.0.158`, key auth set up)
- **Output path:** `C:\Users\levib\Desktop\still_frequency_render\`
- **First video planned:** 528Hz Hawaii rough coast, 10-hour render

## Code location
`C:\Users\levic\.openclaw\workspace\still-frequency\` contains:
- `assemble-video.js` — the main pipeline
- `generate-audio.js` — Suno integration
- `metadata.js` — YouTube metadata builder
- `render.js` — FFmpeg orchestration
- `client_secret.json` — Google OAuth credentials (yes, in plaintext — security concern)
- `index.js` — entry point
- `package.json` — `still-frequency-pipeline`

## Why this exists (the bet)
Faceless YouTube content is a known revenue model:
- AdSense at scale (channels with millions of views per video)
- Low marginal cost per video (mostly compute, no human time)
- Sleep music has steady demand and long watch times (great for ad revenue)
- Drone footage is content [[levi|Levi]] already has from [[eternal_frame_productions|EFP]] — reuse asset

## Risk / known issues
- Suno terms of service for commercial use (verify)
- YouTube monetization for AI-generated content (YouTube has been tightening rules)
- The "moov atom corruption" issue from interrupted renders needs resolution
- Hermes gateway has to be running for this to operate autonomously

## Things to add
- Current monetization status
- Subscriber count
- Whether any videos are actually live yet
- What the planned posting cadence is
- Revenue projection / break-even calculation

## Cross-references
- [[business|Business hub]]
- [[eternal_frame_productions|Eternal Frame Productions]] — source of the drone footage
- [[dell_topology]] — the Dell + Predator render setup
- [[agents|Hermes]] — the agent that's supposed to run this
- [[served_cold]] — sister automated YouTube project (different niche)
