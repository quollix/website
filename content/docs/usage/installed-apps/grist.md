---
title: "Grist"
---

{{< alert title="Note" color="warning" >}}
Updates to the official Grist app are currently paused.
{{< /alert >}}

This is due to [Grist's August 2026 licensing change](https://support.getgrist.com/newsletters/2026-08/#update-on-oidcsaml-support) for new self-hosted installations. OIDC/SAML SSO is now officially supported only in Grist's proprietary edition.

For now, Grist remains available as an official app in Quollix while we monitor the response from the community. The current App Store version of Grist can still be used with OIDC support. However, while updates are paused, future bug fixes and security fixes from upstream are not included in the official app.

## Resources

| Resource       | Description                                                                                                          |
| -------------- | -------------------------------------------------------------------------------------------------------------------- |
| Website        | [getgrist.com](https://www.getgrist.com)                                                                             |
| Source code    | [github.com/gristlabs/grist-core](https://github.com/gristlabs/grist-core)                                           |
| License        | [Apache-2.0](https://github.com/gristlabs/grist-core/blob/main/LICENSE.txt)                                          |
| ARM64 support  | Supported                                                                                                            |
| OIDC client    | Native                                                                                                               |
| Business model | Open-core product by Grist Labs with hosted services and proprietary paid self-hosted features available separately. |

## Initial setup

- In Quollix, go to Apps → Secrets. In the Grist row, click 'Show secrets' button and copy `SECRET_BOOT_KEY`.
- Visit the Grist web UI. On the boot key page, paste the boot key.
- Select 'Check key'. Grist should show a 'Valid boot key' confirmation.
- In 'Administrator email', enter the email address of the Quollix administrator account you are signed in with.
  - Use the exact Quollix administrator email address. Grist assigns installation administrator permissions to this email address. If you use a different email address, normal OIDC sign-in may not give you access to the admin panel. You can still recover access with the boot key at `/boot`.
- Select 'Continue'. The 'Quick setup' wizard opens.
- On the 'Server' tab, select 'Test URL' and then 'Confirm URL'.
- Select 'Continue with Community edition' and then 'Continue'.
- On the 'Sandboxing' tab, select 'Apply and Continue'.
- On the 'Authentication' tab, select 'Continue'.
- On the 'Backups' tab, select 'No external storage' and then 'Continue'.
- On the 'Apply and restart' tab, keep the defaults unless you need different settings. You can change them later in the admin panel.
- Select 'Apply and go live'.
- Select 'Back to installation'.
