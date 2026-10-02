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

Before you start, ensure to have met the requirements of your [deployment option]({{< relref "docs/self-hosting/deployment-options" >}}).

## Installation

- Open wgeasy app.
- Select **Continue**, enter administrator credentials, and select **Create Account**.
- At **Do you have an existing setup?**, select **No**.
- Set **Host** to a public IP address or hostname, such as `wgeasy.example.com`. If Quollix is behind a router, use the router's public IP. A static IP is simplest. If it changes regularly, use a hostname with DDNS. Keep **Port** at `51820`.
- Select **Continue** and sign in.

## Configure DNS

- Open **Administrator → Admin Panel → Config → DNS**.
- Replace the existing entries with the DNS server's LAN IP address. If you use AdGuard running on Quollix, use Quollix's LAN IP address.
- Select **Save**.

## Create VPN clients

Create a separate client for each device:

- On the **Clients** page, create a client.
- Open **Edit → View Configuration**. Check that `DNS` is the configured DNS server's LAN IP address.
- Install a [WireGuard client](https://www.wireguard.com/install/) on the client device.
- Import the downloaded client configuration into WireGuard, or scan its QR code on mobile.
- Connect from outside the LAN, for example using mobile data, and check access to Quollix apps and the internet.

By default, all traffic goes through the VPN (`AllowedIPs = 0.0.0.0/0, ::/0`). For split tunneling, adjust `AllowedIPs` to select which destinations use the VPN. See WireGuard's [routing configuration documentation](https://git.zx2c4.com/wireguard-tools/about/src/man/wg-quick.8#configuration).

## Access policy

On the [installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) page, keep the app's access policy set to **Admin only** so only administrators can access the VPN management interface.
