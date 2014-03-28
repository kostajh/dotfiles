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

# Taskwarrior completion.
if [ -f ~/src/taskwarrior/scripts/bash/task.sh ] ; then
  . ~/src/taskwarrior/scripts/bash/task.sh
fi

# Drush completion.
if [ -f /home/kosta/.composer/vendor/drush/drush/examples/example.bashrc ] ; then
    . /home/kosta/.composer/vendor/drush/drush/examples/example.bashrc
fi

# Eclimd
alias eclimd="/home/kosta/.eclipse/org.eclipse.platform_793567567_linux_gtk_x86_64/eclimd"

# Vim
alias vim='gvim -v'

export EDITOR='gvim -v'

# Task aliases
alias ta="task add logged:false"
alias ta-email="task add 'AC/Email' logged:false +today +work ac:96 proj:dh-overhead +next"
alias todo="task todo"
alias work="task todo"
alias today="task today"
alias life="task life"
alias ts="ac timesheet"
alias t="task"
alias ta-lunch="task add Lunch logged:false ac:96 proj:dh-overhead +work +today +next"
alias ta-training="task add training logged:false ac:23 proj:dh-training +work +next +today"
alias ta-staff-meeting="task add Staff meeting logged:false ac:44 proj:dh-operations +work +next +today"

source /etc/bash_completion.d/git
source /usr/share/git-core/contrib/completion/git-prompt.sh
if [ "\$(type -t __git_ps1)" ] && [ "\$(type -t __drush_ps1)" ]; then
  PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\n $(__git_ps1 " (%s)")$(__drush_ps1 "[%s]") $(__task_ps1 "{%s}")\n\$\[\e[m\] \[\e[0;37m\]'
fi

alias clipboard='bash /home/kosta/src/clipboard.sh'
export TASKDDATA=/home/kosta/.taskd
export NODE_PATH='/usr/lib/node_modules'
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

# taskd
export TASKDDATA=/home/kosta/taskd
# alias pstorm="nohup /bin/bash /home/kosta/PHPStorm/bin/phpstorm.sh &"
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.composer/vendor/techlivezheng/phpctags:$PATH
export XDEBUG_CONFIG="idekey=PHPSTORM remote_host=localhost remote_port=9000"
#export PHP_IDE_CONFIG="serverName=RunTests"
export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
eval $(dircolors -b $HOME/.dircolors)
[ -n "$TMUX" ] && export TERM=screen-256color
