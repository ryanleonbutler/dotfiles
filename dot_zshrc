export ZSH="${HOME}/.oh-my-zsh"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#75B8C8'
unsetopt BEEP
TERM=xterm

plugins=(z git vscode zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Favourites
alias vim="vim"
alias v="vim"
alias vi="vim"
export EDITOR="lvim"
alias sz="source ~/.zshrc"
alias ls="ls -GFh"
alias ll="ls -GFhl"
alias zshrc="vim ${HOME}/.local/share/chezmoi/dot_zshrc"
alias starrc="vim ${HOME}/.local/share/chezmoi/dot_config/starship.toml"
alias sshrc="vim ~/.ssh/config"
alias vimrc="vim ${HOME}/.local/share/chezmoi/dot_config/lvim/config.lua"
alias kittyrc="vim ${HOME}/.local/share/chezmoi/dot_config/kitty/kitty.conf"
alias filesopen="sudo lsof -n | cut -f1 -d' ' | uniq -c | sort | tail"
alias ranger="TERM=xterm-kitty ranger"
alias chrome="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security --no-sandbox && cp ~/Library/Application\ Support/Google/Chrome/NativeMessagingHosts/amazon_enterprise_access.json /tmp/chrome_dev_test/NativeMessagingHosts/"
alias secretsrc="v ~/.env"
alias jupyter="${HOME}/development/jupyter_notebooks/.venv/bin/jupyter notebook --port 8888 --notebook-dir ${HOME}/development/jupyter_notebooks/src"
alias cat="rich"

# docker
alias db="docker build"
alias dcl="docker container ls -a"
alias dcc="docker container create"
alias dcstart="docker container start"
alias dcstop="docker container stop"
alias dck="docker container kill"
alias dcrm="docker container rm -f"
alias dil="docker image ls"
alias dirm="docker image rm -f"

# Custom tree
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store|.venv|dist|build|__pycache__|.vscode' --dirsfirst --filelimit 30 -L ${1:-3} -aC $2
}

# Git
alias gs="git status"
alias ga="git add -A"
alias gl="git log"
alias gd='git diff'
alias gcm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'

# AWS CLI
export AWS_PAGER=""

# Pipx
export PATH="$PATH:${HOME}/.local/bin"
export PIPX_DEFAULT_PYTHON="${HOME}/.pyenv/shims/python"

# Pyenv details
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# fnm
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --use-on-cd)"

# Source secrets from .env
SECRETS="${HOME}/.env"
source $SECRETS

# starship
eval "$(starship init zsh)"
