# How-To Instructions

Quick-reference recipes for things Levi forgets and re-asks. Each entry is a condensed "just tell me what to type" version. When the underlying setup changes, update the entry here.

Related: [[dell_topology]], [[wsl_hermes_workspace]], [[mission_control_commands]], [[cron_jobs]]

---

## SSH from Predator to Dell

From Predator PowerShell:

```powershell
ssh -p 2222 levic@clipmeta-dell
```

Fallback by Tailscale IP if the hostname doesn't resolve:

```powershell
ssh -p 2222 levic@100.78.190.53
```

- Port is **2222**, not 22. Port 22 is a netsh portproxy forwarding to WSL Ubuntu for Hermes. Do not touch.
- Key-based auth, no password.
- Once connected, run `claude` to resume a Claude Code session.

See [[dell_topology]] for the full networking picture.

---

## Running Hermes after SSH

You land in Windows `cmd.exe` at `c:/users/levic>`. Hermes lives in **WSL Ubuntu**, not Windows, so typing `hermes` alone fails with "not recognized as an internal or external command".

Drop into WSL first:

```cmd
wsl
```

Then:

```bash
hermes
```

Or as a one-liner from Windows:

```cmd
wsl -d Ubuntu -- hermes
```

**Note (2026-04-11):** Hermes was retired as the Still Frequency runner after it ran out of tokens mid-render. The deterministic replacement lives at `C:\StillFrequency\` and runs from Windows Task Scheduler. Use that for SF renders. Use Hermes only for things it still owns (PermitPilot work, any cron not yet migrated to [[cron_jobs|the Mission Control cron runner]]).

See [[wsl_hermes_workspace]] for the Hermes workspace layout.

---
