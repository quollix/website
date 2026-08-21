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
| Business model | Fully open source server with paid enterprise subscriptions for support, long-term maintenance, certified builds, and enterprise delivery. |

## Initial setup

On your first visit, enter an admin username and password. Click 'Install', then skip the remaining setup steps until you reach the home page. This creates a local admin account.

## Single Sign-On

The fastest way to connect Nextcloud to Quollix via OIDC is from the Nextcloud container command line. Open a terminal in the Nextcloud container using the [Terminal]({{< relref "../terminal.md" >}}) feature.

Install the OIDC user backend app:

```bash
php occ app:install user_oidc
```

Allow Nextcloud to connect to OIDC providers and other services on private/internal networks:

```bash
php occ config:system:set allow_local_remote_servers --type=boolean --value=true
```

Add Quollix as the OIDC provider. In Quollix, go to `Apps → SSO`, copy Nextcloud's client ID and client secret, and replace the `<placeholders>` below:

```bash
php occ user_oidc:provider Quollix --clientid '<client-id>' --clientsecret '<client-secret>' --discoveryuri 'https://quollix.<base-domain>/.well-known/openid-configuration'
```

Sign out and use the Quollix sign-in option.

## Syncing via Nextcloud Client

Nextcloud provides desktop and mobile client applications that sync files automatically. To use a Nextcloud client, set the Nextcloud access policy in Quollix to 'Public' so the client is not blocked by the custom Quollix authentication mechanism.

## Updates

Quollix can update the Nextcloud container. Installed Nextcloud apps/plugins are preserved but may not be updated automatically. If OIDC sign-in or another app stops working after the update, run this in the Nextcloud container:

```
php occ app:update --all
```

### Disable update notifications

Nextcloud may show administrator notifications when server updates are available. To disable these notifications, run:

```bash
php occ config:system:set updatechecker --type boolean --value=false
php occ app:disable updatenotification
```
