if status is-interactive
    #
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
        fish_add_path ~/bin
        fish_add_path ~/.local/bin
        fish_add_path /home/linuxbrew/.linuxbrew/bin
        fish_add_path /home/linuxbrew/.linuxbrew/sbin
    case Darwin
        fish_add_path ~/bin
        fish_add_path ~/.local/bin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
    case FreeBSD NetBSD DragonFly
        echo "This is FreeBSD or similar system!"
    case '*'
        echo "This is an unknown system!"
end

# Autossh
function random_unused_port
    # Use nc (netcat) instead of netstat for faster checking
    for port in (shuf -i 60000-65000 -n 5)
        if not nc -z localhost $port 2>/dev/null
            set -gx AUTOSSH_PORT $port
            return 0
        end
    end
end

function ssh
    random_unused_port
    # set -x AUTOSSH_GATETIME 30
    # set -x AUTOSSH_POLL 30
    # autossh -M $AUTOSSH_PORT -4 $argv
    autossh -4 $argv
    echo 'disconnected...'
end

# aliases
set -gx EDITOR vim
alias c clear
alias v nvim
alias vi nvim
alias vim nvim
alias t tmux
alias sf "source ~/.config/fish/config.fish"
alias dotfiles="cd ~/development/dotfiles && vim"
alias tmuxrc "vim ~/development/dotfiles/tmux/tmux.conf"
alias fishrc "vim ~/development/dotfiles/fish/config.fish"
alias starrc "vim ~/development/dotfiles/starship/starship.toml"
alias sshrc "vim ~/.ssh/config"
alias vimrc "vim ~/development/dotfiles/vim/.vimrc"
alias nvimrc "cd ~/development/dotfiles/lazynvim && vim ~/development/dotfiles/lazynvim"
alias alarc "vim ~/development/dotfiles/alacritty/alacritty.toml"
alias ghostrc "vim ~/development/dotfiles/ghostty/config"
alias aerorc "vim ~/development/dotfiles/aerospace/aerospace.toml"
alias filesopen "sudo lsof -n | cut -f1 -d | uniq -c | sort | tail"
# alias chrome "open -n --new -a /Applications/Vivaldi-Dev.app/Contents/MacOS/Vivaldi --args --window-name='Vivaldi-Dev' --user-data-dir='/Users/butryan/temporary-vivalid-profile-dir' --disable-web-security --ignore-certificate-errors && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /Users/butryan/temporary-chrome-profile-dir"
alias chrome "open -n --new -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir='/Users/butryan/temporary-chrome-profile-dir' --disable-web-security --ignore-certificate-errors && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /Users/butryan/temporary-chrome-profile-dir"
alias secretsrc "vim ~/.env"
alias av "source .venv/bin/activate.fish"
alias dv deactivate
alias z cd

function giphy
    ffmpeg -i $argv[1] -filter_complex "[0:v] fps=12,scale=w=-1:h=-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" $argv[2]
end

# better cd
alias .. "cd .."
alias .... "cd ../.."
alias ...... "cd ../../.."

# tmux
alias t tmux
alias tls "tmux ls"
alias ta "tmux a"
alias td "tmux detach"
alias tk "tmux kill-session -t"
alias tka "tmux kill-server"
alias tx tmuxinator
alias txl "tx list"
alias txs "tx start"
alias txe "tx edit"
alias txn "tx new"
alias ts tmux-sessionizer

# Docker
alias dls "docker container ls -a"
alias dsm "docker start dev_machine"
alias dam "dsm && docker attach dev_machine"
alias dpm "docker pause dev_machine"
alias drm "docker run -ti --name dev_machine \
				-v $HOME/development:/root/development dev_machine"
alias dbm "docker build -t dev_machine ~/development/dev_machine"
alias ddm "docker container rm dev_machine --force"

# eza
if type -q eza
    alias ll "eza -l -g --icons"
    alias ls "eza --icons"
    alias lla "ll -a"
    alias tree "eza --tree --level 2 --icons --long --all --ignore-glob '.git|node_modules|*.pyc|__pycache__/.DS_Store'"
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
alias gpr "git pull --rebase"

# ipython
alias ipython "ipython --TerminalInteractiveShell.editing_mode='vi'"

# AWS CLI
set -gx AWS_PAGER

# mise
~/.local/bin/mise activate fish | source

# Rust
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths

# fzf
set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore-vcs --hidden'

## nav with tab
set -gx FZF_DEFAULT_OPTS '--bind=shift-tab:down,tab:up'

## fzf ripgrep magic
function fw
    rg --color=always --line-number --no-heading --smart-case $argv[1] | fzf --ansi \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(nvim {1} +{2})'
end

function ff
    fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim
end

# fzf theme
source $HOME/.config/fish/fzf.fish

# Source secrets from .env
set -gx SECRETS $HOME/.env
source $SECRETS

# Ghostty
if test "$TERM_PROGRAM" = ghostty
    set -gx TERM xterm-256color
end

# zoxide
zoxide init --cmd cd fish | source

# starship
starship init fish | source
