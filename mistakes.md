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

## 2026-04-11 — Inherited a wrong fact about helton_1818 and repeated it for days
**What I did wrong:** The brain's memory files described [[helton|helton_1818]] as "the heaviest free user" — top conversion target. I read this from `current_state.md` and `live_business_context.md` and repeated it across multiple sessions without verifying. When Levi asked me to dig into the user, I queried Supabase and discovered helton has been on a STUDIO TRIAL since 2026-04-04 — never on the free plan, ever. The "heavy free user" framing was completely wrong.
**What Levi said (in effect):** "I want you to dig into this customer and tell me everything you can about them" — and was surprised to learn the customer was on Studio.
**What I learned:** Inherited brain context can be stale or wrong. Treating it as ground truth is the same kind of error I made in [[mistakes|"Treated ClipMeta as a greenfield project"]] — assuming instead of verifying.
**Don't do this again:**
- Before I act on any fact about a person/customer/system that I "remember" from the brain, verify it against the actual source of truth (database, API, code) at least once when it becomes load-bearing.
- When updating customer notes, always cross-check `plan` and `stripe_subscription_status` from the live profiles table.
- Don't propagate user labels (free/paid/trial/heavy) without freshness checks.
- The brain is a memory aid, not a source of truth for live data.
