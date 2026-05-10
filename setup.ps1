# Install Scoop if not installed
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    iwr -useb get.scoop.sh | iex
}

# Install Just if not installed
if (!(Get-Command just -ErrorAction SilentlyContinue)) {
    scoop install just
}

# Add emulators bucket
scoop bucket add emulators https://github.com/borger/scoop-emulators.git

# List available emulators
$emulators = Get-ChildItem -Path "$PSScriptRoot\emulators" -Directory
Write-Host ""
Write-Host "Available emulators:"
for ($i = 0; $i -lt $emulators.Count; $i++) {
    Write-Host "  [$i] $($emulators[$i].Name)"
}
Write-Host "  [all] Install all"
Write-Host ""

$choice = Read-Host "Which emulator do you want to install?"

if ($choice -eq "all") {
    foreach ($emulator in $emulators) {
        & "$PSScriptRoot\emulators\$($emulator.Name)\install.ps1"
    }
} elseif ($choice -match "^\d+$" -and [int]$choice -lt $emulators.Count) {
    $selected = $emulators[[int]$choice]
    & "$PSScriptRoot\emulators\$($selected.Name)\install.ps1"
} else {
    Write-Host "Invalid choice."
}