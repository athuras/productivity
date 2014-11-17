" My vimrc file, hopefully now a little cleaner
" -@athuras

" Plugins #####################################################################
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle' " Required

" Various Plugins
Plugin 'derekwyatt/vim-scala'
Plugin 'majutsushi/tagbar'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'solarnz/thrift.vim'
Bundle 'spiroid/vim-ultisnip-scala'
Plugin 'JuliaLang/julia-vim'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'aerosol/vim-erlang-skeletons'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'craigemery/vim-autotag'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fishcakez/vim-dialyzer'
Plugin 'fishcakez/vim-rebar'
Plugin 'honza/vim-snippets'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kevints/vim-aurora-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'rizzatti/dash.vim'

call vundle#end()
filetype plugin indent on
" #############################################################################

" Personal Settings
set hls incsearch
set showcmd showmode
set hidden
set expandtab
set ts=2 sw=2 sts=2
set title
set number

set smartindent smarttab showmatch
set ruler
set updatecount=100
set shell=bash
nore ; :
set laststatus=2
set encoding=utf-8
set clipboard=unnamed

let mapleader=","

" Stop it from yelling at you
set vb t_vb=
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Tagbar / NERDTree toggles
nmap <F6> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>

" Tab short-commands
cmap :tn :tabn
cmap :tp :tabp

" Delete trailing spaces on exit
au BufWritePre * :%s/\s\+$//e

" Restore Cursor Position on file-open
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
if &t_Co > 2 || has("gui_running")
	syntax on
endif

" Aesthetic
syntax on
set background=dark
colorscheme solarized
hi clear SignColumn " fix gitgutter signs


" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Numpad and clicking
set mouse=a " on OSX press ALT + Click
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

" Resolve YCM and UltiSnips use of <tab>
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsExpandTrigger="<C-F>"

" Tagbar options
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Keeping ctags sane: looks for tags file in current dir, then up levels until
" it reaches $HOME
" remember: C-W C-] will open in new split (stops from jumping all over proj

set tags=./tags,tags;$HOME

" CtrlP settings see:
" http://stackoverflow.com/questions/21888869/how-to-make-ctrlps-search-directory-change-according-to-nerdtrees-root
let g:ctrlp_root_markers = ['ctrlp_STOP']
let g:NERDTreeChDirMode = 2
let g:ctrlp_working_path_mode = 'rw'

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-scala
let g:scala_first_party_namespaces='twitter'

" vim-dash
:nmap <silent> <leader>d <Plug>DashSearch
:nmap <silent> <leader>D <Plug>DashGlobalSearch
