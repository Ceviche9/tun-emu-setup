# Backup saves before uninstalling
$savesSource = "$env:USERPROFILE\scoop\apps\rpcs3\current\dev_hdd0"
$savesBackup = "$PSScriptRoot\saves_backup"

if (Test-Path $savesSource) {
    Copy-Item -Recurse -Force $savesSource $savesBackup
    Write-Host "Saves backed up to: $savesBackup"
}

scoop uninstall rpcs3
scoop uninstall ps3-system-software

Write-Host "RPCS3 uninstalled!"