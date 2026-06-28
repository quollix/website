---
title: "Initial Admin Account"
---

Quollix creates an initial administrator account on first startup.

For the default production setup with a generated initial password, see the [production setup guide]({{< relref "docs/getting-started/production-setup.md" >}}).

By default, the username is `administrator`. If you want to choose a custom username and password for the initial admin user, set `INITIAL_ADMIN_NAME` and `INITIAL_ADMIN_PASSWORD` before starting Quollix.

Add the environment variables to the `quollix` service in the `docker-compose.yml` file from the [production setup guide]({{< relref "docs/getting-started/production-setup.md" >}}):

```yaml
services:
  quollix:
    environment:
      INITIAL_ADMIN_NAME: <custom-name>
      INITIAL_ADMIN_PASSWORD: <custom-password>
    ...
```
