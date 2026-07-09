---
title: "Backup strategy"
---

This article describes an easy-to-set-up, low-maintenance way to implement the 3-2-1 backup rule for a Quollix server. It focuses on:

- **Privacy** by running Quollix on hardware you control, while storing end-to-end encrypted backups with an external provider.
- **Recoverability** under realistic failure scenarios such as server compromise or accidental deletion.

For a concrete external backup target setup, see the [backup server setup]({{< ref "docs/self-hosting/backup-server-setup.md" >}}).

## 3-2-1 Backup Rule

The [3-2-1 backup rule](https://en.wikipedia.org/wiki/Backup#3-2-1_Backup_Rule) is a widely recommended approach to data backup. It recommends:

- 3 copies of data
- 2 independent trust domains
- 1 off-site copy

## Proposed Architecture

<img src="/images/backup-architecture.svg" alt="Backup Architecture" width="1000">

The above diagram shows a backup architecture that complies with the 3-2-1 rule. The system is organised into two trust domains.

### 1. Quollix Trust Domain

This domain contains all components controlled by Quollix:

- **Production system**: Runs Quollix and hosts app data.
- **Backup system**: Receives backups from the production system. Backups are created using Restic and are end-to-end encrypted before leaving the production system.

The encryption key is managed by Quollix and is not accessible to the storage provider, ensuring that backup contents cannot be read externally. Because both the production and backup systems are controlled by Quollix within the same trust domain, a compromise of the production system may also allow deletion of the backup system.

### 2. Provider Trust Domain

This domain is controlled by the infrastructure provider and is independent from Quollix:

- **Provider-managed backups**: The backup system’s storage is protected by provider-managed snapshots or backups that are created automatically, not accessible via SSH and restorable only via the provider’s control panel or API.

These backups provide an independent recovery mechanism if both the production system and the backup system are lost or deleted. Restores from this domain are triggered out-of-band, using separate credentials and access paths.

## Mapping to the 3-2-1 Rule

This architecture fulfills the intent of the 3-2-1 rule as follows:

- 3 copies of data: production data, backup system data, provider-managed backups
- 2 independent trust domains: Quollix trust domain, provider trust domain
- 1 off-site copy: provider-managed backups stored outside the production server

## Convenient hosted setup

A convenient but less private setup is to run Quollix on a VPS and use external backup storage from the same provider. This avoids owning server hardware, but the provider becomes part of the trust domain for the live server and may have infrastructure-level access to the running disks.

In this setup, the provider is the single infrastructure trust domain so far. Therefore, keep an additional offline copy outside the provider account, for example with `rsync` to a local machine.

## Notes on Providers

This setup is provider-agnostic. Any provider offering SSH-accessible storage and provider-managed backups or snapshots can be used. Alternatively, a self-managed SSH backup server may be used, provided it is located off-site and managed independently from the production system.
