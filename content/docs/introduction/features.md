---
title: "Features"
weight: 10
---

Legend:

* {{<checkmark>}} fully implemented
* {{<tilde>}} partially implemented
* {{<cross>}} not implemented

| Feature            | Implementation Status |
|--------------------|:------:|
| Access Policy      | {{<checkmark>}} |
| App Store          | {{<tilde>}} |
| Backups            | {{<checkmark>}} |
| Certificate        | {{<checkmark>}} |
| Compliance         | {{<cross>}} |
| Email              | {{<tilde>}} |
| Federation         | {{<checkmark>}} |
| Groups             | {{<checkmark>}} |
| Maintenance        | {{<checkmark>}} |
| Monitoring         | {{<cross>}} |
| Networking         | {{<checkmark>}} |
| Report             | {{<cross>}} |
| Single Sign-On     | {{<checkmark>}} |
| Terminal           | {{<checkmark>}} |
| Users              | {{<checkmark>}} |

## Access Policy

Admins can set an access policy for each app individually, for example restricting access to registered users or making an app public so anyone can use it without an account. Public access can be used for blogs, forums, and websites.

## App Store

The [App Store]({{< relref "docs/app-store" >}}) is the central location for downloading and installing apps and updates. Public app publishing is planned, so third-party maintainers will be able to upload their own apps in the future.

## Backups

Create backups of your apps on an external server and restore them when needed. Backups also support migration between servers.

## Certificate

Quollix enables you to generate certificates that encrypt network data transmitted between users' browsers and the app.

## Compliance

Administrators can publish legal documents such as terms of service, privacy policies, or codes of conduct. Users can be required to review and accept these documents before accessing Quollix. Quollix records accepted document versions so administrators can track which conditions users agreed to.

## Email

The email function supports user invitations and password resets by sending templated emails directly from Quollix. It also supports system reports for important events such as updates, backups, and critical system conditions.

## Federation

Federation lets a Quollix server trust another OIDC provider, including another Quollix server.

This allows multiple Quollix servers to share one OIDC provider, so users can sign in once and access several connected servers and the apps available to their account.

## Groups

Groups allow you to organize people by role, team, or department and manage which apps they can access across your organization.

## Maintenance

Quollix runs a background maintenance agent that automatically updates installed apps, creates backups, and removes outdated backups.

## Monitoring

Quollix centralizes the collection of logs and system metrics, including CPU, memory, disk, and network utilization. Data is stored locally on the Quollix server and is not sent outside the environment. A built-in GUI provides visualization and analysis, giving administrators a unified system view.

Collected data is also used to alert administrators about critical events, such as high CPU load or low disk space.

## Networking

When an app is installed, Quollix acts as a network proxy so that users can immediately access the app through a subdomain.

## Report

Administrators receive reports about maintenance events, such as app updates, backups, and critical conditions.

## Single Sign-On

Provides integrated identity and single sign-on (SSO) capabilities based on OpenID Connect (OIDC), so each user only needs a single account to access apps.

## Terminal

Provides browser-based shell access to app containers. It allows administrators to directly interact with running apps for tasks such as initial setup, troubleshooting, maintenance, configuration changes, and advanced debugging, without requiring SSH access to the host system.

## Users

Create user accounts and grant them access to apps. You can create an unlimited number of users.
