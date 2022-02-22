#!/bin/sh

echo "Setting up your Mac..."

# Fix zsh permissions (https://github.com/ohmyzsh/ohmyzsh/issues/6835)
# chmod 755 /usr/local/share/zsh
# chmod 755 /usr/local/share/zsh/site-functions

# M1
# chmod 755 /opt/homebrew/share/zsh
# chmod 755 /opt/homebrew/share/zsh/site-functions


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# https://stackoverflow.com/questions/36657321/after-installing-homebrew-i-get-zsh-command-not-found-brew
export PATH=/opt/homebrew/bin:$PATH

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Download the Simba Spark ODBC (https://pages.databricks.com/ODBC-Driver-Download.html)
# https://databricks.com/wp-content/uploads/drivers-2020/SimbaSparkODBC-2.6.16.1019-OSX.zip

# Install Pure iTerm theme
npm install --global pure-prompt # /usr/local/bin/npm

# Install global Composer packages
# /usr/local/bin/composer global require laravel/installer laravel/valet

# Install Laravel Valet
# $HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
# mkdir $HOME/Sites
mkdir $HOME/Developer

# Clone Github repositories
./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
# ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink the .gitconfig file to the home directory
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Copy for SanFranciso font
cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*.otf ~/Library/Fonts

# Install Things Helper for todo autofill
# open /Applications/ThingsMacSandboxHelper.app

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
