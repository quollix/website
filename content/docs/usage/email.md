---
title: "Email"
---

{{< ui-location "System" "Email" >}}

## User management via email

Configure an SMTP server to enable these email feature.
Administrators can email invitation and password reset links directly from the [users]({{< relref "users.md" >}}) page instead of distributing the links manually.
You can customize the invitation email template according to your user onboarding preferences.

## OIDC email exposure

Some apps that use App SSO need an email address in the ID token or userinfo response.
By default, Quollix can avoid exposing users' stored personal email addresses.
If you enable real email exposure, connected apps may receive the actual email address stored for each user.

Consider two risks before enabling this setting:

- Connected apps can read and store users' real email addresses. This is especially relevant for third-party apps.
- Some apps treat email addresses as visible profile data. Depending on the app, one user's real email address may become visible to other users inside that app.
