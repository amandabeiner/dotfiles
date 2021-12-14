#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

function fancy_echo() {
        local fmt="$1"; shift

        printf "\\n$fmt\\n" "$@"
}


function apt_get_packages() {
       	fancy_echo "Installing apt-get packages"
        apt-get -y purge --auto-remove nodejs
        apt-get -y install fish fzf ripgrep git nodejs npm kitty
}

function install_starship() {
        fancy_echo "Installing Starship"
        curl -o starship-install.sh -fsSL https://starship.rs/install.sh
        bash starship-install.sh -y
}

function copy_dotfiles() {
        fancy_echo "Installing dotfiles"
        mkdir -p $HOME/.config

        ln -sf $(pwd -P)/.config/fish $HOME/.config/fish
        ln -sf $(pwd -P)/.config/vim $HOME/.config/vim
        ln -sf $(pwd -P)/.config/kitty $HOME/.config/kitty
        ln -sf $(pwd -P)/.config/starship.toml $HOME/.config/starship.toml
}

function change_shell() {
        fancy_echo "Switching to fish shell"
        chsh -s $(which fish)
}

function install_vim_plugins() {
        fancy_echo "Installing vim plugins"

        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        vim +'PlugInstall --sync' +qa
        # +PlugInstall +PlugClean! +qa
}


if [ "$CODESPACES" == "true" ]; then
        fancy_echo "In codespaces!"
        apt_get_packages
        install_starship
        copy_dotfiles
        change_shell
        install_vim_plugins

        fancy_echo "All done"
fi

