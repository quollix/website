---
title: "Official Apps"
weight: 20
---

Quollix only takes care of the system administration. The actual day-to-day functionality like chat or data cloud comes from the installed apps.

## App store

Digital infrastructure can be installed as apps, much like a smartphone. The [App Store]({{< relref "docs/usage/app-store/" >}}) simplifies the process of discovering and installing new apps and updates.

These are the apps from the official app maintainer 'quollix' currently available on the App Store. They are actively maintained with regular updates. The OIDC SSO column shows whether the app can use Quollix accounts for sign-in:

| App         | Description                                                    |    OIDC SSO     | Website                                        |
| ----------- | -------------------------------------------------------------- | :-------------: | ---------------------------------------------- |
| AdGuard     | DNS server for network-wide ad blocking and local DNS records. |   {{<cross>}}   | [adguard.com](https://adguard.com)             |
| Forgejo     | Git server for code hosting and collaboration.                 | {{<checkmark>}} | [forgejo.org](https://forgejo.org)             |
| HedgeDoc    | Real-time collaborative markdown notes.                        | {{<checkmark>}} | [hedgedoc.org](https://hedgedoc.org)           |
| Jitsi       | Video meetings in the browser.                                 |   {{<cross>}}   | [jitsi.org](https://jitsi.org/jitsi-meet/)     |
| Nextcloud   | File sync, sharing, calendars, contacts, and collaboration.    | {{<checkmark>}} | [nextcloud.com](https://nextcloud.com)         |
| Vaultwarden | Password manager compatible with Bitwarden clients.            | {{<checkmark>}} | [vaultwarden.net](https://www.vaultwarden.net) |
| Vikunja     | Task and project management with lists, boards, and calendars. | {{<checkmark>}} | [vikunja.io](https://vikunja.io)               |
| Wiki.js     | Wiki for team and project documentation.                       | {{<checkmark>}} | [js.wiki](https://js.wiki)                     |
| WordPress   | Website and blog publishing system.                            |   {{<cross>}}   | [wordpress.org](https://wordpress.org)         |
| Zulip       | Team chat with topic-based conversations.                      | {{<checkmark>}} | [zulip.com](https://zulip.com)                 |

## Email servers

Email servers are not included as official apps because reliable email delivery depends on external factors outside Quollix's control, including DNS configuration, IP reputation, and filtering policies of third-party email providers. Self-hosting email often requires ongoing operational attention beyond application management. Advanced users may still run a self-hosted email server at their own discretion.

## Unofficial apps

Third-party [app definitions]({{< relref "docs/project/terminology.md" >}}) can also be published through the [App Store]({{< relref "docs/project/app-store/_index.md" >}}).
