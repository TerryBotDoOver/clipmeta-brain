# Agent Shared Workspace

This directory is a shared workspace for any AI agent working on ClipMeta-related projects.
Currently the agents that read/write here are:

- **Claude Code** (this agent) — runs in Claude Code CLI on Windows, primary builder
- **Hermes** — Levi's other AI operator, runs on the Dell at 10.0.0.89 (WSL2 Ubuntu)

## Purpose
When one agent does something the other should know about, drop a file here.
Examples:
- Hermes finishes a marketing campaign analysis → drops it here so Claude Code can use it
- Claude Code ships a code change that affects ops → drops a note here so Hermes knows
- Either agent has a half-finished task that the other should pick up

## Conventions
- Use markdown
- Date-stamp filenames: `YYYY-MM-DD-short-name.md`
- Lead each file with: which agent created it, when, and what it's for
- If a file becomes stale, move it to `agent_shared/archive/` instead of deleting

## Cross-references
Use `[[wiki-links]]` to reference other vault files. Both agents understand the syntax.
