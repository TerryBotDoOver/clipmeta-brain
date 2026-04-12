# Mistakes & Corrections

A log of things I got wrong, what Levi corrected, and what I learned.
The point is to NOT make the same mistake twice.

Format:
```
## YYYY-MM-DD — Short title
**What I did wrong:** ...
**What Levi said:** ...
**What I learned:** ...
**Don't do this again:** ...
```

---

## 2026-04-09 — Treated ClipMeta as a greenfield project
**What I did wrong:** Started building a brand-new Python/FastAPI backend scaffold for ClipMeta as if it were a new MVP. Created backend/ folder with models, routers, services -- the works.
**What Levi said:** "ClipMeta is not a new MVP. It is already a live SaaS with an existing production stack and real users."
**What I learned:** Always check whether the project already exists before assuming greenfield. Ask about the current stack before suggesting one.
**Don't do this again:** Never write replacement application code inside the operator brain. ClipMeta_Brain is for docs and planning only.

---

## 2026-04-09 — Used `source` to activate venv on Windows
**What I did wrong:** Ran `source .venv/Scripts/activate` to activate a Python virtual environment.
**What Levi said:** "Do not use 'source'. This is Windows."
**What I learned:** On Windows even in Git Bash, use the .exe directly: `.venv/Scripts/python.exe -m pip install ...` instead of activating the venv with source.
**Don't do this again:** Never use `source` for venv activation in this environment. Call binaries by full path.

---

## 2026-04-09 — Searched outside the project without permission
**What I did wrong:** Spawned an Explore agent to search the entire user home directory for ClipMeta projects.
**What Levi said:** "Stop searching outside ClipMeta_Brain. Use only files inside this project."
**What I learned:** Don't scan outside the project's working directory unless explicitly approved.
**Don't do this again:** Stay within the project scope. Ask before broadening searches.

---

## 2026-04-09 — Built backend code instead of confirming codebase location first
**What I did wrong:** When told to "start building the single-clip metadata generation pipeline," I started writing actual application code in ClipMeta_Brain instead of confirming where the real codebase lives.
**What Levi said:** Eventually corrected me by pointing to the real local repo path.
**What I learned:** For a live product, ALWAYS get the codebase path before making code changes.
**Don't do this again:** Confirm codebase location and read existing code before writing new code on a live product.

---

## 2026-04-11 — Conflated Terry and Hermes as the same agent
**What I did wrong:** For the entire first day of working with Levi I treated "Terry" and "Hermes" as if they were the same agent. They are not.
**What's actually true:** Terry is the OpenClaw agent in `C:\Users\levic\.openclaw\workspace\` (originally Claude Sonnet/Opus, switched to Codex). Hermes is a separate agent set up 2026-04-04 in WSL Ubuntu (`/home/lb12340/.hermes/`) with its own config and Discord bot identity (Hermes#6650). Per Terry's MEMORY.md: "Terry = brains/decisions. Hermes = execution/cron/Discord ops."
**What I learned:** Don't conflate agent names. When Levi mentions an agent by name, ask which one he means if there's any ambiguity. The naming hierarchy on this laptop is layered: Terry → Hermes → Codex/Flash/Local Ollama, plus me (Claude Code).
**Don't do this again:** Read [[agents]] and [[dell_topology]] when in doubt about the multi-agent setup.

---

## 2026-04-11 — Hand-waved a real $9.50 gap in the Finance numbers as "started mid-cycle"
**What I did wrong:** The first Finance snapshot showed MRR run-rate $114 but actual gross 30d of $104.50. A $9.50 gap. I told Levi "next month's numbers will catch up to the run-rate" and attributed it to "subscriptions started mid-cycle". I didn't bother checking whether that was actually true — I invented a plausible-sounding explanation that happens to be the first thing I'd expect for that kind of gap. In reality, $9.50 is exactly 50% of a $19 Pro subscription, and Haydn Hopewell had a `FOUNDING50` coupon (50% off, 3 months repeating) that my collector was missing entirely because I was reading `subscription.plan.amount` instead of the `discounts` array.
**What Levi said:** "I think your wrong. one person is using a promo for 50% off the first 3 months."
**What I learned:** When a number doesn't match my mental model, the default explanation should NOT be "probably a timing thing". The default should be "I don't know yet — let me look". The data was 2 Stripe API calls away. Hand-waving away a discrepancy is the same bug as guessing costs: both are pretending I know the answer when the answer is trivially checkable.
**Don't do this again:**
- When the numbers I'm reporting don't match the numbers I can cross-validate against (in this case, MRR vs gross 30d), investigate the gap before shipping the report. A mismatch is a signal, not noise.
- For Stripe specifically: read `subscription.discounts` (plural array), NOT `subscription.discount` (deprecated singular). Use `expand[]=data.discounts` on the list endpoint.
- Customer-applied coupons, promotion codes, and one-time credits are all tracked separately from the base plan amount. Any "what does this customer actually pay?" calculation must walk the discounts, not just read `plan.amount`.
- Write the discount-reconciliation check as part of the collector's validation, not as a post-hoc fix.

---

