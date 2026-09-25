---
title: "DNS and networking"
---

Quollix can run as a public server that is reachable from the internet or as a private server inside a LAN.

## Public server

Use public DNS when users should reach Quollix directly from the internet. Create a wildcard DNS record that points all subdomains to the public IP address of the server:

```text
*.example.com A <public-server-ip>
```

If you use IPv6, also create the corresponding `AAAA` records.

## LAN server

A LAN server is accessible directly to devices on the same local network and does not need to be exposed to the public internet.

If users need access from outside the LAN, you can provide it through a VPN. Users connect to the private network first and then access Quollix and its apps through their internal domain names. Many routers and firewalls include VPN support, or you can run a separate VPN service.

In this setup, clients need a local DNS service that resolves the Quollix domain to the server's private IP address. We recommend installing [AdGuard]({{< relref "docs/usage/installed-apps/adguard.md" >}}) from the Quollix App Store and using it as the local DNS server.

Quollix can obtain a trusted certificate through a DNS-01 challenge even when the server is accessible only from the LAN, because certificate issuance does not require public HTTP access to the server. See [Certificate settings]({{< relref "docs/usage/settings/certificate.md" >}}).
