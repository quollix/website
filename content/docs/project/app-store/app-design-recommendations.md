---
title: "App design recommendations"
---

This article is meant for developers who want to distribute their software through the [App Store]({{< relref "docs/project/app-store/_index.md" >}}). You are free to design your app in any way you like. However, following the recommendations ensures smooth integration with Quollix and improves the experience for administrators and end users.

## Official app repository

Tip: The [official app definitions](https://github.com/quollix/apps) provide working examples. Some recommendations below are easier to understand when compared with these examples.

## Introduction and development model

Any software that provides a web interface can be published as an app in the App Store. At a high level, the development and distribution flow looks like this:

- You package your software as a Docker image and publish it to a public registry.
- You provide an app definition that follows Quollix conventions and upload the app to the App Store.
- Users can download the app from the App Store and install it on their Quollix servers.

## What Quollix handles for you

Quollix provides a standardized operational environment. App developers should assume that the following concerns are handled externally and do not need to be implemented by the app itself:

- Reverse proxying and TLS certificate management
- Traffic control
- Update orchestration and restarts
- Backups and restores
- Log rotation, monitoring and alerting
- User management (when your app supports OIDC)
- Selected [service migrations]({{< relref "docs/project/app-store/service-migration.md" >}}) during app updates

Relying on these platform features avoids duplication and prevents potential interference between app-level and platform-level behavior.

## Design recommendations

### The ideal integration

Ideally, an administrator installs an app, opens it, signs in directly through Quollix via OIDC, and can use the app without any manual setup. [Vikunja]({{< relref "docs/usage/installed-apps/vikunja.md" >}}) and [HedgeDoc]({{< relref "docs/usage/installed-apps/hedgedoc.md" >}}) are good examples of this model.

### Platform compatibility

- Apps should support both AMD64 and ARM64 architectures by [publishing a multi-platform Docker image](https://docs.docker.com/build/building/multi-platform) for the [main service]({{< relref "docs/project/terminology.md" >}}) and using multi-platform Docker images for [side services]({{< relref "docs/project/terminology.md" >}}).

### Installation and updates

- The app must be deployable using a simple `docker compose up` without manual pre- or post-installation steps.
- All services defined in the app definition must use clear, descriptive names that explicitly indicate the software they run. For example, use `postgres` instead of `db`, `database`, or `service1`.
- Docker image tags should use release versions in the format `X.Y.Z`, for example `1.2.3`.
- App Docker containers are frequently started and stopped, which is why these operations should be fast.
- Apps should be usable immediately on first visit and take users directly to the app's landing page. Avoid installation wizards and web-based configuration on first boot by using environment variables instead. Also avoid welcome popups, guided onboarding, tutorial modals, and informational overlays.
- Updates should be non-interactive. When updated, the app should migrate database schemas and configuration automatically.
- Apps should not perform self-updates from inside the running container. The App Store is the primary update mechanism and updates apps by changing Docker image tags and restarting services. In-container updates can create state that no longer matches the declared image version.
- Apps should disable automatic update checks and in-app update notifications where possible. Administrators should not receive newer-version notices through the app UI, because the App Store is the primary update mechanism.

### Networking and reverse proxy model

- To simplify Quollix network integration, apps should not:
  - Terminate TLS
  - Manage certificates
  - Enforce hard-coded domain checks
  - Require IP allowlists
  - Require WebSockets to work
- If domain or URL awareness is required, it must be configurable via environment variables. Quollix can dynamically inject the base domain on startup to address this issue.
- The main service must serve its web interface at the root path `/`.

### Configuration model

Configuration should be handled by the app itself and should not complicate deployment. The app definition should stay lean. If configuration is necessary, use the following preference order:

1. Opinionated defaults built into the app. These should cover the common use cases and remain hidden from app definitions where possible.
2. Environment variables in the app definition.
3. Web-based or CLI-based configuration. Usually used for settings that may change over time.

Direct editing of config files is discouraged. Internally managed config files are acceptable if they are fully controlled by the app.

#### Environment variables

If needed, apps should use the following environment variables provided by Quollix during deployment: `BASE_DOMAIN`, `CLIENT_ID`, `CLIENT_SECRET`, `IANA_TIMEZONE`, and generated `SECRET_*` values. On startup, the app should apply these values automatically. Restarting the app must be sufficient to adapt to configuration changes.

Apps should not persist dynamic values injected through environment variables into long-lived application configuration. For example, when `CLIENT_SECRET` changes, restarting the app with the new value should be sufficient. The administrator should not need to update the same value manually in the web UI or server settings.

### Operations

#### Efficiency and simplicity

- Apps should be efficient in terms of CPU, memory, and disk usage. Apps should be able to run on low-end hardware.
- The app and its services should scale well vertically. For example, if a database is needed, prefer PostgreSQL over SQLite to support larger production workloads.
- Docker images should be small. Minimal base images such as Alpine are preferred.
  - For example, the Quollix Docker image is based on Alpine, and Quollix uses `postgres-alpine` instead of `postgres` for the database service image.
- Prefer compiled languages that produce small, static binaries, such as Go or Rust.
- Keep the number of services in the app definition small to simplify operation and updating.
  - Apps are deployed on a single Quollix server, so a horizontally scalable microservice architecture adds operational overhead without benefit.
  - Ideally, use one monolithic main service with an HTTP server, and optionally a database service if required.
  - Add separate services, such as search engines or LLMs, only when they are necessary.
- Prefer a single, opinionated deployment approach. If multiple equivalent services or databases are possible, standardize on one instead of maintaining multiple app variants.
  - We prefer PostgreSQL over MySQL/MariaDB as app database.

#### Dependency handling

If the main service depends on other services, for example a database, it should:

- Attempt to connect on startup
- Retry for a reasonable amount of time or number of attempts
- Exit with an error if the dependency is unavailable
- Expose an HTTP health endpoint for the main service. It should return HTTP 200 only once the server is running, required migrations are complete, and required integrated services are available and compatible.

If internal services require credentials, apps should use generated `SECRET_*` values instead of hard-coded defaults. Authentication should still be enforced on public entry points, usually through the exposed web service port.

#### Flexibility

Apps should tolerate frequent restarts and operational changes, including:

- Domain changes
- User creation, deletion, or renaming
- Configuration changes

Avoid hard-coded assumptions or irreversible dependencies.

#### Operator tooling

Services may include useful operational tooling for the software they run. For example, database services commonly include the matching database client, and application services may expose a small CLI for administrative or diagnostic tasks.

### Logging and observability

Apps should be configurable via Docker environment variables to:

- Log exclusively to stdout and stderr
- Avoid creating log files and internal log rotation
- Use structured logging where possible

Quollix collects logs centrally, so writing logs to the filesystem is unnecessary. JSON is the preferred log format, as it integrates well with centralized logging and monitoring systems. Plain text logging is discouraged for production mode since it may not be parsed reliably.

### User management and security

Apps should support integration with an OIDC provider. This enables integration with Quollix features such as:

- Single sign-on
- User management
- Role- and group-based access control

By relying on an OIDC provider, apps can delegate authentication and core user management to a central system. However, the app remains fully responsible for enforcing its own authorization logic.

At the moment, Quollix provides these claims for integration:

- Standard-style identity claims: `sub`, `name`, `preferred_username`, `email`
- Standard token metadata claims in ID tokens: `iss`, `aud`, `exp`, `iat`, `nonce`
- Quollix-specific custom claims: `role`, `groups`

The custom claim `role` currently contains `admin` or `user`. The custom claim `groups` contains comma-separated list of [Quollix group names]({{< relref "docs/usage/groups" >}}) the user is member of. Apps can use these claims for authorization, role and group mapping if desired.

#### App secrets

Quollix automatically generates persistent values for environment placeholders whose name starts with `SECRET_`. Apps should use purpose-specific names, such as `SECRET_POSTGRES_PASSWORD`, `SECRET_SESSION_SECRET`, or `SECRET_ADMIN_TOKEN`. These values are stored with the installed app and remain stable across container restarts, app updates, and backups.

App definition example:

```yaml
services:
  myapp:
    environment:
      POSTGRES_PASSWORD: ${SECRET_POSTGRES_PASSWORD}
    ...
```

#### OIDC integration

OIDC integration should use the authorization code flow. The app should retrieve all required metadata from the discovery endpoint.

OIDC integration should be configurable through environment variables provided by Quollix. Ideally, the app should only require an issuer URL, `CLIENT_ID`, and `CLIENT_SECRET`, without requiring administrators to configure these settings manually. The app should derive the discovery endpoint from the issuer by using `/.well-known/openid-configuration`, and then read the remaining OIDC endpoints from that metadata document.

For example, the app definition could look like this:

```yaml
services:
  myapp:
    environment:
      OIDC_CLIENT_ID: ${CLIENT_ID}
      OIDC_CLIENT_SECRET: ${CLIENT_SECRET}
      OIDC_ISSUER: https://quollix.${BASE_DOMAIN}
    ...
```

#### Identity model

If an app supports OIDC, Quollix should be the primary source of truth for user identities. Self-registration features of the app should therefore be disabled by default or by environment variables.

Some apps distinguish sign-in and account creation, where the latter sometimes requires extra configuration to be enabled. Instead, the preferred bootstrap model is that OIDC integration is configured through environment variables, as described in [OIDC integration](#oidc-integration), and accounts are created automatically through OIDC sign-in. The first user who signs in through OIDC should become an administrator, while subsequent users become regular users. The second-best option is to create a local administrator account on first visit, while all other users sign in through OIDC.
