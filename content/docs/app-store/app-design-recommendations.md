---
title: "App Design Recommendations"
---

This document is intended for developers who develop software and want to distribute it through the Quollix App Store. You are free to design your app in any way you like. However, following the recommendations ensures smooth integration with Quollix and improves the experience for administrators and end users.

## Introduction and development model

Any software that provides a web interface can be published as an app in the Quollix App Store. At a high level, the development and distribution flow looks like this:

* You package your software as a Docker image and publish it to a public registry.
* You provide a `docker-compose.yml` that follows Quollix conventions and upload the app to the Quollix App Store.
* Users can download the app from the App Store and install it on their Quollix instances.

## What Quollix handles for you

Quollix provides a standardized operational environment. App developers should assume that the following concerns are handled externally and do not need to be implemented by the app itself:

* Reverse proxying and TLS certificate management
* Traffic control
* Update orchestration and restarts
* Backups and restores
* Log rotation, monitoring and alerting
* User management (when your app supports OIDC)

Relying on these platform features avoids duplication and prevents potential interference between app-level and platform-level behavior.

## Design recommendations

### Platform compatibility

* Apps should support both AMD64 and ARM64 architectures by publishing multi-platform Docker images.

### Installation and updates

* The app must be deployable using a simple `docker compose up` without manual pre- or post-installation steps.
* All services defined in `docker-compose.yml` must use clear, descriptive names that explicitly indicate the software they run. For example, use 'postgres' instead of 'db', 'database' or 'service1'.
* App Docker containers are frequently started and stopped, which is why these operations should be fast.
* Installation wizards and web-based configuration on first boot are acceptable.
* Updates should be non-interactive. When updated, the app should migrate database schemas and configuration automatically.

### Networking and reverse proxy model

* Apps should not:
  * Terminate TLS
  * Manage certificates
  * Enforce hard-coded domain checks
  * Require IP allowlists
  * Require WebSockets to work
* If domain or URL awareness is required, it must be configurable via environment variables. Quollix can dynamically inject the server host name on startup, to address this issue.
* The main service must serve its web interface at the root path `/`.

### Configuration model

Configuration should be handled by the app itself and should not complicate deployment. The `docker-compose.yml` should be lean. Preferred configuration order:

1. Opinionated defaults built into the app. These should cover the common use cases and remain hidden from compose yamls where possible.
2. Environment variables in `docker-compose.yml`.
3. Web-based configuration via the app’s UI. Used for settings that may change over time.

Manual configuration via the command line or direct editing of config files is discouraged, as it increases operational complexity. Internally managed config files are acceptable if they are fully controlled by the app.

#### Environment variables

If needed, apps should use the following environment variables provided by Quollix deployment: `SERVER_HOST`, `CLIENT_ID`, `CLIENT_SECRET` and `IANA_TIMEZONE`. On startup, the app should apply these values automatically. Restarting the app must be sufficient to adapt to configuration changes.

Apps should not persist dynamic values injected through environment variables into long-lived application configuration. For example, when `SERVER_HOST` changes, restarting the app with the new value should be sufficient. The administrator should not need to update the same value manually in the web UI or server settings.

### Operations

#### Efficiency and simplicity

* Apps should be efficient in terms of CPU, memory, and disk usage. Apps should be able to run on low-end hardware.
* The app and its services should scale well vertically. For example, if a database is needed, prefer PostgreSQL over SQLite to support larger production workloads.
* Docker images should be small. Minimal base images such as Alpine are preferred.
  * For example, the Quollix Docker image based on Alpine, and we use `postgres-alpine` instead of `postgres` for the database container image.
* Prefer compiled languages that produce small, static binaries, such as Go or Rust.
* Keep the number of services in `docker-compose.yml` small to simplify operation and updating.
  * Apps are deployed on a single node, so designing the software as a horizontally scalable, multi-container architecture is unnecessary.
  * Ideally one main service with HTTP server, and optionally a database container if required
  * Additional services (search engines, LLMs, etc.) only if necessary
* Prefer a single, opinionated deployment approach. If multiple equivalent services or databases are possible, standardize on one instead of maintaining multiple app variants.
  * We prefer PostgreSQL over MySQL/MariaDB as app database.

#### Dependency handling

If the main service depends on other services, for example a database, it should:

* Attempt to connect on startup
* Retry for a reasonable amount of time or number of attempts
* Exit with an error if the dependency is unavailable
* Expose a HTTP health endpoint for the main service which should return a successful status code only when the app is ready to serve requests.

Apps should not require shared secrets for communication between services inside the private Docker Compose network. Authentication should be enforced on public entry points, usually through the exposed web service port.

#### Flexibility

Apps should tolerate frequent restarts and operational changes, including:

* Domain changes
* User creation, deletion, or renaming
* Configuration changes

Avoid hard-coded assumptions or irreversible dependencies.

#### Operator tooling

Containers may include useful operational tooling for the software they run. For example, database containers commonly include the matching database client, and application containers may expose a small CLI for administrative or diagnostic tasks.

### Logging and observability

Apps should be configurable via Docker environment variables to:

- Log exclusively to stdout and stderr
- Avoid creating log files and internal log rotation
- Use structured logging where possible

Quollix collects logs centrally, so writing logs to the filesystem is unnecessary. JSON is the preferred log format, as it integrates well with centralized logging and monitoring systems. Plain text logging is discouraged for production mode since it may not be parsed reliably.

### User management and security

Apps should support integration with an OIDC provider. This enables integration with Quollix features such as:

* Single sign-on
* User management
* Role- and group-based access control

By relying on an OIDC provider, apps can delegate authentication and core user management to a central system. However, the app remains fully responsible for enforcing its own authorization logic.

At the moment, Quollix provides these claims for integration:

* Standard-style identity claims: `sub`, `name`, `preferred_username`, `email`
* Standard token metadata claims in ID tokens: `iss`, `aud`, `exp`, `iat`, `nonce`
* Quollix-specific custom claims: `role`, `groups`

The custom claim `role` currently contains `admin` or `user`. The custom claim `groups` contains comma-separated list of Quollix group names the user is member of. Apps can use these claims for authorization, role and group mapping if desired.

#### OIDC integration

OIDC integration should use the confidential client flow. The app should retrieve all required metadata from the discovery endpoint.

OIDC integration should be configurable through environment variables provided by Quollix. Ideally, the app should only require an issuer URL, `CLIENT_ID`, and `CLIENT_SECRET`, without requiring administrators to configure these settings manually. The app should derive the discovery endpoint from the issuer by using `/.well-known/openid-configuration`, and then read the remaining OIDC endpoints from that metadata document.

For example, the Docker Compose YAML could look like this:

```yaml
services:
  myapp:
    environment:
      OIDC_CLIENT_ID: ${CLIENT_ID}
      OIDC_CLIENT_SECRET: ${CLIENT_SECRET}
      OIDC_ISSUER: https://quollix.${SERVER_HOST}
    ...
```

#### Identity model

If an app supports OIDC, Quollix should be the primary source of truth for user identities. Self-registration and regular local account creation inside the app should therefore be disabled by default. A local admin account is acceptable for bootstrap or recovery, but should remain the exception.

Apps should support account creation through OIDC login. One good bootstrap model is that the first user who logs in through OIDC becomes an admin, while subsequent users become regular users. Another good option is to create a local admin account, while all other users log in via OIDC.

### Licensing

Open source software and proprietary software are both welcome in the Quollix App Store. 
