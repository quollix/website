---
title: "Production setup"
---

This is a quick guide for installing Quollix for production use on a LAN or public server. The examples assume a domain such as `example.com`, referred to below as `<SERVER_HOST>`.

1. **Choose a server**: for example, a virtual private server (VPS) from a hosting provider or a physical server at home.
2. **Configure DNS**: Quollix routes installed apps by hostname. If the server host is `example.com`, Quollix itself can be accessed at `quollix.example.com`, and installed apps use hostnames such as `forgejo.example.com`, `nextcloud.example.com`, or `vaultwarden.example.com`. For this to work, every hostname under `<SERVER_HOST>` that you want to use must resolve to the machine running Quollix.
  * For LAN setups, you can host your own DNS server, use your router's DNS server if supported, or use a public DNS provider. For public IP addresses, you usually need a public DNS server. In the DNS server, create a wildcard record that points to the IP address of the Quollix server:

```text
*.example.com  A  <server-ip>
```

3. **Install Docker on the server**: for installation instructions, see the [Docker installation guide](https://docs.docker.com/get-docker/).
4. **Create the Compose file**: add a `docker-compose.yml` file:

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

For extra protection, you can set a custom initial admin password with an environment variable:

```yaml
services:
  quollix:
    # ...
    environment:
      INITIAL_ADMIN_PASSWORD: <replace-me>
```

5. **Start Quollix**: run the following command in the same directory as `docker-compose.yml`:

```bash
sudo docker compose up -d
```

6. **Open the web interface**: visit `https://quollix.<SERVER_HOST>`. Continue past the browser warning for the initial self-signed certificate.
7. **Log in**: use the default credentials (`admin` / `password`), or `admin` with the custom password you configured above.
8. **Change the password**: set a secure password for the administrator account.
9. **Set the server host**: go to the Settings page, set **Server Host** to `<SERVER_HOST>`, and save.
10. **Set up a certificate**: use one of these options:
    * uploading your own wildcard certificate for the hostnames above
    * generating a wildcard certificate through a DNS-01 challenge, then restarting the browser
11. **Set the timezone**: choose the correct IANA timezone.
12. **Rename the admin account**: consider changing the username of the administrator account on the Users page. When you sign in to an app through OIDC, the app may try to create an account with the same username. Some apps, such as Forgejo, reserve names like `admin` and `user`, so avoid those usernames if the account should be able to sign in to apps. Otherwise, single sign-on may fail for that account.

## Next Steps

The [Self-Hosting]({{< relref "docs/self-hosting/_index.md" >}}) section provides additional guidance for running Quollix in a self-hosted environment.
