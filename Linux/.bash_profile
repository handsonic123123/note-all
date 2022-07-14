# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
function find_git_branch {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head == ref:\ refs/heads/* ]]; then
                git_branch=" [${head#*/*/}] "
            elif [[ $head != '' ]]; then
                git_branch=' [detached] '
            else
                git_branch=' [unknown] '
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'
WHITE=$'\e[1;37m'

export PS1='${PINK}\u${D}@${ORANGE}\h${D}:${GREEN}\w${WHITE}$git_branch\$ '


if [ -f $(brew --prefix)/etc/bash_completion ]; then  
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_func ]; then
    . ~/.bash_func
fi

export LC_TIME=en_US.UTF-8


PATH=$PATH:$HOME/bin

export PATH
