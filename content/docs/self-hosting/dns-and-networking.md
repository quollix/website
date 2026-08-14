---
title: "DNS and Networking"
---

Quollix can run on a public internet-facing server or inside a LAN, optionally with VPN access. Choose the network exposure model before configuring DNS and certificates.

## Public Internet Access

Use public DNS when users should reach Quollix directly from the internet. Create DNS records that point to the public IP address of the Quollix server:

```text
quollix.example.com     A  <public-server-ip>
nextcloud.example.com   A  <public-server-ip>
vaultwarden.example.com A  <public-server-ip>
```

If you use IPv6, also create the corresponding `AAAA` records.

## LAN or VPN Access

For private deployments, Quollix can run behind a VPN instead of being exposed directly to the public internet. This is common for home labs and company networks: users first connect to the private network through a VPN, then access Quollix and its apps through internal domain names. Many routers and firewalls provide built-in VPN support, or you can run a separate VPN service. This adds an extra access layer in front of Quollix and can reduce public attack surface. It does not replace Quollix access control, HTTPS, updates, backups, or normal server hardening.

In LAN or VPN setups, the DNS names must resolve to the private IP address of the Quollix server from inside the network:

```text
quollix.example.com     A  <private-server-ip>
nextcloud.example.com   A  <private-server-ip>
vaultwarden.example.com A  <private-server-ip>
```

Some routers can provide local DNS records for connected clients. Support varies by router. If your router cannot provide the records you need, use a local DNS service such as dnsmasq, Unbound, or Pi-hole.

## Certificates

Quollix can generate Let's Encrypt certificates through a DNS-01 challenge. This works even when the Quollix server is only reachable through a LAN or VPN, because certificate issuance depends on DNS records, not public HTTP access to the server.
