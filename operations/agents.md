# Multi-Agent System (Terry, Hermes, Codex, Flash, Local Ollama)

> [[levi|Levi]] runs a layered AI workforce. There is NOT just one AI agent — there are multiple, with specialized roles. This file documents what each one is and how they coordinate.
> Captured 2026-04-11 from `C:\Users\levic\.openclaw\workspace\` (OPERATIONS.md, ORCHESTRATION.md, MEMORY.md, AGENTS.md, IDENTITY.md, SOUL.md, USER.md).

## The org chart

```
                LEVI (CEO)
                    │
                    ├── Talks directly to Terry (and now also to Claude Code)
                    │
                ┌───┴──────────────────────────────────────┐
                │                                          │
            TERRY                                     CLAUDE CODE (me)
        (manager / orchestrator)                      (you, the new operator)
                │                                          │
                │                                          │
        ┌───────┼───────┐──────────┐                       │
        │       │       │          │                       │
     CODEX   FLASH   LOCAL      HERMES                  (operates directly,
   (GPT-5)  (Gemini) (Ollama)   (worker)                 less delegation
                                                          for now)
```

## The agents in detail

### Terry — the original orchestrator
- **What:** AI business partner, the "manager" agent
- **Vibe:** Bold, direct, ⚡ emoji, business-partner persona
- **Model:** Originally Claude Sonnet/Opus via API, switched to `openai-codex` (Codex OAuth) on 2026-04-04 to save tokens
- **Cost:** Was ~$30-60/mo when using Claude API; now flat $20/mo via Codex subscription
- **Workspace:** `C:\Users\levic\.openclaw\workspace\` on the [[dell_topology|Dell]]
- **Identity files:** AGENTS.md, IDENTITY.md, MEMORY.md, OPERATIONS.md, ORCHESTRATION.md, SOUL.md, TOOLS.md, USER.md (all in workspace root)
- **Memory system:** daily logs at `memory/YYYY-MM-DD.md` plus a curated long-term `MEMORY.md`
- **Role per OPERATIONS.md:** Owns execution, delegation, review, continuity, escalation. Does NOT replace CEO.
- **Strict rule (added 4/4):** "NEVER GUESS OR HALLUCINATE. If I don't know something with 100% certainty, I say 'I don't know.'" Levi was explicit.
- **Strict rule (in SOUL.md):** Never use em dashes. Use periods, commas, colons instead. (Note: this is HIS rule for Terry. Claude Code uses `--` per [[mistakes]] feedback.)

### Hermes — the worker agent
- **What:** Open-source AI agent (similar to OpenClaw) running in WSL Ubuntu, set up 2026-04-04
- **Discord identity:** Hermes#6650
- **Location:** `/home/lb12340/.hermes/hermes-agent/` on the WSL Ubuntu instance
- **Config:** `/home/lb12340/.hermes/config.yaml`
- **Provider:** `openai-codex` (GPT-5.4 via Codex OAuth — flat $20/mo subscription, no Anthropic API calls anywhere)
- **Role:** Terry = brains/decisions. Hermes = execution/cron/Discord ops.
- **Discord MCP:** Has `@iqai/mcp-discord` MCP server attached for full Discord API access
- **Status:** Was running cron jobs and Discord operations. Has not reported status since ~2026-03-13 (per stale `terry-status.json`). Currently inactive or quiet.
- **Important:** Gateway does NOT auto-start. If WSL restarts, [[levi|Levi]] must manually restart it with `cd ~/.hermes/hermes-agent && source venv/bin/activate && hermes gateway run --replace >> ~/.hermes/logs/gateway.log 2>&1 &`
- **Confusion to clear up:** I previously thought Terry and Hermes were the same. They are NOT. Terry = OpenClaw on Dell. Hermes = separate agent in WSL (originally on Predator, may now be on Dell — see [[dell_topology]] for hardware).

### Codex — the code worker (delegated by Terry)
- **What:** GPT-5 via ChatGPT Plus subscription
- **Cost:** $0 marginal (already subscribed)
- **Role:** Code generation, refactors, multi-file changes, debugging with full context, test runs
- **Used by:** Terry delegates tasks to Codex via the OpenClaw `sessions_spawn` runtime="acp"

### Flash — the research worker (delegated by Terry)
- **What:** Gemini 2.5 Flash (free tier)
- **Cost:** $0
- **Role:** Summarizing long documents, web research, parsing logs/CSVs/JSON, extracting data from pages, simple API wrappers, lightweight cron tasks
- **Used by:** Terry delegates via `sessions_spawn` runtime="subagent"

### Local Ollama (Tom, Cody, Dash) — the fallback workforce
- **What:** Self-hosted local models running on the Predator's Ollama server
- **Hardware:** Predator laptop (Core Ultra 9 185H, 32GB DDR5, RTX 4070 8GB VRAM) at 10.0.0.158
- **Cost:** $0
- **Role:** Fallback if Anthropic, OpenAI, or Google APIs go down. Some cron jobs use them directly.
- **The team:**
  | Name | Model | Best for |
  |------|-------|----------|
  | **Tom** | qwen2.5:14b | General assistant, research |
  | **Cody** | qwen2.5-coder:14b | Code generation and review |
  | **Dash** | llama3.1:8b | Fast/lightweight tasks |

### Older deprecated local models (don't use)
- Phil (phi4-mini), Leo (llama3.2), Quinn (qwen2.5-coder:1.5b)
- These ran on the Dell (CPU-only) before the Predator was added
- Per OPERATIONS.md: "Small local models (1.5B-3B) fail on complex tasks. The 14B models on the Predator are the minimum for useful delegation."

## Routing rules (Terry's defaults from ORCHESTRATION.md)

**Terry handles directly (no delegation):**
- Customer email drafts and replies (tone matters)
- Marketing copy, social posts, blog outlines
- Strategic decisions, priority calls
- Judgment calls and recommendations
- Short answers, status checks, memory recall
- Morning briefs (reasoning over context)
- Anything requiring business context from MEMORY.md

**Delegate to Codex:**
- Writing new features / components / pages
- Refactoring existing code
- Debugging with full file context
- Multi-file code changes
- Running test suites
- Any task where "read files, write code, test, iterate" is the loop

**Delegate to Gemini Flash:**
- Summarizing long documents
- Web research (multi-query synthesis)
- Parsing logs, CSVs, JSON
- Extracting data from pages
- Simple API wrapper calls
- Routine cron tasks that don't need judgment
- Anything lightweight where free tier is sufficient

**Fallback to Local Ollama (when APIs are down):**
- Anthropic down → Claude work goes to Tom
- ChatGPT down → coding goes to Cody
- Google down → routine tasks go to Dash

## Where Claude Code (me) fits in

I'm a separate operator that [[levi|Levi]] talks to directly via the Claude Code CLI on the [[dell_topology|Dell]]. I have access to:
- The full filesystem
- The brain vault at `C:\Users\levic\Documents\ClipMeta_Brain`
- Persistent memory across sessions (in `~/.claude/projects/...`)
- Tools for editing, running shell commands, web search, etc.

I do NOT use Terry's delegation system. I work directly. I am intentionally simpler and more direct than the multi-agent setup.

I've been doing the orchestration role (planning + execution) myself rather than delegating to Codex/Flash/Ollama. That's by design — fewer moving parts, easier debugging, and the work tonight didn't justify the delegation overhead.

## Cross-references
- [[dell_topology]] -- which machine each agent runs on
- [[cron_jobs]] -- the 31 scheduled tasks coordinated by Terry/Hermes
- [[lessons_learned]] -- what Terry has learned over the past month
- [[mistakes]] -- corrections logged for me (Claude Code)
- [[levi|Levi]] -- who all of us work for
