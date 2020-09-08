# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# PSRule
#

# See details at: https://github.com/Microsoft/ps-rule

[CmdletBinding()]
param (
    # The root path for analysis
    [Parameter(Mandatory = $False)]
    [String]$Path = $Env:INPUT_PATH,

    # The type of input
    [Parameter(Mandatory = $False)]
    [ValidateSet('repository', 'inputPath')]
    [String]$InputType = $Env:INPUT_INPUTTYPE,

     # The path to input files
     [Parameter(Mandatory = $False)]
     [String]$InputPath = $Env:INPUT_INPUTPATH,

    # The path to find rules
    [Parameter(Mandatory = $False)]
    [String]$Source = $Env:INPUT_SOURCE,

    # Rule modules to use
    [Parameter(Mandatory = $False)]
    [String]$Modules = $Env:INPUT_MODULES,

    # The output format
    [Parameter(Mandatory = $False)]
    [ValidateSet('None', 'Yaml', 'Json', 'NUnit3', 'Csv')]
    [String]$OutputFormat = $Env:INPUT_OUTPUTFORMAT,

    # The path to store formatted output
    [Parameter(Mandatory = $False)]
    [String]$OutputPath = $Env:INPUT_OUTPUTPATH
)

$workspacePath = $Env:GITHUB_WORKSPACE;
$ProgressPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue;
if ($Env:SYSTEM_DEBUG -eq 'true') {
    $VerbosePreference = [System.Management.Automation.ActionPreference]::Continue;
}

# Check inputType
if ([String]::IsNullOrEmpty($InputType) -or $InputType -notin 'repository', 'inputPath') {
    $InputType = 'repository';
}

# Set workspace
if ([String]::IsNullOrEmpty($workspacePath)) {
    $workspacePath = $PWD;
}

# Set Path
if ([String]::IsNullOrEmpty($Path)) {
    $Path = $workspacePath;
}
else {
    $Path = Join-Path -Path $workspacePath -ChildPath $Path;
}

# Set InputPath
if ([String]::IsNullOrEmpty($InputPath)) {
    $InputPath = $Path;
}
else {
    $InputPath = Join-Path -Path $Path -ChildPath $InputPath;
}

# Set Source
if ([String]::IsNullOrEmpty($Source)) {
    $Source = Join-Path -Path $Path -ChildPath '.ps-rule/';
}
else {
    $Source = Join-Path -Path $Path -ChildPath $Source;
}

function WriteDebug {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $True)]
        [String]$Message
    )
    process {
        if ($Env:SYSTEM_DEBUG -eq 'true' -or $Env:ACTIONS_STEP_DEBUG -eq 'true') {
            Write-Host "::debug::$Message";
        }
    }
}

# Setup paths for importing modules
$modulesPath = '/ps_modules/';
if ((Get-Variable -Name IsMacOS -ErrorAction Ignore) -or (Get-Variable -Name IsLinux -ErrorAction Ignore)) {
    $moduleSearchPaths = $Env:PSModulePath.Split(':', [System.StringSplitOptions]::RemoveEmptyEntries);
    if ($modulesPath -notin $moduleSearchPaths) {
        $Env:PSModulePath += [String]::Concat($Env:PSModulePath, ':', $modulesPath);
    }
}
else {
    $moduleSearchPaths = $Env:PSModulePath.Split(';', [System.StringSplitOptions]::RemoveEmptyEntries);
    if ($modulesPath -notin $moduleSearchPaths) {
        $Env:PSModulePath += [String]::Concat($Env:PSModulePath, ';', $modulesPath);
    }
}

$moduleNames = @()
if (![String]::IsNullOrEmpty($Modules)) {
    $moduleNames = $Modules.Split(',', [System.StringSplitOptions]::RemoveEmptyEntries);
}
$moduleParams = @{
    Scope = 'CurrentUser'
    Force = $True
}

# Install each module if not already installed
foreach ($m in $moduleNames) {
    $m = $m.Trim();
    Write-Host "> Checking module: $m";
    if ($Null -eq (Get-InstalledModule -Name $m -ErrorAction Ignore)) {
        Write-Host '  - Installing module';
        $Null = Install-Module -Name $m @moduleParams -AllowClobber;
    }
    else {
        Write-Host '  - Already installed';
    }
    # Check
    if ($Null -eq (Get-InstalledModule -Name $m)) {
        Write-Host "  - Failed to install";
    }
    else {
        Write-Host "  - Using version: $((Get-InstalledModule -Name $m).Version)";
    }
}

Write-Host '';
Write-Host "[info] Using Action: $Env:GITHUB_ACTION";
Write-Host "[info] Using PWD: $PWD";
Write-Host "[info] Using Path: $Path";
Write-Host "[info] Using Source: $Source";
Write-Host "[info] Using InputType: $InputType";
Write-Host "[info] Using InputPath: $InputPath";
Write-Host "[info] Using OutputFormat: $OutputFormat";
Write-Host "[info] Using OutputPath: $OutputPath";

try {
    Push-Location -Path $Path;
    $invokeParams = @{
        Path = $Source
        Style = 'GitHubActions'
        ErrorAction = 'Stop'
    }
    WriteDebug "Preparing command-line:";
    WriteDebug ([String]::Concat('-Path ''', $Source, ''''));
    if (![String]::IsNullOrEmpty($Modules)) {
        $moduleNames = $Modules.Split(',', [System.StringSplitOptions]::RemoveEmptyEntries);
        $invokeParams['Module'] = $moduleNames;
        WriteDebug ([String]::Concat('-Module ', [String]::Join(', ', $moduleNames)));
    }
    if (![String]::IsNullOrEmpty($OutputFormat) -and ![String]::IsNullOrEmpty($OutputPath) -and $OutputFormat -ne 'None') {
        $invokeParams['OutputFormat'] = $OutputFormat;
        $invokeParams['OutputPath'] = $OutputPath;
        WriteDebug ([String]::Concat('-OutputFormat ', $OutputFormat, ' -OutputPath ''', $OutputPath, ''''));
    }

    # repository
    if ($InputType -eq 'repository') {
        WriteDebug 'Running ''Assert-PSRule'' with repository as input.';
        Write-Host '';
        Write-Host '---';
        Assert-PSRule @invokeParams -InputPath $InputPath -Format File;
    }
    # inputPath
    elseif ($InputType -eq 'inputPath') {
        WriteDebug 'Running ''Assert-PSRule'' with input from path.';
        Write-Host '';
        Write-Host '---';
        Assert-PSRule @invokeParams -InputPath $InputPath;
    }
}
catch {
    Write-Host "::error::One or more assertions failed.";
    $Host.SetShouldExit(1);
}
finally {
    Pop-Location;
}
Write-Host '---';
