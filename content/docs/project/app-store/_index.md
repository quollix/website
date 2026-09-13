---
title: "App Store"
aliases:
  - /docs/app-store/
---

This section is for people who want to maintain [app definitions]({{< relref "docs/project/terminology.md" >}}) and publish them through the App Store. If you want to publish app definitions, start by [joining the App Store]({{< relref "docs/project/app-store/join" >}}).

The purpose of the App Store is to let an app maintainer integrate and update the services in an app definition, verify installation and migration stability, and then make that work available to everyone using the app by publishing a new version. This means administrators no longer need to edit app definitions themselves to install and update those apps.

The [App Store repository](https://github.com/quollix/store) contains two main components:

- `server`: the App Store service hosted at <https://store.quollix.org>
- `qsc`: the Quollix Store Client, a terminal user interface for maintaining app definitions and interacting with the App Store server.

The App Store uses a terminal client because app maintenance is mainly file-based work.
