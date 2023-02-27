# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# Handles bump to release branches.

function Update-Branch {
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory = $True)]
        [String]$Major,

        [Parameter(Mandatory = $True)]
        [String]$Remote,

        [Parameter(Mandatory = $False)]
        [Switch]$Latest
    )
    process {
        $version = Get-LatestVersion -Remote $Remote -Major $Major;

        Write-Host "Latest stable release is: $version";
        Write-Host "Checking out tag for: $version"

        git fetch --tags $Remote;
        git checkout refs/tags/v$version;

        Write-Host "Updating release branch: $Major";
        git push $Remote refs/tags/v$version`:refs/heads/$Major --force;

        if ($Latest) {
            Write-Host "Updating latest to: $Major";
            git push $Remote refs/tags/v$version`:refs/heads/latest --force;
        }

        git checkout main;
    }
}

function Get-LatestVersion {
    [CmdletBinding()]
    [OutputType([String])]
    param (
        [Parameter(Mandatory = $True)]
        [String]$Major,

        [Parameter(Mandatory = $True)]
        [String]$Remote
    )
    process {
        return (gh api repos/microsoft/ps-rule/releases | Out-String | ConvertFrom-Json | Where-Object {
            $_.prerelease -eq $False -and $_.name -like "$Major.*"
        } | Select-Object -Property @{ Name = 'version'; Expression = { [System.Version]::Parse($_.name.Replace('v', '')) } } | Sort-Object -Property version -Descending -Top 1).Version.ToString();
    }
}
