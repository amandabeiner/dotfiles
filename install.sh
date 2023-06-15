#!/bin/bash
exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

#Symlink dotfiles
echo "Symlinking dotfiles"
ln -sf $(pwd -P)/.config/.* $HOME/

# Install Plug and plugins
echo "Installing plugins"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -es -u ~/.vimrc +PlugInstall +qa

# Install ctags
echo "Installing ctags"
ctags -R --exclude=.git--exclude=vendor --exclude=node_modules --exclude=db --exclude=log .

# Install brew dependencies
echo "Installing brew dependencies"
brew bundle --file $HOME/Brewfile

# Changing to fish shell
sudo chsh -s $(which fish) $(whoami)

git config --global core.editor "vim"


# exec > >(tee -i $HOME/dotfiles_install.log)
# exec 2>&1
# set -x

# function fancy_echo() {
#         local fmt="$1"; shift

#         printf "\\n$fmt\\n" "$@"
# }


# function copy_dotfiles() {
#         fancy_echo "Installing dotfiles"

# }

# function change_shell() {
#         fancy_echo "Switching to fish shell"
#         sudo chsh -s $(which fish) $(whoami)
# }

# function install_vim_plugins() {
#         fancy_echo "Installing vim plugins"
#         curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#         vim -es -u ~/.vimrc +PlugInstall +qa
# }

# function brew_bundle() {
#   fancy_echo "Installing brew dependencies"
#   brew bundle --file $HOME/Brewfile
# }

# if [ "$CODESPACES" == "true" ]; then
#         fancy_echo "In codespaces!"
#         copy_dotfiles
#         brew_bundle
#         install_vim_plugins
#         change_shell

#         git config --global core.editor "vim"

#         fancy_echo "All done"
# fi
