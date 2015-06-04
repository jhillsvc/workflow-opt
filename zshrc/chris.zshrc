# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="op"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby bundler gem rails rake brew)

source $ZSH/oh-my-zsh.sh

export EDITOR="/usr/local/bin/vim"

# User configuration
export NODE_PATH="/usr/local/lib/node"

export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$NODE_PATH:$HOME/.cabal/bin:$HOME/.rbenv/bin:$HOME/.local/bin:/Users/chrisblatchley/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export RBENV_ROOT="$HOME/.rbenv"
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

app() { cd $HOME/prog/$1 }
compctl -W $HOME/prog/ -/ app

stpkg() { cd $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/$1 }
compctl -W $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/ -/ stpkg

github() { open $(git config --get remote.origin.url | sed 's/com:/com\//;s/git\@/https\:\/\//;s/\.git//')/tree/$(git rev-parse --abbrev-ref HEAD) &> /dev/null; }

push() {
    MESSAGE=$1
    curl -s -F "token=YOUR_TOKEN_HERE" \
            -F "user=YOUR_USER_HERE" \
            -F "title=Terminal" \
            -F "message=$1" \
            https://api.pushover.net/1/messages.json
}

# Aliases
alias startvm='prlctl start Windows\ 7'

alias eip='curl ifconfig.me'
alias whereami='tty ; hostname ; eip ;  geoiplookup $(eip)'

alias subl='subl *.sublime-project(N)'
alias fuck='$(thefuck $(fc -ln -1))'

alias cpu="ps aux | awk '{print \$3}' | tail +2 | paste -sd+ - | bc"
alias ram="ps aux | awk '{print \$4}' | tail +2 | paste -sd+ - | bc"
