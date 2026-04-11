# WSL Hermes Workspace (`/home/lb12340/`)

> The WSL Ubuntu home directory under user `lb12340`. Hermes lives here. So does most of the [[still_frequency|Still Frequency]] code, the [[site_rules|SiteRules]] project, and a bunch of one-off scripts.
> Captured 2026-04-11 by inspecting the WSL filesystem.
> This is essentially a hidden second workspace I had no idea existed before tonight.

## Why this matters
For my first day working with [[levi|Levi]] I treated `C:\Users\levic\.openclaw\workspace\` (Terry's workspace on Windows) as the only thing on the laptop. There's a SECOND workspace inside WSL Ubuntu that contains a lot of active project work. Both workspaces matter.

## How to access from the Dell
```bash
wsl.exe -- bash -lc "ls /home/lb12340/"
```
Or to drop into a WSL shell directly:
```bash
wsl.exe
```

From there, the WSL user is `lb12340` (different from the Windows user `levic`).

## What's in there

### Hermes itself
- `.hermes/hermes-agent/` — the Hermes agent code (Python venv-based)
- `.hermes/config.yaml` — main config (Discord, MCP servers, model = `openai-codex`, platform_toolsets)
- `.hermes/sessions/` — JSONL conversation logs from Hermes Discord interactions (one file per session). Lots of these from Apr 2 onward.
- `.hermes/logs/gateway.log` — Hermes gateway activity log
- `.codex/` — Codex CLI (likely the OAuth setup for Codex provider)
- `.claude/` — Claude Code config (Hermes also has Claude Code installed)

### SiteRules (the SaaS being built)
- `SiteRules/PLAN.md` — 316 lines, business plan
- `SiteRules/ARCHITECTURE_PLAN.md` — 810 lines, technical architecture
- `SiteRules/app/` — Next.js code (server.js was running at PID 14940 on 2026-04-10)
- `SiteRules/data/` — extracted Charlotte County rules data
- `SiteRules/cut_pg_from_county.py` — Python script for Punta Gorda extraction
- See [[site_rules|SiteRules]] for the full project writeup.

### Still Frequency pipeline (the YouTube channel automation)
A LOT of Python scripts directly in the home folder root:
- `STILL_FREQUENCY_README.md` — 3.9KB readme
- `complete_still_frequency_pipeline.py` (7.4KB) — earlier pipeline
- `complete_still_frequency_pipeline_enhanced.py` (16.3KB) — newer pipeline
- `still_frequency_assembly.py`, `still_frequency_assembly_enhanced.py` — video assembly
- `still_frequency_demo.py`, `still_frequency_fixed.py`, `still_frequency_production.py` — pipeline variants
- `still_frequency_metadata.py` — YouTube metadata builder
- `still_frequency_thumbnail.py`, `still_frequency_thumbnail_ab.py`, `still_frequency_thumbnail_v2.py` — thumbnail generators
- `still_frequency_youtube_auth.py`, `still_frequency_youtube_auth_manual.py` — YouTube OAuth
- `still_frequency_youtube_upload.py`, `youtube_uploader.py` — upload logic
- `create_sf_banner.py`, `create_sf_watermark.py`, `prepare_sf_profile_pic.py` — channel branding assets
- `create_project_thumbnail.py`, `overlay_sleepy_thumbnail_text.py`, `overlay_sleepy_thumbnail_text_clean.py` — thumbnail overlays
- `thumbnail_generator_fal.py` — alternate thumbnail generator using fal.ai
- `pipeline_status_report.py` — pipeline monitoring
- `build_project_video.py` — video builder
- `rerender_hawaii_528.py` — re-render the first failed Hawaii 528Hz video
- `render_528hz_hawaii_remote.ps1` — PowerShell script for remote rendering
- `run_still_frequency_upload_528hz_hawaii.sh` — shell wrapper for upload
- `copy_to_predator.py` — file transfer to Predator for rendering
- `predator_check.ps1` — Predator health check
- `test_footage_access.py`, `test_youtube_setup.py`, `test_scp.txt` — test scripts
- `sf_venv/` — Python virtual environment for the project
- `still_frequency_output/`, `still_frequency_temp/` — output and temp folders
- `suno_528hz.mp3` — sample Suno audio
- `temp_vision_images/` — temp image folder

**Key takeaway:** Still Frequency has WAY more code than I represented in [[still_frequency|its file]] earlier. The project is much further along than I thought. There are at least 4 versions of the pipeline (`complete_*`, `*_assembly_enhanced`, `*_production`, `*_fixed`) which suggests iterative development.

### reel-engine (separate project)
- `reel-engine/` — separate folder. Might be related to [[video_engine|the openclaw video engine]] but ported to WSL/Python? Need to check.

### Other files
- `meta-pixel-nextjs-implementation.md` (9KB) — Meta Pixel implementation notes for Next.js (probably for ClipMeta tracking)
- `Downloads/` — temp download folder
- `.git-credentials` — Git credentials cache
- `.openclaw/` — OpenClaw config (Hermes also has OpenClaw)
- `.npm/` — npm cache

### Hidden config files
- `.bashrc`, `.bash_history`, `.bash_logout`, `.profile`, `.zshrc` — shell config
- `.gitconfig`, `.git-credentials` — Git
- `.ssh/` — SSH keys
- `.cache/`, `.config/`, `.local/` — XDG config locations
- `.claude.json` (22KB) — Claude Code state file

## Important files I haven't fully read yet
- `SiteRules/ARCHITECTURE_PLAN.md` (810 lines) — the technical spec for SiteRules
- `STILL_FREQUENCY_README.md` (3.9KB) — Still Frequency's actual readme
- `meta-pixel-nextjs-implementation.md` (9KB) — Meta Pixel notes
- The dozen+ Hermes session JSONL files from Apr 2 - Apr 10
- The Still Frequency pipeline files (a lot of them, varying in importance)

## Hermes Discord session log
`/home/lb12340/.hermes/sessions/` contains JSONL files like `20260408_211113_fa51fe65.jsonl`. Each is a Hermes-Discord conversation session. These are essentially Levi's chat history with Hermes.

**Privacy note:** These contain Levi's actual messages to Hermes. I should treat them as private and only read them when answering specific questions Levi asks. Don't dump them into the brain for general indexing — that crosses the line from "useful context" into "logging Levi's private conversations."

## Cron-friendly entry points
A few of these files appear to be designed for cron-driven execution:
- `run_still_frequency_upload_528hz_hawaii.sh` — bash wrapper
- `render_528hz_hawaii_remote.ps1` — PowerShell wrapper for cross-machine render
- `predator_check.ps1` — health check probe

These suggest Hermes was orchestrating cross-machine workflows (Dell does the orchestration, Predator does the GPU rendering).

## Cross-references
- [[agents|Hermes]] — the agent that lives here
- [[dell_topology]] — physical hardware
- [[site_rules|SiteRules]] — the SaaS being built here
- [[still_frequency|Still Frequency]] — the YouTube channel pipeline that lives here
- [[beekeeper_hive_manager|Beekeeper Hive Manager]] — discussed in Hermes Discord sessions, no code on disk yet
