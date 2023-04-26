########## Quick Bindings ##########

# Enable searching through history (based on plugin)
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Enable ctrl+space complete suggestion (based on plugin)
bindkey '^ ' autosuggest-accept

# Control bindings for programs
bindkey -s "^h" "history 1\n"
bindkey -s "^l" "clear\n"

########## General Bindings ##########

# Add Sudo
function add_sudo() {
	BUFFER="sudo "$BUFFER
	zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo


########## Git Bindings ##########

# Git Add, Commit, and Push
function git_prepare() {
	if [ -n "$BUFFER" ];
		then
			BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
	fi

	if [ -z "$BUFFER" ];
		then
			BUFFER="git add -A && git commit -v && git push"
	fi

	zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

# Git Branch and Checkout
function git_branch() {
	BUFFER="git branch \"$BUFFER\" && git checkout \"$BUFFER\""
	zle accept-line
}
zle -N git_branch
bindkey "^b" git_branch

# Home - Navigates to the base of the git dir
function git_root() {
	BUFFER="cd $(git rev-parse --show-toplevel || echo ".")"
	zle accept-line
}
zle -N git_root
bindkey "^h" git_root