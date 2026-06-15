# ACM Education Hub — Build Instructions

You are building a **pitch-ready static mockup** of an "Education" hub landing
page for Atlantic Coast Mortgage (atlanticcoastmortgage.com).

**Rules that apply to every phase:**
- Single self-contained `index.html` file. No build step, no npm, no React.
- All assets inline. Google Fonts via `<link>` in `<head>` only.
- No working interactivity. All buttons/links use `href="#"`.
- No broken `<img>` tags. Image areas are styled `<div>` blocks with captions.
- No lorem ipsum. All copy is realistic, on-brand placeholder content.
- Do NOT move to the next phase until explicitly told to.

---

## PHASE 1 — Brand Shell

**Trigger:** Tell Claude: `"Start Phase 1"`

### Goal
Crawl `atlanticcoastmortgage.com`, extract brand constants, and build the
empty page scaffold. No content sections yet — just the foundation.

### Tasks
1. **Crawl** `atlanticcoastmortgage.com` and confirm or update these values:

   ```
   --color-primary:    #0A50B1   /* main blue */
   --color-navy:       #002E5F   /* dark navy */
   --color-accent:     #45CE86   /* green CTAs */
   --color-bg-light:   #EEF6FF   /* light section bg */
   --color-text:       #313131   /* body text */
   --color-nav-hover:  #015BD7
   ```

2. **Typography** — add to `<head>`:
   ```html
   <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
   ```
   - Headings: `"Halyard Display", "Open Sans", sans-serif`
     (Halyard Display is a paid SANS-SERIF font; if it fails to load, fall back
     to Open Sans — NOT a serif. Do not use Georgia or any serif font, as that
     would visibly change the brand identity. Use a heavier weight, e.g. 700,
     on headings to preserve display contrast against body text.)
   - Body/Nav: `"Open Sans", sans-serif`

3. **Logo** — recreate in HTML/CSS, no hotlinked assets:
   - Square badge (~42px): `background: #002E5F`, white bold "ACM" text,
     `border-radius: 4px`
   - To its right: "ATLANTIC COAST MORTGAGE" in `#002E5F`, uppercase,
     `letter-spacing: 0.08em`, `font-size: 13px`
   - Footer variant: white badge + white text on dark background

4. **Navbar** — sticky, white background, 1px bottom border `#E0E0E0`:
   Exact order from live site:
   `Find a Mortgage Pro | Home Financing | About | Education | Contact`
   Right-aligned: `Customer Portal Login` (text link) + `Apply Now`
   (pill button, `background: #45CE86`, white text)
   - "Education" is the **active** item: underline or `color: #0A50B1`
   - Mobile: render a hamburger icon (☰) — non-functional, icon only

5. **CSS custom properties** — define all brand tokens as CSS variables
   on `:root` at the top of the `<style>` block.

6. **Page scaffold** — after the nav, add empty `<section>` tags with
   commented placeholder labels for Phases 2–4:
   ```html
   <!-- PHASE 2: Hero -->
   <!-- PHASE 2: Readiness Teaser -->
   <!-- PHASE 3: Content by Buyer Stage -->
   <!-- PHASE 3: Featured Articles -->
   <!-- PHASE 4: Trust Band -->
   <!-- PHASE 4: Footer CTA + Footer -->
   ```

### Deliverable
`index.html` with working nav, logo, CSS variables, font links, and empty
labeled sections. Nothing else. Stop here and wait.

---

## PHASE 2 — Hero + Readiness Teaser

**Trigger:** Tell Claude: `"Start Phase 2"`

### Goal
Build the two highest-stakes sections. Get these locked before touching
anything else.

