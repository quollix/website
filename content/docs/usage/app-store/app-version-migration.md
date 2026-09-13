---
title: "App version migration"
aliases:
  - /docs/self-hosting/app-version-migration/
---

App version migration means updating an app through one or more intermediate versions instead of jumping directly to the latest version. This could apply when an app has been stopped and is excluded from automatic updates for a longer time. Some apps need to update to intermediate versions first to migrate data correctly.

## Enable backups

{{< alert title="Note" color="warning" >}}
App updates that perform data migrations can fail or make an app unusable.
{{< /alert >}}

Before updating an app through migration versions, make sure the [backup server]({{< relref "docs/usage/settings/backup-server.md" >}}) is enabled.

## Automatic migration

Specific app versions can be marked as migration checkpoints.
Quollix updates the app step by step along the required migration path.
The [maintenance agent]({{< relref "docs/usage/settings/maintenance/" >}}) performs one migration step per day.
To move faster, open [installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) and select **Update** for the app.
After each update, check that the app starts successfully and still works before running the next update.

## Manual migration

If migration checkpoints are missing, you can follow the migration path manually:

- Open [App Store]({{< relref "docs/usage/app-store/" >}}).
- Search for the app.
- Select the button in the **Version** column.
- Find the next required version and update the app to that version.
  - A pre-update backup is created automatically in case the update fails.
- Wait until the app has started successfully and can be opened from [installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}).
- Repeat until the app reaches the target version.
