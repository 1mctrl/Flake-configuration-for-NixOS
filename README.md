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
