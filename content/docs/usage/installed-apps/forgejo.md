---
title: "Forgejo"
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [forgejo.org](https://forgejo.org) |
| Source code | [codeberg.org/forgejo/forgejo](https://codeberg.org/forgejo/forgejo) |
| License | [GPLv3 or later](https://forgejo.org/faq/#is-forgejo-licensed-under-the-gpl) |
| ARM64 support | Supported |
| OIDC client | Native |
| Business model | Community-governed open source project under Codeberg e.V. stewardship. |

## Introduction

A general rule in Forgejo is that some settings cannot be changed via the web GUI once the installation wizard is completed. However, you can still modify them by directly editing the `app.ini` file inside the container as described below. Therefore, we recommend that you familiarize yourself with the potential configuration options before deploying a production instance.

## Installation Wizard

When visiting the Forgejo web UI for the first time:
* Ensure that this option is enabled: "Disable self-registration", as we want users to authenticate via Quollix OIDC
* Uncheck "Enable update checker" as Quollix handles updates
* Administrator Account Settings → fill in the required fields
  * Note that 'admin' is a reserved username and can not be used
  * Forgejo requires unique usernames and email addresses. Use values for the local administrator account that do not overlap with any Quollix user, for example username `admin2` and email `admin2@example.invalid`.
* Click "Install Forgejo"

## Adapting Configuration After Installation

This step is usually not needed for a standard installation. Treat it as a general option and skip it unless you need to change advanced Forgejo settings after installation.

Open the Forgejo container through the Quollix [Terminal]({{< relref "../terminal.md" >}}) page and edit the `app.ini` as desired:

```bash
apk add nano
nano /data/gitea/conf/app.ini
```

Save the `app.ini` file and restart the app.

## Single Sign-On

* In Quollix, go to the OIDC tab and copy the OIDC client credentials
* Visit Forgejo
* Go to Site Administration → Identity & Access → Authentication Sources → Add Authentication Source
* Authentication type: OAuth2
* Authentication name: Quollix
* OAuth2 Provider: OpenID Connect
* Paste the OIDC client credentials from Quollix
* OpenID Connect Auto Discovery URL:

```plain
https://quollix.<base-domain>/.well-known/openid-configuration
```

* Click 'Add Authentication Source'

Now you can sign in through OIDC:

* Sign out from the local admin account
* Sign in
* Sign in with Quollix

{{< alert title="Note" color="warning" >}}
A user with the username `admin` cannot authenticate via OIDC and will receive a '500 Internal Server Error' because `admin` is a reserved username. The default Quollix administrator username is `administrator`, which avoids this conflict.
{{< /alert >}}
