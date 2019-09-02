
$sourcePath = $Env:INPUT_SOURCE;
$workspacePath = $Env:GITHUB_WORKSPACE;

Write-Host "> Preparing PSRule";
Write-Host "> Using source: $sourcePath";
Write-Host "> Using workspace: $workspacePath";

try {
    Invoke-PSRule -Path $sourcePath -InputPath $workspacePath -ErrorAction Stop;
}
finally {
    $Host.SetShouldExit(1);
}
