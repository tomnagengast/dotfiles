# flake.nix skeleton:
{
  description = "Darwin configuration";

  inputs = {
    # base imports
    utils.url = "github:numtide/flake-utils";

    ## nixos/nix-darwin dependencies
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs @ { 
      self, 
      nixpkgs, 
      # nixpkgs-darwin, 
      home-manager, 
      darwin, 
      nix-homebrew, 
      utils, 
      ...
    }: {
    darwinConfigurations.tomnagengast = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tomnagengast = import ./home.nix;
          # Use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
      ];
    };
  };
}
