{ pkgs, ... }: {
  environment.systemPackages = [];
  
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.tomnagengast = {
    name = "tomnagengast";
    home = "/Users/tomnagengast";
  };
}
