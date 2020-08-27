call plug#begin('~\vimfiles\plugged')
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-markdown'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'nvie/vim-flake8'
    Plug 'rrethy/vim-illuminate'
    Plug 'junegunn/goyo.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'morhetz/gruvbox'
    Plug 'airblade/vim-gitgutter'
call plug#end()

" General settings
set encoding=utf8
syntax enable
set hidden
set showmode showcmd
set number relativenumber
filetype plugin on
set ruler
set autoread
set autoindent
set nowrap
set linebreak
set softtabstop=4
set shiftwidth=4
set wildmenu
set wildmode=longest,full
set path+=**
set ignorecase
set smartcase
set incsearch
set lazyredraw
filetype indent on
set splitbelow splitright
set showmatch
set noeb vb t_vb=
set tm=500
set matchpairs+=<:>
set scrolloff=5
set backspace=indent,eol,start
set showbreak=\\ "
set lcs+=trail:-,extends:>,precedes:<,nbsp:~,eol:\ ,tab:\ \ 
set list
set cursorline
set nobackup
set nowritebackup
set noswapfile
set signcolumn=yes
set updatetime=100
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment when moving to a new line

" colors
set t_Co=256
let g:gruvbox_contrast_dark = "soft"
set background=dark
colorscheme gruvbox

"custom
function Highlights()
    hi! link SignColumn LineNr
    hi link GitGutterAdd GruvBoxAqua
    hi link GitGutterChange GruvBoxYellow
    hi link GitGutterDelete GruvBoxRed
    hi StatusLine cterm=NONE ctermfg=NONE ctermbg=NONE
    hi StatusLineNC cterm=NONE ctermfg=NONE ctermbg=NONE
endfunction
call Highlights()
let g:gitgutter_sign_removed = '-'

" Statusline
" clear statusline highlight, still visible between splits
" custom
set laststatus=2
set statusline=
set statusline+=%#GruvboxRed#
set statusline+=\ %M  " modified flag
set statusline+=%#GruvboxGreen#
set statusline+=%t  " filename
set statusline+=%#GruvboxBlue#
set statusline+=\ %y\   " filetype
set statusline+=%#LineNr# " bar color
set statusline+=%= "Right side settings
set statusline+=%#GruvboxPurple#

set statusline+=\ line\ %l
set statusline+=%#GruvboxAqua#
set statusline+=\ of\ %L\ 

" only show cursorline on current split
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" keybinds
let mapleader = ' '
nnoremap <F4> :so $MYVIMRC<cr>
nnoremap Y y$  " why is this not default
" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
" resize splits
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>
nnoremap <leader>s :set hlsearch! hlsearch?<cr> " toggle search highlighting
nnoremap <leader>w :b#<cr>  " go to last buffer
" clear the screen then run the current python file
au filetype python nnoremap <buffer> <F5> :w<cr>:!cls<cr>:exec '!python3 %'<cr>
" clear the screen then run the parent python module (__main__ file in this dir)
au filetype python nnoremap <buffer> <F6> :w<cr>:!cls<cr>:exec '!python3 .'<cr>
nnoremap <silent> <leader>o :Files<cr>
nnoremap <silent> <leader>g :Goyo<cr>
vnoremap <ESC> <C-c> " prevent visual mode exit lag

" goyo settings
let g:goyo_width='50%'
let g:goyo_height='80%'
function! s:goyo_enter()
    set scrolloff=999
    set noshowcmd
endfunction
if !exists('*s:goyo_leave')
    function! s:goyo_leave()
	set scrolloff=5
	set showcmd
	" why doesnt this work
	call! Highlights()
    endfunction
endif
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
