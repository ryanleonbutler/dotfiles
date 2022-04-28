set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user no
set -g theme_hide_hostname yes 
set -g theme_hostname no

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# aliases
set -gx EDITOR lvim
alias vim "vim"
alias v "vim"
alias vi "vim"
alias sz "source /usr/local/bin/fish"
alias zshrc "vim $HOME/.local/share/chezmoi/dot_zshrc"
alias starrc "vim $HOME/.local/share/chezmoi/dot_config/starship.toml"
alias sshrc "vim ~/.ssh/config"
alias vimrc "vim $HOME/.local/share/chezmoi/dot_config/lvim/config.lua"
alias kittyrc "vim $HOME/.local/share/chezmoi/dot_config/kitty/kitty.conf"
alias filesopen "sudo lsof -n | cut -f1 -d  | uniq -c | sort | tail"
alias chrome "open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir /tmp/chrome_dev_test --disable-web-security --no-sandbox && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /tmp/chrome_dev_test/NativeMessagingHosts/"
alias secretsrc "vim ~/.env"

# exa
if type -q exa
  alias ll "exa -l -g --icons"
  alias ls "exa --icons"
  alias lla "ll -a"
end

# Git
alias gs "git status"
alias ga "git add -A"
alias gl "git log"
alias gd "git diff"
alias gcm "git commit -m"
alias gma "git commit -am"
alias gb "git branch"
alias gc "git checkout"

# AWS CLI
set -gx AWS_PAGER 

# Pipx
set -gx PATH $HOME/.local/bin $PATH
set -gx PIPX_DEFAULT_PYTHON $HOME/.pyenv/shims/python

# Pyenv details
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx PATH /usr/local/opt/bzip2/bin $PATH
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# fnm
set -gx PATH $HOME/.fnm $PATH
#eval $(fnm env --use-on-cd)

# Source secrets from .env
set -gx SECRETS $HOME/.env
source $SECRETS

starship init fish | source
