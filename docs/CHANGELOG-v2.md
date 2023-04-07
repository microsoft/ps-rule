# Change log

See [upgrade notes][upgrade-notes] for helpful information when upgrading from previous versions.

[upgrade-notes]: upgrade-notes.md

## Unreleased

## v2.8.1

What's changed since v2.8.1:

- Engineering:
  - Bump PSRule to v2.8.1.
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v281)

## v2.8.0

What's changed since v2.7.0:

- New features:
  - Added job summaries to each run by @BernieWhite.
    [#218](https://github.com/microsoft/ps-rule/issues/218)
    - Set the `summary` input to `false` to skip generating a job summary.
- General improvements:
  - Added support for action release branches by @BernieWhite.
    [#214](https://github.com/microsoft/ps-rule/issues/214)
- Engineering:
  - Bump PSRule to v2.8.0.
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v280)
- Bug fixes:
  - Fixed summary with job summary by @BernieWhite.
    [#221](https://github.com/microsoft/ps-rule/issues/221)

## v2.7.0

What's changed since v2.6.0:

- Engineering:
  - Bump PSRule to v2.7.0.
    [#209](https://github.com/microsoft/ps-rule/pull/209)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v270)

## v2.6.0

What's changed since v2.5.2:

- Engineering:
  - Bump PSRule to v2.6.0.
    [#206](https://github.com/microsoft/ps-rule/pull/206)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v260)

## v2.5.2

What's changed since v2.5.1:

- Engineering:
  - Bump PSRule to v2.5.3.
    [#203](https://github.com/microsoft/ps-rule/pull/203)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v253)

## v2.5.1

What's changed since v2.5.0:

- Engineering:
  - Bump PSRule to v2.5.1.
    [#196](https://github.com/microsoft/ps-rule/pull/196)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v251)

## v2.5.0

What's changed since v2.4.2:

- General improvements:
  - Added outcome filtering parameter by @BernieWhite.
    [#171](https://github.com/microsoft/ps-rule/issues/171)
- Engineering:
  - Bump PSRule to v2.5.0.
    [#194](https://github.com/microsoft/ps-rule/pull/194)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v250)

## v2.4.2

What's changed since v2.4.1:

- Engineering:
  - Bump PSRule to v2.4.2.
    [#191](https://github.com/microsoft/ps-rule/pull/191)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v242)

## v2.4.1

What's changed since v2.4.0:

- Engineering:
  - Bump PSRule to v2.4.1.
    [#188](https://github.com/microsoft/ps-rule/pull/188)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v241)

## v2.4.0

What's changed since v2.3.2:

- General improvements:
  - Improved documentation for `inputPath` input parameter by @BernieWhite.
    [#181](https://github.com/microsoft/ps-rule/issues/181)
  - Added additional exception logging to improve debugging by @BernieWhite.
    [#180](https://github.com/microsoft/ps-rule/issues/180)
- Engineering:
  - Bump PSRule to v2.4.0.
    [#182](https://github.com/microsoft/ps-rule/pull/182)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v240)

## v2.3.2

What's changed since v2.3.1:

- Engineering:
  - Bump PSRule to v2.3.2.
    [#177](https://github.com/microsoft/ps-rule/pull/177)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v232)

## v2.3.1

What's changed since v2.3.0:

- Engineering:
  - Bump PSRule to v2.3.1.
    [#175](https://github.com/microsoft/ps-rule/pull/175)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v231)

## v2.3.0

What's changed since v2.2.0:

- Engineering:
  - Bump PSRule to v2.3.0.
    [#172](https://github.com/microsoft/ps-rule/pull/172)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v230)

## v2.2.0

What's changed since v2.1.0:

- Engineering:
  - Bump PSRule to v2.2.0.
    [#168](https://github.com/microsoft/ps-rule/pull/168)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v220)

## v2.1.0

What's changed since v2.0.1:

- New features:
  - Added support for alternative option file.
    [#155](https://github.com/microsoft/ps-rule/issues/155)
    - Set the `option` parameter to the path to an options file.
    - By default, the `ps-rule.yaml` option file is used.
- Engineering:
  - Bump PSRule to v2.1.0.
    [#165](https://github.com/microsoft/ps-rule/pull/165)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v210)

## v2.0.1

What's changed since v2.0.0:

- Engineering:
  - Bump PSRule to v2.0.1.
    [#158](https://github.com/microsoft/ps-rule/pull/158)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v201)
- Bug fixes:
  - Fixed assertion failed with newer version.
    [#159](https://github.com/microsoft/ps-rule/issues/159)

## v2.0.0

What's changed since v1.12.0:

- New features:
  - Added support for using a specific version of PSRule.
    [#132](https://github.com/microsoft/ps-rule/issues/132)
    - To install a specific version set the `version` parameter.
    - By default, the v2 stable version of PSRule is used.
  - Added support for outputting analysis results as SARIF.
    [#136](https://github.com/microsoft/ps-rule/issues/136)
    - To use the SARIF output format set the `outputFormat` parameter to `Sarif`.
  - Added the ability to use an alternative PowerShell repository.
    [#133](https://github.com/microsoft/ps-rule/issues/133)
    - Register and authenticate to the repository in PowerShell if required.
    - Configure `repository` to install modules from the named repository.
- General improvements:
  - Exposed more rule error output in CI.
    [#140](https://github.com/microsoft/ps-rule/issues/140)
- Engineering:
  - **Breaking change:** Bump PSRule to v2.0.0.
    [#152](https://github.com/microsoft/ps-rule/pull/152)
    - See the [change log](https://microsoft.github.io/PSRule/v2/CHANGELOG-v2/#v200)
- Bug fixes:
  - Fixed import of pre-release version.
    [#138](https://github.com/microsoft/ps-rule/issues/138)
  - Fixed path issue for running out of repo.
    [#150](https://github.com/microsoft/ps-rule/issues/150)
