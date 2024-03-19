if status is-interactive
    # Commands to run in interactive sessions can go here
end

# vi key bindings
fish_vi_key_bindings default
function fish_user_key_bindings
    bind yy fish_clipboard_copy
    bind Y fish_clipboard_copy
    bind p fish_clipboard_paste
end

set fish_greeting

ulimit -n 10240
set -g fish_term24bit 1

switch (uname)
    case Linux
		set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
		set -gx PATH ~/bin $PATH
		set -gx PATH ~/.local/bin $PATH
    case Darwin
		set -gx PATH bin $PATH
		set -gx PATH ~/bin $PATH
		set -gx PATH ~/.local/bin $PATH
		set -gx PATH /opt/homebrew/bin $PATH
    case FreeBSD NetBSD DragonFly
            echo "This is FreeBSD or similar system!"
    case '*'
            echo "This is an unknown system!"
end

# mise
~/.local/bin/mise activate fish | source

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
alias tmuxrc "vim ~/.tmux.conf"
alias fishrc "vim ~/.config/fish/config.fish"
alias starrc "vim ~/.config/starship/starship.toml"
alias sshrc "vim ~/.ssh/config"
alias vimrc "vim ~/.config/vim/.vimrc"
alias nvimrc "cd ~/development/dotfiles/nvim && vim ~/.config/nvim/lua/custom"
alias alarc "vim ~/.config/alacritty/alacritty.yml"
alias yabairc "vim ~/.config/yabai/yabairc"
alias skhdrc "vim ~/.config/skhd/skhdrc"
alias filesopen "sudo lsof -n | cut -f1 -d | uniq -c | sort | tail"
alias chrome "open -n -a /Applications/Vivaldi.app/Contents/MacOS/Vivaldi --args --user-data-dir='/Users/butryan/temporary-vivalid-profile-dir' --disable-web-security --ignore-certificate-errors && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /Users/butryan/temporary-chrome-profile-dir"
alias secretsrc "vim ~/.env"
alias cht "~/.cht.sh"
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
alias ta "tmux a"
alias td "tmux detach"
alias tk "tmux kill-session -t"
alias tka "tmux kill-server"
alias tx "tmuxinator"
alias txl "tx list"
alias txs "tx start"
alias txe "tx edit"
alias txn "tx new"
alias ts "tmux-sessionizer"

# Docker
alias dls "docker container ls -a"
alias dsm "docker start dev_machine"
alias dam "dsm && docker attach dev_machine"
alias dpm "docker pause dev_machine"
alias drm "docker run -ti --name dev_machine \
				-v $HOME/development:/root/development dev_machine"
alias dbm "docker build -t dev_machine ~/development/dev_machine"
alias ddm "docker container rm dev_machine --force"

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

# AWS CLI
set -gx AWS_PAGER

# Rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# Golang
# set -x PATH $PATH $GOPATH/bin
# set -x GOPATH $HOME/go
# . ~/.asdf/plugins/golang/set-env.fish

# Pipx
set -gx PATH $HOME/.local/bin $PATH
set -gx PIPX_DEFAULT_PYTHON $HOME/.local/share/mise/installs/python/latest/bin/python

# fzf
# nav with tab
set -Ux FZF_DEFAULT_OPTS "--bind=shift-tab:down,tab:up"

# catppuccin-mocha
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:-1,bg:-1,spinner:#f5e0dc,hl:#f38ba8,gutter:-1 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Source secrets from .env
set -gx SECRETS $HOME/.env
source $SECRETS

# zoxide
zoxide init fish | source

# starship
starship init fish | source
