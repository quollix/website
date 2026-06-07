---
title: "WordPress"
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [wordpress.org](https://wordpress.org) |
| Source code | [github.com/WordPress/wordpress-develop](https://github.com/WordPress/wordpress-develop) |
| License | [GPLv2 or later](https://wordpress.org/about/license/) |
| ARM64 support | Supported |
| OIDC client | Community plugin |
| Business model | Open-source project with a large commercial ecosystem of hosting, services, themes, and plugins. |

## Usage

WordPress is typically used to host an organization's public website. In Quollix, set the access policy to `Public` so every visitor can view the site.

Quollix does not currently document SSO setup for WordPress. The typical setup keeps the website public and limits admin access to trusted users.

The admin dashboard is available at the `/wp-admin` path:

```plain
https://wordpress.<server-host>/wp-admin
```


## DNS

WordPress usually serves the main website, so visitors often expect it to be available at a domain such as `example.com`. But Quollix can only provide the app at a subdomain such as `wordpress.example.com`. To use `example.com` as the public address, create an ALIAS record from `example.com` to `wordpress.example.com`.
