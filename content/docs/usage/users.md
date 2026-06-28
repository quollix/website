---
title: "Users"
weight: 30
---

To access private apps in Quollix, you need a local account. The Users page enables you to invite, disable, and delete these accounts. Users with the "User" role can only access apps and their own account and have no access to administrative features.

## Inviting Users and Password Reset

Administrators can generate an invitation link for a user. When the user opens the link, they are prompted to set a password, which completes the account creation process. If a user forgets his password, an administrator can generate a new link to allow them to set a new one.

## Disabling Users

Administrators can disable a user without deleting the account. A disabled user cannot sign in, and existing sessions for that user are removed. The user can be enabled again later.

## Why Does User Creation Require an Email Address?

Some apps that use Quollix to sign you in require an email address as part of the App SSO account information. Therefore, Quollix requires this field for compatibility, but does not send the address to us. It is visible only to you and the apps you sign in to, so it can be a non-real address like `user@example.invalid`.

## Editing Users

Administrators can change a user's username and email address. For OIDC clients, Quollix identifies users by the Quollix domain and the user's stable internal ID, not by the username or email address. Therefore, changing these fields usually does not break OIDC sign-in.

However, username and email are still sent to OIDC clients, including apps, as OIDC profile information. Some apps may cache these values, require unique usernames or email addresses, or already have local accounts with matching values. If an app behaves unexpectedly after such a change, check the user mapping or account settings inside that app.
