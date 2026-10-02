---
title: "Feedback"
aliases:
  - /docs/feedback/
  - /docs/resources/feedback/
---

We aim to make our documentation clear and useful so you can find answers independently. If you have a question or get stuck, please get in touch. Your feedback helps us understand what’s missing or unclear and improve the docs for everyone.

For example, we appreciate feedback about:

- Experiences with Quollix and the website
- Legal texts that could be improved
- The topics listed below:

| Topic                  | Use this for                                                                                                                                                                      | Action                                                                                                                       |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Questions and help     | Questions about Quollix or its documentation, including getting started or getting stuck.                                                                                         | <button type="button" class="feedback-draft-button" onclick="window.openContactMailDraft('question')">Open draft</button>    |
| Security vulnerability | Responsible disclosure or suspected vulnerabilities in Quollix. Please read [Responsible disclosure]({{< relref "docs/contact/responsible-disclosure.md" >}}) first.              | <button type="button" class="feedback-draft-button" onclick="window.openContactMailDraft('security')">Open draft</button>    |
| Bug report             | Reproducible behavior that seems incorrect.                                                                                                                                       | <button type="button" class="feedback-draft-button" onclick="window.openContactMailDraft('bug')">Open draft</button>         |
| Suggest an improvement | Feature ideas, additional official apps, [website text improvements]({{< relref "docs/project/community/contributing/website.md" >}}), and workflows that feel confusing or slow. | <button type="button" class="feedback-draft-button" onclick="window.openContactMailDraft('improvement')">Open draft</button> |

<script>
  const feedbackEmailAddress = 'contact@quollix.org'

  const openMailDraft = (emailAddress, subject, body) => {
    const encodedSubject = encodeURIComponent(subject)
    const encodedBody = encodeURIComponent(body)

    window.location.href = `mailto:${emailAddress}?subject=${encodedSubject}&body=${encodedBody}`
  }

  const contactMailDrafts = {
    question: {
      subject: 'Quollix feedback: Question or help',
      body: `Hi Quollix team,

What I am trying to do:

What I have tried so far (if anything):

Where I got stuck or what I would like to understand:
`
    },
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

Feedback can also be sent directly to [contact@quollix.org](mailto:contact@quollix.org).
