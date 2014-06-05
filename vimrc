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
Plugin 'JuliaLang/julia-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'aerosol/vim-erlang-skeletons'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fishcakez/vim-dialyzer'
Plugin 'fishcakez/vim-rebar'
Plugin 'honza/vim-snippets'
Plugin 'jnwhiteh/vim-golang'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'

call vundle#end()
filetype plugin indent on
" #############################################################################

" Personal Settings
set hls incsearch
set showcmd showmode
set hidden
set expandtab
set ts=4 sw=4 sts=4
set title
set number

set smartindent smarttab showmatch
set ruler
set updatecount=100
set shell=bash
nore ; :
set laststatus=2
let g:Powerline_symbols='fancy'

" Stop it from yelling at you
set vb t_vb=
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
let g:UltiSnipsExpandTrigger="<CR>"
