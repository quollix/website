---
title: "DockerRegistry"
---

{{< app-info >}}

## Resources

| Resource      | Description                                                                          |
| ------------- | ------------------------------------------------------------------------------------ |
| Website       | [distribution.github.io/distribution](https://distribution.github.io/distribution/)  |
| Source code   | [github.com/distribution/distribution](https://github.com/distribution/distribution) |
| License       | [Apache-2.0](https://github.com/distribution/distribution/blob/main/LICENSE)         |
| ARM64 support | Supported                                                                            |

## Introduction

DockerRegistry runs the Docker Registry as a pull-through cache for Docker Hub images.
It is intended for LAN environments where multiple clients can reuse cached images, reducing repeated downloads from Docker Hub and the chance of hitting pull rate limits.

## Configure server

On the [installed apps]({{< relref "docs/usage/installed-apps/_index.md" >}}) page, set this app's access policy to `Public` so Docker clients can access it without Quollix authentication.

## Configure Docker clients

On each Docker Engine host, configure the registry mirror in `/etc/docker/daemon.json` as follows:

```json
{
  "registry-mirrors": ["https://dockerregistry.<base-domain>"]
}
```

Replace `<base-domain>` with the [base domain]({{< relref "docs/usage/settings/base-domain.md" >}}) configured in Quollix settings.
Docker tries the configured mirror first and falls back to Docker Hub when the mirror cannot serve the image.
Images from registries other than Docker Hub do not use this mirror.
To apply the settings, restart the Docker daemon:

```bash
sudo systemctl restart docker
```

## Security note

The registry is configured as a pull-through cache, so image pushes are unsupported.
Docker verifies that image layers match the manifest served by the registry, but pulls do not verify that Docker Hub published that manifest.
A compromised registry could therefore serve a malicious image that Docker hosts may run.

## Check cached images

After a client pulls an image through DockerRegistry, open its container in the Quollix [terminal]({{< relref "../terminal.md" >}}).
Run this command to check the cached repositories:

```sh
ls /var/lib/registry/docker/registry/v2/repositories/
```

The listed directories are repositories stored in the cache.
For example, Docker Hub's `nginx` image appears under `library/nginx`.

## Backups and cache cleanup

Cached images can be downloaded again, so we recommend disabling automatic backups for DockerRegistry in [maintenance settings]({{< relref "docs/usage/maintenance.md" >}}).
The registry expires proxy cache entries after seven days by default and periodically removes stale data.
