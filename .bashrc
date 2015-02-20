# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.bash_aliases

export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export HISTSIZE=50000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Taskwarrior completion.
if [ -f ~/src/taskwarrior/scripts/bash/task.sh ] ; then
  . ~/src/taskwarrior/scripts/bash/task.sh
fi


alias drush7="/home/kosta/src/drupal/drush/drush"
alias youve_got_mail="bash ~/src/dotfiles/youve_got_mail.sh"
alias detect_displays="bash ~/src/dotfiles/detect_displays.sh"

# Eclimd
alias eclimd="/home/kosta/.eclipse/org.eclipse.platform_646169614_linux_gtk_x86_64/eclimd"
alias refactor="php /home/kosta/bin/refactor.phar"

# Vim
alias vim='gvim -v'

export EDITOR='emacsclient -t'

alias laravel="/home/kosta/bin/laravel"

source /etc/bash_completion.d/git
# source /etc/bash_completion.d/password-store
source /etc/bash_completion.d/git-flow-completion.bash
source /etc/bash_completion.d/yum-utils.bash
source /usr/share/git-core/contrib/completion/git-prompt.sh
if [ "\$(type -t __git_ps1)" ] && [ "\$(type -t __drush_ps1)" ]; then
  PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\n $(__git_ps1 " (%s)")$(__drush_ps1 "[%s]") $\[\e[m\] \[\e[0;37m\]'
fi

alias clipboard='bash /home/kosta/src/clipboard.sh'
export NODE_PATH='/usr/lib/node_modules'
export GOPATH=/home/kosta/gocode
alias ngrok=$HOME/src/ngrok

# JRE
JDK_HOME=/usr/lib/jvm/jre
export JDK_HOME

# ls
alias ls='ls --color=auto'

# mv
alias mv=' timeout 8 mv -iv'

# rm
alias rm=' timeout 3 rm -Iv --one-file-system'

# grep
alias grep='grep -n --color=auto'

# mkdir
alias mkdir='mkdir -p -v'

# less
# export LESSOPEN="| /usr/bin/source-highlight %s"
export LESS='-R '

alias e='emacsclient -t'
alias em="emacsclient -c"
alias ec='emacsclient -c'

alias sshuttle="bash /home/kosta/src/sshuttle/sshuttle --dns -vvr cloud.kostaharlan.net 0/0"

# Mosh IRC
alias irc="mosh cloud.kostaharlan.net -- screen -D -RR weechat weechat-curses"

export LANG=en_US.UTF-8
# alias pstorm="nohup /bin/bash /home/kosta/PHPStorm/bin/phpstorm.sh &"
export PATH=$HOME/.composer/vendor/bin:$PATH
# Drush completion.
. /home/kosta/.composer/vendor/drush/drush/drush.complete.sh 
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.composer/vendor/techlivezheng/phpctags:$PATH
export XDEBUG_CONFIG="idekey=PHPSTORM remote_host=localhost remote_port=9000"
export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
eval $(dircolors -b $HOME/.dircolors)
