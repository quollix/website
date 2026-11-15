---
title: "Features"
weight: 10
---

## Access policy

Admins can set an [access policy]({{< relref "docs/usage/installed-apps/_index.md" >}}) for each app individually, for example restricting access to registered users or making an app public so anyone can use it without an account.
Public access can be used for blogs, forums, and websites.

## Alerts

Quollix can email administrators about potential server issues through [email alerts]({{< relref "docs/usage/alerts.md" >}}), such as high CPU, memory, or disk usage.

## App store

The [App Store]({{< relref "docs/usage/app-store/" >}}) is the central location for downloading and installing apps and updates.
It supports official and third-party [app definitions]({{< relref "docs/project/terminology.md" >}}).

## Backups

Create [backups]({{< relref "docs/usage/backups.md" >}}) of your apps on an external server and restore them when needed.
Backups also support migration between servers.

## Certificate

Quollix enables you to generate [certificates]({{< relref "docs/usage/settings/certificate.md" >}}) that encrypt network data transmitted between users' browsers and the app.

## DNS server

Install the [official AdGuard app]({{< relref "docs/usage/installed-apps/adguard.md" >}}) as a DNS server for local name resolution and DNS filtering.

## Emails

Administrators can send templated [emails]({{< relref "docs/usage/email.md" >}}) for user invitations and password resets.
Also, they can email all users of a Quollix server, for example, to share news and important updates.

## Groups

[Groups]({{< relref "docs/usage/groups.md" >}}) allow you to organize people by team or department and manage which apps they can access across your organization.

## Log centralization

Quollix and the [Grafana app]({{< relref "docs/usage/installed-apps/grafana" >}}) collect and store app and host logs centrally, structuring recognized log formats for detailed filtering, searching, and visualization.

## Maintenance

Quollix runs a background [maintenance agent]({{< relref "docs/usage/settings/maintenance.md" >}}) that automatically updates installed apps, creates backups, and removes outdated backups.

## Networking

When an app is [installed]({{< relref "docs/usage/app-store/" >}}), Quollix acts as a network proxy so that users can immediately access the app through a subdomain.

## Resource monitoring

Quollix and the [Grafana app]({{< relref "docs/usage/installed-apps/grafana" >}}) collect, store, and visualize app and [host resource metrics]({{< relref "docs/usage/settings/logs-and-metrics.md" >}}).

## Single sign-on and federation

Quollix can act as an OIDC provider.
[Users]({{< relref "docs/usage/users.md" >}}) can use one Quollix account to [sign in to apps]({{< relref "docs/usage/app-sso.md" >}}) deployed with Quollix and [other compatible OIDC clients]({{< relref "docs/usage/federation/oidc-clients" >}}).

Quollix can also act as an OIDC client, so users can sign in to Quollix through [another OIDC provider]({{< relref "docs/usage/federation/oidc-clients" >}}).
Potential providers include Google, Microsoft Entra ID, authentik, Okta, or another Quollix server.

{{< alert title="Note" color="warning" >}}
Quollix uses generic OIDC client support, so standards-compliant providers should work.
The external providers mentioned above have not been tested by the Quollix project yet.
If you use Quollix with one of them, feedback and integration reports are welcome through the <a href='{{< relref "docs/contact/feedback.md" >}}'>feedback page</a>.
{{< /alert >}}

Quollix also supports [federation]({{< relref "docs/usage/federation/_index.md" >}}), allowing multiple Quollix servers to share identity.

## Terminal

Provides [browser-based shell access]({{< relref "docs/usage/terminal.md" >}}) to app containers.
It allows administrators to directly interact with running apps for tasks such as initial setup, troubleshooting, maintenance, configuration changes, and advanced debugging, without requiring SSH access to the host system.

## VPN server

Install the [official WgEasy app]({{< relref "docs/usage/installed-apps/wgeasy.md" >}}) as a WireGuard VPN server for remote access to Quollix and its apps without exposing them directly to the internet.
