# Backup saves before uninstalling
$savesSource = "$env:USERPROFILE\scoop\apps\pcsx2\current\userdata\PCSX2\memcards"
$savesBackup = "$PSScriptRoot\saves_backup"

if (Test-Path $savesSource) {
    Copy-Item -Recurse -Force $savesSource $savesBackup
    Write-Host "Saves backed up to: $savesBackup"
}

scoop uninstall pcsx2

Write-Host "PCSX2 uninstalled!"