# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

FROM mcr.microsoft.com/powershell:7.0.1-alpine-3.8
SHELL ["pwsh", "-Command"]
RUN $ProgressPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue; \
    Install-Module -Name PSRule -RequiredVersion 0.18.0 -Force;

COPY LICENSE README.md powershell.ps1 /
CMD ["pwsh", "-File", "/powershell.ps1"]
