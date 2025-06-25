[[ ! -f ~/.profile ]] || source ~/.profile

export TERM="xterm-256color" # This sets up colors properly
export SHELL=/usr/bin/zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export ZSH_COMPDUMP=$HOME/.oh-my.zsh/cache/.zcompdump-$HOST     # File for speeding up initialisation
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--highlight-line --info=inline-right --ansi --layout=reverse --border=none"
export FZF_CTRL_T_OPTS="--preview='less {}' --height=100% --bind shift-up:preview-page-up,shift-down:preview-page-down"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='awesome-fontconfig'
#ZSH_THEME="dracula"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Custom Variables
EDITOR=vim

# History vars:
setopt APPEND_HISTORY INC_APPEND_HISTORY
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.histfile

setopt appendhistory autocd beep extendedglob notify interactive_comments
unsetopt NOMATCH

autoload -U colors && colors

DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
COMPLETION_WAITING_DOTS=true
DISABLE_UNTRACKED_FILES_DIRTY=true

plugins=(git sudo autojump fzf-zsh-plugin fzf-tab zsh-autosuggestions zsh-syntax-highlighting)
#zsh-syntax-highlighting must be last plugin

# Use modern completion system. Other than enabling globdots for showing
# hidden files, these ares values in the default generated zsh config.
autoload -U compinit
compinit
_comp_options+=(globdots)

# Ensure colors match by using FZF_DEFAULT_OPTS.
zstyle ":fzf-tab:*" use-fzf-default-opts yes
# Preview file contents when tab completing directories.
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color=always \${realpath}"

source $ZSH/oh-my-zsh.sh
# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f "$HOME/.bash.command-not-found" ] && source "$HOME/.bash.command-not-found"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/xps/.local/bin/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/xps/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
#

