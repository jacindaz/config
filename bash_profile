source ~/.bashrc
source ~/.cloverhealthrc

print_before_the_prompt () {
    git_branch="$(git branch 2> /dev/null| grep \*)"

    # -z: checks is_empty_string?, returns boolean
    # -z "" => true
    # -z "some string" => false

    python_version="$(python -V 2>/dev/null)"

    if [[ -z "$git_branch" ]] && [[ -z "$python_version" ]]; then
        # printf "\nNeither git branch nor ruby version if clause.\n"
        printf "\n$txtgrn%s $bldcyn(python not installed): $txt_navy%s \n$bld_navy" "$USER" "$PWD"

    elif [[ -z "$git_branch" ]] && [[ ! -z "$python_version" ]]; then
        # printf "\nRuby version but no git branch if clause.\n"
        printf "\n$txtgrn%s $bldcyn(%s): $txtblu%s\n$txtrst$txt_navy" "$USER" "$python_version" "$PWD"

    else
        # printf "\nGit branch AND ruby version exists if clause.\n"
        printf "\n$txtgrn%s $bldcyn(%s): $txtblu%s \n$bldred%s $bldpur%s \n$txtrst$txt_navy" "$USER" "$python_version" "$PWD" "git branch => "  "$git_branch"
    fi
}

PROMPT_COMMAND="print_before_the_prompt; jacinda_airflow"
PS1='>>>> '

# Git
alias gas='git add . && git status'
alias gs='git status'
alias gc='git commit'
alias gdno='git diff --name-only --diff-filter=U'
alias gpoh='git push origin head'
alias gplr='git pull --rebase'
alias gb='git branch'
alias gco='git checkout'
alias gr='git reset'
alias ga='git add'
alias gdc='git diff --cached'
alias gd='git diff'

alias clp='cd /Users/jacinda.zhong/Documents/clover_pipeline'
alias clm='cd /Users/jacinda.zhong/Documents/clover-monitoring'
alias db='cd /Users/jacinda.zhong/Documents/data-bodega'
alias clover='cd /Users/jacinda.zhong/Documents/'
alias jz='cd /Users/jacinda.zhong/Documents/jacinda'

alias bart='cd /Users/jacinda.zhong/Documents/jacinda/jacinda_airflow'
alias config='cd /Users/jacinda.zhong/Documents/jacinda/config'

# This tells the ls command to always use colored output,
# making it easier to tell the different types of things it's listing.
export CLICOLOR=1

# The Bash command line stores a history of commands you've typed, which is useful
# -- you can search through it to find a command you once used but forgot
# (you can press the up-arrow key at a command prompt to go through your command
# history one item at a time, or press Ctrl+r to trigger a search). However, if
# you type certain commands over and over (like ls or git status), they generate
# one history entry each time you type them. The above setting will prune out duplicate entries,
# making it easier to go back through your command history.
export HISTCONTROL=ignoreboth:erasedups

export VISUAL=vim


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
bldblk='\e[1;30m' # Black - Bold  # txtblk='\e[0;30m'
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


export JACINDA_AIRFLOW=/Users/jacinda.zhong/Documents/jacinda/jacinda_airflow
export JACINDA_AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://jacinda.zhong@localhost:5432/sf_bart
jacinda_airflow() {
  if [ "$(pwd)" = '/Users/jacinda.zhong/Documents/jacinda/jacinda_airflow' ]; then
    if [ ${AIRFLOW_HOME} != ${JACINDA_AIRFLOW}  ]; then
      echo "Previous AIRFLOW_HOME: $AIRFLOW_HOME"
      export AIRFLOW_HOME=$JACINDA_AIRFLOW
      echo "Swapped! AIRFLOW_HOME is now: $AIRFLOW_HOME"

      echo
      echo "Previous AIRFLOW__CORE__SQL_ALCHEMY_CONN: $AIRFLOW__CORE__SQL_ALCHEMY_CONN"
      export AIRFLOW__CORE__SQL_ALCHEMY_CONN=$JACINDA_AIRFLOW__CORE__SQL_ALCHEMY_CONN
      echo "Swapped! AIRFLOW__CORE__SQL_ALCHEMY_CONN is now: $AIRFLOW__CORE__SQL_ALCHEMY_CONN"
    fi
  fi
}

cd '/Users/jacinda.zhong/Documents/clover_pipeline'
