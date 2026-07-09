---
title: "Zulip"
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [zulip.com](https://zulip.com) |
| Source code | [github.com/zulip/zulip](https://github.com/zulip/zulip) |
| License | [Apache-2.0](https://github.com/zulip/zulip/blob/main/LICENSE) |
| ARM64 support | Supported |
| OIDC client | Native |
| Business model | Open source server with Zulip Cloud, paid plans, and commercial support available separately. |

## Setup

After installing Zulip, visiting it for the first time shows a "No organization found" page. To create an organization, open a terminal session for the Zulip container/service from the Quollix [Terminal]({{< relref "../terminal.md" >}}) page and run:

```bash
su zulip -c '/home/zulip/deployments/current/manage.py generate_realm_creation_link'
```

Then copy the generated link into the browser URL bar.

* Add an organization name (it should not include spaces), select the organization type, and enter the email address `local-admin@example.invalid`. Leave `Use zulip.<base-domain>` enabled, then click 'Create Organization'.
* Enter the name `local-admin`, and select an option for 'How did you first hear about Zulip?'. Then click 'Sign Up'.
* Settings (cog icon) > Organization settings > Organization permissions > Joining the organization:
  * Disable "Invitations are required to join this organization"
  * Remove the entry in 'Who can send email invitations to new users'
  * Save changes
* Profile → Log out
* Log in with Quollix → Sign up → Sign up with Quollix → Sign up

* List realms to learn the realm ID, usually it is `2`:

```bash
su zulip -c '/home/zulip/deployments/current/manage.py list_realms'
```

* Make the Quollix administrator an organization owner:

```bash
su zulip -c '/home/zulip/deployments/current/manage.py change_user_role -r <realm-id> <quollix-admin-email> owner'
```

* Deactivate the local administrator account:

```bash
su zulip -c '/home/zulip/deployments/current/manage.py deactivate_user -f local-admin@example.invalid'
```

## Further Settings

Because accounts are managed through Quollix, restrict profile changes in Zulip:

Settings → Organization settings → Organization permissions:
* Check "Require unique names"
* Check "Prevent users from changing their name"
* Check "Prevent users from changing their email address"
