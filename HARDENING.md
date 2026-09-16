<!-- markdownlint-disable -->

# Hardening Report: ben-z--actions-comment-on-issue/1.0.3

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **ben-z--actions-comment-on-issue/1.0.3** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Both workflow files reference actions using mutable tags instead of full 40-character commit SHAs, making them vulnerable to supply-chain attacks if the tag is moved.

- `.github/workflows/issue-checklist.yml`: `uses: ben-z/actions-comment-on-issue@1.0.2alpha1` (tag ref)
- `.github/workflows/stale.yml`: `uses: actions/stale@v1` (tag ref)

Pin each reference to a full SHA, e.g. `uses: actions/stale@<40-char-sha> # v1`.

Locations:

- `.github/workflows/issue-checklist.yml:12`
- `.github/workflows/stale.yml:12`

### missing-permissions (severity: medium)

Neither workflow file declares a top-level `permissions:` block, and no job in either file has a job-level `permissions:` block. Without explicit permissions, the default GITHUB_TOKEN grants broad write access to repository contents, which violates the principle of least privilege.

- `.github/workflows/issue-checklist.yml`: no `permissions:` key
- `.github/workflows/stale.yml`: no `permissions:` key

Add a minimal `permissions:` block (e.g. `issues: write` for the checklist workflow and `issues: write, pull-requests: write` for the stale workflow).

Locations:

- `.github/workflows/issue-checklist.yml:1`
- `.github/workflows/stale.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

Fixed both workflow files:
1. `.github/workflows/issue-checklist.yml`: Pinned `ben-z/actions-comment-on-issue@1.0.2alpha1` to full SHA `524237db13b3722dd78d09d0abf3de3a8b1df847` and added `permissions: issues: write`.
2. `.github/workflows/stale.yml`: Pinned `actions/stale@v1` to full SHA `0649bd81195b7ac109fbf9dde113af7e58a78b8e` and added `permissions: issues: write` and `pull-requests: write`.

