# Change log

See [upgrade notes][upgrade-notes] for helpful information when upgrading from previous versions.

[upgrade-notes]: upgrade-notes.md

## Unreleased

## v2.0.1

What's changed since v2.0.0:

- Engineering:
  - Bump PSRule dependency to v2.0.1. [#158](https://github.com/microsoft/ps-rule/pull/158)
    - See the [change log](https://microsoft.github.io/PSRule/latest/CHANGELOG-v2/#v201)
- Bug fixes:
  - Fixed assertion failed with newer version. [#159](https://github.com/microsoft/ps-rule/issues/159)

## v2.0.0

What's changed since v1.12.0:

- New features:
  - Added support for using a specific version of PSRule. [#132](https://github.com/microsoft/ps-rule/issues/132)
    - To install a specific version set the `version` parameter.
    - By default, the latest stable version of PSRule is used.
  - Added support for outputting analysis results as SARIF. [#136](https://github.com/microsoft/ps-rule/issues/136)
    - To use the SARIF output format set the `outputFormat` parameter to `Sarif`.
  - Added the ability to use an alternative PowerShell repository. [#133](https://github.com/microsoft/ps-rule/issues/133)
    - Register and authenticate to the repository in PowerShell if required.
    - Configure `repository` to install modules from the named repository.
- General improvements:
  - Exposed more rule error output in CI. [#140](https://github.com/microsoft/ps-rule/issues/140)
- Engineering:
  - **Breaking change:** Bump PSRule dependency to v2.0.0. [#152](https://github.com/microsoft/ps-rule/pull/152)
    - See the [change log](https://microsoft.github.io/PSRule/latest/CHANGELOG-v2/#v200)
- Bug fixes:
  - Fixed import of pre-release version. [#138](https://github.com/microsoft/ps-rule/issues/138)
  - Fixed path issue for running out of repo. [#150](https://github.com/microsoft/ps-rule/issues/150)
