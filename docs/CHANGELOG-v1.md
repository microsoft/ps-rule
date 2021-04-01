# Change log

See [upgrade notes][upgrade-notes] for helpful information when upgrading from previous versions.

[upgrade-notes]: upgrade-notes.md

## Unreleased

## v1.3.0

What's changed since v1.2.0:

- Engineering:
  - Bump PSRule dependency to v1.2.0. [#75](https://github.com/microsoft/ps-rule/issues/75)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v120)
  - Bump PowerShell base image to 7.1.3-alpine-3.12. [#76](https://github.com/microsoft/ps-rule/issues/76)

## v1.2.0

What's changed since v1.1.1:

- General improvements:
  - Added support for using baselines. [#66](https://github.com/microsoft/ps-rule/issues/66)
    - Specify a named baseline by using `baseline: '<baseline_name>'`.
    - Baselines can be included from individual files or modules using `source:` and `modules:`.
- Engineering:
  - Bump PSRule dependency to v1.1.0. [#71](https://github.com/microsoft/ps-rule/issues/71)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v110)

## v1.1.1

What's changed since v1.1.0:

- Engineering:
  - Bump PSRule dependency to v1.0.3. [#67](https://github.com/microsoft/ps-rule/issues/67)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v103)
  - Bump PowerShell base image to 7.1.2-alpine-3.12. [#68](https://github.com/microsoft/ps-rule/issues/68)

## v1.1.0

What's changed since v1.0.0:

- General improvements:
  - Added support for using pre-release modules. [#58](https://github.com/microsoft/ps-rule/issues/58)
- Engineering:
  - Bump PSRule dependency to v1.0.1. [#57](https://github.com/microsoft/ps-rule/issues/57)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v101)

## v1.0.0

What's changed since v0.5.0:

- Engineering:
  - Bump PSRule dependency to v1.0.0. [#52](https://github.com/microsoft/ps-rule/issues/52)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v100)
  - Bump PowerShell base image to 7.1.0-alpine-3.10. [#53](https://github.com/microsoft/ps-rule/issues/53)
