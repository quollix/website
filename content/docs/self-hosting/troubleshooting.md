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
If an official app maintained by Quollix stops working after an update, please report the issue through the [feedback page]({{< relref "docs/contact/feedback.md" >}}). Issues with unofficial third-party apps are outside the scope of Quollix.

Before reporting an issue with an official app, note the version that caused the problem. Then restore the most recent backup from before the update and note the previous working version. Include the app name, the broken version, the previous working version, and any relevant logs in your report.
{{< /details >}}
