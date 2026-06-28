---
title: "Reverse Proxy Setup"
---

By default, Quollix listens on ports `80` and `443`, redirects HTTP traffic to HTTPS, and forwards app requests with `X-Forwarded-Proto: https`. This is the recommended setup when Quollix is directly reachable from browsers.

If you place Quollix behind another reverse proxy, the proxy should route both `quollix.<base-domain>` and all app subdomains such as `nextcloud.<base-domain>` to the Quollix container. Keep the original `Host` header so Quollix can route app traffic by domain.

## Common HTTPS Reverse Proxy Setup

In the usual reverse proxy setup, the public browser-facing URL is still HTTPS. The proxy may terminate TLS and forward plain HTTP to Quollix on a private network. In this case, disable Quollix's own HTTP-to-HTTPS redirect, but keep the app forwarded protocol as `https`:

```yaml
services:
  quollix:
    image: quollix/quollix:latest
    environment:
      REDIRECT_HTTP_TO_HTTPS: false
      APP_FORWARDED_PROTO: https
```

`REDIRECT_HTTP_TO_HTTPS=false` tells Quollix not to redirect traffic received on port `80`. This is useful when the reverse proxy is responsible for HTTPS redirects.

`APP_FORWARDED_PROTO=https` tells apps behind Quollix that the public request scheme is HTTPS. This should remain the default for normal production deployments, even if the private proxy-to-Quollix connection uses HTTP.

## HTTP App Forwarding

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
Using "APP_FORWARDED_PROTO=http" is discouraged for production internet-facing setups because apps will see requests as plain HTTP. Some official apps may require an HTTPS forwarded protocol for security-sensitive behavior and may stop working with this setting.
{{< /alert >}}

When `REDIRECT_HTTP_TO_HTTPS` is missing, Quollix defaults to `true`.

When `APP_FORWARDED_PROTO` is missing, Quollix defaults to `https`.