### Section A — Hero
- Full-width, `background: #002E5F`
- **Left column:** headline + subhead + CTA button
- **Right column:** styled image placeholder `<div>` (~380px tall),
  `background: #0A50B1` with 40% opacity overlay effect, centered italic
  white caption:
  *"Diverse couple reviewing mortgage documents at kitchen table, warm home setting"*

  ```
  Headline (H1, Halyard Display, white, ~48px desktop / ~32px mobile):
  "Know Before You Buy. Succeed When You Close."

  Subhead (Open Sans, #B8D4FF, 18px):
  "Straightforward mortgage education for every stage of your homebuying journey."

  CTA button: "Explore the Education Hub"
  background: #45CE86 | text: white | border-radius: 50px | padding: 14px 32px
  href="#" — non-functional
  ```

### Section B — Readiness Teaser
This is the **page's signature element** — it must visually dominate and
feel like a distinct, premium module.

- Background: `#0A50B1` (full-width band) OR a prominent card on `#EEF6FF`
  — choose whichever reads as more visually striking
- Add a purely decorative visual cue suggesting depth: a faint horizontal
  progress-bar strip, a row of 3 soft checklist-icon placeholders, or a
  card shadow implying a tool beneath. Decorative only — it should hint at a
  short questionnaire (matching the subtext below) without being a working form.

  ```
  Title (Halyard Display, large, white or navy):
  "Am I Mortgage-Ready?"

  Subtext (Open Sans):
  "Answer a few questions and get a clear picture of where you stand —
  before you ever talk to a lender."

  CTA: "Check My Readiness →"
  style: #45CE86 background, white text, pill-shaped
  href="#" — non-functional
  ```

### Deliverable
`index.html` updated with Hero and Readiness Teaser filled in. Stop here
and wait.

---

## PHASE 3 — Content Body

**Trigger:** Tell Claude: `"Start Phase 3"`

### Goal
Fill the two content sections: buyer stage columns and article cards.

### Section A — Content by Buyer Stage
- Section header: `"Learn at Every Stage"` (Halyard Display, `#002E5F`)
- Desktop: 3 equal columns | Mobile: single-column stack

**Column 1 — Pre-Qualification**
Icon: inline SVG checklist/document (blue)
Description: *"Understand your credit, income, and debt before you apply."*
Sub-topics (styled links, `href="#"`, non-functional):
- What's a DTI ratio?
- How credit scores affect your rate
- How much can I actually afford?
- Getting pre-qualified vs. pre-approved

Audience tags (pill badges, `background: #EEF6FF`, `color: #0A50B1`, small):
`First-time buyers` · `Students`

**Column 2 — Shopping for a Loan**
Icon: inline SVG house + magnifying glass
Description: *"Compare loan types, rates, and lenders with confidence."*
Sub-topics:
- Fixed vs. adjustable rate mortgages
- Understanding your Loan Estimate
- FHA, VA, and conventional loans
- Rate locks explained

Audience tags: `Young professionals` · `Move-up buyers`

**Column 3 — Post-Close & Ownership**
Icon: inline SVG key or home
Description: *"What happens after closing — equity, refinancing, and more."*
Sub-topics:
- Reading your first mortgage statement
- Building equity faster
- When to refinance
- Tax benefits of homeownership

Audience tags: `Existing homeowners` · `Investors`

---

