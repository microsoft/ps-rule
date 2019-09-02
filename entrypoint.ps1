
$workspacePath = $Env:GITHUB_WORKSPACE;
$sourcePath = Join-Path -Path $workspacePath -ChildPath $Env:INPUT_SOURCE;

Write-Host '> Preparing PSRule';
Import-Module -Name /ps-rule/modules/PSRule;

Write-Host "> Using source: $sourcePath";
Write-Host "> Using workspace: $workspacePath";

Write-Host '> Executing rules';

try {
    Get-ChildItem -Path $workspacePath -File | Invoke-PSRule -Path $sourcePath -ErrorAction Stop;
}
catch {
    $Host.SetShouldExit(1);
}

Write-Host '> All done.';
