# If the 3 lines below cause error, try: 'ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh'
# https://github.com/gnunn1/tilix/wiki/VTE-Configuration-Issue
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
export TERM="xterm-256color" # This sets up colors properly

export ZSH="/home/patel/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
ZSH_THEME="powerlevel10k/powerlevel10k"
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
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

setopt appendhistory autocd beep extendedglob notify 
unsetopt NOMATCH

DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
COMPLETION_WAITING_DOTS=true
DISABLE_UNTRACKED_FILES_DIRTY=true

plugins=(zsh-autosuggestions git autojump zsh-syntax-highlighting) #zsh-syntax-highlighting must be last plugin
source $ZSH/oh-my-zsh.sh
# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

CONDA_PATH=$HOME/miniconda3/
__conda_setup="$("$CONDA_PATH""bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_PATH""etc/profile.d/conda.sh" ]; then
        . "$CONDA_PATH""/home/patel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_PATH""bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

