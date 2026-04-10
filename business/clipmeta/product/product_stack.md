# ClipMeta Product Stack (Updated April 9, 2026)

## Codebase
- Local: C:\Users\levic\.openclaw\workspace\clipmeta\clipmeta
- GitHub: https://github.com/TerryBotDoOver/clipmeta.git (active, clean history)
- Deploys to Vercel via CLI

## Application
- Framework: Next.js (App Router) with TypeScript
- UI: Tailwind CSS + shadcn/ui
- Hosting: Vercel
- Domain: clipmeta.app

## Database and Auth
- Supabase (Postgres)
- Supabase Auth (email + Google OAuth)
- Key tables: profiles, projects, clips, metadata_results, clip_history, feature_flags, exports

## Storage
- Cloudflare R2 (bucket: clipmeta-uploads)
- Path format: {project_id}/{safeFilename}

## AI
- OpenAI GPT-4o (vision + text generation)
- Temperature 0.55
- Max 4 frames per clip, low detail mode, 768px max width
- Extensive prompt engineering for stock platform quality (~440 lines)

## Payments
- Stripe (subscriptions + one-time credit packs)
- Plans: Free (3 clips/day), Starter ($9/140 clips), Pro ($19/320 clips), Studio ($49/2000 clips)
- Annual plans with savings
- Credit packs: Small/Medium/Large
- Rollover system (capped per plan)
- Dedicated regens_used_this_month counter in profiles

## Video Processing
- Browser-side: canvas API frame extraction for MP4/WebM
- Server-side: local video-worker on Dell with ffmpeg for ProRes/HEVC/MOV

## Email
- Resend (from hello@clipmeta.app)
- Drip sequences: free track + paid track
- Welcome, welcome-batch, drip, drip-paid, reply handling

## Export Platforms
- Blackbox.global (primary)
- Shutterstock
- Adobe Stock
- Pond5
- Generic CSV

## Deployment Flow
1. Edit code locally
2. Deploy: Vercel CLI with deploy token (production)
3. Push to GitHub: TerryBotDoOver/clipmeta (main branch)
4. Verify: check clipmeta.app
