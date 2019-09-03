#
# PSRule
#

# See details at: https://github.com/BernieWhite/PSRule-actions

$workspacePath = $Env:GITHUB_WORKSPACE;
$sourcePath = Join-Path -Path $workspacePath -ChildPath $Env:INPUT_SOURCE;

Write-Host '##[group] Preparing PSRule';
$Null = Import-Module -Name /ps-rule/modules/PSRule;
$moduleVersion = (Get-Module PSRule).Version.ToString();
Write-Host "> Using PSRule v$moduleVersion";
Write-Host '';
Write-Host "> Using source: $sourcePath";
Write-Host "> Using workspace: $workspacePath";
Write-Host '##[endgroup]';

Write-Host '##[group] Executing rules';
Write-Host '';
Write-Host '---';

try {
    Get-ChildItem -Path $workspacePath -File | Invoke-PSRule -Path $sourcePath -ErrorAction Stop;
}
catch {
    $Host.SetShouldExit(1);
}

Write-Host '---';
Write-Host '##[endgroup]';
Write-Host '> All done.';
