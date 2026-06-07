---
title: "Postgres"
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [postgresql.org](https://www.postgresql.org) |
| Source code | [github.com/postgres/postgres](https://github.com/postgres/postgres) |
| License | [PostgreSQL License](https://www.postgresql.org/about/licence/) |
| ARM64 support | Supported |
| Business model | Open-source database maintained by the PostgreSQL Global Development Group, with commercial support and services available separately from third-party providers. |

## Introduction

Quollix uses a Postgres database called **postgres** to store its own system data. It is listed as **quollix / postgres** on the Installed Apps page because it behaves similarly to other apps from an operational perspective.

Unlike ordinary apps, this database is part of the Quollix installation itself and stores all its data. Because Quollix depends on this database, it must remain running and available.

## Available Operations

Operations on **quollix / postgres** are intentionally limited. You can only create and restore backups.

## Restoring Backups

Restoring a backup of **quollix / postgres** restores Quollix system data, not the data of an ordinary app. This can affect users, settings, installed app metadata, and other Quollix state.

{{< alert title="Warning" color="warning" >}}
Restoring the Postgres backup affects the Quollix installation as a whole. Create a current backup before restoring an older one.
{{< /alert >}}
