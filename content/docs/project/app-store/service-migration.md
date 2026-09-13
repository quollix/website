---
title: "Service migration"
---

This article explains service migrations that Quollix can run automatically during app updates from the [App Store]({{< relref "docs/project/app-store/_index.md" >}}). For example, updating Postgres to a new major version no longer requires administrators to run the migration commands by hand. The same service migration mechanism is also used when an administrator directly uploads an app version to Quollix.

## Current support

Quollix currently handles these service migrations:

| Service        | Migration behavior                                                                                                                                       |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Postgres       | On major version changes, Quollix exports a dump with `pg_dumpall` in the old container and imports it with `psql` in the new container.                 |
| Zulip Postgres | Zulip's `zulip/zulip-postgresql` image follows the same Postgres migration flow.                                                                         |
| RabbitMQ       | On RabbitMQ image version changes, Quollix starts the old RabbitMQ container and runs `rabbitmqctl enable_feature_flag all` before the update continues. |

### RabbitMQ

For RabbitMQ, app definitions should keep the RabbitMQ node name stable across container recreations during backups and updates, for example by setting the environment variable `RABBITMQ_NODENAME: rabbit@rabbitmq`.

### MariaDB

App maintainers publishing apps with MariaDB services can use MariaDB's built-in automatic upgrade handling:

```yaml
environment:
  MARIADB_AUTO_UPGRADE: "1"
```

## Other services

App maintainers should publish app versions that follow each service's official upgrade path. For these services, no additional manual migration steps are expected:

- Redis
- Valkey
