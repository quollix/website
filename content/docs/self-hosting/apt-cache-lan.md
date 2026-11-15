---
title: "Cache APT packages on a LAN"
---

This guide sets up Apt-Cacher NG on a Quollix Ubuntu server to cache HTTP package downloads for Debian and Ubuntu clients on a LAN.

## Install Apt-Cacher NG

Install the package:

```sh
sudo apt update
sudo apt install apt-cacher-ng
```

Apt-Cacher NG listens on TCP port `3142` by default.

## Configure clients

On each Debian or Ubuntu client, create `/etc/apt/apt.conf.d/02proxy` with:

```text
Acquire::http::Proxy "http://<server-ip>:3142";
```

Replace `<server-ip>` with the cache server's LAN IP address.
APT verifies package hashes against signed repository metadata, protecting package integrity over HTTP.
Apt-Cacher NG does not cache HTTPS repository requests.

## Cache cleanup

A daily cleanup job removes old package versions four days after a newer version replaces them in the upstream repository.
Manually clearing the cache is usually unnecessary, but you can remove it, for example to reclaim disk space:

```sh
sudo systemctl stop apt-cacher-ng
sudo find /var/cache/apt-cacher-ng -mindepth 1 -delete
sudo systemctl start apt-cacher-ng
```
