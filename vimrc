" My vimrc file, hopefully now a little cleaner
" -@athuras

" Plugins #####################################################################
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Required
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'

" Utility
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'rizzatti/dash.vim'

" Syntax, Completion, and Snippets
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'craigemery/vim-autotag'

" Git and Version Control
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter' " Slow for large repos, use at own risk.

" Erlang/OTP, Elixir
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'elixir-lang/vim-elixir'
Plugin 'aerosol/vim-erlang-skeletons'
Plugin 'fishcakez/vim-dialyzer'
Plugin 'fishcakez/vim-rebar'

" Haskell
Plugin 'Shougo/vimproc.vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'dag/vim2hs'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Twinside/vim-hoogle'

" Scala
Plugin 'derekwyatt/vim-scala'
Plugin 'spiroid/vim-ultisnip-scala'

" Misc Language Support
Plugin 'rust-lang/rust.vim'
Plugin 'solarnz/thrift.vim'
Plugin 'JuliaLang/julia-vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kevints/vim-aurora-syntax'
Plugin 'lambdatoast/elm.vim'
Plugin 'mustache/vim-mustache-handlebars'

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

" Don't redraw while executing macros
set lazyredraw

" regext magic
set magic

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

if has("gui_running")
  set background=light
else
  set background=dark
endif

colorscheme solarized
hi clear SignColumn " fix gitgutter signs

set gfn=Monospace\ 12


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
nnoremap <leader>b<space> :CtrlPBuffer<cr>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-dash
:nmap <silent> <leader>d <Plug>DashSearch
:nmap <silent> <leader>D <Plug>DashGlobalSearch

" Pretty unicode haskell symbols
let g:haskell_conceal_wide = 1
let g:haskell_conceal_enumerations = 1

" Spell Checking (of great importance!)
map <leader>ss :setlocal spell!<cr>

" Haskell Specific Tag Bar
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Show Haskell Types in tag completion
let g:necoghc_enable_detailed_browse = 1

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<cr>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<cr>
" GHC errors and warnings
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<cr>

" Haskell Linting
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }
nmap <silent> <leader>hl :SyntasticCheck hlint<cr>
