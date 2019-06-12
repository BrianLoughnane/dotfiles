### Access this profile from anywhere:
# curl -L bash.brianloughnane.com > tmp; . tmp

# easily edit this profile - replace with bprof
#alias prof="vim $HOME/.bash_profile" (replace with bprof)
alias reprof=". $HOME/.bash_profile"

# tmux 2.2 needs this - remove later
export EVENT_NOKQUEUE=1

# Dotfiles repo
export DOTFILES_REPO="$HOME/code/dotfiles"
export PATH=$PATH:$DOTFILES_REPO
alias dotfiles="cd $DOTFILES_REPO"

alias bprof="\
  vim $HOME/.bash_profile && \
  . $HOME/.bash_profile && \
  cp_dotfiles_from_home_to_repo \
"

alias tprof="\
  vim $HOME/.tmux.conf && \
  tmux source-file $HOME/.tmux.conf && \
  cp_dotfiles_from_home_to_repo \
"

alias vprof="\
  vim $HOME/.vimrc && \
  cp_dotfiles_from_home_to_repo \
"

# casandra / tutorial
export CASSANDRA_HOME=$HOME/cassandra
export PATH=$PATH:$CASSANDRA_HOME/bin

#  --> maven
export MAVEN_HOME=$HOME/maven
export PATH=$PATH:$MAVEN_HOME/bin

# retropie stuff
snes () {
  cp "$1" /Volumes/roms/snes
}

# databae project
alias bae='cd /Users/home/code/projects/databae'
alias backend='cd /Users/home/code/projects/databae/src/backend'
alias activate='source ~/.virtualenvs/databae_backend/bin/activate'

# fast.ai tutorial
alias fast='cd /Users/home/code/tutorials/fast.ai'

# Postgres stuff:

# start server:
# postgres -D /usr/local/var/postgres/

# connect to server
# psql

# cli interface
# \list
# \connect
# \dt
# \d

# copy data from csv:
#copy zip_codes from '/path/to/csv/ZIP_CODES.txt' DELIMITERS ',' CSV;




### editor
alias vim='mvim -v'
export EDITOR='vim'

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
alias II='cd /Users/lucid/code/luciddg-server-II && ls'
alias vag='cd /vagrant && ls'
alias mod='cd /Users/lucid/code/luciddg-server/modules && ls'
alias jav='cd /Users/lucid/code/luciddg-server/modules/javascript/www && ls'
alias app='cd /Users/lucid/code/luciddg-server/modules/javascript/www/apps && ls'
alias com='cd /Users/lucid/code/luciddg-server/modules/javascript/www/common && ls'
alias testing='cd /Users/lucid/code/luciddg-server/modules/django/dashboard/testing && ls'
alias mi='cd /Users/lucid/code/luciddg-server/modules/django/bin/migrations'
alias mig='vagrant ssh -- -t "cd /vagrant && docker exec compose_worker_1 python /code/luciddg-server/modules/django/dashboard/manage.py migrations apply"'
alias huskyD=" \
  pushd . && \
  cd /Users/lucid/code/luciddg-server/.git/hooks && grep -ril 'husky' . | xargs rm && \
  popd"

# vagrant helpers (can ssh ld, ssh luciddg.localdev instead of vagrant ssh)

# faster than vagrant ssh; allows sane attaching of other commands
alias v='ssh -t lucidlive.localdev'

# access docker-compose on vagrant through dc:
alias dc='v /vagrant/docker/compose/ldg-compose'

# do common tasks with the ldg docker containers:
#alias dcup='dc up -d'
#alias dckill='dc kill'
#alias dcrm='dc rm -f'
#alias dcdown='dckill && dcrm'
#alias dcr='dcdown && dcup'

# mysql from local client to vagrant server:
#alias mysql='mysql -Ah 127.0.0.1 -u ldg_admin -p"74g.5dm1n!" dashboard'

sshd() {
  v docker exec -it $1 bash
}

worker() {
  v docker exec -it compose_worker_1 bash
}

manage() {
  v docker exec compose_worker_1 python /code/luciddg-server/modules/django/dashboard/manage.py $@
}

manageit() {
  v docker exec -it compose_worker_1 python /code/luciddg-server/modules/django/dashboard/manage.py $@
}

shell() {
  manageit shell
}

runtests() {
  manage runtests $@
}

www() {
  wach ssh lucidlive.localdev docker exec compose_worker_1 python /code/luciddg-server/modules/django/dashboard/manage.py runtests $@
}

#runtests() {
  #vagrant ssh -- -t 'cd /vagrant/modules/django/dashboard && python manage.py runtests ' "$@"
#}

#wtest() {
  #wach "vagrant ssh -- -t 'cd /vagrant/modules/django/dashboard && python manage.py runtests '" "$@"
#}

comp() {
  cd /Users/lucid/code/luciddg-server/modules/javascript/www/common/components/$1 && ls
}

alias sty='cd /Users/lucid/code/luciddg-server/modules/styles/ && ls'
alias tem='cd /Users/lucid/code/luciddg-server/modules/templates/ && ls'
alias dja='cd /Users/lucid/code/luciddg-server/modules/django && ls'
alias dash='cd /Users/lucid/code/luciddg-server/modules/django/dashboard && ls'
alias rep='cd /Users/lucid/code/luciddg-server/modules/django/dashboard/reports && ls'
alias svg='cd /Users/lucid/code/luciddg-server/modules/www/static/images/svg-store && ls'

