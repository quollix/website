---
title: "Users"
weight: 30
---

To access private apps in the Quollix, you need a local account. The Users page enables you to create and delete these accounts. Users with the "User" role can only access apps and their own account and have no access to administrative features.

## Inviting Users and Password Reset

Administrators can generate an invitation link for a user. When the user opens the link, they are prompted to set a password, which completes the account creation process. If a user forgets his password, an administrator can generate a new link to allow them to set a new one.

## Why Does User Creation Require an Email Address?

Some apps that use Quollix to sign you in require an email address as part of the OpenID Connect (OIDC) account information. Therefore, Quollix requires this field for compatibility, but does not send the address to us. It is visible only to you and the apps you sign in to, so it can be a non-real address like `user@example.invalid`.
