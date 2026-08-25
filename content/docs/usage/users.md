---
title: "Users"
---

{{< ui-location "Identity" "Users" >}}

To access private apps in Quollix, you need a local account. The Users page enables you to invite, disable, and delete these accounts. Users with the "User" role can only access apps and their own account and have no access to administrative features.

## Inviting users and password reset

Administrators can generate an invitation link for a user. When the user opens the link, they are prompted to set a password, which completes the account creation process. If a user forgets his password, an administrator can generate a new link to allow them to set a new one.

The invitation link contains only a temporary token, not a password. The token is valid for a limited time, can only be used once, and should be protected by HTTPS with a properly signed certificate.

{{< alert title="Note" color="warning" >}}
This section provides general information only and does not constitute legal advice. No responsibility or liability is assumed for how this information is used.
{{< /alert >}}

This design supports GDPR-conscious user onboarding because administrators do not need to send initial passwords. The invitation link is still account access material, so use a trusted communication channel where possible. Depending on your security requirements, suitable channels include:

- [Signal](https://signal.org) or WhatsApp for end-to-end encrypted delivery
- Email for common organization or community onboarding

## Disabling users

Administrators can disable a user without deleting the account. A disabled user cannot sign in, and existing sessions for that user are removed. The user can be enabled again later.

## Why does user creation require an email address?

Some apps that use Quollix to sign you in require an email address as part of the App SSO account information. Therefore, Quollix requires this field for compatibility, but does not send the address to us. It is visible only to you and the apps you sign in to, so it can be a non-real address like `user@example.invalid`.

## Editing users

Administrators can change a user's username and email address. For OIDC clients, Quollix identifies users by the Quollix domain and the user's stable internal ID, not by the username or email address. Therefore, changing these fields usually does not break OIDC sign-in.

However, username and email are still sent to OIDC clients, including apps, as OIDC profile information. Some apps may cache these values, require unique usernames or email addresses, or already have local accounts with matching values. If an app behaves unexpectedly after such a change, check the user mapping or account settings inside that app.
