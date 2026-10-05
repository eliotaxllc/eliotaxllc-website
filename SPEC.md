# elioTax LLC — Client Document Upload Website

**Project spec** · Created 2026-10-04 · Goal: clients using it before tax season (by mid-January 2027)

> **Who this is for:** you (the business owner — not a developer, first website) and any Claude
> session that picks up the work. It's written in plain language on purpose.
> **SPEC.md is the source of truth for decisions.** `handoff.md` says where we left off.

---

## 1. What we're building

A one-page website at **eliotaxllc.com** that tells your clients, clearly and confidently:
*"This is the right place to send your tax documents to elioTax LLC."*
It has your logo and colors, short how-to steps, a security note, a privacy note, and one big **Upload** button.

The button opens a **Google Form**. The client signs in with their Google account and uploads files.
The files land in a private folder in **your Google Drive**, and you get an email each time someone submits.

You give every client the same link: **eliotaxllc.com**.

### How it fits together

```
 Client's phone or computer
     │  1. Opens the link you gave them: eliotaxllc.com
     ▼
 Your one-page website  (hosted free on GitHub Pages)
     │  2. Taps "Upload my documents"
     ▼
 Google Form  (runs on Google's servers)
     │  3. Signs in with Google, picks files, submits
     ▼
 Private folder in YOUR Google Drive ──► 4. You get an email: "new response"
```

Our website never touches the files. It's a trustworthy front door that points to the upload form.

### What it costs

