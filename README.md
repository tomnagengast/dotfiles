# Nix

Based on:
- https://davi.sh/til/nix/nix-macos-setup
- https://github.com/thexyno/nixos-config


## `nix-darwin`

https://github.com/LnL7/nix-darwin

Install nix-darwin:
```sh
nix run nix-darwin -- switch --flake ~/dotfiles/nix
```

Use nix-darwin:
```sh
darwin-rebuild switch --flake ~/dotfiles/nix
```
