---
name: Meta Pixel implementation spec for ClipMeta
description: Step-by-step plan to install the Meta/Facebook Pixel on clipmeta.app (Next.js App Router) for retargeting + conversion tracking. Not yet implemented.
type: project
---

# Meta Pixel — ClipMeta install spec

> Captured 2026-04-11 from `/home/lb12340/meta-pixel-nextjs-implementation.md` (Hermes-authored).
> **Status: not yet installed.** This is a ready-to-go implementation plan, not a record of completed work.
> Part of [[clipmeta]] / [[business]] graph.

## Why install it now (even if you won't run ads for weeks)
Pixel data starts collecting the moment it's live. Meta requires a **minimum of 100 people** in a custom audience before it will deliver ads to it (1,000+ recommended for meaningful delivery). At [[clipmeta|ClipMeta]]'s current traffic (~0 visitors/day per the 2026-04-05 Bing report), it'll take **weeks** to build a usable audience. The pixel needs to be live first or those weeks are lost.

## Step 1: Create the Pixel
1. Go to https://business.facebook.com/events_manager
2. "Connect Data Sources" → Web → Meta Pixel → Connect
3. Name it "ClipMeta Pixel"
4. Choose "Install code manually" (skip partner integrations)
5. Copy the 15-digit Pixel ID
6. Add to `.env.local` and Vercel env vars: `NEXT_PUBLIC_META_PIXEL_ID=...`

## Step 2: Files to create / modify

### CREATE: `/src/components/MetaPixel.tsx`
Standard fbq init script, wrapped in `next/script` with `strategy="afterInteractive"`. Includes:
- `MetaPixelPageView` inner component using `usePathname()` + `useSearchParams()` to fire `PageView` on every route change
- Wrapped in `<Suspense fallback={null}>` because `useSearchParams()` requires it in App Router
- Helper exports: `fbEvent(name, params)` for standard events, `fbCustomEvent(name, params)` for custom
- `<noscript>` fallback `<img>` for users without JS
- Returns `null` if `NEXT_PUBLIC_META_PIXEL_ID` is unset (safe to merge before adding env var)

### MODIFY: `/src/app/layout.tsx`
Add `<MetaPixel />` inside `<body>` of root layout.

### MODIFY: `/src/components/ConversionTracker.tsx`
Already fires Google Ads conversion on `?upgraded=true`. Add Meta Pixel calls alongside:
```tsx
fbEvent('Purchase',  { value: 9.00, currency: 'USD', content_name: 'ClipMeta Pro', content_type: 'product' });
fbEvent('Subscribe', { value: 9.00, currency: 'USD' });
```
**Note:** $9.00 is a placeholder — needs to match the actual plan being purchased. Starter is $9, Pro is higher, Studio is highest. The real cleanup is to read the plan from URL params or session and pass the correct value.

## Step 3: Events to fire from existing components
| Event | Where to fire | Code |
|---|---|---|
| `PageView` | Every route change | Auto (in MetaPixel component) |
| `CompleteRegistration` | After successful Supabase signup | `fbEvent('CompleteRegistration', { content_name: 'ClipMeta Signup' })` |
| `StartTrial` | When user starts the free trial | `fbEvent('StartTrial')` |
| `Subscribe` | After Stripe checkout (in ConversionTracker) | `fbEvent('Subscribe', { value, currency: 'USD' })` |
| `Purchase` | After Stripe checkout (in ConversionTracker) | `fbEvent('Purchase', { value, currency: 'USD' })` |
| `ViewContent` (optional) | Pricing page load | `fbEvent('ViewContent', { content_name: 'Pricing Page' })` |
| `InitiateCheckout` (optional) | Upgrade button click | `fbEvent('InitiateCheckout', { value, currency: 'USD' })` |
| `GenerateMetadata` (custom) | After successful metadata generation | `fbCustomEvent('GenerateMetadata', { video_count: N })` |

## Step 4: Verify
1. Install **Meta Pixel Helper** Chrome extension
2. Visit clipmeta.app → should show PageView firing
3. Walk the signup flow → should show CompleteRegistration
4. Events Manager → green dot = receiving data; "Test Events" tab for live verification

## Retargeting audiences to create (later, once 100+ users)
- "All Visitors - 30 days"
- "Visited Pricing - No Purchase" (`ViewContent` on pricing, exclude `Purchase`)
- "Signed Up - No Upgrade" (`CompleteRegistration`, exclude `Purchase`)
- Lookalike from converters (need 100+ source minimum, 1,000+ recommended)

## Cross-references
- [[clipmeta|ClipMeta]] — the product this is going on
- [[business|Business hub]]
- [[wsl_hermes_workspace]] — where the source spec lives
