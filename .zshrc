export PATH=/usr/local/opt/python@3.12/bin:$PATH
export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH
export PATH=$PATH:~/.local/bin

function zle-keymap-select {
    if [[ $KEYMAP == vicmd ]] || [[ $1 == 'block' ]]; then
        # Prompt for NORMAL mode
        echo -ne "\e[1 q"
        PS1="[NORMAL] $PS1_ORIGINAL"
    elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $1 == 'beam' ]]; then
        # Prompt for INSERT mode
        echo -ne "\e[5 q"
        PS1="[INSERT] $PS1_ORIGINAL"
    fi
}
zle -N zle-keymap-select
# use vi key bindings
bindkey -v
# avoid the annoying backspace/delete issue 
# where backspace stops deleting characters
bindkey -v '^?' backward-delete-char
bindkey -M viins 'kj' vi-cmd-mode

# Save original PS1
PS1_ORIGINAL="$PS1"

zle-keymap-select

alias dotfiles='/usr/bin/git --git-dir=/Users/oriel/.dotfiles/ --work-tree=/Users/oriel'
alias nvimrc="nvim ~/.config/nvim/lua/oriel/"
alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias so="source ~/.zshrc"
alias python=python3

[ -f "/Users/oriel/.ghcup/env" ] && source "/Users/oriel/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# opam configuration
[[ ! -r /Users/oriel/.opam/opam-init/init.zsh ]] || source /Users/oriel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
