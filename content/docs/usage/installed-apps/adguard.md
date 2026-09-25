---
title: "AdGuard"
---

## Resources

| Resource       | Description                                                                                                                                |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Website        | [adguard.com/adguard-home](https://adguard.com/adguard-home/overview.html)                                                                 |
| Source code    | [github.com/AdguardTeam/AdGuardHome](https://github.com/AdguardTeam/AdGuardHome)                                                           |
| License        | [GPL-3.0](https://github.com/AdguardTeam/AdGuardHome/blob/master/LICENSE.txt)                                                              |
| ARM64 support  | Supported                                                                                                                                  |
| OIDC client    | Not supported                                                                                                                              |
| Business model | AdGuard Home is a fully open source DNS server from AdGuard, which also offers paid subscriptions for its commercial ad-blocking products. |

## Introduction

The app is commonly called AdGuard, but its full product name is AdGuard Home. It blocks domains used to deliver advertisements and tracking, reducing the ads displayed while browsing when a device uses it as its DNS server. It can also provide local DNS records for reaching Quollix and its apps inside a LAN. See [DNS and networking]({{< relref "docs/self-hosting/dns-and-networking.md" >}}) for the general Quollix network setup.

## Free port 53

{{< alert title="Installation prerequisite" color="warning" >}}
The AdGuard installation fails if another service on Quollix already uses port 53. Free the port before installing the app.
{{< /alert >}}

Check whether port 53 is already in use:

```bash
sudo ss -lntup 'sport = :53'
```

Ubuntu commonly runs `systemd-resolved` on this port. If it appears in the output, follow AdGuard Home's instructions for resolving the [`bind: address already in use` error](https://adguard-dns.io/kb/adguard-home/faq/#bindinuse).

## Initial setup

Open AdGuard from the [installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) page and complete the setup wizard:

1. Change the admin web interface port from `80` to `3000`.
2. Set the administrator username and password and finish the wizard.

After setup, AdGuard Home may redirect to an unusable address ending in `:3000` or remain on an endless loading screen. In either case, reopen AdGuard from the installed apps page.

{{< alert title="Network prerequisite" color="warning" >}}
AdGuard Home needs TCP and UDP port 53 to be reachable by DNS clients. Make sure nothing in front of Quollix blocks this port.
{{< /alert >}}

## Configure the LAN

Configure the router to always assign the same private IP address to the Quollix server before other devices start using it for DNS. Next, configure the router's DHCP settings to advertise that address as the local DNS server. This automatically applies the setting to clients when they renew their DHCP leases.

If the router cannot advertise a custom DNS server, configure the Quollix server's private IP address as the DNS server on each device instead. AdGuard Home provides [device-specific instructions](https://adguard-dns.io/kb/adguard-home/getting-started/#configure-devices).

## Create local DNS records

A DNS rewrite can make the Quollix domains resolve to the Quollix server inside the LAN. In the AdGuard Home web interface:

1. Open **Filters → DNS rewrites**.
2. Select **Add DNS rewrite**.
3. Enter the base domain as a wildcard and the private IP address of the Quollix server. For example:

```text
Domain: *.example.com
Answer: 192.168.1.50
```

## Limitations

DNS filtering cannot block advertising served from the same domain as the requested content. This includes some video advertising and sponsored content. See the [AdGuard Home FAQ](https://adguard-dns.io/kb/adguard-home/faq/) for details.

## Access policy

AdGuard Home does not need OIDC or SSO because its web interface is an administrative tool rather than an app for regular users. Keep its access policy set to the default `Admin only` on the installed apps page. AdGuard Home's administrator credentials provide an additional sign-in for the web interface.

The access policy protects the web interface, not the DNS service on port 53. Use network and firewall rules to restrict the DNS service to the intended clients.
