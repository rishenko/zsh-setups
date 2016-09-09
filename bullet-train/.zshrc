start_time="$(date +%s)"

# Antigen — A zsh plugin manager
export ANTIGEN_DEFAULT_REPO_URL=https://github.com/sharat87/oh-my-zsh.git
source ~/SmashingBoxes/zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo declared above.
antigen bundles <<EOBUNDLES

lein
pip
#gradle
mix
brew
history
npm
node
postgres
python
vundle
vi-mode


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

# My own lightweight alternative to virtualenvwrapper.
#~/labs/virtualenvman --no-local-clone

# ZSH port of Fish shell's history search feature.
zsh-users/zsh-history-substring-search

# Syntax highlighting bundle.
zsh-users/zsh-syntax-highlighting

EOBUNDLES

# Tracks your most used directories, based on 'frecency'. And its accompanying
# setup code.
antigen bundle rupa/z
add-zsh-hook precmd _z_precmd
function _z_precmd {
    _z --add "$PWD"
}

# A pip apps functionality, basing on antigen.
# antigen bundle ~/labs/pip-app --no-local-clone

# Load the prompt theme.
# antigen theme prose
# antigen theme sindresorhus/pure pure
# antigen bundle ~/labs/pure-zsh --no-local-clone
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

BULLETTRAIN_PROMPT_ORDER=(
  #time
  #status
  #context
  #dir
  #git
  #exec_time

  time
  status
  custom
  context
  dir
  #perl
  virtualenv
  #nvm
  #go
  git
  #hg
  cmd_exec_time
)

BULLETTRAIN_DIR_BG="blue"
BULLETTRAIN_DIR_FG="white"
BULLETTRAIN_DIR_EXTENDED=0

BULLETTRAIN_EXEC_TIME_SHOW=true

BULLETTRAIN_PROMPT_CHAR=">"

BULLETTRAIN_CONTEXT_SHOW=true
BULLETTRAIN_CONTEXT_HOSTNAME="%m"
BULLETTRAIN_CONTEXT_DEFAULT_USER=""
BULLETTRAIN_IS_SSH_CLIENT=true

# Vim like bindings plugin. Need to run after theme, so mode indicator
# can be set, if the theme didn't already set it.
antigen-bundle sharat87/zsh-vim-mode
ZSH_VIM_MODE_NORMAL_MAP=^k
#antigen bundle ~/labs/zsh-vim-mode --no-local-clone

# Tell Antigen that we're done.
antigen apply

# Automatically list directory contents on `cd`.
auto-ls () { ls -F; }
chpwd_functions=( auto-ls $chpwd_functions )

# wohwohwohowhohohoho!
# fortune -s -n 300 | cowsay | lolcat

# end_time="$(date +%s)"
# echo .zshrc: $((end_time - start_time)) seconds

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### ALIASES ###
alias vi='vim'
alias pih='ssh pi@192.168.1.68'
