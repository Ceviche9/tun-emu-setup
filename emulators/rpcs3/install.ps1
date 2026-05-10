Write-Host "Installing RPCS3..."

scoop install emulators/rpcs3
scoop install emulators/ps3-system-software

# Create ROMs folder if it doesn't exist
$romsPath = "C:\Emulators\roms\ps3"
if (!(Test-Path $romsPath)) {
    New-Item -ItemType Directory -Path $romsPath | Out-Null
    Write-Host "ROMs folder created: $romsPath"
}

# Copy firmware to repo
$firmwareSource = "$env:USERPROFILE\scoop\apps\ps3-system-software\current\PS3UPDAT.PUP"
$firmwareDest = "$PSScriptRoot\emulators\rpcs3\firmware\PS3UPDAT.PUP"

if (!(Test-Path "$PSScriptRoot\emulators\rpcs3\firmware")) {
    New-Item -ItemType Directory -Path "$PSScriptRoot\emulators\rpcs3\firmware\" | Out-Null
}
Write-Host "Firmware copied to RPCS3 folder."

# Copy configs from repo to RPCS3 folder
$configSource = "$PSScriptRoot\configs"
$configDest = "$env:USERPROFILE\scoop\apps\rpcs3\current\config"

if (Test-Path $configSource) {
    Copy-Item -Recurse -Force "$configSource\*" $configDest
    Write-Host "Configs applied."
} else {
    Write-Host "No configs found in repo."
}

Write-Host "RPCS3 installed!"
Write-Host "IMPORTANT: Open RPCS3 and go to File > Install Firmware to complete the setup."