{
  description = ''
    For questions just DM me on X: https://twitter.com/@gzapf
    There is also some NIXOS content on my YT channel: https://www.youtube.com/@gzapf

    One of the best ways to learn NIXOS is to read other peoples configurations. I have personally learned a lot from Gabriel Fontes configs:
    https://github.com/Misterio77/nix-starter-configs
    https://github.com/Misterio77/nix-config

    Please also check out the starter configs mentioned above.
  '';

  inputs =
    {
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      nixpkgs =
        {
          url = "github:nixos/nixpkgs/nixos-unstable";
        };

      nixpkgs-stable = {
        url = "github:nixos/nixpkgs/nixos-24.11";
      };

      disko = {
        url = "github:nix-community/disko";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      dotfiles = {
        url = "git+https://github.com/Zapfmeister/nixdotfiles.git";
        flake = false;
      };

      agenix = {
        url = "github:ryantm/agenix";
      };
    };

  outputs =
    { self
    , agenix
    , dotfiles
    , disko
    , home-manager
    , nixpkgs
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages =
        forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        proxvm = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/proxvm
            inputs.disko.nixosModules.disko
            # agenix.nixosModules.default
          ];
        };
        x280 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/x280
            inputs.disko.nixosModules.disko
            #: agenix.nixosModules.default
          ];
        };
        x13vm = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/x13vm
            # inputs.disko.nixosModules.disko
            #: agenix.nixosModules.default
          ];
        };

      };
      homeConfigurations = {
        "gzapf@proxvm" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/gzapf/proxvm.nix ];
        };
        "gzapf@x280" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/gzapf/x280.nix ];
        };
        "gzapf@x13vm" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/gzapf/x13vm.nix ];
        };

      };
    };
}
