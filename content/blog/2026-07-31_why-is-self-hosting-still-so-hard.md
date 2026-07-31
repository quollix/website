---
title: "Why Is Self-Hosting Still So Hard"
date: 2026-07-31
---

Professionally, I work as a software developer. I also value privacy, which is why I decided to host my own open-source services at home. While I had some system administration experience, this was my first serious self-hosting project at this scale. I assumed getting a few services running would be straightforward. But I underestimated what I was actually signing up for.

## What I Experienced

I bought a cheap little server for my home, installed Linux, and set up Docker. No problem. I had done all of that countless times before. Then I deployed a few Docker stacks: a wiki, Nextcloud, and a handful of other services.

Next, I needed a reverse proxy, TLS certificates, and because my ISP assigned me a dynamic IP address, I also needed Dynamic DNS. To obtain certificates using the HTTP-01 challenge via Let's Encrypt, I also had to expose parts of my home network to the Internet. I wasn't particularly happy about that, but I didn't really see another option.

Backups were next. I wrote backup scripts, recovery scripts, and, of course, tested them. Weeks later, when a hard drive actually failed, the hardware wasn't the problem. I had a replacement. The difficult part was remembering everything around it. Docker Compose files, scheduled jobs, reverse proxy configuration, and all the little details that had accumulated over time.

Then I wanted single sign-on. That meant setting up Keycloak, refreshing my memory on OpenID Connect, reading the integration documentation for every application and searching for the parts that fit my use case. Every new service followed the same pattern: read the documentation, configure networking, configure authentication, update the backup scripts, update the recovery procedure, test everything.

Eventually, after all that work, I had the system I originally wanted. I could sit back and enjoy my privacy-respecting services. Then the updates started. My approach was simple: just pull the latest Docker images every night. Surely the applications would take care of compatibility, right? Wrong. Breaking changes happened and apps suddenly required a service with an older version. Sometimes I found compatibility matrices, sometimes I had to read release notes, and sometimes I simply had to test upgrades myself to ensure stability.

At some point I noticed that I wasn't spending my time using my services anymore. I was maintaining the infrastructure around them. My scripts kept growing, my notes became longer, and every so often, I had to reload all this knowledge into my head because some component required attention again. What had started as an exciting weekend project had slowly become a responsibility.

## What I Actually Wanted

That experience changed how I thought about self-hosting. I also realized I wasn't the only one facing this problem. The technologies weren't the problem. I already knew them. What I had underestimated was how much operational work accumulates around a self-hosted system over time.

What I really wanted was a system that minimized the time spent maintaining infrastructure. Simple design reduces the need to read documentation, opinionated defaults simplify installation, and automation replaces repetitive maintenance.

That idea eventually became Quollix, an open-source project that aims to make self-hosting easier.
