{ config
, pkgs
, inputs
, ...
}: {
  users.users.gzapf = {
    initialHashedPassword = "$y$j9T$z.ycQgeCvym3DeHtTJmne0$KiXgtiKRoMvNqtmIHXLgEzpxA98u5PgARe3sw27sbX7";
    isNormalUser = true;
    description = "Gerard Zapf";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFatzRUQRrEQ2MRPhhHNNEBbK4zWlwK4LL9SqvwXiJRu gzapf@proxvm"
    ];
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };
  home-manager.users.gzapf =
    import ../../../home/gzapf/${config.networking.hostName}.nix;

  # gzapf doesnt need a pw for sudo
  security.sudo.enable = true;

  security.sudo.extraConfig = ''
    gzapf ALL=(ALL) NOPASSWD: ALL
  '';
} 
