---
title: "Vaultwarden"
---

{{< app-info >}}

## Resources

| Resource       | Description                                                                                                  |
| -------------- | ------------------------------------------------------------------------------------------------------------ |
| Website        | [vaultwarden.net](https://www.vaultwarden.net)                                                               |
| Source code    | [github.com/dani-garcia/vaultwarden](https://github.com/dani-garcia/vaultwarden)                             |
| License        | [AGPL-3.0](https://github.com/dani-garcia/vaultwarden/blob/main/LICENSE.txt)                                 |
| ARM64 support  | Supported                                                                                                    |
| OIDC client    | Native                                                                                                       |
| Business model | Fully open source, community-maintained, donation-supported project; unofficial Bitwarden-compatible server. |

## Admin panel access

- In Quollix, go to `Apps → Secrets` and copy `SECRET_ADMIN_TOKEN` for Vaultwarden
- Visit admin panel: `https://vaultwarden.<your-host>/admin`
- Enter the admin token

## Single sign-on

OpenID Connect is enabled by default by Quollix.
When opening Vaultwarden, the sign-in page displays the option “Use Single Sign-On”.

## Syncing via Bitwarden client

Vaultwarden mimics the Bitwarden backend while remaining compatible with the Bitwarden API.
As a result, you can use the official [Bitwarden desktop and mobile apps, and browser extensions](https://bitwarden.com/download/), to sync your vault.
To use a Bitwarden client, set the Vaultwarden access policy in Quollix's [installed apps page]({{< relref "docs/usage/installed-apps" >}}) to 'Public'.
Otherwise, requests from the client will be blocked by Quollix's authentication mechanism.

## Storing Quollix recovery configurations in Vaultwarden

If you store your Quollix admin credentials and [backup server settings]({{< relref "docs/usage/settings/backup-server.md" >}}) in Vaultwarden, a server failure could leave both Vaultwarden unavailable. If your Bitwarden client then requires you to sign in through Quollix, you may be unable to access the credentials.

{{< alert title="Warning" color="warning" >}}
If you store these details in Vaultwarden, keep an independent copy. Otherwise, a server failure could leave you unable to restore your backups and result in permanent data loss.
{{< /alert >}}

The simplest option is to export your vault as unencrypted JSON (**Vaultwarden → Tools → Export**) and store it securely outside Quollix.
