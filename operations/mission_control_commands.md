# Mission Control — Commands & Management

> Quick reference for managing the Mission Control dashboard, Cloudflare Tunnel, and Cloudflare Access.
> All scripts live at `C:\Users\levic\.openclaw\workspace\dashboard\`.
> Part of [[operations]] graph.

## Dashboard URL

**`https://mc.clipmeta.app`** — accessible from any device, any network, secured by Cloudflare Access (email PIN to `leviclaude1998@gmail.com`).

## Status check

```powershell
# From the dashboard folder:
cd C:\Users\levic\.openclaw\workspace\dashboard
.\start-mission-control.ps1 -StatusOnly
```

This checks:
- Is the dashboard (node) listening on port 3131?
- Is the cloudflared tunnel process running?
- Can `localhost:3131` respond?
- Can `mc.clipmeta.app` respond (with Access gate)?

## Manual start (if something died)

```powershell
cd C:\Users\levic\.openclaw\workspace\dashboard
.\start-mission-control.ps1
```

Idempotent — won't double-start if processes are already running.

## Auto-start on login

Already installed as Windows Scheduled Task: **"Mission Control Autostart"**. Fires 30 seconds after login, retries 3x on failure.

```powershell
# Verify it's registered:
Get-ScheduledTask -TaskName "Mission Control Autostart"

# Re-install if something broke:
cd C:\Users\levic\.openclaw\workspace\dashboard
.\install-autostart.ps1

# Uninstall:
.\install-autostart.ps1 -Uninstall
```

## Restart the tunnel only (if mc.clipmeta.app stops working but localhost:3131 is fine)

```bash
# In WSL terminal:
pkill -f 'cloudflared tunnel run'
sleep 1
cd ~ && setsid nohup ~/bin/cloudflared tunnel run mission-control > ~/cloudflared-named.log 2>&1 < /dev/null & disown
sleep 5
curl -s -o /dev/null -w "HTTP:%{http_code}\n" https://mc.clipmeta.app/
```

## Restart the dashboard only (if localhost:3131 is down)

```bash
# In WSL terminal — find and kill the old process:
ss -tlnp | grep 3131
# kill the PID shown, then:
cd /mnt/c/Users/levic/.openclaw/workspace/dashboard && setsid nohup node server.js > server.log 2>&1 < /dev/null & disown
sleep 2
curl -s -o /dev/null -w "HTTP:%{http_code}\n" http://localhost:3131/login
```

## Restart EVERYTHING (nuclear option)

```bash
# In WSL:
pkill -f 'cloudflared tunnel run'
pkill -f 'node server.js'
sleep 2
cd /mnt/c/Users/levic/.openclaw/workspace/dashboard && setsid nohup node server.js > server.log 2>&1 < /dev/null & disown
cd ~ && setsid nohup ~/bin/cloudflared tunnel run mission-control > ~/cloudflared-named.log 2>&1 < /dev/null & disown
sleep 5
curl -s -o /dev/null -w "localhost: HTTP %{http_code}\n" http://localhost:3131/login
curl -s -o /dev/null -w "mc.clipmeta.app: HTTP %{http_code}\n" https://mc.clipmeta.app/
```

## Finance page — refresh data

```bash
# From Git Bash or PowerShell:
cd C:\Users\levic\.openclaw\workspace\dashboard
node finance-collector.js
```

Or click the **"Refresh from Stripe"** button on the Finance tab in the dashboard.

## Log locations

| Log | Path |
|---|---|
| Dashboard server | `C:\Users\levic\.openclaw\workspace\dashboard\server.log` |
| Cloudflare tunnel | `/home/lb12340/cloudflared-named.log` (WSL) |
| Finance snapshots | `C:\Users\levic\.openclaw\workspace\dashboard\data\finance-snapshots.json` |
| Analytics snapshots | `C:\Users\levic\.openclaw\workspace\dashboard\data\analytics-snapshots.json` |

## Cloudflare Access — who can log in

Only `leviclaude1998@gmail.com`. To change:

1. Go to https://one.dash.cloudflare.com/ → Access → Applications → Mission Control → Policies
2. Edit the "Only Levi" policy
3. Add/remove email addresses under Include → Emails

Or ask Claude to do it via the Cloudflare API (needs a fresh API token with Access:Apps permission).

## Tunnel details

