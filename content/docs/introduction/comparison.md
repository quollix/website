---
title: "Self-Hosting Platform Comparison"
weight: 40
---

_Last Updated: 07.08.2026_

Several projects try to make self-hosting easier, but they are not all direct replacements for each other. This comparison should help you find the solution that best fits your use case. We aim to be fair and neutral.

This comparison is based on our current understanding of the projects listed below. Projects change over time, so corrections, updates, and feedback are welcome through the [feedback page]({{< relref "docs/feedback.md" >}}).

Included projects:

- [Quollix](https://quollix.org)
- [FreedomBox](https://freedombox.org)
- [YunoHost](https://yunohost.org)
- [Runtipi](https://runtipi.io)
- [StartOS](https://start9.com)

All included projects:

- are fully open source
- can be self-hosted without a vendor account
- do not impose commercial-use limits on self-hosting
- provide a web interface for administration
- focus on apps with web interfaces or standard client apps
- support ARM64, including Raspberry Pi 4 or newer
- can run apps on ARM when the app packaging supports it

Note: StartOS platform software is open source. Standard StartOS installer images include proprietary firmware / drivers for broader hardware compatibility. Slim FOSS-only images are also available for supported hardware.

## Project Positioning

| Aspect | Quollix | FreedomBox | YunoHost | Runtipi | StartOS |
|--------|---------|------------|----------|---------|---------|
| License | Apache 2.0 | AGPL-3.0 | AGPL-3.0 | GPL-3.0 | MIT |
| License complexity | Low, permissive | Higher, copyleft | Higher, copyleft | Higher, copyleft | Low, permissive |
| Primary product focus | Low-complexity extensible Docker self-hosting | Privacy-focused personal server | Debian-based self-hosting administration | One-click Docker homeserver apps | Sovereign personal server OS |

## Architecture and Installation

| Aspect | Quollix | FreedomBox | YunoHost | Runtipi | StartOS |
|--------|---------|------------|----------|---------|---------|
| Installation model | Docker Compose setup | Debian Pure Blend; package or image install | Install script on Debian or pre-built image | Install script | Server OS image or Start9 hardware |
| Host model | Docker host | Debian system | Dedicated Debian server | Docker host | Dedicated server OS |
| Host managed by | Admin | Platform | Platform | Admin | Platform |

## Apps and Extensibility

| Aspect | Quollix | FreedomBox | YunoHost | Runtipi | StartOS |
|--------|---------|------------|----------|---------|---------|
| App package format | `docker-compose.yml` with conventions | Debian packages and FreedomBox components | YunoHost app package with manifest, scripts, resources, and config templates | `config.json` plus `docker-compose.yml` with Runtipi metadata | S9PK service package |
| Custom app integration path | GUI / API upload of Compose YAML | Debian package / Plinth module integration | Custom `_ynh` app package | Custom app definition or custom app store | Sideload `.s9pk` package |
| Custom app integration effort | Low, Compose upload | Higher, Debian / Plinth integration | Higher, package scripts | Medium, Compose plus metadata | Medium to higher, S9PK SDK |
| App isolation strength | Strong | Limited | Partial | Partial | Strong |
| App isolation mechanism | Docker network / volume isolation | Debian / system-level isolation | Unix users / ACLs / systemd | Docker Compose isolation | LXC service isolation |
| Public third-party publishing | Planned self-service App Store | Through Debian / FreedomBox contribution process | Through YunoHost app catalog contribution process | Through custom Git-based app stores | Through Start9, community, or custom registries |
| App update model | Automated app updates with pre-update backups | Automatic via Debian packages | Webadmin or CLI app upgrades | One-click app updates | User-approved service updates |
| App URL model | Dedicated subdomains | App-dependent | Subdomains or subpaths | IP / port locally; domains or paths when exposed | Same host with service ports, private domains optional |
| App catalog size | 8 official apps | 40+ documented apps | 600+ apps | 260+ apps | Registry-dependent |

## Backups

| Aspect | Quollix | FreedomBox | YunoHost | Runtipi | StartOS |
|--------|---------|------------|----------|---------|---------|
| Backup / restore mechanism | Universal volume-based backup / restore; automatic for every app | App-specific | App-specific package scripts | Per-app local archive backup / restore | Service-package-defined backup / restore |
| Remote backup target | SSH server | SSH server | Through backup apps | No | SMB network folder |
| End-to-end encrypted backups | Yes | Configurable | Through backup apps | No | Yes |
| Backup type | Incremental | Incremental | Through backup apps | No | Differential |
| Backup retention policy | Per app | Not documented | No | Global or per-app maximum | No |
| Full-server restore | Backup recovery | Partial | Complete archive restore | Manual archive restore | Backup recovery |

## Identity and Access

| Aspect | Quollix | FreedomBox | YunoHost | Runtipi | StartOS |
|--------|---------|------------|----------|---------|---------|
| Native shared identity | Yes, OIDC-first | Yes, OIDC / LDAP | Yes, LDAP / SSOwat | No | No |
| LDAP directory | No | Yes | Yes | No | No |
| OIDC provider | Yes | Yes | No | No | No |
| OIDC client | Yes | No | No | No | No |
| Cross-instance identity / federation | Yes | No | No | No | No |
| Fine-grained access policies | Yes, per-app access policies and groups | Yes, group-based app access | Yes, group and permission based app access | Limited, expose / unexpose apps only | Limited, service exposure controls only |
| User onboarding flow | Invite token; expiring one-time code; native email delivery | Manual account creation | Manual account creation | No platform users | Single-user platform; app-specific users |

## Administration and Operations

| Aspect | Quollix | FreedomBox | YunoHost | Runtipi | StartOS |
|--------|---------|------------|----------|---------|---------|
| Certificates without public inbound HTTP | Yes, DNS-01 | No | No | Yes, Cloudflare DNS-01 via custom Traefik | Yes, via StartTunnel |
| HTTP-01 certificates with auto-renewal | Planned | Yes | Yes | Yes | Yes |
| App / admin shell access | Browser terminal | Browser terminal | Native CLI | Host / CLI | SSH plus start-cli attach |
| Hardware resource monitoring | Planned | Partial | Limited, diagnosis only | No | Yes |
| App health monitoring | Planned | Partial | Partial | Partial | Yes |
| Operational alert notifications | Planned | No | Partial, diagnosis email alerts | No | SMTP notifications |

## Platform-Managed Services

| Aspect | Quollix | FreedomBox | YunoHost | Runtipi | StartOS |
|--------|---------|------------|----------|---------|---------|
| Platform-managed mail server | No | Yes | Yes | No | No |
| Platform-managed VPN | No, host responsibility | OpenVPN / WireGuard | No | No, host or app responsibility | StartTunnel WireGuard, router VPN supported |
| Dynamic DNS | No | Yes | Yes | No, host or app responsibility | No |
| Private / relay remote access | No | PageKite | No | Manual Cloudflare Tunnel setup | StartTunnel |
| Platform-managed file sharing | No, host responsibility | Samba | App-dependent | Partial, shared media directory | App-dependent |

## Quollix Differentiators

The most relevant Quollix differentiators in this comparison are:

- Backup and restore are automatically integrated for all Compose apps, including custom uploaded apps, with per-app retention policies.
- OIDC is the central identity layer. Quollix can act as both OIDC provider and OIDC client, which enables cross-instance identity and federation.
- User onboarding is invite-based, with expiring one-time codes and native email delivery.
- DNS-01 certificate generation is supported, so apps can get certificates without public inbound HTTP access.
- The planned App Store is intended to support self-service app publishing, where users can register, upload apps, and make them discoverable for others.

## Adjacent Projects

The following projects are related to self-hosting, but are not included because they optimize for different use cases:

- [Sandstorm](https://sandstorm.org) is historically important, but focuses on sandboxed web apps and per-document sharing rather than general server/app administration. Also, the latest tagged release was in 2023.
- [Coolify](https://coolify.io), [CapRover](https://caprover.com), and [Easypanel](https://easypanel.io) are closer to self-hosted platform-as-a-service tools. They focus on flexible deployment and lower-level control rather than simple, opinionated end-user self-hosting.
- [SelfPrivacy](https://selfprivacy.org) has a default model for provisioning a rented / cloud NixOS server through supported provider accounts rather than installing a host-local platform on an existing server.
- [TrueNAS](https://www.truenas.com) and [OpenMediaVault](https://www.openmediavault.org) are primarily NAS or server operating systems. They can run self-hosted applications, but storage and home-server infrastructure are their main focus.
- [CasaOS](https://casaos.zimaspace.com) is not included because the latest stable platform release was in 2024 and current development appears to have shifted toward ZimaOS.

## Excluded Projects

The following projects are not included because they are proprietary, source-available, or do not have a clearly open source project model.

- [Cloudron](https://www.cloudron.io) is source-available under the Cloudron Subscription license.
- [Cosmos](https://cosmos-cloud.io) is source-available and uses Apache 2.0 with the Commons Clause, which is not open source according to the [Commons Clause FAQ](https://commonsclause.com/).
- [Heroku](https://www.heroku.com), [Vercel](https://vercel.com), and [Netlify](https://www.netlify.com) are proprietary hosted platforms.
- [Umbrel](https://umbrel.com) is source-available under the PolyForm Noncommercial license.
- [Unraid](https://unraid.net) is proprietary NAS / home-server software.
- [ZimaOS](https://www.zimaspace.com/zimaos) is evolved from CasaOS, but no open source license was found.
