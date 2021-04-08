# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export TERM="xterm-256color"
export LS_COLORS='di=32:ln=36:so=35:pi=33:ex=31:bd=0:cd=0:su=31;47:sg=31;47:tw=32;47:ow=32;47'

########################################################################
# zsh configurations
########################################################################

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_DISABLE_COMPFIX=true

DISABLE_AUTO_TITLE="true"
CASE_SENSITIVE="true"
HISTSIZE=1000
SAVEHIST=1000

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

plugins=(
  git
  iterm2
  zsh-completions
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
  fzf
  node
  npm
  docker
  kubectl
  zsh-nvm
  yarn
)

########################################################################
# Powerlevel9k theme
########################################################################

P9K_MODE='nerdfont-complete'
P9K_PROMPT_ADD_NEWLINE=true
P9K_LEFT_PROMPT_ELEMENTS=(status vcs dir)
P9K_PROMPT_ON_NEWLINE=true
P9K_DISABLE_RPROMPT=true

P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON=""
#P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON="%F{blue}"$'\uF054 '"%F{white}"
P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON=$'\U0001F6A3 '

# DIR

P9K_DIR_HOME_ICON=''
P9K_DIR_HOME_BACKGROUND='236'
P9K_DIR_HOME_FOREGROUND='white'
P9K_DIR_HOME_SUBFOLDER_ICON=''
P9K_DIR_HOME_SUBFOLDER_BACKGROUND='236'
P9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
P9K_DIR_DEFAULT_ICON=''
P9K_DIR_DEFAULT_BACKGROUND='236'
P9K_DIR_DEFAULT_FOREGROUND='white'

# VCS

P9K_VCS_GIT_ICON=''
P9K_VCS_GIT_GITHUB_ICON=''
P9K_VCS_CLEAN_BACKGROUND='022'
P9K_VCS_UNTRACKED_BACKGROUND='130'
P9K_VCS_MODIFIED_BACKGROUND='130'
P9K_VCS_CLEAN_FOREGROUND='white'
P9K_VCS_UNTRACKED_FOREGROUND='white'
P9K_VCS_MODIFIED_FOREGROUND='white'
P9K_VCS_SHOW_CHANGESET='true'

P9K_STATUS_OK='false'
P9K_STATUS_CROSS='true'

# ETC(plugins)

ZLE_RPROMPT_INDENT=0
#P9K_CURSOR_SHAPE="true"
#P9K_CURSOR_NOBLINK="true"

# for vi-mode
function zle-keymap-select zle-line-init {
  # change cursor shape in iTerm2
  case $KEYMAP in
    vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
    viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
  esac

  zle reset-prompt
  zle -R
}

function zle-line-finish {
  print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

source $ZSH/oh-my-zsh.sh


########################################################################
# sources
########################################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/workspace/dotfiles-work/.bash_profile" ]] && source "$HOME/workspace/dotfiles-work/.bash_profile"

# PATH
#PATH=“/Library/TeX/texbin/:$PATH”
PATH="/usr/local/bin:$PATH"
PATH="/Users/yeongjun/workspace/dotfiles/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/user/Applications_other/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/user/Applications_other/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/user/Applications_other/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/user/Applications_other/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/libpq/bin:$PATH"

PATH="/usr/local/opt/gettext/bin:$PATH"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(jenv init -)"

