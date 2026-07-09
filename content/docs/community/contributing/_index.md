---
title: "Contributing"
---

## Spread the Word

You can also support Quollix by helping more people learn about the project:

* talk with potentially interested friends, colleagues, or organizations
* share it on social media
* write blogs or reviews where they are useful
* suggest other practical ways to reach people who may benefit from Quollix

## Provide Feedback

If you are familiar with GitHub, you can provide feedback through GitHub issues or discussions. If not, use the [feedback page]({{< relref "docs/feedback" >}}).

## Contribute on GitHub

{{< alert title="Note" color="warning" >}}
GitHub is the right place for contributions and development discussions, but not for user support requests.
{{< /alert >}}

### Improve the Website

The website repository is [github.com/quollix/website](https://github.com/quollix/website). Contributing website content does not require coding: basic Markdown knowledge and knowing how to contribute through GitHub are sufficient. Read the [Website contributing article]({{< relref "website.md" >}}).

### Contribute Code

To contribute code, fork the repository, create a new branch, make your changes, and submit a pull request (PR). Branches should use the form `<issueNumber>-<title>`. If no issue exists yet for the problem, please create one first.

If you are fixing a bug, include the steps to reproduce it, the expected result, and the actual result. Include screenshots or logs if useful.

All code contributions should pass existing tests and include new tests for added features. See the [Developer Guide]({{< relref "developer-guide.md" >}}).

Small fixes can be provided directly as PRs. Before creating a feature PR, open a feature suggestion issue and get maintainer approval first, because features must fit the design of Quollix.

## Expand the App Store

{{< planned-feature >}}

If you have software with a web interface that you would like to share with others, you will be able to package it as an app and upload it once public publishing is available. If an app becomes popular, we will consider adopting it as an official app.

## Improve App Compatibility

You can also help by improving the upstream software used by apps in the Quollix App Store. When those improvements are released, packaged as Docker images, and integrated into Quollix app updates, they become available to Quollix deployments.

High-value improvements include:

* OIDC authorization code flow support for confidential clients
* automatic OIDC client configuration through Docker environment variables

See [App Design Recommendations]({{< relref "docs/app-store/app-design-recommendations" >}}) for details.

## Improve Security

Security-related contributions are useful. Please follow the [Security Policy]({{< relref "docs/legal/security.md" >}}) when researching and reporting vulnerabilities.
