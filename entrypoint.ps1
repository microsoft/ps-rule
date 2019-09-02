
$sourcePath = $Env:SOURCE;
$workspacePath = $Env:GITHUB_WORKSPACE;

Write-Host "> Preparing PSRule";
Install-Module -Name PSRule -Force -Scope CurrentUser;
Import-Module -Name /ps-rule/modules/PSRule;

try {
    Invoke-PSRule -Path $sourcePath -InputPath $workspacePath -ErrorAction Stop;
}
finally {
    $Host.SetShouldExit(1);
}
