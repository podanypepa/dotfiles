export LC_ALL=en_US.UTF-8
ZSH_DISABLE_COMPFIX=true
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/pepa/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	git
	z
	fzf
)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8

export EDITOR="vim"

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f /usr/local/bin/rg ]; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.{node_modules/*,.git/*}" --glob "!.svn"'
	# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git" --glob "!.svn"'
fi
export FZF_DEFAULT_OPTS="--preview-window 'right:50%' --layout=reverse"
# export FZF_DEFAULT_OPTS="--preview-window 'right:50%' --layout=reverse --preview 'preview.sh {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/go/bin:$PATH

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
