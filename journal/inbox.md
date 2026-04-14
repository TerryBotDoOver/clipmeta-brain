# Inbox — protocol changed 2026-04-14

> **This file is a pointer, not a capture target anymore.**
> New entries go in `journal/inbox/` as individual files. See [[README]] there.

## Why

Editing this single file from both the phone and the desktop kept producing
git merge conflicts on the entries section. Phone was appending while desktop
was clearing — same lines, same file, every session. The per-entry folder
protocol structurally eliminates the race: phone only creates new files,
desktop only deletes processed ones, so they never touch the same path.

## New workflow

**Phone capture:** Create a new file in `journal/inbox/` via the GitHub
mobile app or github.com. Name it something like
`2026-04-14-0930-short-slug.md`. Commit. Done — no more overwriting
`inbox.md`.

**Desktop processing:** At session start, Claude reads every `*.md` file in
`journal/inbox/` (except `README.md`), files the content into the right
vault locations, then **deletes** the source files from `journal/inbox/`.

Full details: see [[README]] in `journal/inbox/`.

## What happens to this file

This file is **append-only** going forward. No session or script clears or
rewrites it. It stays here as a pointer and for history.
