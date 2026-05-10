# tun-emu-setup

A Windows emulator setup automated with Scoop and Just.

## Requirements

- Windows 10 or 11
- PowerShell 5.1 or later
- Git

---

## First Time Setup

### 1. Install Scoop

Open PowerShell and run:

```powershell
iwr -useb get.scoop.sh | iex
```

### 2. Install Just

```powershell
scoop install just
```

### 3. Clone the repo

```powershell
git clone https://github.com/your-username/tun-emu-setup
cd tun-emu-setup
```

### 4. Unblock the scripts

Since the scripts are downloaded from the internet, Windows blocks them by default. Run this once to unblock all scripts in the repo:

```powershell
just unblock
```

### 5. Allow PowerShell to run scripts

Run this once to allow local scripts to execute:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 6. Run the setup

```powershell
just setup
```

This will:
- Install Scoop (if not installed)
- Install Just (if not installed)
- Add the emulators bucket
- Show a list of available emulators to install
- Download firmware/BIOS (if applicable)
- Apply your configs
- Create the ROMs folder

---

## Emulator-specific Setup

### RPCS3 (PS3)

After setup, open RPCS3 and go to:

```
File > Install Firmware
```

The firmware file is already at:

```
C:\Users\<your-username>\scoop\apps\rpcs3\current\PS3UPDAT.PUP
```

Then add your ROMs:

```
emulators\rpcs3\roms\
```

Open RPCS3, go to `Add Game` and point to that folder.

### PCSX2 (PS2)

PCSX2 requires a BIOS dumped from your own PS2 console. This is a one-time manual process:

1. Get a **FreeMcBoot** memory card (available online for ~$15)
2. Download [biosdrain](https://github.com/f0bes/biosdrain/releases/latest/download/biosdrain.elf) and copy it to a FAT32 formatted USB drive
3. Insert the FreeMcBoot memory card and the USB drive into your PS2
4. Run `biosdrain.elf` via uLaunchELF
5. When it says "Finished Everything", plug the USB drive back into your PC
6. Copy the dumped BIOS files into:

```
emulators\pcsx2\bios\
```

The setup script will automatically copy them to the correct PCSX2 folder. The BIOS files are git ignored and will never be committed.

Then add your ROMs:

```
emulators\pcsx2\roms\
```

---

## Daily Usage

After setup is done, use `just` to manage everything:

```powershell
just            # list all available commands
just setup      # install emulators (choose which ones)
just update     # update all emulators
just sync       # save current configs to repo
just uninstall  # uninstall emulators (choose which ones, saves are backed up)
just unblock    # unblock all scripts after git clone or git pull
```

---

## Project Structure

```
tun-emu-setup/
├── justfile               # commands entrypoint
├── setup.ps1              # installs everything
├── update.ps1             # updates all emulators
├── sync-configs.ps1       # saves configs from emulator to repo
├── uninstall.ps1          # uninstalls everything and backs up saves
└── emulators/
    ├── rpcs3/
    │   ├── install.ps1    # RPCS3 specific install script
    │   ├── uninstall.ps1  # RPCS3 specific uninstall script
    │   ├── configs/       # versioned RPCS3 configs
    │   └── roms/          # put your ROMs here (git ignored)
    └── pcsx2/
        ├── install.ps1    # PCSX2 specific install script
        ├── uninstall.ps1  # PCSX2 specific uninstall script
        ├── configs/       # versioned PCSX2 configs
        ├── bios/          # put your BIOS files here (git ignored)
        └── roms/          # put your ROMs here (git ignored)
```

---

## Important Notes

- **ROMs** are git ignored and will never be committed
- **BIOS files** are git ignored and will never be committed
- **Saves** are backed up before uninstall (also git ignored)
- **PS3 firmware** is downloaded automatically but needs to be installed manually inside RPCS3 once
- **PS2 BIOS** must be dumped manually from your own console once and placed in `emulators\pcsx2\bios\`
- After a `git pull` with new scripts, run `just unblock` again