---
title: "Maintenance agent"
---

{{< ui-location "System" "Settings" "Maintenance agent" >}}

This page configures when the Maintenance Agent runs and how long automatic backups are kept. The agent runs automatic maintenance jobs in the background once a day. It uses the per-app [maintenance policy]({{< relref "docs/usage/maintenance.md" >}}) to decide which apps are included in automatic updates and automatic backups.

If automatic updates are enabled for an app, the Maintenance Agent checks the App Store, creates a backup, and applies available updates. If the update fails, you can restore the previous version.

In **Preferred time for maintenance (UTC)**, you can select a time window in which maintenance may run. Choose a period when Quollix is unlikely to be used by your users, such as around 04:00 in your local time zone. The default time zone is London time. The Maintenance Agent selects a random time within the window to spread app updates across installations and avoid excessive simultaneous load on the App Store.

If remote backups are enabled on the [Backup server]({{< relref "docs/usage/settings/backup-server.md" >}}) page, the Maintenance Agent will also create backups on the remote backup server.

## Retention policy

To free up storage space, the Maintenance Agent applies a retention policy. It keeps only the:

- last 5 pre-update backups
- last 7 daily backups
- last 4 weekly backups
- last 12 monthly backups
- last 2 yearly backups

This means that backups are kept for up to a year, and older and intermediate backups are automatically deleted. On the [Backups]({{< relref "docs/usage/backups.md" >}}) page, you can still manually delete all backups, including automatically created ones. The backup descriptions show which type of backup each entry is. Manually created backups are not deleted by the retention policy and are kept until you manually delete them.

Backups are incremental and use disk space efficiently. Subsequent backups store only the differences from the previous backup.

Changing the retention policy can delete backups during the next maintenance run if they no longer match the new policy. Review the configured limits before saving stricter retention settings. When maintenance is started manually, updates, backups, and cleanup tasks run immediately. This can temporarily increase CPU and disk usage, and apps may be unavailable while they are being updated.

## Artifacts cleanup

The Maintenance Agent also removes unused artifacts, such as Docker images, to free up disk space. Docker volumes are not removed automatically. To remove volumes that are no longer needed, delete the associated app.
