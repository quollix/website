---
title: "Migration checkpoints"
---

Using `qsc`, app maintainers can mark a version in the App Store as a migration checkpoint that Quollix cannot skip during updates. Migration checkpoints are useful when an app must pass through a specific version before it can be updated further.

For how migration checkpoints affect app updates in the Quollix UI, see [app version migration]({{< relref "docs/usage/app-store/app-version-migration.md" >}}).

As an app maintainer, use migration checkpoints to build a chronological update path for your app. For example, mark a version in the App Store as a migration checkpoint when it contains a major update of at least one of its services.

