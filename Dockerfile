#
# PSRule
# 
FROM mcr.microsoft.com/powershell:6.2.2-alpine-3.8
SHELL ["pwsh", "-Command"]
RUN New-Item -Path /ps-rule/modules/ -ItemType Directory -Force; \
    Save-Module -Name PSRule -Force -Path /ps-rule/modules/;

COPY LICENSE README.md /
COPY entrypoint.ps1 /entrypoint.ps1

CMD ["pwsh", "-File", "/entrypoint.ps1"]
