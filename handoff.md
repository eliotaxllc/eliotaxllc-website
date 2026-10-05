# Handoff — elioTax website
_Updated 2026-10-05, end of M5 session_

- **Position:** M5 complete → next: M6 (Connect eliotaxllc.com).
- **Live right now:** Website: **https://eliotaxllc.github.io/eliotaxllc-website/** (temporary address; HTTPS enforced; http redirects to https). Upload form: **https://forms.gle/7FcPZm8cmSSvmp8K7**. Project backup: https://github.com/eliotaxllc/eliotaxllc-website
- **Not obvious from the files:**
  - Pages source is "GitHub Actions" (turned on via the API on 2026-10-05). Publishing uses checkout v7, configure-pages v6, upload-pages-artifact v5, and deploy-pages v5 (current official versions as of that date). The first deploy took 16s.
  - Verified live: all site files return 200; SPEC.md, handoff.md, brand/, and site/index.html paths return 404 (only `site/` is published).
  - The owner tested on their computer and phone (padlock OK, Upload opens the form). A family member did a dummy upload from the live page: thank-you, email, Drive file, and Sheet row all OK. Test data deleted.
  - Link-preview image and `canonical` point to https://eliotaxllc.com, so test link previews after M6.
  - With Actions-based Pages, the custom domain is set in the repo's Pages settings. No CNAME file is needed in `site/`.
- **Your to-dos before next session (M6):** Have your Namecheap sign-in ready and turn on Namecheap 2-step verification first. Check whether anything is set up at Namecheap (e.g., email forwarding) that must be kept. Main address with or without "www"? (Recommended: without, with www redirecting to it.)
- **Watch out for:**
  - Never commit the brand originals `.ai`/`.pdf`/`.jpg` (git-ignored; hidden personal details). Never move, rename, or delete the "(File responses)" folder.
  - Update "© 2026" in `site/index.html` each January. Any push that changes `site/` goes live, so always ask first.
  - Claude's shell sometimes can't find `git`/`gh`. Refresh PATH from the Machine+User environment first. In `gh --jq`, avoid spaces/quotes under PowerShell; pipe to ConvertFrom-Json instead.