| Field | Value |
|---|---|
| Tunnel name | `mission-control` |
| Tunnel ID | `75730f87-8253-4e78-aad3-38258ec470d6` |
| Config file | `/home/lb12340/.cloudflared/config.yml` |
| Credentials | `/home/lb12340/.cloudflared/75730f87-8253-4e78-aad3-38258ec470d6.json` |
| DNS record | CNAME `mc.clipmeta.app` → `75730f87-8253-4e78-aad3-38258ec470d6.cfargotunnel.com` |
| cloudflared binary | `/home/lb12340/bin/cloudflared` (v2026.3.0) |

## Key files on the dashboard

| File | What it does |
|---|---|
| `server.js` | The Node HTTP server. All routes, auth, API proxies. |
| `clipmeta-hub.html` | Tabbed container for all ClipMeta sub-pages |
| `finance.html` | Finance page (P&L, MRR, OpenAI costs, promo tracking) |
| `finance-collector.js` | Collects Stripe + OpenAI + Supabase data → `data/finance-snapshots.json` |
| `analytics-collector.js` | Collects Stripe + Supabase + Cloudflare data → `data/analytics-snapshots.json` |
| `data/finance-config.json` | Infrastructure cost config (edit when bills change) |
| `.env` | All secrets (Stripe key, Supabase PAT, OpenAI admin key, etc.) — **never commit** |
| `start-mission-control.ps1` | Idempotent startup script for dashboard + tunnel |
| `install-autostart.ps1` | Registers the Windows Task Scheduler auto-start |

## Cron Runner (built 2026-04-12)

The dashboard server.js now embeds `cron-runner.js` — a Node.js scheduler that replaces all of Hermes's cron jobs. Runs inside the same tmux session as the dashboard.

### tmux management
```bash
# Attach to the running session (from WSL):
tmux attach -t mission-control

# Check if it's running:
tmux has-session -t mission-control 2>/dev/null && echo "running" || echo "dead"

# Full restart (dashboard + tunnel + crons):
tmux kill-session -t mission-control 2>/dev/null
tmux new-session -d -s mission-control -c /mnt/c/Users/levic/.openclaw/workspace/dashboard 'node server.js 2>&1 | tee server.log'
# Tunnel starts separately or add to the same session as a second window
```

### Cron endpoints + auth
Most cron jobs hit ClipMeta API endpoints with auth headers:
- `DRIP_SECRET` — used for email drip, welcome batch, rollover, referral qualifier
- `ADMIN_API_SECRET` — used for stripe-reconcile (`vyzpFC5PVM7HRI4EkZsmTOd8DgJe2cAX`, hardcoded fallback)
- Rollover + referral qualifier were patched to accept DRIP_SECRET as fallback since CRON_SECRET from Vercel didn't match

### Startup safety
On restart, only SAFE monitoring jobs fire immediately (signup monitor, feedback check, SEO check, etc.). Email-sending jobs (drip, welcome, paid drip) only fire on their scheduled time — prevents duplicate blasts when the cron system restarts.

### 14 active jobs
See [[cron_jobs]] for the full updated list. Key additions since Hermes:
- Blog Post Writer (Mon+Thu, gpt-4o-mini)
- Reddit Monitor (every 6h, 7 subreddits, public JSON API)
- Backlink Finder (daily, Brave Search API)
- SEO Rank Tracker (weekly, Brave Search)

### Cron Monitor page
`crons.html` — phone-style app grid with notification badges. Each job is a tile; tap → drawer with stats, content, "Run Now" button. Per-item viewed tracking in localStorage. Auto-refreshes every 60s.

## Dashboard pages (as of 2026-04-12)

| Page | File | What it shows |
|------|------|---------------|
| ClipMeta Hub | `clipmeta-hub.html` | Tabbed container for all sub-pages |
| Finance | `finance.html` | P&L, MRR, OpenAI costs, promo tracking |
| Crons | `crons.html` | Cron job status, badges, run-now, content drawers |

## Cross-references
- [[dell_topology]] — the Dell laptop where all this runs
- [[agents]] — Terry/Hermes (the original dashboard builders)
- [[wsl_hermes_workspace]] — WSL home where cloudflared + credentials live
- [[cron_jobs]] — the cron system (now embedded in dashboard, not Hermes)
- [[cron_migration]] — the migration plan (COMPLETE as of 2026-04-12)
