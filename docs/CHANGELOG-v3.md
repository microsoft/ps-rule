# Change log

See [upgrade notes][upgrade-notes] for helpful information when upgrading from previous versions.

[upgrade-notes]: upgrade-notes.md

## Unreleased

What's changed since v2.9.0:

- New features:
  - **Breaking change:** Added support for PSRule v3 by @BernieWhite.
    [#239](https://github.com/microsoft/ps-rule/issues/239)
    - Action now uses PSRule CLI v3.
    - The `inputType` input has been removed. This input is no longer required with PSRule v3.
