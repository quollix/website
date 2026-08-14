---
title: App Single Sign-On
---

{{< ui-location "Apps" "SSO" >}}

When you install an app, Quollix automatically generates a client ID and client secret for browser-based sign-in using the OIDC authorization code flow. If the app supports this flow, users can sign in with their existing Quollix account. In the ideal setup, one central Quollix account can be used to sign in to every app.

Some apps are configured automatically to use these values and provide OIDC sign-in when they start. Other apps require manual configuration. For those apps, go to `Apps -> SSO` in Quollix, copy the app's client ID and client secret, and paste them into the matching fields in the app's own sign-in or authentication settings.

For app-specific guidance, see the list of official apps [on the App Store usage page]({{< relref "docs/usage/app-store.md">}}).
