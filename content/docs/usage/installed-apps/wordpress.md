---
title: "WordPress"
---

## Resources

| Resource       | Description                                                                                                                                                 |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Website        | [wordpress.org](https://wordpress.org)                                                                                                                      |
| Source code    | [github.com/WordPress/wordpress-develop](https://github.com/WordPress/wordpress-develop)                                                                    |
| License        | [GPLv2 or later](https://wordpress.org/about/license/)                                                                                                      |
| ARM64 support  | Supported                                                                                                                                                   |
| OIDC client    | Community plugin                                                                                                                                            |
| Business model | Fully open source software with commercial hosting, services, and official ecosystem add-ons from Automattic/Woo, plus paid third-party plugins and themes. |

## Setup

On the first visit, create an administrator account. To access the WordPress admin dashboard later, open:

```plain
https://wordpress.<base-domain>/wp-admin
```

## Public Access

WordPress is typically used for a public website. In Quollix, set the access policy to `Public` so visitors can view the site without signing in.

## Single Sign-On

For WordPress, the standard Quollix setup does not use SSO because available integrations rely on community plugins. Manage editing through local
WordPress accounts, such as the administrator account or trusted editor accounts.

## PHP version and updates

To check the current PHP version, open the WordPress admin dashboard and go to Tools → Site Health → Info → Server → PHP version. Updating the Quollix WordPress app may also change the PHP runtime version, which can cause compatibility issues in plugins or themes and may require migrations.
