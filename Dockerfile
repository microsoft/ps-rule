# FROM alpine:3.10

# FROM mcr.microsoft.com/powershell:ubuntu-16.04
FROM mcr.microsoft.com/powershell:6.2.2-alpine-3.8
SHELL ["pwsh", "-command"]
RUN Install-Module -Name PSRule -AllowPrerelease -Force;
RUN Import-Module -Name PSRule;

COPY LICENSE README.md /

COPY entrypoint.ps1 /entrypoint.ps1
ENTRYPOINT ["/entrypoint.ps1"]

# COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]
