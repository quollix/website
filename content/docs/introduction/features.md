---
title: "Features"
weight: 10
---

Legend:

- {{<checkmark>}} fully implemented
- {{<tilde>}} partially implemented
- {{<cross>}} not yet implemented

| Feature                                                                      | Implementation Status |
| ---------------------------------------------------------------------------- | :-------------------: |
| [Access Policy]({{< relref "docs/usage/installed-apps" >}})                  |    {{<checkmark>}}    |
| [App Secrets]({{< relref "docs/usage/app-secrets.md" >}})                    |    {{<checkmark>}}    |
| [App Store]({{< relref "docs/project/app-store" >}})                         |    {{<checkmark>}}    |
| [Backups]({{< relref "docs/usage/backups.md" >}})                            |    {{<checkmark>}}    |
| [Certificate]({{< relref "docs/usage/settings/certificate.md" >}})           |    {{<checkmark>}}    |
| [DNS server]({{< relref "docs/usage/installed-apps/adguard.md" >}})          |    {{<checkmark>}}    |
| [Email]({{< relref "docs/usage/email.md" >}})                                |      {{<tilde>}}      |
| [Federation]({{< relref "docs/usage/federation" >}})                         |    {{<checkmark>}}    |
| [Groups]({{< relref "docs/usage/groups.md" >}})                              |    {{<checkmark>}}    |
| [Log centralization]({{< relref "docs/usage/installed-apps/grafana" >}})  |    {{<checkmark>}}    |
| [Maintenance]({{< relref "docs/usage/maintenance.md" >}})                    |    {{<checkmark>}}    |
| [Resource monitoring]({{< relref "docs/usage/installed-apps/grafana" >}}) |    {{<checkmark>}}    |
| Networking                                                                   |    {{<checkmark>}}    |
| Report                                                                       |      {{<cross>}}      |
| [Terminal]({{< relref "docs/usage/terminal.md" >}})                          |    {{<checkmark>}}    |
| [Users]({{< relref "docs/usage/users.md" >}})                                |    {{<checkmark>}}    |
| [VPN server]({{< relref "docs/usage/installed-apps/wgeasy.md" >}})           |    {{<checkmark>}}    |

## Access policy

Admins can set an access policy for each app individually, for example restricting access to registered users or making an app public so anyone can use it without an account.
Public access can be used for blogs, forums, and websites.

## App secrets

Quollix generates and injects app-specific random secrets for installed apps.
These secrets provide cryptographic randomness that some apps need for secure operation.

## App store

The [App Store]({{< relref "docs/project/app-store/_index.md" >}}) is the central location for downloading and installing apps and updates.
It supports official and third-party [app definitions]({{< relref "docs/project/terminology.md" >}}).

## Backups

Create backups of your apps on an external server and restore them when needed.
Backups also support migration between servers.

## Certificate

Quollix enables you to generate certificates that encrypt network data transmitted between users' browsers and the app.

## DNS server

Install the [official AdGuard app]({{< relref "docs/usage/installed-apps/adguard.md" >}}) as a DNS server for local name resolution and DNS filtering.

## Email

Quollix can send templated emails for user invitations and password resets.
It also delivers system reports for important events, such as updates, backups, and critical system conditions.
Administrators can email all users of a Quollix server, for example, to share news and important updates.

## Federation

Quollix can act as an OIDC provider.
This allows apps deployed with Quollix, other Quollix servers, and other compatible OIDC clients to use Quollix accounts for sign-in.
Quollix can also act as an OIDC client, so users can sign in through another OIDC provider.
Potential providers include Google, Microsoft Entra ID, authentik, Okta, or another Quollix server.

{{< alert title="Note" color="warning" >}}
Quollix uses generic OIDC client support, so standards-compliant providers should work.
The external providers mentioned above have not been tested by the Quollix project yet.
If you use Quollix with one of them, feedback and integration reports are welcome through the <a href='{{< relref "docs/contact/feedback.md" >}}'>feedback page</a>.
{{< /alert >}}

Together, these provider and client capabilities make up Quollix federation, where multiple Quollix servers can share identity.

## Groups

Groups allow you to organize people by role, team, or department and manage which apps they can access across your organization.

## Log centralization

Quollix and the [Grafana app]({{< relref "docs/usage/installed-apps/grafana" >}}) collect and store app and host logs centrally, structuring recognized log formats for detailed filtering, searching, and visualization.

## Maintenance

Quollix runs a background maintenance agent that automatically updates installed apps, creates backups, and removes outdated backups.

## Resource monitoring

Quollix and the [Grafana app]({{< relref "docs/usage/installed-apps/grafana" >}}) collect, store, and visualize app and host resource metrics.
Administrators can configure alerts for conditions such as high CPU load or low disk space.

## Networking

When an app is installed, Quollix acts as a network proxy so that users can immediately access the app through a subdomain.

## Report

Administrators receive reports about maintenance events, such as app updates, backups, and critical conditions.

## Terminal

Provides browser-based shell access to app containers.
It allows administrators to directly interact with running apps for tasks such as initial setup, troubleshooting, maintenance, configuration changes, and advanced debugging, without requiring SSH access to the host system.

## Users

Create user accounts and grant them access to apps.
You can create an unlimited number of users.

## VPN server

Install the [official WgEasy app]({{< relref "docs/usage/installed-apps/wgeasy.md" >}}) as a WireGuard VPN server for remote access to Quollix and its apps without exposing them directly to the internet.
