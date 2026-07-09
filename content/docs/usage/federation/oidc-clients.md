---
title: "OIDC clients"
weight: 50
aliases:
  - /docs/usage/oidc-clients/
---

Also see the [federation article]({{<relref "docs/usage/federation">}}).

This page lists generic OIDC clients that use Quollix as their OIDC provider. These clients are external services such as other Quollix servers. Apps that are OIDC clients are handled separately by the [App SSO feature]({{<relref "docs/usage/app-sso.md">}}).

Deleting an OIDC client immediately prevents that client from using Quollix as its OIDC provider.

Regenerating credentials invalidates the existing OIDC client credentials. After regeneration, update the credentials in the client service so that users can sign in again.
