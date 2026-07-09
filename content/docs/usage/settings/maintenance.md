---
title: "Maintenance"
weight: 30
---

The features **Automatic Updates** and **Automatic Backups** are enabled by default and are handled by the Maintenance Agent in the background. The Maintenance Agent runs once a day.

If both options are enabled, the Maintenance Agent compares the version of each locally installed app with the latest version in the App Store. If an update is available, a backup is created, then the update is applied. If the update fails, you can restore the previous version.

In **Preferred time for maintenance (UTC)**, you can select a time window in which maintenance may run. Choose a period when Quollix is unlikely to be used by your users, such as around 04:00 in your local time zone. This setting uses UTC (London time). The Maintenance Agent selects a random time within the window to spread app updates across installations and avoid excessive simultaneous load on the App Store.

If remote backups are enabled on the **Settings** page, the Maintenance Agent will also create backups on the remote backup server.

## Retention Policy

To free up storage space, the Maintenance Agent applies a retention policy. It keeps only the:
* last 5 pre-update backups
* last 7 daily backups
* last 4 weekly backups
* last 12 monthly backups
* last 2 yearly backups

This means that backups are kept for up to a year, and older and intermediate backups are automatically deleted. On the **Backups** page, you can still manually delete all backups, including automatically created ones. There, you can distinguish the backup type by the backup descriptions, which are either "auto backup" or "manual backup". Manually created backups are not deleted by the retention policy and are kept until you manually delete them.

Backups are incremental and use disk space efficiently. Subsequent backups store only the differences from the previous backup.

Changing the retention policy can delete backups during the next maintenance run if they no longer match the new policy. Review the configured limits before saving stricter retention settings.

When maintenance is started manually, updates, backups, and cleanup tasks run immediately. This can temporarily increase CPU and disk usage, and apps may be unavailable while they are being updated.

## Artifacts Cleanup

The Maintenance Agent also removes unused artifacts, such as Docker images, to free up disk space. Docker volumes are not removed automatically. To remove volumes that are no longer needed, delete the associated app.
