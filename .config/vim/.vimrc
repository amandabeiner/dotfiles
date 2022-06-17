et title
let&titlestring='%t - vim'

set number
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set textwidth=118
set colorcolumn=+1
set noswapfile
set backspace=indent,eol,start
set term=xterm-256color

:let mapleader = ","


" Handle extra whitespace
set list listchars=tab:»·,trail:·
autocmd BufWritePre * :%s/\s\+$//e

"Install Vim Plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

" Plugins
let data_dir = '~/.config/vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.config/vim/.vimrc
endif

call plug#begin('~/.config/vim/bundles')
 " General
 Plug 'morhetz/gruvbox'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'ojroques/vim-oscyank'
 Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}
 Plug 'christoomey/vim-tmux-navigator'

 " Language Agnostic
 Plug 'jiangmiao/auto-pairs'
 Plug 'tpope/vim-commentary'
 Plug 'dense-analysis/ale'
 Plug 'tpope/vim-surround'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'SirVer/ultisnips'

 " Ruby
 Plug 'tpope/vim-endwise'

 " " JavaScript
 " Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

" FZF search
nnoremap <silent> <leader>f :GFiles<Cr>
nnoremap <silent> <leader>s :Rg<Cr>

"  Allow me to use Ctrl-C for copying to system buffer
if has("clipboard")
  " copy and paste
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <ESC>"+pa
endif

if !empty($CODESPACES)
  " copy over ssh
  vmap <C-c> :OSCYank<CR>
endif

" Color scheme
set termguicolors
set bg=dark
colorscheme gruvbox
let &t_ut=''
highlight Normal ctermbg=NONE

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
" let g:ale_javascript_prettier_use_local_config = 1

" CoC Settings
let g:coc_global_extensions = [
        \ 'coc-solargraph',
        \ ]

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
syntax on