### fiddles
# assumptions:
## subl command to open sublime
## chrome command to open chrome

luciddg_server="/Users/lucid/code/luciddg-server";
failed_stash="$luciddg_server/.failed.tmp"
failed_tests="$luciddg_server/modules/django/dashboard/testing/.failed/current"

stashF () {
  if [ "$1" = "--apply" ]; then
    eval "cp $failed_stash $failed_tests"
  elif [ "$1" = "--stash" ]; then
    eval "cp $failed_tests $failed_stash"
  elif [ "$1" = "--print-failed" ]; then
    cat `echo $failed_tests`
  elif [ "$1" = "--print-stash" ]; then
    cat `echo $failed_stash`
  elif [ "$1" = "--edit-stash" ]; then
    eval "vim $failed_stash"
  elif [ "$1" = "--edit-failed" ]; then
    eval "vim $failed_tests"
  fi
}

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

### Easily edit vimrc
alias vimrc="vim ~/.vimrc"

# Vagrant helpers
alias vagprof="cp ~/.bash_profile ~/code/luciddg-server/.bash_profile.tmp"
alias vagssh="vagrant ssh"
alias vagant="cd modules/django/dashboard && ant"
alias up="./docker/compose/ldg-compose -c 'docker.dev.analytics.ldgrc' up"
alias lup="./docker/compose/ldg-compose up"
alias sta="sudo service apache2 stop"
alias st="sudo nginx -s stop"

dockerm() {
  docker rm --force `docker ps -qa`
}

# Common duties
alias load="/vagrant/env load_mysql" # Fresh data dump

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
alias gl='git log '
alias ga='git add '
alias gb='git branch '
alias gba='git branch -a'
alias gc='git commit '
alias gca='git commit --amend'
alias gcaf='git commit --amend --no-edit'
alias gcf='git clean -f '
alias gd='git diff '
alias gdm='git diff master'
alias gh='git hist'
alias gha='git hist --all'
alias gm='git merge'
alias gmm='git merge master'
alias grs='git reset --soft'
alias grh='git reset head'
alias grhh='git reset head --hard'
alias grv='git remote -v'
alias grau='git remote add upstream '
alias grm='git rm '
alias gmv='git mv '
alias go='git checkout '
alias gob='git checkout -b'
function gbf {
  git branch | grep $1
}
function gof {
  git branch | grep $1 | head -1 | xargs git checkout
}

function branch {
  gb | grep \* | cut -b 3-
}

function backup {
  gb | grep \* | cut -b 3- | awk '{print $1"_backup"}' | xargs git branch
}

function backupD {
  gb | grep \* | cut -b 3- | awk '{print $1"_backup"}' | xargs git branch -D
}

function backup_name {
  gb | grep \* | cut -b 3- | awk '{print $1"_backup"}'
}

alias gdb='git diff "$(backup_name)"'

alias gom='git checkout master'
alias gos='git checkout sprint'
alias gospl='git checkout sprint && git pull'
alias god='git checkout develop'
alias gobu='git checkout backup'
alias gp='git push'
alias gpo='git push origin'
alias gpos='git push origin sprint'
alias gposu='git push --set-upstream origin `branch`'
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
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias grb='git rebase'
alias grbm='git rebase master'
alias grbs='git rebase sprint'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gt='git tag '
alias gacm='git add . ; git commit -m'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '
alias gsh='git show'
alias gsl='git stash list'
alias gss='git stash save '
function gsa {
  git stash apply stash@{$1}
}
# git stash reverse
function gsr {
  git stash show "$1" -p | git apply -R
}

# git branch current
function gbc {
  br=$(git branch | ack "\* ")
  br=${br//\* /}
  echo ${br}
}

function gsq {
  git reset --soft $1 && git commit --amend
}

### Navigational Shortcuts

alias ll='ls -al'
alias dt='cd ~/Desktop && ls'
alias dw='cd ~/Downloads && ls'
alias hr='cd ~/hackreactor && ls'
alias toy='cd ~/hackreactor/toy-problems && ls'
alias proj='cd ~/code/projects && ls'
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

acki () {
  ack -i "$1" .
}

agi () {
  ag -i "$@" .
}

#agi () {
  #ag -i "$1" .
#}

class () {
  ag -i "class $1"
}

def () {
  ag -i "def $1"
}

imp () {
  ag -i "import.*$1"
}


fd () {
  find . -name "$1"
}

fdi () {
  find . -iname "$1"
}

fdd () {
  find . -type d -name "$1"
}

fddi () {
  find . -type d -iname "$1"
}

db () {
  cp "$1" ~/Dropbox/Brian\'s\ MacBook\ Sync/
}

chrome () {
  open -a "Google Chrome" "$1"
}

safari () {
  open -a "Safari" "$1"
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

alias psg='ps | grep '

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda2 5.0.1 installer
export PATH="/Users/home/anaconda2/bin:$PATH"

# don't update homebrew on every brew install
export HOMEBREW_NO_AUTO_UPDATE=1
