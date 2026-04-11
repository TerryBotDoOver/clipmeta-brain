# Video Engine

> Levi's homemade video generation system. Built 2026-03-18 by Terry. Used to make ClipMeta marketing demos and other content.
> Captured 2026-04-11 from Terry's MEMORY.md.
> Part of [[business|business]]'s graph (not a standalone business — a tool that supports the others).

## What it is
A lightweight video generation system built from Node.js Canvas + FFmpeg. Used to programmatically render marketing videos, demo reels, and animated content for [[clipmeta|ClipMeta]] and [[levi|Levi]]'s other projects.

**Why not Remotion or a SaaS tool?** Cost and ownership. Remotion would work but it's heavier and ties Levi to a vendor. This is fully self-hosted and lightweight.

## Code location
`C:\Users\levic\.openclaw\workspace\video-engine\` contains:
- `README.md`
- `SCREEN-RECORDING-GUIDE.md`
- `build-demo-reel.js`, `build-demo-reel-v2.js`, `build-demo-reel-debug.js` — main render scripts
- `gen-2026-03-22-2.mjs` ... `gen-2026-04-01-1-reel.mjs` etc. — many dated generation scripts (one per shoot or batch)
- `assets/` — image assets
- `batch-post-results.json` — batch results log

## Tech stack
- **Node.js Canvas** for 2D drawing
- **FFmpeg** for video encoding and audio mixing
- **No browser** (unlike Remotion which needs Chromium)
- Custom easing functions: linear, easeInOut, easeOutCubic, easeOutBounce, easeOutElastic
- Helpers: `drawText` (with word wrap), `drawRoundedRect`, `fadeIn`, `fadeOut`, `slideIn`, `drawCursor`

## What it can do
- Title cards with fade-in animations
- Zoom effects (e.g., 3-second zoom on pain points)
- UI mockups (slide-in panels with typing animation)
- Logo grids with checkmarks
- CTA cards with button graphics
- Voiceover + background music mixing with volume control
- Custom CLI: `node generate.js --template clipmeta-demo --output output/demo.mp4 --audio voice.mp3 --music bg.mp3 --music-volume 0.15`

## First template (built 3/18)
`clipmeta-demo.js` — 30-second promo video with 5 animated scenes:
1. Title card ("ClipMeta" fades in, blue underline grows)
2. Problem statement (3-second zoom on pain points)
3. Solution UI mockup (thumbnail card slides in left, metadata panel slides in right with typing animation)
4. Platform logos (Blackbox, Pond5, Adobe Stock, Shutterstock with checkmarks)
5. CTA ("Try it free" + clipmeta.vercel.app button)

**First render:** 30s demo (900 frames @ 30fps, 1080x1080) → 620KB MP4 ✅

## Reel Engine V3 (built 3/20-3/21)
A second iteration that uses Puppeteer (browser-rendered frames) instead of pure Canvas:
- Screen recording composite working (base64 injection)
- Before/after sales comparison support
- 3 scripts: `watch-me-keyword`, `pov-300-clips`, `before-after-sales`

## Use cases
- ClipMeta marketing videos (Product Hunt, social posts)
- Demo reels for stock platforms
- Reel-style social posts on Instagram / TikTok / Facebook
- Could potentially be reused for [[still_frequency|Still Frequency]] thumbnails or [[served_cold|Served Cold]] visuals

## Status
- Functional and used regularly through April 1 (last dated gen script)
- Likely still works, just may not have been touched since then

## Cross-references
- [[business|Business hub]]
- [[clipmeta|ClipMeta]] — primary user of this engine for marketing videos
- [[still_frequency|Still Frequency]] — could reuse pieces of this
- [[served_cold|Served Cold]] — could reuse pieces of this
