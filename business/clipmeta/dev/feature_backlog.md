# Feature Backlog (Updated April 9, 2026)

Priority: P0 (now) > P1 (next) > P2 (soon) > P3 (later)

---

## P0: Conversion + Revenue

### Verify Regen/Usage Deployment
- Upload 3 clips works on free plan
- 4th upload blocked
- All 3 first-time generations complete
- Regen count stays 0 until actual regeneration
- One regeneration works on free plan
- Second regeneration blocked
- Files: generate/route.ts, generate-worker/route.ts, billing/webhook/route.ts, useProfile.ts

### Usage-Based Upgrade Prompts
- Show value delivered at limit boundaries
- Trigger upgrade nudges in review page and dashboard
- Files: ClipLimitWarning.tsx, PlanGateBanner.tsx, UpgradeBanner.tsx

### helton_1818 Conversion
- Trial ending soon, 194 clips, 534 API calls
- Personalized outreach needed

---

## P1: Metadata Quality

### Fix Repetition Issues
- Root cause: GPT-4o produces similar output for visually similar clips despite uniqueness enforcement
- Existing mitigation: existingTitles/existingDescriptions in prompt, overused adjective detection, keyword root dedup
- Options: multi-pass generation, post-processing similarity check, stronger diversity enforcement
- File: generateMetadata.ts

### Batch Review UX
- Reduce clicks: bulk approve, quick-edit mode
- Show quality score per clip (metadataQuality.ts exists)
- Keyboard shortcuts for review flow
- Files: ReviewPageClient.tsx, ReviewQueue.tsx, MetadataEditor.tsx

---

## P2: Ops + Stability

### Video Worker Security
- Hardcoded secrets in video-worker/worker.js (lines 24-47)
- Note: Supabase key there is now the OLD rotated key (won't work)
- Move all secrets to .env with dotenv
- Add .env to .gitignore

### Resume Social Content Pipeline
- Meta/Facebook access token expired March 27
- Levi needs to generate new long-lived Page Access Token
- Once refreshed: resume Content Script Writer, Content Creator, Content Post Scheduler crons
- Page ID: 1068612369665934, Instagram ID: 17841440377759303

### Error Tracking
- Add Sentry or similar for API routes
- Expand admin stats endpoint

---

## P3: Growth + Expansion

### Google Ads Optimization
- UTM capture exists (UTMCapture.tsx, UTMSync.tsx)
- Refine conversion tracking
- Landing page A/B testing via feature flags

### Platform Integrations
- Shutterstock Contributor API (direct upload)
- Adobe Stock Contributor API
- Pond5 API

### Team/Agency Features
- Multi-user accounts
- Shared projects
- Usage reporting per team member

---

## Completed (April 7-9)
- Plan limit enforcement fix
- Regeneration limits by plan (regens_used_this_month counter)
- Editorial toggle (project + per-clip)
- Mandatory keyword positioning
- ProRes/MOV auto-generate
- Review page auto-refresh
- Adjective/category diversity improvements
- Keyword count minimum (40+)
- clip_history table
- Google Ads conversion tracking
- Referral system overhaul (5 tiers, dashboard widget, paid-user qualification)
- FTP transfer to Blackbox
- Product update email to all users
- Secrets audit and cleanup (check-feedback.mjs)
- Git history cleaned
- Supabase keys rotated
- GitHub push restored
- Crons optimized (7 paused, frequencies reduced)

---

## Not Planned (Yet)
- Photo metadata (video only)
- Mobile app
- AI-generated thumbnails
- Desktop app
