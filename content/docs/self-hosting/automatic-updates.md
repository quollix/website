---
title: "Automatic updates"
weight: 40
---

This article is on automatic updates of Quollix itself. The apps installed in Quollix are already automatically updated by Quollix. On the server, run:

```bash
sudo crontab -e
```

Add a cronjob automatically updating `quollix` image, for example:

```bash
0 3 * * * /usr/bin/bash -c "docker pull quollix/quollix:latest && docker compose -f /path/to/docker-compose.yml up -d"
```

It is recommended to test the bash command above for correct execution by manually running it.
