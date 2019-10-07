#
# PSRule
#

# See details at: https://github.com/BernieWhite/PSRule-actions

$workspacePath = $Env:GITHUB_WORKSPACE;
$sourcePath = Join-Path -Path $workspacePath -ChildPath $Env:INPUT_SOURCE;

if (!(Test-Path -Path $sourcePath)) {
    Write-Host "`#`#[info] Source path '$sourcePath' does not exist.";
    return;
}

Write-Host "`#`#[group] Preparing PSRule";
$Null = Import-Module -Name /ps-rule/modules/PSRule;
$moduleVersion = (Get-Module PSRule).Version.ToString();
Write-Host "> Using PSRule -- v$moduleVersion";
Write-Host '';
Write-Host "> Using source: $sourcePath";
Write-Host "> Using workspace: $workspacePath";
Write-Host "`#`#[endgroup]";

Write-Host '';
Write-Host '> Executing rules';
Write-Host '';
Write-Host '---';

try {
    $invokeParams = @{
        Path = $sourcePath
        Option = (New-PSRuleOption -TargetName 'FullName')
        Style = 'GitHubActions'
    }
    $items = New-Object -TypeName System.Collections.ArrayList;
    $Null = $items.Add((Get-Item -Path $workspacePath));
    $Null = $items.AddRange((Get-ChildItem -Path $workspacePath -File -Recurse));
    $items.ToArray() | Assert-PSRule @invokeParams;
    # if ($Null -ne $Error -and $Error.Count -gt 0) {
    #     $Host.SetShouldExit(1);
    # }
}
catch {
    Write-Host "`#`#[error] $($_.Message)";
    $Host.SetShouldExit(1);
}

Write-Host '---';
Write-Host '';
Write-Host '> All done.';
