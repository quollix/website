---
title: "Production setup"
---

This guide shows how to install Quollix for production use on a LAN or an internet-facing server. The examples assume a base domain such as `example.com`, referred to below as `<base-domain>`.

1. **Choose a server**: for example, a virtual private server (VPS) from a hosting provider or a physical server at home. For provider-specific VPS notes, see the [Hetzner Cloud server setup]({{< relref "docs/self-hosting/hetzner-cloud.md" >}}) guide.
2. **Configure DNS**: Decide which base domain Quollix should use. For example, if you want apps to be available at `nextcloud.example.com` and `vaultwarden.example.com`, the base domain is `example.com`. Quollix itself will be available at `quollix.example.com`. See [Base Domain]({{< relref "docs/usage/settings/base-domain.md" >}}) for details.

  Create a single wildcard DNS record that points to the IP address of the Quollix server:

  ```text
  *.example.com  A  <server-ip>
  ```

  If you use IPv6, also configure the corresponding wildcard `AAAA` record.

  For LAN setups, you can host your own DNS server or use your router's DNS server if supported. For public IP addresses, you usually need a public DNS server.

3. **Create the Docker Compose file**: add a `docker-compose.yml` file:

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

If you want to run Quollix behind a reverse proxy, read the [reverse proxy setup]({{< relref "docs/self-hosting/reverse-proxy.md" >}}) guide before starting the container.

If you want to configure the initial administrator account, read the [initial admin account]({{< relref "docs/self-hosting/initial-admin-account.md" >}}) guide before starting the container.

4. **Start Quollix**: run the following command in the same directory as `docker-compose.yml`:

```bash
sudo docker compose up -d
```

5. **Open the web interface**: visit `https://quollix.<base-domain>`. Continue past the browser warning for the initial self-signed certificate.
6. **Find the initial password**: Quollix logs a random initial password on first startup:

```bash
sudo docker logs quollix_quollix_quollix | grep "initial admin password"
```

7. **Sign in**: use the username `administrator` with the generated password from the logs.

After signing in, open the Settings page in Quollix.

8. **Set the base domain**: set **Base Domain** to `<base-domain>`, and save.
9. **Set up a certificate**: in the Certificates section, start the challenge to generate a wildcard certificate, then follow the instructions until you see a success message. Restart the browser because browsers usually cache the old self-signed certificate.

Visiting `https://quollix.<base-domain>` should now use a certificate signed by Let's Encrypt.

## Troubleshooting

### Missing Initial Password

If you accidentally recreate the container before copying the initial password, the existing database volume may keep the old administrator account while the password is no longer visible in the logs. In that case, reset the initial installation state. This deletes the Quollix database and starts from a clean installation:

```bash
sudo docker compose down
sudo docker volume rm -f quollix_postgres_data
```

Then start Quollix again:

```bash
sudo docker compose up -d
```

## Next Steps

The [Self-Hosting]({{< relref "docs/self-hosting/_index.md" >}}) section provides additional guidance for running Quollix in a self-hosted environment.
