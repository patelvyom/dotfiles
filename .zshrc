export TERM="xterm-256color" # This sets up colors properly

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
ZSH_THEME="powerlevel10k/powerlevel10k"

# Custom Variables
EDITOR=vim

# History vars:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/patel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/powerlevel10k/powerlevel10k.zsh-theme

DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
COMPLETION_WAITING_DOTS=true
DISABLE_UNTRACKED_FILES_DIRTY=true


plugins=(zsh-autosuggestions git autojump zsh-syntax-highlighting )

# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
