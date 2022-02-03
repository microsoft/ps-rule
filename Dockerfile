# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

ARG MODULE_VERSION=1.11.0

FROM mcr.microsoft.com/powershell:7.2.1-alpine-3.14-20220202
SHELL ["pwsh", "-Command"]
RUN $ProgressPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue; \
    $Null = New-Item -Path /ps_modules/ -ItemType Directory -Force; \
    Save-Module -Name PSRule -RequiredVersion ${MODULE_VERSION} -Force -Path /ps_modules/;

COPY LICENSE README.md powershell.ps1 /
CMD ["pwsh", "-File", "/powershell.ps1"]
