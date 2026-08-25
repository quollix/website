---
title: "Contributing"
---

## Spread the word

You can also support Quollix by helping more people learn about the project:

- talk with potentially interested friends, colleagues, or organizations
- share it on social media
- write blogs or reviews where they are useful
- suggest other practical ways to reach people who may benefit from Quollix

## Provide feedback

You can provide feedback through the [feedback page]({{< relref "docs/contact/feedback.md" >}}), or through GitHub issues or discussions.

## Contribute on GitHub

Quollix code repositories use the permissive [MIT License](https://opensource.org/license/mit). Website content uses the permissive [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/) (CC BY 4.0). Contributions are made under the license of the repository being contributed to. Quollix does not require a Contributor License Agreement (CLA) or separate legal paperwork.

{{< alert title="Note" color="warning" >}}
GitHub is the right place for contributions and development discussions, but not for user support requests.
{{< /alert >}}

To get an overview of the public source code repositories, see the [Repository Map]({{< relref "repository-map.md" >}}).

### Improve the website

The website repository is [github.com/quollix/website](https://github.com/quollix/website). Contributing website content does not require coding: basic Markdown knowledge and knowing how to contribute through GitHub are sufficient. Read the [Website contributing article]({{< relref "website.md" >}}).

### Contribute code

To contribute code, fork the repository, create a new branch, make your changes, and submit a pull request (PR). Branches should use the form `<issueNumber>-<title>`. If no issue exists yet for the problem, please create one first.

If you are fixing a bug, include the steps to reproduce it, the expected result, and the actual result. Include screenshots or logs if useful. All code contributions should pass existing tests and include new tests for added features. See the [Developer Guide]({{< relref "developer-guide.md" >}}).

Small fixes can be provided directly as PRs. Before creating a feature PR, open a feature suggestion issue and get maintainer approval first, because features must fit the design of Quollix.

## Build integrations

Quollix includes a Go API client in the [common](https://github.com/quollix/common) repository at `quollix/api_client`. It is used by Quollix tooling and can also be useful for experiments, automation, or external tools built around Quollix.

## Expand the app store

{{< planned-feature >}}

If you have software with a web interface that you would like to share with others, you will be able to package it as an app and upload it once public publishing is available. If an app becomes popular, we will consider adopting it as an official app.

## Improve app compatibility

You can also help by improving the upstream software used by apps in the Quollix App Store. When those improvements are released, packaged as Docker images, and integrated into Quollix app updates, they become available to Quollix deployments.

High-value improvements include:

- OIDC authorization code flow support for confidential clients
- automatic OIDC client configuration through Docker environment variables

See [App Design Recommendations]({{< relref "docs/project/app-store/app-design-recommendations.md" >}}) for details.

## Improve security

Security-related contributions are useful. Please follow [Responsible Disclosure]({{< relref "docs/contact/responsible-disclosure.md" >}}) when researching and reporting vulnerabilities.
