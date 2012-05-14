set hlsearch
set autoindent
set tabstop=2 shiftwidth=2 softtabstop=2
set incsearch
set expandtab
set shiftround
set preserveindent

set nocompatible
set background=dark
set number
set ruler
set smarttab
set updatecount=100
set shell=bash
set noerrorbells
nore ; :

"set completeopt=menu,longest,preview
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " Space Silences hlsearch
colo inkpot 

syntax on
filetype on
filetype plugin on
filetype indent on
compiler ruby

call pathogen#infect() " plugin management
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

