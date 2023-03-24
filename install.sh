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

# tmuxanitor
rm -rf ~/.config/tmuxinator
ln -s ~/development/dotfiles/tmuxinator ~/.config/tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.fish ~/.config/fish/completions/

# kitty
rm -rf ~/.config/kitty
ln -s ~/development/dotfiles/kitty ~/.config/kitty

# kitty
rm -rf ~/.config/alacritty
ln -s ~/development/dotfiles/alacritty ~/.config/alacritty

# nvim
rm -rf ~/.config/nvim
ln -s ~/development/dotfiles/nvim ~/.config/nvim

# ranger
rm -rf ~/.config/ranger
ln -s ~/development/dotfiles/ranger ~/.config/ranger

# cht.sh
rm -rf ~/.cht.sh ~/.tmux-cht-command ~/.tmux-cht-languages
ln -s ~/development/dotfiles/cht.sh/cht.sh ~/.cht.sh
ln -s ~/development/dotfiles/cht.sh/tmux-cht-command ~/.tmux-cht-command
ln -s ~/development/dotfiles/cht.sh/tmux-cht-languages ~/.tmux-cht-languages

# unison
rm -rf ~/.unison/default.prf 
ln -s ~/development/dotfiles/unison/default.prf ~/.unison/default.prf

# bin
cp -R ~/development/dotfiles/bin/* ~/bin
