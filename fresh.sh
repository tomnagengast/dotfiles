#!/bin/sh

echo "Setting up your Mac..."

# Fix zsh permissions (https://github.com/ohmyzsh/ohmyzsh/issues/6835)
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install Pure iTerm theme
npm install --global pure-prompt

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet

# Install Pure iTerm theme (https://github.com/sindresorhus/pure)
/usr/local/bin/npm install --global pure-prompt

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites
mkdir $HOME/Work

# Clone Github repositories
./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink the .gitconfig file to the home directory
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos

# Copy for SanFranciso font
cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*.otf ~/Library/Fonts

# Install Things Helper for todo autofill
# open /Applications/ThingsMacSandboxHelper.app