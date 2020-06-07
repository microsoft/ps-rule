# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

ARG fromTag=alpine-3.8
ARG imageRepo=mcr.microsoft.com/powershell
ARG MODULE_VERSION=0.18.0

FROM ${imageRepo}:${fromTag}
SHELL ["pwsh", "-Command"]
RUN $ProgressPreference = [System.Management.Automation.ActionPreference]::SilentlyContinue; \
    $Null = New-Item -Path /ps_modules/ -ItemType Directory -Force; \
    Save-Module -Name PSRule -RequiredVersion ${MODULE_VERSION} -Force -Path /ps_modules/;

COPY LICENSE README.md powershell.ps1 /
CMD ["pwsh", "-File", "/powershell.ps1"]
