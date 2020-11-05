# Change log

See [upgrade notes][upgrade-notes] for helpful information when upgrading from previous versions.

[upgrade-notes]: docs/upgrade-notes.md

## Unreleased

What's changed since v0.4.0:

- General improvements:
  - Added support for markdown output format. [#47](https://github.com/microsoft/ps-rule/issues/47)
- Engineering:
  - Updated to PSRule v0.22.0. [#45](https://github.com/microsoft/ps-rule/issues/45)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/CHANGELOG.md#v0220)

## v0.4.0

What's changed since v0.3.0:

- Engineering:
  - Updated to PSRule v0.21.0. [#41](https://github.com/microsoft/ps-rule/issues/41)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/CHANGELOG.md#v0210)
- Bug fixes:
  - Updated README example rule to use `PSRule.Data.RepositoryInfo` type filter. [#37](https://github.com/microsoft/ps-rule/issues/37)

## v0.3.0

What's changed since v0.2.0:

- General improvements:
  - **Breaking change**: Updated `ps-rule` action to use `File` input format for repository analysis. [#33](https://github.com/microsoft/ps-rule/issues/33)
    - The `Input.PathIgnore` option can be configured to exclude files.
    - Path specs included in `.gitignore` are also automatically excluded.
    - See [upgrade notes][upgrade-v0.3.0] for details on breaking change.
- Engineering:
  - Updated to PSRule v0.20.0. [#34](https://github.com/microsoft/ps-rule/issues/34)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/CHANGELOG.md#v0200)

See [upgrade notes][upgrade-v0.3.0] for helpful information when upgrading from previous versions.

[upgrade-v0.3.0]: docs/upgrade-notes.md#upgrade-to-v030-from-v02x

## v0.2.0

What's changed since v0.1.0:

- Engineering:
  - Updated to PSRule v0.19.0. [#27](https://github.com/microsoft/ps-rule/issues/27)
    - See the [change log](https://github.com/microsoft/PSRule/blob/main/CHANGELOG.md#v0190)

## v0.1.0

- Initial release.
