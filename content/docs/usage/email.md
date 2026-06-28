---
title: "Email"
---

The Email page lets you configure the SMTP server that Quollix uses to send email. Once configured, administrators can send invitation and password-reset links directly from the [Users]({{< relref "users.md" >}}) page via email instead of distributing these links manually.

You can customize the invitation email template at the bottom of this page according to your user onboarding preferences.

## OIDC Email Exposure

Some apps that use App SSO need an email address in the ID token or userinfo response. By default, Quollix can avoid exposing users' stored personal email addresses. If you enable real email exposure, connected apps may receive the actual email address stored for each user.

Consider two risks before enabling this setting:

- Connected apps can read and store users' real email addresses. This is especially relevant for third-party apps.
- Some apps treat email addresses as visible profile data. Depending on the app, one user's real email address may become visible to other users inside that app.
