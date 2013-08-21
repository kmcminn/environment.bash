# bits taken from https://gist.github.com/pmarreck/2046249

# Move /usr/local/bin to the front of PATH by subbing it out and prepending
export PATH=/usr/local/bin:${PATH/\/usr\/local\/bin:/}:~/bin
 
# stop checking for mail
unset MAILCHECK
 
# command history tweaks
shopt -s histappend
export PROMPT_COMMAND='history -a'
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:[bf]g:exit"
shopt -s cmdhist
 
set bell-style visible
 
# Pager config (ex., for git diff output)
#E=quit at first EOF
#Q=no bell
#R=pass through raw ansi so colors work
#X=no termcap init
export LESS="-EQRX"
 
# tweak to get gcc to not use the LLVM version (because ruby gems hate it for now)
export CC=/usr/bin/gcc-4.2
 
####### Aliases
#what most people want from od (hexdump)
alias hd='od -Ax -tx1z -v'
#just list directories
alias lld='ls -lUd */'
alias .='pwd'
alias ..='cd ..'
alias cd..='cd ..'
alias cdwd='cd `pwd`'
alias cwd='echo $cwd'
# alias files='find \!:1 -type f -print'      # files x => list files in x
# alias ff='find . -name \!:1 -print'      # ff x => find file named x
alias line='sed -n '\''\!:1 p'\'' \!:2'    # line 5 file => show line 5 of file
alias l='CLICOLOR_FORCE=1 ls -lGaph'

ll() {
    CLICOLOR_FORCE=1 ls -lGaph $1 | less -R
}

alias rehash='source ~/.profile'
alias word='grep \!* /usr/share/dict/web2' # Grep thru dictionary
#alias tophog='top -ocpu -s 3'
#alias wordcount=(cat \!* | tr -s '\''  .,;:?\!()[]"'\'' '\''\012'\'' |' \
#                'cat -n | tail -1 | awk '\''{print $1}'\'')' # Histogram words
 
# which hack, so it also shows defined aliases and functions that match
which() {
  which_out=`/usr/bin/which $@`;
  if [ ! -z "$which_out" ]; then
    echo "$which_out";
  else
    type "$@";
  fi
}
 
# Sexy man pages. Opens a postscript version in Preview.app
pman() { man -t "$@" | open -f -a Preview; }
 
# Who is holding open this damn port or file??
# usage: portopen 3000
function portopen {
	sudo lsof -P -i ":${1}"
}
function fileopen {
	sudo lsof "${1}"
}
 
# Passenger shortcuts
alias passenger-restart='work; touch tmp/restart.txt'
 
# GIT shortcuts
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -a -v'
alias gd='git diff | mate'
alias gl='git pull'
alias gp='git push'
alias gpp='git pull;git push'
alias gppd='git pull origin dev;git push origin dev'
alias gst='git status'
alias ga='git add . -v'
alias gs='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gitrollback='git reset --hard; git clean -f'
alias gunadd='git reset HEAD'
 
# git functions
function rbr {
 git checkout $1;
 git pull origin $1;
 git checkout $2;
 git rebase $1;
}
 
function mbr {
 git checkout $1;
 git merge $2
 git push origin $1;
 git checkout $2;
}
 
# change the title of the OS X terminal window
# See http://hints.macworld.com/article.php?story=20031015173932306
export PROMPT_COMMAND='echo -ne "\033]0;$@\007"'
 
# Color constants
NO_COLOR='\e[0m' #disable colors
TXTBLK='\e[0;30m' # Black - Regular
TXTRED='\e[0;31m' # Red
TXTGRN='\e[0;32m' # Green
TXTYLW='\e[0;33m' # Yellow
TXTBLU='\e[0;34m' # Blue
TXTPUR='\e[0;35m' # Purple
TXTCYN='\e[0;36m' # Cyan
TXTWHT='\e[0;37m' # White
BLDBLK='\e[1;30m' # Black - Bold
BLDRED='\e[1;31m' # Red
BLDGRN='\e[1;32m' # Green
BLDYLW='\e[1;33m' # Yellow
BLDBLU='\e[1;34m' # Blue
BLDPUR='\e[1;35m' # Purple
BLDCYN='\e[1;36m' # Cyan
BLDWHT='\e[1;37m' # White
UNDBLK='\e[4;30m' # Black - Underline
UNDRED='\e[4;31m' # Red
UNDGRN='\e[4;32m' # Green
UNDYLW='\e[4;33m' # Yellow
UNDBLU='\e[4;34m' # Blue
UNDPUR='\e[4;35m' # Purple
UNDCYN='\e[4;36m' # Cyan
UNDWHT='\e[4;37m' # White
BAKBLK='\e[40m'   # Black - Background
BAKRED='\e[41m'   # Red
BAKGRN='\e[42m'   # Green
BAKYLW='\e[43m'   # Yellow
BAKBLU='\e[44m'   # Blue
BAKPUR='\e[45m'   # Purple
BAKCYN='\e[46m'   # Cyan
BAKWHT='\e[47m'   # White
TXTRST='\e[0m'    # Text Reset
 
BRIGHT_RED="\[\033[1;31m\]"
DULL_WHITE="\[\033[0;37m\]"
BRIGHT_WHITE="\[\033[1;37m\]"
 
# git functions and extra config
source ~/.bash_git1
source ~/.bash_git2
 
# Command prompt config
PS1="\[$TXTCYN\]\u\[$TXTWHT\]@\[$TXTGRN\]\H\[$TXTWHT\]:\[$TXTYLW\]\w ${BRIGHT_RED}\$(parse_git_branch)\$\[$NO_COLOR\] "
# export PS1="\W @ \h (\u) \$ "
 
# export EDITOR=mate
export EDITOR=vim

# java home for osx
export JAVA_HOME=$(/usr/libexec/java_home)
 
# RVM integration
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
