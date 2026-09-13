---
title: "App definition conventions"
---

When [creating apps]({{< relref "docs/project/app-store/create-your-first-app" >}}), app definitions must follow Quollix-specific conventions:

- All app definitions must be licensed under the 0BSD License so users can freely use and modify them. Add this line at the top of each app definition:

```plain
# This file is licensed under the 0BSD License: https://opensource.org/license/0bsd
```

- Do not use `latest` tags. Image versions should be deterministic, and production app definitions should include image digests.
- Container names and volumes must follow the format below to keep networks and volume access clearly isolated:

```plain
<app-maintainer>_<app>_<service/volume>
```

- Each app definition must declare a [main service]({{< relref "docs/project/terminology.md" >}}).
- To get familiar with the conventions, we recommend reading these sections of the [app design recommendations]({{< relref "docs/project/app-store/app-design-recommendations.md" >}}):
  - [Official app repository]({{< relref "docs/project/app-store/app-design-recommendations.md#official-app-repository" >}})
  - [Environment variables]({{< relref "docs/project/app-store/app-design-recommendations.md#environment-variables" >}})
  - [App secrets]({{< relref "docs/project/app-store/app-design-recommendations.md#app-secrets" >}})
- Use the validation command to check your app definitions against these conventions:

```bash
./qsc local validate -d <path/to/apps/dir>
```
