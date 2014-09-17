#
# ~/.bash_profile
#
export VAGRANT_HOME="/home/kosta"
export PATH="$PATH":$HOME/src/boris/bin/:$HOME/.gem/ruby/2.0.0/bin:$HOME/src/drupal/drush:/usr/local/bin:$HOME/.composer/vendor/bin:$PATH
if [ -n "$DESKTOP_SESSION" ];then 
    # No point to start gnome-keyring-daemon if ssh-agent is not up 
    if [ -n "$SSH_AGENT_PID" ];then 
        eval $(gnome-keyring-daemon --start) 
        export SSH_AUTH_SOCK export GPG_AGENT_INFO
        export GNOME_KEYRING_CONTROL
    fi
fi
. ~/.bashrc
