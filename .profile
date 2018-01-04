[[ ! -d "$HOME/.config" ]] && mkdir "$HOME/.config"
[[ ! -d "$HOME/.local/share" ]] && mkdir -p "$HOME/.locale/share" 
[[ ! -d "$HOME/.cache" ]] && mkdir "$HOME/.cache"

PATH="$HOME/.local/bin:$PATH"
export PATH

export WALLPAPER=$( ls $HOME/pictures/Wallpapers | sort -R | head -1 )
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_PICTURES_DIR="$HOME/pictures"
export WALLPAPER="$XDG_PICTURES_DIR/Wallpapers/$WALLPAPER"

export HISTFILE="$XDG_DATA_HOME/bash/history"

if [[ -f /usr/bin/waterfox ]]; then
	export BROWSER="waterfox"
elif [[ -f /usr/bin/palemoon ]]; then
	export BROWSER="palemoon"
elif [[ -f /usr/bin/iceweasel ]]; then
	export BROWSER="iceweasel"
else
	export BROWSER="firefox"
fi

[[ -f ~/.bashrc ]] && . "$HOME/.bashrc"

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] 
then
	exec startx
fi

