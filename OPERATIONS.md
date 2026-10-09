# OPERATIONS.md: running the elioTax upload system

Your plain-language guide for tax season. Written 2026-10-05 (M7).
**This file is public on GitHub.** It contains no passwords or client details. Keep it that way.

**The system in one line:** clients go to **eliotaxllc.com** → tap **Upload my documents** → sign in with Google → files land in a private folder in your Google Drive → you get an email.

---

## 1. Checking for new uploads

You'll get an email ("new response") each time a client submits. To see what came in:

| Where | What you'll find |
|---|---|
| **The responses Sheet** (in Drive) | One row per upload: date, name, verified email, tax year, note, and links to the files. Add your own "Done" column to track progress. |
| **Drive → "elioTax LLC - Secure Document Upload (File responses)"** | The actual files, in a subfolder named after the upload question. Each file name ends with the sender's Google name. |
| **The form → Responses tab** | The same answers, one person at a time. |

A client can submit more than once. Check the Sheet for earlier rows from the same email.

**Check for notices first.** Rows where "What are you sending?" says **Tax notice received** are IRS, state, or local letters, and those often have response deadlines. The alert email doesn't say what was sent, so glance at the Sheet whenever one arrives.

---

## 2. After a return is filed: clear it out

Your routine: **move the client's files to your records, then delete them from Drive.** This keeps the upload folder nearly empty, so very little is exposed if your Google account were ever compromised.

1. **Download** the client's files from the upload folder (select them → right-click → **Download**).
2. **Save them** into that client's folder on your **encrypted computer or external drive**. Open one or two to make sure they downloaded properly.
3. **Delete the files in Drive:** right-click → **Move to trash**. ⚠️ Delete *files only*, never the "(File responses)" folder or the folder inside it. If those go missing, the form stops accepting uploads (fix: restore them from Drive's Trash).
4. **Delete the client's form response(s):** form → Responses → **Individual** → trash can. (Deleting a response does *not* delete its files or Sheet row. That's why steps 3 and 5 exist.)
5. **Delete (or mark done) the Sheet row(s).**
6. **Empty Drive's trash** now and then (Drive → Trash → **Empty trash**). Trashed files still use storage and are recoverable for 30 days.

**Long-term:** keep records on your encrypted drive only as long as you need them and as the law requires, then delete them. Your website's privacy note promises exactly that.

---

## 3. Pausing uploads (off-season, vacations)

Form → **Published** (top right) → turn off **Accepting responses**. (In some versions, the switch is on the **Responses** tab instead.) Clients who open the link see a "no longer accepting responses" message. Turn it back on when you're ready. The website doesn't need to change.

---

## 4. Making a change to the website

You never edit code yourself. Open Claude Code in the `C:\elioTax Website Files` folder and say what you want, for example:

> "Change the headline to …", "Add 1099-K to the checklist", "Update the © year to 2027"

Claude will:
1. Read SPEC.md and handoff.md, then update `CONTENT.md` and the page.
2. Show you a preview on this computer.
3. **Ask for your "yes"** before publishing. Once you say yes, it's live at eliotaxllc.com within about a minute.

---

## 5. Changing where the Upload button goes

Example: switching to TaxAct Client Portals someday. The form link lives in exactly **one file**, `site/upload/index.html` (decision D9). Ask Claude: *"Change the upload link to [new address]."* Claude updates both spots in that file, plus the page text if the steps change (e.g., no Google sign-in). Then test the button on your phone.

---

## 6. Yearly to-dos

| When | To-do |
|---|---|
| **Early January** | Ask Claude to update the **© year** on the website to the new year. Check the year choices in the form's **"What are you sending?"** question: the first choice should be *last* year, the year clients are filing for. (January 2027: "Documents for **2026**" / "Documents for 2025", already set. January 2028: change them to 2027 / 2026.) Leave "earlier year" and "Tax notice received" as they are. Then do a **pre-season re-test**: a family member uploads a TEST photo from their phone, you confirm the email, file, and Sheet row, then delete all three. |
| **January** | Send clients the launch message (section 9). Check that Google storage has plenty of room (drive.google.com, bottom left). |
| **February** | Watch for Namecheap's **renewal reminder**. The domain renews each **March** (Auto-Renew is on); make sure the payment method on file is current. |
| **Any time a client is confused** | Note what confused them. Ask Claude to reword the page if it keeps happening. |
| **Once a year** | Re-run the safety checklist: Google **Security Checkup** (myaccount.google.com/security-checkup); 2-step verification still on for Google, GitHub, Namecheap; the upload folder and Sheet shared with **no one**; form **View results summary** off; form editors = only you. |
| **Once a year** | Review your WISP (your private notes are in `private/WISP-notes.md` on this computer). |

