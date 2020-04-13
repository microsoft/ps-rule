#
# PSRule
# 
FROM mcr.microsoft.com/powershell:7.0.0-alpine-3.8
SHELL ["pwsh", "-Command"]
RUN New-Item -Path /ps-rule/modules/ -ItemType Directory -Force; \
    Save-Module -Name PSRule -RequireVersion 0.16.0 -Force -Path /ps-rule/modules/; \
    Save-Module -Name PSRule.Rules.Azure -RequireVersion 0.10.1 -Force -Path /ps-rule/modules/; \
    Save-Module -Name PSRule.Rules.Kubernetes -RequireVersion 0.2.0 -Force -Path /ps-rule/modules/;

COPY LICENSE README.md /
COPY entrypoint.ps1 /entrypoint.ps1

CMD ["pwsh", "-File", "/entrypoint.ps1"]
