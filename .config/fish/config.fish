if status --is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
set -x VIMINIT 'source $HOME/.config/vim/.vimrc'