---

## 7. If something breaks

| Symptom | Likely cause → fix |
|---|---|
| eliotaxllc.com won't load at all | Check whether the domain expired (Namecheap → Domain List) or the DNS records changed (compare Namecheap → Advanced DNS with the list in `handoff.md`). Check githubstatus.com. Then ask Claude. |
| The page loads, but the Upload button errors | Open https://forms.gle/7FcPZm8cmSSvmp8K7 directly. If the form says it's closed, turn **Accepting responses** back on. If it says the folder is missing, restore the "(File responses)" folder from Drive → Trash. |
| Clients say uploads fail | Most often they're **signed into several Google accounts**: have them use a private/incognito window with one account. Also check that Google storage isn't full and the form's 10 GB total upload cap hasn't been reached. If it has, raise the cap: form → the upload question → **Change** next to "This form can accept up to 10 GB of files." |
| A client has no Google account | Per your website: they reach out the usual way and you arrange another route. Or they can create a free Google account with their existing email. |
| A file is too big (over 100 MB) | Ask them to split it, or send phone photos of the pages instead. |
| No notification emails | Form → Responses → **⋮** → make sure email notifications are on. Check your spam folder. |

---

## 8. If you suspect your Google account was hacked

Signs: a sign-in alert you don't recognize, a password that stops working, sent emails you didn't write, files or sharing you didn't change.

**Secure the account right away:**
1. Go to **g.co/recover** if you're locked out, or **myaccount.google.com/security** if you can still sign in.
2. **Change your Google password.** Under "Your devices," **sign out of every device** you don't recognize.
3. Check that **2-step verification** is still on and the **recovery phone/email** are yours.
4. In **Gmail → Settings → See all settings**: check **Forwarding** and **Filters** for anything you didn't create (attackers use these to keep copying your mail). Delete it.
5. **Check the upload system:** the "(File responses)" folder and Sheet are shared with **no one**; the form's editors list is **only you**; the form settings match section 6.
6. If you reused that password anywhere (GitHub, Namecheap), change it there too.

**Then report it. Speed matters.** From the IRS's *Data Theft Information for Tax Professionals* (also see IRS Pub 4557); check the current version:
1. **IRS:** contact your **local IRS Stakeholder Liaison** right away. They can help block fraudulent returns filed in your clients' names. (Search "IRS stakeholder liaison local contacts" on irs.gov.)
2. **FBI:** your local field office (fbi.gov/contact-us/field-offices). Also the **Secret Service** if directed, and a **local police report**.
3. **States:** report to state tax agencies through the **Federation of Tax Administrators** (taxadmin.org/report-a-data-breach), and check whether your **state attorney general** must be notified (most states require it).
4. **FTC:** if **500 or more** people's unencrypted information was taken, the FTC Safeguards Rule requires notifying the FTC **within 30 days** of discovery (online form on ftc.gov).
5. **Insurance & experts:** contact your insurance company; consider a security professional to assess what was taken.
6. **Clients & credit bureaus:** send notification letters to affected clients; contact Equifax, Experian, and TransUnion.

*This is a summary, not legal advice. Your legal obligations depend on your situation and state.*

---

## 9. Message to send clients (launch: early January 2027)

```
Hi [name],

Tax season is almost here! This year you can send me your documents securely at:

eliotaxllc.com

Tap "Upload my documents," sign in with Google, and add your files. Phone photos are fine. It takes about two minutes.

No Google account, or have questions? Just reply and we'll figure it out.

Thanks!
[your name]
elioTax LLC
```

Shortcut for later reminders: **eliotaxllc.com/upload** goes straight to the form.

---

## 10. Where things are

| What | Where |
|---|---|
| Website | https://eliotaxllc.com (published from the `site/` folder by GitHub) |
| Upload form (client link) | https://forms.gle/7FcPZm8cmSSvmp8K7 |
| Project + history | https://github.com/eliotaxllc/eliotaxllc-website |
| Domain + DNS | Namecheap → Domain List → eliotaxllc.com |
| Page text (source of truth) | `CONTENT.md` |
| Plan and decisions | `SPEC.md` |
| Where we left off / DNS records | `handoff.md` |
| Your WISP notes (private, on this computer only) | `private/WISP-notes.md` |
