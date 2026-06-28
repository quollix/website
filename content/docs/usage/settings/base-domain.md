---
title: "Base Domain"
weight: 10
---

The base domain is the domain suffix Quollix uses for itself and installed apps.

For example, if the base domain is **example.com**:

* Quollix is available at **quollix.example.com**.
* Installed apps are available at **<app-name>.example.com**, such as **nextcloud.example.com** or **vaultwarden.example.com**.
* No Quollix service is served from the bare domain **example.com**.

For local testing, you can simply use **localhost** as the base domain.

Note: This proxying requires that the domain (e.g. forgejo.company.com) resolves to the server where Quollix is installed, either via a DNS record or an entry in your system's hosts file.

{{< alert title="Production changes" color="warning" >}}
Changing the base domain in production can affect app availability, DNS resolution, TLS certificates, OIDC sign-in, and app-specific security settings. Coordinate the change carefully to avoid temporary disruption.
{{< /alert >}}

For OIDC clients, the Quollix domain is part of the OIDC issuer. Changing the base domain changes that issuer. Connected OIDC clients may reject sign-in until their OIDC provider, redirect, or discovery settings are updated. Some apps may also treat the same Quollix user as a different account because the issuer changed.

Some apps use the base domain for security or compatibility reasons. If an app stops working or still uses old settings after the change, restart it first. If the issue remains, update the related base domain, OIDC provider, or redirect settings in the app's own admin interface.

If you use a Let's Encrypt certificate, the existing certificate may no longer match the new base domain. Request a new certificate after changing the base domain.
