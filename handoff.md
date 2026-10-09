# Handoff — elioTax website
_Updated 2026-10-09 (tax-notice option added after M7)_

- **Position:** **All milestones (M1–M7) complete.** Ready to launch: the owner sends clients the link in **early January 2027** (message in OPERATIONS.md §9). Future sessions handle maintenance requests; see OPERATIONS.md §4.
- **Live right now:** **https://eliotaxllc.com** (HTTPS enforced; www, http, and the old github.io address forward to it). Upload form: **https://forms.gle/7FcPZm8cmSSvmp8K7** (also at eliotaxllc.com/upload). Repo: https://github.com/eliotaxllc/eliotaxllc-website
- **Namecheap DNS now:** 4× `A @` → 185.199.108.153 / .109.153 / .110.153 / .111.153; 4× `AAAA @` → 2606:50c0:8000::153 / 8001:: / 8002:: / 8003::153; `CNAME www` → eliotaxllc.github.io.; `TXT _github-pages-challenge-eliotaxllc` (keep). Mail: Email Forwarding, untouched. **Before M6 (to undo):** `CNAME www` → parkingpage.namecheap.com. + `URL Redirect @` → http://www.eliotaxllc.com/.
- **Not obvious from the files:**
  - The M7 safety checklist passed: 2SV on Google, GitHub, Namecheap; Namecheap Auto-Renew + Domain Lock on (domain expires **March 2027**); Google Security Checkup clean; folder, Sheet, form settings, and editors verified. A pilot with 1–2 real clients had no issues.
  - Owner routine: after each return, download files to an **encrypted** computer/external drive, then delete them from Drive, the form, and the Sheet.
  - 2026-10-09: the form's year question was renamed **"What are you sending?"** and a "Tax notice received (IRS, state, or local)" choice was added (by the owner in Google Forms). The page checklist, step 3, and privacy note were updated to match and are live.
  - WISP notes are in `private/WISP-notes.md` (git-ignored; never commit). The owner chose **no visitor analytics** (2026-10-07; options are in SPEC §9).
- **Your to-dos:** If you haven't yet, delete the pilot clients' test submissions (response, file, and Sheet row). **Early January 2027:** ask Claude to update © to 2027 (the tax-year choices are already right), do the pre-season re-test, then send the launch message. **February:** watch for Namecheap's renewal email.
- **Watch out for:**
  - Never commit the brand originals `.ai`/`.pdf`/`.jpg` or `private/`. Never move, rename, or delete the "(File responses)" folder.
  - Any push that changes `site/` goes live within a minute, so always ask first. GitHub cert gotcha: if the DNS check sticks at "in progress," remove and re-add the custom domain.
  - Claude's shell sometimes can't find `git`/`gh`. Refresh PATH from the Machine+User environment first. Under PowerShell, avoid `gh --jq` with spaces; pipe to ConvertFrom-Json.
