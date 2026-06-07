---
title: Scaling
---

Quollix is designed to run as a single-node system. There is no built-in horizontal clustering. Scaling is achieved using one of the following approaches.

## Vertical Scaling

The primary scaling strategy is vertical scaling. Run Quollix on a machine with more CPU, memory, and disk space. This can be done by migrating the instance to a larger server. The [server migration guide]({{< relref "server-migration.md" >}}) might be helpful for that.

## Federation

{{< planned-feature >}}

Communities or larger organizations may federate multiple Quollix servers. Each server represents an organizational unit. Identity and access are shared through a central Identity Provider server.

## Custom Infrastructure

For very large or specialized environments, a custom IT infrastructure may be required. The scope of Quollix is small to mid-sized organizations and standard use cases.
