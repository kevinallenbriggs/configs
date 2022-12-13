# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to global Composer install
export PATH=$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='af-magic'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rsync docker zsh-syntax-highlighting command-not-found)

# Docker plugin autocompletion (see https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH=$HOME/bin:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias ev='vim ~/.vimrc'
alias update='sudo apt update && apt list --upgradable'

# allow interacting with version-controlled config files from anywhere
# see https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias htop='htop -d 7.5'

alias ll='ls -lahF'

alias pwd='pwd -P'

alias find-big='find -type f -exec du -Sh {} + | sort -rh | head -n 5'

alias dc='docker-compose'
alias dcreset='dcd; dcud;'
alias dcu='dc up'
alias dcud='dcu -d'
alias dcuf='dcud; dcl'
alias dcd='dc down'
alias dcdv='dcd -v'
alias dcrv='dcdv && dcu'
alias dcl='dc logs -f $1'
alias dcr='dc run --rm'
alias dcre='dcr --entrypoint=""'
alias ds='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}\t{{.MemUsage}}\t{{.PIDs}}"'
alias dsa='docker stop $(docker ps -q) && docker rm $(docker ps -aq)'
alias dcwp='dcr wp-cli'
alias dcc='dcr composer'

# git find tag - locates the "closest" tag to a given commit
function gft {
    git describe --contains "$1" | cut -d '~' -f 1
}

# git tag
alias gt='git tag'

# git status only show staged files
alias gsts='git status --short | grep '"'"'^[MARCD]'"'"''

# git undo last commit
alias gu='git reset --soft HEAD~1'

# git merge main
alias gmm='git merge main'

# git checkout main
alias gcm='git checkout main'

# git push including tags
alias gpt='gp && gp --tags'

# always pull before a push
alias gp='gl && git push'

# run 'wp' commands inside docker-compose containers
#alias wp='dcr wp-cli'

# provide autocomplete for the gem function https://unix.stackexchange.com/questions/28283/autocomplete-of-filename-in-directory
function __gemComplete {
	local cur={COMP_WORDS[COMP_WORD]}
	
	IFS=$'\n' tmp=( $(compgen -W "$(ls ~/Documents/psaudio/)" -- $cur))
	COMPREPLY=( "${tmp[@]// \/ }" )
}
complete -F __gemComplete gem

# compress a video file in place
function compress-video {
    ffmpeg -i "$1" -acodec mp3 -c:v hevc_nvenc $(echo "$1" | cut -f 1 -d '.').mp4
}

# convert files to .mp3
function convert-to-mp3 {
    ffmpeg -i "$1" -q:a 0 "$(echo $1 | cut -f 1 -d '.').mp3"
}

# get the first 30 seconds of a music file
function get-sample {
	#$OCTAVE_RECORDS_DEFAULT_EXT=".wav"
	#$EXTENSION="${1:-$OCTAVE_RECORDS_DEFAULT_EXT}"
	#echo "$EXTENSION"
    	# $OCTAVE_RECORDS_FILENAME=$(basename 01\ -\ Zuill\ Bailey\ -\ BWV\ 1007\ Suite\ No.\ 1\ in\ G\ Major\ -\ Prelude.wav .wav)
	ffmpeg -y -i "$1" -q:a 0 -ss 0 -af "afade=t=out:st=23:d=6" "$(basename $1 .wav).mp3"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
