# Cron Job Migration (Post-Hermes)

> Levi wants to audit all [[operations/cron_jobs|cron jobs]] that were running through Hermes and figure out how to keep them running without Hermes — as cheaply as possible.
> Captured from [[journal/inbox|inbox]] on 2026-04-11.

## Context
- Hermes (the OpenClaw agent) ran 31 scheduled tasks — see [[operations/cron_jobs|full list]]
- With Hermes no longer available, these jobs need a new execution path
- Levi's priority: **cost minimization** — do it as cheaply as possible

## Questions to answer
- [ ] Which cron jobs still need to run?
- [ ] Which ones require an LLM / AI call vs. simple API hits?
- [ ] Can any be replaced with basic scripts (no AI needed)?
- [ ] For the ones that need AI: what's the cheapest option? (basic OpenAI API, local model, etc.)
- [ ] What external APIs do we need access to? (Stripe, Reddit, email provider, etc.)
- [ ] Can we run them on a simple scheduler (GitHub Actions, cron on the Dell, Vercel cron)?

## Potential approaches
1. **Basic OpenAI API** — Levi's suggestion; use `gpt-4o-mini` or similar cheap model for tasks that need generation
2. **No-AI scripts** — For monitoring/health checks, simple HTTP calls may suffice
3. **Local model on the Dell** — Free after setup, but requires the Dell to stay online
4. **GitHub Actions cron** — Free tier has limited minutes but could handle lightweight jobs

## Cross-references
- [[operations/cron_jobs]] — the full list of 31 jobs
- [[operations/agents]] — agent architecture
- [[operations/dell_topology]] — the Dell server that could host local execution
