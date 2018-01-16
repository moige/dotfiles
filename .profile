[[ ! -d "$HOME/.config" ]] && mkdir "$HOME/.config"
[[ ! -d "$HOME/.local/share" ]] && mkdir -p "$HOME/.locale/share" 
[[ ! -d "$HOME/.cache" ]] && mkdir "$HOME/.cache"

for i in $( ls $HOME/completion/ ) 
do
	source $HOME/completion/$i # Source each completion files
done

export PS1='[\u@\h -> \W$(__git_ps1 " : (%s)")]\n(\t) \$> '

if [ "$PS1" ]; then
	complete -cf sudo # Add sudo commands tab completion
fi

if [ ! -d "$XDG_DATA_HOME/bash" ]
then
	mkdir -p "$XDG_DATA_HOME/bash" 2>&1 >dev/null
fi

#------------------- GPG STUFFS --------------------------#

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

   # gpg-connect-agent killagent /bye
   # systemctl --user stop --now 'gpg-agent*.socket'
   # gpg-connect-agent updatestartuptty /bye
   # May need this for Systemd problems... Just systemd.

#---------------------------------------------------------#

PATH="$HOME/.local/bin:$PATH"
export PATH

export WALLPAPER=$( ls $HOME/pictures/Wallpapers | sort -R | head -1 )
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_PICTURES_DIR="$HOME/pictures"
export WALLPAPER="$XDG_PICTURES_DIR/Wallpapers/$WALLPAPER"

export HISTFILE="$XDG_DATA_HOME/bash/history"

if [[ -f /usr/bin/chromium ]]; then
	export BROWSER="chromium"
else
	export BROWSER="firefox"
fi

[[ -f ~/.bashrc ]] && . "$HOME/.bashrc"

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] 
then
	exec startx
fi

