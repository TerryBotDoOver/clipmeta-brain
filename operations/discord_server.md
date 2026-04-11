# Discord Server: "Throw It In Reverse"

> Levi's primary command center for cross-agent / cross-project coordination.
> Captured 2026-04-11 from Hermes session logs.
> Part of [[operations]] hub.

## Server identity
- **Name:** Throw It In Reverse
- **Guild ID:** `1482059902817140948`
- **Used by:** [[levi|Levi]], [[agents|Terry]] (OpenClaw on Dell), [[agents|Hermes]] (WSL agent, Hermes#6650 bot)

## Categories and channels (as of 2026-04-05 snapshot)

### Top-level / uncategorized
- `#videography`
- `#ops` — operations alerts (cron health, signups, errors)
- `#auctions` — for [[resale_flipping|resale]] auction tracking
- `#go-over-again` — review queue
- `#hermes` — direct Hermes channel
- `#terry-x-hermes` — **cross-agent coordination channel** (Terry talks to Hermes)

### CLIPMETA category
- `#clipmeta` — main
- `#reddit-drafts` — Reddit posts drafted by [[cron_jobs|the Reddit Monitor cron]] for [[levi|Levi]] to manually post
- `#forum-drafts` — forum post drafts
- `#marketing` — marketing discussion
- `#youtube-drafts`, `#x-drafts`, `#instagram-drafts`, `#facebook-drafts` — social drafts
- `#content-schedule` — scheduled content
- `#feedback` — [[clipmeta|ClipMeta]] customer feedback (fed by the Feedback Check cron)
- `#content-scripts` — script drafts
- `#content-review`, `#content-posted` — content workflow stages
- `#signups` — new ClipMeta signup notifications
- `#inbox` — inbound messages
- `#email-approvals` — Terry drafts customer emails here, Levi reacts ✅/❌ to approve/discard

### BEEKEEPER APP category
For the [[beekeeper_hive_manager|Beekeeper Hive Manager]] project:
- `#general`
- `#research`
- `#features`
- `#reddit-leads`
- `#build-log`

### SERVED COLD category
For the [[served_cold|Served Cold]] YouTube channel:
- `#general`
- `#content-queue`
- `#posted`
- `#analytics`
- `#research`

### LISTINGMETA category
For the [[listing_meta|ListingMeta]] backburner project:
- `#general`
- `#research`
- `#features`
- `#build-log`
- `#marketing`

### HEALING FREQUENCIES category
For the [[still_frequency|Still Frequency]] (originally called "Healing Frequencies") project:
- `#general`
- `#content-pipeline`
- `#research`
- `#uploads-log`
- `#build-log`
- `#analytics`

### Voice channels
- `General`

## Why the cross-channel topology matters
This Discord server is the **operating system for Levi's whole AI workforce**. Each project category gives the agents (Terry + Hermes) a place to:
- Post drafts for human approval
- Log automated activity
- Collect research and feedback
- Coordinate with each other (`#terry-x-hermes`)

[[cron_jobs|Many of the 31 cron jobs]] post their output to specific Discord channels here (Reddit drafts → `#reddit-drafts`, Stripe reconciliation → `#ops`, customer emails → `#email-approvals`, etc.).

If this server goes down or becomes unreachable, a lot of automation breaks silently because the agents have nowhere to post their output.

## Connection to my work (Claude Code / me)
I (Claude Code) **don't have a Discord channel yet**. I'm running directly on the Dell via the Claude Code CLI. There's no `#claude-code` channel and no Discord bot for me. If [[levi|Levi]] wanted me to post to Discord, that would need to be set up separately (Discord webhook is the simplest path).

The pre-existing `#terry-x-hermes` channel is interesting — it suggests Levi already values having an AI-to-AI coordination space. If Claude Code becomes a long-term operator alongside Terry/Hermes, a `#claude-code` channel or `#claude-x-hermes` channel might make sense eventually.

## Things to confirm with Levi
- Is the Discord server still actively used or has it gone quiet alongside Hermes?
- Are the cron-driven Discord posts actually showing up?
- Is `#terry-x-hermes` cross-coordination actually happening or is it dormant?
- Is there a channel for [[true_fence_florida|True Fence]] / [[freelance_web_design|freelance work]]? (Not in the snapshot I have)
- Is there a [[site_rules|SiteRules]] category? (Not in the snapshot I have, but the project was set up after this snapshot)

## Cross-references
- [[agents]] — Terry and Hermes both connect via this Discord
- [[cron_jobs]] — many of the 31 cron jobs post to Discord channels here
- [[wsl_hermes_workspace]] — Hermes's local files include Discord MCP integration
- [[clipmeta]], [[still_frequency]], [[served_cold]], [[listing_meta]], [[beekeeper_hive_manager]] — all have Discord categories
