#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

function fancy_echo() {
        local fmt="$1"; shift

        printf "\\n$fmt\\n" "$@"
}


function install_starship() {
       	fancy_echo "Installing starship"
        curl -o starship-install.sh -fsSL https://starship.rs/install.sh
    sudo bash starship-install.sh -y
}

function copy_dotfiles() {
        fancy_echo "Installing dotfiles"
        mkdir -p $HOME/.config

        ln -sf $(pwd -P)/.config/fish $HOME/.config/fish
        ln -sf $(pwd -P)/.config/vim $HOME/.config/vim
        ln -sf $(pwd -P)/.config/kitty $HOME/.config/kitty
        ln -sf $(pwd -P)/.config/tmux $HOME/.config/tmux
        ln -sf $(pwd -P)/.config/starship.toml $HOME/.config/starship.toml
        ln -sf $(pwd -P)/.config/Brewfile $HOME/.config/Brewfile
}

function change_shell() {
        fancy_echo "Switching to fish shell"
        sudo chsh -s $(which fish) $(whoami)
}

function install_vim_plugins() {
        fancy_echo "Installing vim plugins"
        vim -Es -u $HOME/.config/vim/.vimrc -c "PlugInstall | qa"

        # curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        #     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        # vim +'PlugInstall --sync' +qa
}


if [ "$CODESPACES" == "true" ]; then
        fancy_echo "In codespaces!"
        install_starship
        copy_dotfiles
        change_shell
        install_vim_plugins

        git config --global core.editor "vim"

        fancy_echo "All done"
fi
