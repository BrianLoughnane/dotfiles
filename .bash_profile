. /Users/home/Applications/z/z.sh

### Easily edit this profile

alias prof="subl ~/.bash_profile"
alias reprof=". ~/.bash_profile"

# PS1="\h \w $ "

export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR='nano'

# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles

default_username='BriRoni'

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 256)
	else
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi


function git_info() {
	# check if we're in a git repo
	git rev-parse --is-inside-work-tree &>/dev/null || return

	# quickest check for what branch we're on
	branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

	# check if it's dirty (via github.com/sindresorhus/pure)
	dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

	echo $WHITE" on "$PURPLE$branch$dirty
}

# Only show username/host if not default
function usernamehost() {
	if [ $USER != "$default_username" ]; then echo "${MAGENTA}$USER ${WHITE}at ${ORANGE}$HOSTNAME ${WHITE}in "; fi
}


# iTerm Tab and Title Customization and prompt customization
# http://sage.ucsc.edu/xtal/iterm_tab_customization.html

# Put the string " [bash]   hostname::/full/directory/path"
# in the title bar using the command sequence
# \[\e]2;[bash]   \h::\]$PWD\[\a\]

# Put the penultimate and current directory
# in the iterm tab
# \[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]

PS1="\[\e]2;$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]${BOLD}\$(usernamehost)\[$GREEN\]\w\$(git_info)\[$WHITE\]\n\$ \[$RESET\]"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


### Git Aliases via gitimmersion

alias gcl='git clone'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gd='git diff '
alias gm='git merge'
alias gr='git reset'
alias gundo='git reset HEAD~'
alias grv='git remove -v'
alias go='git checkout '
alias gob='git checkout -b'
alias gom='git checkout master'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gp='git push'
alias gpl='git pull'
alias gpum='git pull upstream master'
alias gf='git fetch'
alias gfu='git fetch upstream'
alias grb='git rebase'
alias grbm='git rebase master'
alias grbc='git rebase --continue'
alias gacm='git add.; git commit -m'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '


### Navigational Shortcuts

alias dt='cd ~/Desktop'
alias dw='cd ~/Downloads'
alias hr='cd ~/hackreactor'

# Application Shortcuts

chrome () {
	open -a "Google Chrome" "$1"
}

ff () {
	open -a "Firefox" "$1"
}

slack () {
	open -a "Slack"
}

skype () {
	open -a "Skype"
}


# Functional Shortcuts

mkcd () {
	mkdir $1
	cd $1
}

f () {
	cd "$1"
	ls
}

b () {
	cd ..
	ls
}

alias cl='clear'
alias clera="clear"

alias npmi='npm install'
alias npmig='npm install -g'

tosu () {
	touch "$1"
	subl "$1"
}