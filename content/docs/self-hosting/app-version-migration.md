---
title: "App version migration"
---

App version migration means updating an app through one or more intermediate versions instead of jumping directly to the latest version. This could apply when an app has been stopped and is excluded from automatic updates for a longer time. Some apps need to update to older, intermediate versions first to migrate data correctly.

## Migration flow

- Ensure that the [backup server]({{< relref "docs/usage/settings/backup-server.md" >}}) is enabled.
- Open [App Store]({{< relref "docs/usage/app-store.md" >}}).
- Search for the app.
- Click the button in the **Version** column.
- Go to the row with the next required version and update the app.
  - A pre-update backup is created automatically, in case an update breaks the app.
- Wait until the app has started successfully and can be opened from [Installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}).
- Repeat until the app reaches the target version.
