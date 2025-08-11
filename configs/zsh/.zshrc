if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi
if [ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
  . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$HOME/.zcompdump"

if ! command -v node >/dev/null 2>&1; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
fi

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="afowler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode zsh-autosuggestions zsh-syntax-highlighting) 

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Pushes current git branch and sets upstream tracking
git-pushup() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  
  if [ -z "$branch" ]; then
    echo "Error: Not in a git repository or no branch checked out"
    return 1
  fi
  
  echo "Pushing $branch to origin and setting upstream..."
  git push -u origin $branch
}

#Repositories
alias dot="cd ~/.dotfiles/"
alias yo="cd ~/Repositories/skroutz/yogurt/"

# General
alias ex='exit'
alias cl='clear'
alias nv='nvim'

# FzF
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias vf='nvim $(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")'
alias fs='cd $(git rev-parse --show-toplevel 2>/dev/null || echo ".") && rg --color=always --line-number --no-heading --smart-case "" | fzf --ansi --delimiter : --preview "bat --color=always --style=numbers {1} --highlight-line {2}" --preview-window +{2}-10'
alias vs='cd $(git rev-parse --show-toplevel 2>/dev/null || echo ".") && nvim $(rg --color=always --line-number --no-heading --smart-case "" | fzf --ansi --delimiter : --preview "bat --color=always --style=numbers {1} --highlight-line {2}" --preview-window +{2}-10 | awk -F ":" "{print \"+\"\$2\" \"\$1}")'

# Git
alias ga='git add'
alias gaa='git add --all'

alias gb='git branch'
alias gba='git branch --all'

alias gc='git commit'
alias gcf='git commit --fixup'
alias gcfh='git commit --fixup HEAD'
alias gcmsg='git commit --message'

alias gchp='git cherry-pick'

alias gd='git diff'
alias gds='git diff --staged'

alias gfa='git fetch --all'

alias gl='git log'

alias gp='git push'
alias gpu='git-pushup'

alias gpl='git pull'

alias gria='git rebase -i --autosquash'

alias gpr='git gc --prune=now'

alias gst='git status'

alias gsw='git switch'
alias gswc='git switch --create'

alias delete_merged_branches='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'

# Skroutz
alias stg="ssh -T wowbagger@vms.skroutz.gr"
alias rconsole="ssh dev.yogurt.devspace -t 'bundle exec rails console'"
alias rdebug="bundle exec rdbg -A 3001 -n"
alias rlogs="devspace logs -f -c webserver"
alias rlogsall="devspace logs -f"
alias rssh="ssh dev.yogurt.devspace"
alias rstop="devspace run-pipeline stop-dev"
alias rrestart="devspace run-pipeline stop-dev && devspace dev"
alias rbi="ssh dev.yogurt.devspace -t 'bundle install'"
alias ryi="ssh dev.yogurt.devspace -t 'yarn install'"
alias rupd="ssh dev.yogurt.devspace -t 'bundle install && yarn install'"

#
eval "$(rbenv init - zsh)"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
