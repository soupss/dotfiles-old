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
    Plug 'jnurmine/Zenburn'
    Plug 'morhetz/gruvbox'
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
set signcolumn=no
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic comment when moving to a new line
let &t_Co=256
set guifont=iosevka_fixed_medium_extended:h11
set guioptions=

" colors
colorscheme zenburn
set background=dark
let g:dracula_colorterm = 0
colorscheme dracula
set background=dark
set termguicolors

" Custom colors
hi MyGreen guibg='#50fa7b' guifg='#282a36'
hi MyCyan guibg='#8be9fd' guifg='#282a36'
hi MyPurple guibg='#bd93f9' guifg='#282a36'
hi MyPink guibg='#ff79c6' guifg='#222222'
hi MyRed guibg='#ff5555' guifg='#282a36'
hi MyOrange guibg='#ffb86c' guifg='#282a36'
hi MyComment guibg='#6272a4' guifg='#222222'
hi MyYellow guibg='#f1fa8c' guifg='#222222'

" Statusline
set statusline=
set statusline+=%#MyPink# " transparent color
set statusline+=\ %t\   " filename
set statusline+=%#MyCyan# " transparent color
set statusline+=\ %y\  " filetype
set statusline+=%#CursorLineNr# " transparent color
set statusline+=%= "Right side settings
set statusline+=%#MyYellow# " transparent color
set statusline+=\ line\ %l\ 
set statusline+=%#MyPurple# " transparent color
set statusline+=\ of\ %L\ 
set statusline+=%#CursorLineNr# " transparent color

" keybinds
let mapleader = ' '
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
