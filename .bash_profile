### Access this profile from anywhere:
# curl -L bash.brianloughnane.com > tmp; . tmp

### editor
alias vim='mvim -v'
export EDITOR='vim'

#open file with vim in new iterm tab
v() {
  osascript -e 'activate application "iTerm"' -e 'tell application "System Events" to keystroke "t" using command down' -e "tell application \"iTerm\" to tell session -1 of current terminal to write text \"vim \
  $1 $2 $3 $4 $5 $6 $7 $8 $9 \n \""
}

### rupa z
if [ -d "/Users/lucid" ]; then
  . /Users/lucid/Applications/z/z.sh
else
  . /Users/home/Applications/z/z.sh
fi

### python
alias p='python'

### Temporary:
# alias dream='cd ~/hackreactor/projects/dreamify'
alias ser='cd /Users/lucid/code/luciddg-server && ls'
alias mod='cd /Users/lucid/code/luciddg-server/modules && ls'
alias jav='cd /Users/lucid/code/luciddg-server/modules/javascript/www && ls'
alias app='cd /Users/lucid/code/luciddg-server/modules/javascript/www/apps && ls'
alias com='cd /Users/lucid/code/luciddg-server/modules/javascript/www/common && ls'
alias bv='cd /Users/lucid/code/luciddg-server/modules/javascript/www/apps/bill-verification && ls'
alias bud='cd /Users/lucid/code/luciddg-server/modules/javascript/www/apps/budgeting && ls'
alias sty='cd /Users/lucid/code/luciddg-server/modules/styles/www/analytics && ls'
alias tem='cd /Users/lucid/code/luciddg-server/modules/templates/www/analytics && ls'
alias dja='cd /Users/lucid/code/luciddg-server/modules/django && ls'

### fiddles
# assumptions:
## subl command to open sublime
## chrome command to open chrome

# initiate fiddle setup
fiddlesetup () {
  mkdir -p ~/code/fiddles
  cd ~/code/fiddles
  mkdir fiddle-template
  cd fiddle-template
  touch index.html
  touch style.css
  touch app.js
  echo '<!DOCTYPE html><html lang="en"><head><link rel="stylesheet" href="style.css"><meta charset="UTF-8"><title>Fiddle</title><script src="app.js"></script></head><body><h1>Hello Fiddler!</h1></body></html>' > index.html
}

# get to fiddles easily
alias fiddles='pushd . && cd ~/code/fiddles'

# fiddle command
fiddle () {
  pushd .
  cd ~/code/fiddles
  cp -r fiddle-template "$1"-fiddle
  cd "$1"-fiddle
  subl .
  chrome index.html 
}

### Easily edit this profile
alias prof="vim ~/.bash_profile"
alias reprof=". ~/.bash_profile"

# Vagrant helpers
alias vagprof="cp ~/.bash_profile ~/code/luciddg-server/.bash_profile.tmp"
alias vagssh="vagrant ssh"
alias vagant="cd modules/django/dashboard && ant"
alias up="./docker/compose/ldg-compose -c 'docker.dev.analytics.ldgrc' up"
alias lup="./docker/compose/ldg-compose up"

# PS1="\h \w $ "
# why?:
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH

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

### Git Aliases 

# git clone, cd into repo, and ls

function gcl {
  url=$1;
  reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  git clone $url $reponame;
  cd $reponame;
  ls;
}

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gba='git branch -a'
alias gc='git commit '
alias gcf='git clean -f '
alias gd='git diff '
alias gdm='git diff master'
alias gh='git hist'
alias gha='git hist --all'
alias gm='git merge'
alias gmm='git merge master'
alias grs='git reset --soft'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias grv='git remote -v'
alias grau='git remote add upstream '
alias grm='git rm '
alias gmv='git mv '
alias go='git checkout '
alias gob='git checkout -b'
alias gom='git checkout master'
alias gos='git checkout sprint'
alias god='git checkout develop'
alias gobu='git checkout backup'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpu='git push upstream'
alias gpum='git push upstream master'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gplum='git pull upstream master'
alias gplrb='git pull --rebase'
alias gplrbu='git pull --rebase upstream'
alias gplrbum='git pull --rebase upstream master'
alias gplrbo='git pull --rebase origin '
alias gplrbos='git pull --rebase origin sprint'
alias gplus='git pull upstream solution '
alias gf='git fetch'
alias gfu='git fetch upstream'
alias grb='git rebase'
alias grbm='git rebase master'
alias grbs='git rebase sprint'
alias grbc='git rebase --continue'
alias gt='git tag '
alias gacm='git add . ; git commit -m'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

### Navigational Shortcuts

alias ll='ls -al'
alias dt='cd ~/Desktop && ls'
alias dw='cd ~/Downloads && ls'
alias hr='cd ~/hackreactor && ls'
alias toy='cd ~/hackreactor/toy-problems && ls'
alias proj='cd ~/hackreactor/projects && ls'
alias github='cd ~/code/github && ls'
alias code='cd ~/code && ls'

### Node Shortcuts

alias ndb="node-debug "

### Build Shortcuts

# Compile CoffeeScript

alias cofcomp='coffee --output compiled --map --watch --compile ./'

### Application Shortcuts

gi () {
  grep -i "$1" "$2"
}

gr () {
  grep -r "$1" .
}

gri () {
  grep -ri "$1" .
}

fd () {
  find . -name "$1"
}

db () {
  cp "$1" ~/Dropbox/Brian\'s\ MacBook\ Sync/
}

chrome () {
  open -a "Google Chrome" "$1"
}

slack () {
  open -a "Slack"
}

strap () {
  open -a "Google Chrome" "http://bookstrap.hackreactor.com"  
}

ff () {
  open -a "Firefox" "$1"
}

mail () {
	open -a "Firefox" "https://mail.google.com"
}

maps () {
	open -a "Google Chrome" "https://maps.google.com"
}

music () {
  open -a "Google Chrome" "https://www.pandora.com"
}

hbo () {
  open -a "Google Chrome" "https://www.hbonow.com"
}

netflix () {
  open -a "Google Chrome" "https://www.netflix.com"
}

amazon () {
  open -a "Google Chrome" "https://www.amazon.com"
}

skype () {
	open -a "Skype"
}

text () {
	open -a "TextEdit" "$1"
}

tote () {
	touch "$1"
	open -a "TextEdit" "$1"
}

note () {
	open -a "Notational Velocity"
}

card () {
	open -a "Anki"
}




# fiddle () {
# 	cd ~/code/fiddles
# 	if [find . -name fiddle-"$1"]; then
# 		cd fiddle-"$1"
# 		subl .
# 		chrome index.html	
# 	else	
# 		cp -r ../fiddle-template fiddles/fiddle-"$1"
# 		cd fiddle-"$1"
# 		subl .
# 		chrome index.html	
# 	fi
# }

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

alias oi='open index.html'

alias cl='clear'
alias cls='clear && ls'
alias clera="clear"

alias npmi='npm install '
alias npmig='npm install -g'

tosu () {
	touch "$1"
	subl "$1"
}

# z () {
# 	"$1"
# 	ls
# }

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
