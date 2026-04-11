# Lessons Learned (from Terry's MEMORY.md)

> Distilled from `C:\Users\levic\.openclaw\workspace\MEMORY.md`. These are real mistakes Terry made over the past month, with the lesson on the other side. Read these to avoid repeating the same errors. This is GOLD.

## Code & engineering

### Verify model names before deploying (3/16)
**Mistake:** `gpt-5.4-pro` was deployed to ClipMeta but doesn't exist as an OpenAI model. Every metadata generation silently failed for hours before anyone noticed.
**Lesson:** Always verify model names against the actual API before deploying. Don't trust autocomplete or memory.

### Loading state callbacks (3/16)
**Mistake:** `setRunning` was passed as `() => setRunning(null)` but called with booleans, instantly resetting state.
**Lesson:** Match callback signatures to how they're invoked. Read the call site, not just the declaration.

### Hardcoded light-mode colors break dark mode (3/13–3/16)
**Mistake:** Used `text-slate-900`, `bg-slate-50`, etc. — invisible on dark backgrounds.
**Lesson:** Always use semantic theme classes (`text-foreground`, `bg-primary`, `border-border`). Never hardcode color shades.

### Vercel body limit (3/16)
**Mistake:** Sent base64-encoded images larger than ~4.5MB through Vercel serverless functions, causing 413 errors.
**Lesson:** Vercel serverless has a ~4.5MB body limit. Scale images down before base64-encoding for API payloads. ClipMeta now scales frames to 768px max.

### Supabase storage tier limits (3/13)
**Mistake:** Used Supabase storage for video files, hit 50MB-per-file hard cap on free tier.
**Lesson:** Supabase free tier caps storage at 50MB/file. Migrate to R2 for video. (ClipMeta did this — R2 has no size limits, 10GB free, zero egress.)

### Plan gating bug pattern (3/30)
**Mistake:** Used `profile?.plan ?? 'free'` directly without checking `stripe_subscription_status`. Trialing Pro users were treated as Free everywhere.
**Lesson:** **NEVER** check `profile.plan` directly. ALWAYS check `stripe_subscription_status` first. Use this pattern:
```ts
const activeStatuses = ["active", "trialing", "founder"];
const isActiveSub = activeStatuses.includes(profile?.stripe_subscription_status ?? "");
const userPlan = (isActiveSub ? profile?.plan : "free") ?? "free";
```

### Custom Stripe statuses (3/24)
**Mistake:** Code checked only `['active', 'trialing']` and silently mishandled `'founder'` users.
**Lesson:** Custom Stripe statuses (like `founder`) need to be explicitly included in any status check. Or use a constant array.

### Vercel CLI adds \r\n to env vars (3/24)
**Mistake:** Setting env vars via `echo X | vercel env add` adds a trailing newline. Stripe price IDs with newlines were silently failing.
**Lesson:** Always strip whitespace from env vars. ClipMeta has `cleanEnv()` wrapper in `plans.ts` for this. Use it everywhere or hardcode fallbacks.

### Turbopack and dynamic imports (3/30)
**Mistake:** `@ffmpeg-installer/ffmpeg`, `@ffprobe-installer/ffprobe`, `basic-ftp` crashed Turbopack at build time when imported via ES6.
**Lesson:** These need to be in `serverExternalPackages` in `next.config.ts` AND imported via `require()` (CommonJS dynamic), not ES6 `import`. Turbopack doesn't handle native binaries via static imports.

### Local Dell worker is dead (3/30)
**Mistake:** Built features that depended on a local Dell worker, which silently went offline.
**Lesson:** Don't depend on local-machine workers in the live ClipMeta product. Build server-side on Vercel or use OpenClaw cron jobs. Anything that needs to run "on Levi's machine" will fail at some point.

### Subagent model choice matters (3/30)
**Mistake:** Used `qwen2.5:14b` (local Ollama) for a medium-complexity task. Timed out after 20 min.
**Lesson:** Local Ollama models are not suitable for complex code work. Use Claude Code (`claude --print --permission-mode bypassPermissions`) for code tasks instead.

### OpenClaw OAuth tokens (3/24)
**Mistake:** Tried to use `sk-ant-oat01-*` tokens directly with the Anthropic SDK. They don't work that way.
**Lesson:** OpenClaw OAuth tokens only work through the OpenClaw gateway. For direct Anthropic SDK usage, you need a real Anthropic API key.

### Supabase sb_secret_ key format (3/24)
**Mistake:** Tried to use `sb_secret_*` keys with the Supabase REST API directly. They don't work.
**Lesson:** Use the Supabase Management API instead: `api.supabase.com/v1/projects/{ref}/database/query` with a PAT.

### Two consecutive upserts can overwrite each other (3/24)
**Mistake:** Had a trial flow that ran two `.upsert()` calls in sequence. The second one overwrote the first with stale/invalid data.
**Lesson:** Never run two consecutive upserts where the second can overwrite the first. Use `.update()` for incremental changes, or merge data into a single upsert.

## Memory & continuity

### Save credentials to files immediately (3/19)
**Mistake:** Levi gave Terry the ElevenLabs API key. Terry forgot it by next session and Levi had to share it again.
**Lesson:** Memory doesn't survive session restarts. **Write credentials to files immediately.** Don't rely on conversation history. Same rule applies to me (Claude Code).

### Mental notes don't survive (general principle)
**Lesson:** "Mental notes" don't exist for AI agents. If you want to remember something, write it to a file. Text > brain.

## Customer & operations

### NEVER send customer emails without approval (3/24)
**Lesson:** All customer-facing emails must go through `#email-approvals` Discord channel for human approval. No exceptions.

### Reddit bot detection (3/24)
**Mistake:** `u/lb12340` was banned from `r/editors` and `r/videography` even though Levi was posting manually. Reddit's anti-spam flagged the patterns.
**Lesson:** Even manual posting can trigger bans if patterns look automated. Be more random in timing, comment more before posting links, vary subreddits. Use a fresh account if needed.

## NON-NEGOTIABLE rules from Levi

These are explicitly stated by Levi and recorded in MEMORY.md (added 4/4):

### NEVER GUESS OR HALLUCINATE
> "You either tell me stuff that you absolutely know 100 percent, or you don't tell me anything at all."

If you don't know something with 100% certainty, say "I don't know" or "I need to look that up." Do NOT present inferences or guesses as facts. Ever. This applies to customer data, code behavior, API responses, prices, promo codes, anything.

### Em dashes (Terry rule)
Per SOUL.md (Terry's instructions): never use em dashes (—) in any context. They're a dead giveaway that text was AI-generated. Use periods, commas, or colons.

(Note: Claude Code (me) uses `--` instead, which is similar but not the same character. Levi seems OK with this for me — I should double-check if he wants me to fully abandon the dash convention too.)

## Cross-references
- [[mistakes]] -- the live mistakes log for Claude Code (separate from this archived list)
- [[agents]] -- the multi-agent system that produced these lessons
- [[clipmeta]] -- the project most of these lessons came from
