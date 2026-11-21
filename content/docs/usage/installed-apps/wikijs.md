---
title: "Wiki.js"
---

{{< app-info >}}

## Resources

| Resource       | Description                                                     |
| -------------- | --------------------------------------------------------------- |
| Website        | [js.wiki](https://js.wiki)                                      |
| Source code    | [github.com/requarks/wiki](https://github.com/requarks/wiki)    |
| License        | [AGPL-3.0](https://github.com/requarks/wiki/blob/main/LICENSE)  |
| ARM64 support  | Supported                                                       |
| OIDC client    | Native                                                          |
| Business model | Fully open source project with funding and sponsorship options. |

## Local admin login

- On first launch, sign in with the local admin credentials: `admin@example.com` / `12345678`.
- Change the password after signing in.
- Create a homepage, for example, `Using the Markdown Editor`, then **Create Page**.
- Select the **Administration** icon in the top-right corner to open the Administration Area.

## Administration Area configuration

In the Administration Area, configure the following:

- General → set Site Hostname to `wikijs.<base-domain>` → Apply
- Security → enable Trust X-Forwarded-* Proxy Headers → Apply.
- Authentication → Add Strategy → OIDC / OpenID Connect
  - Name: Quollix
  - Enable the strategy.
  - Enable registration and assign new users to the `Users` group.
  - Client ID / Client Secret: In Quollix, open **Apps → SSO** and copy the Wiki.js client ID and client secret.
  - Issuer: `https://quollix.<base-domain>`
  - Select **Apply**.
- Login → Login Providers → enable Quollix.

Users should now be able to sign in to Wiki.js with Quollix OIDC.

## Permissions

New users can only read articles by default. To grant additional permissions, go to Administration → Groups → Users → Rules → Select Permissions. For example, enable Write Pages, then select Apply and then Save.
