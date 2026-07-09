---
title: "Wiki.js"
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [js.wiki](https://js.wiki) |
| Source code | [github.com/requarks/wiki](https://github.com/requarks/wiki) |
| License | [AGPL-3.0](https://github.com/requarks/wiki/blob/main/LICENSE) |
| ARM64 support | Supported |
| OIDC client | Native |
| Business model | Open source project with funding and sponsorship options. |

## Setup

* On first launch, create an admin account.
* For the site URL, enter the current base domain: `https://wikijs.<base-domain>`.
* Install

## Database Setup

Administration > Modules > Search Engine

* Select 'Database PostgreSQL'
* Rebuild index
* Apply

Now full text search is enabled.

## Single Sign-On

Administration > Modules > Authentication > Add Strategy > Generic OpenID Connect / OAuth2

* Add the OIDC client credentials of Wiki.js from the Quollix OIDC page.

Fill in these endpoint URLs with the `<placeholders>` injected:

* Authorization:

```plain
https://quollix.<base-domain>/api/authorize
```

* Token:

```plain
https://quollix.<base-domain>/api/token
```

* User Info:

```plain
https://quollix.<base-domain>/api/userinfo
```

* Issuer:

```plain
https://quollix.<base-domain>
```


Also apply these:

* Display Name Claim: "name"
* Enable "Allow self-registration"
* Assign to group: "Guests"

Click 'Apply' in the top-right corner.

Users should now see the option 'Generic OpenID Connect / OAuth2' on the sign-in page.
