# Action reference

## PSRule-actions

Perform analysis and assert PSRule conditions.
Analysis can be perform from input files or the repository structure.

### Syntax

```yaml
steps:
- name: string
  uses: BernieWhite/PSRule-actions@master
  with:
    inputType: repository, inputPath              # Required. Determines the type of input to use for PSRule.
    inputPath: string                             # Required. The path PSRule will look for files to validate.
    modules: string                               # Optional. A comma separated list of modules to use for analysis.
    source: string                                # Optional. An path containing rules to use for analysis.
    outputFormat: None, Yaml, Json, NUnit3, Csv   # Optional. The format to use when writing results to disk.
    outputPath: string                            # Optional. The file path to write results to.
    path: string                                  # Optional. The working directory PSRule is run from.
```

- **inputType**: Determines the type of input to use for PSRule.
Either `repository` or `inputPath`.
When `inputType: inputPath` is used, supported file formats within `inputPath` will be read as objects.
When `inputType: repository` is used, the structure of the repository will be analyzed instead.
- **inputPath**: Set the `inputPath` to determine where PSRule will look for input files.
When `inputType: inputPath` this is binds to the [-InputPath](https://microsoft.github.io/PSRule/commands/PSRule/en-US/Assert-PSRule.html#-inputpath) parameter.
When `inputType: repository` this will be the repository root that PSRule analyzes.
- **modules**: A comma separated list of modules to use for analysis.
Install PSRule modules using the `ps-rule-install` task.
If the modules have not been installed,
the latest stable version will be installed from the PowerShell Gallery automatically.
For example: _PSRule.Rules.Azure,PSRule.Rules.Kubernetes_
- **source**: An path containing rules to use for analysis.
Use this option to include rules not installed as a PowerShell module.
This binds to the [-Path](https://microsoft.github.io/PSRule/commands/PSRule/en-US/Assert-PSRule.html#-path) parameter.
- **outputFormat**: Output results can be written to disk in addition to the default output.
Use this option to determine the format to write results.
By default, results are not written to disk.
This binds to the [-OutputFormat](https://microsoft.github.io/PSRule/commands/PSRule/en-US/Assert-PSRule.html#-outputformat) parameter.
- **outputPath**: The file path to write results to.
This binds to the [-OutputPath](https://microsoft.github.io/PSRule/commands/PSRule/en-US/Assert-PSRule.html#-outputpath) parameter.
- **path**: The working directory PSRule is run from.
Options specified in `ps-rule.yaml` from this directory will be used unless overridden by inputs.
