# Handoff — elioTax website
_Updated 2026-10-05, end of M2 session_

- **Position:** M2 complete → next: M3 (Brand & words).
- **Live right now:** Website: nothing yet. Project backup (public): https://github.com/eliotaxllc/eliotaxllc-website. Upload form (live, tested, public by design): **https://forms.gle/7FcPZm8cmSSvmp8K7**
- **Not obvious from the files:**
  - Git and GitHub CLI are installed. `gh` is signed in as eliotaxllc (token in the Windows keyring, includes the `workflow` scope M5 needs). Git author identity is set in this repo only.
  - Uploads land in the owner's My Drive under "elioTax LLC - Secure Document Upload (File responses)". Folder checked in M1: Restricted, owner only.
  - A family member's Google account plays the test client (M5/M7 re-tests).
- **Your to-dos before next session (M3):**
  - Put your logo file(s) and any color samples in a new `brand` folder inside the project folder. Any format works.
  - Think about: tone (warm / plain / formal), and how clients without a Google account, or with questions, should reach you.
- **Watch out for:**
  - Never move, rename, or delete the "(File responses)" folder. The form stops accepting *all* uploads. Deleting a form response doesn't delete its file or Sheet row.
  - Clients signed into several Google accounts may get upload errors. Fix: private/incognito tab. Mention this in M3 page text.
  - Claude's shell may not find `git`/`gh` until the app restarts. Refresh PATH from the Machine+User environment first. The app's Terminal panel failed to start on 2026-10-05, so `gh` commands were run from Claude's shell instead.
