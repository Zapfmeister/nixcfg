# NixOS Config

## Commands

### Rebuild a remote system via SSH

```zsh
nixos-rebuild switch --flake .#proxvm --target-host proxvm --use-remote-sudo
```

## Run nativ install

In the terminal of the graphical installer:

```zsh
delete existing disk config if required
git clone repo
cd into repo
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/hostname/disko-config.nix
sudo nixos-install --flake .#hostname
```

## Variables

home.packages -> User specific packages

## Folders

Home --> Includes User and system specific settings
Hosts --> Includes Host specific settings
Overlays --> Modifications of existing apps
pkgs --> Own Packages?

## Update dotfiles

```zsh
nix flake lock --update-input dotfiles
```

## To dos

1. Update waybar
2. Update keybinds
3. Fix errors in neovim and figure out the keybinds
