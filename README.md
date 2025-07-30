# flake_nix

Alternative personal configuration of my NixOS system using Nix Flakes.

## Repository Structure

```
.
├── flake.nix             # Entry point for the Nix Flake
├── flake.lock            # Lock file with pinned dependencies
├── crypto_keyfile.bin    # Encrypted keyfile (likely for LUKS or secrets)
├── home/                 # Home-manager configurations
├── hosts/                # Host-specific system definitions
├── modules/              # Reusable NixOS modules
├── users/                # User-specific configurations
```
![-5210914315513755358_121](https://github.com/user-attachments/assets/748db0a0-be8f-4747-afc6-83f760e0b794)

![-5210914315513755359_121](https://github.com/user-attachments/assets/00f3c53a-e9da-4b27-800c-2cde54b1b74e)

## Features

- Modular NixOS configuration
- Home Manager integration
- Host-based system definitions
- User-specific setups
- Encrypted keyfile support

## Usage

```bash
nix develop
nixos-rebuild switch --flake .#hostname
```

Replace `hostname` with the name of your defined system in the `hosts/` directory.

## License

This project is for personal use. No explicit license is attached.
