---
title: "Manual backup restore"
---

This guide shows how to restore backups from an SSH backup server to a local computer. It is useful when the Quollix server is unavailable and you want to inspect or recover backup data manually.

## Requirements

Before starting, make sure you have:

* backup server settings:
  * the backup server host
  * the SSH user
  * the SSH password
  * the Restic encryption password
* Installed tools:

```bash
sudo apt update
sudo apt install openssh-client sshpass restic
```

## Setup

Enter the required passwords and set the Restic repository:

```bash
read -rsp 'SSH password: ' SSHPASS; echo; export SSHPASS
read -rsp 'Restic password: ' RESTIC_PASSWORD; echo; export RESTIC_PASSWORD

export RESTIC_REPOSITORY='sftp::backups'
export RESTIC_SFTP_COMMAND='sftp.command=sshpass -e ssh -p <ssh-port> -s <ssh-user>@<host> sftp'
```

On first execution, accept the SSH host key once:

```bash
ssh -p <ssh-port> <ssh-user>@<host>
```

Output may look like this:
```
The authenticity of host '[<host>]:23 ([...]:23)' can't be established.
ED25519 key fingerprint is: SHA256:...
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Enter `yes` and press Enter to accept the host key. Then output may look like this:

```
Warning: Permanently added '[<host>]:23' (ED25519) to the list of known hosts.
u613270@u613270.your-storagebox.de's password:
```

Abort with CTRL+C since we don't want to create an actual SSH connection.

## Restore backups

List the available snapshots:

```bash
restic -o "$RESTIC_SFTP_COMMAND" snapshots
restic -o "$RESTIC_SFTP_COMMAND" snapshots | grep <app-name>
```

To restore a specific snapshot, copy its snapshot ID from `restic snapshots` and run:

```bash
restic -o "$RESTIC_SFTP_COMMAND" restore <snapshot-id> --target ./restored-backup
```

## Restored backup folder structure

In the folder `./restored-backup/source` will be the following files:

* **docker-compose.yml** for deploying the app
* **meta.yml** containing app metadata used by Quollix
* a list of docker volume folders containing the Docker volumes content. For example, restoring a backup of the Nextcloud app yields the folders:
  * quollix_nextcloud_mariadb
  * quollix_nextcloud_nextcloud
  * quollix_nextcloud_redis
