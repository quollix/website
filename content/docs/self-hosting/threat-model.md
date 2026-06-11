---
title: "Threat model"
---

This document describes how Quollix mitigates threats to protect its digital infrastructure.

## Security Measures

### Cryptography
We only use modern, well-tested cryptographic algorithms. Administrators can generate Let’s Encrypt–signed certificates or provide their own certificates to secure HTTPS endpoints. HTTP requests are redirected to HTTPS so users reach the encrypted endpoint by default.

### Container Isolation
Every app runs in its own Docker container with no shared volumes, networks, or Docker socket access, and with restricted Linux capabilities.

### Defensive Coding
* Strict input validation blocks SQL injection, XSS, RCE, and similar attacks.
* Protection against CSRF attacks is built into the security framework.
* Cookies are hashed, and user passwords are salted and hashed. This means that even if a hacker gains access to the database, they won't be able to read this data in plain text. Therefore, cookies and strong passwords are effectively impossible to crack.

### Secure Supply Chain
* Static code analysis tools run frequently.
* Automated update tools ensure releases use the latest libraries and Docker images.
* Official apps are cryptographically signed, and Quollix verifies the signature when downloading them. This means that even if the App Store or an app release repository is compromised, attackers cannot silently modify official app content unless they also compromise the signing credentials.
* This does not remove upstream supply-chain risk in the Docker images used by an app. Administrators who require additional assurance can inspect apps and upload them manually instead of relying on the public App Store.

### Access Control
* All endpoints enforce authentication and role-based authorization.
* Quollix uses separate server-side authentication sessions for the Quollix UI and each app, keeping access to different services isolated.
* Administrators can define access policies for apps, restricting access to specific users.

### Backups and Updates
* Quollix automatically updates apps and creates backups.
* Quollix allows backups to be stored on remote servers using end-to-end encryption. This enables disaster recovery in case of hardware failure or data loss, but must be set up by the administrator.

## Limitations and Assumptions

The following areas remain under the administrator’s control and are out of scope for Quollix’s built-in safeguards.

### Infrastructure

* When administrators host Quollix on their own hardware, they are responsible for the physical security of the servers and networks.
* Host OS, kernel, and Docker Engine updates must be maintained by the administrator to ensure security. Apps run in Docker containers rather than full virtual machines, which is lighter and easier to operate, but means container escape and kernel-level vulnerabilities remain part of the host security model. 
We recommend using a simple, automatically updating system like Ubuntu, along with a cron job that reboots the system regularly to apply kernel upgrades.
* OS-level network security such as firewall configuration must be enforced by the administrator to protect the deployment.
* Quollix does not yet provide built-in IP banning or rate limiting. Resource-exhaustion attacks, including attempts to overload CPU, memory, disk, or network capacity, therefore remain a relevant threat and should currently be mitigated at the infrastructure layer, for example with a firewall or reverse proxy.

### Apps and Data

* App Store content is not moderated, except for official apps. Third-party apps may contain malicious code, so we recommend that administrators only use trusted third-party sources or evaluate third-party apps before installation.
* App updates depend on each app's maintainer. Outdated apps may introduce vulnerabilities, and compromised maintainer accounts or release repositories may result in malicious updates for third-party apps.
* Quollix is not responsible for security vulnerabilities within installed apps. Responsibility for application-level security lies entirely with the respective project developers.

### Miscellaneous

* The owner of the Quollix installation is responsible for legal and regulatory compliance, such as privacy laws, although Quollix provides tools to help reduce the effort involved.
* Quollix comes with a default self-signed certificate. Although this might be suitable for trusted LAN environments, it is vulnerable to man-in-the-middle (MITM) attacks. To ensure security, administrators must upload or generate a trusted certificate and keep it up to date.
