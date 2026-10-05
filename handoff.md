# Handoff — elioTax website
_Updated 2026-10-05, end of M4 session_

- **Position:** M4 complete → next: M5 (Go live at a temporary address).
- **Live right now:** Website: nothing yet (the page is built in `site/` but not published). Project backup (public): https://github.com/eliotaxllc/eliotaxllc-website. Upload form (live, tested, branded): **https://forms.gle/7FcPZm8cmSSvmp8K7**
- **Not obvious from the files:**
  - Local preview: `preview_start` with name **site** (http://localhost:8080). It runs `.claude/serve.ps1` with `-ExecutionPolicy Bypass` for that one process only (owner approved 2026-10-05; the system setting stays at the Windows default).
  - The `/upload` shortcut uses a meta refresh (no JavaScript). It was tested: it reaches the form's Google sign-in, and Back returns to the page with no redirect loop.
  - `canonical`, `og:url`, and `og:image` use full https://eliotaxllc.com addresses (link previews require them). The preview *image* won't appear until M6 connects the domain, so test link previews then.
  - All checks passed: W3C validator (HTML + CSS, owner approved its use), keyboard focus, headings, alt text, 56px tap targets, 320px/200%-zoom reflow, zero outside requests, ~15 KB page.
  - Uploads land in the owner's My Drive under "elioTax LLC - Secure Document Upload (File responses)". Folder is Restricted, owner only.
- **Your to-dos before next session (M5):** Be ready for the page to be publicly reachable at a github.io address. Have your phone handy for testing, plus your family member for one more dummy upload.
- **Watch out for:**
  - Never commit the brand originals `.ai`/`.pdf`/`.jpg` (git-ignored; the PDF and JPG hold hidden personal details from the designer's computer).
  - Never move, rename, or delete the "(File responses)" folder. Deleting a response doesn't delete its file or Sheet row.
  - Update "© 2026" in `site/index.html` each January.
  - Claude's shell sometimes can't find `git`/`gh`. Refresh PATH from the Machine+User environment variables first.
