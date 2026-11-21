---
title: Grafana details
---

This article describes the metrics and log fields available in the Grafana app.

## Finding metrics

Open **Explore** in Grafana and select **VictoriaMetrics**.

| Metric name         | Data                                                              |
| ------------------- | ----------------------------------------------------------------- |
| `host_*`            | Host CPU, memory, and filesystem metrics.                         |
| `container_*`       | App container CPU, memory, network traffic, and disk I/O metrics. |
| `volume_used_bytes` | Disk space used by app volumes, in bytes.                         |

## Finding logs

Open **Explore** in Grafana and select **VictoriaLogs**.
Host logs have `source_type` set to `journald`.
Journal fields often use uppercase names, such as `SYSLOG_IDENTIFIER` and `_SYSTEMD_UNIT`.
App logs include these fields:

| Field                          | Description                                                       |
| ------------------------------ | ----------------------------------------------------------------- |
| `maintainer`, `app`, `service` | Identify the app and service that produced the entry.             |
| `level`                        | Normalized log level, or `unknown` if it cannot be determined.    |
| `stream`                       | Container output stream: `stdout` or `stderr`.                    |
| `parsed`                       | Whether Quollix successfully parsed and structured the entry.     |
| `log_timestamp`                | Timestamp extracted from the service's log entry, when available. |
| `attributes`                   | Additional structured metadata extracted from the entry.          |

### Log structuring

Quollix uses parsers to turn recognized service log formats into structured fields.
Entries that are not parsed are marked with `parsed=false` and preserved as plain text.
This is expected when an entry contains unstructured text with no useful fields to extract.

For guidance on reporting missing or incorrect parsing, or contributing a parser, see [Log structuring]({{< relref "docs/project/community/contributing/log-structuring.md" >}}).
