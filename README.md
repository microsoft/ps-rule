# PSRule

Validate infrastructure as code (IaC) and DevOps repositories using rules.
PSRule allows you to analyse a repository with pre-built rules or create your own.
Analysis can be performed from input files or the repository structure.

To learn about PSRule and how to write your own rules see [Getting started](https://github.com/microsoft/PSRule#getting-started).

## Usage

To get the latest stable release use:

```yaml
- name: Run PSRule analysis
  uses: Microsoft/ps-rule@v0.3.0
```

To get the latest bits use:

```yaml
- name: Run PSRule analysis
  uses: Microsoft/ps-rule@main
```

## Inputs

```yaml
- name: Run PSRule analysis
  uses: Microsoft/ps-rule@main
  with:
    inputType: repository, inputPath              # Optional. Determines the type of input to use for PSRule.
    inputPath: string                             # Optional. The path PSRule will look for files to validate.
    modules: string                               # Optional. A comma separated list of modules to use for analysis.
    source: string                                # Optional. A path containing rules to use for analysis.
    outputFormat: None, Yaml, Json, NUnit3, Csv   # Optional. The format to use when writing results to disk.
    outputPath: string                            # Optional. The file path to write results to.
    path: string                                  # Optional. The working directory PSRule is run from.
```

### `inputType`

Determines the type of input to use for PSRule either `repository` or `inputPath`.
Defaults to `repository`.

When set to:

- `repository` - The structure of the repository within `inputPath` will be analyzed.
- `inputPath` - Supported file formats within `inputPath` will be read as objects.

### `inputPath`

The path PSRule will look for input files.
Defaults to repository root.

### `modules`

A comma separated list of modules to use for analysis.

Modules are additional packages that can be installed from the PowerShell Gallery.
PSRule will install the latest **stable** version from the PowerShell Gallery automatically.
[Available modules](https://www.powershellgallery.com/packages?q=Tags:%22PSRule-rules%22).

### `source`

An path containing rules to use for analysis.
Defaults to `.ps-rule/`.

Use this option to include rules that have not been packaged as a module.

### `outputFormat`

The output format to write result to disk.
Supported formats are `Yaml`, `Json`, `NUnit3`, `Csv`.
Defaults to `None`.

### `outputPath`

The file path to write results to when `outputFormat` is configured.

### `path`

The working directory PSRule is run from.
Defaults to repository root.

Options specified in `ps-rule.yaml` from this directory will be used unless overridden by inputs.

## Using the action

To use PSRule:

1. See [Creating a workflow file](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).
2. Reference `Microsoft/ps-rule@main`.
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
      uses: actions/checkout@v2

    - name: Run PSRule analysis
      uses: Microsoft/ps-rule@main
```

3. Create rules within the `.ps-rule/` directory.
For example:

```powershell
# Example .ps-rule/GitHub.Community.Rule.ps1

# Synopsis: Check for recommended community files
Rule 'GitHub.Community' -Type 'System.IO.DirectoryInfo' {
    $requiredFiles = @(
        'README.md'
        'LICENSE'
        'CODE_OF_CONDUCT.md'
        'CONTRIBUTING.md'
        '.github/CODEOWNERS'
        '.github/PULL_REQUEST_TEMPLATE.md'
    )
    Test-Path -Path $TargetObject.FullName;
    for ($i = 0; $i -lt $requiredFiles.Length; $i++) {
        $filePath = Join-Path -Path $TargetObject.FullName -ChildPath $requiredFiles[$i];
        $Assert.Create((Test-Path -Path $filePath -PathType Leaf), "$($requiredFiles[$i]) does not exist");
    }
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

## License

This project is [licensed under the MIT License](LICENSE).
