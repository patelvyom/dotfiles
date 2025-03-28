# If the 3 lines below cause error, try: 'ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh'
# https://github.com/gnunn1/tilix/wiki/VTE-Configuration-Issue
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
export TERM="xterm-256color" # This sets up colors properly
export SHELL=/usr/bin/zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export ZSH_COMPDUMP=$HOME/.oh-my.zsh/cache/.zcompdump-$HOST     # File for speeding up initialisation
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
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

setopt appendhistory autocd beep extendedglob notify 
unsetopt NOMATCH

DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
COMPLETION_WAITING_DOTS=true
DISABLE_UNTRACKED_FILES_DIRTY=true

plugins=(zsh-autosuggestions git autojump fzf-zsh-plugin zsh-syntax-highlighting sudo) #zsh-syntax-highlighting must be last plugin
source $ZSH/oh-my-zsh.sh
# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f "$HOME/.bash.command-not-found" ] && source "$HOME/.bash.command-not-found"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
unalias gap
# >>> conda initialize >>>
#export PATH="$HOME/miniconda3/bin:$PATH"
[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ] && source "$HOME/miniconda3/etc/profile.d/conda.sh"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/patel/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/patel/micromambda';
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

path=('/home/patel/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
#

