---
title: "Why use Quollix"
weight: 5
---

## Ownership and portability

- **Open source**: Quollix is fully open source under the permissive MIT License, which keeps legal complexity low.
- **Migration support**: Move Quollix to another server by restoring its app backups on a new server.
- **Vendor independence**: The properties above mean users are not locked into a single vendor.

## Installation and administration

- **Setup**: Quollix provides a [guided installation]({{< relref "docs/getting-started/_index.md" >}}) flow with limited prerequisites.
- **Automated maintenance**: Quollix can update installed apps, create backups, and run selected [service migrations]({{< relref "docs/project/app-store/service-migration.md" >}}) automatically. For example, updating Postgres to a new major version no longer requires administrators to run the migration commands by hand.
- **Generated secrets**: Quollix generates app secrets automatically, so app installations do not need manual secret generation or injection steps.
- **Official apps**: The Quollix team maintains [app definitions]({{< relref "docs/project/terminology.md" >}}) for selected services. See [official apps]({{< relref "/docs/introduction/apps.md" >}}) for the current list.
- **Unified user management**: Users can access multiple apps with one Quollix account through built-in OIDC integration.
- **Private network support**: Quollix can issue Let's Encrypt certificates for home lab and private-network deployments without requiring a public-facing server.

## Privacy and business model

- **Independently owned**: Quollix has no investors, venture capital funding, or private equity ownership, reducing pressure to prioritize growth, lock-in, or data monetization.
- **Data minimization**: Quollix avoids collecting personal data wherever possible and only processes personal information where it is technically necessary.
- **No data monetization**: Personal user data is not sold, shared, or monetized.
- **Privacy-respecting telemetry**: Telemetry is strictly opt-in and anonymous.
- **No mandatory cloud account**: Self-hosting Quollix does not require an account with Quollix.

## App definitions and extensibility

- **[App Store]({{< relref "docs/project/app-store/_index.md" >}})**: Install and manage official and third-party apps.
- **Custom apps**: Create your own app definitions when the existing App Store entries do not cover a service.
- **Software distribution**: If you build web software, the App Store can help you offer your product to customers who prefer self-hosting. Quollix provides a lower-friction option with guided setup and automated maintenance.
- **Portable app definitions**: Apps are defined in human-readable YAML files that are released as open source.
- **Single-file app definitions**: Each Quollix app is defined through a single Docker Compose file, keeping setup simple.

## Data location and infrastructure

- **Data location**: Run Quollix on infrastructure you choose, so you decide where app data is stored and processed.
- **Hardware flexibility**: Quollix supports AMD64 and ARM64 servers, including compatible Raspberry Pi systems. Installed apps may have their own architecture requirements.
- **Resource usage**: Most resource consumption comes from installed apps and user activity. Small deployments can run on low-power hardware.
- **Backup location**: Store end-to-end encrypted app backups on a backup server you choose.

## Security model

- **Threat model**: Quollix documents its security assumptions, risks, and mitigations in the [threat model]({{< relref "/docs/self-hosting/threat-model.md" >}}).
- **Container isolation**: Each app runs with isolated networking and storage, limiting direct interaction between apps.
- **Supply-chain protection**: Official app definitions are cryptographically signed and verified during installation.
- **Access control**: Quollix provides groups and per-app access policies.
