---
title: "Federation"
---

{{< ui-location "Federation" >}}

Federation connects Quollix servers and compatible OIDC clients through shared identity providers. It is based on two features:

* Quollix can act as an [OIDC provider]({{<relref "docs/usage/federation/oidc-providers.md">}})
* Quollix can act as an [OIDC client]({{<relref "docs/usage/federation/oidc-clients.md">}})

You can combine these features to create a federation. For example, one Quollix server can act as the provider, and multiple Quollix servers can be configured as clients that trust that provider.

## Setup example

Assume you have two Quollix servers available under these domains:

* `quollix.my-provider.example.com`
* `quollix.my-client.example.com`

Both servers must be configured with the correct [base domain]({{< relref "docs/usage/settings/base-domain">}}) and must have a valid, signed [certificate]({{<relref "docs/usage/settings/certificate">}}). Otherwise, the setup will not work.

Configuration:

* On the provider server, go to the Federation/Clients page and create an OIDC client using `quollix.my-client.example.com` as the domain. Copy the generated OIDC client credentials.
* On the client server:
  * Go to the Federation/Providers page and create an OIDC provider using `quollix.my-provider.example.com` as the domain. Paste the generated OIDC client credentials from the provider server.
  * Sign out and go to the sign-in page. You should see the provider you just created as a sign-in option. Click the provider button to be redirected to the provider sign-in page. Then sign in with the provider's admin account. After sign-in, you are redirected back to the client server and signed in with a newly created account.

## Miscellaneous

The client server must be able to connect to the provider server, but the provider server does not need to connect back to the client. For example, the provider server can run on a public server with a public IP address, while the client server and its users are in a private LAN.

## Is Quollix part of the Fediverse?

No. Quollix federation is identity federation. It lets users sign in to multiple Quollix servers or compatible OIDC clients through a shared identity provider. The Fediverse usually refers to application-level federation, commonly through protocols such as ActivityPub, where different servers exchange application data.

You can still use Quollix to deploy apps that participate in the Fediverse, if suitable app definitions are available. In that setup, the app provides the Fediverse protocol support, while Quollix provides hosting and the option for OIDC-based sign-in.
