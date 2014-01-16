" Buffer-reload of document on write
autocmd! bufwritepost .vimrc source %

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
set number
colo slate " just in case

syntax on
syntax enable
set background=dark
colorscheme solarized

set mouse=a " on OSX press ALT + Click
" Numpad
if &term=="xterm" || &term=="xterm-color"
     set t_Co=8
     set t_Sb=^[4%dm
     set t_Sf=^[3%dm
     :imap <Esc>Oq 1
     :imap <Esc>Or 2
     :imap <Esc>Os 3
     :imap <Esc>Ot 4
     :imap <Esc>Ou 5
     :imap <Esc>Ov 6
     :imap <Esc>Ow 7
     :imap <Esc>Ox 8
     :imap <Esc>Oy 9
     :imap <Esc>Op 0
     :imap <Esc>On .
     :imap <Esc>OQ /
     :imap <Esc>OR *
     :imap <Esc>Ol +
     :imap <Esc>OS -
endif

" Multiple indentation of code blocks
vnoremap < <gv
vnoremap > >gv

set ruler
set updatecount=100
set shell=bash
nore ; :

set laststatus=2
let g:Powerline_symbols='fancy'

:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> " Space Silences hlsearch

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
autocmd! BufRead,BufNewFile *.erl setlocal ft=erlang expandtab
autocmd! BufRead,BufNewFile *.pig setlocal ft=pig expandtab ts=2 sw=2 sts=2
autocmd! BufRead,BufNewFile *.hs setlocal ft=haskell expandtab ts=4 sw=4 sts=4
au BufRead,BufNewFile *.go setlocal ft=go expandtab ts=4 sw=4 sts=4

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
