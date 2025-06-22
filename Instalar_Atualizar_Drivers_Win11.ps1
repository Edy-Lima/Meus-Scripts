# Script PowerShell para instalar e atualizar drivers no Windows 11
# Execute como Administrador

# Atualizar drivers via Windows Update
Write-Host "Atualizando drivers via Windows Update..." -ForegroundColor Cyan
Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
Import-Module PSWindowsUpdate
Get-WindowsUpdate -MicrosoftUpdate -Category Drivers -AcceptAll -Install -AutoReboot

# Instalar drivers de uma pasta específica (opcional)
$driverPath = Read-Host "Digite o caminho da pasta com os drivers (.inf) ou pressione Enter para pular"
if ($driverPath -and (Test-Path $driverPath)) {
    Write-Host "Instalando drivers da pasta: $driverPath" -ForegroundColor Cyan
    $infFiles = Get-ChildItem -Path $driverPath -Recurse -Filter *.inf
    foreach ($inf in $infFiles) {
        pnputil /add-driver $inf.FullName /install
    }
} else {
    Write-Host "Pasta de drivers não informada ou não encontrada. Pulando instalação manual." -ForegroundColor Yellow
}

Write-Host "Processo concluído!" -ForegroundColor Green