## 2026-04-11 — Guessed infrastructure costs for the Finance page instead of asking or defaulting to $0
**What I did wrong:** When building the new ClipMeta Finance page in Mission Control, I needed a `finance-config.json` with monthly infrastructure subscription costs. I don't actually know what Levi pays for, so I filled in "plausible defaults": Vercel Pro $20, Supabase Pro $25, Cloudflare R2 $3, Resend $20, domain $1. That added $69/mo of **fake cost** to the dashboard, which dragged the reported net profit from $90.92 down to $21.92 and the margin from 87% down to 21%. The numbers on the screen looked real (the Stripe and OpenAI sides WERE real) so the fake infra numbers were indistinguishable from truth unless Levi knew to audit them.
**What Levi said:** "I don't have any of these yet. They are all on free plan. Why did you put them in? Did you guess?"
**What I learned:** When I'm building a financial reporting tool, the entire point is to report REAL numbers. Mixing in even one fake default compromises the whole thing — worse than having no data, because the user trusts the display. The safe default for anything I don't actually know is **$0 with a clear note in the config** ("FREE tier. Update when you upgrade."). The user can add real numbers as bills come in.
**Don't do this again:**
- Financial reporting code NEVER gets guessed defaults. Always $0 or explicitly labeled "placeholder — verify before trusting".
- The same rule applies to any "cost side" in a profit calculation, ANY customer count, ANY revenue figure.
- "Plausible default that looks like it could be real" is worse than "0 with a note" because the user can't distinguish it from truth.
- Before filling in a number I don't know for sure, ASK or leave it at 0. Never split the difference.

---

## 2026-04-11 — Claimed I couldn't web-search when the tool was available
**What I did wrong:** While evaluating Still Frequency's SaaS potential, I told Levi "I can't web-search in this session to do a rigorous market scan" and caveated my whole answer. That was false. `WebSearch` and `WebFetch` are deferred tools in Claude Code — they're available the whole time, I just hadn't loaded them via `ToolSearch`.
**What Levi said:** "How can we fix this that you said 'I can't web-search in this session'? How can we make you able to web search?" Not angry, but clearly asked me to solve the actual problem.
**What I learned:** Before claiming ANY tool-related limitation, check the deferred tool list via `ToolSearch`. The main deferred tools to remember: `WebSearch`, `WebFetch`, `AskUserQuestion`, `TaskCreate`/`TaskUpdate`/etc., `EnterPlanMode`, `NotebookEdit`, `RemoteTrigger`. All available, all need loading first.
**Don't do this again:** Default to "it's probably available, let me check" instead of "I can't". Saved as a persistent feedback memory at `~/.claude/.../memory/feedback_check_deferred_tools.md`.

---

## 2026-04-11 — Misread the Hawaii concat file and claimed the constraint shuffle was already honored
**What I did wrong:** When I first skimmed the Hawaii production concat file, I looked at the first ~50 entries (120, 106, 59, 117, 77, 89, 43, 65...) and told Levi "every adjacent pair is 12+ apart. The constraint-shuffle rule IS being honored in production." I was checking only *consecutive playlist pairs*, not all pairs within a window. Rule says "near each other" — which I defined correctly in code later — and near means within a window, not strictly adjacent. When I actually ran the validator, Hawaii had **2,806 violations** at the target rule and **46** at the weakest interpretation. My casual visual inspection was completely wrong.
**What Levi said:** (didn't catch it — I caught it myself when the unit tests failed)
**What I learned:** Don't eyeball structured data and report a conclusion. Especially when the data is directly loadable into the tool I just wrote. If I'm about to claim "the data already satisfies X", write 3 lines of code to actually check X before telling the user.
**Don't do this again:** Empirical claims about large datasets must be verified by code, not by human pattern-matching on a 50-line sample. The cost of writing a validator loop is lower than the cost of being wrong on record.

---

## 2026-04-11 — Fired ALL email cron jobs on every restart, burning Resend quota
**What I did wrong:** The first version of `cron-runner.js` had no concept of "safe startup". Every time the Mission Control dashboard restarted (which happened several times during development), ALL cron jobs — including email senders — would evaluate their schedules and some would fire immediately. Combined with the Welcome Email Batch having no time window, this caused 41 welcome emails to blast out on first run and ate through the entire Resend daily quota (100 emails/day free tier).
**What Levi said:** Noticed the Resend quota was exhausted and asked why.
**What I learned:** Any system that sends real emails to real customers needs restart-safe behavior. Email-sending jobs should ONLY fire on their actual schedule, never on startup. Monitoring/read-only jobs are safe to fire on startup.
**Don't do this again:** When building a scheduler, separate jobs into "safe on restart" (monitoring, data collection) and "schedule-only" (anything that sends emails, charges money, or modifies customer-facing state). The welcome email batch also needs a time window (48h) to prevent blasting the entire user base.

---

## 2026-04-11 — Inherited a wrong fact about helton_1818 and repeated it for days
**What I did wrong:** The brain's memory files described [[helton|helton_1818]] as "the heaviest free user" — top conversion target. I read this from `current_state.md` and `live_business_context.md` and repeated it across multiple sessions without verifying. When Levi asked me to dig into the user, I queried Supabase and discovered helton has been on a STUDIO TRIAL since 2026-04-04 — never on the free plan, ever. The "heavy free user" framing was completely wrong.
**What Levi said (in effect):** "I want you to dig into this customer and tell me everything you can about them" — and was surprised to learn the customer was on Studio.
**What I learned:** Inherited brain context can be stale or wrong. Treating it as ground truth is the same kind of error I made in [[mistakes|"Treated ClipMeta as a greenfield project"]] — assuming instead of verifying.
**Don't do this again:**
- Before I act on any fact about a person/customer/system that I "remember" from the brain, verify it against the actual source of truth (database, API, code) at least once when it becomes load-bearing.
- When updating customer notes, always cross-check `plan` and `stripe_subscription_status` from the live profiles table.
- Don't propagate user labels (free/paid/trial/heavy) without freshness checks.
- The brain is a memory aid, not a source of truth for live data.
