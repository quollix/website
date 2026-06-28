---
title: "Feedback"
weight: 45
---

We appreciate feedback about:

- Quollix and the website
- Positive experiences with the project
- Legal and policy texts that are unclear, too broad, or missing important context
- The topics listed below

> Note: This is not a general support channel. Feedback and contribution suggestions are reviewed when possible, but usually do not receive a response.

| Topic | Use this for | Action |
|-------|--------------|--------|
| Security vulnerability | Responsible disclosure or suspected vulnerabilities in Quollix. Please read the [Security Policy]({{< relref "legal/security.md" >}}) first. | <button type="button" class="feedback-draft-button" onclick="window.openSecurityFeedbackMail()">Open draft</button> |
| Bug report | Reproducible behavior that seems incorrect. | <button type="button" class="feedback-draft-button" onclick="window.openBugFeedbackMail()">Open draft</button> |
| Suggest an improvement | Feature ideas, additional official apps, [website text improvements]({{< relref "docs/community/contributing/website.md" >}}), and workflows that feel confusing or slow. | <button type="button" class="feedback-draft-button" onclick="window.openImprovementFeedbackMail()">Open draft</button> |

<script>
  window.openFeedbackMailWithTemplate = (subject, body) => {
    window.location.href = `mailto:quollix-feedback@mailbox.org?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`
  }

  window.openSecurityFeedbackMail = () => {
    const body = `Hi Quollix team,

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

    window.openFeedbackMailWithTemplate('Quollix security: Vulnerability report', body)
  }

  window.openBugFeedbackMail = () => {
    const body = `Hi Quollix team,

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

    window.openFeedbackMailWithTemplate('Quollix feedback: Bug report', body)
  }

  window.openImprovementFeedbackMail = () => {
    const body = `Hi Quollix team,

What I am trying to do:

What feels missing, confusing, or frustrating today:

Suggested improvement:

How this would help me:
`

    window.openFeedbackMailWithTemplate('Quollix feedback: Improvement suggestion', body)
  }
</script>

## Miscellaneous

Feedback can also be sent directly to [quollix-feedback@mailbox.org](mailto:quollix-feedback@mailbox.org).
