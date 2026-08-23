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
| Business model | Fully open source project with funding and sponsorship options. |

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

When Wiki.js creates a user through OIDC, it must assign that user to a group with the required permissions. Therefore, the first step is to create a group and define its permissions.

### Groups

This is an example group setup, in which any authenticated user may write, manage and delete pages. Feel free to deviate.

Administration > Users > Groups:

* New Groups > enter "Editors" > Create
* Click Editors group:
  * Permissions > Enable `write:pages`, `manage:pages`, `delete:pages`
  * Page rules > Click the green `read:pages` label so that a menu opens > enable these fields:
    * Create + Edit Pages (write:pages)
    * Rename + Move Pages (manage:pages)
    * Delete Pages (delete:pages)
  * Update group

### Authentication

Administration > Modules > Authentication > Add Strategy > Generic OpenID Connect / OAuth2

In Quollix, go to `Apps → SSO` and copy the Wiki.js client ID and client secret. Paste them into the matching Wiki.js fields. Fill in these endpoint URLs, replacing `<base-domain>` with your Quollix base domain:

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
* Assign to group: "Editors" (the group created previously, see above)

Click 'Apply' in the top-right corner. Click "Exit", then "Create home page", and create an initial page that users will see on their first visit.

### First login of new users

When users first open Wiki.js, they may see the initial page before signing in. To edit pages, they must click the account icon in the top-right corner and sign in. Users should now see the option 'Generic OpenID Connect / OAuth2' on the sign-in page. After selecting it, they should be signed in, see the initial page, and have editing rights.

## Troubleshooting

If the Wiki.js page shows this error:

```
Oops, something went wrong...
Cannot read properties of undefined (reading 'id')
```

You can usually resolve this by clearing the Wiki.js cookies for the site in your browser. In Chrome-based browsers such as Brave or Chrome, open the developer tools with F12, go to Application > Cookies, right-click the Wiki.js cookie entry, and click "Clear". Then go to Quollix, sign in if needed, and click "Open" in the Wiki.js row.
