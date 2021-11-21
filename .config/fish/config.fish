if status --is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
set -x VIMINIT 'source $HOME/.config/vim/.vimrc'

# Git shortcuts
alias g='git'
alias gco='git checkout'
alias gsta='git stash'
alias gdiff='git diff'

source /usr/local/opt/asdf/libexec/asdf.fish
