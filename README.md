# PSRule

A GitHub action for IT Pros using the PSRule PowerShell module.

![ci-badge]

## Disclaimer

This project is to be considered a **proof-of-concept** and **not a supported product**.

If you have any problems please check our GitHub [issues](https://github.com/BernieWhite/PSRule-actions/issues) page. If you do not see your problem captured, please file a new issue and follow the provided template.

## Using the action

To get started [create a workflow](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).

To include PSRule:

1. Reference `BernieWhite/PSRule-actions@master`.
2. Configure `source`.

For example:

```yaml
name: Rule workflow
on: [push]
jobs:
  run:
    name: Run
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Run PSRule
      uses: BernieWhite/PSRule-actions@master
      with:
        inputType: 'repository'
```

### Action reference

The following action options exist:

- [Action](docs/actions.md)

## Maintainers

- [Bernie White](https://github.com/BernieWhite)

## License

This project is [licensed under the MIT License](LICENSE).

[ci-badge]: https://github.com/BernieWhite/PSRule-actions/workflows/Build/badge.svg
