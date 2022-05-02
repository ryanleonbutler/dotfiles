# dotfiles

```
# get the dotfiles
mkdir -p ~/development && cd ~/development
git clone git@github.com:ryanleonbutler/dotfiles

# fish
rm -rf ~/.config/fish/config.fish
ln -s ~/development/dotfiles/config/fish/config.fish ~/.config/fish/config.fish

# starship
rm -rf ~/.config/starship.toml
ln -s ~/development/dotfiles/config/starship.toml ~/.config/starship.toml

# tmux
rm -rf ~/.tmux.conf
ln -s ~/development/dotfiles/tmux.conf ~/.tmux.conf

# kitty
rm -rf ~/.config/kitty
ln -s ~/development/dotfiles/config/kitty ~/.config/kitty

# yabai & spacebar & skhd
rm -rf ~/.skhdrc
rm -rf ~/.yabairc
rm -rf ~/.config/spacebar
ln -s ~/development/dotfiles/yabairc ~/.yabairc
ln -s ~/development/dotfiles/skhdrc ~/.skhdrc
ln -s ~/development/dotfiles/config/spacebar ~/.config/spacebar

# lvim
rm -rf ~/.config/lvim/config.lua
ln -s ~/development/dotfiles/config/lvim/config.lua ~/.config/lvim/config.lua

# vscode
rm -rf /Users/butryan/Library/Application\ Support/Code/User/settings.json
rm -rf /Users/butryan/Library/Application\ Support/Code/User/keybindings.json
rm -rf /Users/butryan/Library/Application\ Support/Code/User/snippets
ln -s ~/development/dotfiles/vscode/settings.json /Users/butryan/Library/Application\ Support/Code/User/settings.json 
ln -s ~/development/dotfiles/vscode/keybindings.json /Users/butryan/Library/Application\ Support/Code/User/keybindings.json 
ln -s ~/development/dotfiles/vscode/snippets /Users/butryan/Library/Application\ Support/Code/User/snippets

# ranger
rm -rf ~/.config/ranger
ln -s ~/development/dotfiles/config/ranger ~/.config/ranger

```
