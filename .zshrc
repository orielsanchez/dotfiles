# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize
export PATH=/opt/homebrew/anaconda3/bin:$PATH
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH=$PATH:~/.local/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias dotfiles='/usr/bin/git --git-dir=/Users/oriel/.dotfiles/ --work-tree=/Users/oriel'
alias nvimrc="nvim ~/.config/nvim/lua/oriel/"
alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"

[ -f "/Users/oriel/.ghcup/env" ] && source "/Users/oriel/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# opam configuration
[[ ! -r /Users/oriel/.opam/opam-init/init.zsh ]] || source /Users/oriel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
