# alias
# check puppet syntax
alias ptest='find . | grep "\.pp$" | xargs puppet-lint --no-quoted_booleans-check --no-class_inherits_from_params_class-check --no-80chars-check --fail-on-warnings --with-filename --with-context; find . | grep "\.pp$" | xargs puppet parser validate'

# curl
alias ioscurl=curl -H "User-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"

# color
export CLICOLOR=1

# node
export NODE_ROOT=$HOME/.nvm/versions/node/v6.2.0
export PATH=$PATH:$NODE_ROOT/bin

# go
export GOROOT=$HOME/.gvm/gos/go1.7.1
export GOPATH=$HOME/dev/moovburg/golang/
export PATH=$PATH:$GOROOT/bin

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# mysql
export MYSQL_HOME=/usr/local/mysql/
export PATH=$PATH:$MYSQL_HOME/bin

# git branch in prompt
function parse_git_branch () {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# git colors
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
PS1="$GREEN\u@machine$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

# ssh-add
###################################
# start the ssh-agent
SSH_ENV=$HOME/.ssh/environment

function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add

    if [ -f ~/.ssh/id_rsa ]; then
        ssh-add ~/.ssh/id_rsa
    fi
}

if [ -f "${SSH_ENV}" ]; then
 . ${SSH_ENV} > /dev/null
 ps | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
}
else
    start_agent;
fi

# find file
function ff () {
    find . | egrep -i "$@"
}

# browserify
alias browserify='/Users/dailinliu/dev/node_exercise/node_modules/browserify/bin/cmd.js'
