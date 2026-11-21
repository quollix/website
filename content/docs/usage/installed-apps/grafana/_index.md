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

Use the Grafana app to search and visualize app and host logs and monitor resource usage.

## Setup

Configure the Grafana app in the [logs and metrics settings]({{< relref "docs/usage/settings/logs-and-metrics.md" >}}).
When you visit Grafana you will be automatically logged in via OIDC.
Log and metric collection begins automatically when the Grafana app starts.
The preconfigured **VictoriaLogs** and **VictoriaMetrics** data sources provide access to logs and metrics, respectively.

## Backups

The logs and metrics stored by the Grafana app can generate much new data.
Frequent automatic backups can therefore quickly fill the backup server's storage.
If this is a problem and you mainly need to preserve Grafana's configuration, consider disabling automatic backups for Grafana in the [maintenance policy]({{< relref "docs/usage/maintenance.md" >}}).
Create a [manual backup]({{< relref "docs/usage/backups.md" >}}) whenever you change relevant Grafana settings, such as dashboards or alert rules.
If you restore that backup, logs and metrics collected after it was created will not be available.

## Dashboards

Official Grafana dashboards are included with the app and available as soon as it starts.
Use them to analyze app and host metrics and logs.

You can create your own dashboards, or duplicate an official dashboard and edit your copy.
Changes made directly to an official dashboard are overwritten with its original version when the Grafana app restarts.
Therefore, we recommend creating your own dashboards instead of editing the official ones.

For details on available metrics and log fields, see [Grafana details]({{< relref "docs/usage/installed-apps/grafana/grafana-details.md" >}}).

## Alerts

Quollix provides integrated [email alerts]({{< relref "docs/usage/alerts.md" >}}) for basic use cases.
Creating additional alerts in Grafana is possible but optional.
