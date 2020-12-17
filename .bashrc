source ~/.alias
source ~/.shellenv

case $- in
  *i*) ;;
  *) return ;;
esac

shopt -s histappend
shopt -s checkwinsize

[ -x /user/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

export PS1="\n\[\e[32m\]\w\[\e[m\] \$(git-ps) > "

source ~/.zshenv

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
