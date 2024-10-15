{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # gh
  ];
  
  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];
  services.nix-daemon.enable = true;
  nix.settings.cores = 0; # use all cores
  nix.settings.max-jobs = 10; # use all cores

  nix.settings.experimental-features = "nix-command flakes";
  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 5;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.tomnagengast = {
    name = "tomnagengast";
    home = "/Users/tomnagengast";
  };
}
