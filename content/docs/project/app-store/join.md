---
title: "Join the App Store"
weight: 10
---

Anyone who wants to publish app definitions through the App Store can request an app maintainer account. Account creation is manual for now. We ask for enough information to reduce spam, impersonation, namespace squatting, and misleading app maintainer names.

## Choose an app maintainer name

An app maintainer name must contain only lowercase letters and digits and be between 3 and 20 characters long. Before requesting an account, check whether your desired app maintainer name is still available. In Quollix, open the [App Store page]({{< relref "docs/usage/app-store" >}}), enable the search for unofficial apps, enter the desired app maintainer name, and search. If there are no results, or if the first result has a different app maintainer name, the name is still available and you can request it.

## Send account creation request

Generate a dedicated Ed25519 key pair for signing app uploads. Set a passphrase for the private key when prompted.

```bash
ssh-keygen -t ed25519 -f ~/.ssh/quollix_app_store -C "quollix-app-store:<app-maintainer-name>"
```

Print the public key and paste it into the request email below:

```bash
cat ~/.ssh/quollix_app_store.pub
```

The public key is used to verify app versions signed with your private key. Quollix also uses it as part of the App Store maintainer trust chain. For details, see [Supply chain security]({{< relref "docs/self-hosting/threat-model.md#supply-chain-security" >}}).

Use the draft below to send the request by email:

<button type="button" class="feedback-draft-button" onclick="window.openAppStoreAccountMailDraft()">Open draft</button>

## Onboard your account

When the request is accepted, a Quollix maintainer creates the account and sends the onboarding token by email. Download the `qsc` binary from the [GitHub Releases](https://github.com/quollix/store/releases) page, then run the commands below.

Use the token to activate the account and set a password for your account:

```bash
./qsc onboarding setup-password <token>
```

Sign in with your app maintainer name and password:

```bash
./qsc account sign-in <app-maintainer-name>
```

Set the file path to the private key corresponding to the Ed25519 public key you provided in the request email. The private key is used to sign uploaded app versions:

```bash
./qsc onboarding set-private-key ~/.ssh/quollix_app_store
```

Create a folder for your local app definitions and save its path in `qsc`:

```bash
mkdir -p /home/sampleuser/Documents/quollix-apps
./qsc onboarding set-apps-directory /home/sampleuser/Documents/quollix-apps
```

Display App Store account and local configuration:

```bash
./qsc account details
./qsc session show
```

<script>
  const openAppStoreAccountMailDraft = () => {
    const emailAddress = 'quollix-feedback@mailbox.org'
    const subject = 'App Store: App maintainer account request'
    const body = `Hi Quollix team,

I want to request an app maintainer account for the App Store.

App maintainer name: <replace-me>

Email address: <replace-me>

Ed25519 public key: <replace-me>

Why do you want to publish through the App Store?
<replace-me>

Project or organization link, if relevant:
<replace-me>

How can we verify that you are connected to this project or organization, if relevant?
For example: project website, repository profile, official email address, or other public reference.
<replace-me>

I agree to the Public Services Terms.

Public Services Terms:
https://quollix.org/docs/legal/terms/

Privacy Policy:
https://quollix.org/docs/legal/privacy/

I understand that Quollix may send me non-marketing service emails related to my App Store maintainer account.
`

    window.location.href = `mailto:${emailAddress}?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`
  }

  window.openAppStoreAccountMailDraft = openAppStoreAccountMailDraft
</script>

## Next steps

Next, read the article about [creating your first app]({{< relref "docs/project/app-store/create-your-first-app" >}}).
