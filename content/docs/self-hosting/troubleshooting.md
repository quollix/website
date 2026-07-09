---
title: "Troubleshooting"
---

{{< details "I have forgotten my Quollix password. How can I reset it?" >}}
You can ask an admin to reset your account password.

If you are the only admin and have lost access to your account, you can reset the password by running the following command in the postgres container:

```bash
psql -U postgres -d application -c "UPDATE users SET hashed_password = '\$2a\$10\$ly6w8BjJ35pdGOp3rdVnHOWmZzC/MQwdF5qSt8AQZk6WnhDqNSKqW' WHERE username = '<enter-your-username>';"
```

This resets the account password to 'password'.

{{< /details >}}

{{< details "What should I do if an app stops working after an update?" >}}
If an official app maintained by `quollix` stops working after an update, please report the issue through the [feedback page]({{< relref "docs/feedback.md" >}}). Issues with unofficial third-party apps are outside the scope of Quollix.

Before reporting an issue with an official app, note the version that caused the problem. Then restore the most recent backup from before the update and note the previous working version.

Include the app name, the broken version, the previous working version, and any relevant logs in your report.
{{< /details >}}

{{< details "What do I do if an update fails because I skipped intermediate versions?" >}}
If you skip important intermediate versions and upgrade directly from an old version to a much newer one, required update migration steps may be missed. This can cause the update to fail and may leave the application unusable.

Unfortunately, this migration has to be performed manually and step by step. Restore the latest known working backup of the app. Stop the app, install a newer version that is expected to work, and start it so that any required migration steps can run. Afterwards, create a new backup as a fallback point. Repeat this process until you reach the latest version.

In some cases, the software documentation describes which versions introduce mandatory migrations. This may allow you to skip certain intermediate versions and reduce the overall effort.

**Recommended approach to prevent this in the future**
- App maintainers should keep their apps in the store up to date.
- Quollix administrators should ensure that the automatic update of each app on the Maintenance page is kept.
{{< /details >}}
