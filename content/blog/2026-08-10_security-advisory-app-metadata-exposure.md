---
title: "Security Advisory: App Metadata Exposure"
date: 2026-08-10
---

Quollix `v1.2.13` fixes an issue where non-admin callers could receive admin-level app metadata for apps that were visible to them through app access policies.

## Recommended action

Update Quollix to `v1.2.13` or newer. For apps that may have been visible to untrusted users, regenerate their OIDC credentials in `Apps → SSO` and update the affected app definition if needed. Update HedgeDoc and Zulip to the latest version to renew the legacy signing or session secret value.

## Affected versions

Affected versions are Quollix `v1.2.1` through `v1.2.12`.

## Impact

The exposure was limited by app access policies. Public apps could be queried by anyone who could reach the Quollix server. Apps restricted to specific users or groups could be queried by those users. Apps not visible to a caller through the app access policy were not exposed to that caller. The exposed metadata could include OIDC client credentials and the legacy signing or session secret value for affected apps. Newly generated `SECRET_*` app secrets are not affected in released versions because they were introduced with the fix. OIDC client credentials do not normally grant direct access to user accounts by themselves, but exposed client secrets should be treated as compromised.
