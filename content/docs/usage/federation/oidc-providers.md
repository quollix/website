---
title: "OIDC providers"
weight: 0
---

Also see the [federation article]({{<relref "docs/usage/federation">}}).

This page lists external OIDC providers that users can use to sign in to Quollix. When an administrator adds an OIDC provider, Quollix shows that provider on the sign-in page. Users can click the provider button to sign in with that external OIDC provider.

Quollix supports sign-in through external identity providers using standards-based OpenID Connect. It is primarily tested with Quollix as the OIDC provider. Other OIDC-compatible providers may work, but provider-specific behavior is not actively tested by the Quollix project, at least not yet. If you use Quollix with another provider, feedback and integration reports are welcome through the [feedback page]({{< relref "docs/feedback.md" >}}).

When a user signs in through an external OIDC provider, Quollix stores a linked sign-in method for that user. If the provider is deleted, those linked sign-in methods are removed and affected users can no longer use that provider to sign in until it is configured again.

Deleting an external OIDC provider does not delete local Quollix user accounts. Administrators can still manage the user locally and enable password sign-in.

If the deleted provider was the only sign-in method for a user, that user can no longer sign in until an administrator enables password sign-in.
