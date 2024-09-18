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

function fish_greeting
    echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')    '(set_color red)(whoami)'@'(hostname)'
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')'(set_color yellow)'    Uptime: '(set_color white)(uptime | sed 's/.*up \([^,]*\), .*/\1/')(set_color red)'
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')    '(set_color yellow)'Version: '(set_color white)(echo $FISH_VERSION)(set_color red)'
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)
   \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
  (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                      (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                       (UU)'(set_color normal)
end

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
alias fishrc "vim ~/development/dotfiles/fish/config.fish"
alias starrc "vim ~/development/dotfiles/starship/starship.toml"
alias sshrc "vim ~/.sshdevelopment/dotfiles"
alias vimrc "vim ~/development/dotfiles/vim/.vimrc"
alias nvimrc "cd ~/development/dotfiles/nvim && vim ~/development/dotfiles/nvim/lua/custom"
alias filesopen "sudo lsof -n | cut -f1 -d | uniq -c | sort | tail"
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

# Golang
set -gx GOPROXY "direct"

# Pipx
set -gx PATH $HOME/.local/bin $PATH
set -gx PIPX_DEFAULT_PYTHON $HOME/.asdf/shims/python

# fzf
export FZF_DEFAULT_COMMAND='rg --files --ignore-vcs --hidden'

# nav with tab
set -Ux FZF_DEFAULT_OPTS "--bind=shift-tab:down,tab:up"

# fzf ripgrep magic
function fw
    rg --color=always --line-number --no-heading --smart-case $argv[1] | \
    fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(nvim {1} +{2})'
end

function ff
    fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim
end

# catppuccin-mocha
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:-1,bg:-1,spinner:#f5e0dc,hl:#f38ba8,gutter:-1 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# zoxide
zoxide init fish | source

# starship
starship init fish | source
