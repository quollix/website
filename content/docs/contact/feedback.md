---
title: "Feedback"
aliases:
  - /docs/feedback/
  - /docs/resources/feedback/
---

We appreciate feedback about:

- Quollix and the website
- Positive experiences with the project
- Legal and policy texts that are unclear, too broad, or missing important context
- The topics listed below

| Topic                  | Use this for                                                                                                                                                                      | Action                                                                                                                 |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Security vulnerability | Responsible disclosure or suspected vulnerabilities in Quollix. Please read [Responsible Disclosure]({{< relref "docs/contact/responsible-disclosure.md" >}}) first.  | <button type="button" class="feedback-draft-button" onclick="window.openContactMailDraft('security')">Open draft</button>    |
| Bug report             | Reproducible behavior that seems incorrect.                                                                                                                                       | <button type="button" class="feedback-draft-button" onclick="window.openContactMailDraft('bug')">Open draft</button>         |
| Suggest an improvement | Feature ideas, additional official apps, [website text improvements]({{< relref "docs/project/community/contributing/website.md" >}}), and workflows that feel confusing or slow. | <button type="button" class="feedback-draft-button" onclick="window.openContactMailDraft('improvement')">Open draft</button> |

<script>
  const feedbackEmailAddress = 'quollix-feedback@mailbox.org'

  const openMailDraft = (emailAddress, subject, body) => {
    const encodedSubject = encodeURIComponent(subject)
    const encodedBody = encodeURIComponent(body)

    window.location.href = `mailto:${emailAddress}?subject=${encodedSubject}&body=${encodedBody}`
  }

  const contactMailDrafts = {
    security: {
      subject: 'Quollix security: Vulnerability report',
      body: `Hi Quollix team,

I want to report a potential security vulnerability.

Summary:

Affected area or version:

Steps to reproduce:
1.
2.
3.

Potential impact:

Suggested disclosure handling:
`
    },
    bug: {
      subject: 'Quollix feedback: Bug report',
      body: `Hi Quollix team,

What I did:

What I expected:

What happened instead:

Steps to reproduce:
1.
2.
3.

How often it happens:
Always / Sometimes / Once
`
    },
    improvement: {
      subject: 'Quollix feedback: Improvement suggestion',
      body: `Hi Quollix team,

What I am trying to do:

What feels missing, confusing, or frustrating today:

Suggested improvement:

How this would help me:
`
    }
  }

  window.openContactMailDraft = (draftName) => {
    const draft = contactMailDrafts[draftName]

    openMailDraft(feedbackEmailAddress, draft.subject, draft.body)
  }
</script>

## Miscellaneous

Feedback can also be sent directly to [quollix-feedback@mailbox.org](mailto:quollix-feedback@mailbox.org).
