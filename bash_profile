export PATH=~/bin:$PATH:$GOPATH/bin

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

print_before_the_prompt () {
    git_repo="$(git branch 2> /dev/null| grep \*)"
    git_branch="$(git branch 2> /dev/null| grep \*)"
    ruby_version="$(rbenv local)"

    # neither git branch nor ruby version
    if [[ -z "$git_branch" ]] && [[ -z "$ruby_version" ]]; then
        printf "\n$txtgrn%s $bldcyn(rbenv not installed): $txtblu%s \n$bldpur%s" "$USER" "$PWD"

    # git branch but no ruby version
    elif [[ ! -z "$git_branch" ]] && [[ -z "$ruby_version" ]]; then
        printf "\n$txtgrn%s $bldcyn(rbenv not installed): $txtblu%s \n$bldred%s $bldpur%s \n$txtrst" "$USER" "$PWD" "git branch => "  "$git_branch"

    elif [[ -z "$git_branch" ]] && [[ ! -z "$ruby_version" ]]; then
    # ruby version but no git branch
        printf "\n$txtgrn%s $bldcyn(ruby %s): $txtblu%s\n$txtrst" "$USER" "$ruby_version" "$PWD"

    # if there is a git branch and a ruby version
    else
        printf "\n$txtgrn%s $bldcyn(ruby %s): $txtblu%s \n$bldred%s $bldpur%s \n$txtrst" "$USER" "$ruby_version" "$PWD" "git branch => "  "$git_branch"
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
export GOPATH=$HOME/Documents/jacinda/gobridge

export ARCHFLAGS="-arch x86_64"
eval "$(rbenv init -)"
eval "$(docker-machine env default)"

# CD into a Directory
alias bp='vim ~/.bash_profile'
alias jz='cd ~/Documents/jacinda'
alias plmsite='cd ~/src/plm'
alias ore='cd ~/src/open-pro'
alias rp='cd ~/src/research_portal'
alias dw2='cd ~/src/data-warehouse-2'

alias master='cd ~/src/plm/master'
alias bugs='cd ~/src/plm/bugs'
alias gxd='gitx --diff'
alias current='cd ~/src/plm/current'

alias openemail='open -a Google\ Chrome https://mail.google.com/mail/u/0/#inbox https://calendar.google.com/calendar/render?tab=mc#main_7 https://patientslikeme.slack.com/messages/thepit/ https://mail.google.com/mail/u/1/#inbox https://calendar.google.com/calendar/b/1/render?tab=mc#main_7 '

# Git
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git pull'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gdno='git diff --name-only --diff-filter=U'
alias gpoh='git push origin head'
alias branchdiff='git config --global --add alias.branchdiff-files "log --left-right --cherry-pick —stat"'
alias gpr='git pull --rebase'
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --graph'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gas='git add . && git status'
alias gbd='git branch -D'
alias gb='git branch'
alias gpu='git push'
alias gch='git checkout HEAD'
alias gco='git checkout'
alias gr='git reset'
alias ga='git add'
alias gdhh='git diff HEAD^ HEAD'
alias gdc='git diff --cached'
alias gd='git diff'

# ADD THIS LATER, ALIAS TO BUNDLER GITHUB CLONE
# alias dbundle='BUNDLE_DISABLE_POSTIT=1 ruby -I /path/to/bundler/lib /path/to/bundler/exe/bundle'

# Rails
alias rcs='rails console --sandbox'
alias rs='rails server'
alias rc='rails console'
alias brs='bundle && rails server'
alias hr='heroku run'
alias dcms='rake db:drop && rake db:create && rake db:migrate && rake db:seed'

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

function newetldir () {
    cd /Users/jacindazhong/src/research_platform/
    git clone git@github.com:patientslikeme/data-warehouse-2.git $1
    cd /Users/jacindazhong/src/research_platform/${1}

    cp config/application.yml.sample config/application.yml
    cp config/database.yml.sample config/database.yml
    git checkout -b $1
}

function downloadetldb () {
    echo "Remember to connect to dallas VPN..."
    NOW=$(date +'%Y%m%d')

    SOURCE_DEVELOPER_DB="developer_db"
    DEV_DB_DUMPING_GROUND="db-dumps/${SOURCE_DEVELOPER_DB}_${NOW}.pgdump"

    echo "Grabbing ${SOURCE_DEVELOPER_DB}.pgdump, and saving to ${DEV_DB_DUMPING_GROUND}"
    rsync -P --rsh=ssh "source database dump" ~/${DEV_DB_DUMPING_GROUND}

    SOURCE_PATIENT_BASE_SAMPLE="patient_base_sanitized.pgdump"
    PB_SANITIZED_DUMPING_GROUND="db-dumps/${SOURCE_PATIENT_BASE_SAMPLE}_${NOW}"

    echo "Grabbing ${SOURCE_PATIENT_BASE_SAMPLE}.pgdump, and saving to ${PB_SANITIZED_DUMPING_GROUND}"
    rsync -P --rsh=ssh "source data dump" ~/${PB_SANITIZED_DUMPING_GROUND}
}

function restoreetldb() {
    NOW=$(date +'%Y%m13')
    PATIENT_BASE="patient_base_${NOW}"

    createdb $PATIENT_BASE
    echo "Created ${PATIENT_BASE} database........."

    # FOR FUN - HOW TO IMPLEMENT SOME KIND OF PROGRESS INDICATOR HERE ???
    pg_restore -d $PATIENT_BASE -j6 ~/"db-dumps/developer_db_${NOW}.pgdump"
    echo "Done restoring developer_db........."

    pg_restore -d $PATIENT_BASE -j6 ~/"db-dumps/patient_base_sanitized_db_${NOW}.pgdump"
    echo "Done restoring ${PATIENT_BASE}........."
}

function resetplmdb {
    echo "NOTE: make sure to run this in a rails repo\n"

    echo "Dropping plm_current..."
    dropdb -U postgres plm_current

    echo "Creating plm_current..."
    createdb -U postgres -T plm_current_clean_snapshot plm_current

    echo "rake db:migrate..."
    bundle exec rake db:migrate

    echo "Creating users..."
    bundle exec rake plm:users:create_all
  }

function fetchplmdb {
    echo "Fetching latest dev db to ~/db_dumps ..."
    rsync -P --rsh=ssh "source database dump"p ~/db-dumps/plm_current_clean_snapshot.pgdump.$(date +%Y%m%d)

    echo "Dropping plm_current..."
    dropdb plm_current

    echo "Creating plm_current..."
    createdb plm_current

    echo "Restoring plm_current from pgdump..."
    pg_restore -d plm_current ~/db-dumps/plm_current_clean_snapshot.pgdump.$(date +%Y%m%d) -j6

    echo "Pull in plm-site current"
    cd /Users/jacindazhong/src/plm/current
    git checkout current
    git pull --rebase

    echo "Running migrations..."
    bundle install
    bundle exec rake db:migrate
}


function printsysinfo() {
    /usr/sbin/system_profiler SPHardwareDataType
}
