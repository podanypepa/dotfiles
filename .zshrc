export LC_ALL=en_US.UTF-8
ZSH_DISABLE_COMPFIX=true
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/pepa/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	git
	z
	fzf
)

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

export EDITOR="vim"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias v="vim"
# alias vim="nvim"
alias n="nvim"
alias gs="git status"
alias i="code-insiders"
alias mc="mc -b"
alias tree="tree --dirsfirst"
alias ls="exa"
alias ll="ls -al"
alias -s go=vim
alias -s js=vim
alias -s ts=vim
alias -s json=vim
alias -s yml=vim
alias -s yaml=vim
# alias br="broot --gitignore yes"
alias ghist="git -c color.status=always log --pretty=format:'%C(green)%h %C(yellow bold)%s%Creset -> %Cblue%cn%Creset, %ar' --no-merges"
alias f="fzf"
alias pping="prettyping"
alias vi="nvim"
alias t="TERM=screen-256color tmux"
alias tmc="t new -s"
alias tml="t ls"
alias cg="colorgo"
alias myip='curl ipinfo.io/ip'

export GO111MODULE=auto
export GOPRIVATE="gitlab.com/fastandcomfy/backend"
export GOPRIVATE="$GOPRIVATE,gitlab.com/fastandcomfy/botstrapi"
export GOPRIVATE="$GOPRIVATE,gitlab.com/fastandcomfy/botproxy"
export GOPRIVATE="$GOPRIVATE,gitlab.com/fastandcomfy/mq"
export GOPRIVATE="$GOPRIVATE,gitlab.com/fastandcomfy/fac"
export GOPRIVATE="$GOPRIVATE,gitlab.com/fastandcomfy/mngrstrapi"
export GOPRIVATE="$GOPRIVATE,gitlab.com/fastandcomfy/mngr_postgresql"
export GOPRIVATE="$GOPRIVATE,gitlab.com/fastandcomfy/traficmonitor"
export GOPRIVATE="$GOPRIVATE,github.com/fastandcomfy/shiny-waffle"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f /usr/local/bin/rg ]; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git" --glob "!.svn"'
fi
export FZF_DEFAULT_OPTS="--preview-window 'right:50%' --preview 'preview.sh {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/bin:$PATH

kill_port() {
	if [ -n "$1" ]; then
		lsof -ti :"$1" | xargs kill
	else
		echo "Pass in port number."
	fi
}

# attach to tmux session
tma() {
	t attach -t $(tmux ls | fzf --no-preview --prompt="select session " | awk '{split($0,a,":"); print a[1]}')
}

alias a="tma"

# drop seleced tmux session
tmd() {
	t kill-session -t $(tmux ls | fzf --no-preview --prompt="select session " | awk '{split($0,a,":"); print a[1]}')
}

unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --no-preview --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

b() {
  local bookmarks_path=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks
  local jq_script='def ancestors: while(. | length >= 2; del(.[-1,-2])); . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'
  jq -r $jq_script < "$bookmarks_path" \
  | sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' \
  | fzf --ansi \
  | cut -d$'\t' -f2 \
  | xargs open
}
export BAT_THEME="1337"
