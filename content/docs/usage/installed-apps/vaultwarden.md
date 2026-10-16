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

OpenID Connect is enabled by default by Quollix. When opening Vaultwarden, the sign-in page displays the option “Use Single Sign-On”.

## Syncing via Bitwarden client

Vaultwarden mimics the Bitwarden backend while remaining compatible with the Bitwarden API. As a result, you can use the official Bitwarden desktop and mobile applications, as well as the Bitwarden browser extension, to sync your vault. To use a Bitwarden client, set the Vaultwarden access policy in Quollix to 'Public'. Otherwise, requests from the client will be blocked by Quollix's authentication mechanism.

## Storing Quollix recovery configurations in Vaultwarden

Using Vaultwarden as a single place to manage secrets is convenient. However, there are a few risks to consider when storing Quollix server data there.

### Catastrophic lockout

Assume you have a Quollix server and an external [backup server]({{< relref "docs/usage/settings/backup-server" >}}) configured. If the Quollix server crashes, the credentials needed to access the Quollix server or restore backups may be inside the unavailable Vaultwarden instance. Your Bitwarden client may also require you to sign in again, leaving you unable to access the cached vault on your local PC. You cannot sign in while Vaultwarden or Quollix is unavailable. This circular dependency can leave you locked out of both your server and its backups.

{{< alert title="Warning" color="warning" >}}
Without proper preparation, you could lose access to all data on your Quollix server.
{{< /alert >}}

### Exporting a vault backup

To prevent catastrophic lockout, you need an independent backup of recovery configuration. Potential approaches are described below:

- Assuming you have set up Quollix server and configured a [backup server]({{< relref "docs/usage/settings/backup-server" >}})
- Install the Vaultwarden app
- Store Quollix recovery settings in Vaultwarden, including:
  - SSH credentials for your Quollix server
  - [Backup server settings]({{< relref "docs/usage/settings/backup-server" >}}), including access credentials and the data encryption password
  - Store private SSH keys as text in vault items, since JSON exports omit attachments
- Choose one of the following options to create an independent backup recovery option:
  - Write the data down and store the sheet safely
  - Use Vaultwarden's export feature: **Vaultwarden → Tools → Export**
    - Export the vault as unencrypted JSON and store it safely, for example on a USB stick in a secure location
    - Export the vault as **.json (Encrypted)** and select **Password protected**. Keep the export password accessible outside Vaultwarden.
      - We recommend including the date and the Vaultwarden server Docker image version in the file name, for example: `2026-01-02_vault-backup_1.2.3.json`
      - Do not use an **Account restricted** export as it cannot be recovered in this case.
- Keep two copies of your recovery information outside Quollix in separate locations and update both whenever your recovery credentials change.
- Test that importing the exported file restores the data

### Recovering an encrypted export

If you did not choose **.json (Encrypted)**, you can skip this section.

You can recover the encrypted export's contents on your local PC. With Docker installed, create `docker-compose.yml`:

```yaml
services:
  vaultwarden:
    image: vaultwarden/server:<replace-by-vaultwarden-version-used-for-export>
    environment:
      DOMAIN: "https://localhost"
    tmpfs: ["/data"]

  caddy:
    image: caddy:2
    ports: ["127.0.0.1:443:443"]
    configs:
      - source: caddyfile
        target: /etc/caddy/Caddyfile
    tmpfs: ["/data", "/config"]

configs:
  caddyfile:
    content: |
      https://localhost {
          tls internal
          reverse_proxy vaultwarden:80
      }
```

Replace the placeholder with the Vaultwarden server Docker image version used for the export, ideally recorded in the export file name as suggested above. Start the temporary server:

```sh
docker compose up -d
```

Open `https://localhost` in a browser window and accept the certificate warning for this temporary local instance. Caddy generates the certificate automatically. Create a temporary account, then open **Tools → Import** and select **Data → File format → Bitwarden (json)**. Enter the export password when prompted.

After retrieving the credentials, close the browser window and run:

```sh
docker compose down
```

### Restore Quollix and Vaultwarden

Once you have restored the recovery configurations, you can

- use the Quollix server access to check if the server can be recovered
- install Quollix on a new server, then use the backup server credentials to configure backups and restore the apps.
