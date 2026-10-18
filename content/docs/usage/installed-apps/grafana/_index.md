---
title: "Grafana"
---

{{< app-info >}}

## Resources

| Resource       | Description                                                                              |
| -------------- | ---------------------------------------------------------------------------------------- |
| Website        | [grafana.com](https://grafana.com/oss/grafana/)                                          |
| Source code    | [github.com/grafana/grafana](https://github.com/grafana/grafana)                         |
| License        | [AGPL-3.0-only](https://github.com/grafana/grafana/blob/main/LICENSE)                    |
| ARM64 support  | Supported                                                                                |
| OIDC client    | Native                                                                                   |
| Business model | Open source project led by Grafana Labs, with commercial Enterprise and Cloud offerings. |

## Introduction

Use the Grafana app to search and visualize app and host logs, monitor resource usage, and configure alerts.

## Setup

Configure the Grafana app in the [logs and metrics settings]({{< relref "docs/usage/settings/logs-and-metrics.md" >}}).

Grafana supports single sign-on through Quollix via OIDC. Log and metric collection begins automatically when the Grafana app starts. The preconfigured **VictoriaLogs** and **VictoriaMetrics** data sources provide access to logs and metrics, respectively.

Email alerts require configuring Grafana to use an SMTP server. See the [Grafana SMTP configuration documentation](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/#smtp).

## Backups

The logs and metrics stored by the Grafana app can generate much new data. Frequent automatic backups can therefore quickly fill the backup server's storage. If this is a problem and you mainly need to preserve Grafana's configuration, consider disabling automatic backups for Grafana in the [maintenance policy]({{< relref "docs/usage/maintenance.md" >}}). Create a [manual backup]({{< relref "docs/usage/backups.md" >}}) whenever you change relevant Grafana settings, such as dashboards or alert rules. If you restore that backup, logs and metrics collected after it was created will not be available.

## Dashboards

At the moment, we are developing reusable Grafana dashboards for different levels of detail. They will be available for download soon. Our approach to observability is modular. You will be able to download only the dashboards you need. You can also create your own dashboards.

## Finding metrics

Open **Explore** in Grafana and select **VictoriaMetrics**.

| Metric name         | Data                                                              |
| ------------------- | ----------------------------------------------------------------- |
| `host_*`            | Host CPU, memory, and filesystem metrics.                         |
| `container_*`       | App container CPU, memory, network traffic, and disk I/O metrics. |
| `volume_used_bytes` | Disk space used by app volumes, in bytes.                         |

Use labels such as `maintainer`, `app`, and `service` to filter container metrics. Volume metrics use `maintainer`, `app`, and `volume` labels.

## Finding logs

Open **Explore** in Grafana and select **VictoriaLogs**.

Host logs have `source_type` set to `journald`. Journal fields often use uppercase names, such as `SYSLOG_IDENTIFIER` and `_SYSTEMD_UNIT`.

App logs include these fields:

| Field                          | Description                                                       |
| ------------------------------ | ----------------------------------------------------------------- |
| `maintainer`, `app`, `service` | Identify the app and service that produced the entry.             |
| `level`                        | Normalized log level, or `unknown` if it cannot be determined.    |
| `stream`                       | Container output stream: `stdout` or `stderr`.                    |
| `parsed`                       | Whether Quollix successfully parsed and structured the entry.     |
| `log_timestamp`                | Timestamp extracted from the service's log entry, when available. |
| `attributes`                   | Additional structured metadata extracted from the entry.          |

See [Known log warnings]({{< relref "docs/usage/installed-apps/grafana/known-log-warnings.md" >}}) for warnings that can be tolerated under specific conditions and guidance on when to investigate.

### Log structuring

Quollix uses parsers to turn recognized service log formats into structured fields.
Entries that are not parsed are marked with `parsed=false` and preserved as plain text.
This is expected when an entry contains unstructured text with no useful fields to extract.

For guidance on reporting missing or incorrect parsing, or contributing a parser, see [Log structuring]({{< relref "docs/project/community/contributing/log-structuring.md" >}}).

## How collection works

Quollix and [Vector](https://vector.dev/) collect data and send logs to [VictoriaLogs](https://docs.victoriametrics.com/victorialogs/) and metrics to [VictoriaMetrics](https://docs.victoriametrics.com/victoriametrics/). Grafana queries these databases to display the data.

| Data type         | Collection method                                                                         |
| ----------------- | ----------------------------------------------------------------------------------------- |
| Host metrics      | Vector collects CPU, memory, and filesystem metrics from the host.                        |
| Host logs         | Vector reads the host's systemd journal (journald).                                       |
| App logs          | Quollix reads container output through the Docker API and structures defined log formats. |
| Container metrics | Quollix reads container resource statistics through the Docker API.                       |
| Volume metrics    | Quollix queries volume disk usage through the Docker API.                                 |

Quollix collects only new app log entries. Restarting an app does not collect its existing logs again, so restarts do not duplicate app logs.
