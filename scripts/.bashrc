if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Load Git functions
source ~/scripts/git-prompt.sh

# Syntactic sugar for ANSI escape sequences
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

export VISUAL=vim
export EDITOR="$VISUAL"

# Prompt variables
PROMPT_BEFORE="$txtcyn\u@\h $txtwht\w$txtrst"
PROMPT_AFTER="\\n\\\$ "

# Prompt command
PROMPT_COMMAND='__git_ps1 "$PROMPT_BEFORE" "$PROMPT_AFTER"'

# Git prompt features (read ~/.git-prompt.sh for reference)
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS="true"
export JAVA_HOME=/opt/jdk1.8.0_71
export GOPATH=~/dev/go
export PATH=$PATH:~/dev/go/bin

alias nodedb='node --inspect --debug-brk'

function vif() {
 find . -name $1 -exec vi {} \;
}

function gif() {

 if [ $# -lt 2 ]; then
   echo "Illegal number of parameters"
   return 1
 fi

 REST=${@:1:$(($# - 1))}
 FILENAME=${@:$#}

 find . -name $FILENAME -exec echo -n -e "\033]0;git $REST {}\007" \; -exec git $REST {} \;

 echo -n -e "\033]0;/bin/bash\007"
}

complete -o default -o nospace -F _git gif
