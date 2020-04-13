#
# PSRule
#

# See details at: https://github.com/BernieWhite/PSRule-actions

$workspacePath = $Env:GITHUB_WORKSPACE;
$sourcePath = Join-Path -Path $workspacePath -ChildPath $Env:INPUT_SOURCE;
$repository = $Env:INPUT_REPOSITORY;

if (!(Test-Path -Path $sourcePath)) {
    Write-Host "`#`#[info] Source path '$sourcePath' does not exist.";
    return;
}

Write-Host "`#`#[group] Preparing PSRule";
$Null = Import-Module -Name /ps-rule/modules/PSRule;
Write-Host "Using source: $sourcePath";
Write-Host "Using workspace: $workspacePath";
Write-Host "`#`#[endgroup]";

Write-Host '';
Write-Host '---';

try {
    $invokeParams = @{
        Path = $sourcePath
        Option = (New-PSRuleOption -TargetName 'FullName')
        Style = 'GitHubActions'
        ErrorAction = 'Stop'
    }
    $items = New-Object -TypeName System.Collections.ArrayList;
    $Null = $items.Add((Get-Item -Path $workspacePath));
    $Null = $items.AddRange((Get-ChildItem -Path $workspacePath -File -Recurse));
    $items.ToArray() | Assert-PSRule @invokeParams;
}
catch {
    $Host.SetShouldExit(1);
}

Write-Host '---';
