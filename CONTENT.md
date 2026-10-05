# CONTENT.md: page text, colors, and images

**Status:** ✅ APPROVED by the owner, 2026-10-05 (M3)

This file is the approved source for everything on the page. M4 builds the page from it word for word. To change the wording later, change it here first.

---

## Page text

Tone: warm and personal ("I"), short sentences, plain words.

### Browser tab title
elioTax LLC | Secure Document Upload

### Link preview (what people see when you text or email the link)
- **Title:** elioTax LLC | Secure Document Upload
- **Description:** The official, secure place to send your tax documents to elioTax LLC.
- **Image:** `site/assets/og-image.png`

### Top of the page (everything here must fit on a phone screen without scrolling)

*[Logo. Alt text for screen readers: "elioTax LLC"]*

# Send your tax documents to elioTax LLC

This is the official, secure place to upload them. It takes about two minutes, and I'll take it from there.

**[ Upload my documents ]** ← the button

<small>Opens a secure Google Form. You'll sign in with your Google account.</small>

### How it works

1. Tap **Upload my documents**.
2. Sign in with Google. Google asks so I know who sent each file. You type your password on Google's own page, and I never see it.
3. Enter your name, pick the tax year, and add your files. Phone photos are fine. Just make sure each page is flat, well lit, and easy to read.
4. Tap **Submit**. You'll see a thank-you message. Have more to send? Come back anytime and upload again.

### What to send

Common documents:

- W-2s from every job
- 1099s (bank interest, investments, freelance or gig work, retirement, unemployment)
- 1098s (mortgage interest, student loan interest, college tuition)
- Form 1095-A, if you had health insurance through the Marketplace
- Last year's tax return, if you're new to elioTax

Not sure if you need something? Send it anyway. I'll sort it out.

### How your documents are protected

- The connection is encrypted. Look for the padlock in your browser's address bar.
- Your files go into a private folder that only I can open. Other clients can't see your files.
- Google requires you to sign in before you upload, so every file is tied to the person who sent it.
- Please don't type Social Security numbers, bank account numbers, or passwords into the note box. If a document already shows them, that's fine. Upload it as is.
- This page's official address is **eliotaxllc.com**. If you ever get an unexpected request for your tax documents, check with me before you send anything.

### Need help?

**No Google account, or have a question?** Reach out to me the way you usually do, and we'll find another way to get your documents to me. You can also create a free Google account using the email address you already have.

**Upload not working?** If you're signed in to more than one Google account, open the link in a private or incognito window and sign in with just one account.

### Privacy

- **What I collect:** your name, the email address of the Google account you sign in with, the tax year, any note you write, and the files you upload.
- **How I use it:** only to prepare your tax return and to contact you about it.
- **Who sees it:** your information is never sold or shared.
- **Where it's kept:** in my private Google Drive. Google runs the upload form, and Google's privacy policy covers your Google sign-in.
- **How long I keep it:** only as long as I need it for your return and as required by law. Then I delete it. *(Finalize in M7.)*
- **This website** doesn't use cookies, trackers, analytics, or ads.

### Footer
© 2026 elioTax LLC *(update the year each January)*

---

## Colors

From your designer's color sheet. Contrast was checked against WCAG AA, the web accessibility standard: at least 4.5:1 for text, and 3:1 for outlines and focus rings.

| Role | Hex | Used for |
|---|---|---|
| Brand navy | `#1E255E` | Headings, the button, links, keyboard focus outline |
| Brand green | `#72BF44` | **Decoration only** (accent bar, check marks, the dot). Never for text. |
| Body text | `#2B2F42` | Paragraphs |
| Muted text | `#5B6075` | Small notes, footer |
| Light tint | `#F3F5FA` | Background panels |
| Hover navy | `#2E3884` | Button when hovered |
| White | `#FFFFFF` | Page background, button text |

**Contrast results** (calculated with the WCAG formula):

| Pairing | Ratio | Needs | Result |
|---|---|---|---|
| Navy text on white | 14.18:1 | 4.5:1 | ✅ |
| Body text on white | 13.22:1 | 4.5:1 | ✅ |
| Muted text on white | 6.22:1 | 4.5:1 | ✅ |
| Navy text on light tint | 13.00:1 | 4.5:1 | ✅ |
| Body text on light tint | 12.12:1 | 4.5:1 | ✅ |
| Muted text on light tint | 5.70:1 | 4.5:1 | ✅ |
| White text on navy button | 14.18:1 | 4.5:1 | ✅ |
| White text on hover navy | 10.42:1 | 4.5:1 | ✅ |
| Navy focus outline vs white | 14.18:1 | 3:1 | ✅ |
| Green text on white | 2.27:1 | 4.5:1 | ❌ never use green for text |
| White text on green | 2.27:1 | 4.5:1 | ❌ never use green for text |

**Font:** each device's built-in font (`system-ui`, falling back to Segoe UI, Roboto, Helvetica, Arial). Nothing is downloaded, and the logo carries the brand look.

---

## Images

| File | What it is |
|---|---|
| `site/assets/logo.svg` | Full logo as a vector (sharp at any size, 3.8 KB). Converted directly from the original `.ai` design file. |
| `site/assets/icon.svg` | Browser-tab icon (favicon option C): white "e" + green dot on a navy tile |
| `site/assets/favicon.ico` | Same icon for older browsers (16, 32, and 48 px) |
| `site/assets/apple-touch-icon.png` | Same icon at 180 px for iPhone home screens |
| `site/assets/og-image.png` | Link-preview picture (1200×630) |
| `brand/form-header.png` | Google Form header banner (1600×400), white logo on navy. Not used on the website. |
| `brand/ElioTax_FinalLogo_Large.png` | Original logo PNG (transparent background). The only original published to GitHub. |

The other originals (`.ai`, `.pdf`, `.jpg`) stay on this computer only (see `.gitignore`). The PDF and JPG contain hidden personal details from the designer's computer. Keep your own private backup of them.

---

## Notes for M4 (building the page)

*Built in M4 (2026-10-05). The page also repeats the Upload button after the checklist (owner approved).*

- The button goes to the Google Form: **https://forms.gle/7FcPZm8cmSSvmp8K7**. Keep this link in one clearly marked place (decision D9).
- Section order: top (logo, headline, intro, button) → How it works → What to send → How your documents are protected → Need help? → Privacy → footer.
- **Not legal advice:** federal privacy rules for tax preparers (the FTC's rules under the Gramm-Leach-Bliley Act, or GLBA) may require a formal privacy notice. The privacy section above is a plain summary, not a formal notice. Make sure it matches anything else you tell clients.
