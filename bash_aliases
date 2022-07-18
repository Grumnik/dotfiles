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

activate(){
    PROJECTS_DIR=~/projects
    if [ $# -eq 0 ]
    then
        echo "No project supplied as argument"
        return 1
    fi

    if [ ! -d "$PROJECTS_DIR/$1" ]
    then
        echo "No project $1 exists"
        return 0
    fi

    cd $PROJECTS_DIR/$1

    if [ ! -d "venv" ]
    then
    read -p "No virtual environment found, do you want to create one? (yes/no) " proceed
        case $proceed in 
            no | n)
                return 1
        esac
        python3.9 -m venv venv
    fi
    source venv/bin/activate
}
