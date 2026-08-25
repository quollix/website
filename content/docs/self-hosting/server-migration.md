---
title: "Server migration"
---

Server migration means moving Quollix and app data from one server to another. This can be useful when switching cloud providers, upgrading hardware, or moving between self-hosted and cloud infrastructure.

## Old server

- Backups need to be enabled in [Backup server]({{< relref "docs/usage/settings/backup-server.md" >}}) settings.
- Open [Installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) and create a backup of each app.
  - First, back up all apps except Postgres.
  - Last, back up the Postgres app.

## New server

- Install Quollix using the [production setup]({{< relref "docs/getting-started/production-setup.md" >}}) guide until you can sign in to Quollix on the new server.
  - Use the same Quollix Docker image tag as the old server to avoid compatibility issues.
- Configure the same [backup server]({{< relref "docs/usage/settings/backup-server.md" >}}) settings.
- Open [Backups]({{< relref "docs/usage/backups.md" >}}) and restore all apps.
  - First, restore the Postgres app. Restoring it replaces the current session, so you need to sign in again afterwards.
  - Then restore all other apps.
- Update DNS so the domain points to the new server IP address.
