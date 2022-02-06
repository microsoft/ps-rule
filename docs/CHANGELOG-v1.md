# Change log

See [upgrade notes][upgrade-notes] for helpful information when upgrading from previous versions.

[upgrade-notes]: upgrade-notes.md

## Unreleased

What's changed since v1.12.0:

- New features:
  - Added support for using a specific version of PSRule. [#132](https://github.com/microsoft/ps-rule/issues/132)
    - To install a specific version set the `version` parameter.
    - By default, the latest stable version of PSRule is used.
  - Added support for outputting analysis results as SARIF. [#136](https://github.com/microsoft/ps-rule/issues/136)
    - To use the SARIF output format set the `outputFormat` parameter to `Sarif`.
    - Currently a pre-release version of PSRule must be used.
      To configure this:
      - Set the `prerelease` parameter to `true` to include pre-release versions.
      - Set the `version` parameter to `2.0.0-B2201161` or newer version.
- Bug fixes:
  - Fixed import of pre-release version. [#138](https://github.com/microsoft/ps-rule/issues/138)

## v1.12.0

What's changed since v1.11.0:

- Engineering:
  - Bump PSRule dependency to v1.11.0. [#129](https://github.com/microsoft/ps-rule/issues/129)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v1110)

## v1.11.0

What's changed since v1.10.0:

- Engineering:
  - Bump PSRule dependency to v1.10.0. [#125](https://github.com/microsoft/ps-rule/issues/125)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v1100)
  - Bump PowerShell base image to 7.2.1-alpine-3.14-20211215. [#126](https://github.com/microsoft/ps-rule/issues/126)

## v1.10.0

What's changed since v1.9.0:

- Engineering:
  - Bump PSRule dependency to v1.9.0. [#120](https://github.com/microsoft/ps-rule/issues/120)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v190)

## v1.9.0

What's changed since v1.8.1:

- Engineering:
  - Bump PSRule dependency to v1.8.0. [#117](https://github.com/microsoft/ps-rule/issues/117)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v180)

## v1.8.1

What's changed since v1.8.0:

- Engineering:
  - Bump PSRule dependency to v1.7.2. [#114](https://github.com/microsoft/ps-rule/issues/114)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v172)

## v1.8.0

What's changed since v1.7.0:

- General improvements:
  - Added support for conventions. [#109](https://github.com/microsoft/ps-rule/issues/109)
    - Specify one or more conventions by using `conventions: '<convention1>,<convention2>'`.
    - Conventions can be included from individual files or modules using `source:` and `modules:`.
- Engineering:
  - Bump PSRule dependency to v1.7.0. [#111](https://github.com/microsoft/ps-rule/issues/111)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v170)

## v1.7.0

What's changed since v1.6.0:

- Engineering:
  - Bump PSRule dependency to v1.6.0. [#106](https://github.com/microsoft/ps-rule/issues/106)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v160)
  - Bump PowerShell base image to 7.1.3-alpine-3.12-20210803. [#105](https://github.com/microsoft/ps-rule/pull/105)

## v1.6.0

What's changed since v1.5.0:

- Engineering:
  - Bump PSRule dependency to v1.5.0. [#96](https://github.com/microsoft/ps-rule/issues/96)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v150)
  - Bump PowerShell base image to 7.1.3-alpine-3.12-20210616. [#94](https://github.com/microsoft/ps-rule/pull/94)
- Bug fixes:
  - Fixed action fail when module installation fails. [#95](https://github.com/microsoft/ps-rule/issues/95)

## v1.5.0

What's changed since v1.4.0:

- Engineering:
  - Bump PSRule dependency to v1.4.0. [#90](https://github.com/microsoft/ps-rule/issues/90)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v140)
  - Bump PowerShell base image to 7.1.3-alpine-3.12-20210603. [#89](https://github.com/microsoft/ps-rule/pull/89)

## v1.4.0

What's changed since v1.3.0:

- Engineering:
  - Bump PSRule dependency to v1.3.0. [#83](https://github.com/microsoft/ps-rule/issues/83)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/docs/CHANGELOG-v1.md#v130)

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
