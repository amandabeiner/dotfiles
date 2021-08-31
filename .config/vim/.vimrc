set relativenumber
syntax on

set tabstop=2
set softtabstop=2
set autoindent
set expandtab
set textwidth=80
set colorcolumn=+1
set noswapfile

:let mapleader = ","

" Install Vim Plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

" Plugins
call plug#begin('~/.vim/bundles')
 Plug 'morhetz/gruvbox'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
call plug#end()

" FZF search 
nnoremap <silent> <leader>f :GFiles<Cr>
nnoremap <silent> <leader>s :Rg<Cr>

" Color scheme
colorscheme gruvbox
set bg=dark

