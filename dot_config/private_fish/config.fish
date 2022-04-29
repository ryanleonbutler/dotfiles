if status is-interactive
    # Commands to run in interactive sessions can go here
end

# function fish_greeting
#     echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
# end

function fish_greeting
    echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')    '(set_color red)(whoami)'@'(hostname)'
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')'(set_color yellow)'    Uptime: '(set_color white)(uptime | sed 's/.*up \([^,]*\), .*/\1/')(set_color red)'
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')    IP Address: '(set_color white)(ipconfig getifaddr en0)(set_color red)'
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)     '(set_color yellow)'Version: '(set_color white)(echo $FISH_VERSION)(set_color red)'
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
alias t "tmux"
alias sf "source ~/.config/fish/config.fish"
alias zshrc "vim $HOME/.local/share/chezmoi/dot_zshrc"
alias fshrc "vim $HOME/.local/share/chezmoi/dot_config/private_fish/config.fish"
alias starrc "vim $HOME/.local/share/chezmoi/dot_config/starship.toml"
alias sshrc "vim ~/.ssh/config"
alias vimrc "vim $HOME/.local/share/chezmoi/dot_config/lvim/config.lua"
alias kittyrc "vim $HOME/.local/share/chezmoi/dot_config/kitty/kitty.conf"
alias yabairc "vim $HOME/.local/share/chezmoi/executable_dot_yabairc"
alias skhdrc "vim $HOME/.local/share/chezmoi/dot_skhdrc"
alias spacebarrc "vim $HOME/.local/share/chezmoi/dot_config/spacebar/executable_spacebarrc"
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
alias gp "git push"

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

starship init fish | source

