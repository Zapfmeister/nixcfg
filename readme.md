# NixOS Config

## Commands

### Rebuild a remote system via SSH

```zsh
nixos-rebuild switch --flake .#proxvm --target-host proxvm --use-remote-sudo
```

## Variables

home.packages -> User specific packages
