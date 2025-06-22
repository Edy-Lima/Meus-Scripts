# Windows_Setup.ps1
# Script para atualizar o Windows e instalar programas essenciais via winget
# Execute este script como Administrador

# Atualizar o Windows
Write-Host "Iniciando atualização do Windows..." -ForegroundColor Cyan
Install-Module PSWindowsUpdate -Force -Confirm:$false
Import-Module PSWindowsUpdate
Get-WindowsUpdate -AcceptAll -Install -AutoReboot

# Instalar programas via winget
Write-Host "Instalando programas essenciais..." -ForegroundColor Cyan

# Lista de programas para instalar
$programas = @(
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "7zip.7zip",
    "Notepad++.Notepad++",
    "Mozilla.Firefox",
    "VideoLAN.VLC",
    "Git.Git"
)

foreach ($programa in $programas) {
    Write-Host "Instalando $programa..." -ForegroundColor Yellow
    winget install --id $programa -e --accept-source-agreements --accept-package-agreements
}

Write-Host "Configuração concluída!" -ForegroundColor Green
