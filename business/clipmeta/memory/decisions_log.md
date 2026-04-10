# Decisions Log

> Architectural and business decisions with reasoning. Cross-references: [[current_state]] · [[product/roadmap]] · [[mistakes]]


## 2026-04-09
- Created ClipMeta_Brain as operator/manager brain (not application code)
- Located real codebase: C:\Users\levic\.openclaw\workspace\clipmeta\clipmeta
- Confirmed AI provider is OpenAI GPT-4o (not Anthropic)
- Storage path format locked: {project_id}/{safeFilename}
- Roadmap set to conversion-first strategy
- Read-only codebase analysis completed
- Supabase keys rotated after secret exposure in git history
- Old keys deleted in Supabase dashboard
- Git history cleaned with filter-branch to remove leaked secrets
- GitHub push restored (force push with clean history)
- Referral qualification changed: only triggers when referred user converts to paid (not free/trial)
- Referral tiers updated to be more generous (5 tiers, up to Pro forever at 20 referrals)
- Referral widget added to dashboard
- Product update email sent to all 53 users
- Crons reduced from ~40 runs/day to ~18 runs/day for cost savings
- 7 non-essential crons paused
- Hermes default model switched from Opus to Sonnet
- Blog post cron kept active (SEO value)
- Usage/regen logic refactored to use dedicated regens_used_this_month column
- check-feedback.mjs rewritten to use env vars instead of hardcoded secrets
