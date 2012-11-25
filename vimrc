colo slate
set hls
set ts=4 sw=4 sts=4
set incsearch
set shiftround
set preserveindent
set showcmd
set showmode
set hidden

set smartindent
set smarttab
set showmatch
set vb t_vb= " Silence the error bells.
set title
set nocompatible
set background=dark
set number

set ruler
set updatecount=100
set shell=bash
nore ; :

set laststatus=2
let g:Powerline_symbols='fancy'

:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " Space Silences hlsearch

syntax on
filetype plugin indent on
au BufWritePre * :%s/\s\+$//e " delete trailing spaces on exit

if has("autocmd")
	autocmd FileType ruby set omnifunc=rubycomplete#Complete
	let g:rubycomplete_buffer_loading = 1
	let g:rubycomplete_classes_in_global = 1

	autocmd FileType python set omnifunc=pythoncomplete#Complete
	let g:pythoncomplete_buffer_loading = 1
	let g:pythoncomplete_classes_in_global = 1
endif

call pathogen#infect() " plugin management
autocmd! BufRead,BufNewFile *.ino setlocal ft=arduino expandtab
autocmd! BufRead,BufNewFile *.json set ft=json
autocmd! BufRead,BufNewFile *.py setlocal ft=python expandtab
autocmd! BufRead,BufNewFile *.pig setlocal ft=pig expandtab ts=2 sw=2 sts=2
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" restore cursor position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
if &t_Co > 2 || has("gui_running")
	syntax on
endif
