---
title: "Hetzner Cloud server setup"
---

This page uses Hetzner Cloud as a sample VPS provider because we have experience with it, but other providers should work in a similar way.

* Create a [Hetzner](https://hetzner.com) account.
* Open the [Hetzner Cloud Console](https://console.hetzner.com/projects).
* Create a firewall that only allows incoming traffic to ports `22` (SSH), `80` (HTTP), and `443` (HTTPS).
* When creating the server, we recommend using Ubuntu because it is common and well supported.
* Enable automatic backups for the server. These backups restore the whole machine, which is useful after a broken system update or server failure. They complement [Quollix app backups]({{< relref "docs/usage/backups.md" >}}), which restore app data from a configured backup target such as a [Hetzner Storage Box]({{< relref "backup-server-setup.md" >}}).
* Follow the instructions in the [production setup guide]({{< relref "docs/getting-started/production-setup.md" >}}) for Quollix installation and configuration.
* When configuring [Email]({{< relref "docs/usage/email.md" >}}) in Quollix, use SMTP submission port `587` if possible. Hetzner [blocks outgoing traffic to port 465](https://docs.hetzner.com/cloud/servers/faq/#why-can-i-not-send-any-mails-from-my-server), unless the restriction is lifted.
