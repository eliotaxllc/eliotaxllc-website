# Handoff — elioTax website
_Updated 2026-10-05, end of M6 session_

- **Position:** M6 complete → next: M7 (Launch readiness & your operating guide).
- **Live right now:** **https://eliotaxllc.com** (HTTPS enforced; the certificate covers eliotaxllc.com + www). www, http, and https://eliotaxllc.github.io/eliotaxllc-website/ all 301 to https://eliotaxllc.com/. Upload form: **https://forms.gle/7FcPZm8cmSSvmp8K7** (also reachable at eliotaxllc.com/upload). Repo: https://github.com/eliotaxllc/eliotaxllc-website
- **Namecheap DNS now (Advanced DNS → Host Records):** 4× `A @` → 185.199.108.153 / .109.153 / .110.153 / .111.153; 4× `AAAA @` → 2606:50c0:8000::153 / 8001:: / 8002:: / 8003::153; `CNAME www` → eliotaxllc.github.io.; `TXT _github-pages-challenge-eliotaxllc` (GitHub domain verification, keep it). Mail settings: Email Forwarding, untouched.
- **DNS before M6 (to fully undo):** `CNAME www` → parkingpage.namecheap.com. and `URL Redirect @` → http://www.eliotaxllc.com/ (Unmasked); also remove the custom domain in the repo's Pages settings.
- **Not obvious from the files:**
  - The domain is verified in the eliotaxllc GitHub account (takeover protection). Namecheap 2SV is on (2026-10-05).
  - Gotcha seen: GitHub's DNS check stuck at "202 in progress" for 70+ min after a brief www NXDOMAIN (negative cache 60 min). Removing and re-adding the custom domain via the API issued the certificate instantly.
  - The owner verified it on their phone and computer: padlock, www forwarding, Upload opens the form, and the texted link preview shows the logo.
- **Your to-dos before next session (M7):** Pick 1–2 friendly pilot clients. Think about how long you keep uploads in Drive and where finished files go. Pick a target launch date. **Don't share eliotaxllc.com with clients until M7's checklist is done.**
- **Watch out for:**
  - Never commit the brand originals `.ai`/`.pdf`/`.jpg` (git-ignored; hidden personal details). Never move, rename, or delete the "(File responses)" folder.
  - Any push that changes `site/` goes live within a minute, so always ask first. Update "© 2026" each January.
  - Claude's shell sometimes can't find `git`/`gh`. Refresh PATH from the Machine+User environment first. Under PowerShell, avoid `gh --jq` with spaces; pipe to ConvertFrom-Json.
