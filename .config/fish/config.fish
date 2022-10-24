if status --is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'

# Git shortcuts
alias g='git'
alias gco='git checkout'
alias gsta='git stash'
alias gdiff='git diff'

# Dotcom helpers
alias aaq='AUTOCORRECT_ALLOWED_QUERIES=1'

# Set terminal when SSH-ing into codespace
alias csssh='TERM=xterm-256color gh cs ssh'

set -x VIMINIT 'source $HOME/.config/vim/.vimrc'

if test -n "$CODESPACES"
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  alias preview="echo https://$CODESPACE_NAME-80.githubpreview.dev"
end

source /usr/local/opt/asdf/libexec/asdf.fish
