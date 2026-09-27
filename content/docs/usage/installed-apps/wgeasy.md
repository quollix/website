---
title: "WgEasy"
---

## Resources

| Resource       | Description                                                                                 |
| -------------- | ------------------------------------------------------------------------------------------- |
| Website        | [wg-easy.github.io/wg-easy](https://wg-easy.github.io/wg-easy/latest/)                      |
| Source code    | [github.com/wg-easy/wg-easy](https://github.com/wg-easy/wg-easy)                            |
| License        | [AGPLv3](https://github.com/wg-easy/wg-easy/blob/master/LICENSE)                            |
| ARM64 support  | Supported                                                                                   |
| OIDC client    | [Native](https://wg-easy.github.io/wg-easy/latest/advanced/config/external-authentication/) |
| Business model | Fully open source project supported by voluntary donations.                                 |

## Introduction

wg-easy provides a web interface for managing a WireGuard VPN server. It enables remote access to Quollix and its apps without exposing them directly to the internet.

## Prerequisites

Configure the following from inside the LAN:

- Assign a fixed LAN IP address to the Quollix server, for example through a DHCP reservation in the router.
- A DNS server in the LAN like the official Quollix [AdGuard app]({{< relref "docs/usage/installed-apps/adguard.md" >}}), including a DNS record for `*.<base-domain>` pointing to that LAN IP address.
- Use the router's public IP address or a public DNS hostname as the VPN endpoint. If the public IP changes, use dynamic DNS (DDNS) to keep the hostname updated.
- Forward **UDP port 51820** on the router to the same port on Quollix's LAN IP address. Allow this traffic through any firewalls so the VPN is reachable from the internet.

## Installation

1. Open wgeasy app.
1. Select **Continue**, enter administrator credentials, and select **Create Account**.
1. At **Do you have an existing setup?**, select **No**.
1. Set **Host** to the public IP address or DNS/DDNS hostname, such as `mydomain.com`. Keep **Port** at `51820`.
1. Select **Continue** and sign in.

## Configure DNS

1. Open **Administrator → Admin Panel → Config → DNS**.
2. Replace the existing entries with the DNS server's LAN IP address. If you use AdGuard running on Quollix, use Quollix's LAN IP address.
3. Select **Save**.

## Create VPN clients

Create a separate client for each device:

1. On the **Clients** page, create a client.
2. Open **Edit → View Configuration**. Check that `DNS` is the configured DNS server's LAN IP address.
3. Install a [WireGuard client](https://www.wireguard.com/install/) on the client device.
4. Import the downloaded client configuration into WireGuard, or scan its QR code on mobile.
5. Connect from outside the LAN, for example using mobile data, and check access to Quollix apps and the internet.

By default, all traffic goes through the VPN (`AllowedIPs = 0.0.0.0/0, ::/0`). For split tunneling, adjust `AllowedIPs` to select which destinations use the VPN. See WireGuard's [routing configuration documentation](https://git.zx2c4.com/wireguard-tools/about/src/man/wg-quick.8#configuration).

## Access policy

On the [installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) page, keep the app's access policy set to **Admin only** so only administrators can access the VPN management interface.
