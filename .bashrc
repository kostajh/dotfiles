# Include Drush prompt customizations.
. /home/kosta/.drush/drush.prompt.sh

# Include Drush completion.
. /home/kosta/.drush/drush.complete.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.bash_aliases

# GPG_TTY=$(tty)
# export GPG_TTY
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export HISTSIZE=50000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Eclimd
# alias eclimd="/home/kosta/.eclipse/org.eclipse.platform_793567567_linux_gtk_x86_64/eclimd"

export MU_GPG_PATH="/usr/bin/gpg2"
export EDITOR='vim'

#source /etc/bash_completion.d/git
# source /etc/bash_completion.d/password-store
source /etc/bash_completion.d/git-flow-completion.bash
source /etc/bash_completion.d/yum-utils.bash

alias clipboard='bash /home/kosta/src/clipboard.sh'
export NODE_PATH='/usr/lib/node_modules'
export GOPATH=/home/kosta/gocode
alias ngrok=$HOME/src/ngrok

# JRE
JDK_HOME=/usr/lib/jvm/jre
export JDK_HOME

alias ls='ls --color=auto'
alias mv=' timeout 8 mv -iv'
alias rm=' timeout 3 rm -Iv --one-file-system'
alias grep='grep -n --color=auto'
alias mkdir='mkdir -p -v'
# export LESSOPEN="| /usr/bin/source-highlight %s"
export LESS='-R '

alias e='emacsclient -t'
alias em="emacsclient -c"
alias ec='emacsclient -c'

alias drupalvm_reload='(cd ~/src/drupal-vm; vagrant reload)'
alias drupalvm_reload_provision='(cd ~/src/drupal-vm; vagrant reload --provision)'
alias drupalvm_ssh='(cd ~/src/drupal-vm; vagrant ssh)'
alias drupalvm_rsync_auto='(cd ~/src/drupal-vm; vagrant rsync-auto)'

alias sshuttle="bash /home/kosta/src/sshuttle/sshuttle --dns -vvr cloud.kostaharlan.net 0/0"

alias irc="mosh cloud.kostaharlan.net -- screen -D -RR weechat weechat-curses"

export LANG=en_US.UTF-8
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.composer/vendor/techlivezheng/phpctags:$PATH
export PATH=$PATH:$GOPATH/bin
# export XDEBUG_CONFIG="idekey=PHPSTORM remote_host=localhost remote_port=9000"
alias enable_debugger='export XDEBUG_CONFIG="idekey=PHPSTORM remote_host=localhost remote_port=9000 profiler_enable=1"'
# export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
export LEDGER_FILE=/mnt/data/ownCloud/documents/ledger/ledger.txt
eval $(dircolors -b $HOME/.dircolors)

# added by travis gem
[ -f /home/kosta/.travis/travis.sh ] && source /home/kosta/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.node_modules_global/bin:$PATH"
export WEBIDE_JDK="/usr/lib/tuxjdk"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
