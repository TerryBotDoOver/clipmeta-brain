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
