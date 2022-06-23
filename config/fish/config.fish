if status is-interactive
    # Commands to run in interactive sessions can go here
end

# vi key bindings
fish_vi_key_bindings

# set fish_greeting
function fish_greeting
    echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end

function fish_greeting
    fish_logo red brred yellow
end

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
alias filesopen "sudo lsof -n | cut -f1 -d  | uniq -c | sort | tail"
alias chrome "open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir /tmp/chrome_dev_test --disable-web-security --no-sandbox && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /tmp/chrome_dev_test/NativeMessagingHosts/"
alias secretsrc "vim ~/.env"
alias c "clear"
alias todo "vim ~/Documents/todo.md"
alias notes "vim ~/Documents/notes.md"
alias unirc "vim ~/.unison/default.prf"
alias uni-sync "~/.uni-sync.sh"
alias cht "~/.cht.sh"
alias chg_kitty_bg "~/.config/kitty/background_changer.sh"

# tmux
alias t "tmux"
alias tls "tmux ls"
alias ta "tmux a -t"
alias tk "tmux kill-session -t"
alias tka "tmux kill-server"
alias tx "tmuxinator"
alias txl "tx list"

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

# fnm
set -gx PATH $HOME/.fnm $PATH
fnm env --use-on-cd | source

# Source secrets from .env
set -gx SECRETS $HOME/.env
source $SECRETS

# peco
function fish_user_key_bindings
    bind \cr 'peco_select_history (commandline -b)'
end

function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=top-down --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

# if set -q KITTY_INSTALLATION_DIR
#     set --global KITTY_SHELL_INTEGRATION enabled
#     source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
#     set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
# end

starship init fish | source

