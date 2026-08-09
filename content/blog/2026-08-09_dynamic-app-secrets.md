---
title: "Dynamic App Secrets"
date: 2026-08-09
---

Quollix now generates app-specific secrets automatically. The feature is documented on the [App secrets]({{< relref "docs/usage/app-secrets.md" >}}) page.

Newly installed apps use generated secrets automatically. Existing apps keep their previous internal credentials during migration. Those credentials were not secure, but they were mainly used inside each app's private Docker network, so this is not a direct exposure by itself. If you already had apps installed and want this additional security layer, regenerate the affected secrets in `Apps -> Secrets`.
