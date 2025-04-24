# NixOS Config

## Commands

### Rebuild a remote system via SSH

```zsh
nixos-rebuild switch --flake .#proxvm --target-host proxvm --use-remote-sudo
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
