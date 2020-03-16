export EDITOR=/usr/bin/vim
export MANPAGER="less"
export BROWSER="/usr/bin/chromium-browser"
export GPG_TTY=$(tty)
export TERM=xterm-256color-italic
export TZ='Asia/Kolkata'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --color=bw'

export PATH=$PATH":$HOME/scripts"
export PATH=$PATH":$HOME/bin"
export PATH=$PATH":$HOME/.cargo/bin"
export PATH=$PATH":$HOME/leet/flutter/bin"
export PATH=$PATH":$HOME/protoc/bin"
export PATH=$PATH":/opt/texlive/2019/bin/x86_64-linux"
export PATH=$PATH":/home/np/leet/depot_tools"
export PATH=$PATH":/home/np/.local/bin"

export GUILE_LOAD_PATH="/usr/local/share/guile/2.2:/usr/local/share/guile/site/2.2:/usr/local/share/guile/site:/usr/local/share/guile"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

case $- in
    *i*) ;;
      *) return;;
esac

# better history syncing
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000
HISTFILESIZE=2000
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# cool options for cool kids
shopt -s \
    autocd \
    globstar \
    checkwinsize \
    cdspell \
    dirspell \
    expand_aliases \
    dotglob \
    gnu_errfmt \
    histreedit \
    nocasematch 

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set colored-stats on'
bind 'set completion-display-width 1'
bind 'TAB:menu-complete'
bind "t: $HOME/scripts/tmux-fzf.sh"
bind Space:magic-space

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_prompt ] && . ~/.bash_prompt
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

jobs_number () {
    local number="$(jobs | wc -l)"
    if [ $number == 0 ]; then
        echo -n ""
    else
        echo -n "+ "
    fi
}

PROMPT_COMMAND=''

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/bin/flutter_completions.sh"

# pfetch
export PF_INFO="ascii title os kernel uptime pkgs shell "
export PF_SEP=" "
export PF_COL1=7
export PF_COL2=7
export PF_COL3=6
export PF_ALIGN="9"
export PF_ASCII="void"

export _JAVA_AWT_WM_NONREPARENTING=1

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
[[ -f ~/.bash_zoxide.sh ]] && source ~/.bash_zoxide.sh
