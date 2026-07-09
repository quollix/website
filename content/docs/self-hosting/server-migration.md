---
title: "Server migration"
---

Server migration means moving Quollix and apps data from one server to another. This could be for reasons such as switching cloud providers, upgrading hardware or moving between self-hosted and SaaS infrastructure.

With Quollix, migration is straightforward: simply create remote backups of all apps, set up a new Quollix server, configure access to the remote backup server, and restore the apps from the remote backup server. To avoid compatibility issues, ensure that the Docker image tags of the old and new Quollix containers are the same.
