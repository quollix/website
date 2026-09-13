---
title: "App Store"
no_list: true
---

{{< ui-location "Apps" "Store" >}}

This article explains the **App Store page** in the Quollix GUI. The actual [App Store]({{< relref "docs/project/app-store/_index.md" >}}) is a separate online service. The App Store lets you search and install apps on your Quollix server with just a few clicks. By default, the latest version is suggested for installation, but you have the option to install an older version.

Quollix does not depend on the App Store. You can manually upload apps to, or download apps from, your Quollix server on the [installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) page. The App Store is just the most convenient way to install and update apps.

## Versions page

The button in the **Version** column opens the available versions of an app. It handles both installation and updates to specific versions, depending on whether the app is already installed.

The versions page shows migration checkpoints for updates that should go through intermediate versions. See [app version migration]({{< relref "app-version-migration.md" >}}) for details.

## Why do some versions have the same number?

The visible version usually follows the [main service]({{< relref "docs/project/terminology.md" >}}) in the [app definition]({{< relref "docs/project/terminology.md" >}}). For example, a Nextcloud app version normally reflects the Nextcloud container version. An app definition can still change even when the main service version stays the same. App maintainers may update supporting services such as databases or adjust the Docker Compose configuration. In those cases, the App Store can contain entries with the same version.

Quollix uses the newest version timestamp to decide which entry is the latest. If two entries have the same version string, the newer timestamp identifies the newer app definition.

## Unofficial apps

Unofficial apps are created by third parties. Only install them when you trust the app maintainer and understand that the app definition may run containers, access app data, use system resources, or expose services on your server.

Manual app uploads follow the same trust model. Upload an app definition only if you trust its source. If the uploaded app already exists, Quollix updates the existing app definition. Automatic updates for third-party apps should be enabled only when you trust the app maintainer to publish future versions without reviewing every change yourself.

## Licensing

The App Store contains app definitions, specifically a `docker-compose.yml` file, rather than the app container images themselves. App definitions distributed through the App Store are licensed under the [0BSD License](https://opensource.org/license/0bsd), so you may download, modify, and redistribute them.

The container images referenced by an app definition are separate works and are governed by their own licenses.
