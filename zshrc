# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to your oh-my-zsh external configuration.
ZSH_CUSTOM=$HOME/.dotfiles/.oh-my-zsh-custom

# Add local function path
fpath=($HOME/.local/share/zsh/site-functions/ $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(alias gem git grep mercurial pip repo taskwarrior tmuxinator colored-man-pages)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval $(thefuck --alias)
alias ec='/usr/local/bin/emacsclient -n'
alias em='/usr/local/bin/emacsclient -t -c'
alias co='codium -g'
alias nco='codium -n -g'
alias cat='bat -pp'
alias vi='vim'
alias mu='kinit G603289; neomutt'
alias xo='xdg-open'
alias sl='ls'
alias fd5='fd -exec md5sum {} \;'

export PATH=$HOME/.local/bin:$HOME/local/bin:/usr/local/bin:$HOME/Notes/tools:$HOME/.cargo/bin:/opt:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
EDITOR=`which vim`

# Configure terminal
export PATH=$HOME/.local/bin:$HOME/local/bin:/usr/local/bin:/sbin:$PATH
export DEBFULLNAME="Paul-Erwan RIO"
export DEBEMAIL=paul-erwan.rio@sagemcom.com
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
export SPACESHIP_DIR_TRUNC=0
export SPACESHIP_EXIT_CODE_SHOW=true

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

zstyle ":completion:*:descriptions" format "%B%d%b"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && source ~/.fzfrc && source ~/.git-fzf.sh
