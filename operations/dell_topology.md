# Hardware Topology

> Two laptops, multiple roles, sometimes-confusing networking. This file is the source of truth.
> Last updated 2026-04-11 from MEMORY.md + verified against running processes.
>
> For the "just tell me what to type" version of connecting, see [[howto]].

## The two machines

### Dell (the older one)
- **Model:** Dell Inspiron 15-5567
- **CPU:** Intel i7-7500U
- **RAM:** 16GB
- **GPU:** AMD integrated (CPU-only inference, not suitable for GPU AI)
- **OS:** Windows 10 Home (build 19045)
- **Hostname:** `DESKTOP-048QIBR`
- **LAN IP:** `10.0.0.89`
- **Tailscale hostname:** `clipmeta-dell`
- **Tailscale IP:** `100.78.190.53`
- **Username:** `levic`

**What runs here:**
- The OpenClaw/Terry workspace at `C:\Users\levic\.openclaw\workspace\`
- The Mission Control dashboard at `localhost:3131` (inside WSL Ubuntu)
- The ClipMeta_Brain vault at `C:\Users\levic\Documents\ClipMeta_Brain` (synced via Obsidian Git)
- Claude Code (me) — accessed via direct CLI on Dell or via SSH from Predator
- WSL2 Ubuntu instance (`lb12340` user inside WSL)
- Some Hermes processes (need to verify which side runs Hermes — see "topology confusion" below)
- Per OPERATIONS.md: was the "backup Dell" with Phil/Leo/Quinn local models (now deprecated)

### Predator (the newer one)
- **Model:** Acer Predator (Levi's primary workstation)
- **CPU:** Intel Core Ultra 9 185H
- **RAM:** 32GB DDR5
- **GPU:** NVIDIA RTX 4070 8GB VRAM (CUDA-capable, used for AI inference + video rendering)
- **OS:** Windows
- **Username:** `levib` (note: NOT `levic` like the Dell)
- **Hostname:** `EF_Productions`
- **LAN IP:** `10.0.0.158` (was `10.0.0.157` historically — IP changed at some point)

**What runs here:**
- Levi's primary creative work (Premiere Pro, After Effects, drone footage editing)
- Ollama server with Tom/Cody/Dash models (the local AI workforce)
- NVENC video rendering for [[still_frequency|Still Frequency]] (RTX 4070)
- Network share `\\10.0.0.157\StillFrequency` (paths still reference old IP — may need updating)
- Per MEMORY.md (4/4-4/5 entries): Hermes was originally set up here in WSL Ubuntu

## Topology confusion to resolve

There is some inconsistency between MEMORY.md and what I observed at runtime:

- **MEMORY.md says** Hermes runs on the Predator in WSL
- **Runtime observation 2026-04-10** (when I checked WSL processes on the Dell): I saw a `node server.js` process running from `/home/lb12340/SiteRules/app` and the Hermes fence command, suggesting Hermes might also be on the Dell
- **Possible reasons:**
  1. Hermes was MOVED from Predator to Dell at some point (not yet documented in MEMORY.md)
  2. Both machines have the same WSL user (`lb12340`) and run similar things
  3. Hermes is on the Predator but I was confused by other WSL processes on the Dell
- **Action item:** [[levi|Levi]] should confirm which machine Hermes actually runs on now. I'll ask next time it's relevant.

## Network setup

### Tailscale (set up 2026-04-10)
- Both machines on the same tailnet under account `leviclaude1998@`
- Dell hostname on tailnet: `clipmeta-dell` (`100.78.190.53`)
- Predator should also be on the tailnet (verify next session)
- Allows secure cross-machine SSH from anywhere

### SSH (set up 2026-04-10)
- Windows OpenSSH on Dell port **2222** (port 22 is occupied by a netsh portproxy forwarding to WSL)
- Connect from Predator: `ssh -p 2222 levic@clipmeta-dell` or `ssh -p 2222 levic@100.78.190.53`
- Auth: ed25519 key from Predator (`levib@EF_Productions`) installed in `C:\ProgramData\ssh\administrators_authorized_keys` on the Dell
- File owner is `BUILTIN\Administrators` (required for Windows OpenSSH admin user keys)
- See [[reference_remote_access]] in persistent memory for details

### Port allocations on the Dell
| Port | What | Notes |
|------|------|-------|
| 22 | netsh portproxy → WSL Ubuntu (172.18.221.173:22) | Hermes/SSH-to-WSL |
| 2222 | Windows OpenSSH (host) | Main SSH for Claude Code access |
| 3131 | Mission Control dashboard | Inside WSL, port-proxied from 0.0.0.0:3131 |
| 3456 | Something in WSL | Also port-proxied (purpose unknown) |

## File location reference

| What | Where |
|------|-------|
| ClipMeta application code | `C:\Users\levic\.openclaw\workspace\clipmeta\clipmeta` (Dell) |
| ClipMeta Brain vault (this file lives here) | `C:\Users\levic\Documents\ClipMeta_Brain` (Dell) |
| OpenClaw Terry workspace | `C:\Users\levic\.openclaw\workspace\` (Dell) |
| Mission Control dashboard | `C:\Users\levic\.openclaw\workspace\dashboard\` (Dell, runs in WSL) |
| Hermes config | `/home/lb12340/.hermes/config.yaml` (WSL Ubuntu) |
| Hermes code | `/home/lb12340/.hermes/hermes-agent/` (WSL Ubuntu) |
| Hermes logs | `/home/lb12340/.hermes/logs/gateway.log` (WSL Ubuntu) |
| Still Frequency renders | `\\10.0.0.157\StillFrequency` and `C:\Users\levib\Desktop\still_frequency_render\` (Predator) |
| Still Frequency source clips | `\\10.0.0.157\StillFrequency` (Dell — note paths reference old Predator IP) |
| Brain repo on GitHub | `github.com/TerryBotDoOver/clipmeta-brain` (private) |
| ClipMeta repo on GitHub | `github.com/TerryBotDoOver/clipmeta` |

## Cross-references
- [[agents]] -- which agent runs on which machine
- [[reference_remote_access]] -- in persistent memory, for SSH details
- [[still_frequency]] -- the project that uses both Dell (source) and Predator (render)
