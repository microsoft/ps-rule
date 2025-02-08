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
  uses: microsoft/ps-rule@latest
```

To get the latest stable release by major version use:

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@v2
```

To get a specific release use **(recommended)**:

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@v2.9.0
```

---

> [!TIP]
> The recommended approach is to pin to the latest specific release for example `microsoft/ps-rule@v2.9.0`.
> Pinning to a specific release reduces the risk of new releases breaking your pipeline.
>
> You can easily update to the latest release by changing the version number or using version updates with Dependabot.
> To configure version updates of `github-actions` with Dependabot see [Configuring version updates][5].
>
> When the next release is available, bumping the version allows you to test in a feature branch before merging to main.

---

To get the latest bits use **(not recommended for general use or production)**:

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@main
```

---

> [!CAUTION]
> Using `microsoft/ps-rule@main` is **not recommended** for general use or production workflows.
> The `main` branch is under **active development and may be unstable** or include breaking changes.
> Use `microsoft/ps-rule@main` to try latest updates before the next stable release and provide feedback.

---

To use the latest action with an older version of PSRule, you can use the `version` parameter.
For example:

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@v2.9.0
  with:
    version: '1.11.1'
```

For a list of changes please see the [change log][2].

  [2]: CHANGELOG.md
  [5]: https://docs.github.com/code-security/dependabot/dependabot-version-updates/configuring-dependabot-version-updates#enabling-dependabot-version-updates

## Inputs

```yaml
- name: Run PSRule analysis
  uses: microsoft/ps-rule@main
  with:
    inputPath: string                                            # Optional. The path PSRule will look for files to validate.
    modules: string                                              # Optional. A comma separated list of modules to use for analysis.
    source: string                                               # Optional. A path containing rules to use for analysis.
    baseline: string                                             # Optional. The name of a PSRule baseline to use.
    conventions: string                                          # Optional. A comma separated list of conventions to use.
    option: string                                               # Optional. The path to an options file.
    outcome: Fail, Pass, Error, Processed, Problem, All          # Optional. Filters output to include results with the specified outcome.
    outputFormat: None, Yaml, Json, NUnit3, Csv, Markdown, Sarif # Optional. The format to use when writing results to disk.
    outputPath: string                                           # Optional. The file path to write results to.
    path: string                                                 # Optional. The working directory PSRule is run from.
    prerelease: boolean                                          # Optional. Determine if a pre-release module version is installed.
    repository: string                                           # Optional. The name of the PowerShell repository where PSRule modules are installed from.
    summary: boolean                                             # Optional. Determines if a job summary is written.
    version: string                                              # Optional. The specific version of PSRule to use.
```

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

### `outcome`

Filters output to include results with the specified outcome.
Supported outcomes are `Fail`, `Pass`, `Error`, `Processed`, `Problem`, `All`.
Defaults to `Processed`.

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

### `summary`

Determines if a job summary is written.
By default, a job summary is generated and attached to the workflow run.
When set to `false` the job summary is skipped.

### `version`

The specific version of PSRule to use.
By default, the latest stable version of PSRule will be used.
When set:

- The specific version of PSRule will be installed and imported for use.
- If a pre-release version is specified, `prerelease: true` must also be specified.
- If the version is not found, an error will be thrown.

## Using the action

To use PSRule:

1. See [Creating a workflow file](https://help.github.com/articles/configuring-a-workflow#creating-a-workflow-file).
2. Reference `microsoft/ps-rule@v2.9.0`.
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
      uses: microsoft/ps-rule@v2.9.0
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

## Support

This project uses GitHub Issues to track bugs and feature requests.
Please search the existing issues before filing new issues to avoid duplicates.

- For new issues, file your bug or feature request as a new [issue].
- For help, discussion, and support questions about using this project, join or start a [discussion].

Support for this project/ product is limited to the resources listed above.

[issue]: https://github.com/microsoft/ps-rule/issues
[discussion]: https://github.com/microsoft/ps-rule/discussions

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to
agree to a Contributor License Agreement (CLA) declaring that you have the right to,
and actually do, grant us the rights to use your contribution. For details, visit
<https://cla.microsoft.com>.

When you submit a pull request, a CLA-bot will automatically determine whether you need
to provide a CLA and decorate the PR appropriately (e.g., label, comment).
Simply follow the instructions provided by the bot.
You will only need to do this once across all repositories using our CLA.

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Maintainers

- [Bernie White](https://github.com/BernieWhite)

## License

This project is [licensed under the MIT License](LICENSE).

## Trademarks

This project may contain trademarks or logos for projects, products, or services.
Authorized use of Microsoft trademarks or logos is subject to and must follow [Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
