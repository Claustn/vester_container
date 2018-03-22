FROM microsoft/powershell:latest
MAINTAINER Claus Nielsen

# Set working directory so stuff doesn't end up in /
WORKDIR /root

# Install VMware modules from PSGallery
SHELL [ "pwsh", "-command" ]
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RUN Install-Module VMware.PowerCLI,PowerNSX,PowervRA,Pester
COPY ./Vester /usr/local/share/powershell/Modules/Vester
COPY ./Test-Configs /root/Test-Configs
COPY run.ps1 /root
ENTRYPOINT /root/run.ps1


