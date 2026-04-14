# Inbox — per-entry capture

> Every new thought from your phone becomes **its own file** in this folder.
> Desktop processes the folder at session start and deletes the files it's done with.

## Why this folder exists

It replaces the old single-file `journal/inbox.md` protocol. That file kept
conflicting because your phone was appending new entries while the desktop was
clearing processed ones — both writing to the same lines of the same file.

With per-entry files, **phone only creates, desktop only deletes**. No two
writers ever touch the same file, so git can never produce a merge conflict on
the inbox. Stage-two of three-way merge only fires when both sides modify the
same path; here, each path has at most one writer.

## How phone writes entries

**GitHub mobile app:**
1. Open TerryBotDoOver/clipmeta-brain
2. Navigate to `journal/inbox/`
3. Tap the `+` icon → **Create new file**
4. Name it `YYYY-MM-DD-HHMM-short-slug.md` (e.g. `2026-04-14-0930-cornhole-tournament.md`)
5. Type or dictate the content
6. Commit with the default message ("Create …")

**GitHub.dev / github.com web:**
1. Go to github.com/TerryBotDoOver/clipmeta-brain/tree/main/journal/inbox
2. Click "Add file → Create new file"
3. Filename: `YYYY-MM-DD-HHMM-slug.md`
4. Dictate/type, commit

**Any filename works** — the timestamp prefix is just a convention so files
sort chronologically. If you can't easily type the timestamp, even
`random-thought.md` is fine, as long as you're not overwriting a file that
already exists.

## How desktop processes entries

At session start Claude:
1. Lists every `*.md` file in `journal/inbox/` (except `README.md`)
2. Reads each file and files the content into the right vault location
   (people, daily_logs, goals, business, etc.)
3. **Deletes the source file** from `journal/inbox/`
4. Commits the moves

Because each entry is its own file, Claude's delete never races with a phone
write — phone creates a *different* filename for each new entry and never
revisits old ones.

## What goes in an entry file

Anything. One-liners, half-thoughts, voice dictation, structured notes. The
filename is just a handle; the content is free-form. Claude will figure out
where it belongs based on the text.

## What NOT to do

- **Don't edit a file after committing it from phone.** If you want to add to
  a thought, create a *new* file. Editing a file after committing can race with
  desktop's deletion.
- **Don't put entries in `journal/inbox.md`.** That file is now a pointer to
  this folder; it's append-only and desktop never clears it.
- **Don't create files named `README.md`** — that's this file.
