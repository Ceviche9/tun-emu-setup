set shell := ["powershell", "-NoProfile", "-Command"]

default:
    just --list

# Install a specific emulator or all
setup:
    .\setup.ps1

# Uninstall a specific emulator or all
uninstall:
    .\uninstall.ps1

# List all available emulators
list:
    .\list.ps1

# Update all emulators
update:
    .\update.ps1

# Sync configs to repo
sync:
    .\sync-configs.ps1

# Unblock all scripts after git clone or git pull
unblock:
    Get-ChildItem -Recurse | Unblock-File