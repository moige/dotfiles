# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

for i in $( ls $HOME/completion/ ) 
do
	source $HOME/completion/$i
done

export PS1='[\u@\h -> \W$(__git_ps1 " : (%s)")]\n(\t) \$> '

if [ ! -d "$XDG_DATA_HOME/bash" ]
then
	mkdir -p "$XDG_DATA_HOME/bash"
fi

HISTSIZE=10000
HISTFILESIZE=20000

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose name git"
export VISUAL=vim
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"

alias rspace='for f in *\ *; do mv "$f" "${f// /_}"; done'
alias p="sudo pacman"
alias clmem="sudo sync && sudo sysctl vm.drop_caches=3"
alias ka="killall"
alias ls="ls -hNF --color=auto --group-directories-first"
alias mkdir="mkdir -pv"
alias edit='eval "$VISUAL"'
alias gac="git add . && git commit -m"

# rsync -avzPhi --log-file="$HOME"/var/log/rsync.log --exclude={.cache,.local,.waterfox,.mozilla,.atom,libreoffice,.texlive,.git,{c,C}ache} $HOME backup/

function youaudio-mp3 { youtube-dl -x --audio-format mp3 --audio-quality 0 $1 && mv -v *.mp3 $HOME/music ;}
function youaudio { youtube-dl -x --audio-format opus --audio-quality 0 $1 && mv -v *.opus $HOME/music ;}
function aur { curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;}
function pwgen { < /dev/urandom tr -dc '[:graph:]' | head -c"$1";echo; }
function flac2mp3 { for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done; }

