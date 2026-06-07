---
title: "Certificate"
weight: 20
---

There are multiple ways to operate certificates in Quollix.

## 1) Default Certificate

By default, Quollix is available on port 443 via HTTPS using a universal self-signed wildcard certificate. This default certificate works for all domains or IP addresses through which you access Quollix and any host configured in the Settings. This option may be sufficient for test deployments or private LAN networks. However, for most real-world use cases, a valid, properly signed wildcard certificate is recommended.

## 2) Generate Wildcard Certificate

This option generates a certificate via a Let's Encrypt DNS-01 challenge:

* Pros: no public IP address needed, can be used in a private LAN; covers the domains of all apps you install
* Cons: expires after 90 days and must be renewed by hand

{{< alert title="Certificate Issuance Limits" color="warning" >}}
Let's Encrypt limits how many certificates can be issued within a given period. Avoid generating new certificates unnecessarily, especially while testing or troubleshooting. If you reach a limit, certificate generation may be unavailable until the limit resets. See the <a href="https://letsencrypt.org/docs/rate-limits/">Let's Encrypt rate limits documentation</a> for current details.
{{< /alert >}}

You must set `<server-host>` to a domain that you own for the setup to work, for example `sample.com`. Simply start the challenge, create the TXT DNS record as instructed, and wait a few minutes. Quollix will handle the rest for you.

In the background, Quollix creates a `fullchain.pem` file that contains keys and certificates for the domains `*.sample.com`, such as `forgejo.sample.com`, `vaultwarden.sample.com`, or `quollix.sample.com`. The wildcard certificate is valid for 90 days, so this process must be repeated manually from time to time.

After that, you need to restart the browser so it loads the new certificate.

## 3) Upload Wildcard Certificates

Another option is to upload your own wildcard certificates. The uploaded **fullchain.pem** file must contain at least the private key and certificate chain for `*.sample.com`.
