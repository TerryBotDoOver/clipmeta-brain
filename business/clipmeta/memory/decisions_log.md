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

## 2026-04-10 / 2026-04-11
- **ClipMeta_Brain expanded into full life knowledge graph.** Folder structure restructured: ClipMeta now lives in `business/clipmeta/`, new domains added (people, goals, health, learning, creative, finance, routines, journal, private). CLAUDE.md rewritten with expanded role and pushback rules.
- **SSH + Tailscale + key auth setup** between Predator and Dell. Windows OpenSSH on port 2222 (port 22 is forwarded to WSL where Hermes runs). Tailscale tailnet established with hostname `clipmeta-dell`. Levi can now `ssh -p 2222 levic@clipmeta-dell` from anywhere.
- **Obsidian Git plugin installed** and configured for cross-machine vault sync (5min pull, 10min push). Both Dell and Predator stay in sync.
- **Mission Control dashboard secrets cleanup.** 8 hardcoded secrets in `dashboard/server.js` (including Stripe live secret key) moved to `.env`. Refactored server with `loadEnv()` + `requireEnv()`. Created `.gitignore` for openclaw workspace. Restarted dashboard server in WSL.
- **Mission Control sync discipline added to CLAUDE.md.** Going forward, Claude updates `MISSION_CONTROL.md` and `task-log.json` after every meaningful work session. `terry-status.json` is left alone (Hermes's slot, not Claude's).
- **Studio regenerations capped at 500/month** (was effectively unlimited via `999999` sentinel + `studio` exclusion in limit check). Removes the unbounded loss scenario where a Studio user regenning 5x per clip could cost ~$240/month vs $47.28 net revenue. Studio is now economically bounded.
  - **Why:** Per-clip OpenAI cost is ~$0.02. Studio at 2000 clip cap = $40 cost = $7 profit. With unlimited regens, a single user could 10x their cost. Capping at 500 makes worst-case ~break-even.
  - **Impact:** Zero current Studio users affected (helton has 0 regens). New cap visible on pricing page and dashboard immediately.
- **Customer profile system added.** New folder `business/clipmeta/customers/` with detailed per-customer files. First entry: [[helton]].
- **Two new persistent feedback rules** saved for cross-session use:
  1. Tool descriptions must be specific and human-readable (Levi watches the loading text live)
  2. Approval prompts must be explained in plain language BEFORE the tool call
