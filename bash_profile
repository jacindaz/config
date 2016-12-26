export PATH=~/bin:$PATH:$GOPATH/bin

# Andrew's bash prompt:
# function store_exit_code() {
#   EXIT_CODE=$?
# }

# function exit_code() {
#   [[ "$EXIT_CODE" = "0" ]] && return
#   echo -n "$EXIT_CODE "
# }

# PROMPT_COMMAND="store_exit_code; $PROMPT_COMMAND"

# export PS1="\[\033[1;34m\][\$(date +%H:%M)] \[\033[1;36m\]\u@\h \w \$(git_branch_string)\[\033[1;31m\]\$(exit_code)\[\033[1;36m\]$\[\033[0m\] "

print_before_the_prompt () {
    git_branch="$(git branch 2> /dev/null| grep \*)"
    go_version="$(go version)"

    # -z: checks is_empty_string?, returns boolean
    # -z "" => true
    # -z "some string" => false

    rbenv_local_version="$(rbenv local 2>/dev/null)"
    rbenv_global_version="$(rbenv global 2>/dev/null)"

    # if rbenv local doesn't exist, try global
    if [[ -z "$rbenv_local_version" ]]; then
        ruby_version="$rbenv_global_version"
    else
        ruby_version="$rbenv_local_version"
    fi

    # debugging print statements
    # printf "\nrbenv_global_version: %s\n" "$rbenv_global_version"
    # printf "rbenv_local_version: %s\n" "$rbenv_local_version"

    if [[ "$PWD" =~ "go_workspace" ]]; then

        if [[ -z "$git_branch" ]]; then
            printf "\n$txtgrn%s $bldcyn(%s): $txtblu%s \n$bldred%s $bldpur%s \n$txtrst$txt_navy" "$USER" "$go_version" "$PWD" "git branch => "  "<git not configured>"
        else
            printf "\n$txtgrn%s $bldcyn(%s): $txtblu%s \n$bldred%s $bldpur%s \n$txtrst$txt_navy" "$USER" "$go_version" "$PWD" "git branch => "  "$git_branch"
        fi

    elif [[ -z "$git_branch" ]] && [[ -z "$ruby_version" ]]; then
        # printf "\nNeither git branch nor ruby version if clause.\n"
        printf "\n$txtgrn%s $bldcyn(rbenv not installed): $txt_navy%s \n$bld_navy" "$USER" "$PWD"

    elif [[ ! -z "$git_branch" ]] && [[ -z "$rbenv_global_version" ]]; then
        # printf "\nGit branch but no ruby version if clause.\n"
        printf "\n$txtgrn%s $bldcyn(rbenv not installed): $txtblu%s \n$bldred%s $bldpur%s \n$txtrst$txt_navy" "$USER" "$PWD" "git branch => "  "$git_branch"

    elif [[ -z "$git_branch" ]] && [[ ! -z "$ruby_version" ]]; then
        # printf "\nRuby version but no git branch if clause.\n"
        printf "\n$txtgrn%s $bldcyn(ruby %s): $txtblu%s\n$txtrst$txt_navy" "$USER" "$ruby_version" "$PWD"

    else
        # printf "\nGit branch AND ruby version exists if clause.\n"
        printf "\n$txtgrn%s $bldcyn(ruby %s): $txtblu%s \n$bldred%s $bldpur%s \n$txtrst$txt_navy" "$USER" "$ruby_version" "$PWD" "git branch => "  "$git_branch"
    fi
}

PROMPT_COMMAND=print_before_the_prompt
PS1='>>>> '

export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
export BUNDLER_EDITOR='subl -w'
export GOPATH=$HOME/Documents/jacinda/go_workspace

export ARCHFLAGS="-arch x86_64"
eval "$(rbenv init -)"

alias jz='cd ~/Documents/jacinda'
alias lu='cd ~/Documents/learnup'
alias master='cd ~/Documents/learnup/learnup_master'
alias etlgo='cd ~/Documents/jacinda/go_workspace/src/github.com/jacinda/etl'
alias gowrk='cd ~/Documents/jacinda/go_workspace'
alias dw='pgcli -d mongoprod -p 5439 -h fivetran-redshift.cudfn3rzdvdf.us-east-1.redshift.amazonaws.com --user jacinda'
alias fp='cd /Users/jacindazhong/Documents/jacinda/friendly-potato'

alias openemail='open -a Google\ Chrome https://mail.google.com/mail/u/1/#inbox https://calendar.google.com/calendar/b/1/render?tab=mc#main_7 https://mail.google.com/mail/u/0/#inbox https://calendar.google.com/calendar/render?tab=mc#main_7'

# Git
alias gas='git add . && git status'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gdno='git diff --name-only --diff-filter=U'
alias gpoh='git push origin head'
alias branchdiff='git config --global --add alias.branchdiff-files "log --left-right --cherry-pick —stat"'
alias gpr='git pull --rebase'
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --graph'
alias gplr='git pull --rebase'
alias gbd='git branch -D'
alias gb='git branch'
alias gco='git checkout'
alias gr='git reset'
alias ga='git add'
alias gdc='git diff --cached'
alias gd='git diff'
alias sshprodrep='ssh ubuntu@54.204.18.255'
# ADD THIS LATER, ALIAS TO BUNDLER GITHUB CLONE
# alias dbundle='BUNDLE_DISABLE_POSTIT=1 ruby -I /path/to/bundler/lib /path/to/bundler/exe/bundle'

# Rails
alias rcs='rails console --sandbox'
alias rs='rails server'
alias rc='rails console'
alias brs='bundle && rails server'
alias hr='heroku run'
alias dcms='rake db:drop && rake db:create && rake db:migrate && rake db:seed'
alias be='bundle exec'

# LearnUp
alias import_prod_and_crr=''

bld_navy='\e[1;18m'
txt_navy='\e[18m'
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

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH


function printsysinfo() {
    /usr/sbin/system_profiler SPHardwareDataType
}
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
