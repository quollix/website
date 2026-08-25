---
title: "Maintenance policy"
---

{{< ui-location "Apps" "Maintenance" >}}

The Maintenance Policy page defines which apps are included when the [maintenance agent]({{< relref "settings/maintenance.md" >}}) runs. For each app, you can enable or disable automatic updates and automatic backups.

In most cases, keep both options enabled for every app. If an app update causes problems, you can temporarily disable automatic updates for that app while investigating or waiting for a compatible version. Keep automatic backups enabled so that current recovery points continue to be created.

[Stopped apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) are excluded from automatic updates. Some migrations only run when the updated app starts, so updating a stopped app could skip required migration logic and break the app.

Automatic updates for third-party apps install future versions from the app store without manual review. Enable them only for maintainers you trust.