| Item | Cost |
|---|---|
| Domain eliotaxllc.com (Namecheap) | Already owned; yearly renewal |
| Website hosting (GitHub Pages) | $0 |
| Upload form + storage (Google Forms + your Google account's 15 GB free storage, shared with Gmail/Photos) | $0 (if space runs low, Google One adds more for a few dollars a month) |
| Git, GitHub, GitHub CLI (tools) | $0 |
| **Ongoing total** | **$0/month** beyond domain renewal |

---

## 2. Decisions (and why)

| # | Decision | Why | Revisit if… |
|---|---|---|---|
| D1 | Don't build our own login or file storage; use an existing service for uploads | Client documents contain SSNs. A home-built portal would put the full security burden on you. | — |
| D2 | **Google Form with a file-upload question**, saving into your Google Drive | Free, and you already use Google Drive. Google *requires* uploaders to sign in with a Google account (can't be turned off). That gives the "log in" experience and records who sent each file. | Many clients lack or refuse Google accounts → consider a Dropbox file request or TaxAct Client Portals |
| D3 | No accounts on our own site; clients sign in with their own Google account | Nothing for you to manage or maintain | — |
| D4 | One shared link for every client (eliotaxllc.com) | Matches how you want to share it; uploads are tagged with who sent them | Sorting gets painful → per-client forms/folders |
| D5 | Use your **existing** Google account (not a dedicated business account) | Your choice — less setup. **Accepted tradeoff:** client documents share an account and storage with personal data; if that account is compromised, client data is exposed. **Mitigations:** 2-step verification required, private upload folder, regular cleanup (M1, M7). | You hire help, storage fills up, or your security plan calls for separation |
| D6 | Not using TaxAct Client Portals ($299.95/yr) for now. **Do not buy TaxAct Client Xchange — it is retired Oct 31, 2026.** | Budget: as close to free as possible | You want true client accounts, e-signatures, or two-way sharing. Switching = changing one link (D9) |
| D7 | Plain HTML + CSS. No frameworks, no build step, no JavaScript unless truly needed | Easiest to understand and maintain; nothing to update or break | — |
| D8 | Host on **GitHub Pages**, published by Claude using Git; **public** repository | Free, HTTPS included, full version history/backup, "ask Claude → it's live" | — |
| D9 | The Upload destination (form link) lives in **one clearly marked place** | Swapping to a different upload service later takes minutes | — |
| D10 | Page content: logo + name, "right place" statement, Upload button, how-to steps, security note, fallback for clients without Google, short privacy note. **No** bio, photo, credentials, phone, or contact email (your choice, 2026-10-04) | You want it minimal | M3 — clients without a Google account need *some* way to reach you (see §8) |
| D11 | English only | — | — |
| D12 | Domain is at Namecheap. No email on the domain; you'll keep using your existing email | — | You want an address like name@eliotaxllc.com |

---

## 3. Requirements

### 3.1 The page

**Must:**
- Look clearly official and trustworthy: logo, "elioTax LLC," brand colors, served over HTTPS at eliotaxllc.com.
- Say plainly that this is the official, secure place to send documents to elioTax LLC.
- Show the Upload button without scrolling on a phone.
- Include how-to steps (3–4 short steps), including *why* Google asks clients to sign in and that you never see their Google password.
- Include a security note that makes **only accurate claims**, e.g., the connection is encrypted and files go to a private folder only you can access. No "bank-level," "100% secure," or guarantees.
- Give clients who don't have (or don't want) a Google account a way forward (wording decided in M3).
- Include a short privacy note: what's collected, how it's used, that it's never sold or shared, and how long it's kept (details in M3/M7).
- Include a footer with © year and business name.
- Work on phones first, then tablets and desktops. Stay readable at 200% zoom.
- Be accessible: real headings, alt text on the logo, color contrast meeting WCAG AA (4.5:1 for body text), visible keyboard focus, tap targets at least 44px.
- Be fast and private: **no** trackers, analytics, cookies, ads, or third-party scripts. Prefer system fonts or self-hosted font files.
- Show a good link preview when you text or email the link (business name, one-line description, logo). Add a favicon (browser-tab icon) made from the logo.
- Use **relative links** (no leading `/`) so the site works both at the temporary GitHub address and at eliotaxllc.com.

**Must not:**
- Collect any data itself (no forms or contact boxes on our site).
- Ask clients to type SSNs, bank numbers, or passwords anywhere.

### 3.2 The upload form (Google Forms)

- Title along the lines of "elioTax LLC — Secure Document Upload." Branded to match the site (M3).
- Questions (finalized in M1, in this order):
  - Full name (short answer, required).
  - Tax year (multiple choice, required): 2026 / 2025 / Earlier year. Update the choices each season.
  - Upload documents (file upload, required). Allowed types: PDF, images, documents, spreadsheets. Up to 10 files per submission, up to 100 MB each.
  - Optional note to the preparer, with a warning not to type SSNs or account numbers.
  - No phone number (your choice; Google already records each uploader's verified email).
- Settings: collect **verified** email addresses; allow multiple submissions (clients can come back to upload more); response editing off; "View results summary" **off**; "submit another response" link on; form-wide total upload cap 10 GB; confirmation message thanking them and saying what happens next.
- Email notification to you on every new response, plus a linked Google Sheet that logs each submission.
- The Drive folder that receives uploads stays private (shared with no one).
- Tested end-to-end using a second Google account and a harmless dummy file.

### 3.3 Hosting & domain

- GitHub repository, **public** (required for free GitHub Pages). Only the `site/` folder is published, by a GitHub Actions workflow on every push to `main`.
- **eliotaxllc.com** is the main address. www.eliotaxllc.com redirects to it, and HTTP redirects to HTTPS.
- Domain verified in your GitHub account, which prevents anyone else from hijacking it on GitHub Pages.

### 3.4 Security & privacy rules — every session must follow these

1. **Never touch real client data.** Claude never opens, downloads, reads, or summarizes client uploads or form responses. Tests use harmless dummy files only, such as a PDF that just says "TEST."
2. **You do all sign-ins.** You enter passwords, 2-step codes, recovery codes, and account-security settings yourself. Claude explains the steps but never asks for or types a password or code.
3. **This folder is public.** Everything in the project folder goes on GitHub publicly. Never put passwords, recovery codes, personal (non-business) contact info, account email addresses, or anything about clients here. The Google Form link is fine; it's public by design.
4. **Ask before going live.** Before pushing changes that update the live site, or changing DNS settings, Claude shows what will change and waits for your "yes."
5. **Turn on 2-step verification** for every account that controls this system: Google, GitHub, Namecheap.
6. **Not legal advice.** Claude can describe what this system does for your Written Information Security Plan (WISP), but compliance decisions are yours. See §11: IRS Pub 4557, Pub 5708, and the FTC Safeguards Rule.

### 3.5 Out of scope (for now)

Client accounts or logins on our own site, client dashboards, sending documents back to clients, e-signatures, payments, appointment booking, email at the domain, extra pages or a blog, a Spanish version. See §9.

---

## 4. Project folder layout

```
C:\elioTax Website Files\
├── CLAUDE.md            ← tells each Claude session to read SPEC + handoff first
├── SPEC.md              ← this plan (source of truth for decisions)
├── handoff.md           ← short "where we left off" note (created at end of M1)
├── CONTENT.md           ← approved page text + color palette (M3)
├── OPERATIONS.md        ← your plain-language tax-season how-to (M7)
├── brand/               ← your original logo + color samples (M3)
├── site/                ← THE WEBSITE — only this folder gets published
│   ├── index.html
│   ├── styles.css
│   ├── upload/index.html   ← optional shortcut eliotaxllc.com/upload → the form (M4)
│   └── assets/          ← web-ready logo, favicon, link-preview image
└── .github/workflows/   ← instructions GitHub follows to publish site/ (M5)
```

---

## 5. How every session works (session protocol)

Each milestone is designed to fit **one work session**. Every session follows this pattern.

### Start
1. Read `SPEC.md` and `handoff.md` (if it exists). Confirm with the user which milestone we're on.
2. **Ask helpful clarifying questions before doing any work.** Each milestone lists starter questions; add any new ones the current state raises, and resolve the open questions in §8 tagged for this milestone.
3. Explain the plan for the session in 3–5 plain sentences.

### During
- **The owner is not a developer.** Before each step, say in one or two plain sentences what you're about to do and why. Define jargon the first time it comes up (see §10). Show rather than tell, for example by previewing in the browser.
- Follow the security rules in §3.4.
- If a decision changes, update the Decisions table (§2) in this file.

### End
1. **Summarize the implemented work** in chat, in plain language: what was done, what was tested, anything unfinished, what the user should do before the next session, and which milestone is next.
2. **Update `handoff.md`.** Create it at the end of the M1 session. Keep it under ~20 lines, and include only what can't be quickly figured out from the files: current position in the plan, what's live, anything pending (e.g., DNS still spreading), user to-dos, and gotchas. Replace stale info instead of building up a history log. Follow §3.4 rule 3: nothing private.
3. From M2 onward, **commit** the session's work with a clear message, and push after the user says yes (§3.4 rule 4).

### handoff.md template

```markdown
# Handoff — elioTax website
_Updated YYYY-MM-DD, end of M# session_

- **Position:** M# complete → next: M# (Title). [If partial: what's left.]
- **Live right now:** nothing / temporary address <url> / https://eliotaxllc.com
- **Not obvious from the files:** …
- **Waiting on / your to-dos before next session:** …
- **Watch out for:** …
```

---

## 6. Milestones

| # | Milestone | You'll need | Result |
|---|---|---|---|
| M1 | Secure upload form | Google sign-in + phone; a second Google account for testing | Working, tested upload link |
| M2 | Backup & version history | ~10 min to create a GitHub account | Project backed up on GitHub |
| M3 | Brand & words | Your logo + color samples | Approved text, web-ready logo, colors; form branded |
| M4 | Build the page | — | Finished page, previewed at phone & desktop sizes |
| M5 | Go live (temporary address) | Your phone for testing | Live at a github.io address |
| M6 | Connect eliotaxllc.com | Namecheap sign-in | Live at https://eliotaxllc.com |
| M7 | Launch readiness | 1–2 friendly clients for a pilot | Safety checklist done, OPERATIONS.md, ready to share |

### M1 — Secure upload form (Google Forms + Drive)

**Goal:** A tested Google Form link that lets a signed-in client upload files into a private folder in your Drive and sends you an email.
**Why first:** It's the heart of the system, it needs no code, and the way it works shapes the page text.
**Before the session:** Have your phone handy for Google sign-in. Line up a second Google account to play "client": a family member's, or a free one you create yourself.
**Starter questions:** Ask for tax year? Phone number? Which file types and limits? Confirmation-message wording? Keep a Google Sheet log of submissions?

**Steps:**
1. Account safety check (you do it; Claude guides): 2-step verification is ON, recovery phone and email are current, and there are at least a few GB free in your Google storage.
2. Create the form and add the questions in §3.2.
3. Configure the settings in §3.2. Turn on email notifications (Responses tab → ⋮ menu). Optionally link a Google Sheet as a submission log.
4. Find the Drive folder Google creates for uploads and confirm it's shared with no one. Check Google's current guidance before moving or renaming it.
5. Test as a client: in a private/incognito window, sign in with the test account, upload a dummy file, and submit. Check that the confirmation shows, you get the email, the file appears in your folder tagged with the uploader, and the test account can't see your folder.
6. Delete the test response and the test file.
7. Copy the form's share link (Send → link icon) and record it in `handoff.md`.

**Done when:** The end-to-end test passes, the link is recorded, and `handoff.md` exists.
**Explain along the way:** what a Google Form is, why Google requires sign-in, what 2-step verification is, and why we test with fake files.

### M2 — Backup & version history (Git + GitHub)

**Goal:** The project folder is tracked by Git and backed up to a GitHub repository.
**Before the session:** Be ready to create a free GitHub account (or sign in) and set up 2-step verification, which GitHub requires.
**Starter questions:** Your GitHub username (it appears in the temporary web address)? Repo name (suggestion: `eliotaxllc-website`)? Keep brand originals in the repo, or only web-ready copies?

**Steps:**
1. Install Git for Windows and GitHub CLI with `winget` (Claude runs the commands; you approve).
2. You create the GitHub account, turn on 2-step verification, and run `gh auth login` (browser sign-in).
3. Set Git's name and email. Use GitHub's private "noreply" email so your personal email isn't published.
4. Initialize the repo, add a `.gitignore` (system junk files, local tool settings), and make the first commit.
5. Create the public GitHub repo and push. Tour the repo page together.

**Done when:** GitHub shows the same files as your folder, and you can say in a sentence what a commit and a push are.
**Explain along the way:** Git is a series of save points; GitHub is an online backup that also hosts the site; why "public" is OK (§3.4 rule 3).

### M3 — Brand & words

**Goal:** All the ingredients are ready: web-ready logo and favicon, a color palette, approved page text, and a Google Form branded to match.
**Before the session:** Claude will ask you to drop your logo and color samples into `brand/`. Any format works: PNG, JPG, SVG, PDF, or a screenshot.
**Starter questions:** Which logo version for a light background? Tone (warm / plain / formal)? Add a short "what to upload" checklist (W-2s, 1099s, etc.)? How should clients without a Google account, or with questions, reach you? What should the privacy note say about how long you keep documents? Do you have a brand font?

**Steps:**
1. Review the brand files and make web-ready versions in `site/assets/`: SVG if possible, otherwise a transparent PNG at 2× size, plus a favicon and a link-preview image.
2. Pull exact color codes, check contrast, and propose accessible pairings for text, button, and background.
3. Draft all page text in `CONTENT.md`: headline, "right place" line, button label, how-to steps, Google sign-in explainer, security note, no-Google fallback, privacy note, footer, and link-preview title and description. Use short sentences and plain words.
4. You review; revise until approved.
5. Brand the Google Form with a header image and theme color.

**Done when:** `CONTENT.md` is approved, the assets are in place, and the form is branded.
**Explain along the way:** SVG vs PNG, hex color codes, contrast, and why consistent branding helps clients spot fake look-alike sites.

### M4 — Build the page

**Goal:** The finished one-page site in `site/`, approved by you at phone and desktop sizes.
**Starter questions:** Layout preference (Claude can mock up 2 quick options)? Should the button open the form in the same tab or a new one? Want eliotaxllc.com/upload as a direct shortcut? Should the page be findable on Google search?

**Steps:**
1. Build `site/index.html` and `site/styles.css` from `CONTENT.md` and the brand assets, meeting §3.1.
2. Put the form link in one marked place (D9). If you approve the shortcut, use a `site/upload/index.html` redirect that every button points to.
3. Add the favicon, link-preview tags, and page title and description.
4. Preview in the browser at phone and desktop widths. You review; iterate.
5. Checks: the HTML validates, contrast passes, keyboard navigation works, Upload reaches the form, and the page is small and fast.
6. Commit, and push with your OK. The site isn't live yet; that's M5.

**Done when:** You approve how it looks and reads, and all checks pass.
**Explain along the way:** HTML is the content and CSS is the look; what "responsive" means; how the local preview works.

### M5 — Go live at a temporary address (GitHub Pages)

**Goal:** The site is live at `https://<username>.github.io/<repo>/` and updates automatically on every push.
**Starter questions:** Ready for it to be publicly reachable? Nobody will find it unless they have the address, but anyone with the address can see it.

**Steps:**
1. Add the GitHub Actions workflow that publishes only `site/`, using GitHub's current official Pages actions.
2. Turn on Pages with "GitHub Actions" as the source.
3. Push (with your OK) and watch the deploy finish.
4. Test on your real phone and computer: the page loads with the padlock, and Upload → form → test submission with a dummy file works. Then delete the test.

**Done when:** The temporary address works on phone and computer, and publishing happens automatically on push.
**Explain along the way:** what hosting is, what "deploy" means, and what the HTTPS padlock means.

### M6 — Connect eliotaxllc.com

**Goal:** https://eliotaxllc.com (and www) shows the site with the padlock.
**Before the session:** Have your Namecheap sign-in ready. It's a good idea to turn on Namecheap 2-step verification first.
**Starter questions:** Main address with or without "www" (recommended: without, with www redirecting)? Did you set up anything at Namecheap, like email forwarding, that must be kept?

**Steps:**
1. Record the current Namecheap DNS records in `handoff.md` so the change can be undone.
2. Verify the domain in your GitHub account settings (this adds a TXT record at Namecheap).
3. At Namecheap (Domain List → Manage → Advanced DNS): remove the default parking records, add GitHub Pages' A records for `@` (and optionally AAAA records), and add a CNAME for `www` → `<username>.github.io`. Check GitHub's docs for the current IP addresses at the time.
4. In the repo's Pages settings, set the custom domain to eliotaxllc.com. Once the certificate is ready, turn on "Enforce HTTPS."
5. Test: http→https, www→eliotaxllc.com, phone and computer, and Upload end-to-end.

**Note:** DNS changes can take minutes to hours to spread (rarely up to 48 hours), and the HTTPS certificate can lag too. If it's still pending at the end of the session, note it in `handoff.md` and finish the checks next session.
**Done when:** Both addresses load over HTTPS with no warnings, and Upload works.
**Explain along the way:** DNS is the internet's phone book; what A, CNAME, and TXT records are; propagation; certificates.

### M7 — Launch readiness & your operating guide

**Goal:** A safe, tested launch, plus a plain-language guide for tax season.
**Starter questions:** How long will you keep uploads in Drive, and where do finished files go? Who are 1–2 friendly pilot clients? Launch date?

**Steps:**
1. Safety checklist (you do it; Claude guides): 2-step verification on Google, GitHub, and Namecheap; Namecheap auto-renew and domain lock on; Google Security Checkup done; upload folder not shared; form settings re-checked.
2. Pilot: 1–2 friendly clients upload dummy files from their own phones. Fix any confusing wording.
3. Write `OPERATIONS.md`, covering:
   - checking for new uploads
   - filing, moving, and deleting documents after a return
   - changing the Upload link (e.g., to TaxAct Client Portals)
   - asking Claude for a text change
   - yearly to-dos: domain renewal, © year, the form's tax-year choices, a pre-season re-test
   - what to do if the link breaks or a client is confused
   - what to do if you suspect your Google account was hacked, including reporting data theft to the IRS (see Pub 4557)
4. List the facts about this system that belong in your WISP (IRS Pub 5708 template).
5. Do a final check against §3, and draft a short message you can send clients with the link.

**Done when:** The checklist is complete, `OPERATIONS.md` is approved, and you're ready to share eliotaxllc.com.

---

## 7. Suggested schedule

About one milestone a week leaves a comfortable cushion before tax season.

| Week of | Milestone |
|---|---|
| Oct 5, 2026 | M1 — Secure upload form |
| Oct 12 | M2 — Backup & version history |
| Oct 19 | M3 — Brand & words (have logo + colors ready) |
| Oct 26 | M4 — Build the page |
| Nov 2 | M5 — Go live (temporary address) |
| Nov 9 | M6 — Connect eliotaxllc.com |
| Nov 16 | M7 — Launch readiness |
| Dec – mid-Jan 2027 | Buffer, pilot feedback, launch |

---

## 8. Open questions (resolve in the listed milestone)

| Question | When |
|---|---|
| ~~Extra form fields? File limits? Sheets log?~~ Resolved: tax year yes, phone no, 10 files × 100 MB, Sheet log yes (§3.2) | M1 ✅ |
| ~~Which Google account plays the "test client"?~~ Resolved: a family member's account | M1 ✅ |
| GitHub username and repo name | M2 |
| How do clients without a Google account, or with questions, reach you? (The page has no contact info by your choice.) | M3 |
| Include a "what to upload" checklist? | M3 |
| Privacy note: how long are documents kept? | M3 (finalize in M7) |
| `/upload` shortcut? Same tab or new tab? Findable on Google? | M4 |
| Main address with or without www | M6 |
| Document retention and cleanup routine | M7 |

---

## 9. Future upgrades (not now)

- **A real client portal:** TaxAct Client Portals ($299.95/yr) gives client logins, encrypted storage, secure messaging, and your branding. Switching means changing the one Upload link (D9).
- A dedicated Google account just for the business (D5).
- Email at your domain, e.g. you@eliotaxllc.com.
- A Spanish version; a bio, photo, or contact section.

---

## 10. Glossary

- **Domain:** your web address (eliotaxllc.com), rented yearly from a registrar (Namecheap).
- **DNS:** the internet's phone book. These are the settings at Namecheap that point your domain to where the site lives.
- **Hosting:** the computer that serves your site to visitors (GitHub Pages, free).
- **HTTPS / padlock:** an encrypted connection between a visitor and your site.
- **HTML / CSS:** the page's content / the page's look.
- **Git / commit:** a tool that keeps "save points" of your files; a commit is one save point.
- **GitHub / repository (repo) / push:** the online home for those save points; pushing uploads them there.
- **Deploy:** publishing the latest version so visitors see it.
- **2-step verification (2SV / 2FA):** signing in needs your password *plus* a code or a phone prompt.
- **WISP:** Written Information Security Plan. Tax preparers are required to have one; IRS Pub 5708 has a template.

---

## 11. References

- IRS Publication 4557, *Safeguarding Taxpayer Data*: https://www.irs.gov/pub/irs-pdf/p4557.pdf
- IRS Publication 5708, *Creating a Written Information Security Plan*: https://www.irs.gov/pub/irs-pdf/p5708.pdf
- FTC Safeguards Rule (applies to tax preparers): https://www.ftc.gov/business-guidance/resources/ftc-safeguards-rule-what-your-business-needs-know
- TaxAct Client Portals (future upgrade): https://www.taxact.com/professional/client-portals
- TaxAct Client Xchange retirement notice: https://www.taxact.com/professional/resources/xchange
- Google Forms file uploads require sign-in: https://www.howtogeek.com/817296/how-to-let-users-upload-files-and-photos-in-google-forms/
- GitHub Pages custom domains: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
