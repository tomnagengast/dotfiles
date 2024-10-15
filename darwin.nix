{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gh
  ];
  
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.tomnagengast = {
    name = "tomnagengast";
    home = "/Users/tomnagengast";
  };
}
