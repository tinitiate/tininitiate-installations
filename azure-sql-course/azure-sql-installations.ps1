# Check if Chocolatey is installed (if not, install it)
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    # Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey already installed."
}

# Install Windows Subsystem for Linux (if not already installed)
if (!(Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -eq "Microsoft-Windows-Subsystem-Linux" })) {
    # Enable Windows Subsystem for Linux
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    Write-Host "Windows Subsystem for Linux enabled."
} else {
    Write-Host "Windows Subsystem for Linux already enabled."
}

# Install Virtual Machine Platform (if not already installed)
if (!(Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -eq "VirtualMachinePlatform" })) {
    # Enable Virtual Machine Platform
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    Write-Host "Virtual Machine Platform enabled."
} else {
    Write-Host "Virtual Machine Platform already enabled."
}

# Download and install WSL2 Linux kernel update package (if not already installed)
if (!(wsl -l -v) -match "2") {
    # Install the WSL2 Linux kernel update package
    wsl --set-default-version 2
    Write-Host "WSL2 installed."
} else {
    Write-Host "WSL2 already installed."
}

# Install Docker (if not already installed)
if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    # Install Docker Desktop
    choco install docker-desktop -y
    Write-Host "Docker installed."
} else {
    Write-Host "Docker already installed."
}

# Install DBeaver (if not already installed)
if (!(Test-Path "C:\Program Files\DBeaver\dbeaver.exe")) {
    # Install DBeaver
    choco install dbeaver -y
    Write-Host "DBeaver installed."
} else {
    Write-Host "DBeaver is already installed."
}

# Install Git (if not already installed)
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    # Install Git
    choco install git -y
    Write-Host "Git installed."
} else {
    Write-Host "Git is already installed."
}

# Install Notepad++ (if not already installed)
if (!(Test-Path "C:\Program Files\Notepad++\notepad++.exe")) {
    # Install Notepad++
    choco install notepadplusplus -y
    Write-Host "Notepad++ installed."
} else {
    Write-Host "Notepad++ is already installed."
}

