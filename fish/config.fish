if status is-interactive
    # Commands to run in interactive sessions can go here
end

# theme
# theme_gruvbox dark hard
# set -g theme_color_scheme terminal-dark
# set -g fish_prompt_pwd_dir_length 1
# set -g theme_display_user yes
# set -g theme_hide_hostname no
# set -g theme_hostname always

# vi key bindings
fish_vi_key_bindings default
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
# set -g theme_color_scheme terminal-dark
# set -g fish_prompt_pwd_dir_length 1
# set -g theme_display_user no
# set -g theme_hide_hostname yes
# set -g theme_hostname no

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH

# Rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# Golang
# set -x PATH $PATH $GOPATH/bin
# set -x GOPATH $HOME/go
. ~/.asdf/plugins/golang/set-env.fish

# Autossh
function random_unused_port
    set port $(shuf -i 2000-65000 -n 1)
    netstat -lat | grep $port > /dev/null
    if [ $status = 1 ];
        set -gx AUTOSSH_PORT $port
    else
        random_unused_port
	end
end
function ssh
	random_unused_port
	autossh $argv
end

# aliases
set -gx EDITOR nvim
alias c "clear"
alias v "nvim"
alias vi "nvim"
alias vim "nvim"
alias t "tmux"
alias sf "source ~/.config/fish/config.fish"
alias dotfiles="cd ~/development/dotfiles && vim"
alias tmuxrc "vim ~/development/dotfiles/tmux/tmux.conf"
alias zshrc "vim ~/development/dotfiles/zsh/zshrc"
alias fishrc "vim ~/development/dotfiles/fish/config.fish"
alias starrc "vim ~/development/dotfiles/starship/starship.toml"
alias sshrc "vim ~/.ssh/config"
alias vimrc "vim ~/development/dotfiles/vim/.vimrc"
alias nvimrc "vim ~/development/dotfiles/nvim/init.lua"
alias kittyrc "vim ~/development/dotfiles/kitty/kitty.conf"
alias alarc "vim ~/development/dotfiles/alacritty/alacritty.yml"
alias yabairc "vim ~/development/dotfiles/yabai/yabairc"
alias skhdrc "vim ~/development/dotfiles/skhd/skhdrc"
alias filesopen "sudo lsof -n | cut -f1 -d | uniq -c | sort | tail"
alias chrome "open -n -a /Applications/Vivaldi.app/Contents/MacOS/Vivaldi --args --user-data-dir='/Users/butryan/temporary-vivalid-profile-dir' --disable-web-security --ignore-certificate-errors && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /Users/butryan/temporary-chrome-profile-dir"
alias secretsrc "vim ~/.env"
alias todo "vim ~/Documents/todo.md"
alias notes "vim ~/Documents/notes.md"
alias unirc "vim ~/.unison/default.prf"
alias uni-sync "~/.uni-sync.sh"
alias cht "~/.cht.sh"
alias chg_kitty_bg "~/.config/kitty/background_changer.sh"
alias av "source .venv/bin/activate.fish"
alias dv "deactivate"
alias cat "bat"

# better cd
alias .. "cd .."
alias .... "cd ../.."
alias ...... "cd ../../.."

# tmux
alias t "tmux"
alias tls "tmux ls"
alias ta "tmux a -t"
alias td "tmux detach"
alias tk "tmux kill-session -t"
alias tka "tmux kill-server"
alias tx "tmuxinator"
alias txl "tx list"
alias txs "tx start"
alias txe "tx edit"
alias txn "tx new"
alias ts "tmux-sessionizer"

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
alias gc "git commit"
alias gco "git checkout"
alias gp "git push"
alias gw "git clone --bare"
alias gf "git fetch --all"

# ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# AWS CLI
set -gx AWS_PAGER

# Pipx
set -gx PATH $HOME/.local/bin $PATH
set -gx PIPX_DEFAULT_PYTHON $HOME/.asdf/shims/python

# fzf
# nav with tab
set FZF_DEFAULT_OPTS "--bind=shift-tab:down,tab:up"

# rose-pine
# set -Ux FZF_DEFAULT_OPTS "\
# 	--color=fg:#908caa,bg:#191724,hl:#ebbcba \
# 	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba \
# 	--color=border:#403d52,header:#31748f,gutter:#191724 \
# 	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52 \
# 	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# catppuccin-mocha
# set -Ux FZF_DEFAULT_OPTS "\
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# catppuccin-frappe
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# Source secrets from .env
set -gx SECRETS $HOME/.env
source $SECRETS

# zoxide
zoxide init fish | source

# starship
starship init fish | source
