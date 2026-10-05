# Handoff — elioTax website
_Updated 2026-10-05, end of M3 session_

- **Position:** M3 complete → next: M4 (Build the page).
- **Live right now:** Website: nothing yet. Project backup (public): https://github.com/eliotaxllc/eliotaxllc-website. Upload form (live, tested, branded with navy theme + `brand/form-header.png`): **https://forms.gle/7FcPZm8cmSSvmp8K7**
- **Not obvious from the files:**
  - `CONTENT.md` is owner-approved. Build M4 from it word for word. The owner prefers crisp, simple claims (e.g., "never sold or shared") over hedged legal wording.
  - `site/assets/logo.svg` was converted directly from the original `.ai` vectors. It's the master for any future icon/image work. The icons, preview image, and form header were rendered from it with one-off scripts that weren't kept (WPF is built into Windows; no Python, Node, or ImageMagick on this PC).
  - Uploads land in the owner's My Drive under "elioTax LLC - Secure Document Upload (File responses)". Folder is Restricted, owner only (checked in M1).
- **Your to-dos before next session (M4):** Think about the M4 starter questions: open the form in the same tab or a new one? Want eliotaxllc.com/upload as a shortcut? Should the page show up in Google search?
- **Watch out for:**
  - Brand originals `.ai`, `.pdf`, `.jpg` are git-ignored on purpose: the PDF and JPG hold hidden personal details from the designer's computer. Never commit them. Keep a private backup.
  - Never move, rename, or delete the "(File responses)" folder (the form stops accepting uploads). Deleting a response doesn't delete its file or Sheet row.
  - Claude's shell may not find `git`/`gh`. Refresh PATH from the Machine+User environment first. The app's Terminal panel failed to start on 2026-10-05.
  - M4 needs a local preview server. Node and Python aren't installed, so plan one (e.g., a tiny PowerShell server) and ask before installing anything.
