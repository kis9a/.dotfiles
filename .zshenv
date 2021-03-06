# genera
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export TERM='screen-256color'
export TARGET_LANG=ja
export KEYTIMEOUT=1
export HISTSIZE=1000000
export SAVEHIST=1000000
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 100% --reverse'
export LESS_TERMCAP_so=$'\E[30;43m'

# dir
export DOTFILES=$HOME/dotfiles
export HISTFILE=$HOME/.zsh_history
export MYVIMRC=$HOME/dotfiles/.config/nvim/init.vim
export KIS9A=$HOME/kis9a
export MEMOS=$HOME/kis9a/memos
export TASKS=$HOME/kis9a/tasks
export TASK=$HOME/kis9a/tasks/$(date +%Y)/$(date +%m).md
export BOX=$HOME/kis9a/tasks/box
export DEV=$HOME/dev
export LOFI=$HOME/lofi

# bin
export PATH=$HOME/bin:"$PATH"

# go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
# export PATH=/usr/local/Cellar/openresty/1.19.3.1_1/nginx/sbin:$PATH
