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
| Business model | Community-governed free software project under Codeberg e.V. stewardship; no separate enterprise edition. |

## Introduction

A general rule in Forgejo is that some settings cannot be changed via the web GUI once the installation wizard is completed. However, you can still modify them by directly editing the `app.ini` file inside the container as described below. Therefore, we recommend that you familiarize yourself with the potential configuration options before deploying a production instance.

## Installation Wizard

When visiting the Forgejo web UI for the first time:
* Ensure that this option is enabled: "Disable self-registration", as we want users to authenticate via Quollix OIDC
* Uncheck "Enable update checker" as Quollix handles updates
* Administrator Account Settings → fill in the required fields
  * Note that 'admin' is a reserved username and can not be used
* Click "Install Forgejo"

## Adapting Configuration After Installation

Open the Forgejo container via terminal and edit the `app.ini` as desired:

```bash
apk add nano
nano /data/gitea/conf/app.ini
```

Save the `app.ini` file and restart the app.

## Single Sign-On

* In Quollix, go to OIDC tab and copy the Client ID, Client Secret
* Visit Forgejo
* Go to Site Administration → Identity & Access → Authentication Sources → Add Authentication Source
* Authentication type: OAuth2
* Authentication name: quollix
* OAuth2 Provider: OpenID Connect
* Paste Client ID and Client Secret from Quollix
* OpenID Connect Auto Discovery URL:

```plain
https://quollix.<server-host>/.well-known/openid-configuration
```

* Click 'Add Authentication Source'

Now you can use login via OIDC:

* Logout from local admin account
* Sign in
* Sign in with quollix

{{< alert title="Note" color="warning" >}}
A user with the username `admin` cannot authenticate via OIDC and will receive a '500 Internal Server Error' because `admin` is a reserved username. To resolve this issue, either:
- Use the local administrator account created in the Forgejo installation wizard.
- Change the administrator account's username in Quollix and then authenticate via OIDC.
{{< /alert >}}
