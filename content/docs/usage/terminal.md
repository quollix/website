---
title: "Terminal"
---

{{< premium >}}

The Terminal feature lets you open an interactive shell inside an app’s running container. Since containers may include different shells, Quollix does not assume a specific one. When opening a terminal, it first attempts to start `bash`. If that is not available, it falls back to POSIX `sh`, followed by additional shells to support less common container setups.

To open a terminal, simply select the app you are interested in and choose the corresponding service / container.
