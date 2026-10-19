---
title: "Log structuring"
---

You can help improve app log structuring by reporting parsing problems or adding/improving parsers.
To find log entries and inspect their fields, see [Finding logs in Grafana]({{< relref "docs/usage/installed-apps/grafana#finding-logs" >}}).

## Reporting parsing problems

For official apps, if you find entries with `parsed=false` that you think should be parsed into structured fields, please report them through the [feedback page]({{< relref "docs/contact/feedback.md" >}}) or create a GitHub issue.
You can also report missing or incorrectly extracted fields in parsed entries.
Plain-text entries with no useful fields to extract do not need to be reported.

## Contributing parsers

To get started, clone the [Quollix source code](https://github.com/quollix/quollix) and search for `grok`.
Quollix uses the [elastic/go-grok](https://github.com/elastic/go-grok) library for pattern-based log parsing.
Supporting a new app may only require reusing an existing parser or adding a simple Grok pattern and registering the parser for the Compose service name.
Other log formats may require custom parsing logic.
In all cases, please implement unit tests for the parsers and use real logs from the service concerned as test input.
