export PATH=~/bin:$PATH

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

print_before_the_prompt () {
    git_repo="$(git branch 2> /dev/null| grep \*)"
    git_branch="$(git branch 2> /dev/null| grep \*)"
    if [[ -z "$git_branch" ]]; then
        printf "\n$txtgrn%s: $txtblu%s $bldpur%s\n$txtrst" "$USER" "$PWD"
    else
        printf "\n$txtgrn%s: $txtblu%s \n$bldred%s $bldpur%s $txtrst\n" "$USER" "$PWD" "git branch => "  "$git_branch"
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

export ARCHFLAGS="-arch x86_64"
eval "$(rbenv init -)"
eval "$(docker-machine env default)"

# CD into a Directory
alias cdgb='cd ~/Documents/gitbook'
alias bp='vim ~/.bash_profile'
alias jz='cd ~/Documents/jacinda'
alias plmsite='cd ~/src/plm'
alias tb='cd ~/src/tech-blog'
alias ore='cd ~/src/open-pro'
alias italia='cd ~/Documents/jacinda/italia'
alias cdrails='cd ~/Documents/PatientsLikeMe/rails'
alias storyboard='cd ~/Documents/PatientsLikeMe/HKTutorialBase'
alias rp='cd ~/src/research_portal'
alias dw2='cd ~/src/data-warehouse-2'

alias master='cd ~/src/plm/master'
alias bugs='cd ~/src/plm/bugs'
alias quick_hits='cd ~/src/plm/quick_hits'
alias gxd='gitx --diff'
alias current='cd ~/src/plm/current'

alias ee='cd /Users/jacindazhong/Documents/jacinda/usr/exercism_exercises'
alias openemail='open -a Google\ Chrome -n https://mail.google.com/mail/u/0/#inbox https://calendar.google.com/calendar/render?tab=mc#main_7 https://patientslikeme.slack.com/messages/thepit/ https://mail.google.com/mail/u/1/#inbox https://calendar.google.com/calendar/b/1/render?tab=mc#main_7 '

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

# Rails
alias rcs='rails console --sandbox'
alias rs='rails server'
alias rc='rails console'
alias brs='bundle && rails server'
alias hr='heroku run'
alias rdm='rake db:migrate'
alias dcms='rake db:drop && rake db:create && rake db:migrate && rake db:seed'
alias rgm='rails g migration'
alias rds='rake db:seed'
alias rdr='rake db:rollback'
alias zc='zeus console'
alias zs='zeus server'
alias zst='zeus start'

#Xcode
alias xcode="open *.xcodeproj"

# Temporary aliases
alias weight='cd ~/src/plm/weight_do_not_publicly_display'
alias 8750='cd ~/src/plm/8750_dana_farber_create_two_urls_and_send_chemo_start_date_to_et'
alias 8506='cd ~/src/plm/8506_clinical_trial_tool_search_sponsor_field'

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
