---
title: "Create your first app"
---

This article explains how you can continue after [onboarding]({{< relref "docs/project/app-store/join" >}}) and upload your first app for distribution.

## High-level description

Before you create and upload an app, it helps to understand a few basic concepts.

### App Store data model

The App Store data model is a hierarchy of app maintainers, apps, and versions. An app maintainer can publish many apps, and each app can have many versions. You can think of apps as folders that contain uploaded versions. For example:

```plain
- samplemaintainer
  - nextcloud
    - 33.0
    - 34.0
  - vaultwarden
    - ...
- samplemaintainer2
  - ...
```

### Local data model

On your local machine, keep your app definitions in one folder. Each app definition is a Docker Compose YAML file, such as `nextcloud.yml` or `vaultwarden.yml`. For example:

```
/home/sampleuser/Documents/quollix-apps:
- nextcloud.yml
- vaultwarden.yml
- ...
```

The local files usually represent only the current app versions you maintain. The App Store keeps the full history of uploaded versions.

### Upload signing

App version uploads are signed with your private key. This helps prevent users from downloading malicious app definitions if an App Store server is compromised.

## Create your first app

First, create the app in the App Store with `qsc`. This creates the app entry that uploaded versions are attached to. The example below uses HedgeDoc.

```bash
./qsc apps create hedgedoc
```

List your apps to confirm that `hedgedoc` was created.

```bash
./qsc apps list
```

Then add a HedgeDoc app definition named `hedgedoc.yml` to the apps folder configured during onboarding:

```yaml
# This file is licensed under the 0BSD License: https://opensource.org/license/0bsd

services:
  hedgedoc:
    image: quay.io/hedgedoc/hedgedoc:1.12.0-alpine
    container_name: <replace-me-by-your-app-maintainer-name>_hedgedoc_hedgedoc
    environment:
      CMD_DB_URL: "sqlite://:memory:"
      CMD_DOMAIN: "hedgedoc.${BASE_DOMAIN}"
      CMD_PROTOCOL_USESSL: "true"
      CMD_URL_ADDPORT: "false"
    labels:
      quollix.port: 3000
```

This app definition is not meant for production use. Next, upload the file:

```
./qsc local upload
```

List the app versions to confirm that the upload succeeded:

```bash
./qsc versions list <your-app-maintainer-name> hedgedoc
```

After the upload succeeds, the definition should appear in search results on the [App Store page]({{< relref "docs/usage/app-store" >}}). To find it, search for your exact app maintainer name.
