---
title: "Backup server"
---

{{< ui-location "System" "Settings" "Backup server" >}}

{{< alert title="Note" color="warning" >}}
We strongly recommend that you enable this feature. If your hard drive becomes irreversibly damaged, external backups may be the only way to recover your data.
{{< /alert >}}

Quollix uses the **restic** tool in the backend, which provides end-to-end encryption. This means that even if someone intercepts the traffic or gains access to the backup server, they cannot read your encrypted backup data.

{{< alert title="Note" color="warning" >}}
Always keep a separate copy of your backup server settings, including the host, SSH credentials, SSH known hosts, and Restic encryption password. Without these settings, your backup data cannot be restored if this Quollix server is lost.
{{< /alert >}}

## Usage guide

1. On the Quollix Settings → Remote Backup page, fill in all required fields except **SSH Known Hosts**. The **Remote Host** can be either a domain or an IP address.
1. Click the **GET KNOWN HOSTS** button. This uses the **Remote Host** and **SSH Port** to fetch the backup server’s public SSH keys. The **SSH Known Hosts** field will then be populated with the public SSH keys of the backup server.
1. Verify that the received keys match those of the actual server. You can do this by running `ssh-keyscan -p <port> -H <host>` from a separate trusted machine and comparing the output. For all future connections, only servers matching the keys in **SSH Known Hosts** will be trusted. This protects against man-in-the-middle (MITM) attacks.
1. Click the **TEST CONNECTION** button. If it fails, review your settings. If successful, it confirms that Quollix can connect to the remote server for backups.
1. Check the **Enable Remote Repository** option and click **SAVE** to activate remote backups.
1. Test: Create a backup of an app and check the [Backups]({{< relref "docs/usage/backups.md" >}}) page to see that a remote backup of that app has been created.

## Why password for authentication instead of SSH keys?

Quollix uses a password because it must store a credential for backup server authentication. Quollix does not use an SSH key, because when the Quollix server is compromised, a stored password and a stored private key provide similar backup-server access, while a password is simpler to manage. **Known Hosts** still verifies the server identity.

## Resetting backup settings

Resetting the backup server settings removes the stored connection settings and credentials, including the Restic encryption password. Existing backups may become inaccessible if you do not keep a separate copy of the required settings.

## Purging the backup repository

Purging the backup repository permanently deletes all backups in the configured repository and resets the backup server configuration. Use this only when you intentionally want to remove all backup data.
