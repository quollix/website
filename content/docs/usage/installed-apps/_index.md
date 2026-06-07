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

## First Start

Starting an app for the first time can take a while. Containers may need to be downloaded in the background, and the app may need to prepare its initial configuration or download additional components. Even after the app is marked as running, it can take anywhere from a few seconds to a few minutes before the app webpage becomes available.

If you change the Quollix server host, the app's client ID, or client secret (OIDC), restart the app so the new settings are applied correctly.

## Public Apps

By default, all apps are private, meaning only authenticated Quollix users can access them. However, you can make an app public, allowing anyone to access it without authentication.

Typical use cases for public apps include:

* Public content without self-registration: Hosting public resources, such as blogs or wikis, whose content is created by users who have been invited by an admin.
* Open communities with self-registration: For servers where anyone can register and participate without needing admin approval. 
* Client integration: Some desktop or mobile clients cannot connect to private Quollix apps since they cannot pass Quollix’s authentication layer. Making the app public removes this barrier.

## Access Policy

Making an app accessible to more users, e.g. publicly available, increases the risk of exposing potential vulnerabilities. Only grant app access only to users who genuinely need it.

## Downloading and uploading apps

You can manually download and upload apps locally without relying on the official App Store. Backups will still be handled automatically. However, this approach increases your maintenance responsibility because updates must be performed manually. Enabling automatic updates via the app store later for an uploaded app may lead to incompatibilities if the configurations differ.

If the uploaded app does not exist yet, a new app will be created from the file. If the app already exists, the existing app will be updated. If enabled, a backup may be created before the update.
