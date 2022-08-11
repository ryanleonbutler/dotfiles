#! /bin/bash

# setup
mkdir -p ~/.config
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim

# fish
rm -rf ~/.config/fish/config.fish
ln -s ~/development/dotfiles/fish/config.fish ~/.config/fish/config.fish

# starship
rm -rf ~/.config/starship.toml
ln -s ~/development/dotfiles/starship/starship.toml ~/.config/starship.toml

# tmux
rm -rf ~/.tmux.conf
rm -rf ~/.tmux-tokyonight.conf
rm -rf ~/.tmux-gruvbox-dark.conf
ln -s ~/development/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/development/dotfiles/tmux/tmux-tokyonight.conf ~/.tmux-tokyonight.conf
ln -s ~/development/dotfiles/tmux/tmux-gruvbox-dark.conf ~/.tmux-gruvbox-dark.conf

# kitty
rm -rf ~/.config/kitty
ln -s ~/development/dotfiles/kitty/kitty ~/.config/kitty

# nvim
rm -rf ~/.config/nvim
ln -s ~/development/dotfiles/nvim ~/.config/nvim

# ranger
rm -rf ~/.config/ranger
ln -s ~/development/dotfiles/ranger ~/.config/ranger
