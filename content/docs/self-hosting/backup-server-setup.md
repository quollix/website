---
title: "Backup server setup"
---

This guide shows how to set up a backup server for Quollix. For production use, this can serve as the external backup system in the [3-2-1 backup strategy]({{< ref "docs/self-hosting/backup-strategy.md" >}}).

There are two setup options:

- local storage for testing
- external storage for production

## Local Testing

1. Start Quollix.
1. Create this `docker-compose.yml`:

```yml
services:
  ssh-server:
    image: linuxserver/openssh-server:latest
    container_name: dummy_backup_server
    environment:
      - PASSWORD_ACCESS=true
      - USER_NAME=sshadmin
      - USER_PASSWORD=sshpassword
    ports:
      - "127.0.0.1:2222:2222"
    networks:
      - quollix_postgres

networks:
  quollix_postgres:
    external: true
```

1. Start the backup server:

```bash
docker compose up -d
```

Use these values on the Quollix **Settings -> Backup server** page:

| Field | Value |
| --- | --- |
| Remote Host | `dummy_backup_server` |
| SSH Port | `2222` |
| SSH User | `sshadmin` |
| SSH Password | `sshpassword` |

Then follow the remaining steps on the [Remote Backup settings page]({{< ref "docs/usage/settings/backup-server.md" >}}).

## External Storage

This example uses [Hetzner Storage Box](https://www.hetzner.com/storage/storage-box). Quollix is not affiliated with or sponsored by Hetzner.

1. Create a Hetzner account.
1. Open the [Hetzner Cloud Console](https://console.hetzner.com/projects).
1. Create a project.
1. Open **Storage -> Storage Boxes**.
1. Create a Storage Box.
1. In **Access**, add your public SSH key and define a password.
1. Click **Create & Buy now**.
1. Wait until the Storage Box has been created.
1. Open the three-dot menu and select **Change settings**.
1. Enable **SSH Support** and **External Reachability**.
1. Save the settings.
1. Open the new Storage Box and copy its host and user values.

Use these values on the Quollix **Settings -> Backup server** page:

| Field | Value |
| --- | --- |
| Remote Host | `uXXXXXX.your-storagebox.de` |
| SSH Port | `23` |
| SSH User | `uXXXXXX` |
| SSH Password | (the password you set above) |

The SSH port we need on the Hetzner Storage Box is explicitly `23`, not `22`.

Then follow the remaining steps on the [Remote Backup settings page]({{< ref "docs/usage/settings/backup-server.md" >}}).

### Automatic Snapshots

In the Hetzner Console, open the Storage Box, go to **Snapshots**, and enable automatic snapshots.

These snapshots add a recovery path for worst-case incidents. If a compromised Quollix server is used to delete both the server data and the Storage Box data, the provider-managed snapshots can restore the Storage Box. After that, configure the same backup server on a clean Quollix server and restore the app backups.
