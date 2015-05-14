export PATH=~/bin:$PATH

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

print_before_the_prompt () {
    git_branch="$(git branch 2> /dev/null| grep \*)"
    if [[ -z "$git_branch" ]]; then
        printf "$txtgrn%s: $bldblu%s $bldpur%s\n$txtrst" "$USER" "$PWD"
    else
        printf "$txtgrn%s: $bldblu%s $undcyn%s $bldpur%s \n$txtrst" "$USER" "$PWD" "(git)"  "$git_branch"
    fi
}

PROMPT_COMMAND=print_before_the_prompt
PS1='>>> '

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
alias rp='cd ~/src/research-portal'
alias gxd='gitx --diff'

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
alias gas='git add . && git status'
alias gbd='git branch -D'
alias gb='git branch'
alias gpu='git push'
alias gch='git checkout HEAD'
alias gco='git checkout'
alias gr='git reset'
alias ga='git add'
alias gdhh='git diff HEAD^ HEAD'
alias gplr='git pull --rebase'

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

# Directory Navigation work
alias edx='cd Documents/Programming/Courses/edX\ 6.002x\ Intro\ to\ Computational\ Thinking\ and\ Data\ Science'
alias zsh='vim ~/.oh-my-zsh/lib/aliases.zsh'
alias zsh_dir='vim ~/.oh-my-zsh/lib/aliases.zsh'
alias courses='cd ~/Documents/Programming/Courses'
alias sublpkg='cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages'
alias projects='cd ~/Documents/Programming/Projects'
alias plm='cd ~/Documents/PatientsLikeMe/plm-website'

# Directory Navigation home
alias edx='cd Documents/Programming/Courses/edX\ 6.002x\ Intro\ to\ Computational\ Thinking\ and\ Data\ Science'
alias zsh='vim ~/.oh-my-zsh/lib/aliases.zsh'
alias zsh_dir='vim ~/.oh-my-zsh/lib/aliases.zsh'
alias courses='cd ~/Documents/Programming/Courses'
alias sublpkg='cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages'
alias projects='cd ~/Documents/Programming/Projects'
alias plm='cd ~/Documents/PatientsLikeMe/plm-website'

# Mac Helpers
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

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
