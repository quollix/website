---
title: "Migrating an existing app"
---

A common reason to migrate an existing app, such as a native or Docker-based Nextcloud installation, to Quollix is to reduce the time spent on maintenance, also see [Why use Quollix]({{< relref "docs/introduction/why-use-quollix.md" >}}).

This article provides high-level guidance because the exact procedure depends on the app and its current configuration. Create a backup of the app before starting.

## Service compatibility

- Open the [App Store page]({{< relref "docs/usage/app-store/" >}}), search for the app, and review its available versions and [app definition]({{< relref "docs/project/terminology.md" >}}).
- Choose a version to which the app supports migrating. An exact match with the versions in the existing deployment is the safest starting point.
- When database versions are incompatible, consider using `pg_dump` for Postgres or `mysqldump` for MySQL and MariaDB. Export the source database and import it through the running destination database service. Do not copy incompatible database files into the new volume.

## Data migration

- Install and start the selected version from the App Store so Docker creates and initializes its volumes.
- Use the Quollix [terminal]({{< relref "docs/usage/terminal.md" >}}) to inspect the initialized directories when file ownership and permissions may be relevant. Record their numeric user and group ownership and their permissions.
- Stop both the source app and the Quollix app before copying mutable files. A logical database import instead requires the destination database service to be running.
- Map each persistent data location in the source installation to the corresponding volume and container path in the Quollix app definition.
- Remove only the newly initialized destination volumes and recreate them with the same names. Run these commands in the server host's shell:

```bash
docker volume rm <new_volume_name>
docker volume create <new_volume_name>
```

- When the source app uses Docker volumes, copy their contents into the volumes created for the Quollix app. Docker does not support renaming volumes directly. Run commands such as the following in the server hosts shell:

```bash
docker run --rm -it \
  -v <old_volume_name>:/from:ro \
  -v <new_volume_name>:/to \
  alpine ash -c "cd /from ; cp -av . /to"
```

- For a non-containerized source, such as an app installed from a `.deb` package, copy the data into the corresponding Docker volumes created for the Quollix app.
- Preserve the directory layout expected by the app definition. After copying, apply the numeric ownership and permissions expected inside the destination container when they differ from the source.

## Environment variables

Compare the source app configuration with the environment variables in the app definition. Values may not necessarily remain identical: hostnames/[base domain]({{< relref "docs/usage/settings/base-domain" >}}) and internal service names may need to change for Quollix.

- Check whether the static environment variable values in the app definition are compatible.
- Override the generated [app secrets]({{< relref "docs/usage/app-secrets" >}}) in Quollix with the corresponding secrets from the source installation when required.
- Update the [OIDC configuration]({{< relref "docs/usage/app-sso" >}}) when changing the OIDC provider.

## Migrate OIDC sign-in

This section is relevant when the app already uses an external OIDC provider. There are multiple ways to handle this migration.

### Option 1: Keep the existing OIDC provider

Leave the migrated app connected directly to its existing OIDC provider. Its existing user mappings can then remain unchanged. Running an app on Quollix does not require the app to use Quollix for OIDC sign-in.

Setting the app's access policy to `Public` on the [installed apps page]({{< relref "docs/usage/installed-apps" >}}) avoids an additional Quollix sign-in before the app's own sign-in. This also makes the app reachable without Quollix access control, so the app's own authentication must protect it appropriately.

### Option 2: Use the existing provider through Quollix

Configure Quollix as an OIDC client of the [external OIDC provider]({{< relref "docs/usage/federation/oidc-providers.md" >}}), then configure the app to use Quollix as its OIDC provider. Users authenticate to Quollix through the existing provider.

This does not preserve the identity seen by the app. The app now receives Quollix as `iss` and the Quollix user ID as `sub`, so an existing app account may still need to be linked to the new identity. New users do not require an identity migration, but the app must allow account creation through OIDC.

### Option 3: Replace the OIDC provider with Quollix

Configure users to authenticate directly with Quollix and configure the app to use Quollix as its OIDC provider. This allows the external provider to be removed. In OIDC, a user is identified by the combination of the issuer claim (`iss`) and subject claim (`sub`). Both values usually change:

- The issuer becomes `https://quollix.<base-domain>`.
- The subject becomes the numeric ID of the Quollix user. You can find this ID in the users table of the Postgres app that stores the Quollix database.

Depending on the app, configure either the issuer URL:

```plain
https://quollix.<base-domain>
```

or the discovery URL:

```plain
https://quollix.<base-domain>/.well-known/openid-configuration
```

Also update the client ID and client secret, see the [app SSO page]({{< relref "docs/usage/app-sso.md" >}}). The required values and configuration location depend on the app.

The app must associate each new Quollix identity with the correct existing account. Ideally, use an account-linking, OIDC migration, or API mechanism provided by the app. If the app provides no suitable mechanism, you may need to update its database directly. The values representing the old OIDC `iss` and `sub` must be replaced.
