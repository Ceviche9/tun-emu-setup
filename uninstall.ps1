# List installed emulators
$emulators = Get-ChildItem -Path "$PSScriptRoot\emulators" -Directory
Write-Host ""
Write-Host "Installed emulators:"
for ($i = 0; $i -lt $emulators.Count; $i++) {
    Write-Host "  [$i] $($emulators[$i].Name)"
}
Write-Host "  [all] Uninstall all"
Write-Host ""

$choice = Read-Host "Which emulator do you want to uninstall?"

if ($choice -eq "all") {
    foreach ($emulator in $emulators) {
        & "$PSScriptRoot\emulators\$($emulator.Name)\uninstall.ps1"
    }
} elseif ($choice -match "^\d+$" -and [int]$choice -lt $emulators.Count) {
    $selected = $emulators[[int]$choice]
    & "$PSScriptRoot\emulators\$($selected.Name)\uninstall.ps1"
} else {
    Write-Host "Invalid choice."
}