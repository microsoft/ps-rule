# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

FROM mcr.microsoft.com/powershell:7.0.1-alpine-3.8
SHELL ["pwsh", "-Command"]
RUN $ProgressPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue; \
    Install-Module -Name PSRule -RequiredVersion 0.18.0 -Force; \
    Install-Module -Name PSRule.Rules.Azure -RequiredVersion 0.12.1 -Force; \
    Install-Module -Name PSRule.Rules.Kubernetes -RequiredVersion 0.2.0 -Force;

    # $Null = New-Item -Path /ps_modules/ -ItemType Directory -Force; \
    # Save-Module -Name PSRule -RequiredVersion 0.18.0 -Force -Path /ps_modules/; \
    # Save-Module -Name PSRule.Rules.Azure -RequiredVersion 0.12.1 -Force -Path /ps_modules/; \
    # Save-Module -Name PSRule.Rules.Kubernetes -RequiredVersion 0.2.0 -Force -Path /ps_modules/;

COPY LICENSE README.md powershell.ps1 /
CMD ["pwsh", "-File", "/powershell.ps1"]
