{ config, ... }: {
  imports = [
    ../common
    ../features/cli
    ./home.nix
  ];

  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
      neofetch.enable = true;
    };
  };
}
