{ config, ... }: {
  imports = [
    ../common
    ../features/cli
    ./home.nix
  ];

  features = {
    desktop = {
      wayland.enable = true;
    };
    cli = {
      fish.enable = true;
      fzf.enable = true;
      neofetch.enable = true;
    };
  };
}
