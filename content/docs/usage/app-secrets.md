---
title: "App secrets"
---

{{< ui-location "Apps" "Secrets" >}}

App secrets are generated credentials that Quollix injects into apps through `SECRET_*` environment variables. They are used for values such as database passwords, shared keys, and signing secrets.

## Regenerating secrets

Regenerating a secret is useful when the current value was exposed and is no longer safe to use. Quollix stores the new value in the app metadata. Running containers keep their current environment until the app is restarted.

After regenerating a secret, restart the app to apply the new value. How the new value is handled depends on the app. Some secrets, such as session keys, usually need no further action beyond a restart. Others, such as database passwords or configuration secrets, may require manual changes in the app containers.

{{< alert title="Warning" color="warning" >}}
Regenerating a secret can break deployments. The flow should be: create a backup of the app, regenerate the secret, restart the app, and test that the app still works. Some apps may require a manual migration.
{{< /alert >}}
