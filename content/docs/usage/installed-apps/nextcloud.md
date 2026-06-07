---
title: Nextcloud
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [nextcloud.com](https://nextcloud.com) |
| Source code | [github.com/nextcloud/server](https://github.com/nextcloud/server) |
| License | [AGPL-3.0](https://github.com/nextcloud/server/blob/master/COPYING) |
| ARM64 support | Supported |
| OIDC client | Official plugin |
| Business model | Open-source server with enterprise subscriptions, support, and hosted/provider options available separately. |

## Initial setup

On your first visit, enter an admin username and password. Click 'Install', then skip the remaining setup steps until you reach the home page. This creates a local admin account.

## Single Sign-On

The fastest way to connect Nextcloud to Quollix via OIDC is from the Nextcloud container command line. Open a terminal session on the Quollix device, then enter the container with:

```
docker exec -it quollix_nextcloud_nextcloud bash
```

Alternatively, use the Quollix Terminal page to open a terminal in the Nextcloud service.

Replace the `<placeholders>` and execute the following commands:

```bash
# Install OIDC user backend app
php occ app:install user_oidc
# Allow Nextcloud to connect to OIDC providers and other services on private/internal networks.
php occ config:system:set allow_local_remote_servers --type=boolean --value=true
# Add Quollix as auth provider, Client ID/Secret can be found in OIDC page in Quollix
php occ user_oidc:provider quollix --clientid '<client-id>' --clientsecret '<client-secret>' --discoveryuri 'https://quollix.<server-host>/.well-known/openid-configuration'
```

## Syncing via Nextcloud Client

Nextcloud provides desktop and mobile client applications that sync files automatically. To use a Nextcloud client, set the Nextcloud access policy in Quollix to 'Public' so the client is not blocked by the custom Quollix authentication mechanism.

## Updates

Quollix can update the Nextcloud container. Installed Nextcloud apps/plugins are preserved but are not updated automatically. If OIDC login or another app stops working after the update, run this in the Nextcloud container:

```
php occ app:update --all
```
