{ config, ... }: {
  imports = [
    ../common
    ../features/cli
    ../features/desktop
    ./home.nix
  ];

  features = {
    desktop =
      {
        wayland.enable = true;
        hyprland.enable = true;
      };
    cli = {
      fish.enable = true;
      fzf.enable = true;
      neofetch.enable = true;
    };
  };
}
