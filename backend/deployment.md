# Deployment Guide for ClipMeta

## ClipMeta Repo Location
- **Local path:** `C:\Users\levic\Documents\clipmeta`
- **GitHub:** `https://github.com/TerryBotDoOver/clipmeta`
- **Production:** `https://clipmeta.app`

## Credentials

### Vercel
- **Token:** Stored in `.credentials` file (local only, gitignored)
- **Project ID:** `prj_zeXXzF9MPOmGukRArZY2DdI6LQNA`
- **Org:** TerryBotDoOver

### GitHub
- **Username:** TerryBotDoOver
- **Email:** leviclaude1998@gmail.com
- **Token:** Stored in Windows Credential Manager (`git:https://github.com`)

### Supabase
- **PAT:** Stored in `.credentials` file (local only, gitignored)
- **Project Ref:** `iprnnrdjnoemhmcypseh`
- **DB URL:** `https://iprnnrdjnoemhmcypseh.supabase.co`

## Standard Deployment Workflow

### 1. Make changes in local repo
```bash
cd C:\Users\levic\Documents\clipmeta
# Edit files as needed
```

### 2. Create branch and commit
```bash
git checkout -b feature/your-feature-name
git add .
git commit -m "Description of changes"
```

### 3. Push to GitHub
```bash
git push origin feature/your-feature-name
```

### 4. Deploy to Vercel (preview)
```bash
source ~/Documents/ClipMeta_Brain/.credentials
vercel --token $VERCEL_TOKEN
```
This creates a preview deployment. Vercel will output a URL.

### 5. Verify preview deploy
- Visit the preview URL
- Test the changes
- Check for errors in Vercel logs

### 6. If good, deploy to production
```bash
source ~/Documents/ClipMeta_Brain/.credentials
vercel --prod --token $VERCEL_TOKEN
```

### 7. Merge to main
```bash
git checkout main
git merge feature/your-feature-name
git push origin main
```

### 8. Update Brain memory
After successful deployment, update:
- `memory/current_state.md` (what changed)
- `memory/decisions_log.md` (why you did it)
- `memory/next_actions.md` (what's next)

## Quick Deploy (if already tested)
```bash
source ~/Documents/ClipMeta_Brain/.credentials
cd C:\Users\levic\Documents\clipmeta
git add .
git commit -m "Your change description"
git push origin main
vercel --prod --token $VERCEL_TOKEN
```

## Environment Variables
DO NOT modify production env vars without explicit approval.
They live in Vercel dashboard under Settings > Environment Variables.

Local dev uses `.env.local` (never commit this file).

## Safety Rules
- NEVER force push to main
- NEVER expose tokens in code or commits
- ALWAYS test in preview before production
- NEVER run destructive DB operations without approval
- ALWAYS update Brain memory after significant changes

## Vercel CLI Installation (if needed)
```bash
npm install -g vercel
```

## Git Config (if needed)
```bash
git config --global user.name "TerryBotDoOver"
git config --global user.email "leviclaude1998@gmail.com"
```
