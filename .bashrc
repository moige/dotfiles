# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

export HISTSIZE=10000
export HISTFILESIZE=20000

for i in $( ls $HOME/completion/ ) 
do
	source $HOME/completion/$i # Source each completion files
done

export PS1='[\u@\h -> \W$(__git_ps1 " : (%s)")]\n(\t) \$> '

if [ "$PS1" ]; then
	complete -cf sudo # Add sudo commands tab completion
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

#------------------- GIT PROMPT STUFFS -------------------#

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose name git"
export VISUAL=vim
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"

#---------------------------------------------------------#

#-------------------- ALIAS ------------------------------#

alias rspace='for f in *\ *; do mv "$f" "${f// /_}"; done' # Remove spaces of files in actually directory
alias p="sudo pacman"
alias clmem="sudo sync && sudo sysctl vm.drop_caches=3" # Sync cache and clean memory cache
alias ka="killall"
alias ls="ls -hNF --color=auto --group-directories-first"
alias mkdir="mkdir -pv"
alias rm="rm -vI"
alias mv="mv -v"
alias edit='eval "$VISUAL"'
alias gac="git add . && git commit -m"

#---------------------------------------------------------#

#-------------------- FUNCTIONS --------------------------#

function youaudio-mp3 { youtube-dl -x --audio-format mp3 --audio-quality 0 $1 && mv -v *.mp3 $HOME/music ;} # Download audios from YouTube in MP3 format.
function youaudio { youtube-dl -x --audio-format opus --audio-quality 0 $1 && mv -v *.opus $HOME/music ;} # Download audios from YouTube in OPUS format.
function aur { curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;} # Download packages from AUR
function pwgen { < /dev/urandom tr -dc '[:graph:]' | head -c"$1";echo; } # Gen a password from /dev/urandom. USE: pwgen [password lenght] 
function flac2mp3 { for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done; } # Convert FLAC to MP3 with FFMPEG

#---------------------------------------------------------#
