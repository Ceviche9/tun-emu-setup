Write-Host "Installing PCSX2..."

scoop install emulators/pcsx2

# Create ROMs folder if it doesn't exist
$romsPath = "$PSScriptRoot\roms"
if (!(Test-Path $romsPath)) {
    New-Item -ItemType Directory -Path $romsPath | Out-Null
    Write-Host "ROMs folder created: $romsPath"
}

# Copy configs from repo to PCSX2 folder
$configSource = "$PSScriptRoot\configs"
$configDest = "$env:USERPROFILE\scoop\apps\pcsx2\current\userdata"

if (Test-Path $configSource) {
    Copy-Item -Recurse -Force "$configSource\*" $configDest
    Write-Host "Configs applied."
} else {
    Write-Host "No configs found in repo."
}

# Copy BIOS to PCSX2 folder
$biosSource = "$PSScriptRoot\bios"
$biosDest = "$env:USERPROFILE\scoop\apps\pcsx2\current\bios"

if (Test-Path $biosSource) {
    Copy-Item -Recurse -Force "$biosSource\*" $biosDest
    Write-Host "BIOS applied."
} else {
    Write-Host "No BIOS found. Dump it from your PS2 and place it in emulators\pcsx2\bios\"
}

Write-Host "PCSX2 installed!"