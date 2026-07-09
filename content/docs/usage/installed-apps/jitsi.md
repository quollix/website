---
title: "Jitsi"
---

## Resources

| Resource | Description |
|----------|-------------|
| Website | [jitsi.org](https://jitsi.org/jitsi-meet/) |
| Source code | [github.com/jitsi/jitsi-meet](https://github.com/jitsi/jitsi-meet) |
| License | [Apache-2.0](https://github.com/jitsi/jitsi-meet/blob/master/LICENSE) |
| ARM64 support | Supported |
| OIDC client | Not supported |
| Business model | Open source project built by 8x8 and the community; hosted and commercial services are available separately. |

## Introduction

By default, Jitsi does not enforce authentication and allows anyone with access to the web interface to create and join meetings. Authorization is managed through Quollix access policies:
* Public: Anyone can access the Jitsi GUI and create meetings. No authentication is required.
* Non-public policies: Anonymous users cannot access the Jitsi GUI to create or join meetings. Only users with the required access permission can use the Jitsi app.
