---
title: Logs and metrics
---

{{< ui-location "System" "Settings" "Logs and metrics" >}}

These settings control logging and resource monitoring through the [Grafana app]({{< relref "docs/usage/installed-apps/grafana" >}}):

- **Log retention (days)\***: How long logs are kept.
- **Log storage target (GB)\***: Target disk usage for logs. Actual usage may exceed this target.
- **Metric retention (days)\***: How long metrics are kept.
- **Host collection interval (seconds)\***: How often host metrics are measured.
- **Container collection interval (seconds)**: How often container metrics are measured.
- **Volume collection interval (seconds)**: How often volume disk usage is measured.

\* Changes to these settings require a restart of the Grafana app to take effect.

These settings can significantly affect resource usage.
If the Grafana app uses too many resources, shorter retention periods, a lower log storage target, and longer collection intervals can help reduce usage.

The volume collection interval is usually longer than the host and container collection intervals because measuring volume disk usage requires scanning all files and directories to determine their sizes.
The interval is the wait time between the end of one volume measurement and the start of the next.
