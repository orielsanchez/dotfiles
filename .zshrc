export PATH=/usr/local/opt/python@3.12/bin:$PATH
export PATH=$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH
export PATH=$PATH:~/.local/bin

alias dotfiles='/usr/bin/git --git-dir=/Users/oriel/.dotfiles/ --work-tree=/Users/oriel'
alias nvimrc="nvim ~/.config/nvim/"
alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias so="source ~/.zshrc"
alias python=python3
alias kvim='NVIM_APPNAME="kvim" nvim'
alias g++='g++-13 -std=gnu++2b -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror'

[ -f "/Users/oriel/.ghcup/env" ] && source "/Users/oriel/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# opam configuration
[[ ! -r /Users/oriel/.opam/opam-init/init.zsh ]] || source /Users/oriel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
