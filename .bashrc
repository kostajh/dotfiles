export PATH=/usr/local/bin:$PATH
export PATH=/Users/kosta/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:/Users/kosta/.gem/ruby/1.8/bin
export PATH=$PATH:/Users/kosta/.gem/bin
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export PATH=$PATH:"/Users/kosta/src/github/git-diff-grep"
export PATH=$PATH:/Users/kosta/drush
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin
export GEM_HOME="/Users/kosta/.gem"
export GEM_PATH="/Users/kosta/.gem"
alias mvim="~/src/vim/macvim/src/MacVim/mvim"
export NODE_PATH=/usr/local/lib/node
alias drupalcs='phpcs --standard=DrupalCodingStandard'
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

# Set colors
export LS_COLORS='di=1;36:fi=0:ln=4;34:pi=5:so=4;5:bd=5:cd=5:or=4;91:mi=4;92:ex=35:*.rb=90'
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[00m\]\u@\h\[\033[01;34m\] \W \[\033[31m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "

export PATH=$PATH:/opt/node/bin

source /Users/kosta/src/misc/git-completion.bash

# PEAR
alias pear="/usr/bin/php /usr/lib/php/pearcmd.php"
alias pecl="/usr/bin/php /usr/lib/php/peclcmd.php"

alias ls="ls -G"

if [ -f /usr/local/Cellar/drush/5.4/libexec/examples/example.bashrc ] ; then
    . /usr/local/Cellar/drush/5.4/libexec/examples/example.bashrc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

