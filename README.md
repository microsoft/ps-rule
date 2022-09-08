# PSRule

Validate infrastructure as code (IaC) and DevOps repositories using rules.
PSRule allows you to analyze a repository with pre-built rules or create your own.
Analysis can be performed from input files or the repository structure.

To learn about PSRule and how to write your own rules see [Getting started][1].

  [1]: https://microsoft.github.io/PSRule/v2/quickstart/standalone-rule/

## Usage

To get the latest stable release use:

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@v2.3.2
```

To get the latest bits use:

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@main
```

To use the latest action with an older version of PSRule, you can use the `version` parameter.
For example:

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@v2.3.2
  with:
    version: '1.11.1'
```

For a list of changes please see the [change log][2].

  [2]: CHANGELOG.md

## Inputs

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@main
  with:
    inputType: repository, inputPath                             # Optional. Determines the type of input to use for PSRule.
    inputPath: string                                            # Optional. The path PSRule will look for files to validate.
    modules: string                                              # Optional. A comma separated list of modules to use for analysis.
    source: string                                               # Optional. A path containing rules to use for analysis.
    baseline: string                                             # Optional. The name of a PSRule baseline to use.
    conventions: string                                          # Optional. A comma separated list of conventions to use.
    option: string                                               # Optional. The path to an options file.
    outputFormat: None, Yaml, Json, NUnit3, Csv, Markdown, Sarif # Optional. The format to use when writing results to disk.
    outputPath: string                                           # Optional. The file path to write results to.
    path: string                                                 # Optional. The working directory PSRule is run from.
    prerelease: boolean                                          # Optional. Determine if a pre-release module version is installed.
    repository: string                                           # Optional. The name of the PowerShell repository where PSRule modules are installed from.
    version: string                                              # Optional. The specific version of PSRule to use.
```

### `inputType`

Determines the type of input to use for PSRule either `repository` or `inputPath`.
Defaults to `repository`.

When set to:

- `repository` - The structure of the repository within `inputPath` will be analyzed.
- `inputPath` - Supported file formats within `inputPath` will be read as objects.

### `inputPath`

The path PSRule will look for input files.
You can still use this parameter even when `inputType` is set to `repository`.

This must be a relative path from the `path` input parameter.
Defaults to repository root.

**Note:** Avoid using a relative path starting with `/`, as a leading slash indicates _root_ on Linux.

### `modules`

A comma separated list of modules to use for analysis.

Modules are additional packages that can be installed from the PowerShell Gallery.
PSRule will install the latest **stable** version from the PowerShell Gallery automatically by default.
[Available modules][3].

To install pre-release module versions, use `prerelease: true`.

  [3]: https://www.powershellgallery.com/packages?q=Tags%3A%22PSRule-rules%22

### `source`

An path containing rules to use for analysis.
Defaults to `.ps-rule/`.

Use this option to include rules that have not been packaged as a module.

### `baseline`

The name of a PSRule baseline to use.
Baselines can be used from modules or specified in a separate file.

- To use a baseline included in a module use `modules:` with `baseline:`.
- To use a baseline specified in a separate file use `source:` with `baseline:`.

### `conventions`

A comma separated list of conventions to use.
Conventions can be used from modules or specified in a separate file.

- To use a convention included in a module use `modules:` with `conventions:`.
- To use a convention specified in a separate file use `source:` with `conventions:`.

For example: `conventions: Monitor.LogAnalytics.Import`

### `option`

The path to an options file.
By default, `ps-rule.yaml` will be used if it exists.
Configure this parameter to use a different file.

### `outputFormat`

The output format to write result to disk.
Supported formats are `Yaml`, `Json`, `NUnit3`, `Csv`, `Markdown`, `Sarif`.
Defaults to `None`.

### `outputPath`

The file path to write results to when `outputFormat` is configured.

### `path`

The working directory PSRule is run from.
Defaults to repository root.

Options specified in `ps-rule.yaml` from this directory will be used unless overridden by inputs.

### `prerelease`

Determine if a pre-release module versions are installed.
When set to `true` the latest pre-release or stable module version is installed.

If this input is not configured, invalid, or set to `false` only stable module versions will be installed.

### `repository`

The name of the PowerShell repository where PSRule modules are installed from.
By default this is the PowerShell Gallery.

When configured, PowerShell modules are installed from this repository.
Before calling the `ps-rule` action, register and authenticate to the repository if required.

For example, to register a local repository use:

```powershell
Register-PSRepository -SourceLocation \\server\share -Name Local -InstallationPolicy Trusted;
```

For details PowerShell repositories see [Working with Private PowerShellGet Repositories][4].

  [4]: https://docs.microsoft.com/powershell/scripting/gallery/how-to/working-with-local-psrepositories

### `version`

The specific version of PSRule to use.
By default, the latest stable version of PSRule will be used.
When set:

- The specific version of PSRule will be installed and imported for use.
- If a pre-release version is specified, `prerelease: true` must also be specified.
- If the version is not found, an error will be thrown.

## Using the action

To use PSRule:

1. See [Creating a workflow file](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).
2. Reference `microsoft/ps-rule@v2.3.2`.
For example:

```yaml
name: CI
on: [push]
jobs:
  analyze:
    name: Analyze repository
    runs-on: ubuntu-latest
    steps:

    - name: Checkout
      uses: actions/checkout@v3

    - name: Run PSRule analysis
      uses: microsoft/ps-rule@v2.3.2
```

3. Create rules within the `.ps-rule/` directory.
For example:

```powershell
# Example .ps-rule/GitHub.Community.Rule.ps1

# Synopsis: Check for recommended community files
Rule 'GitHub.Community' -Type 'PSRule.Data.RepositoryInfo' {
    $Assert.FilePath($TargetObject, 'FullName', @('LICENSE'));
    $Assert.FilePath($TargetObject, 'FullName', @('CODE_OF_CONDUCT.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('CONTRIBUTING.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('README.md'));
    $Assert.FilePath($TargetObject, 'FullName', @('.github/CODEOWNERS'));
    $Assert.FilePath($TargetObject, 'FullName', @('.github/PULL_REQUEST_TEMPLATE.md'));
}
```

4. Run the workflow.

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to
agree to a Contributor License Agreement (CLA) declaring that you have the right to,
and actually do, grant us the rights to use your contribution. For details, visit
https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need
to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the
instructions provided by the bot. You will only need to do this once across all repositories using our CLA.

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Maintainers

- [Bernie White](https://github.com/BernieWhite)
- [Armaan Mcleod](https://github.com/ArmaanMcleod)

## License

This project is [licensed under the MIT License](LICENSE).
