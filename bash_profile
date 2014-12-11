export PATH=~/bin:$PATH

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

print_before_the_prompt () {
    git_branch="$(git branch 2> /dev/null| grep \*)"
    if [[ -z "$git_branch" ]]; then
        printf "$txtgrn%s: $bldblu%s $bldpur%s\n$txtrst" "$USER" "$PWD"
    else
        printf "$txtgrn%s: $bldblu%s $bldpur%s\n$txtrst" "$USER" "$PWD" "(git $git_branch)"
    fi
}

PROMPT_COMMAND=print_before_the_prompt
PS1='->'

export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
export ARCHFLAGS="-arch x86_64"
eval "$(rbenv init -)"

# CD into a Directory
alias bp='vim ~/.bash_profile'
alias jz='cd ~/Documents/jacinda'
alias plmsite='cd ~/src/plm'
alias edx='cd ~/Documents/jacinda/6\.00\.2x'
alias testfiles='cd ~/Documents/test_files'
alias bugs='cd ~/src/plm/bugs'

# Git
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git pull'
alias gf='git fetch'
alias gfa='git fetch --all'

# Rails
alias rcs='rails console --sandbox'
alias rs='rails server'
alias brs='bundle && rails server'

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
