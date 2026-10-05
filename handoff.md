# Handoff — elioTax website
_Updated 2026-10-04, end of M1 session_

- **Position:** M1 complete → next: M2 (Backup & version history).
- **Live right now:** Website: nothing yet. Upload form: live and tested. Client link (public by design): **https://forms.gle/7FcPZm8cmSSvmp8K7** (opens a `/viewform` page that requires Google sign-in).
- **Not obvious from the files:**
  - Form title: "elioTax LLC - Secure Document Upload". Questions and settings match SPEC §3.2. Google storage had plenty of free space at setup.
  - Uploads land in the owner's My Drive under "elioTax LLC - Secure Document Upload (File responses)" → a subfolder for the upload question. File names end with the uploader's Google name. Folder checked: Restricted, owner only; a non-owner gets "You need access."
  - A family member's Google account plays the test client (for the M5/M7 re-tests).
- **Your to-dos before next session (M2):**
  - Be ready to create a free GitHub account (or sign in) and turn on its 2-step verification.
  - Pick a GitHub username (it shows in the temporary web address); repo name suggestion: `eliotaxllc-website`.
  - Start gathering your logo and color samples for M3.
- **Watch out for:**
  - Never move, rename, or delete the "(File responses)" folder. The form stops accepting *all* uploads until it's restored. Renaming the form doesn't rename the folder.
  - Deleting a form response does NOT delete its file or its Sheet row. Delete all three separately.
  - Clients signed into several Google accounts may get upload errors. Fix: a private/incognito tab with one account. Mention this in M3 page text / the M7 guide.
