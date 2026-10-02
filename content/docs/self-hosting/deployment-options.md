---
title: "Deployment options"
aliases:
  - /docs/self-hosting/dns-and-networking/
---

When choosing a deployment option, consider these two questions:

- Do you want to host the server on your own hardware or in the cloud?
- Should it be publicly accessible over HTTPS, or available only through a LAN or VPN?

The options are:

| Deployment option       | DNS         | VPN                         | Main benefit                                         |
| ----------------------- | ----------- | --------------------------- | ---------------------------------------------------- |
| 1. Public cloud server  | Public DNS  | Not required                | Direct access from anywhere                          |
| 2. Private cloud server | Private DNS | Required for user access    | Private access without maintaining physical hardware |
| 3. Private LAN          | Private DNS | Optional, for remote access | Runs on your own hardware, maximum data privacy      |

{{< alert title="Discouraged" color="warning" >}}
Exposing HTTP(S) ports to the internet increases the server's exposure to attacks. If your requirements allow it, we recommend keeping the server private behind a LAN or VPN.
{{< /alert >}}

We discourage exposing the Quollix server HTTP(S) ports on your LAN directly to the internet. If Quollix or an app is compromised, other devices on the LAN could also be at risk.

## 1. Public cloud server

Use this option for public collaboration services, such as discussion forums or public code repositories, or when information should be publicly available and VPN access would be impractical or unnecessary.

- Rent a server, for example [a Hetzner VPS]({{< relref "docs/self-hosting/hetzner-cloud.md" >}}).
- Configure the cloud provider's firewall to allow ports `22/TCP`, `80/TCP`, and `443/TCP`.
- Create a wildcard DNS record with your DNS provider:

```text
*.example.com A <public-server-ip>
```

- If you use IPv6, create the corresponding `AAAA` record as well.
- Finish the [production setup guide]({{< relref "docs/getting-started/production-setup" >}}).

## 2. Private cloud server

This setup is similar to the private LAN setup below. You do not need a router, but clients must connect through a VPN to access Quollix and its apps.

- Rent a server, for example [a Hetzner VPS]({{< relref "docs/self-hosting/hetzner-cloud.md" >}}).
- Create a public wildcard DNS record pointing to the VM's public IP. This lets you reach Quollix and AdGuard during setup. Afterward, AdGuard's private DNS rewrite resolves Quollix and app domains to the VM's private IP for VPN clients.

```text
*.example.com A <public-server-ip>
```

- Configure the cloud provider's firewall to allow ports `22/TCP`, `80/TCP`, `443/TCP`, and `51820/UDP`. Ports `80` and `443` are needed only during initial setup.
- Get a private IP address for the cloud server.
  - For example, in Hetzner Cloud, select the server → **Networking → Private Networks → Create Network** and assign an IP address.
- Finish the [production setup guide]({{< relref "docs/getting-started/production-setup" >}}).
- Install and configure the official apps from the [App Store page]({{< relref "docs/usage/app-store" >}}):
  - [AdGuard]({{< relref "docs/usage/installed-apps/adguard" >}})
  - [WgEasy]({{< relref "docs/usage/installed-apps/wgeasy" >}})
- Test the VPN connection and confirm that Quollix and its apps are accessible.
- Close ports `80` and `443` in the cloud provider's firewall.

## 3. Private LAN

On a LAN, devices on the same local network can access Quollix directly, so a VPN is optional. Install a VPN if users also need remote access.

- Prepare an Ubuntu server on your hardware.
- Assign the server a static IP address, for example, with a DHCP reservation in your router.
- Add the entries below to your `/etc/hosts` file on Linux, or to `C:\Windows\System32\drivers\etc\hosts` on Windows. Later, this lets you access Quollix, AdGuard, and WgEasy during setup.

```text
<quollix-server-lan-ip> quollix.<base-domain>
<quollix-server-lan-ip> adguard.<base-domain>
<quollix-server-lan-ip> wgeasy.<base-domain>
```

- Finish the [production setup guide]({{< relref "docs/getting-started/production-setup" >}}).
- Install and configure the official apps from the [App Store page]({{< relref "docs/usage/app-store" >}}):
  - [AdGuard]({{< relref "docs/usage/installed-apps/adguard" >}})
  - [WgEasy]({{< relref "docs/usage/installed-apps/wgeasy" >}}) (if needed)
- Configure your router to use AdGuard as the DNS server for devices on the LAN.
- For remote access via wgeasy, forward UDP port `51820` from your router to the Quollix servers LAN IP address. Allow this traffic through any firewalls.
