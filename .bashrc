export PATH=/usr/local/bin:$PATH
export PATH=/Users/kosta/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH="$PATH:/Users/kosta/.gem/bin:/usr/local/bin"
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$PATH:"/Users/kosta/src/github/git-diff-grep"
export PATH="$PATH:/Users/kosta/src/drupal/drush:/usr/local/bin"
export PATH="$PATH:/usr/local/Cellar/php53/5.3.14/bin"
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/usr/local/Cellar/php53/5.3.14/bin
export GEM_HOME="/Users/kosta/.gem"
export GEM_PATH="/Users/kosta/.gem"
alias mvim="~/src/vim/macvim/src/MacVim/mvim"
alias drupalcs='phpcs --standard=Drupal --extensions=php,module,inc,install,test,profile,theme'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
alias todo="subl ~/Dropbox/Apps/Byword/todo.md"
alias selenium="java -jar ~/src/selenium/selenium-server-standalone-2.25.0.jar"
export EDITOR=/usr/bin/vim

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# ANSI color codes
# Reset
Color_Off='\e[0m' # Text Reset

# Regular Colors
Black='\e[0;30m' # Black
Red='\e[0;31m' # Red
Green='\e[0;32m' # Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m' # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m' # Cyan
White='\e[0;37m' # White

# Bold
BBlack='\e[1;30m' # Black
BRed='\e[1;31m' # Red
BGreen='\e[1;32m' # Green
BYellow='\e[1;33m' # Yellow
BBlue='\e[1;34m' # Blue
BPurple='\e[1;35m' # Purple
BCyan='\e[1;36m' # Cyan
BWhite='\e[1;37m' # White

# Underline
UBlack='\e[4;30m' # Black
URed='\e[4;31m' # Red
UGreen='\e[4;32m' # Green
UYellow='\e[4;33m' # Yellow
UBlue='\e[4;34m' # Blue
UPurple='\e[4;35m' # Purple
UCyan='\e[4;36m' # Cyan
UWhite='\e[4;37m' # White

# Background
On_Black='\e[40m' # Black
On_Red='\e[41m' # Red
On_Green='\e[42m' # Green
On_Yellow='\e[43m' # Yellow
On_Blue='\e[44m' # Blue
On_Purple='\e[45m' # Purple
On_Cyan='\e[46m' # Cyan
On_White='\e[47m' # White

# High Intensty
IBlack='\e[0;90m' # Black
IRed='\e[0;91m' # Red
IGreen='\e[0;92m' # Green
IYellow='\e[0;93m' # Yellow
IBlue='\e[0;94m' # Blue
IPurple='\e[0;95m' # Purple
ICyan='\e[0;96m' # Cyan
IWhite='\e[0;97m' # White

# Bold High Intensty
BIBlack='\e[1;90m' # Black
BIRed='\e[1;91m' # Red
BIGreen='\e[1;92m' # Green
BIYellow='\e[1;93m' # Yellow
BIBlue='\e[1;94m' # Blue
BIPurple='\e[1;95m' # Purple
BICyan='\e[1;96m' # Cyan
BIWhite='\e[1;97m' # White

# High Intensty backgrounds
On_IBlack='\e[0;100m' # Black
On_IRed='\e[0;101m' # Red
On_IGreen='\e[0;102m' # Green
On_IYellow='\e[0;103m' # Yellow
On_IBlue='\e[0;104m' # Blue
On_IPurple='\e[10;95m' # Purple
On_ICyan='\e[0;106m' # Cyan
On_IWhite='\e[0;107m' # White
function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }

export GIT_PS1_SHOWDIRTYSTATE=true
prompt_pwd() {
  local pwd_symbol="..."
  local pwd_length=30
  newPWD="${PWD/#$HOME/~}"
  [ ${#newPWD} -gt ${pwd_length} ] && newPWD=${newPWD:0:12}${pwd_symbol}${newPWD:${#newPWD}-15}
  echo $newPWD
}
gitprompt='$(__git_ps1 "(%s)")'
export PS1="\[$BIBlack\]\$(prompt_pwd) \u@\h \[$BIRed\]$gitprompt\[$Green\]\[$Color_Off\] "

if [ -f /usr/local/Cellar/drush/5.7/libexec/examples/example.bashrc ] ; then
    . /usr/local/Cellar/drush/5.7/libexec/examples/example.bashrc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

