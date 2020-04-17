#
# PSRule
# 
FROM mcr.microsoft.com/powershell:7.0.0-alpine-3.8
SHELL ["pwsh", "-Command"]
RUN New-Item -Path /ps_modules/ -ItemType Directory -Force; \
    Save-Module -Name PSRule -RequiredVersion 0.16.0 -Force -Path /ps_modules/; \
    Save-Module -Name PSRule.Rules.Azure -RequiredVersion 0.10.1 -Force -Path /ps_modules/; \
    Save-Module -Name PSRule.Rules.Kubernetes -RequiredVersion 0.2.0 -Force -Path /ps_modules/;

COPY LICENSE README.md /
COPY powershell.ps1 /powershell.ps1

CMD ["pwsh", "-File", "/powershell.ps1"]
