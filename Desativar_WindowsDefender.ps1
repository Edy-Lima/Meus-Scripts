# Desativa o Windows Defender no Windows 11
# Execute como Administrador

Write-Host "Desativando o Windows Defender..." -ForegroundColor Yellow

# Desativa via registro (Política de Grupo)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -Force

# Desativa proteção em tempo real
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableBehaviorMonitoring $true
Set-MpPreference -DisableBlockAtFirstSeen $true
Set-MpPreference -DisableIOAVProtection $true
Set-MpPreference -DisableScriptScanning $true
Set-MpPreference -DisableIntrusionPreventionSystem $true
Set-MpPreference -DisableRemovableDriveScanning $true
Set-MpPreference -DisableArchiveScanning $true
Set-MpPreference -DisableEmailScanning $true

# Tenta parar e desabilitar o serviço do Defender
Stop-Service -Name "WinDefend" -Force -ErrorAction SilentlyContinue
Set-Service -Name "WinDefend" -StartupType Disabled -ErrorAction SilentlyContinue

Write-Host "Windows Defender desativado. Reinicie o computador para garantir a aplicação total das configurações." -ForegroundColor Green
