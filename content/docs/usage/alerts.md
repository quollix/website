---
title: "Alerts"
---

{{< ui-location "System" "Alerts" >}}

Quollix checks for server conditions that may need attention and emails enabled administrators when an alert fires. You can configure the alerts on this page.

## Prerequisites

Quollix sends alert notifications only when [SMTP email]({{< relref "email.md" >}}) is enabled. All alert types except certificate expiration also require the [Grafana app]({{< relref "installed-apps/grafana.md" >}}), which runs the databases that store metrics and logs.

## Alert types

- **Host CPU usage:** average CPU usage on the Quollix host is high.
- **Host memory usage:** host memory in use is high.
- **Host disk usage:** usage of a host filesystem is high.
- **Certificate expiration:** the current TLS certificate expires within 14 days.
- **Quollix errors:** error or fatal events were logged recently, for example during [automatic backups and updates]({{< relref "docs/usage/maintenance" >}}).

The CPU, memory, and disk alerts share the **host usage thresholds** shown on this page.
An alert fires when usage rises above the trigger threshold and recovers when it falls below the recovery threshold.
The gap between these values prevents repeated firing and recovery notifications when usage fluctuates around one value.

The **pending time** is how long usage must stay above the trigger threshold before the alert fires.
If usage falls back before the pending time elapses, the alert returns to healthy without sending a notification.
Setting pending time to zero fires on the first check above the trigger threshold.

## Workflow

When you receive an alert, open the [Grafana app]({{< relref "installed-apps/grafana.md" >}}) and use its dashboards to investigate host metrics and logs around that time.

## Advanced alerts

You can disable Quollix alerts and configure more complex alerts directly in Grafana.
When SMTP is configured in Quollix, the same settings are applied to Grafana automatically.
You may need to restart the Grafana app for the settings to take effect.
