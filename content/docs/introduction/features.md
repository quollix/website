---
title: "Features"
weight: 10
---

Quollix is offered in two editions. The Community Edition includes the core features for self-hosting and is intended to cover common personal and small-scale deployments. The Premium Edition adds commercial features for users who require more advanced functionality. For the reasoning behind this open-core boundary, see the [Principles]({{< relref "docs/about/principles.md" >}}) page.

## Features by Edition

Below are the key features. A check mark means the feature is available, and a cross means it’s not available in the associated edition.

| Feature            |    Community    |     Premium     |
|--------------------|:---------------:| :-------------: |
| Access Policy      | {{<checkmark>}} | {{<checkmark>}} |
| App Store*         | {{<checkmark>}} | {{<checkmark>}} |
| Backups            | {{<checkmark>}} | {{<checkmark>}} |
| Certificate        | {{<checkmark>}} | {{<checkmark>}} |
| Federation*        | {{<checkmark>}} | {{<checkmark>}} |
| Maintenance        | {{<checkmark>}} | {{<checkmark>}} |
| Networking         | {{<checkmark>}} | {{<checkmark>}} |
| Single Sign-On*    | {{<checkmark>}} | {{<checkmark>}} |
| Users              | {{<checkmark>}} | {{<checkmark>}} |
| Compliance*        |   {{<cross>}}   | {{<checkmark>}} |
| Email*             |   {{<cross>}}   | {{<checkmark>}} |
| Groups             |   {{<cross>}}   | {{<checkmark>}} |
| Monitoring*        |   {{<cross>}}   | {{<checkmark>}} |
| Report*            |   {{<cross>}}   | {{<checkmark>}} |
| Terminal           |   {{<cross>}}   | {{<checkmark>}} |

(*) Not or only partly implemented yet.

## Included in All Editions

### Access Policy

Admins can set an access policy for each app individually, for example restricting access to registered users or making an app public so anyone can use it without an account. Public access can be used for blogs, forums, and websites.

### App Store

The App Store is the central location for downloading and installing apps and updates. Public app publishing is planned, so third-party maintainers will be able to upload their own apps in the future.

### Backups

Create backups of your apps on an external server and restore them when needed. Backups also support migration between servers.

### Certificate

Quollix enables you to generate certificates that encrypt network data transmitted between users' browsers and the app.

### Federation

Federation lets a Quollix instance trust an external OpenID Connect (OIDC) identity provider. This can be another Quollix instance or a provider such as Keycloak, Microsoft Entra ID, or GitHub.

This allows multiple Quollix instances to share one identity source, so users can sign in once and access several connected servers with the same account.

### Maintenance

Quollix runs a background maintenance agent that automatically updates installed apps, creates backups, and removes outdated backups.

### Networking

When an app is installed, Quollix acts as a network proxy so that users can immediately access the app through a subdomain.

### Single Sign-On

Provides integrated identity and single sign-on (SSO) capabilities based on OpenID Connect (OIDC), so each user only needs a single account to access apps.

### Users

Create user accounts and grant them access to apps. In any edition, you can create an unlimited number of users.

## Premium Features

### Compliance

Administrators can define and manage compliance documents such as terms of service, privacy policies, or codes of conduct. Users can be required to explicitly agree to these documents before accessing the platform. Each consent is recorded as evidence to help protect administrators in the event of future legal disputes.

### Email

The email function supports user invitations and password resets by sending templated emails directly from Quollix. It also supports system reports for important events such as updates, backups, and critical system conditions.

### Groups

Groups allow you to organize people by role, team, or department and manage which apps they can access across your organization.

### Monitoring

Quollix centralizes the collection of logs and system metrics, including CPU, memory, disk, and network utilization. Data is stored locally on the Quollix server and is not sent outside the environment. A built-in GUI provides visualization and analysis, giving administrators a unified system view.

Collected data is also used to alert administrators about critical events, such as high CPU load or low disk space.

### Report

Administrators receive reports about maintenance events, such as app updates, backups, and critical conditions.

### Terminal

Provides browser-based shell access to app containers. It allows administrators to directly interact with running apps for tasks such as initial setup, troubleshooting, maintenance, configuration changes, and advanced debugging, without requiring SSH access to the host system.
