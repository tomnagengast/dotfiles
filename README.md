# Dotfiles

This repository is based on:
- [driesvints/dotfiles](https://github.com/driesvints/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)

## A Fresh macOS Setup

1. Update macOS to the latest version with the App Store
1. Install Xcode from the App Store, open it and accept the license agreement
1. Install macOS Command Line Tools by running xcode-select --install
1. Generate a new public and private SSH key and add them to Github
1. Clone this repo to ~/.dotfiles
1. Install Oh My Zsh
1. Run fresh.sh to start the installation
1. After mackup is synced with your cloud storage, restore preferences by running mackup restore
1. Restart your computer to finalize the process
1. Your Mac is now ready to use!

> Note: you can use a different location than ~/.dotfiles if you want. Just make sure you also update the reference in the .zshrc file.