---
title: "Reverse proxy setup"
---

By default, Quollix listens on ports `80` and `443`, redirects HTTP traffic to HTTPS, and forwards app requests with `X-Forwarded-Proto: https`. This is the recommended setup when Quollix is directly reachable from browsers.

If you place Quollix behind a reverse proxy, route `*.<base-domain>` to Quollix. Preserve the original `Host` header so Quollix can route each request correctly.

## Common HTTPS reverse proxy setup

In the usual reverse proxy setup, the public browser-facing URL still uses HTTPS. The reverse proxy terminates TLS and forwards plain HTTP to Quollix on an internal network. In this case, disable Quollix's own HTTP-to-HTTPS redirect, but keep the app forwarded protocol as `https`:

```yaml
services:
  quollix:
    image: quollix/quollix:latest
    environment:
      REDIRECT_HTTP_TO_HTTPS: false
      APP_FORWARDED_PROTO: https
```

`REDIRECT_HTTP_TO_HTTPS: false` tells Quollix not to redirect traffic received on port `80`. `APP_FORWARDED_PROTO: https` makes Quollix tell apps that the public request scheme is HTTPS. This should remain the default for normal production deployments.

## HTTP app forwarding

Only set `APP_FORWARDED_PROTO=http` when the public user-facing app URLs are intentionally HTTP:

```yaml
services:
  quollix:
    image: quollix/quollix:latest
    environment:
      REDIRECT_HTTP_TO_HTTPS: false
      APP_FORWARDED_PROTO: http
```

{{< alert title="Discouraged" color="warning" >}}
This setup is strongly discouraged for production internet-facing setups because traffic from browser to server is not encrypted. Also, some official apps may require an HTTPS forwarded protocol for security-sensitive behavior and may stop working with this setting.
{{< /alert >}}

## Default values

When `REDIRECT_HTTP_TO_HTTPS` is missing, Quollix defaults to `true`. When `APP_FORWARDED_PROTO` is missing, Quollix defaults to `https`.
