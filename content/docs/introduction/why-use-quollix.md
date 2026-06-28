---
title: "Why Use Quollix"
weight: 5
---

## Ownership and Portability

* **Open source**: Quollix is published under an open source license, giving users the right to use, study, modify, and share the software.
- **Migration support**: Move Quollix to another server by restoring its app backups on a new server.
- **Vendor independence**: These properties mean users are not locked into a single vendor.

## Installation and Administration

- **Setup**: Quollix provides a guided installation flow with limited prerequisites. See the [getting started guide]({{< relref "docs/getting-started/_index.md" >}}).
- **Automated maintenance**: Quollix can update installed apps and create backups automatically.
- **Official apps**: The Quollix team maintains [app definitions]({{< relref "/docs/introduction/apps.md" >}}) for selected services.
- **Unified user management**: Users can access multiple apps with one Quollix account through built-in OIDC integration.
- **Private network support**: Quollix can issue Let's Encrypt certificates for home lab and private-network deployments without requiring a public-facing server.

## Privacy and Business Model

- **Independently owned**: Quollix has no investors, venture capital funding, or private equity ownership, reducing pressure to prioritize growth, lock-in, or data monetization.
- **Data minimization**: Quollix avoids collecting personal data wherever possible and only processes personal information where it is technically necessary.
- **No data monetization**: Personal user data is not sold, shared, or monetized.
- **Privacy-respecting telemetry**: Telemetry is strictly opt-in and anonymous.
- **No mandatory cloud account**: Self-hosting Quollix does not require an account with Quollix.

## App Definitions and Extensibility

- **App Store**: Install and manage apps through the Quollix App Store. Third-party app publishing is planned.
- **Portable app definitions**: App definitions are human-readable YAML files released as open source software, so they can be inspected, modified, shared, and used outside the App Store.
- **Custom apps**: Create your own app definitions when the existing App Store entries do not cover a service.

## Data Location and Infrastructure

- **Data location**: Run Quollix on infrastructure you choose, so you decide where app data is stored and processed.
- **Hardware flexibility**: Quollix supports AMD64 and ARM64 servers, including compatible Raspberry Pi systems. Installed apps may have their own architecture requirements.
- **Resource usage**: Most resource consumption comes from installed apps and user activity. Small deployments can run on low-power hardware.
- **Backup location**: Store end-to-end encrypted app backups on a backup server you choose.

## Security Model

- **Threat model**: Quollix documents its security assumptions, risks, and mitigations in the [threat model]({{< relref "/docs/self-hosting/threat-model.md" >}}).
- **Container isolation**: Each app runs with isolated networking and storage, limiting direct interaction between apps.
- **Supply-chain protection**: Official app definitions are cryptographically signed and verified during installation.
- **Access control**: Quollix provides groups and per-app access policies.
