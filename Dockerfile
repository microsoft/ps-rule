#
# PSRule
# 
FROM mcr.microsoft.com/powershell:6.2.3-alpine-3.8
SHELL ["pwsh", "-Command"]
RUN New-Item -Path /ps-rule/modules/ -ItemType Directory -Force; \
    Save-Module -Name PSRule -AllowPrerelease -Force -Path /ps-rule/modules/;

COPY LICENSE README.md /
COPY entrypoint.ps1 /entrypoint.ps1

CMD ["pwsh", "-File", "/entrypoint.ps1"]
