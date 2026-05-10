# RPCS3
$rpcs3Source = "$env:APPDATA\rpcs3"
$rpcs3Dest   = "$PSScriptRoot\emulators\rpcs3\configs"

# Files worth versioning
$filesToSync = @("config.yml", "input_configs")

foreach ($file in $filesToSync) {
    $src = Join-Path $rpcs3Source $file
    if (Test-Path $src) {
        Copy-Item -Recurse -Force $src $rpcs3Dest
        Write-Host "Synced: $file"
    }
}

Write-Host ""
Write-Host "Configs updated in the repo. Don't forget to commit!" -ForegroundColor Yellow