### Section B — Featured Articles
Section header: `"Homebuying Made Simple"` (mirrors ACM's existing blog header)
Subhead: `"Mortgage tips, trends, and insights — written for real buyers."`

Desktop: 4-column row | Tablet: 2×2 grid | Mobile: single-column stack

Each card contains:
- Styled image `<div>` (~200px tall): `background: #0A50B1` + 35% overlay,
  centered italic white caption (see below)
- Category pill (small, rounded, `background: #EEF6FF`, `color: #0A50B1`)
- Title (Halyard Display, bold)
- One-line excerpt (Open Sans, ~14px, `color: #666`)
- `"Read more →"` link (`color: #0A50B1`, `href="#"`)

**Card 1**
Caption: *"Young professional reviewing financial documents on laptop"*
Category: `Pre-Qualification`
Title: `5 Things to Check Before You Apply for a Mortgage`
Excerpt: *"Your credit score is just the starting point. Here's what else matters."*

**Card 2**
Caption: *"Diverse couple meeting with a loan officer across a desk"*
Category: `Loan Types`
Title: `FHA vs. Conventional: Which Loan Is Right for You?`
Excerpt: *"Breaking down the real differences — and when each one wins."*

**Card 3**
Caption: *"Family unpacking boxes in a bright new home"*
Category: `Post-Close`
Title: `Your First Month as a Homeowner: What to Expect`
Excerpt: *"From your first mortgage statement to setting up escrow payments."*

**Card 4**
Caption: *"Aerial view of a suburban neighborhood at golden hour"*
Category: `Market Trends`
Title: `How Rising Rates Affect Your Buying Power`
Excerpt: *"A straightforward look at rate movement and what it means for buyers."*

### Deliverable
`index.html` updated with both content sections. Stop here and wait.

---

## PHASE 4 — Trust Band + Footer

**Trigger:** Tell Claude: `"Start Phase 4"`

### Goal
Add the final two sections and complete the page.

### Section A — Trust / Credibility Band
Full-width, `background: #002E5F`, white text.
Four stat blocks in a row (desktop) / 2×2 grid (mobile):

```
[Icon] [XX]+ Years          [Icon] [X,XXX] Loans Closed
       Serving Homebuyers          Across the Mid-Atlantic

[Icon] Licensed in          [Icon] A+ Rated
       [X] States                  by [Placeholder Agency]
```

Add one disclaimer line below in small gray-white text:
*"Data shown is illustrative. Final figures to be confirmed with ACM team."*

### Section B — Footer CTA Band
Background: `#EEF6FF`

```
Headline: "Have questions? Talk to a loan officer."
Subtext:  "No pressure — just answers. Our team is here to help you move forward."
Button:   "Find My Loan Officer"  (matches ACM's existing CTA copy)
          background: #45CE86 | white text | pill-shaped | href="#"
```

### Section C — Main Footer
Background: `#002E5F`, white text.

- ACM logo (white variant) — flush left
- Three placeholder nav columns side by side:
  - **Company:** About Us · Careers · Blog · Press
  - **Loan Products:** Conventional · FHA · VA · Jumbo
  - **Legal:** Privacy Policy · Terms of Use · Accessibility · NMLS Consumer Access
- Bottom bar (centered, small, `color: #8BAFD4`):
  `© 2026 Atlantic Coast Mortgage. All rights reserved. | NMLS #[Placeholder]`

### Deliverable
Complete, final `index.html`. Stop here and wait for Phase 5.

---

## PHASE 5 — Responsiveness + QA

**Trigger:** Tell Claude: `"Start Phase 5"`

### Goal
Audit and fix responsiveness and visual polish. Do NOT add new content —
only fix existing markup and styles.

### Checklist (work through every item)
- [ ] Desktop (≥1024px): all multi-column layouts render correctly
- [ ] Tablet (768–1023px): graceful 2-column or condensed layouts
- [ ] Mobile (<768px): full single-column stack, hamburger icon visible
- [ ] No horizontal scroll on any breakpoint
- [ ] Section background alternation is consistent:
      white → `#EEF6FF` → white → `#002E5F` → white → `#002E5F` (footer)
- [ ] All image placeholder `<div>`s have the blue overlay and white caption
- [ ] No `<img>` tags with broken or external `src` attributes
- [ ] All buttons/links are visually styled and use `href="#"`
- [ ] Fonts: Halyard Display (or Open Sans sans-serif fallback) on all headings;
      Open Sans on all body/nav text — no serif fallback anywhere
- [ ] CSS variables used consistently — no hardcoded hex values outside `:root`
- [ ] "Education" remains the active nav item
- [ ] Footer NMLS placeholder is present
- [ ] Trust Band disclaimer line is present
- [ ] File opens cleanly with a double-click in any browser — zero console errors

### Deliverable
Final, QA-verified `index.html`. This is the pitch-ready file.
