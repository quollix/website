---
title: "Server Host"
weight: 10
---

The server host value is needed to access installed apps. For example, if you set the host to **company.com** and click Open on the forgejo app on the **Installed Apps** page, **forgejo.company.com** will open in a new tab. For local testing, you can simply use **localhost** as the host value.

Note: This proxying requires that the domain (e.g. forgejo.company.com) resolves to the server where Quollix is installed, either via a DNS record or an entry in your system's hosts file.

Some apps use the HOST value for security or compatibility reasons. Changing the HOST value may cause those apps to stop working properly. If that is the case, you can usually resolve this issue by restarting these apps.
