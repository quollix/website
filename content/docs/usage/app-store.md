---
title: "App store"
weight: 20
no_list: true
---

This article explains the **App Store page** in the Quollix GUI. The actual [App Store](https://store.quollix.org/) is a separate online service where anyone can upload their own apps.

The App Store lets you search and install apps on your Quollix instance with just a few clicks. By default, the latest version is suggested for installation, but you have the option to install an older version.

Quollix does not depend on the App Store. You can manually upload apps to, or download apps from, your Quollix instance on the Installed Apps page. The App Store is just the most convenient way to install and update apps.

## Official Apps

{{< alert title="Note" color="warning" >}}
When installing an official app, you should always read the related articles below, as they contain setup guidelines, **security instructions** and information about self-registration.
{{< /alert >}}

Official apps are maintained for reliable installation and Quollix integration. Security vulnerabilities inside the app software itself remain the responsibility of the respective upstream project developers.

{{< children >}}

By default, self-registration is disabled for all official apps for security reasons. However, if you want to build an open community that allows self-registration, the related articles explain how to enable it.

## Unofficial Apps

By default, search results only show official apps from the maintainer named `quollix`. By enabling **Show Unofficial Apps**, you can also search for apps from third-party maintainers. The search term then matches maintainer names and app names.

{{< alert title="Note" color="warning" >}}
Unofficial apps are not moderated by us and may contain malware or other harmful content. We do not recommend installing them unless you trust the maintainer. Installing apps from unknown sources may compromise your server and data. For maximum compatibility, Quollix provides the user's email address to apps during OIDC sign-in, so a malicious app may also collect that address.
{{< /alert >}}

## Open Source

The App Store contains app configurations, specifically a `docker-compose.yml` file, rather than the application software itself. App configurations distributed through the App Store are licensed under the permissive open-source [0BSD License](https://opensource.org/license/0bsd/), so you may download, modify, and redistribute them.

The container images referenced by an app configuration contain the application software. They are separate works and may be open source or proprietary under their own licenses.
