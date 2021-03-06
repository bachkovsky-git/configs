# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/mike/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

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
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh                                                                                                                                                                               
                                                                                                                                                                                                                     
fzf-history-widget() {                                                                                                                                                                                               
  LBUFFER=$(fc -lnr 1 | fzf --tiebreak=begin)                                                                                                                                                                        
  zle redisplay                                                                                                                                                                                                      
}                                                                                                                                                                                                                    
                                                                                                                                                                                                                     
zle -N fzf-history-widget                                                                                                                                                                                            
bindkey '^R' fzf-history-widget                                                                                                                                                                                      

unzipAndRemove() {
    unzip $1 && rm $1
}                                                                                                                                                                                                                     
function fzf-bookmarks-widget() {
  cd $(cat "$HOME/.config/bookmarks.cfg" | fzf --tiebreak=begin --tac | awk '{print $2}')
  zle reset-prompt
}

zle -N fzf-bookmarks-widget
bindkey '^S' fzf-bookmarks-widget


alias uz=unzipAndRemove                                                                                                                                                                                                   
alias er="extract"                                                                                                                                                                                                   
alias hs="history" 

alias aptl="apt list --upgradable"

alias json="python -m json.tool"
alias uplist="apt list --upgradable"
alias metrics="curl http://localhost:8080/lms/metrics/metrics --user 'tomcat:Wbhbrjd!952' -s | json | colout -t json"
alias log="colout \"^(.*?)(#.*?\s.*?\s.*?\s\[.*?\s)(.*?)\s(.*?)(\])\" Hash,#C7C7C7,Hash,Hash,#C7C7C7 | colout \"DEBUG\(.*?\):\" green | colout \"INFO\(.*?\):\" yellow | colout \"WARN\(.*?\):\" '#F8470C' | colout \"ERROR\(.*?\):\" red bold"
ZSH_THEME=simple

lms=$HOME/work/IdeaProjects/LMSSystem 
mira=$HOME/work/IdeaProjects/MiraFramework
logs=$HOME/work/logs

psql() (
  YELLOW=`echo -e '\033[1;33m'`
  LIGHT_CYAN=`echo -e '\033[1;36m'`
  GREEN=`echo -e '\033[0;32m'`
  NOCOLOR=`echo -e '\033[0m'`
  LESS="-iMSx4 -FXR"
  PAGER="sed \"s/^\(([0-9]\+ [rows]\+)\)/$GREEN\1$NOCOLOR/;s/^\(-\[\ RECORD\ [0-9]\+\ \][-+]\+\)/$GREEN\1$NOCOLOR/;s/|/$GREEN|$NOCOLOR/g;s/^\([-+]\+\)/$GREEN\1$NOCOLOR/\" 2>/dev/null | less"
  env psql "$@" 
)

