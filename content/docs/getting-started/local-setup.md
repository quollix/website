---
title: "Local setup"
---

This setup is meant for testing Quollix on your local PC:

1. Create a `docker-compose.yml`.

```yaml
services:
  quollix:
    image: quollix/quollix:latest
    container_name: quollix_quollix_quollix
    ports:
      - "127.0.0.1:80:80"
      - "127.0.0.1:443:443"
    volumes:
      - /tmp:/tmp
      - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped
```

2. Run the following command in the same directory as the `docker-compose.yml` file:

```bash
sudo docker compose up -d
```

3. Visit [http://localhost](http://localhost) in your browser, log in with the default credentials (admin/password). Quollix uses a self-signed HTTPS certificate by default. Your browser may show a certificate warning when you open Quollix or an installed app over HTTPS. For initial access you must accept the warning.
4. The subdomains of installed apps must resolve to the local machine. Edit the system hosts:
  * On Linux and macOS, edit `/etc/hosts`.
  * On Windows, edit `C:\Windows\System32\drivers\etc\hosts`.

The hosts file does not support wildcard records like `*.localhost`, so add each hostname you want to reach explicitly:

```text
127.0.0.1  quollix.localhost forgejo.localhost nextcloud.localhost 
```

Add another hostname to the hosts file whenever you want to test another installed app. For example, if you install HedgeDoc, add `hedgedoc.localhost`.

Now you can install apps from the store, start and open them.


