{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Older nixpkgs, used ONLY for mozc / fcitx5-mozc
    nixpkgs-mozc.url = "github:nixos/nixpkgs/nixos-26.05";  # or a specific commit, see below

   moonshine.url = "path:./moonshine";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.home-manager.follows = "home-manager";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    niri = {
#      url = "github:sodiboo/niri-flake";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.mebousnix = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        inputs.nixvim.nixosModules.nixvim
        inputs.home-manager.nixosModules.home-manager
#       inputs.nur.nixosModules.nur
        inputs.nur.modules.nixos.default
#       inputs.plasma-manager.homeManagerModules.plasma-manager
#       inputs.nix-flatpak.homeManagerModules.nix-flatpak
        inputs.nix-flatpak.nixosModules.nix-flatpak
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Take mozc and fcitx5-mozc from the older nixpkgs
          nixpkgs.overlays = [
            (final: prev:
              let
                oldPkgs = inputs.nixpkgs-mozc.legacyPackages.${prev.stdenv.hostPlatform.system};
              in {
                mozc = oldPkgs.mozc;
                fcitx5-mozc = oldPkgs.fcitx5-mozc;
              })
          ];
        }
      ];
    };
  };
}
