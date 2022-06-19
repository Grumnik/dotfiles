#! /bin/bash

if [ -f ~/.hb_aliases ]; then
    . ~/.hb_aliases
fi

# set config home
export XDG_DATA_HOME=$HOME/.config

export VISUAL=nvim;
export EDITOR=nvim;
export IGNOREEOF=42
 
# used by a nvim plugin
export FZF_DEFAULT_COMMAND='fdfind --type file --hidden --no-ignore --follow --exclude={.git,.sass-cache,node_modules,build,tmp,__pycache__,omelette,lib64}'
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

PATH=$PATH:$HOME/scripts

