#
# PSRule
#

# See details at: https://github.com/BernieWhite/PSRule-actions

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
$sourcePath = Join-Path -Path $workspacePath -ChildPath $Env:INPUT_SOURCE;
$repository = $Env:INPUT_REPOSITORY;

if ($Env:SYSTEM_DEBUG -eq 'true') {
    $VerbosePreference = 'Continue';
}
if ([String]::IsNullOrEmpty($Path)) {
    $Path = $workspacePath;
}
if ([String]::IsNullOrEmpty($Path)) {
    $Path = $PWD;
}
if ([String]::IsNullOrEmpty($InputPath)) {
    $InputPath = $Path;
}
if ([String]::IsNullOrEmpty($Source)) {
    $Source = Join-Path -Path $Path -ChildPath '.ps-rule/';
}
if (!(Test-Path -Path $Source)) {
    Write-Host "[info] Source '$Source' does not exist.";
    Write-Host '';
}

function WriteDebug {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $True)]
        [String]$Message
    )
    process {
        if ($Env:SYSTEM_DEBUG -eq 'true') {
            Write-Host "[debug] $Message";
        }
    }
}

# Setup paths for importing modules
$modulesPath = Join-Path -Path $PSScriptRoot -ChildPath 'ps_modules' -Resolve;
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


Write-Host "`#`#[group] Preparing PSRule";
# $Null = Import-Module -Name /ps-rule/modules/PSRule;
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
