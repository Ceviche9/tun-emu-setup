# List all available emulators
$emulators = Get-ChildItem -Path "$PSScriptRoot\emulators" -Directory

Write-Host ""
Write-Host "Available emulators:"
foreach ($emulator in $emulators) {
    Write-Host "  - $($emulator.Name)"
}
Write-Host ""