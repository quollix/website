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
    environment:
      INITIAL_ADMIN_NAME: administrator
      INITIAL_ADMIN_PASSWORD: password
    restart: unless-stopped
```

2. Run the following command in the same directory as the `docker-compose.yml` file:

```bash
sudo docker compose up -d
```

3. Visit [http://localhost](http://localhost) in your browser, sign in with the default credentials (`administrator`/`password`). Quollix uses a self-signed HTTPS certificate by default. Your browser may show a certificate warning when you open Quollix or an installed app over HTTPS. For initial access you must accept the warning.

Now you can install apps from the store, start and open them.

Note: When you open a local app over HTTPS, your browser may show a warning because the app is served from another local domain with a self-signed certificate. Continue past the warning. The first request may return a "Bad Request" response. If that happens, open the app again. Subsequent attempts should work normally.

Note: Single sign-on to apps is not expected to work in this local setup. It requires a valid base domain and a trusted certificate that covers the Quollix and app subdomains.
