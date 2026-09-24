---
title: Update apps
weight: 20
---

There are two ways to update app definitions:

- **Manual**: find the desired new Docker image tags and update the app definition yourself.
- **Automatic**: use `qsc` to search for newer Docker image tags and their hashes, then write the selected updates to the app definitions.

```bash
./qsc local update
```

`qsc` reads the Compose YAML files from the apps folder configured during onboarding, fetches available tags from each image repository, and selects the highest tag that matches the format of the current tag.

### Pinning image tags

You can also pin specific images by adding an `update.yml` file next to the apps folder:

```plain
/home/sampleuser/Documents/
- quollix-apps/
  - hedgedoc.yml
- update.yml
```

For example:

```yaml
force_image:
  postgres: 17.5-alpine3.22
```

During the update command, `qsc` updates the image to that exact tag. If an image already uses that tag, `qsc` does not search for newer tags.

### Update verification

For production apps, verify the updated app definition before uploading it to the App Store. Manually upload the app definition on the Quollix [installed apps page]({{< relref "docs/usage/installed-apps" >}}) and check both cases:

- Install from scratch to confirm the app works without prior app data.
- Install on top of the previous running version to confirm updates and data migrations work for existing installations.

For that, upload a local app definition file such as `hedgedoc.yml` on the [installed apps page]({{< relref "docs/usage/installed-apps" >}}) and verify that the app works.

### Update paths

Update paths are chronological and one-way. When you upload a new version, Quollix servers will fetch it during their daily update routine and install it.

Do not upload a new app definition that downgrades any service compared with an earlier uploaded version. Quollix may still treat the newer upload as the next update, and the downgrade can break the app. Also see the [migration checkpoints]({{< relref "docs/project/app-store/migration-checkpoints" >}}) article.

### Docker Hub pagination limit

When running automatic updates with `qsc`, Docker Hub images with many tags can fail because anonymous users have limited access to paginated tag results. To avoid this, create a Docker Hub account and configure `qsc` to authenticate when it fetches tags.

After creating a Docker Hub account, create an access token under Account Settings → Personal access tokens. Then store it with `qsc local docker-hub set <username>`. Subsequent updates will use these credentials.

### Duplicate versions

The App Store version is derived from the [main service]({{< relref "docs/project/terminology.md" >}}) image tag. For example, if the HedgeDoc image tag is `1.2.3`, the uploaded app version is `1.2.3`.

This means duplicate version names are possible. If the app definition is updated later and only a side service changes, for example Postgres from `17.0` to `17.1`, the HedgeDoc version remains `1.2.3`. Uploading that app definition creates another App Store version named `1.2.3`. This is intentional. App Store versions are identified by version name and creation timestamp.
