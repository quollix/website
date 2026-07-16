---
title: "Developer Guide"
---

Quollix aims to keep its codebase lean, understandable, and easy to maintain. Contributions should fit the existing design, avoid unnecessary complexity, and solve the problem with the simplest clean implementation.

Detailed development conventions are maintained in the [quollix/work codex directory](https://github.com/quollix/work/tree/main/codex). They apply to both human-written and AI-assisted contributions.

Larger code changes require a contributor with sufficient programming experience to understand the design, tradeoffs, and maintenance impact of the change. This is especially important for AI-assisted work.

## AI-Assisted Contributions

AI-assisted contributions are welcome when there is strong human involvement. Contributors are expected to review, understand, simplify, and test all submitted code before opening a PR.

Unreviewed generated code, overly complex output, or "vibe coding" is strictly rejected. The final contribution must be intentional and consistent with the surrounding codebase.

## Technical Expectations

Quollix uses a deliberately simple technology stack. Prefer Go and Docker unless there is a compelling reason to introduce something else.

Contributions should:

* follow the existing structure and naming style
* avoid unnecessary dependencies
* avoid app-specific logic
  * app behavior should be handled by app definitions, app configuration, or the application itself
  * for app integration expectations, see [App Design Recommendations]({{< relref "docs/app-store/app-design-recommendations" >}})
* remove or simplify code where possible
* include meaningful tests for new behavior
* pass the relevant CI checks before merge

If a repository contains a `ci-runner`, use it as the main entry point for local development and verification. DevOps-related automation should be implemented in Go instead of Bash.

Repository-specific setup steps are documented in the repository itself.
