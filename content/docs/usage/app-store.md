---
title: "App store"
weight: 20
no_list: true
---

This article explains the **App Store page** in the Quollix GUI. The actual [App Store](https://store.quollix.org/) is a separate online service.

The App Store lets you search and install apps on your Quollix server with just a few clicks. By default, the latest version is suggested for installation, but you have the option to install an older version.

Quollix does not depend on the App Store. You can manually upload apps to, or download apps from, your Quollix server on the Installed Apps page. The App Store is just the most convenient way to install and update apps.

## Official Apps

{{< alert title="Note" color="warning" >}}
When installing an official app, you should always read the related articles below, as they contain setup guidelines, security instructions and information about self-registration.
{{< /alert >}}

Official apps are maintained for reliable installation and Quollix integration. Security vulnerabilities inside the app software itself remain the responsibility of the respective upstream project developers.

{{< children >}}

## Unofficial Apps

Unofficial apps are created by third parties. Only install them when you trust the maintainer and understand that the app configuration may run containers, access app data, use system resources, or expose services on your server.

Manual app uploads follow the same trust model. Upload an app file only if you trust its source. If the uploaded app already exists, Quollix updates the existing app configuration.

Automatic updates for third-party apps should be enabled only when you trust the maintainer to publish future versions without reviewing every change yourself.

## Licensing

The App Store contains app configurations, specifically a `docker-compose.yml` file, rather than the application software itself. App configurations distributed through the App Store are open source software, so you may download, modify, and redistribute them.

The container images referenced by an app configuration contain the application software. They are separate works and are governed by their own licenses.
