---
title: "Vaultwarden"
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [vaultwarden.net](https://www.vaultwarden.net) |
| Source code | [github.com/dani-garcia/vaultwarden](https://github.com/dani-garcia/vaultwarden) |
| License | [AGPL-3.0](https://github.com/dani-garcia/vaultwarden/blob/main/LICENSE.txt) |
| ARM64 support | Supported |
| OIDC client | Native |
| Business model | Community-maintained, donation-supported project; unofficial Bitwarden-compatible server. |

## Setup

{{< alert title="Note" color="warning" >}}
For production setups, after installation, it is crucial to log in as admin and change the admin token as described below.
{{< /alert >}}

- Install and start Vaultwarden
- Visit admin panel: `https://vaultwarden.<your-host>/admin`
- Enter admin token: `quollix`
- Go to General Settings → Admin token / Argon2 PHC → set a secure token → Save

## Single Sign-On

OpenID Connect is enabled by default by Quollix. When opening Vaultwarden, the login page displays the option “Use Single Sign-On”.

## Syncing via Bitwarden Client

Vaultwarden mimics the Bitwarden backend while remaining compatible with the Bitwarden API. As a result, you can use the official Bitwarden desktop and mobile applications, as well as the Bitwarden browser extension, to sync your vault. To use a Bitwarden client, set the Vaultwarden access policy in Quollix to 'Public'. Otherwise, requests from the client will be blocked by Quollix's authentication mechanism.
