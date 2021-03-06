if status is-interactive
    # Commands to run in interactive sessions can go here
end

# vi key bindings
function fish_user_key_bindings
  bind yy fish_clipboard_copy
  bind Y fish_clipboard_copy
  bind p fish_clipboard_paste
end

set fish_greeting
# function fish_greeting
#     echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
# end

# function fish_greeting 
#    fish_logo red brred yellow 
# end 

ulimit -n 10240 
set -g fish_term24bit 1

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
set -gx EDITOR nvim
alias v "nvim"
alias vi "nvim"
alias vim "nvim"
alias t "tmux"
alias sf "source ~/.config/fish/config.fish"
alias tmuxrc "vim ~/development/dotfiles/tmux.conf"
alias zshrc "vim ~/development/dotfiles/zshrc"
alias fishrc "vim ~/development/dotfiles/config/fish/config.fish"
alias starrc "vim ~/development/dotfiles/config/starship.toml"
alias sshrc "vim ~/.ssh/config"
alias vimrc "vim ~/development/dotfiles/config/nvim"
alias kittyrc "vim ~/development/dotfiles/config/kitty/kitty.conf"
alias yabairc "vim ~/development/dotfiles/yabairc"
alias skhdrc "vim ~/development/dotfiles/skhdrc"
alias spacebarrc "vim ~/development/dotfiles/config/spacebar/spacebarrc"
alias filesopen "sudo lsof -n | cut -f1 -d | uniq -c | sort | tail"
alias chrome "open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir /tmp/chrome_dev_test --disable-web-security --no-sandbox && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /tmp/chrome_dev_test/NativeMessagingHosts/"
alias secretsrc "vim ~/.env"
alias c "clear"
alias todo "vim ~/Documents/todo.md"
alias notes "vim ~/Documents/notes.md"
alias unirc "vim ~/.unison/default.prf"
alias uni-sync "~/.uni-sync.sh"
alias cht "~/.cht.sh"
alias chg_kitty_bg "~/.config/kitty/background_changer.sh"
alias av "source .venv/bin/activate.fish"
alias dv "deactivate"

# tmux
alias t "tmux"
alias tls "tmux ls"
alias ta "tmux a -t"
alias tk "tmux kill-session -t"
alias tka "tmux kill-server"
alias tx "tmuxinator"
alias txl "tx list"
alias txwork "tx start unisync && tx start notes && tx start dotfiles && tx start playground"

# exa
if type -q exa
  alias ll "exa -l -g --icons"
  alias ls "exa --icons"
  alias lla "ll -a"
  alias tree "exa --tree --level 2 --icons --long --all --ignore-glob '.git|node_modules|*.pyc|__pycache__/.DS_Store'"
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
alias gp "git push"
alias gw "git clone --bare"
alias gf "git fetch --all"

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

# fzf
set FZF_DEFAULT_OPTS '--color=fg:#c5cdd9,bg:#262729,hl:#6cb6eb 
--color=fg+:#c5cdd9,bg+:#262729,hl+:#5dbbc1 
--color=info:#88909f,prompt:#ec7279,pointer:#d38aea 
--color=marker:#a0c980,spinner:#ec7279,header:#5dbbc1'

# Source secrets from .env
set -gx SECRETS $HOME/.env
source $SECRETS

# Fish
starship init fish | source
