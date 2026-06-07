---
title: "Why Quollix"
weight: 5
---

## Software Ownership

- **Open-source core**: The core platform [features]({{< relref "/docs/introduction/features.md" >}}) are open source. You can inspect, modify, and understand how the system works.
- **Migration support**: Built-in migration features support switching environments, for example, between externally hosted and self-hosted deployments.
- **Reduced dependency risk**: Open source reduces risks associated with sudden feature removals, restrictive licensing changes, or strategic shifts in a company's priorities.
- **Forkable core**: If Quollix were no longer maintained or no longer met your needs, the open-source core could still be forked and maintained independently.

## Data Location and Access

- **Self-hosting support**: Run Quollix on hardware you control. Choose where your data is stored and processed.
- **Hardware flexibility**: Quollix supports both AMD64 and ARM64 servers, so it can run on conventional server hardware and compatible ARM devices, including Raspberry Pi systems. Installed apps may have their own architecture support.
- **Control over backups**: Keep ownership of your backups and recovery strategy.
- **Privacy approach**: We believe software should collect and process only the data necessary to provide its functionality.
- **Data handling transparency**: The open-source core allows you to verify how data is handled.

## Security by Design

- **Threat-aware design**: Quollix documents its security assumptions, risks, and mitigations in the [threat model]({{< relref "/docs/self-hosting/threat-model.md" >}}).
- **Container isolation**: Each app runs in an isolated network and uses isolated storage, so apps are unaware of each other.
- **Access control**: Quollix provides centralized authentication with roles, groups, and app access policies.
- **Supply-chain protections**: Official apps are cryptographically signed and verified on installation.

## Ownership and Funding

- **Independently owned**: Quollix has no investors, venture capital funding, or private equity ownership. This allows decisions to be made with long-term user interests in mind without external pressure.
- **No data monetization**: Personal user data is not a business asset. Quollix does not rely on selling, sharing, or monetizing personal user information.
- **Privacy respecting telemetry**: Telemetry is strictly opt-in and anonymous.
- **No mandatory cloud account**: Self-hosting Quollix does not require creating an external Quollix account.

## Managed Self-Hosting

- **Setup**: The installation flow is designed to keep the required steps and prerequisites limited. See the [getting started guide]({{< relref "docs/getting-started/_index.md" >}}).
- **Automated maintenance**: Backups and updates are handled by the platform.
- **Officially supported apps**: The Quollix team maintains a curated set of [official apps]({{< relref "/docs/introduction/apps.md" >}}).
- **Unified user management**: The built-in single sign-on integration represents a shared authentication system across apps.
- **Private network support**: Quollix includes features for deployments in home labs and private networks, including Let's Encrypt certificate management without requiring a public-facing server.

## Customization

- **App ecosystem**: Install and manage apps through the Quollix App Store, with access to both official and community-provided apps. All app configurations there are released under the open-source 0BSD license.
- **Portable app definitions**: Apps are described using YAML configuration files that are intended to be readable and editable.
- **Create your own apps**: Define and deploy your own apps. Simple app definitions can require only a few lines of YAML code.
- **Resource usage**: Most resource consumption comes from installed apps and user activity. Lightweight deployments can run on modest hardware.
