{
  description = "Nix dotfiles configuration";

  inputs = {
    # base imports
    utils.url = "github:numtide/flake-utils";

    ## nixos/nix-darwin dependencies
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    alejandra.url = "github:kamadorueda/alejandra";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    utils,
    nixpkgs,
    home-manager,
    darwin,
    alejandra,
    ...
  }: let
    username = "tomnagengast";
  in {
    darwinConfigurations.${username} = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit (self) overlays;
            inherit inputs alejandra;
          };
        }
        ./darwin.nix
        {
          nixpkgs.config.allowUnfree = true;
        }
      ];
      specialArgs = {inherit inputs;};
    };
  };
}
