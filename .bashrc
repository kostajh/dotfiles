source ~/.bash_aliases
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
__task_ps1() {
    __ACTIVE_TASK_PROJECT="$(task _get $(task +ACTIVE id).project)"
  __ACTIVE_TASK_DESC="$(task _get $(task +ACTIVE id).description)"
  __ACTIVE_TASK_AC_ID="$(task _get $(task +ACTIVE id).ac)"
  __ACTIVE_TASK_ID="$(task +ACTIVE id)"
  __ACTIVE_TASK+="$__ACTIVE_TASK_PROJECT"
  __ACTIVE_TASK+=":"
  __ACTIVE_TASK+="$__ACTIVE_TASK_ID"
  __ACTIVE_TASK+="-"
  __ACTIVE_TASK+="$__ACTIVE_TASK_DESC"
  __ACTIVE_TASK+="["
  __ACTIVE_TASK+="$__ACTIVE_TASK_AC_ID"
  __ACTIVE_TASK+="]"
  #__ACTIVE_TASK+=" [$(task count +OVERDUE)]"
  [[ -n "$__ACTIVE_TASK_ID" ]] && printf "${1:- (%s)}" "$__ACTIVE_TASK"
}

export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export HISTSIZE=50000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Taskwarrior completion.
if [ -f ~/src/taskwarrior/scripts/bash/task.sh ] ; then
  . ~/src/taskwarrior/scripts/bash/task.sh
fi

# Drush completion.
if [ -f /home/kosta/.composer/vendor/drush/drush/examples/example.bashrc ] ; then
    . /home/kosta/.composer/vendor/drush/drush/examples/example.bashrc
fi
source /home/kosta/.composer/vendor/drush/drush/drush.complete.sh

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

# Task aliases
alias tw="task"
alias ta="task add logged:false"
alias todo="task todo"
alias logme="task logme"
alias today="task today"
alias life="task life"
alias ttr="taskwarrior_time_report"

source /etc/bash_completion.d/git
source /usr/share/git-core/contrib/completion/git-prompt.sh
if [ "\$(type -t __git_ps1)" ] && [ "\$(type -t __drush_ps1)" ]; then
  PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\n $(__git_ps1 " (%s)")$(__drush_ps1 "[%s]") $\[\e[m\] \[\e[0;37m\]'
fi

alias clipboard='bash /home/kosta/src/clipboard.sh'
export TASKDDATA=/home/kosta/.taskd
export NODE_PATH='/usr/lib/node_modules'
export GOPATH=/home/kosta/gocode
alias ngrok=$HOME/src/ngrok

# JRE
JDK_HOME=/usr/lib/jvm/jre
export JDK_HOME
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

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

# Mutt
alias mutt='mutt -F /home/kosta/.mutt/mayfirst'
alias mutt-work='mutt -F /home/kosta/.mutt/work'

alias e='emacsclient -t'
alias em="emacsclient -c"
alias ec='emacsclient -c'

alias sshuttle="bash /home/kosta/src/sshuttle/sshuttle --dns -vvr cloud.kostaharlan.net 0/0"

# Teamocil
complete -W "$(teamocil --list)" teamocil

# Mosh IRC
alias irc="mosh cloud.kostaharlan.net -- screen -D -RR weechat weechat-curses"

export LANG=en_US.UTF-8
# taskd
export TASKDDATA=/home/kosta/taskd
# alias pstorm="nohup /bin/bash /home/kosta/PHPStorm/bin/phpstorm.sh &"
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.composer/vendor/techlivezheng/phpctags:$PATH
export XDEBUG_CONFIG="idekey=PHPSTORM remote_host=localhost remote_port=9000"
#export PHP_IDE_CONFIG="serverName=RunTests"
export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
eval $(dircolors -b $HOME/.dircolors)
export PATH="/home/kosta/.cask/bin:$PATH"
#[ -n "$TMUX" ] && export TERM=screen-256color
#[ -n "$TMUX" ] && export TERM=xterm-256color
source ~/.fzf.bash
source ~/.autoenv/activate.sh
