# Windows_Setup.ps1
# Script para atualizar o Windows e instalar programas essenciais via winget
# Execute este script como Administrador

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Configuração do Windows"
$form.Size = New-Object System.Drawing.Size(400,400)
$form.StartPosition = "CenterScreen"

# Checkboxes para programas
$checkboxes = @{}
$programas = @(
    @{Nome="Google Chrome"; Id="Google.Chrome"},
    @{Nome="VS Code"; Id="Microsoft.VisualStudioCode"},
    @{Nome="7zip"; Id="7zip.7zip"},
    @{Nome="Notepad++"; Id="Notepad++.Notepad++"},
    @{Nome="Firefox"; Id="Mozilla.Firefox"},
    @{Nome="VLC"; Id="VideoLAN.VLC"},
    @{Nome="Git"; Id="Git.Git"}
)

$y = 20
foreach ($prog in $programas) {
    $cb = New-Object System.Windows.Forms.CheckBox
    $cb.Text = $prog.Nome
    $cb.Location = New-Object System.Drawing.Point(20, $y)
    $cb.Width = 200
    $form.Controls.Add($cb)
    $checkboxes[$prog.Id] = $cb
    $y += 30
}

# Botão para instalar programas
$btnInstall = New-Object System.Windows.Forms.Button
$btnInstall.Text = "Instalar Selecionados"
$btnInstall.Location = New-Object System.Drawing.Point(20, $y)
$btnInstall.Width = 150
$form.Controls.Add($btnInstall)

# Botão para atualizar Windows
$btnUpdate = New-Object System.Windows.Forms.Button
$btnUpdate.Text = "Atualizar Windows"
$btnUpdate.Location = New-Object System.Drawing.Point(200, $y)
$btnUpdate.Width = 150
$form.Controls.Add($btnUpdate)

# Caixa de saída
$outputBox = New-Object System.Windows.Forms.TextBox
$outputBox.Multiline = $true
$outputBox.ScrollBars = "Vertical"
$outputBox.Location = New-Object System.Drawing.Point(20, $y+40)
$outputBox.Size = New-Object System.Drawing.Size(330,120)
$form.Controls.Add($outputBox)

# Função para instalar programas
$btnInstall.Add_Click({
    $selecionados = $checkboxes.GetEnumerator() | Where-Object { $_.Value.Checked } | ForEach-Object { $_.Key }
    if ($selecionados.Count -eq 0) {
        $outputBox.AppendText("Nenhum programa selecionado.`r`n")
        return
    }
    foreach ($id in $selecionados) {
        $outputBox.AppendText("Instalando $id...\r\n")
        Start-Process winget -ArgumentList "install --id $id -e --accept-source-agreements --accept-package-agreements" -NoNewWindow -Wait
    }
    $outputBox.AppendText("Instalação concluída!\r\n")
})

# Função para atualizar o Windows
$btnUpdate.Add_Click({
    $outputBox.AppendText("Iniciando atualização do Windows...\r\n")
    Install-Module PSWindowsUpdate -Force -Confirm:$false
    Import-Module PSWindowsUpdate
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot
    $outputBox.AppendText("Atualização concluída!\r\n")
})

[void]$form.ShowDialog()
