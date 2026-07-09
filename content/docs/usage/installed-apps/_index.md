---
title: "Installed apps"
weight: 10
---

On the Installed Apps page, you can manage your apps. You can perform the following operations on an app:

* Start
* Stop
* Backup
* Update, which will create a backup and then install the latest version of the app.
* Delete, which removes the app and its artifacts; only its backups are preserved.
* Download, which provides the app configuration.

## First Start

Starting an app for the first time can take a while. Containers may need to be downloaded in the background, and the app may need to prepare its initial configuration or download additional components. Even after the app is marked as running, it can take anywhere from a few seconds to a few minutes before the app webpage becomes available.

If you change the Quollix base domain, an app's client ID, or its client secret (OIDC), some apps may need additional attention before they work correctly again. If an app stops working or still uses the old settings, restart it first. If the issue remains after the restart, update the related settings in the app's own admin interface.

## Access Policies

Apps use the `Admin only` access policy by default. This is the safest option because some apps need to be configured by an administrator before other users should access them.

Available access policies are:

* `Admin only`: Only Quollix administrators can access the app.
* `Authenticated`: Any signed-in Quollix user can access the app.
* `Group restricted`: Only signed-in users who belong to an authorized group can access the app. See [Groups]({{< relref "docs/usage/groups" >}}).
* `Public`: Anyone can access the app without signing in to Quollix.

Making an app accessible to more users, especially by setting it to `Public`, increases the risk of exposing potential vulnerabilities. Only grant app access to users who genuinely need it.

Typical use cases for public apps include:

* Public content without self-registration: Hosting public resources, such as blogs or wikis, whose content is created by authenticated users.
* Open communities with self-registration: For servers where anyone can register and participate without needing admin approval.
* Client integration: Desktop or mobile clients cannot connect to non-public Quollix apps since they cannot pass Quollix’s authentication layer. Making the app public removes this barrier.

## Downloading and uploading apps

You can manually download and upload apps locally without relying on the official App Store. Backups will still be handled automatically. However, this approach increases your maintenance responsibility because updates must be performed manually. Enabling automatic updates via the app store later for an uploaded app may lead to incompatibilities if the configurations differ.

Only upload app files from sources you trust. App configurations can run containers, access app data, use system resources, and expose services on your server.

If the uploaded app does not exist yet, a new app will be created from the file. If the app already exists, the existing app will be updated. If enabled, a backup may be created before the update.
