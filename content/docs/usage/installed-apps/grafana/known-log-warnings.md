---
title: "Known log warnings"
---

When using the [Grafana app]({{< relref "docs/usage/installed-apps/grafana" >}}) to collect logs, you may encounter warnings from official apps that can be ignored.

Warnings about disabled optional features and deprecation notices for components that remain functional are excluded from this list. Shutdown messages caused by intentional updates, backups or restarts are also excluded.

| App                   | Service      | Log                                                                                        | Description                                                                                                                                                                         |
| --------------------- | ------------ | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Grafana               | grafana      | `Failed to write gzipped response`                                                         | With `http: request method or response status code does not allow body`, compression attempts to write a forbidden response body. Tolerated because that response requires no body. |
| Nextcloud             | nextcloud    | `redis.config.php` / `s3.config.php differs from the latest version of this image`         | Nextcloud preserves older configuration templates during updates. The reviewed differences are tolerated because they concern features unused by this setup.                        |
| Grist                 | grist        | `did not find an appropriately named example workspace in deployment`                    | Grist falls back to the first workspace owned by its support account when the “Examples & Templates” workspace is missing. Tolerated because normal user documents use their own workspaces. |
| Jitsi                 | jvb / jicofo | `Disabling certificate verification!` / `Disabling TLS certificate verification!`          | Upstream disables certificate verification for internal XMPP connections to Prosody. Tolerated since apps use a restricted Docker network. Browser HTTPS is unaffected.             |
| Jitsi                 | jvb          | `A provider … does not implement any provider interfaces applicable in the SERVER runtime` | Tolerated because these registration warnings do not affect functionality.                                                                                                          |
| Nextcloud / WordPress | mariadb      | `io_uring_queue_init() failed with EPERM`                                                  | Tolerated because MariaDB falls back to Linux native AIO via libaio.                                                                                                                |
| Nextcloud / WordPress | mariadb      | `memory.pressure not writable, functionality unavailable to MariaDB`                       | Tolerated because MariaDB operates without memory pressure integration.                                                                                                             |
