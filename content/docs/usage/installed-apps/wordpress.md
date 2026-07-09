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
| Business model | Open source software project with a commercial ecosystem of hosting, services, themes, and plugins. |

## Setup

On the first visit, create an administrator account.

To access the WordPress admin dashboard later, open:

```plain
https://wordpress.<base-domain>/wp-admin
```

## Public Access

WordPress is typically used for a public website. In Quollix, set the access policy to `Public` so visitors can view the site without signing in.

## Single Sign-On

For WordPress, the standard Quollix setup does not use SSO because available integrations rely on community plugins. Manage editing through local
  WordPress accounts, such as the administrator account or trusted editor accounts.
