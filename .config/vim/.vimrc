set relativenumber
syntax on

set title
let&titlestring='%t - vim'

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
 Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}
 Plug 'dhruvasagar/vim-zoom'
call plug#end()

" FZF search 
nnoremap <silent> <leader>f :GFiles<Cr>
nnoremap <silent> <leader>s :Rg<Cr>

" Color scheme
set termguicolors
set bg=dark
colorscheme gruvbox
let &t_ut=''
highlight Normal ctermbg=NONE
