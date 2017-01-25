# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
GOPATH=~/.go
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
PATH="/opt/mat:/opt/go/bin:/usr/lib/jvm/scala-2.12.1/bin:/usr/lib/jvm/jdk1.8.0_111/bin:/opt/Telegram:$HOME/bin:$HOME/.local/bin:$PATH"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then                                                                                                                                         
  export $(gnome-keyring-daemon -s)                                                                                                                                                                                
fi

xrandr --output VGA1 --auto --left-of HDMI1
