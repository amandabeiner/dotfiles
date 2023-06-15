call plug#begin('~/.config/vim/bundles')
 Plug 'dense-analysis/ale' " Linting
 Plug 'morhetz/gruvbox' " Color scheme
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim' " Better search
 Plug 'roman/golden-ratio' " Resizes windows
 Plug 'scrooloose/nerdtree' " File tree
 Plug 'tpope/vim-fugitive' " Git plugin
 Plug 'tpope/vim-commentary' " Commenting and such
 Plug 'tpope/vim-surround' " Surround pairs
 Plug 'ojroques/vim-oscyank' " Yank to system clipboard
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'tpope/vim-endwise' " End Ruby methods
call plug#end()

syntax on

set title

" General
set noswapfile
let mapleader = ","
set termguicolors
set bg=dark
colorscheme gruvbox
let &t_ut='' " Draw background correctly when using tmux

" Search settings
set hlsearch " highlight search results
set incsearch " start search before pressing enter
set ignorecase " make searches case insensitive
" clear highlights
nnoremap <leader><Space> :nohl<CR>

" Indentation
set smartindent
set autoindent " open lines at same indentation
set expandtab " turn tabs into tabstop spaces
set tabstop=2 " 1 tab = 2 spaces
set shiftwidth=2 " set level of indentiation
set softtabstop=2

" Line settings
set number
set relativenumber
set textwidth=118
set colorcolumn=+1
set ruler
set wildmenu
set cursorline
set backspace=indent,eol,start

" Whitespace
" Support the characters that denote extra whitespace
scriptencoding utf-8
set encoding=utf-8
set list listchars=tab:»·,trail:·
autocmd BufWritePre * :%s/\s\+$//e

" FZF search
nnoremap <silent> <leader>f :GFiles<Cr>
nnoremap <silent> <leader>s :Rg<Cr>

filetype on         "enable filetype detection
filetype plugin on  "enable filetype-specific plugins
filetype plugin indent on " fix indenting of # comments

" NERDTree settings
let NERDTreeShowHidden=1 "show hidden files in tree
map <C-N> <esc>:NERDTreeToggle<CR>

" Use Ctrl-C for copying to system buffer
if has("clipboard")
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <ESC>"+pa
endif

" Allow copying over ssh
if !empty($CODESPACES)
  vmap <C-c> :OSCYank<CR>
endif

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Ale
let g:ale_linters = {
         \ 'ruby': ['rubocop'],
         \ 'javascript': ['prettier'],
         \ 'typescript': ['prettier'],
         \ 'typescriptreact': ['prettier'],
         \ }
let g:ale_fixers = {
        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'ruby': ['rubocop'],
        \ 'javascript': ['prettier'],
        \ 'typescript': ['prettier'],
        \ 'typescriptreact': ['prettier'],
        \ }

let g:ale_fix_on_save = 1
