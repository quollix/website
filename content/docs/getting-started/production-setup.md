---
title: "Production setup"
---

For an example walkthrough, see the [speedrun production setup video]({{< relref "docs/getting-started/videos/speedrun-production-setup.md" >}}). This guide shows how to install Quollix for production use. The examples assume a base domain such as `example.com`, referred to below as `<base-domain>`. A prerequisite is, that you own the domain.

1. **Choose a** [**deployment option**]({{< relref "docs/self-hosting/deployment-options.md" >}}).
1. **Install Docker**: install Docker on the server, see [Getting started]({{< relref "docs/getting-started/_index.md" >}}).
1. **Create the Docker Compose file**: add a `docker-compose.yml` file:

```yaml
services:
  quollix:
    image: quollix/quollix:latest
    container_name: quollix_quollix_quollix
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /tmp:/tmp
      - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped
```

If you want to run Quollix behind a reverse proxy, read the [reverse proxy setup]({{< relref "docs/self-hosting/reverse-proxy.md" >}}) guide before starting the container. If you want to configure the initial administrator account, read the [initial admin account]({{< relref "docs/self-hosting/initial-admin-account.md" >}}) guide before starting the container.

4. **Start Quollix**: run the following command in the same directory as `docker-compose.yml`:

```bash
sudo docker compose up -d
```

For production deployments, we recommend updating Quollix once a day so you quickly receive the latest fixes and features. The [automatic updates]({{< relref "docs/self-hosting/automatic-updates.md" >}}) guide shows how to handle this with a cronjob.

5. **Open the web interface**: visit `https://quollix.<base-domain>`. Quollix initially uses a self-signed certificate, so your browser will show a certificate warning. Continue only if you trust the network path to the server. A trusted certificate is configured later in this guide.
1. **Find the initial password**: Quollix logs a random initial password on first startup:

```bash
sudo docker logs quollix_quollix_quollix | grep "initial admin password"
```

7. **Sign in**: use the username `administrator` with the generated password from the logs. After signing in, open the [Settings]({{< relref "docs/usage/settings/_index.md" >}}) page in Quollix.

1. **Set the base domain**: set [base domain]({{< relref "docs/usage/settings/base-domain.md" >}}) to `<base-domain>`, and save.
1. **Set up a certificate**: in the [certificate]({{< relref "docs/usage/settings/certificate.md" >}}) section, start the challenge to generate a wildcard certificate, then follow the instructions until you see a success message. Restart the browser because browsers usually cache the old self-signed certificate.

Visiting `https://quollix.<base-domain>` should now use a certificate signed by Let's Encrypt.

## Troubleshooting

### Missing initial password

If you accidentally recreate the container before copying the initial password, the existing database volume may keep the old administrator account while the password is no longer visible in the logs. In that case, reset the initial installation state. This deletes the Quollix database and starts from a clean installation:

```bash
sudo docker compose down
sudo docker volume rm -f quollix_postgres_data
```

Then start Quollix again:

```bash
sudo docker compose up -d
```

## Next steps

The [Self-Hosting]({{< relref "docs/self-hosting/_index.md" >}}) section provides additional guidance for running Quollix in a self-hosted environment.
