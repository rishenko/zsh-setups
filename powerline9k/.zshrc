start_time="$(date +%s)"

# Antigen — A zsh plugin manager
export ANTIGEN_DEFAULT_REPO_URL=https://github.com/sharat87/oh-my-zsh.git
source ~/Projects/zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo declared above.
antigen bundles <<EOBUNDLES
lein
pip
gradle
mix
brew
history
npm
node
postgres
python
# tmux
vundle
vi-mode
Tarrasch/zsh-autoenv

# Guess what to install when running an unknown command.
command-not-found

# The heroku tool helper plugin.
heroku

# Helper for extracting different types of archives.
extract

# Help working with version control systems.
svn
git
github

# nicoulaj's moar completion files for zsh
zsh-users/zsh-completions src

# ZSH port of Fish shell's history search feature.
zsh-users/zsh-history-substring-search

# Syntax highlighting bundle.
zsh-users/zsh-syntax-highlighting

EOBUNDLES

# Load the prompt theme.

POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="068"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="038"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_BACKGROUND="038"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"

POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\uf055'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\uf059'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\uf06a'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\uf0ab'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\uf0aa'
POWERLEVEL9K_VCS_BRANCH_ICON=''

POWERLEVEL9K_TIME_BACKGROUND="250"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}" # \uf017

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{247}\uF061%f "

zsh_wifi_signal() {
    local wifiInfo="$(airport -I | grep agrCtlRSSI)"
    local output="${wifiInfo[(ws|: |)2]}"
    let "output = output + 100"
    local color='%F{yellow}'
    [[ $output -gt 40 ]] && color='%F{green}' #40
    [[ $output -lt 30 ]] && color='%F{red}' #30
    echo -n "%{$color%}$output%% \uf1eb%"
}
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="black"

POWERLEVEL9K_BATTERY_ICON='\uf1c0'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs_joined battery custom_wifi_signal_joined)

antigen theme bhilburn/powerlevel9k powerlevel9k

# Vim like bindings plugin. Need to run after theme, so mode indicator
# can be set, if the theme didn't already set it.
antigen-bundle sharat87/zsh-vim-mode
ZSH_VIM_MODE_NORMAL_MAP=^k

# TELL ANTIGEN WE'RE DONE
antigen apply

# Automatically list directory contents on `cd`.
auto-ls () { 
    emulate -L zsh
    ls -F; 
}
chpwd_functions=( auto-ls $chpwd_functions )

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### ALIASES ###
alias vi='vim'
alias pih='ssh pi@192.168.1.68'
alias pir='ssh pi@192.168.1.81'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias pip3-upgrade="pip3 list --outdated | cut -d' ' -f1 | xargs pip3 install --upgrade"
alias mvn-std="mvn clean install -DskipTests -T 1.5C"

alias clrtest='for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"'


### Other Scripts To Run At End ###
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

